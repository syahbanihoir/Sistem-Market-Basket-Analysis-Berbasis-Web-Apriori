<?php
    session_start();
    unset($_SESSION['apriori_toko_id']);
    unset($_SESSION['apriori_toko_username']);
    unset($_SESSION['apriori_toko_level']);
    session_destroy();
    header("location:login.php");
?>