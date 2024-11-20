<?php

function can_access_menu($menu)
{
    if ($_SESSION['apriori_level'] == 2) {
        return true;
    }
    if ($_SESSION['apriori_level'] == 1) {
        return true;
    }
    return false;
}

/**
 * notifikasi error (merah)
 * @param string $msg pesan
 */
function display_error($msg)
{
    echo "<div class='alert alert-danger alert-dismissable text-center'>
            " . $msg . "
        </div>";
}

/**
 * notifikasi sukses (hijau)
 * @param string $msg pesan
 */
function display_success($msg)
{
    echo "<div class='alert alert-success alert-dismissable'>
                <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
                " . $msg . "
        </div>";
}

/**
 * format number 2 dibelakang koma (number_format($value,2)
 * @param type $value
 * @return type
 */
function price_format($value)
{
    return number_format($value, 2, ',', '.');
}

function format_date($date)
{
    $date_ex = explode("/", $date);
    return $date_ex[2] . "-" . $date_ex[1] . "-" . $date_ex[0];
}

function format_date2($date)
{
    $date_ex = explode("-", $date);
    return $date_ex[2] . "/" . $date_ex[1] . "/" . $date_ex[0];
}