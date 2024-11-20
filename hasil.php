<?php
//session_start();
if (!isset($_SESSION['apriori_toko_id'])) {
    header("location:index.php");
    // header("location:index.php");
}

include_once "database.php";
include_once "fungsi.php";
include_once "mining.php";
?>

<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800"><i class="fas fa-fw fa-coins"></i> Histori Proses Apriori</h1>
</div>

<div class="card shadow mb-4">
    <!-- /.card-header -->
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-dark"><i class="fa fa-table"></i> Daftar Data Hasil Proses Apriori</h6>
    </div>

    <div class="card-body">


        <?php
        // object database class
        $db_object = new database();

        // untuk fitur delete
        if (isset($_GET['delete'])) {
            $id_proses = $_GET['delete'];
            $db_object->db_query("DELETE FROM proses_log WHERE id_proses = '$id_proses'");
            $db_object->db_query("DELETE FROM itemset1 WHERE id_proses = '$id_proses'");
            $db_object->db_query("DELETE FROM itemset2 WHERE id_proses = '$id_proses'");
            $db_object->db_query("DELETE FROM itemset3 WHERE id_proses = '$id_proses'");
            $db_object->db_query("DELETE FROM confidence WHERE id_proses = '$id_proses'");
            // tambah query untuk tabel itemset1, itemset2, itemset3, confidence
        }

        $pesan_error = $pesan_success = "";
        if (isset($_GET['pesan_error'])) {
            $pesan_error = $_GET['pesan_error'];
        }
        if (isset($_GET['pesan_success'])) {
            $pesan_success = $_GET['pesan_success'];
        }

        $sql = "SELECT * FROM proses_log";
        $query = $db_object->db_query($sql);
        $jumlah=$db_object->db_num_rows($query);
        ?>

        <?php
        if (!empty($pesan_error)) {
            display_error($pesan_error);
        }
        if (!empty($pesan_success)) {
            display_success($pesan_success);
        }

        if($jumlah==0){
            echo "Data Histori Proses kosong...";
        }
        else{

        ?>
        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
            <thead class="bg-gray-600  text-white">
                <tr align="center">
                    <th>No</th>
                    <th>Mulai Tanggal Transaksi</th>
                    <th>Sampai Tanggal Transaksi</th>
                    <th>Nilai Min Support</th>
                    <th>Nilai Min Confidence</th>
                    <th width="15%">Aksi</th>
                </tr>
            </thead>

            <?php
            $no = 1;
            while ($row = $db_object->db_fetch_array($query)) {
                //untuk fitur delete level 1 saja
                if ($_SESSION['apriori_level'] == "1") {
                    $delete = '<a href="?menu=hasil&delete=' . $row["id_proses"] . '" class="btn btn-danger btn-sm" 
                    onclick="return confirm(\'Apakah anda yakin untuk menghapus hasil apriori ini?\');"><i class="fa fa-trash"></i></a>';
                } else {
                    $delete = ' ';
                }
            ?>

            <tr align='center'>
                <td> <?= $no ?></td>
                <td> <?= format_date2($row['tanggal_mulai']) ?></td>
                <td> <?= format_date2($row['tanggal_akhir']) ?></td>
                <td> <?= $row['min_support'] ?></td>
                <td> <?= $row['min_confidence'] ?></td>
                <td>
                    <div class='btn-group' role='group'>
                        <a href="?menu=view_rule&id_proses=<?= $row['id_proses'] ?>" class="btn btn-success btn-sm"><i
                                class="fa fa-eye"></i></a>
                    </div>

                    <div class='btn-group' role='group'>
                        <!-- button untuk fitur delete -->
                        <!-- <a href="?menu=hasil&delete=<?= $row['id_proses'] ?>" class="btn btn-danger btn-sm"
                            onclick="return confirm('Apakah anda yakin untuk meghapus?');"><i
                                class="fa fa-trash"></i></a> -->

                        <!-- untuk memanggil fungsi level 1 button delete-->
                        <?php echo $delete; ?>
                    </div>

                    <div class='btn-group' role='group'>
                        <a href="export/CLP.php?id_proses=<?= $row['id_proses'] ?>" class="btn btn-app btn-light btn-xs"
                            target="blank">
                            <i class=" ace-icon fa fa-print bigger-160"></i>
                        </a>
                    </div>
                </td>
            </tr>

            <?php
                $no++;
            }
            ?>
        </table>
        <?php
        }
        ?>
    </div>
</div>