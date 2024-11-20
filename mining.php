<?php

/* 
 * Proses mining function
 */

function reset_temporary($db_object){
    $sql1 = "TRUNCATE itemset1";
    $db_object->db_query($sql1);
    
    $sql2 = "TRUNCATE itemset2";
    $db_object->db_query($sql2);
    
    $sql3 = "TRUNCATE itemset3";
    $db_object->db_query($sql3);
    
    $sql4 = "TRUNCATE confidence";
    $db_object->db_query($sql4);
}

function reset_hitungan($db_object, $id_proses){
    $condition = array("id_proses"=>$id_proses);
    $db_object->delete_record("itemset1", $condition);
    
    //$condition = array("id_proses"=>$id_proses);
    $db_object->delete_record("itemset2", $condition);
    
    //$condition = array("id_proses"=>$id_proses);
    $db_object->delete_record("itemset3", $condition);
    
    //$condition = array("id_proses"=>$id_proses);
    $db_object->delete_record("confidence", $condition);
}

function is_exist_variasi_itemset($array_item1, $array_item2, $item1, $item2) {
    $bool1 = array_keys(array_map('strtoupper', $array_item1), strtoupper($item1));
    $bool2 = array_keys(array_map('strtoupper', $array_item2), strtoupper($item2));
    $bool3 = array_keys(array_map('strtoupper', $array_item2), strtoupper($item1));
    $bool4 = array_keys(array_map('strtoupper', $array_item1), strtoupper($item2));
    
    foreach ($bool1 as $key => $value) {
        $aa = array_search($value, $bool2);
        if(is_numeric($aa)){
            return true;
        }
    }
    
    foreach ($bool3 as $key => $value) {
        $aa = array_search($value, $bool4);
        if(is_numeric($aa)){
            return true;
        }
    }
    
    return false;
}


