<?php
session_start(); // harus ada di bagian paling atas kode

// Jika sudah login, redirect ke halaman index
if (isset($_SESSION['apriori_id'])) {
    header("location:index.php");
}

$login = 0;
if (isset($_GET['login'])) {
    $login = $_GET['login'];
}

if ($login == 1) {
    $komen = "Silahkan Login Ulang, Cek username dan Password Anda!!";
}

include_once "fungsi.php";
include 'database.php';

// Proses login
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    //object database class
    $db = new database();

    $user = strip_tags(trim($_POST['username']));
    $pass = strip_tags(trim($_POST['password']));

    $sql = get_sql_login_admin_page($user, $pass);
    $result = $db->db_query($sql);
    $num_rows = $db->db_num_rows($result);

    if ($num_rows > 0) {
        $rows = $db->db_fetch_array($result);
        unset($_POST); // hapus post form
        $_SESSION['apriori_id'] = $rows['id_user']; // mengisi session
        $_SESSION['apriori_username'] = $rows['username'];
        $_SESSION['apriori_level'] = $rows['level'];

        $level_name = ($_SESSION['apriori_level'] == 1) ? "admin" : "kepala";
        $_SESSION['apriori_level_name'] = $level_name;
        header("location:index.php");
        exit();
    } else {
        header("location:login.php?login=1");
        exit();
    }
}

function get_sql_login_admin_page($user, $pass){
    $sql = "SELECT * FROM users WHERE username = '" . $user . "' AND password = MD5('" . $pass . "')";
    return $sql;
}
?>

<!DOCTYPE HTML>
<html>

<head>
    <title>Algoritma Apriori</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <!-- Custom styles for this template-->
    <link href="assets/css/sb-admin-2.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="assets/style_login.css?v=2" />
</head>

<body>
    <!-- Sidebar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-gray-900 pb-2 pt-2"
        style="position: sticky; top: 0; z-index: 1; background-color: #3b3b45;">
        <div class="container">
            <!-- Sidebar - Brand -->
            <a class="navbar-brand" href="index.php">
                <img src="assets/img/logo-rpa.png" width="50" height="50" alt="logo roemah pangan abadi" class="m-0">
                <span class="ml-1 font-weight-bold" style="font-size: 17px; font-family: Noto Sans;">ROEMAH PANGAN
                    ABADI</span>
            </a>
    </nav>

    <header class="text-center">
        <div class="container">
            <!-- Outer Row -->
            <div class="row justify-content-center">
                <div class="col-xl-5 col-lg-5 col-md-5 mt-5">
                    <div class="card o-hidden border-0 shadow-lg my-5">
                        <div class="card-body p-0">
                            <!-- Nested Row within Card Body -->
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="p-5">
                                        <div class="text-center">
                                            <h1 class="h4 text-gray-900 mb-4">Login Akun</h1>
                                        </div>
                                        <?php
                                        if (isset($komen)) {
                                            echo "<div class='alert alert-danger'>$komen</div>";
                                        }
                                        ?>
                                        <!-- <form class="user" action="login.php" method="post"> -->
                                        <form class="user" action="" method="post">
                                            <div class="mb-3 row">
                                                <div class="col-lg-12">
                                                    <input autocomplete="off" name="username" type="text"
                                                        class="form-control" id="exampleInputUser"
                                                        placeholder="Username" required>
                                                </div>
                                            </div>
                                            <div class="mb-3 row">
                                                <div class="col-lg-12">
                                                    <input type="password" name="password" class="form-control"
                                                        id="exampleInputPassword" placeholder="Password" required>
                                                </div>
                                            </div>
                                            <div class="d-grid gap-2 col-6 mx-auto">
                                                <button type="submit" class="btn btn-success ">Masuk</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </header>

    <?php include "footer.php"; ?>

    <!-- Optional JavaScript; choose one of the two! -->
    <!-- 
    <script src="assets/vendor/jquery/jquery.min.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="assets/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    -->
</body>

</html>