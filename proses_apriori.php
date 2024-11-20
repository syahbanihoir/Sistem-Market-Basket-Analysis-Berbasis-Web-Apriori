<?php

include_once "database.php";
include_once "fungsi.php";
include_once "mining.php";
include_once "display_mining.php";

// if ($_SESSION['apriori_level'] == "1") {
//     $cari = '<input name="search_display" type="submit" value="Cari" class="btn btn-primary" style="width: 100px;">';
//     $proses = '<input name="submit" type="submit" value="Proses" class="btn btn-success">';
// } else {
//     $cari ='';
//     $proses = '';
// }
?>
<div class="main-content" style="min-height: 440px;">
    <div class="main-content-inner">
        <div class="page-content">
            <div class="page-header">
                <h1 class="h3 mb-0 text-gray-800"><i class="fas fa-fw fa-sync"></i> Proses Apriori</h1>
            </div><!-- /.page-header -->
            <hr class="sidebar-divider">

            <?php
            //object database class
            $db_object = new database();

            $pesan_error = $pesan_success = "";
            if (isset($_GET['pesan_error'])) {
                $pesan_error = $_GET['pesan_error'];
            }
            if (isset($_GET['pesan_success'])) {
                $pesan_success = $_GET['pesan_success'];
            }

            if (isset($_POST['submit'])) {
                $can_process = true;
                if (empty($_POST['min_support']) || empty($_POST['min_confidence'])) {
                    $can_process = false;
            ?>
            <script>
            location.replace("?menu=proses_apriori&pesan_error=Min Support dan Min Confidence harus diisi");
            </script>
            <?php
                }
                if (!is_numeric($_POST['min_support']) || !is_numeric($_POST['min_confidence'])) {
                    $can_process = false;
                ?>
            <script>
            location.replace("?menu=proses_apriori&pesan_error=Min Support dan Min Confidence harus diisi angka");
            </script>
            <?php
                }
                //  12/11/2021 - 12/12/2021

                if ($can_process) {
                    $tgl = explode(" - ", $_POST['range_tanggal']);
                    $start = format_date($tgl[0]);
                    $end = format_date($tgl[1]);

                    if (isset($_POST['id_proses'])) {
                        $id_proses = $_POST['id_proses'];
                        //delete hitungan untuk id_proses
                        reset_hitungan($db_object, $id_proses);

                        //update log process
                        $field = array(
                            "tanggal_mulai" => $start,
                            "tanggal_akhir" => $end,
                            "min_support" => $_POST['min_support'],
                            "min_confidence" => $_POST['min_confidence']
                        );
                        $where = array(
                            "id_proses" => $id_proses
                        );
                        $query = $db_object->update_record("proses_log", $field, $where); //memanggil fungsi update_record pada database.php
                    } else {
                        //insert log process
                        $field_value = array(
                            "tanggal_mulai" => $start,
                            "tanggal_akhir" => $end,
                            "min_support" => $_POST['min_support'],
                            "min_confidence" => $_POST['min_confidence']
                        );
                        $query = $db_object->insert_record("proses_log", $field_value);
                        $id_proses = $db_object->db_insert_id();
                    }
                    //show form for update
                ?>
            <div class="row">
                <div class="col-sm-12">
                    <form method="post" action="">
                        <div class="row">
                            <div class="col-md">
                                <!-- Date range -->
                                <div class="form-group">
                                    <label>Tentukan periode tanggal transaksi untuk diproses: </label>
                                    <div class="input-group">
                                        <input type="text" class="form-control pull-right" name="range_tanggal"
                                            id="id-date-range-picker-1" required="" placeholder="Date range"
                                            value="<?php echo $_POST['range_tanggal']; ?>">
                                    </div><!-- /.input group -->
                                </div><!-- /.form group -->
                                <div class="form-group">
                                    <!-- <?php echo $cari; ?> -->
                                    <input name="search_display" type="submit" value="Cari" class="btn btn-primary"
                                        style="width: 100px;">
                                </div>
                            </div>
                            <!-- end -->
                            <div class="col-md">
                                <label>Tentukan nilai minimum Support dan minimum Confidence: </label>
                                <div class="form-group">
                                    <input name="min_support" type="text" value="<?php echo $_POST['min_support']; ?>"
                                        class="form-control" placeholder="Nilai Min Support">
                                </div>
                                <div class="form-group">
                                    <input name="min_confidence" type="text"
                                        value="<?php echo $_POST['min_confidence']; ?>" class="form-control"
                                        placeholder="Nilai Min Confidence">
                                </div>
                                <input type="hidden" name="id_proses" value="<?php echo $id_proses; ?>">
                                <div class="form-group">
                                    <!-- <?php echo $proses; ?> -->
                                    <input name="submit" type="submit" value="Proses" class="btn btn-success">
                                </div>
                            </div>
                        </div>
                    </form>


                </div>
            </div>


            <?php
            echo "Nilai Minimum Support : " . $_POST['min_support'];
            echo "<br>";
            echo "Nilai Minimum Confidence: " . $_POST['min_confidence'];
            echo "<br>";
            echo "Mulai Tanggal: " . $_POST['range_tanggal'];
            echo "<br>";

            $result = mining_process(
                $db_object,
                $_POST['min_support'],
                $_POST['min_confidence'],
                $start,
                $end,
                $id_proses
            );
            if ($result) {
                display_success("Proses mining selesai");
            } else {
                display_error("Gagal mendapatkan aturan asosiasi");
            }

                display_process_hasil_mining($db_object, $id_proses);
            }
            
            } else {
            $where = "ga gal";
            if (isset($_POST['range_tanggal'])) {
                $tgl = explode(" - ", $_POST['range_tanggal']);
                $start = format_date($tgl[0]);
                $end = format_date($tgl[1]);

                $where = " WHERE tanggal_transaksi "
                . " BETWEEN '$start' AND '$end'";
            }
            $sql = "SELECT * FROM transaksi " . $where;
            $query = $db_object->db_query($sql);
            $jumlah = $db_object->db_num_rows($query);
            ?>

            <form method="post" action="">
                <div class="row">
                    <div class="col-lg-6 ">
                        <!-- Date range -->
                        <div class="form-group">
                            <label>Tentukan periode tanggal transaksi untuk diproses: </label>
                            <div class="input-group">
                                <input type="text" class="form-control pull-right" name="range_tanggal"
                                    id="id-date-range-picker-1" required="" placeholder="Date range"
                                    value="<?php echo $_POST['range_tanggal']; ?>">
                            </div>
                        </div>
                        <div class="form-group">
                            <!-- <?php echo $cari; ?> -->
                            <input name="search_display" type="submit" value="Cari" class="btn btn-primary"
                                style="width: 100px;">
                        </div>
                    </div>

                    <div class="col-lg-6 ">
                        <label>Tentukan nilai minimum Support dan Confidence: </label>
                        <div class="form-group">
                            <input name="min_support" type="text" class="form-control" placeholder="Nilai Min Support">
                        </div>
                        <div class="form-group">
                            <input name="min_confidence" type="text" class="form-control"
                                placeholder="Nilai Min Confidence">
                        </div>
                        <div class="form-group">
                            <!-- <?php echo $proses; ?> -->
                            <input name="submit" type="submit" value="Proses" class="btn btn-success">
                        </div>
                    </div>
                </div>
            </form>

            <?php
                if (!empty($pesan_error)) {
                    display_error($pesan_error);
                }
                if (!empty($pesan_success)) {
                    display_success($pesan_success);
                }

                if ($jumlah == 0) {
                    // echo "Data kosong...";
                } else {
                ?>

            <table class='table table-bordered table-striped table-hover'>
                <tr align="center" class="bg-white">
                    <th colspan="4" class="pb-0 pt-2 px-0 ">
                        <h6 class="font-weight-bold mb-1">
                            Jumlah data: <?= $jumlah ?>
                        </h6>
                    </th>
                </tr>
                <tr class="bg-gray-600 text-white">
                    <th style="width: 80px">No</th>
                    <th style="width: 200px">Tanggal Transaksi</th>
                    <th>Produk</th>
                </tr>
                <?php
                                $no = 1;
                                while ($row = $db_object->db_fetch_array($query)) {
                                    echo "<tr>";
                                    echo "<td>" . $no . "</td>";
                                    echo "<td>" . $row['tanggal_transaksi'] . "</td>";
                                    echo "<td>" . $row['produk'] . "</td>";
                                    echo "</tr>";
                                    $no++;
                                }
                                ?>
            </table>
            <?php
                }
            }
            ?>
        </div>
    </div>
</div>