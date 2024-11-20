<?php
//session_start();
if (!isset($_SESSION['apriori_id'])) {
    header("location:index.php");
    // header("location:index.php");
}

include_once "database.php";
include_once "fungsi.php";
include_once "import/excel_reader2.php";

$db_object = new database();

$id_transaksi = $_GET['id_transaksi'];
$sql ="SELECT * FROM transaksi WHERE id_transaksi='$id_transaksi'";
$query=$db_object->db_query($sql);


if (isset($_POST['update'])) {
    $id_transaksi = $_POST['id_transaksi'];
    $tanggal_transaksi = $_POST['tanggal_transaksi'];
    $produk = $_POST['produk'];
    $sql = "UPDATE transaksi SET tanggal_transaksi='$tanggal_transaksi',produk='$produk' WHERE id_transaksi='$id_transaksi'";
    $db_object->db_query($sql);
    if ($sql) {
        echo "<script> location.replace('?menu=data_transaksi&pesan_success=Data berhasil diupdate'); </script>";
    } else {
        echo "<script> location.replace('?menu=data_transaksi&pesan_success=Data gagal diupdate'); </script>";
    }
}

?>


<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800"><i class="fas fa-fw fa-money-bill-wave"></i> Data Transaksi</h1>

    <a href="?menu=data_transaksi" class="btn btn-secondary"><i class="fa fa-arrow-circle-left"></i> Kembali</a>
</div>

<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-dark"><i class="fas fa-fw fa-edit"></i> Edit Data Transaksi</h6>
    </div>


    <?php
    foreach ($query as $data) {
    ?>

    <form method="post" enctype="multipart/form-data" action="">
        <div class="card-body">

            <div class="col-12">
                <label for="" class="font-weight-bold">Tanggal Transaksi</label>
                <div class="form-group">
                    <input type="hidden" name="id_transaksi" class="form-control" value="<?= $data['id_transaksi'] ?>">
                    <input type="date" name="tanggal_transaksi" value="<?= $data['tanggal_transaksi'] ?>"
                        class="form-control" required="" />
                </div>
            </div>

            <div class="col-12">
                <label for="" class="font-weight-bold">Produk Yang Dibeli</label>
                <div class="form-group">
                    <textarea class="form-control" name="produk" rows="3" required=""><?= $data['produk'] ?></textarea>
                </div>
            </div>

        </div>

        <div class="card-footer text-right">
            <button name="update" type="submit" class="btn btn-success"><i class="fa fa-save"></i> Update</button>
            <button type="reset" class="btn btn-info"><i class="fa fa-sync-alt"></i> Reset</button>
        </div>
    </form>
</div>

<?php } ?>