function mining_process($db_object, $min_support, $min_confidence, $tanggal_mulai, $tanggal_akhir, $id_proses){
    // mengambil semua data dari tabel transaksi, hanya transaksi yang terjadi antara tanggal mulai dan tanggal akhir yang diberikan.
    $sql_trans = "SELECT * FROM transaksi WHERE tanggal_transaksi BETWEEN '$tanggal_mulai' AND '$tanggal_akhir' ";
    $result_trans = $db_object->db_query($sql_trans);
    
    // Variabel $dataTransaksi untuk menyimpan data transaksi dan $item_list untuk menyimpan daftar item.
    $dataTransaksi = $item_list = array();
    $jumlah_transaksi = $db_object->db_num_rows($result_trans);
    // $min_support_relative = ($min_support/$jumlah_transaksi)*100; 
    $x=0;
    while($myrow = $db_object->db_fetch_array($result_trans)){
        // Memproses setiap baris hasil query
        $dataTransaksi[$x]['tanggal'] = $myrow['tanggal_transaksi'];
        $item_produk = $myrow['produk'].",";
        //mencegah ada jarak spasi
        $item_produk = str_replace(" ,", ",", $item_produk);
        $item_produk = str_replace("  ,", ",", $item_produk);
        $item_produk = str_replace("   ,", ",", $item_produk);
        $item_produk = str_replace("    ,", ",", $item_produk);
        $item_produk = str_replace(", ", ",", $item_produk);
        $item_produk = str_replace(",  ", ",", $item_produk);
        $item_produk = str_replace(",   ", ",", $item_produk);
        $item_produk = str_replace(",    ", ",", $item_produk);
        
        $dataTransaksi[$x]['produk'] = $item_produk;

        // PENCARIAN KANDIDAR 1-Itemset
        // Memecah string produk menjadi array
        $produk = explode(",", $myrow['produk']);
        //all items
        foreach ($produk as $key => $value_produk) {
            // Memeriksa setiap produk apakah sudah ada dalam $item_list. Jika belum tambahkan ke dalam $item_list.
            // array_map('strtoupper', $item_list) untuk membandingkan secara case-insensitive 
            // case-insensitive merupakan huruf besar dan huruf kecil diartikan sama
            if(!in_array(strtoupper($value_produk), array_map('strtoupper', $item_list))){
                if(!empty($value_produk)){
                    $item_list[] = $value_produk;
                }
            }
        }
        $x++;
    }

    // TAMPILAN UNTUK PROSES MINING PADA MENU PROSES
    
    //build itemset 1
    echo "  <div class='card shadow mb-4'>
                <div class='card-header py-3'>
                    <h6 class='m-0 font-weight-bold text-dark'><i class='fa fa-table'></i> Perhitungan Support 1-Itemset</h6>
                </div>
                <div class='card-body'>";
    echo "          <table class='table table-bordered' width='100%' cellspacing='0'>
                        <thead class='bg-gray-600 text-white'>
                            <tr align='center'>
                                <th>No</th>
                                <th>Item</th>
                                <th>Jumlah</th>
                                <th>Suppport</th>
                                <th>Keterangan</th>
                            </tr>
                        </thead>";
                        //inisialisasi $jumlahItemset1 = $supportItemset1 = $valueIn sebagai array kosong. digunakan menyimpan hasil perhitungan.
                        $itemset1 = $jumlahItemset1 = $supportItemset1 = $valueIn = array();
                        $x=1;
                        // loppong setiap elemen dalam array $item_list atau kandidat yang didapat dari transaksi.
                        foreach ($item_list as $key => $item) { 
                            $jumlah = jumlah_itemset1($dataTransaksi, $item);
                            $support = ($jumlah/$jumlah_transaksi) * 100;
                            $lolos = ($support>=$min_support)?"1":"0";
                            $valueIn[] = "('$item','$jumlah','$support','$lolos','$id_proses')"; //penyimpanan ke dalam array $valueIn
                            if($lolos){
                                $itemset1[] = $item;
                                $jumlahItemset1[] = $jumlah;
                                $supportItemset1[] = $support;
                            }
                            echo "<tr>";
                            echo "<td class='text-center py-2'>" . $x . "</td>";
                            echo "<td class='text-center py-2'>" . $item . "</td>";
                            echo "<td class='text-center py-2'>" . $jumlah . "</td>";
                            echo "<td class='text-center py-2'>" . price_format($support) . "</td>";
                            echo "<td class='text-center py-2'>" . (($lolos==1)?"<span class='badge badge-success'>Lolos</span>":"<span class='badge badge-danger'>Tidak Lolos</span>") . "</td>";
                            echo "</tr>";
                            $x++;
                        }
    echo "</table></div></div>";
    
    // menyimpan isi array $valueIn ke dalam tabel itemset1 
    $value_insert = implode(",", $valueIn);
    $sql_insert_itemset1 = "INSERT INTO itemset1 (atribut, jumlah, support, lolos, id_proses) ". " VALUES ".$value_insert;
    $db_object->db_query($sql_insert_itemset1);
    
    //display itemset yg lolos
    echo "  <div class='card shadow mb-4'>
                <div class='card-header py-3'>
                    <h6 class='m-0 font-weight-bold text-dark'><i class='fa fa-table'></i> Support 1-Itemset yang lolos</h6>
                </div>
                <div class='card-body'>";
    echo "          <table class='table table-bordered' width='100%' cellspacing='0'>
                        <thead class='bg-gray-600 text-white'>
                            <tr align='center'>
                                <th>No</th>
                                <th>Item</th>
                                <th>Jumlah</th>
                                <th>Suppport</th>
                            </tr>
                        </thead>";
                        $x=1;
                        foreach ($itemset1 as $key => $value) {
                            echo "<tr>";
                            echo "<td class='text-center py-2'>" . $x . "</td>";
                            echo "<td class='text-center py-2'>" . $value . "</td>";
                            echo "<td class='text-center py-2'>" . $jumlahItemset1[$key] . "</td>";
                            echo "<td class='text-center py-2'>" . price_format($supportItemset1[$key]) . "</td>";
                            echo "</tr>";
                            $x++;
                        }
    echo "</table></div></div>";
    
    
    //build itemset2
    echo "  <div class='card shadow mb-4'>
                <div class='card-header py-3'>
                    <h6 class='m-0 font-weight-bold text-dark'><i class='fa fa-table'></i> Perhitungan Support 2-Itemset</h6>
                </div>
                <div class='card-body'>";
    echo "          <table class='table table-bordered' width='100%' cellspacing='0'>
                        <thead class='bg-gray-600 text-white'>
                            <tr align='center'>
                                <th>No</th>
                                <th>Item1</th>
                                <th>Item2</th>
                                <th>Jumlah</th>
                                <th>Suppport</th>
                                <th>Keterangan</th>
                            </tr>
                        </thead>";

                        //inisialisasi sebagai array kosong. digunakan menyimpan hasil perhitungan.
                        $NilaiAtribut1 = $NilaiAtribut2 = array();
                        $itemset2_var1 = $itemset2_var2 = $jumlahItemset2 = $supportItemset2 = array();
                        $valueIn_itemset2 = array();
                        $no=1;
                        $a = 0;
                        while ($a <= count($itemset1)) {
                            $b = 0;
                            while ($b <= count($itemset1)) {
                                $variance1 = $itemset1[$a];
                                $variance2 = $itemset1[$b];
                                if (!empty($variance1) && !empty($variance2)) {
                                    if ($variance1 != $variance2) {
                                        if(!is_exist_variasi_itemset($NilaiAtribut1, $NilaiAtribut2, $variance1, $variance2)) {
                                            $jml_itemset2 = jumlah_itemset2($dataTransaksi, $variance1, $variance2);
                                            $NilaiAtribut1[] = $variance1;
                                            $NilaiAtribut2[] = $variance2;
                                            
                                            $support2 = ($jml_itemset2/$jumlah_transaksi) * 100;
                                            $lolos = ($support2 >= $min_support)? 1:0;
                                            
                                            $valueIn_itemset2[] = "('$variance1','$variance2','$jml_itemset2','$support2','$lolos','$id_proses')";
                                            if($lolos){
                                                $itemset2_var1[] = $variance1;
                                                $itemset2_var2[] = $variance2;
                                                $jumlahItemset2[] = $jml_itemset2;
                                                $supportItemset2[] = $support2;
                                            }
                                            echo "<tr>";
                                            echo "<td class='text-center py-2'>" . $no . "</td>";
                                            echo "<td class='text-center py-2'>" . $variance1 . "</td>";
                                            echo "<td class='text-center py-2'>" . $variance2 . "</td>";
                                            echo "<td class='text-center py-2'>" . $jml_itemset2 . "</td>";
                                            echo "<td class='text-center py-2'>" . price_format($support2) . "</td>";
                                            echo "<td class='text-center py-2'>" . (($lolos==1)?"<span class='badge badge-success'>Lolos</span>":"<span class='badge badge-danger'>Tidak Lolos</span>") . "</td>";
                                            echo "</tr>";
                                            $no++;
                                        }
                                    }
                                }
                                $b++;
                            }
                            $a++;
                        }
    echo "</table></div></div>";
    
    // menyimpan isi array $valueIn_itemset2 ke dalam tabel itemset2 
    $value_insert_itemset2 = implode(",", $valueIn_itemset2);
    $sql_insert_itemset2 = "INSERT INTO itemset2 (atribut1, atribut2, jumlah, support, lolos, id_proses) "
            . " VALUES ".$value_insert_itemset2;
    $db_object->db_query($sql_insert_itemset2);
    
    //display itemset yg lolos
    echo "  <div class='card shadow mb-4'>
                <div class='card-header py-3'>
                    <h6 class='m-0 font-weight-bold text-dark'><i class='fa fa-table'></i> Support 2-Itemset yang lolos</h6>
                </div>
                <div class='card-body'>";
    echo "          <table class='table table-bordered' width='100%' cellspacing='0'>
                        <thead class='bg-gray-600 text-white'>
                            <tr align='center'>
                                <th>No</th>
                                <th>Item 1</th>
                                <th>Item 2</th>
                                <th>Jumlah</th>
                                <th>Suppport</th>
                                </tr>
                        </thead>";
                        $no=1;
                        foreach ($itemset2_var1 as $key => $value) {
                            echo "<tr>";
                            echo "<td class='text-center py-2'>" . $no . "</td>";
                            echo "<td class='text-center py-2'>" . $value . "</td>";
                            echo "<td class='text-center py-2'>" . $itemset2_var2[$key] . "</td>";
                            echo "<td class='text-center py-2'>" . $jumlahItemset2[$key] . "</td>";
                            echo "<td class='text-center py-2'>" . price_format($supportItemset2[$key]) . "</td>";
                            echo "</tr>";
                            $no++;
                        }
    echo "</table></div></div>";
    
    //build itemset3
    echo "  <div class='card shadow mb-4'>
                <div class='card-header py-3'>
                    <h6 class='m-0 font-weight-bold text-dark'><i class='fa fa-table'></i> Perhitungan Support 3-Itemset</h6>
                </div>
                <div class='card-body'>";
    echo "          <table class='table table-bordered' width='100%' cellspacing='0'>
                        <thead class='bg-gray-600 text-white'>
                            <tr align='center'>
                                <th>No</th>
                                <th>Item 1</th>
                                <th>Item 2</th>
                                <th>Item 3</th>
                                <th>Jumlah</th>
                                <th>Suppport</th>
                                <th>Keterangan</th>
                            </tr>
                        </thead>";
                        $a = 0;
                        //inisialisasi sebagai array kosong. digunakan menyimpan hasil perhitungan.
                        $tigaVariasiItem = $valueIn_itemset3 =  array();
                        $itemset3_var1 = $itemset3_var2 = $itemset3_var3 = $jumlahItemset3 = $supportItemset3 = array();
                        $no=1;
                        while ($a <= count($itemset2_var1)) {
                            $b = 0;
                            while ($b <= count($itemset2_var1)) {
                                if($a != $b){
                                    $itemset1a = $itemset2_var1[$a];
                                    $itemset1b = $itemset2_var1[$b];
                                    
                                    $itemset2a = $itemset2_var2[$a];
                                    $itemset2b = $itemset2_var2[$b];

                                    if (!empty($itemset1a) && !empty($itemset1b)&& !empty($itemset2a) && !empty($itemset2b)) {
                                        
                                        $temp_array = get_variasi_itemset3($tigaVariasiItem, //fungsi di baris 477
                                                $itemset1a, $itemset1b, $itemset2a, $itemset2b);
                                        
                                        if(count($temp_array)>0){
                                            //variasi-variasi itemset isi ke array
                                            $tigaVariasiItem = array_merge($tigaVariasiItem, $temp_array);
                                            
                                            foreach ($temp_array as $idx => $val_nilai) {
                                                $itemset1 = $itemset2 = $itemset3 = "";
                                                
                                                $aaa=0;
                                                foreach ($val_nilai as $idx1 => $v_nilai) {
                                                    if($aaa==0){
                                                        $itemset1 = $v_nilai;
                                                    }
                                                    if($aaa==1){
                                                        $itemset2 = $v_nilai;
                                                    }
                                                    if($aaa==2){
                                                        $itemset3 = $v_nilai;
                                                    }
                                                    $aaa++;
                                                }
                                                
                                                //jumlah item set3 dan menghitung supportnya
                                                $jml_itemset3 = jumlah_itemset3($dataTransaksi, $itemset1, $itemset2, $itemset3);
                                                $support3 = ($jml_itemset3/$jumlah_transaksi) * 100;
                                                $lolos = ($support3 >= $min_support)? 1:0;
                                                
                                                $valueIn_itemset3[] = "('$itemset1','$itemset2','$itemset3','$jml_itemset3','$support3','$lolos','$id_proses')";
                                                
                                                if($lolos){
                                                    $itemset3_var1[] = $itemset1;
                                                    $itemset3_var2[] = $itemset2;
                                                    $itemset3_var3[] = $itemset3;
                                                    $jumlahItemset3[] = $jml_itemset3;
                                                    $supportItemset3[] = $support3;
                                                }
                                            
                                                echo "<tr>";
                                                echo "<td class='text-center py-2'>" . $no . "</td>";
                                                echo "<td class='text-center py-2'>" . $itemset1 . "</td>";
                                                echo "<td class='text-center py-2'>" . $itemset2 . "</td>";
                                                echo "<td class='text-center py-2'>" . $itemset3 . "</td>";
                                                echo "<td class='text-center py-2'>" . $jml_itemset3 . "</td>";
                                                echo "<td class='text-center py-2'>" . price_format($support3) . "</td>";
                                                echo "<td class='text-center py-2'>" . (($lolos==1)?"<span class='badge badge-success'>Lolos</span>":"<span class='badge badge-danger'>Tidak Lolos</span>") . "</td>";
                                                echo "</tr>";
                                                $no++;
                                            }
                                        }
                                    }
                                }
                                $b++;
                            }
                            $a++;
                        }
    echo "</table></div></div>";

    //insert into itemset3 one query with many value
    $value_insert_itemset3 = implode(",", $valueIn_itemset3);
    $sql_insert_itemset3 = "INSERT INTO itemset3(atribut1, atribut2, atribut3, jumlah, support, lolos, id_proses) "
            . " VALUES ".$value_insert_itemset3;
    $db_object->db_query($sql_insert_itemset3);
    
    //display itemset yg lolos
    echo "  <div class='card shadow mb-4'>
                <div class='card-header py-3'>
                    <h6 class='m-0 font-weight-bold text-dark'><i class='fa fa-table'></i> Support 3-Itemset yang lolos</h6>
                </div>
                <div class='card-body'>";
    echo "          <table class='table table-bordered' width='100%' cellspacing='0'>
                        <thead class='bg-gray-600 text-white'>
                            <tr align='center'>
                                <th>No</th>
                                <th>Item 1</th>
                                <th>Item 2</th>
                                <th>Item 3</th>
                                <th>Jumlah</th>
                                <th>Suppport</th>
                            </tr>
                        </thead>";
                        $no=1;
                        foreach ($itemset3_var1 as $key => $value) {
                            echo "<tr>";
                            echo "<td class='text-center py-2'>" . $no . "</td>";
                            echo "<td class='text-center py-2'>" . $value . "</td>";
                            echo "<td class='text-center py-2'>" . $itemset3_var2[$key] . "</td>";
                            echo "<td class='text-center py-2'>" . $itemset3_var3[$key] . "</td>";
                            echo "<td class='text-center py-2'>" . $jumlahItemset3[$key] . "</td>";
                            echo "<td class='text-center py-2'>" . price_format($supportItemset3[$key]) . "</td>";
                            echo "</tr>";
                            $no++;
                        }
    echo "</table></div></div>";


    //hitung confidence
    //dari itemset 3 jika tidak ada yg lolos ambil dari itemset 2 jika tiak ada gagal mendapatkan confidence
    $confidence_from_itemset = 0;
    // mengambil semua data dari tabel itemset3, hanya itemset3 yang lolos yang diambil.
    $sql_3 = "SELECT * FROM itemset3 WHERE lolos = 1 AND id_proses = ".$id_proses;
    $res_3 = $db_object->db_query($sql_3);
    $jumlah_itemset3_lolos = $db_object->db_num_rows($res_3);
    if($jumlah_itemset3_lolos > 0){
        $confidence_from_itemset = 3;
        
        while($row_3 = $db_object->db_fetch_array($res_3)){
            $atribut1 = $row_3['atribut1'];
            $atribut2 = $row_3['atribut2'];
            $atribut3 = $row_3['atribut3'];
            $supp_AUB = $row_3['support'];
            
            //1,2 => 3
            hitung_confidence($db_object, $supp_AUB, $min_support, $min_confidence, 
                    $atribut1, $atribut2, $atribut3, $id_proses, $dataTransaksi, $jumlah_transaksi);
            
            //2,3 => 1
            hitung_confidence($db_object, $supp_AUB, $min_support, $min_confidence, 
                    $atribut2, $atribut3, $atribut1, $id_proses, $dataTransaksi, $jumlah_transaksi);
            
            //3,1 => 2
            hitung_confidence($db_object, $supp_AUB, $min_support, $min_confidence, 
                    $atribut3, $atribut1, $atribut2, $id_proses, $dataTransaksi, $jumlah_transaksi);
            
            
            //1 => 3,2
            hitung_confidence1($db_object, $supp_AUB, $min_support, $min_confidence, 
                    $atribut1, $atribut3, $atribut2, $id_proses, $dataTransaksi, $jumlah_transaksi);
            
            //2 => 1,3
            hitung_confidence1($db_object, $supp_AUB, $min_support, $min_confidence,
                    $atribut2, $atribut1, $atribut3, $id_proses, $dataTransaksi, $jumlah_transaksi);
            
            //3 => 2,1
            hitung_confidence1($db_object, $supp_AUB, $min_support, $min_confidence,
                    $atribut3, $atribut2, $atribut1, $id_proses, $dataTransaksi, $jumlah_transaksi);
        }
    }

    //dari itemset 2
    // mengambil semua data dari tabel itemset2, hanya itemset2 yang lolos yang diambil.
    $sql_2 = "SELECT * FROM itemset2 WHERE lolos = 1 AND id_proses = ".$id_proses;
    $res_2 = $db_object->db_query($sql_2);
    $jumlah_itemset2_lolos = $db_object->db_num_rows($res_2);
    if($jumlah_itemset2_lolos > 0){
        $confidence_from_itemset = 2;
        while($row_2 = $db_object->db_fetch_array($res_2)){
            $atribut1 = $row_2['atribut1'];
            $atribut2 = $row_2['atribut2'];
            $supp_AUB = $row_2['support'];
            
            //1 => 2
            hitung_confidence2($db_object, $supp_AUB, $min_support, $min_confidence, $atribut1, $atribut2, $id_proses, $dataTransaksi, $jumlah_transaksi);
            
            //2 => 1
            hitung_confidence2($db_object, $supp_AUB, $min_support, $min_confidence, $atribut2, $atribut1, $id_proses, $dataTransaksi, $jumlah_transaksi);
        }
    } 
    
    if($confidence_from_itemset==0){
        return false;
    }
    return true;
}



