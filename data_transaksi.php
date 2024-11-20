<?php
//session_start();
if (!isset($_SESSION['apriori_id'])) {
    header("location:index.php");
}

$tanggalSekarang = date('Y-m-d');
include_once "database.php";
include_once "fungsi.php";
include_once "import/excel_reader2.php";


if ($_SESSION['apriori_level'] == "1") {
    $import = ' 
                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#modalupload">
                <i class="fa fa-plus"></i> Upload Data
                </button>';
    $deleteAll = '<button name="delete" type="submit" class="btn btn-app btn-danger btn-sm" onClick=\'return confirm("Apakah anda yakin ingin menghapus semua data transaksi?")\'><i class="fas fa-fw fa-trash"></i> Delete All Data</button>';
} else {
    $import ='';
    $deleteAll = '';
}
?>


<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800"><i class="fas fa-fw fa-money-bill-wave"></i> Data Transaksi</h1>

    <!-- memanggil button import excel -->
    <div class="text-right">
        <?php echo $import; ?>
    </div>
</div>


<?php
$db_object = new database();

$pesan_error = $pesan_success = "";
if (isset($_GET['pesan_error'])) {
    $pesan_error = $_GET['pesan_error'];
}
if (isset($_GET['pesan_success'])) {
    $pesan_success = $_GET['pesan_success'];
}

if (isset($_POST['submit'])) {
    $fileType = pathinfo($_FILES['file_data_transaksi']['name'], PATHINFO_EXTENSION);
    
    if ($fileType !== 'xls') {
        echo "<script>alert('File yang diunggah harus bertipe .xls');</script>";
    } else {
        
    $data = new Spreadsheet_Excel_Reader($_FILES['file_data_transaksi']['tmp_name']);

    $baris = $data->rowcount($sheet_index = 0);
    $column = $data->colcount($sheet_index = 0);

    for ($i = 2; $i <= $baris; $i++) {
        for ($c = 1; $c <= $column; $c++) {
            $value[$c] = $data->val($i, $c);
        }

        $table = "transaksi";
        // $produkIn = get_produk_to_in($temp_produk);
        $temp_date = format_date($value[1]);
        $produkIn = $value[2];

        //mencegah ada jarak spasi
        //preprocesiing penghapusan jarak spasi
        $produkIn = str_replace(" ,", ",", $produkIn);
        $produkIn = str_replace("  ,", ",", $produkIn);
        $produkIn = str_replace("   ,", ",", $produkIn);
        $produkIn = str_replace("    ,", ",", $produkIn);
        $produkIn = str_replace(", ", ",", $produkIn);
        $produkIn = str_replace(",  ", ",", $produkIn);
        $produkIn = str_replace(",   ", ",", $produkIn);
        $produkIn = str_replace(",    ", ",", $produkIn);
        $sql = "INSERT INTO transaksi (tanggal_transaksi, produk) VALUES ";
        $value_in = array();
        $sql .= " ('$temp_date', '$produkIn')";
        $db_object->db_query($sql);
    }
    ?>
<script>
location.replace("?menu=data_transaksi&pesan_success=Data berhasil disimpan");
</script>
<?php
}
}

// if (isset($_POST['simpan'])) {
//     $tanggal_transaksi   = $_POST['tanggal_transaksi'];

//     // cara input data banyak ke table db dengan implode
//     $data = implode(",", $_POST['produk']);
//     $conn = mysqli_connect('localhost', 'root', '', 'skripsi');
//     // insert kedb 
//     $inputTranksaksi = mysqli_query($conn, "INSERT INTO transaksi (tanggal_transaksi,produk)
//                                                     VALUES('$tanggal_transaksi','$data') ");
//     if ($inputTranksaksi) {
//         $pesan = "<div class='alert alert-primary' role='alert'>
//                         Berhasil Input Data
//                         </div>";
//     } else {
//         $pesan = "<div class='alert alert-danger' role='alert'>
//                         Gagal Input Data!
//                         </div>";
//     }
// }

if (isset($_POST['delete'])) {
    $sql = "TRUNCATE transaksi";
    $db_object->db_query($sql);
    ?>
<script>
location.replace("?menu=data_transaksi&pesan_success=Data transaksi berhasil dihapus semua");
</script>
<?php
}

