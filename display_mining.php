<!-- Tampilan confidence pada PROSES APRIORI -->

<?php
function display_process_hasil_mining($db_object, $id_proses)
{
    $sql1 = "SELECT * FROM confidence "
        . " WHERE id_proses = " . $id_proses
        . " AND from_itemset=3 "; //. " ORDER BY lolos DESC";
    $query1 = $db_object->db_query($sql1);
?>

<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-dark"><i class="fa fa-table"></i> Perhitungan Confidence dari 3-Itemset
        </h6>
    </div>

    <div class="card-body">

        <table class="table table-bordered" width="100%" cellspacing="0">
            <thead class="bg-gray-600 text-white">
                <tr align="center">
                    <th>No</th>
                    <th>A => B</th>
                    <th>Support A U B</th>
                    <th>Support A </th>
                    <th>Confidence</th>
                    <th>Keterangan</th>
                </tr>
            </thead>
            <?php
                $no = 1;
                $data_confidence = array();
                while ($row = $db_object->db_fetch_array($query1)) {
                    echo "<tr>";
                    echo "<td class='text-center py-2'>" . $no . "</td>";
                    echo "<td class='text-center py-2'>" . $row['kombinasi1'] . " => " . $row['kombinasi2'] . "</td>";
                    echo "<td class='text-center py-2'>" . price_format($row['support_AUB']) . "</td>";
                    echo "<td class='text-center py-2'>" . price_format($row['support_A']) . "</td>";
                    echo "<td class='text-center py-2'>" . price_format($row['confidence']) . "</td>";
                    $keterangan = ($row['confidence'] <= $row['min_confidence']) ? "<span class='badge badge-danger'>Tidak Lolos</span>" : "<span class='badge badge-success'>Lolos</span>";
                    echo "<td class='text-center py-2'>" . $keterangan . "</td>";

                    // echo "<td class='text-center'>".$row['from_itemset']."</td>";
                    echo "</tr>";
                    $no++;
                    if ($row['lolos'] == 1) {
                        $data_confidence[] = $row;
                    }
                }
                ?>
        </table>
    </div>
</div>


<?php
    $sql1 = "SELECT * FROM confidence "
        . " WHERE id_proses = " . $id_proses
        . " AND from_itemset=2 "; //. " ORDER BY lolos DESC";
    $query1 = $db_object->db_query($sql1);
    ?>
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-dark"><i class="fa fa-table"></i> Perhitungan Confidence dari 2-Itemset
        </h6>
    </div>

    <div class="card-body">
        <table class="table table-bordered" width="100%" cellspacing="0">
            <thead class="bg-gray-600 text-white">
                <tr align="center">
                    <th>No</th>
                    <th>A => B</th>
                    <th>Support A U B</th>
                    <th>Support A </th>
                    <th>Confidence</th>
                    <th>Keterangan</th>
                </tr>
            </thead>
            <?php
                $no = 1;
                //$data_confidence = array();
                while ($row = $db_object->db_fetch_array($query1)) {
                    echo "<tr>";
                    echo "<td class='text-center py-2'>" . $no . "</td>";
                    echo "<td class='text-center py-2'>" . $row['kombinasi1'] . " => " . $row['kombinasi2'] . "</td>";
                    echo "<td class='text-center py-2'>" . price_format($row['support_AUB']) . "</td>";
                    echo "<td class='text-center py-2'>" . price_format($row['support_A']) . "</td>";
                    echo "<td class='text-center py-2'>" . price_format($row['confidence']) . "</td>";
                    $keterangan = ($row['confidence'] <= $row['min_confidence']) ? "<span class='badge badge-danger'>Tidak Lolos</span>" : "<span class='badge badge-success'>Lolos</span>";
                    echo "<td class='text-center py-2'>" . $keterangan . "</td>";

                    // echo "<td class='text-center'>".$row['from_itemset']."</td>";
                    echo "</tr>";
                    $no++;
                    if ($row['lolos'] == 1) {
                        $data_confidence[] = $row;
                    }
                }
                ?>
        </table>
    </div>
</div>

<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-dark"><i class="fa fa-table"></i> Rule Asosiasi yang terbentuk, Hasil Uji
            Lift Ratio dan Korelasi</h6>
    </div>

    <div class="card-body">

        <table class="table table-bordered" width="100%" cellspacing="0">
            <thead class="bg-gray-600 text-white">
                <tr align="center">
                    <th>No</th>
                    <th>A => B</th>
                    <th>Confidence</th>
                    <th>Nilai Uji lift</th>
                    <th>Korelasi rule</th>
                    <!-- <th></th> -->
                </tr>
            </thead>
            <?php

                $no = 1;
                foreach ($data_confidence as $key => $val) {
                    echo "<tr>";
                    echo "<td class='text-center py-2'>" . $no . "</td>";
                    echo "<td class='text-center py-2'>" . $val['kombinasi1'] . " => " . $val['kombinasi2'] . "</td>";
                    echo "<td class='text-center py-2'>" . price_format($val['confidence']) . "</td>";
                    echo "<td class='text-center py-2'>" . price_format($val['nilai_uji_lift']) . "</td>";
                    echo "<td class='text-center py-2'>" . ($val['korelasi_rule']) . "</td>";
                    //echo "<td class='text-center py-2'>" . ($val['lolos'] == 1 ? "Lolos" : "Tidak Lolos") . "</td>";
                    echo "</tr>";
                    $no++;
                }
                ?>
        </table>
    </div>
</div>



<div class="card shadow mb-4">

    <div class="card-header py-3 d-sm-flex align-items-center justify-content-between">
        <h6 class="m-0 font-weight-bold text-dark"><i class="fa fa-table"></i> Hasil Analisa</h6>

    </div>

    <div class="card-body">

        <table class="table table-bordered" width="100%" cellspacing="0">
            <thead class="bg-gray-600 text-white">
                <tr align="center">
                    <th>No</th>
                    <th>Keterangan</th>
                </tr>
            </thead>
            <?php
                $no=1;
                //while($row=$db_object->db_fetch_array($query)){
                foreach($data_confidence as $key => $val){
                    if($val['lolos']==1){
                        echo "<tr>";
                        echo "<td width='5%' class='text-center'>".$no."</td>";
						echo "<td class='py-2'>Jika konsumen membeli <b>".$val['kombinasi1']
                                ."</b>, maka konsumen juga akan membeli <b>".$val['kombinasi2']."</b></td>";
                                // . price_format($val['confidence']) .
                        echo "</tr>";
                    }
                    $no++;
                }
                ?>
        </table>
    </div>
</div>



<?php
}
?>