function get_variasi_itemset3($array_itemset3, $item1, $item2, $item3, $item4) {
    $return = array();
    
    $return1 = array();
    if(!in_array(strtoupper($item1), array_map('strtoupper', $return1))){
        $return1[] = $item1;
    }
    if(!in_array(strtoupper($item2), array_map('strtoupper', $return1))){
        $return1[] = $item2;
    }
    if(!in_array(strtoupper($item3), array_map('strtoupper', $return1))){
        $return1[] = $item3;
    }
    
    $return2 = array();
    if(!in_array(strtoupper($item1), array_map('strtoupper', $return2))){
        $return2[] = $item1;
    }
    if(!in_array(strtoupper($item2), array_map('strtoupper', $return2))){
        $return2[] = $item2;
    }
    if(!in_array(strtoupper($item4), array_map('strtoupper', $return2))){
        $return2[] = $item4;
    }
    
    $return3 = array();
    if(!in_array(strtoupper($item1), array_map('strtoupper', $return3))){
        $return3[] = $item1;
    }
    if(!in_array(strtoupper($item3), array_map('strtoupper', $return3))){
        $return3[] = $item3;
    }
    if(!in_array(strtoupper($item4), array_map('strtoupper', $return3))){
        $return3[] = $item4;
    }
    
    $return4 = array();
    if(!in_array(strtoupper($item2), array_map('strtoupper', $return4))){
        $return4[] = $item2;
    }
    if(!in_array(strtoupper($item3), array_map('strtoupper', $return4))){
        $return4[] = $item3;
    }
    if(!in_array(strtoupper($item4), array_map('strtoupper', $return4))){
        $return4[] = $item4;
    }
    
    if(count($return1)==3){
        if(!is_exist_variasi_on_itemset3($return, $return1)){
            if(!is_exist_variasi_on_itemset3($array_itemset3, $return1)){
                $return[] = $return1;
            }
        }
    }
    if(count($return2)==3){
        if(!is_exist_variasi_on_itemset3($return, $return2)){
            if(!is_exist_variasi_on_itemset3($array_itemset3, $return2)){
                $return[] = $return2;
            }
        }
    }
    if(count($return3)==3){
        if(!is_exist_variasi_on_itemset3($return, $return3)){
            if(!is_exist_variasi_on_itemset3($array_itemset3, $return3)){
                $return[] = $return3;
            }
        }
    }
    if(count($return4)==3){
        if(!is_exist_variasi_on_itemset3($return, $return4)){
            if(!is_exist_variasi_on_itemset3($array_itemset3, $return4)){
                $return[] = $return4;
            }
        }
    }
    return $return;
}