if (isset($_GET['hapus'])) {
    $id_transaksi = $_GET['hapus'];
    $sql = "DELETE FROM transaksi WHERE id_transaksi='$id_transaksi'";
    $db_object->db_query($sql);
    if ($sql) {
        echo "<script> location.replace('?menu=data_transaksi&pesan_success=Data transaksi berhasil dihapus'); </script>";
    }
}

$sql = "SELECT * FROM transaksi";
$query = $db_object->db_query($sql);
$jumlah=$db_object->db_num_rows($query);
?>

<!-- tampilan import excel -->
<div class="modal fade" id="modalupload" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
    aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <form method="post" enctype="multipart/form-data" action="">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle"><i class="fas fa-fw fa-upload"></i> </h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <div class="modal-body">
                    <span class="text-lg">Unggah Data Transaksi:</span>
                    <div class="card">
                        <input class="btn btn-info text-lg" type="file" name="file_data_transaksi" required>
                    </div>

                    </br>
                    <h5>Hanya Mendukung File Yang Bertipe : .xls !!</h5>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-warning" data-dismiss="modal"><i
                            class="fas fa-fw fa-times"></i> Keluar</button>
                    <button name="submit" type="submit" class="btn btn-success"><i class="fas fa-fw fa-upload"></i>
                        Upload</button>
                </div>
            </form>
        </div>
    </div>
</div>


<div class="card shadow mb-4">
    <!-- /.card-header -->
    <div class="card-header py-3 d-sm-flex align-items-center justify-content-between">
        <h6 class="m-0 font-weight-bold text-dark">Daftar Data Transaksi</h6>

        <form method="post" enctype="multipart/form-data" action="">
            <?php echo $deleteAll; ?>
        </form>
    </div>

    <div class="card-body">
        <?php
        echo $pesan;
        if (!empty($pesan_error)) {
            display_error($pesan_error);
        }
        if (!empty($pesan_success)) {
            display_success($pesan_success);
        }

        if($jumlah==0){
            echo "Data transkasi kosong...";
        }else{
        ?>

        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
            <thead>
                <tr align="center">
                    <th colspan="4" class="pb-0 pt-2 px-0 ">
                        <h6 class="font-weight-bold mb-1">
                            Jumlah data: <?= $jumlah ?>
                        </h6>
                    </th>
                </tr>
                <tr align="center" class="bg-gray-600 text-white">
                    <th>No</th>
                    <th>Tanggal Transaksi</th>
                    <th>Produk</th>
                    <th width="15%">Aksi</th>
                </tr>
            </thead>

            <?php
            $no = 1;
            while ($row = $db_object->db_fetch_array($query)) {
                if ($_SESSION['apriori_level'] == "1") {
                    $edit = ' <a href="?menu=edit_transaksi&id_transaksi=' . $row['id_transaksi'] . '" class="btn btn-warning btn-sm"><i class="fa fa-edit"></i></a>';
                    $hapus = '<a href="?menu=data_transaksi&hapus=' . $row['id_transaksi'] . '" class="btn btn-danger btn-sm" onclick=\'return confirm ("Apakah anda yakin untuk meghapus data ini")\' class="btn btn-danger btn-sm"><i class="fa fa-trash"></i></a>';
                } else {
                    $edit = '';
                    $hapus = '';
                }
            ?>
            <tr>
                <td class="py-1 text-center"> <?= $no ?></td>
                <td class="py-1 text-center"> <?= format_date2($row['tanggal_transaksi']) ?></td>
                <td class="py-1 text-center"> <?= $row['produk'] ?></td>
                <td class="py-1 text-center">
                    <div class='btn-group' role='group'>
                        <?php echo $edit . "" . $hapus; ?>
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

<!-- memecah item produk kedalam array -->
<?php
function get_produk_to_in($produk)
{
    $ex = explode(",", $produk);
    //$temp = "";
    for ($i = 0; $i < count($ex); $i++) {

        $jml_key = array_keys($ex, $ex[$i]);
        if (count($jml_key) > 1) {
            unset($ex[$i]);
        }

        //$temp = $ex[$i];
    }
    return implode(",", $ex);
}

?>