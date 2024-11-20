<div class="mb-4">

    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800"><i class="fas fa-fw fa-home"></i> Halaman Utama</h1>
    </div>
    <hr class="sidebar-divider">

    <!-- Content Row -->
    <div class="alert alert-success">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
        Selamat datang <strong><?php echo $_SESSION['apriori_username']; ?></strong>
    </div>

    <div class="row" style="min-height: 320px;">

        <h4 class="text-center mb-5"><b>IMPLEMENTASI DATA MINING DENGAN ALGORITMA APRIORI BERBASIS WEB UNTUK ANALISIS
                DATA PENJUALAN PADA ROEMAH PANGAN ABADI</b></h4>
        <div class="modal-content mx-3">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Keterangan</h5>
            </div>
            <div class="modal-body">
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">
                        <b> Pengertian Apriori : </b><br>
                        <div class="alert alert-warning" role="alert">
                            <p>
                                Algoritma Apriori dengan metode association rule adalah salah satu teknik Data Mining
                                <br>
                                Algoritma apriori adalah suatu metode untuk mencari pola hubungan antar satu atau
                                lebih item dalam suatu dataset. Algoritma apriori banyak digunakan pada data
                                transaksi atau biasa disebut market basket, misalnya sebuah swalayan memiliki market
                                basket, dengan adanya algoritma apriori, pemilik swalayan dapat mengetahui pola
                                pembelian seorang konsumen.
                            </p>
                            <!-- <div class="alert alert-light" role="alert">
                                Konsep Apriori :
                                Itemset adalah sekumpulan item item dalam sebuah keranjang (Support)
                            </div> -->
                            1. Itemset adalah sekumpulan item yang terdiri dari satu atau lebih item dalam sebuah
                            keranjang (support).<br>
                            2. Support adalah ukuran frekuensi kemunculan itemset, untuk mengukur seberapa sering
                            itemset muncul dalam sebuah keranjang.<br>
                            3. Kandidat Itemset (k-itemset) adalah itemset yang dihasilkan selama proses pencarian
                            itemset yang sering muncul, untuk <br> &nbsp;&nbsp;&nbsp;&nbsp;menghasilkan k-itemset
                            dengan cara
                            menggabungkan itemset
                            yang sering muncul (frequent itemset) sebelumnya.<br>
                            4. Frequent Support merupakan k-itemset yang dimiliki oleh support dimana frequent k-itemset
                            yang dimiliki diatas minimum support.<br>
                            5. Minimum Support adalah ambang batas yang ditentukan sebelumnya untuk menentukan apakah
                            suatu itemset dianggap <br> &nbsp;&nbsp;&nbsp;&nbsp;sering muncul atau tidak. Itemset yang
                            memiliki support diatas
                            minimum support dianggap sering muncul dan relevan dalam analisis <br>
                            &nbsp;&nbsp;&nbsp;&nbsp;asosiasi.<br>
                            6. Confidence adalah untuk mengetahui kuat atau tidak nya aturan asosiasi dari satu
                            item terhadap item lainnya.<br>
                            7. Minimum Confidence digunakan untuk mengetahui seberapa kuat hubungan antar item, untuk
                            mencari pembuatan aturan asosiasi <br> &nbsp;&nbsp;&nbsp;&nbsp;yang nilai confidence
                            memenuhi nilai minimum
                            confidence. <br>
                            8. Uji Lift dipergunakan untuk mengetahui aturan asosiasi valid atau tidak valid dari hasil
                            Confidence.
                            <br><br>
                            Dalam menentukan nilai minimum support dan minimum confidence yang ingin diterapkan dalam
                            analisis apriori ditentukan oleh analisis yang akan melakukan analisis data (Jayanti, 2021).
                        </div>
                    </li>
                    <li class="list-group-item">
                        <b>
                            Cara Kerja apriori: </b><br>
                        <div class="alert alert-warning" role="alert">
                            <p>
                                1. Tetapkan nilai minimum support.<br>
                                2. Iterasi 1: menghitung item-item dari support (transaksi yang memuat seluruh item)
                                dengan acuan basis data untuk 1-itemset. <br>
                                &nbsp;&nbsp;&nbsp;&nbsp;Setelah mendapatkan 1-itemset, melakukan
                                pengecekan, jika nilai 1-itemset diatas minimum support maka 1-itemset tersebut <br>
                                &nbsp;&nbsp;&nbsp;&nbsp;menjadi
                                pola frekuensi tinggi.<br>
                                3. Iterasi 2: untuk mendapatkan 2-itemset harus dilakukan kombinasi k-itemset
                                sebelumnya, kemudian menyeleksi dataset untuk <br>
                                &nbsp;&nbsp;&nbsp;&nbsp;menghitung item-item yang memenuhi
                                support, itemset yang memenuhi minimum support akan dipilih sebagai pola frekuensi
                                tinggi <br>
                                &nbsp;&nbsp;&nbsp;&nbsp;dari kandidat<br>
                                4. Tetapkan nilai k-itemset dari support yang memenuhi minimum support dari
                                k-itemset.<br>
                                5. Selanjutnya lakukan iterasi selanjutnya hingga tidak ada lagi k-itemset yang memenuhi
                                minimum support.<br>
                                6. Langkah akhir, setelah semua pola frekuensi tinggi terbentuk, kemudian mencari aturan
                                Association Rules yang memenuhi nilai <br>
                                &nbsp;&nbsp;&nbsp;&nbsp;minimum Confidence dengan menghitung nilai Confidence.

                            </p>
                        </div>
                    </li>


                    <li class="list-group-item">
                        <b> Penjelasan Uji Lift Korelasi Postif, Korelasi Negatif, Tidak ada
                            Korelasi : </b><br>
                        <div class="alert alert-warning" role="alert">
                            <p>
                                Lift ratio untuk mengukur kekuatan atusan asosiasi yang sudah terbentuk, digunakan
                                sebagai petunjuk adanya kekuatan rule atas fenomena acak dari antecedent dan consequent
                                berdasarkan hasil support masing-masing. Sebagai penentu sebuah aturan asosiasi itu
                                valid atau tidak valid.<br><br>
                                Korelasi Positif: Dalam konteks Apriori, korelasi positif mengacu pada hubungan yang
                                kuat antara item-item dalam dataset. Misalnya, jika terdapat kecenderungan bahwa ketika
                                item A muncul, item B juga sering muncul bersamanya, maka dapat dikatakan bahwa ada
                                korelasi positif antara item A dan B. <br><br>
                                Korelasi Negatif: Korelasi negatif dalam algoritma Apriori mengacu pada hubungan
                                yang menunjukkan kecenderungan item-item untuk tidak muncul bersama dalam sebuah
                                transaksi atau dataset. Misalnya, jika item A sering muncul, tetapi item B jarang muncul
                                bersamanya, maka dapat dikatakan bahwa ada korelasi negatif antara item A dan
                                B.</br></br>
                                Tidak Ada Korelasi: Tidak ada korelasi dalam algoritma Apriori berarti tidak ada
                                hubungan yang signifikan antara item-item dalam dataset. Artinya, keberadaan atau
                                ketidakhadiran suatu item tidak berpengaruh pada keberadaan atau ketidakhadiran item
                                lainnya. </br>
                            </p>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <b> Penjelasan Lolos Dan Tidak Lolos : </b><br>
                        <div class="alert alert-warning" role="alert">
                            <p>
                                Lolos : kondisi Item memenuhi nilai minimum support dan nilai minimum confidence
                                <br> Tidak Lolos : Kondisi Item tidak memenuhi nilai minimum support dan nilai minimum
                                confidence </br>
                            </p>
                        </div>
                    </li>

                    </li>
                </ul>
            </div>
        </div>
    </div>

    <!-- Untuk menampilkan sesuai id proses pada semua tabel
SELECT * FROM itemset1 JOIN itemset2 ON itemset1.id_proses = itemset2.id_proses JOIN itemset3 ON itemset1.id_proses = itemset3.id_proses JOIN confidence ON itemset1.id_proses = confidence.id_proses
WHERE itemset1.id_proses = 1; -->