function is_exist_variasi_on_itemset3($array, $tiga_variasi){
    $return = false;
    
    foreach ($array as $key => $value) {
        $jml=0;
        foreach ($value as $key1 => $val1) {
            foreach ($tiga_variasi as $key2 => $val2) {
                if(strtoupper($val1) == strtoupper($val2)){
                    $jml++;
                }
            }
        }
        if($jml==3){
            $return=true;
            break;
        }
    }
    
    return $return;
}



//menghitung confidence 3 itemset atribut1 mengandung atribut 2 dan atribut 3
/**
 * kombinasi atibut1 U atribut2 => $atribut3
 * save to table confidence
 * @param type $db_object
 * @param type $supp_AUB
 * @param type $atribut1
 * @param type $atribut2
 * @param type $atribut3
 */
function hitung_confidence($db_object, $supp_AUB, $min_support, $min_confidence,
        $atribut1, $atribut2, $atribut3, $id_proses, $dataTransaksi, $jumlah_transaksi){

        $jml_itemset2 = jumlah_itemset2($dataTransaksi, $atribut1, $atribut2);
        $nilai_support_A = ($jml_itemset2/$jumlah_transaksi) * 100;
    
        $kombinasi1 = $atribut1." , ".$atribut2;
        $kombinasi2 = $atribut3;
        $supp_A = $nilai_support_A;//$row1_['support'];
        $conf = ($supp_AUB/$supp_A)*100; //Confidence A U B presentase
        
        //lolos seleksi min confidence itemset3
        $lolos = ($conf >= $min_confidence)? 1:0;
        
        //hitung korelasi lift
        $jumlah_kemunculanAB = jumlah_itemset3($dataTransaksi, $atribut1, $atribut2, $atribut3);
        $jumlah_kemunculanA = jumlah_itemset2($dataTransaksi, $atribut1, $atribut2);
        $jumlah_kemunculanB = jumlah_itemset1($dataTransaksi, $atribut3);
        
        $P_Conf_AUB = ($jumlah_kemunculanAB/$jumlah_transaksi)/($jumlah_kemunculanA/$jumlah_transaksi);//hitung probabilitas confidence (support AUB/support A)    
        $nilai_uji_lift = $P_Conf_AUB / ($jumlah_kemunculanB/$jumlah_transaksi);
        $korelasi_rule = ($nilai_uji_lift<1)?"korelasi negatif":"korelasi positif";
        if($nilai_uji_lift==1){
            $korelasi_rule = "tidak ada korelasi";
        }
        
        //masukkan ke table confidence
        $db_object->insert_record("confidence", 
                array("kombinasi1" => $kombinasi1,
                    "kombinasi2" => $kombinasi2,
                    "support_AUB" => $supp_AUB,
                    "support_A" => $supp_A,
                    "confidence" => $conf,
                    "lolos" => $lolos,
                    "min_support" => $min_support,
                    "min_confidence" => $min_confidence,
                    "nilai_uji_lift" => $nilai_uji_lift,
                    "korelasi_rule" => $korelasi_rule,
                    "id_proses" => $id_proses,
                    "jumlah_A" => $jumlah_kemunculanA,
                    "jumlah_B" => $jumlah_kemunculanB,
                    "jumlah_AB" => $jumlah_kemunculanAB,
                    "p_supp_A" => ($jumlah_kemunculanA/$jumlah_transaksi), //hitung probabilitas support A (Transaksi mengandung A/jumlah transaksi);
                    "p_supp_B" => ($jumlah_kemunculanB/$jumlah_transaksi),//hitung probabilitas support B (Transaksi mengandung B/jumlah transaksi);
                    "p_conf_AUB" => $P_Conf_AUB, //hitung probabilitas confidence (support AUB/support A) 
                    "from_itemset"=>3
                ));
//    }
}

