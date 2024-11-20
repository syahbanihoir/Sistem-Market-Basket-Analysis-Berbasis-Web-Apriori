<?php
error_reporting(0);
session_start();
$menu = '';
if (isset($_GET['menu'])) {
    $menu = $_GET['menu'];
}

if (!isset($_SESSION['apriori_id'])) {
    header("location:login.php");
}
include_once 'fungsi.php';

if ($_SESSION['apriori_level'] == "1") {
    $proses_apriori = '<a class="nav-link" href="index.php?menu=proses_apriori">
                            <i class="fas fa-fw fa-sync"></i>
                            <span>Proses Apriori</span></a>';
} else {
    $proses_apriori = '';
}
?>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Algoritma Apriori</title>

    <!-- fontawesome-free-->
    <link href="assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <!-- google font -->
    <link href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200..1000;1,200..1000&display=swap"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link rel="stylesheet" href="assets/css/sb-admin.min.css">
    <link rel=" stylesheet" href="assets/css/bootstrap-colorpicker.min.css" />
    <link rel="stylesheet" href="assets/css/bootstrap-datepicker3.min.css" />
    <link rel="stylesheet" href="assets/css/bootstrap-timepicker.min.css" />
    <link rel="stylesheet" href="assets/css/bootstrap-datetimepicker.min.css" />
    <link rel="stylesheet" href="assets/css/daterangepicker.min.css" />

    <!-- slim select -->
    <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/slim-select/1.27.0/slimselect.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/slim-select/1.27.0/slimselect.min.css" rel="stylesheet">
    <script src="https://code.iconify.design/2/2.0.3/iconify.min.js"></script> -->

</head>