//menghitung confidence 3 itemset atribut1 dan atribut 2 mengandung atribut 3
/**
 * confidence atribut1 => atribut2 U atribut3
 * @param type $db_object
 * @param type $supp_AUB
 * @param type $min_support
 * @param type $min_confidence
 * @param type $atribut1
 * @param type $atribut2
 * @param type $atribut3
 */
function hitung_confidence1($db_object, $supp_AUB, $min_support, $min_confidence,
            $atribut1, $atribut2, $atribut3, $id_proses, $dataTransaksi, $jumlah_transaksi){

            $jml_itemset1 = jumlah_itemset1($dataTransaksi, $atribut1);
            $nilai_support_A = ($jml_itemset1/$jumlah_transaksi) * 100;
    
            $kombinasi1 = $atribut1;
            $kombinasi2 = $atribut2." , ".$atribut3;
            $supp_A = $nilai_support_A;//$row4_['support'];
            $conf = ($supp_AUB/$supp_A)*100;
            //lolos seleksi min confidence itemset3
            $lolos = ($conf >= $min_confidence)? 1:0;
            
            //hitung korelasi lift
            $jumlah_kemunculanAB = jumlah_itemset3($dataTransaksi, $atribut1, $atribut2, $atribut3);
            $jumlah_kemunculanA = jumlah_itemset1($dataTransaksi, $atribut1);
            $jumlah_kemunculanB = jumlah_itemset2($dataTransaksi, $atribut2, $atribut3);

            $P_Conf_AUB = ($jumlah_kemunculanAB/$jumlah_transaksi)/($jumlah_kemunculanA/$jumlah_transaksi);//hitung probabilitas confidence (support AUB/support A)
            $nilai_uji_lift = $P_Conf_AUB / ($jumlah_kemunculanB/$jumlah_transaksi);
            $korelasi_rule = ($nilai_uji_lift<1)?"korelasi negatif":"korelasi positif";
            if($nilai_uji_lift==1){
                $korelasi_rule = "tidak ada korelasi";
            }
        
        
            //masukkan ke table confidence
            $db_object->insert_record("confidence", 
                    array("kombinasi1" => $kombinasi1,
                        "kombinasi2" => $kombinasi2,
                        "support_AUB" => $supp_AUB,
                        "support_A" => $supp_A,
                        "confidence" => $conf,
                        "lolos" => $lolos,
                        "min_support" => $min_support,
                        "min_confidence" => $min_confidence,
                        "nilai_uji_lift" => $nilai_uji_lift,
                        "korelasi_rule" => $korelasi_rule,
                        "id_proses" => $id_proses,
                        "jumlah_A" => $jumlah_kemunculanA,
                        "jumlah_B" => $jumlah_kemunculanB,
                        "jumlah_AB" => $jumlah_kemunculanAB,
                        "p_supp_A" => ($jumlah_kemunculanA/$jumlah_transaksi),  //hitung probabilitas support A (Transaksi mengandung A/jumlah transaksi);
                        "p_supp_B" => ($jumlah_kemunculanB/$jumlah_transaksi),  //hitung probabilitas support B (Transaksi mengandung B/jumlah transaksi);
                        "p_conf_AUB" => $P_Conf_AUB, //hitung probabilitas confidence (support AUB/support A) 
                        "from_itemset"=>3
                    ));
//        }
}


//menghitung confidence 2 itemset
function hitung_confidence2($db_object, $supp_AUB, $min_support, $min_confidence,
        $atribut1, $atribut2, $id_proses, $dataTransaksi, $jumlah_transaksi){

        $jml_itemset1 = jumlah_itemset1($dataTransaksi, $atribut1);
        $nilai_support_A = ($jml_itemset1/$jumlah_transaksi) * 100;
    
            $kombinasi1 = $atribut1;
            $kombinasi2 = $atribut2;
            $supp_A = $nilai_support_A;//$row1_['support'];
            $conf = ($supp_AUB/$supp_A)*100;
            
            //lolos seleksi min confidence itemset3
            $lolos = ($conf >= $min_confidence)? 1:0;
            
            //hitung korelasi lift
            $jumlah_kemunculanAB = jumlah_itemset2($dataTransaksi, $atribut1, $atribut2);        
            $jumlah_kemunculanA = jumlah_itemset1($dataTransaksi, $atribut1);
            $jumlah_kemunculanB = jumlah_itemset1($dataTransaksi, $atribut2);

            $P_Conf_AUB = ($jumlah_kemunculanAB/$jumlah_transaksi)/($jumlah_kemunculanA/$jumlah_transaksi);//hitung probabilitas confidence (support AUB/support A)
            $nilai_uji_lift = $P_Conf_AUB / ($jumlah_kemunculanB/$jumlah_transaksi);
            $korelasi_rule = ($nilai_uji_lift<1)?"korelasi negatif":"korelasi positif";
            if($nilai_uji_lift==1){
                $korelasi_rule = "tidak ada korelasi";
            }

            //masukkan ke table confidence
            $db_object->insert_record("confidence", 
                    array("kombinasi1" => $kombinasi1,
                        "kombinasi2" => $kombinasi2,
                        "support_AUB" => $supp_AUB,
                        "support_A" => $supp_A,
                        "confidence" => $conf,
                        "lolos" => $lolos,
                        "min_support" => $min_support,
                        "min_confidence" => $min_confidence,
                        "nilai_uji_lift" => $nilai_uji_lift,
                        "korelasi_rule" => $korelasi_rule,
                        "id_proses" => $id_proses,
                        "jumlah_A" => $jumlah_kemunculanA,
                        "jumlah_B" => $jumlah_kemunculanB,
                        "jumlah_AB" => $jumlah_kemunculanAB,
                        "p_supp_A" => ($jumlah_kemunculanA/$jumlah_transaksi),  //hitung probabilitas support A (Transaksi mengandung A/jumlah transaksi);
                        "p_supp_B" => ($jumlah_kemunculanB/$jumlah_transaksi), //hitung probabilitas support B (Transaksi mengandung B/jumlah transaksi);
                        "p_conf_AUB" => $P_Conf_AUB,  //hitung probabilitas confidence (support AUB/support A) 
                        "from_itemset"=>2
                    ));
//        }
}