<body id="page-top">

    <!-- Sidebar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-gray-900 pb-2 pt-2"
        style="position: sticky; top: 0; z-index: 1;">
        <div class="container-fluid">
            <!-- Sidebar - Brand -->
            <a class="navbar-brand" href="index.php">
                <img src="assets/img/logo-rpa.png" width="50" height="50" alt="logo roemah pangan abadi" class="m-0">
                <span class="ml-1 font-weight-bold" style="font-size: 17px; font-family: Noto Sans;">ROEMAH PANGAN
                    ABADI</span>
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <?php   
            $menu_active = '';
            if (isset($_GET['menu'])) {
                $menu_active = $_GET['menu'];
                }
            ?>
            <!-- <div class="collapse navbar-collapse " id="navbarNav"> -->
            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                <ul class="navbar-nav ">

                    <li class="nav-item <?php echo ($menu_active == '') ? "active" : ""; ?>">
                        <a class="nav-link" href="index.php">
                            <i class="fas fa-fw fa-home"></i>
                            <span>Halaman Utama</span></a>
                    </li>

                    <li class="nav-item <?php
                        echo ($menu_active == 'data_transaksi') ? "active" : "";
                        echo ($menu_active == 'edit_transaksi') ? "active" : "";
                        ?>">
                        <a class="nav-link" href="index.php?menu=data_transaksi">
                            <i class="fas fa-fw fa-money-bill-wave"></i>
                            <span>Data Transaksi</span></a>
                    </li>

                    <li class="nav-item <?php echo ($menu_active == 'proses_apriori') ? "active" : ""; ?>">
                        <!-- <a class="nav-link" href="index.php?menu=proses_apriori">
                            <i class="fas fa-fw fa-sync"></i>
                            <span>Proses apriori</span></a> -->
                        <?php echo $proses_apriori; ?>
                    </li>

                    <li class="nav-item <?php
                            echo ($menu_active == 'hasil') ? "active" : "";
                            echo ($menu_active == 'view_rule') ? "active" : "";?>">
                        <a class="nav-link" href="index.php?menu=hasil">
                            <i class="fas fa-fw fa-coins"></i>
                            <span>Histori Proses Apriori</span></a>
                    </li>

                    <div
                        class="dropdown <?php echo ($menu_active == 'profile' || $menu_active == 'about') ? "active" : ""; ?>">
                        <a class="nav-link dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown"
                            aria-haspopup="true" aria-expanded="true">
                            <img class="img-profile rounded-circle" src="assets/img/profil.png" style="width: 25px;">
                            <span>
                                <?php echo $_SESSION['apriori_username']; ?>
                            </span>
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                            <li class="nav-item ">
                                <a class="dropdown-item font-weight-bold <?php echo ($menu_active == 'profile') ? "active" : ""; ?>"
                                    href="index.php?menu=profile">Lihat Profil</a>
                                <a class="dropdown-item font-weight-bold <?php echo ($menu_active == 'about') ? "active" : ""; ?>"
                                    href="index.php?menu=about">About Me</a>
                                <a class="dropdown-item font-weight-bold" href="logout.php" data-toggle="modal"
                                    data-target="#logoutModal">Logout</a>
                            </li>
                        </ul>
                    </div>
                </ul>
            </div>
        </div>
    </nav>


    <div class="container" style="margin: 20px auto; min-height: 500px;">

        <?php
        $menu = ''; //variable untuk menampung menu
        
        if (isset($_GET['menu'])) {
            $menu = $_GET['menu'];
        }

        if ($menu != '') {
            if (can_access_menu($menu)) {
                if (file_exists($menu . ".php")) {
                    include $menu . '.php';
                } 
            }
        } else {
            include "home.php";
        }
        ?>

        <?php
        include "footer.php";
        ?>
    </div>

    <!-- Modal Logout-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Apakah anda yakin ingin keluar?</div>
                <div class="modal-footer">
                    <button class="btn btn-warning" type="button" data-dismiss="modal"><i
                            class="fas fa-fw fa-times mr-1"></i>Tidak</button>
                    <a class="btn btn-success" href="logout.php"><i class="fas fa-fw fa-check mr-1"></i>Ya</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="assets/vendor/jquery/jquery.min.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="assets/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <!-- <script src="assets/vendor/chart.js/Chart.min.js"></script> -->

    <!-- Page level custom scripts -->
    <!-- <script src="assets/js/demo/chart-area-demo.js"></script>
    <script src="assets/js/demo/chart-pie-demo.js"></script> -->

    <!-- Page level plugins -->
    <script src="assets/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="assets/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="assets/js/demo/datatables-demo.js"></script>

    <script src="assets/js/bootstrap-datepicker.min.js"></script>
    <script src="assets/js/bootstrap-timepicker.min.js"></script>
    <script src="assets/js/bootstrap-datetimepicker.min.js"></script>
    <script src="assets/js/bootstrap-colorpicker.min.js"></script>
    <script src="assets/js/moment.min.js"></script>
    <script src="assets/js/daterangepicker.min.js"></script>
    <script src="assets/js/ace-elements.min.js"></script>
    <script src="assets/js/ace.min.js"></script>


    <script>
    new SlimSelect({
        select: '#multiple'
    })
    </script>

    <!-- inline scripts related to this page -->
    <script type="text/javascript">
    jQuery(function($) {
        //datepicker plugin
        //link
        $('.date-picker').datepicker({
                autoclose: true,
                todayHighlight: true
            })
            //show datepicker when clicking on the icon
            .next().on(ace.click_event, function() {
                $(this).prev().focus();
            });

        //or change it into a date range picker
        $('.input-daterange').datepicker({
            autoclose: true
        });


        //to translate the daterange picker, please copy the "examples/daterange-fr.js" contents here before initialization
        $('input[name=range_tanggal]').daterangepicker(

                {
                    'applyClass': 'btn-sm btn-success',
                    'cancelClass': 'btn-sm btn-default',
                    locale: {
                        applyLabel: 'Apply',
                        cancelLabel: 'Cancel',
                        format: 'DD/MM/YYYY',
                    }
                })
            .prev().on(ace.click_event, function() {
                $(this).next().focus();
            });

        $('#id-input-file-1 , #id-input-file-2').ace_file_input({
            no_file: 'No File ...',
            btn_choose: 'Choose',
            btn_change: 'Change',
            droppable: false,
            onchange: null,
            thumbnail: false //| true | large
            //whitelist:'gif|png|jpg|jpeg'
            //blacklist:'exe|php'
            //onchange:''
            //
        });

        //flot chart resize plugin, somehow manipulates default browser resize event to optimize it!
        //but sometimes it brings up errors with normal resize event handlers
        $.resize.throttleWindow = false;

        /////////////////////////////////////
        $(document).one('ajaxloadstart.page', function(e) {
            $tooltip.remove();
        });
    });
    </script>

</body>

</html>