// fungsi untuk menghitung jumlah kemunculan kandidat 1 ietm produk ($produk) dalam daftar transaksi ($transaksi_list). 
function jumlah_itemset1($transaksi_list, $produk){
    $count = 0;
    foreach ($transaksi_list as $key => $data) {
        $items = ",".strtoupper($data['produk']); //mengambil produk dari setiap transaksi
        $item_cocok = ",".strtoupper($produk).",";//mencari produk yang akan dicocokkan dalam kandidat produk yang sama.
        $pos = strpos($items, $item_cocok);       //mengembalikan produk dari string $items dimana $item_cocok ditemukan. Jika tidak ditemukan tidak akan disimpan.
        if($pos!==false){                         //digunakan untuk memeriksa apakah $item_cocok ditemukan dalam $items. Jika ya, maka penjumlahan $count akan bertambah satu.
            $count++;
        }
    }
    return $count; //mengembalikan jumlah kemunculan $produk dalam $transaksi_list.
}

// fungsi untuk menghitung jumlah kemunculan kandidat 2 ietm produk ($variasi1) dan ($variasi2) dalam daftar transaksi ($transaksi_list). 
function jumlah_itemset2($transaksi_list, $variasi1, $variasi2){
    $count = 0;
    foreach ($transaksi_list as $key => $data) {
        $items = ",".strtoupper($data['produk']);
        $item_variasi1 = ",".strtoupper($variasi1).","; //Bagian ini mengubah string menjadi huruf besar dan menambahkan koma di awal dan akhir $item_variasi1
        $item_variasi2 = ",".strtoupper($variasi2).","; //untuk $item_variasi2.
        
        $pos1 = strpos($items, $item_variasi1); //Bagian ini menggunkan strpos untuk mencari posisi $item_variasi1 dan 
        $pos2 = strpos($items, $item_variasi2); //$item_variasi2 di dalam $items.
        if($pos1!==false && $pos2!==false){//Jika keduanya $item_variasi1 dan $item_variasi2 ditemukan dalam $items, $count variabel akan bertambah.
            $count++;
        }
    }
    return $count;
}

function jumlah_itemset3($transaksi_list, $variasi1, $variasi2, $variasi3){
    $count = 0;
    foreach ($transaksi_list as $key => $data) {
        $items = ",".strtoupper($data['produk']);
        $item_variasi1 = ",".strtoupper($variasi1).",";
        $item_variasi2 = ",".strtoupper($variasi2).",";
        $item_variasi3 = ",".strtoupper($variasi3).",";
        
        $pos1 = strpos($items, $item_variasi1);
        $pos2 = strpos($items, $item_variasi2);
        $pos3 = strpos($items, $item_variasi3);
        if($pos1!==false && $pos2!==false && $pos3!==false){//was found at position $pos
            $count++;
        }
    }
    return $count;
}