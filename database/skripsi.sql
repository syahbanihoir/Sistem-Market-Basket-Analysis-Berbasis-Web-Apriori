-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 20 Nov 2024 pada 06.47
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `skripsi`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `confidence`
--

CREATE TABLE `confidence` (
  `kombinasi1` varchar(250) DEFAULT NULL,
  `kombinasi2` varchar(250) DEFAULT NULL,
  `support_AUB` double DEFAULT NULL,
  `support_A` double DEFAULT NULL,
  `confidence` double DEFAULT NULL,
  `lolos` tinyint(4) DEFAULT NULL,
  `min_support` double DEFAULT NULL,
  `min_confidence` double DEFAULT NULL,
  `nilai_uji_lift` double DEFAULT NULL,
  `korelasi_rule` varchar(50) DEFAULT NULL,
  `id_proses` int(11) NOT NULL DEFAULT 0,
  `jumlah_A` int(11) DEFAULT NULL,
  `jumlah_B` int(11) DEFAULT NULL,
  `jumlah_AB` int(11) DEFAULT NULL,
  `p_supp_A` double DEFAULT NULL,
  `p_supp_B` double DEFAULT NULL,
  `p_conf_AUB` double DEFAULT NULL,
  `from_itemset` int(11) DEFAULT NULL COMMENT 'dari itemset 2/3'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `confidence`
--

INSERT INTO `confidence` (`kombinasi1`, `kombinasi2`, `support_AUB`, `support_A`, `confidence`, `lolos`, `min_support`, `min_confidence`, `nilai_uji_lift`, `korelasi_rule`, `id_proses`, `jumlah_A`, `jumlah_B`, `jumlah_AB`, `p_supp_A`, `p_supp_B`, `p_conf_AUB`, `from_itemset`) VALUES
('Kentang Harvest 1kg', 'Nugget Boss 1kg', 13.21044546851, 42.242703533026, 31.272727272727, 1, 10, 25, 1.3572363636364, 'korelasi positif', 1, 275, 150, 86, 0.42242703533026, 0.23041474654378, 0.31272727272727, 2),
('Nugget Boss 1kg', 'Kentang Harvest 1kg', 13.21044546851, 23.041474654378, 57.333333333333, 1, 10, 25, 1.3572363636364, 'korelasi positif', 1, 150, 275, 86, 0.23041474654378, 0.42242703533026, 0.57333333333333, 2),
('Kentang Harvest 1kg', 'Boss sosis Sapi 500gr', 19.201228878648, 42.242703533026, 45.454545454545, 1, 10, 25, 1.2865612648221, 'korelasi positif', 1, 275, 230, 125, 0.42242703533026, 0.35330261136713, 0.45454545454545, 2),
('Boss sosis Sapi 500gr', 'Kentang Harvest 1kg', 19.201228878648, 35.330261136713, 54.347826086956, 1, 10, 25, 1.2865612648221, 'korelasi positif', 1, 230, 275, 125, 0.35330261136713, 0.42242703533026, 0.54347826086957, 2),
('Kentang Harvest 1kg', 'Sosis Sapi isi 12', 11.981566820276, 42.242703533026, 28.363636363635, 1, 10, 25, 1.1760972785177, 'korelasi positif', 1, 275, 157, 78, 0.42242703533026, 0.24116743471582, 0.28363636363636, 2),
('Sosis Sapi isi 12', 'Kentang Harvest 1kg', 11.981566820276, 24.116743471582, 49.681528662418, 1, 10, 25, 1.1760972785177, 'korelasi positif', 1, 157, 275, 78, 0.24116743471582, 0.42242703533026, 0.4968152866242, 2),
('Nugget Boss 1kg', 'Sosis Sapi isi 12', 12.135176651306, 23.041474654378, 52.666666666668, 1, 10, 25, 2.183821656051, 'korelasi positif', 1, 150, 157, 79, 0.23041474654378, 0.24116743471582, 0.52666666666667, 2),
('Sosis Sapi isi 12', 'Nugget Boss 1kg', 12.135176651306, 24.116743471582, 50.318471337581, 1, 10, 25, 2.183821656051, 'korelasi positif', 1, 157, 150, 79, 0.24116743471582, 0.23041474654378, 0.5031847133758, 2),
('Boss sosis Sapi 500gr', 'Sosis Sapi isi 12', 11.827956989247, 35.330261136713, 33.478260869564, 1, 10, 25, 1.3881750207699, 'korelasi positif', 1, 230, 157, 77, 0.35330261136713, 0.24116743471582, 0.33478260869565, 2),
('Sosis Sapi isi 12', 'Boss sosis Sapi 500gr', 11.827956989247, 24.116743471582, 49.04458598726, 1, 10, 25, 1.3881750207699, 'korelasi positif', 1, 157, 230, 77, 0.24116743471582, 0.35330261136713, 0.49044585987261, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `itemset1`
--

CREATE TABLE `itemset1` (
  `atribut` varchar(200) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `support` double DEFAULT NULL,
  `lolos` tinyint(4) DEFAULT NULL,
  `id_proses` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `itemset1`
--

INSERT INTO `itemset1` (`atribut`, `jumlah`, `support`, `lolos`, `id_proses`) VALUES
('Iga Konro Bakar', 9, 1.3824884792627, 0, 1),
('Kentang Harvest 1kg', 275, 42.242703533026, 1, 1),
('Bakso gepeng isi 50', 40, 6.1443932411674, 0, 1),
('Nugget Boss 1kg', 150, 23.041474654378, 1, 1),
('Champ Chicken Nugget 250g', 34, 5.2227342549923, 0, 1),
('Fish Dumpling Chicken 500gr', 55, 8.4485407066052, 0, 1),
('Boss sosis Sapi 500gr', 230, 35.330261136713, 1, 1),
('Hati Sapi 1kg', 27, 4.147465437788, 0, 1),
('Kanzler Ori Nugget 450gr', 15, 2.3041474654378, 0, 1),
('Slice Teriaki Low Fat 500gr', 23, 3.5330261136713, 0, 1),
('Rendang Dadu 500gr', 34, 5.2227342549923, 0, 1),
('Tetelan Sapi 1kg', 8, 1.2288786482335, 0, 1),
('Sosis Sapi isi 12', 157, 24.116743471582, 1, 1),
('Jantung 1kg', 29, 4.4546850998464, 0, 1),
('Rawon 1kg', 46, 7.0660522273425, 0, 1),
('Fish Dumpling Cheese 500gr', 52, 7.9877112135177, 0, 1),
('Steak Ribeyae 1kg', 29, 4.4546850998464, 0, 1),
('Iga Bakar Premium', 11, 1.689708141321, 0, 1),
('Iga Sop Mix 1kg', 19, 2.9185867895545, 0, 1),
('Sosis Sapi isi 20', 23, 3.5330261136713, 0, 1),
('Ayam Utuh 700gr', 20, 3.0721966205837, 0, 1),
('Iga Gondrong 1kg', 50, 7.6804915514593, 0, 1),
('Slice Yosinoya Premium 500gr', 22, 3.3794162826421, 0, 1),
('Murato Boss Chicken Nugget', 22, 3.3794162826421, 0, 1),
('Meltique Tenderloin 1kg', 26, 3.9938556067588, 0, 1),
('Otak Otak Ikan 500gr', 52, 7.9877112135177, 0, 1),
('Kanzler Crispy Chicken Nugget 450gr', 16, 2.457757296467, 0, 1),
('Baso Urat isi 50 700gr', 32, 4.9155145929339, 0, 1),
('Tulang Sum-Sum 1kg', 20, 3.0721966205837, 0, 1),
('Kikil Kaki 1kg', 6, 0.92165898617512, 0, 1),
('Tetelan Sop Super', 20, 3.0721966205837, 0, 1),
('Daging Rendang Utuh 1kg', 15, 2.3041474654378, 0, 1),
('Bakso Cumi 500gr', 18, 2.7649769585253, 0, 1),
('Kentang Crincle 1kg', 13, 1.9969278033794, 0, 1),
('Cumi Tube 1kg', 11, 1.689708141321, 0, 1),
('Kibif Bakso Super 600gr', 23, 3.5330261136713, 0, 1),
('Ayam Utuh 800gr', 30, 4.6082949308756, 0, 1),
('Bandeng Presto', 11, 1.689708141321, 0, 1),
('Bola Salmon 500gr', 25, 3.8402457757296, 0, 1),
('Slice Yoshinoya Grad B 500gr', 15, 2.3041474654378, 0, 1),
('Cingur 500gr', 18, 2.7649769585253, 0, 1),
('Crispy Chicken Nugget 120gr', 21, 3.2258064516129, 0, 1),
('Empal 500gr', 17, 2.6113671274962, 0, 1),
('Begok Bebek Bakar Premium', 12, 1.8433179723502, 0, 1),
('Iga Super 1kg', 10, 1.5360983102919, 0, 1),
('Chicken Cordon Blue', 12, 1.8433179723502, 0, 1),
('Essem Kornet 450gr', 11, 1.689708141321, 0, 1),
('Cumi Flower 1kg', 5, 0.76804915514593, 0, 1),
('Yomas Spicy Wings 500gr', 5, 0.76804915514593, 0, 1),
('Buntut Center Cut 500gr', 5, 0.76804915514593, 0, 1),
('Lamb Leg 1kg', 3, 0.46082949308756, 0, 1),
('Buntut Center Lokal 1kg', 8, 1.2288786482335, 0, 1),
('Begok Ayam Bakar Premium', 7, 1.0752688172043, 0, 1),
('Ikan Dori 1kg', 5, 0.76804915514593, 0, 1),
('Begok Bebek Goreng Premium', 10, 1.5360983102919, 0, 1),
('Paru Sapi 1kg', 6, 0.92165898617512, 0, 1),
('Steamboat 500gr', 3, 0.46082949308756, 0, 1),
('Saikoro 500gr', 5, 0.76804915514593, 0, 1),
('Sengkel 1kg', 2, 0.30721966205837, 0, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `itemset2`
--

CREATE TABLE `itemset2` (
  `atribut1` varchar(200) DEFAULT NULL,
  `atribut2` varchar(200) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `support` double DEFAULT NULL,
  `lolos` tinyint(4) DEFAULT NULL,
  `id_proses` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `itemset2`
--

INSERT INTO `itemset2` (`atribut1`, `atribut2`, `jumlah`, `support`, `lolos`, `id_proses`) VALUES
('Kentang Harvest 1kg', 'Nugget Boss 1kg', 86, 13.21044546851, 1, 1),
('Kentang Harvest 1kg', 'Boss sosis Sapi 500gr', 125, 19.201228878648, 1, 1),
('Kentang Harvest 1kg', 'Sosis Sapi isi 12', 78, 11.981566820276, 1, 1),
('Nugget Boss 1kg', 'Boss sosis Sapi 500gr', 43, 6.605222734255, 0, 1),
('Nugget Boss 1kg', 'Sosis Sapi isi 12', 79, 12.135176651306, 1, 1),
('Boss sosis Sapi 500gr', 'Sosis Sapi isi 12', 77, 11.827956989247, 1, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `itemset3`
--

CREATE TABLE `itemset3` (
  `atribut1` varchar(200) DEFAULT NULL,
  `atribut2` varchar(200) DEFAULT NULL,
  `atribut3` varchar(200) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `support` double DEFAULT NULL,
  `lolos` tinyint(4) DEFAULT NULL,
  `id_proses` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `itemset3`
--

INSERT INTO `itemset3` (`atribut1`, `atribut2`, `atribut3`, `jumlah`, `support`, `lolos`, `id_proses`) VALUES
('Kentang Harvest 1kg', 'Nugget Boss 1kg', 'Boss sosis Sapi 500gr', 27, 4.147465437788, 0, 1),
('Kentang Harvest 1kg', 'Nugget Boss 1kg', 'Sosis Sapi isi 12', 37, 5.6835637480799, 0, 1),
('Kentang Harvest 1kg', 'Boss sosis Sapi 500gr', 'Sosis Sapi isi 12', 46, 7.0660522273425, 0, 1),
('Boss sosis Sapi 500gr', 'Nugget Boss 1kg', 'Sosis Sapi isi 12', 27, 4.147465437788, 0, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `proses_log`
--

CREATE TABLE `proses_log` (
  `id_proses` int(11) NOT NULL,
  `tanggal_mulai` date DEFAULT NULL,
  `tanggal_akhir` date DEFAULT NULL,
  `min_support` double DEFAULT NULL,
  `min_confidence` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `proses_log`
--

INSERT INTO `proses_log` (`id_proses`, `tanggal_mulai`, `tanggal_akhir`, `min_support`, `min_confidence`) VALUES
(1, '2024-02-01', '2024-04-30', 10, 25);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `tanggal_transaksi` date DEFAULT NULL,
  `produk` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `tanggal_transaksi`, `produk`) VALUES
(1, '2024-04-30', 'Iga Konro Bakar,Kentang Harvest 1kg,Bakso gepeng isi 50,Nugget Boss 1kg'),
(2, '2024-04-30', 'Champ Chicken Nugget 250g,Kentang Harvest 1kg,Fish Dumpling Chicken 500gr'),
(3, '2024-04-30', 'Boss sosis Sapi 500gr,Hati Sapi 1kg'),
(4, '2024-04-30', 'Bakso gepeng isi 50,Kanzler Ori Nugget 450gr'),
(5, '2024-04-30', 'Slice Teriaki Low Fat 500gr,Rendang Dadu 500gr'),
(6, '2024-04-30', 'Tetelan Sapi 1kg,Nugget Boss 1kg,Sosis Sapi isi 12,Kentang Harvest 1kg,Hati Sapi 1kg'),
(7, '2024-04-30', 'Sosis Sapi isi 12,Jantung 1kg'),
(8, '2024-04-30', 'Rawon 1kg,Nugget Boss 1kg,Sosis Sapi isi 12'),
(9, '2024-04-30', 'Kentang Harvest 1kg,Boss sosis Sapi 500gr,Sosis Sapi isi 12'),
(10, '2024-04-30', 'Kentang Harvest 1kg,Hati Sapi 1kg'),
(11, '2024-04-30', 'Sosis Sapi isi 12,Champ Chicken Nugget 250g'),
(12, '2024-04-30', 'Champ Chicken Nugget 250g,Fish Dumpling Cheese 500gr,Kanzler Ori Nugget 450gr,Steak Ribeyae 1kg'),
(13, '2024-04-29', 'Iga Bakar Premium,Iga Sop Mix 1kg,Slice Teriaki Low Fat 500gr,Champ Chicken Nugget 250g'),
(14, '2024-04-29', 'Kentang Harvest 1kg,Boss sosis Sapi 500gr,Sosis Sapi isi 20'),
(15, '2024-04-29', 'Ayam Utuh 700gr,Boss sosis Sapi 500gr'),
(16, '2024-04-29', 'Bakso gepeng isi 50,Nugget Boss 1kg,Champ Chicken Nugget 250g'),
(17, '2024-04-29', 'Kentang Harvest 1kg,Boss sosis Sapi 500gr,Jantung 1kg,Nugget Boss 1kg,Fish Dumpling Cheese 500gr'),
(18, '2024-04-29', 'Kentang Harvest 1kg,Boss sosis Sapi 500gr'),
(19, '2024-04-29', 'Kentang Harvest 1kg,Boss sosis Sapi 500gr,Sosis Sapi isi 12'),
(20, '2024-04-29', 'Champ Chicken Nugget 250g,Iga Gondrong 1kg,Slice Yosinoya Premium 500gr,Boss sosis Sapi 500gr,Sosis Sapi isi 12'),
(21, '2024-04-29', 'Murato Boss Chicken Nugget,Jantung 1kg,Meltique Tenderloin 1kg,Steak Ribeyae 1kg,Fish Dumpling Cheese 500gr'),
(22, '2024-04-29', 'Kentang Harvest 1kg,Fish Dumpling Chicken 500gr'),
(23, '2024-04-29', 'Tetelan Sapi 1kg,Nugget Boss 1kg,Sosis Sapi isi 12,Kentang Harvest 1kg'),
(24, '2024-04-29', 'Kentang Harvest 1kg,Steak Ribeyae 1kg,Nugget Boss 1kg,Otak Otak Ikan 500gr,Hati Sapi 1kg'),
(25, '2024-04-29', 'Fish Dumpling Chicken 500gr,Boss sosis Sapi 500gr,Kanzler Crispy Chicken Nugget 450gr'),
(26, '2024-04-29', 'Iga Sop Mix 1kg,Boss sosis Sapi 500gr,Sosis Sapi isi 12,Kentang Harvest 1kg'),
(27, '2024-04-28', 'Champ Chicken Nugget 250g,Baso Urat isi 50 700gr,Fish Dumpling Cheese 500gr'),
(28, '2024-04-28', 'Baso Urat isi 50 700gr,Tulang Sum-Sum 1kg,Slice Teriaki Low Fat 500gr,Kikil Kaki 1kg,Tetelan Sop Super,Daging Rendang Utuh 1kg,Champ Chicken Nugget 250g'),
(29, '2024-04-28', 'Champ Chicken Nugget 250g,Fish Dumpling Chicken 500gr,Nugget Boss 1kg,Sosis Sapi isi 12,Kentang Harvest 1kg'),
(30, '2024-04-28', 'Nugget Boss 1kg,Slice Yosinoya Premium 500gr,Kanzler Ori Nugget 450gr,Kentang Harvest 1kg'),
(31, '2024-04-28', 'Ayam Utuh 700gr,Meltique Tenderloin 1kg'),
(32, '2024-04-28', 'Bakso Cumi 500gr,Boss sosis Sapi 500gr,Nugget Boss 1kg,Sosis Sapi isi 12'),
(33, '2024-04-28', 'Boss sosis Sapi 500gr,Nugget Boss 1kg,Kentang Harvest 1kg,Sosis Sapi isi 20'),
(34, '2024-04-28', 'Fish Dumpling Chicken 500gr,Nugget Boss 1kg,Sosis Sapi isi 12'),
(35, '2024-04-28', 'Boss sosis Sapi 500gr,Kentang Harvest 1kg,Meltique Tenderloin 1kg,Nugget Boss 1kg,Sosis Sapi isi 12'),
(36, '2024-04-28', 'Iga Gondrong 1kg,Fish Dumpling Cheese 500gr,Boss sosis Sapi 500gr,Sosis Sapi isi 12,Nugget Boss 1kg'),
(37, '2024-04-28', 'Boss sosis Sapi 500gr,Fish Dumpling Cheese 500gr,Nugget Boss 1kg,Kentang Harvest 1kg,Sosis Sapi isi 12'),
(38, '2024-04-28', 'Kentang Harvest 1kg,Kentang Crincle 1kg,Cumi Tube 1kg,Nugget Boss 1kg,Otak Otak Ikan 500gr'),
(39, '2024-04-28', 'Nugget Boss 1kg,Iga Gondrong 1kg,Baso Urat isi 50 700gr,Fish Dumpling Cheese 500gr,Sosis Sapi isi 12'),
(40, '2024-04-28', 'Boss sosis Sapi 500gr,Kibif Bakso Super 600gr'),
(41, '2024-04-28', 'Ayam Utuh 800gr,Kibif Bakso Super 600gr'),
(42, '2024-04-28', 'Nugget Boss 1kg,Kanzler Ori Nugget 450gr,Kentang Harvest 1kg,Otak Otak Ikan 500gr,Sosis Sapi isi 12'),
(43, '2024-04-28', 'Kentang Harvest 1kg,Baso Urat isi 50 700gr,Bandeng Presto,Meltique Tenderloin 1kg,Fish Dumpling Cheese 500gr'),
(44, '2024-04-28', 'Iga Gondrong 1kg,Kanzler Crispy Chicken Nugget 450gr'),
(45, '2024-04-28', 'Kanzler Crispy Chicken Nugget 450gr,Tetelan Sop Super,Boss sosis Sapi 500gr,Sosis Sapi isi 12'),
(46, '2024-04-28', 'Kentang Harvest 1kg,Boss sosis Sapi 500gr,Steak Ribeyae 1kg,Fish Dumpling Cheese 500gr'),
(47, '2024-04-28', 'Kentang Harvest 1kg,Fish Dumpling Cheese 500gr'),
(48, '2024-04-28', 'Boss sosis Sapi 500gr,Kentang Harvest 1kg,Sosis Sapi isi 12,Nugget Boss 1kg'),
(49, '2024-04-28', 'Kentang Harvest 1kg,Cumi Tube 1kg,Bola Salmon 500gr'),
(50, '2024-04-26', 'Champ Chicken Nugget 250g,Slice Yosinoya Premium 500gr,Slice Yoshinoya Grad B 500gr'),
(51, '2024-04-26', 'Boss sosis Sapi 500gr,Cumi Tube 1kg,Bandeng Presto'),
(52, '2024-04-26', 'Baso Urat isi 50 700gr,Slice Yosinoya Premium 500gr,Tetelan Sop Super,Nugget Boss 1kg,Kentang Harvest 1kg,Sosis Sapi isi 12'),
(53, '2024-04-26', 'Sosis Sapi isi 12,Bakso Cumi 500gr,Kibif Bakso Super 600gr'),
(54, '2024-04-26', 'Sosis Sapi isi 12,Nugget Boss 1kg,Otak Otak Ikan 500gr'),
(55, '2024-04-26', 'Kentang Harvest 1kg,Bola Salmon 500gr,Nugget Boss 1kg'),
(56, '2024-04-26', 'Kentang Harvest 1kg,Fish Dumpling Chicken 500gr,Nugget Boss 1kg,Otak Otak Ikan 500gr'),
(57, '2024-04-26', 'Cingur 500gr,Meltique Tenderloin 1kg,Steak Ribeyae 1kg,Nugget Boss 1kg,Kentang Harvest 1kg,Sosis Sapi isi 12,Boss sosis Sapi 500gr'),
(58, '2024-04-26', 'Slice Teriaki Low Fat 500gr,Fish Dumpling Cheese 500gr,Rendang Dadu 500gr,Nugget Boss 1kg,Otak Otak Ikan 500gr,Sosis Sapi isi 12'),
(59, '2024-04-26', 'Boss sosis Sapi 500gr,Kentang Harvest 1kg,Sosis Sapi isi 12,Boss sosis Sapi 500gr'),
(60, '2024-04-26', 'Boss sosis Sapi 500gr,Crispy Chicken Nugget 120gr,Sosis Sapi isi 20'),
(61, '2024-04-26', 'Murato Boss Chicken Nugget,Sosis Sapi isi 12'),
(62, '2024-04-26', 'Kanzler Crispy Chicken Nugget 450gr,Empal 500gr,Hati Sapi 1kg'),
(63, '2024-04-26', 'Nugget Boss 1kg,Kentang Crincle 1kg,Kentang Harvest 1kg'),
(64, '2024-04-26', 'Iga Gondrong 1kg,Ayam Utuh 800gr'),
(65, '2024-04-26', 'Crispy Chicken Nugget 120gr,Kentang Harvest 1kg,Hati Sapi 1kg'),
(66, '2024-04-26', 'Boss sosis Sapi 500gr,Ayam Utuh 800gr'),
(67, '2024-04-26', 'Iga Gondrong 1kg,Begok Bebek Bakar Premium,Sosis Sapi isi 20'),
(68, '2024-04-26', 'Rawon 1kg,Empal 500gr,Iga Gondrong 1kg'),
(69, '2024-04-25', 'Daging Rendang Utuh 1kg,Rawon 1kg'),
(70, '2024-04-25', 'Boss sosis Sapi 500gr,Fish Dumpling Cheese 500gr,Otak Otak Ikan 500gr,Champ Chicken Nugget 250g'),
(71, '2024-04-25', 'Boss sosis Sapi 500gr,Rendang Dadu 500gr,Kentang Harvest 1kg'),
(72, '2024-04-25', 'Kentang Harvest 1kg,Fish Dumpling Chicken 500gr,Fish Dumpling Cheese 500gr'),
(73, '2024-04-25', 'Boss sosis Sapi 500gr,Meltique Tenderloin 1kg'),
(74, '2024-04-25', 'Bakso gepeng isi 50,Nugget Boss 1kg,Sosis Sapi isi 12'),
(75, '2024-04-25', 'Boss sosis Sapi 500gr,Kentang Harvest 1kg'),
(76, '2024-04-25', 'Boss sosis Sapi 500gr,Iga Super 1kg'),
(77, '2024-04-25', 'Fish Dumpling Chicken 500gr,Rendang Dadu 500gr,Jantung 1kg'),
(78, '2024-04-25', 'Boss sosis Sapi 500gr,Crispy Chicken Nugget 120gr'),
(79, '2024-04-25', 'Kentang Harvest 1kg,Sosis Sapi isi 20'),
(80, '2024-04-25', 'Kentang Harvest 1kg,Iga Gondrong 1kg'),
(81, '2024-04-25', 'Iga Gondrong 1kg,Steak Ribeyae 1kg'),
(82, '2024-04-24', 'Kentang Harvest 1kg,Boss sosis Sapi 500gr,Sosis Sapi isi 12'),
(83, '2024-04-24', 'Rendang Dadu 500gr,Meltique Tenderloin 1kg,Kibif Bakso Super 600gr,Boss sosis Sapi 500gr,Sosis Sapi isi 12,Nugget Boss 1kg,Kentang Harvest 1kg,Champ Chicken Nugget 250g'),
(84, '2024-04-24', 'Kentang Harvest 1kg,Bakso gepeng isi 50,Boss sosis Sapi 500gr,Sosis Sapi isi 20'),
(85, '2024-04-24', 'Boss sosis Sapi 500gr,Kentang Harvest 1kg'),
(86, '2024-04-24', 'Ayam Utuh 800gr,Slice Yoshinoya Grad B 500gr,Boss sosis Sapi 500gr'),
(87, '2024-04-24', 'Fish Dumpling Chicken 500gr,Sosis Sapi isi 12,Kentang Harvest 1kg'),
(88, '2024-04-24', 'Kentang Harvest 1kg,Rendang Dadu 500gr,Bola Salmon 500gr,Boss sosis Sapi 500gr,Sosis Sapi isi 12'),
(89, '2024-04-24', 'Fish Dumpling Chicken 500gr,Sosis Sapi isi 20'),
(90, '2024-04-24', 'Bakso gepeng isi 50,Nugget Boss 1kg,Kibif Bakso Super 600gr,Kentang Harvest 1kg,Sosis Sapi isi 20'),
(91, '2024-04-24', 'Boss sosis Sapi 500gr,Chicken Cordon Blue'),
(92, '2024-04-24', 'Kentang Harvest 1kg,Fish Dumpling Chicken 500gr'),
(93, '2024-04-24', 'Bola Salmon 500gr,Jantung 1kg,Nugget Boss 1kg,Otak Otak Ikan 500gr,Sosis Sapi isi 12,Sosis Sapi isi 20'),
(94, '2024-04-24', 'Iga Bakar Premium,Iga Sop Mix 1kg,Slice Teriaki Low Fat 500gr'),
(95, '2024-04-24', 'Ayam Utuh 700gr,Boss sosis Sapi 500gr'),
(96, '2024-04-24', 'Kentang Harvest 1kg,Boss sosis Sapi 500gr,Jantung 1kg,Nugget Boss 1kg,Fish Dumpling Cheese 500gr'),
(97, '2024-04-24', 'Kentang Harvest 1kg,Boss sosis Sapi 500gr,Sosis Sapi isi 12'),
(98, '2024-04-24', 'Iga Gondrong 1kg,Slice Yosinoya Premium 500gr,Boss sosis Sapi 500gr,Sosis Sapi isi 12'),
(99, '2024-04-23', 'Empal 500gr,Kanzler Crispy Chicken Nugget 450gr'),
(100, '2024-04-23', 'Boss sosis Sapi 500gr,Kentang Harvest 1kg,Sosis Sapi isi 12,Boss sosis Sapi 500gr'),
(101, '2024-04-23', 'Boss sosis Sapi 500gr,Crispy Chicken Nugget 120gr'),
(102, '2024-04-23', 'Murato Boss Chicken Nugget,Sosis Sapi isi 12'),
(103, '2024-04-23', 'Kanzler Crispy Chicken Nugget 450gr,Empal 500gr'),
(104, '2024-04-23', 'Nugget Boss 1kg,Kentang Crincle 1kg,Kentang Harvest 1kg'),
(105, '2024-04-23', 'Iga Gondrong 1kg,Ayam Utuh 800gr'),
(106, '2024-04-23', 'Crispy Chicken Nugget 120gr,Kentang Harvest 1kg'),
(107, '2024-04-23', 'Boss sosis Sapi 500gr,Ayam Utuh 800gr'),
(108, '2024-04-23', 'Iga Gondrong 1kg,Begok Bebek Bakar Premium,Champ Chicken Nugget 250g'),
(109, '2024-04-23', 'Rawon 1kg,Empal 500gr,Iga Gondrong 1kg'),
(110, '2024-04-23', 'Daging Rendang Utuh 1kg,Rawon 1kg'),
(111, '2024-04-23', 'Boss sosis Sapi 500gr,Fish Dumpling Cheese 500gr,Otak Otak Ikan 500gr'),
(112, '2024-04-23', 'Boss sosis Sapi 500gr,Rendang Dadu 500gr,Kentang Harvest 1kg'),
(113, '2024-04-23', 'Kentang Harvest 1kg,Fish Dumpling Chicken 500gr,Fish Dumpling Cheese 500gr'),
(114, '2024-04-23', 'Boss sosis Sapi 500gr,Meltique Tenderloin 1kg'),
(115, '2024-04-23', 'Bakso gepeng isi 50,Nugget Boss 1kg,Sosis Sapi isi 12'),
(116, '2024-04-23', 'Boss sosis Sapi 500gr,Kentang Harvest 1kg'),
(117, '2024-04-22', 'Boss sosis Sapi 500gr,Iga Super 1kg'),
(118, '2024-04-22', 'Fish Dumpling Chicken 500gr,Rendang Dadu 500gr,Jantung 1kg'),
(119, '2024-04-22', 'Boss sosis Sapi 500gr,Crispy Chicken Nugget 120gr,Hati Sapi 1kg'),
(120, '2024-04-22', 'Kentang Harvest 1kg,Hati Sapi 1kg'),
(121, '2024-04-22', 'Kentang Harvest 1kg,Iga Gondrong 1kg'),
(122, '2024-04-22', 'Iga Gondrong 1kg,Steak Ribeyae 1kg'),
(123, '2024-04-22', 'Kentang Harvest 1kg,Boss sosis Sapi 500gr,Sosis Sapi isi 12,Champ Chicken Nugget 250g'),
(124, '2024-04-22', 'Rendang Dadu 500gr,Meltique Tenderloin 1kg,Kibif Bakso Super 600gr,Boss sosis Sapi 500gr,Sosis Sapi isi 12,Nugget Boss 1kg,Kentang Harvest 1kg'),
(125, '2024-04-22', 'Slice Yoshinoya Grad B 500gr,Hati Sapi 1kg'),
(126, '2024-04-22', 'Kentang Harvest 1kg,Bakso gepeng isi 50,Boss sosis Sapi 500gr'),
(127, '2024-04-22', 'Boss sosis Sapi 500gr,Kentang Harvest 1kg,Sosis Sapi isi 20'),
(128, '2024-04-22', 'Ayam Utuh 800gr,Slice Yoshinoya Grad B 500gr,Boss sosis Sapi 500gr'),
(129, '2024-04-21', 'Fish Dumpling Chicken 500gr,Sosis Sapi isi 12,Kentang Harvest 1kg'),
(130, '2024-04-21', 'Kentang Harvest 1kg,Rendang Dadu 500gr,Bola Salmon 500gr,Boss sosis Sapi 500gr,Sosis Sapi isi 12'),
(131, '2024-04-21', 'Bakso gepeng isi 50,Nugget Boss 1kg,Kibif Bakso Super 600gr,Kentang Harvest 1kg,Hati Sapi 1kg'),
(132, '2024-04-21', 'Boss sosis Sapi 500gr,Chicken Cordon Blue'),
(133, '2024-04-21', 'Kentang Harvest 1kg,Fish Dumpling Chicken 500gr'),
(134, '2024-04-21', 'Bola Salmon 500gr,Jantung 1kg,Nugget Boss 1kg,Otak Otak Ikan 500gr,Sosis Sapi isi 12'),
(135, '2024-04-21', 'Iga Bakar Premium,Iga Sop Mix 1kg,Slice Teriaki Low Fat 500gr'),
(136, '2024-04-21', 'Ayam Utuh 700gr,Boss sosis Sapi 500gr'),
(137, '2024-04-21', 'Kentang Harvest 1kg,Boss sosis Sapi 500gr,Jantung 1kg,Nugget Boss 1kg,Fish Dumpling Cheese 500gr,Hati Sapi 1kg'),
(138, '2024-04-21', 'Kentang Harvest 1kg,Boss sosis Sapi 500gr,Sosis Sapi isi 12'),
(139, '2024-04-21', 'Iga Gondrong 1kg,Slice Yosinoya Premium 500gr,Boss sosis Sapi 500gr,Sosis Sapi isi 12'),
(140, '2024-04-21', 'Rawon 1kg,Nugget Boss 1kg,Otak Otak Ikan 500gr'),
(141, '2024-04-21', 'Hati Sapi 1kg,Cingur 500gr,Iga Gondrong 1kg,Jantung 1kg'),
(142, '2024-04-21', 'Essem Kornet 450gr,Murato Boss Chicken Nugget'),
(143, '2024-04-21', 'Nugget Boss 1kg,Slice Yosinoya Premium 500gr,Kanzler Ori Nugget 450gr,Kentang Harvest 1kg,Champ Chicken Nugget 250g'),
(144, '2024-04-21', 'Iga Gondrong 1kg,Sosis Sapi isi 20'),
(145, '2024-04-19', 'Kentang Harvest 1kg,Sosis Sapi isi 20'),
(146, '2024-04-19', 'Kentang Harvest 1kg,Boss sosis Sapi 500gr'),
(147, '2024-04-19', 'Kentang Harvest 1kg,Boss sosis Sapi 500gr,Steak Ribeyae 1kg,Fish Dumpling Cheese 500gr'),
(148, '2024-04-19', 'Kentang Harvest 1kg,Fish Dumpling Cheese 500gr'),
(149, '2024-04-19', 'Boss sosis Sapi 500gr,Kentang Harvest 1kg'),
(150, '2024-04-19', 'Boss sosis Sapi 500gr,Kentang Harvest 1kg,Sosis Sapi isi 12,Nugget Boss 1kg'),
(151, '2024-04-19', 'Essem Kornet 450gr,Kanzler Ori Nugget 450gr'),
(152, '2024-04-19', 'Kentang Harvest 1kg,Hati Sapi 1kg'),
(153, '2024-04-19', 'Kentang Harvest 1kg,Cumi Tube 1kg,Bola Salmon 500gr,Sosis Sapi isi 20'),
(154, '2024-04-19', 'Kentang Harvest 1kg,Boss sosis Sapi 500gr'),
(155, '2024-04-18', 'Kentang Harvest 1kg,Boss sosis Sapi 500gr'),
(156, '2024-04-18', 'Kentang Harvest 1kg,Fish Dumpling Cheese 500gr'),
(157, '2024-04-18', 'Boss sosis Sapi 500gr,Kentang Harvest 1kg'),
(158, '2024-04-18', 'Kentang Harvest 1kg,Sosis Sapi isi 12,Nugget Boss 1kg'),
(159, '2024-04-18', 'Essem Kornet 450gr,Kanzler Ori Nugget 450gr'),
(160, '2024-04-18', 'Kentang Harvest 1kg,Cumi Tube 1kg,Bola Salmon 500gr'),
(161, '2024-04-18', 'Slice Yosinoya Premium 500gr,Slice Yoshinoya Grad B 500gr'),
(162, '2024-04-18', 'Boss sosis Sapi 500gr,Cumi Tube 1kg,Bandeng Presto'),
(163, '2024-04-18', 'Boss sosis Sapi 500gr,Kentang Harvest 1kg,Sosis Sapi isi 12'),
(164, '2024-04-18', 'Kentang Harvest 1kg,Steak Ribeyae 1kg'),
(165, '2024-04-18', 'Fish Dumpling Chicken 500gr,Sosis Sapi isi 12,Tulang Sum-Sum 1kg'),
(166, '2024-04-17', 'Murato Boss Chicken Nugget,Baso Urat isi 50 700gr'),
(167, '2024-04-17', 'Kentang Harvest 1kg,Boss sosis Sapi 500gr,Sosis Sapi isi 12,Nugget Boss 1kg'),
(168, '2024-04-17', 'Jantung 1kg,Cingur 500gr,Nugget Boss 1kg'),
(169, '2024-04-15', 'Boss sosis Sapi 500gr,Kentang Harvest 1kg'),
(170, '2024-04-15', 'Slice Yoshinoya Grad B 500gr,Champ Chicken Nugget 250g'),
(171, '2024-04-15', 'Ayam Utuh 700gr,Boss sosis Sapi 500gr,Sosis Sapi isi 12'),
(172, '2024-04-15', 'Baso Urat isi 50 700gr,Kikil Kaki 1kg'),
(173, '2024-04-15', 'Boss sosis Sapi 500gr,Baso Urat isi 50 700gr,Sosis Sapi isi 20'),
(174, '2024-04-15', 'Kentang Harvest 1kg,Boss sosis Sapi 500gr,Sosis Sapi isi 12'),
(175, '2024-04-15', 'Boss sosis Sapi 500gr,Kentang Harvest 1kg'),
(176, '2024-04-15', 'Boss sosis Sapi 500gr,Kentang Harvest 1kg'),
(177, '2024-04-15', 'Baso Urat isi 50 700gr,Boss sosis Sapi 500gr,Fish Dumpling Cheese 500gr'),
(178, '2024-04-15', 'Boss sosis Sapi 500gr,Kentang Harvest 1kg'),
(179, '2024-04-14', 'Sosis Sapi isi 12,Boss sosis Sapi 500gr'),
(180, '2024-04-14', 'Boss sosis Sapi 500gr,Kentang Harvest 1kg,Steak Ribeyae 1kg'),
(181, '2024-04-14', 'Boss sosis Sapi 500gr,Kentang Harvest 1kg'),
(182, '2024-04-14', 'Boss sosis Sapi 500gr,Fish Dumpling Chicken 500gr,Kentang Harvest 1kg'),
(183, '2024-04-14', 'Kentang Harvest 1kg,Bakso gepeng isi 50,Kibif Bakso Super 600gr'),
(184, '2024-04-14', 'Boss sosis Sapi 500gr,Baso Urat isi 50 700gr'),
(185, '2024-04-14', 'Fish Dumpling Chicken 500gr,Bola Salmon 500gr,Kentang Harvest 1kg'),
(186, '2024-04-14', 'Boss sosis Sapi 500gr,Begok Bebek Bakar Premium'),
(187, '2024-04-14', 'Kentang Harvest 1kg,Fish Dumpling Chicken 500gr,Bola Salmon 500gr,Nugget Boss 1kg,Otak Otak Ikan 500gr'),
(188, '2024-04-14', 'Kentang Harvest 1kg,Chicken Cordon Blue,Baso Urat isi 50 700gr'),
(189, '2024-04-14', 'Kentang Harvest 1kg,Boss sosis Sapi 500gr,Sosis Sapi isi 12,Sosis Sapi isi 20'),
(190, '2024-04-12', 'Kentang Harvest 1kg,Tulang Sum-Sum 1kg,Champ Chicken Nugget 250g'),
(191, '2024-04-12', 'Kentang Harvest 1kg,Kibif Bakso Super 600gr'),
(192, '2024-04-12', 'Iga Konro Bakar,Slice Teriaki Low Fat 500gr,Iga Gondrong 1kg'),
(193, '2024-04-12', 'Kanzler Ori Nugget 450gr,Rendang Dadu 500gr,Kentang Harvest 1kg'),
(194, '2024-04-12', 'Begok Bebek Bakar Premium,Champ Chicken Nugget 250g'),
(195, '2024-04-11', 'Boss sosis Sapi 500gr,Kentang Harvest 1kg,Steak Ribeyae 1kg'),
(196, '2024-04-11', 'Begok Bebek Bakar Premium,Tetelan Sapi 1kg'),
(197, '2024-04-11', 'Iga Sop Mix 1kg,Tetelan Sop Super,Ayam Utuh 800gr'),
(198, '2024-04-11', 'Ayam Utuh 800gr,Baso Urat isi 50 700gr'),
(199, '2024-04-11', 'Ayam Utuh 800gr,Nugget Boss 1kg,Kentang Harvest 1kg'),
(200, '2024-04-10', 'Fish Dumpling Chicken 500gr,Tetelan Sop Super'),
(201, '2024-04-10', 'Champ Chicken Nugget 250g,Baso Urat isi 50 700gr,Fish Dumpling Cheese 500gr'),
(202, '2024-04-10', 'Sosis Sapi isi 12,Nugget Boss 1kg'),
(203, '2024-04-10', 'Cingur 500gr,Tulang Sum-Sum 1kg'),
(204, '2024-04-10', 'Bakso gepeng isi 50,Rendang Dadu 500gr,Champ Chicken Nugget 250g'),
(205, '2024-04-09', 'Kentang Harvest 1kg,Nugget Boss 1kg,Champ Chicken Nugget 250g'),
(206, '2024-04-09', 'Boss sosis Sapi 500gr,Sosis Sapi isi 12,Nugget Boss 1kg'),
(207, '2024-04-09', 'Kentang Harvest 1kg,Tulang Sum-Sum 1kg'),
(208, '2024-04-09', 'Ayam Utuh 700gr,Tulang Sum-Sum 1kg'),
(209, '2024-04-08', 'Baso Urat isi 50 700gr,Slice Yosinoya Premium 500gr,Tetelan Sop Super,Nugget Boss 1kg,Kentang Harvest 1kg,Sosis Sapi isi 12'),
(210, '2024-04-08', 'Kentang Harvest 1kg,Nugget Boss 1kg,Otak Otak Ikan 500gr'),
(211, '2024-04-08', 'Cingur 500gr,Meltique Tenderloin 1kg,Steak Ribeyae 1kg,Champ Chicken Nugget 250g'),
(212, '2024-04-08', 'Nugget Boss 1kg,Otak Otak Ikan 500gr,Sosis Sapi isi 12'),
(213, '2024-04-08', 'Sosis Sapi isi 12,Nugget Boss 1kg,Otak Otak Ikan 500gr'),
(214, '2024-04-08', 'Kentang Harvest 1kg,Bola Salmon 500gr,Nugget Boss 1kg'),
(215, '2024-04-07', 'Kentang Harvest 1kg,Fish Dumpling Chicken 500gr,Nugget Boss 1kg,Otak Otak Ikan 500gr,Sosis Sapi isi 20'),
(216, '2024-04-07', 'Meltique Tenderloin 1kg,Nugget Boss 1kg,Kentang Harvest 1kg,Sosis Sapi isi 12,Boss sosis Sapi 500gr'),
(217, '2024-04-07', 'Slice Teriaki Low Fat 500gr,Fish Dumpling Cheese 500gr,Rendang Dadu 500gr,Nugget Boss 1kg,Otak Otak Ikan 500gr,Sosis Sapi isi 12'),
(218, '2024-04-07', 'Ayam Utuh 700gr,Daging Rendang Utuh 1kg'),
(219, '2024-04-07', 'Daging Rendang Utuh 1kg,Cumi Flower 1kg,Iga Super 1kg'),
(220, '2024-04-05', 'Nugget Boss 1kg,Murato Boss Chicken Nugget,Fish Dumpling Cheese 500gr,Sosis Sapi isi 12'),
(221, '2024-04-05', 'Rawon 1kg,Tetelan Sapi 1kg,Bandeng Presto'),
(222, '2024-04-05', 'Tetelan Sop Super,Nugget Boss 1kg'),
(223, '2024-04-04', 'Otak Otak Ikan 500gr,Boss sosis Sapi 500gr,Murato Boss Chicken Nugget,Yomas Spicy Wings 500gr'),
(224, '2024-04-04', 'Sosis Sapi isi 20,Nugget Boss 1kg,Kentang Harvest 1kg,Otak Otak Ikan 500gr'),
(225, '2024-04-04', 'Rawon 1kg,Rendang Dadu 500gr,Hati Sapi 1kg,Champ Chicken Nugget 250g'),
(226, '2024-04-04', 'Kentang Harvest 1kg,Crispy Chicken Nugget 120gr,Baso Urat isi 50 700gr,Sosis Sapi isi 12'),
(227, '2024-04-03', 'Slice Yosinoya Premium 500gr,Ayam Utuh 800gr,Fish Dumpling Cheese 500gr'),
(228, '2024-04-03', 'Rawon 1kg,Slice Yoshinoya Grad B 500gr,Hati Sapi 1kg'),
(229, '2024-04-03', 'Kentang Harvest 1kg,Buntut Center Cut 500gr,Hati Sapi 1kg'),
(230, '2024-04-03', 'Kibif Bakso Super 600gr,Baso Urat isi 50 700gr'),
(231, '2024-04-03', 'Bakso Cumi 500gr,Bola Salmon 500gr'),
(232, '2024-04-02', 'Boss sosis Sapi 500gr,Nugget Boss 1kg,Hati Sapi 1kg'),
(233, '2024-04-02', 'Rawon 1kg,Ayam Utuh 700gr'),
(234, '2024-04-02', 'Boss sosis Sapi 500gr,Fish Dumpling Chicken 500gr'),
(235, '2024-04-02', 'Rawon 1kg,Hati Sapi 1kg,Sosis Sapi isi 20'),
(236, '2024-04-02', 'Lamb Leg 1kg,Cumi Tube 1kg'),
(237, '2024-04-01', 'Kentang Harvest 1kg,Hati Sapi 1kg'),
(238, '2024-04-01', 'Fish Dumpling Chicken 500gr,Bakso gepeng isi 50,Champ Chicken Nugget 250g'),
(239, '2024-04-01', 'Boss sosis Sapi 500gr,Kanzler Crispy Chicken Nugget 450gr,Nugget Boss 1kg,Fish Dumpling Cheese 500gr,Champ Chicken Nugget 250g'),
(240, '2024-04-01', 'Kentang Harvest 1kg,Buntut Center Cut 500gr'),
(241, '2024-04-01', 'Kentang Harvest 1kg,Buntut Center Lokal 1kg,Champ Chicken Nugget 250g'),
(242, '2024-04-01', 'Fish Dumpling Chicken 500gr,Hati Sapi 1kg'),
(243, '2024-04-01', 'Bakso gepeng isi 50,Buntut Center Lokal 1kg'),
(244, '2024-04-01', 'Tetelan Sop Super,Sosis Sapi isi 20,Champ Chicken Nugget 250g'),
(245, '2024-04-01', 'Otak Otak Ikan 500gr,Boss sosis Sapi 500gr,Murato Boss Chicken Nugget,Yomas Spicy Wings 500gr,Champ Chicken Nugget 250g'),
(246, '2024-03-31', 'Boss sosis Sapi 500gr,Otak Otak Ikan 500gr,Nugget Boss 1kg,Fish Dumpling Cheese 500gr,Kentang Harvest 1kg'),
(247, '2024-03-31', 'Hati Sapi 1kg,Kentang Harvest 1kg,Iga Gondrong 1kg'),
(248, '2024-03-31', 'Iga Gondrong 1kg,Hati Sapi 1kg,Cingur 500gr,Iga Sop Mix 1kg'),
(249, '2024-03-31', 'Otak Otak Ikan 500gr,Bakso gepeng isi 50'),
(250, '2024-03-31', 'Otak Otak Ikan 500gr,Boss sosis Sapi 500gr,Essem Kornet 450gr,Fish Dumpling Cheese 500gr'),
(251, '2024-03-31', 'Otak Otak Ikan 500gr,Nugget Boss 1kg,Murato Boss Chicken Nugget,Sosis Sapi isi 12'),
(252, '2024-03-31', 'Bakso gepeng isi 50,Kentang Crincle 1kg,Champ Chicken Nugget 250g'),
(253, '2024-03-31', 'Sosis Sapi isi 12,Boss sosis Sapi 500gr,Kanzler Ori Nugget 450gr'),
(254, '2024-03-31', 'Begok Bebek Bakar Premium,Begok Ayam Bakar Premium'),
(255, '2024-03-31', 'Iga Bakar Premium,Kentang Crincle 1kg'),
(256, '2024-03-30', 'Iga Bakar Premium,Iga Konro Bakar,Tulang Sum-Sum 1kg'),
(257, '2024-03-30', 'Tetelan Sop Super,Tetelan Sapi 1kg'),
(258, '2024-03-30', 'Otak Otak Ikan 500gr,Boss sosis Sapi 500gr,Bakso Cumi 500gr,Fish Dumpling Cheese 500gr'),
(259, '2024-03-30', 'Otak Otak Ikan 500gr,Sosis Sapi isi 12,Champ Chicken Nugget 250g,Murato Boss Chicken Nugget'),
(260, '2024-03-30', 'Sosis Sapi isi 20,Champ Chicken Nugget 250g,Cumi Flower 1kg,Fish Dumpling Cheese 500gr,Bola Salmon 500gr,Slice Yoshinoya Grad B 500gr'),
(261, '2024-03-30', 'Bakso gepeng isi 50,Champ Chicken Nugget 250g,Boss sosis Sapi 500gr,Bandeng Presto'),
(262, '2024-03-30', 'Iga Konro Bakar,Ayam Utuh 700gr,Empal 500gr'),
(263, '2024-03-30', 'Ayam Utuh 700gr,Daging Rendang Utuh 1kg'),
(264, '2024-03-30', 'Daging Rendang Utuh 1kg,Cumi Flower 1kg,Iga Super 1kg'),
(265, '2024-03-30', 'Nugget Boss 1kg,Murato Boss Chicken Nugget,Fish Dumpling Cheese 500gr,Sosis Sapi isi 12'),
(266, '2024-03-30', 'Rawon 1kg,Tetelan Sapi 1kg,Bandeng Presto'),
(267, '2024-03-30', 'Tetelan Sop Super,Nugget Boss 1kg'),
(268, '2024-03-28', 'Otak Otak Ikan 500gr,Boss sosis Sapi 500gr,Murato Boss Chicken Nugget,Yomas Spicy Wings 500gr'),
(269, '2024-03-28', 'Sosis Sapi isi 20,Nugget Boss 1kg,Kentang Harvest 1kg,Otak Otak Ikan 500gr'),
(270, '2024-03-28', 'Rawon 1kg,Rendang Dadu 500gr'),
(271, '2024-03-28', 'Kentang Harvest 1kg,Crispy Chicken Nugget 120gr,Baso Urat isi 50 700gr,Sosis Sapi isi 12'),
(272, '2024-03-28', 'Slice Yosinoya Premium 500gr,Ayam Utuh 800gr,Fish Dumpling Cheese 500gr'),
(273, '2024-03-28', 'Rawon 1kg,Slice Yoshinoya Grad B 500gr'),
(274, '2024-03-28', 'Kentang Harvest 1kg,Buntut Center Cut 500gr'),
(275, '2024-03-27', 'Kibif Bakso Super 600gr,Ikan Dori 1kg'),
(276, '2024-03-27', 'Bakso Cumi 500gr,Bola Salmon 500gr'),
(277, '2024-03-27', 'Boss sosis Sapi 500gr,Nugget Boss 1kg'),
(278, '2024-03-27', 'Rawon 1kg,Ayam Utuh 700gr'),
(279, '2024-03-27', 'Boss sosis Sapi 500gr,Fish Dumpling Chicken 500gr'),
(280, '2024-03-27', 'Lamb Leg 1kg,Cumi Tube 1kg'),
(281, '2024-03-27', 'Fish Dumpling Chicken 500gr,Bakso gepeng isi 50'),
(282, '2024-03-27', 'Boss sosis Sapi 500gr,Kanzler Crispy Chicken Nugget 450gr,Nugget Boss 1kg,Fish Dumpling Cheese 500gr'),
(283, '2024-03-27', 'Kentang Harvest 1kg,Buntut Center Cut 500gr'),
(284, '2024-03-27', 'Kentang Harvest 1kg,Buntut Center Lokal 1kg'),
(285, '2024-03-27', 'Bakso gepeng isi 50,Buntut Center Lokal 1kg'),
(286, '2024-03-27', 'Rawon 1kg,Iga Sop Mix 1kg,Tulang Sum-Sum 1kg'),
(287, '2024-03-26', 'Kanzler Crispy Chicken Nugget 450gr,Chicken Cordon Blue'),
(288, '2024-03-26', 'Kentang Harvest 1kg,Steak Ribeyae 1kg,Boss sosis Sapi 500gr,Kanzler Ori Nugget 450gr,Sosis Sapi isi 12'),
(289, '2024-03-26', 'Bakso gepeng isi 50,Sosis Sapi isi 20'),
(290, '2024-03-26', 'Kentang Harvest 1kg,Otak Otak Ikan 500gr,Boss sosis Sapi 500gr,Sosis Sapi isi 12'),
(291, '2024-03-26', 'Begok Ayam Bakar Premium,Buntut Center Lokal 1kg'),
(292, '2024-03-25', 'Daging Rendang Utuh 1kg,Nugget Boss 1kg,Kentang Harvest 1kg'),
(293, '2024-03-25', 'Kentang Harvest 1kg,Otak Otak Ikan 500gr'),
(294, '2024-03-25', 'Rawon 1kg,Rendang Dadu 500gr'),
(295, '2024-03-25', 'Kentang Harvest 1kg,Nugget Boss 1kg'),
(296, '2024-03-25', 'Sosis Sapi isi 12,Otak Otak Ikan 500gr,Boss sosis Sapi 500gr'),
(297, '2024-03-24', 'Boss sosis Sapi 500gr,Bakso gepeng isi 50'),
(298, '2024-03-24', 'Rawon 1kg,Rendang Dadu 500gr,Jantung 1kg'),
(299, '2024-03-23', 'Boss sosis Sapi 500gr,Ayam Utuh 700gr'),
(300, '2024-03-23', 'Slice Yoshinoya Grad B 500gr,Cumi Flower 1kg,Yomas Spicy Wings 500gr,Murato Boss Chicken Nugget,Kentang Crincle 1kg'),
(301, '2024-03-23', 'Boss sosis Sapi 500gr,Sosis Sapi isi 12'),
(302, '2024-03-23', 'Daging Rendang Utuh 1kg,Steak Ribeyae 1kg,Ayam Utuh 800gr,Empal 500gr'),
(303, '2024-03-23', 'Cingur 500gr,Steak Ribeyae 1kg'),
(304, '2024-03-23', 'Slice Teriaki Low Fat 500gr,Begok Bebek Goreng Premium,Nugget Boss 1kg'),
(305, '2024-03-23', 'Iga Gondrong 1kg,Ayam Utuh 800gr'),
(306, '2024-03-21', 'Fish Dumpling Chicken 500gr,Crispy Chicken Nugget 120gr'),
(307, '2024-03-21', 'Kentang Harvest 1kg,Bakso gepeng isi 50'),
(308, '2024-03-21', 'Rawon 1kg,Tetelan Sop Super'),
(309, '2024-03-21', 'Begok Bebek Goreng Premium,Iga Gondrong 1kg'),
(310, '2024-03-21', 'Rawon 1kg,Boss sosis Sapi 500gr,Sosis Sapi isi 12'),
(311, '2024-03-21', 'Bakso gepeng isi 50,Sosis Sapi isi 20,Kanzler Crispy Chicken Nugget 450gr'),
(312, '2024-03-20', 'Bakso Cumi 500gr,Crispy Chicken Nugget 120gr'),
(313, '2024-03-20', 'Slice Teriaki Low Fat 500gr,Kibif Bakso Super 600gr,Ayam Utuh 700gr,Buntut Center Lokal 1kg'),
(314, '2024-03-20', 'Bandeng Presto,Chicken Cordon Blue'),
(315, '2024-03-19', 'Bakso gepeng isi 50,Kentang Harvest 1kg'),
(316, '2024-03-19', 'Rawon 1kg,Steak Ribeyae 1kg'),
(317, '2024-03-19', 'Ayam Utuh 800gr,Boss sosis Sapi 500gr,Sosis Sapi isi 12'),
(318, '2024-03-19', 'Kentang Crincle 1kg,Iga Gondrong 1kg,Boss sosis Sapi 500gr,Paru Sapi 1kg,Ayam Utuh 700gr'),
(319, '2024-03-19', 'Rawon 1kg,Steamboat 500gr,Saikoro 500gr'),
(320, '2024-03-19', 'Empal 500gr,Cingur 500gr'),
(321, '2024-03-19', 'Bakso gepeng isi 50,Kentang Harvest 1kg'),
(322, '2024-03-19', 'Lamb Leg 1kg,Buntut Center Lokal 1kg'),
(323, '2024-03-19', 'Fish Dumpling Chicken 500gr,Sosis Sapi isi 12,Empal 500gr'),
(324, '2024-03-19', 'Crispy Chicken Nugget 120gr,Kentang Harvest 1kg,Rendang Dadu 500gr'),
(325, '2024-03-18', 'Iga Gondrong 1kg,Boss sosis Sapi 500gr,Sosis Sapi isi 12,Kentang Harvest 1kg'),
(326, '2024-03-18', 'Iga Sop Mix 1kg,Iga Super 1kg'),
(327, '2024-03-18', 'Slice Yosinoya Premium 500gr,Steamboat 500gr'),
(328, '2024-03-18', 'Sosis Sapi isi 12,Boss sosis Sapi 500gr,Kentang Harvest 1kg'),
(329, '2024-03-18', 'Daging Rendang Utuh 1kg,Begok Ayam Bakar Premium'),
(330, '2024-03-18', 'Sosis Sapi isi 12,Saikoro 500gr'),
(331, '2024-03-18', 'Empal 500gr,Rawon 1kg'),
(332, '2024-03-18', 'Jantung 1kg,Fish Dumpling Cheese 500gr'),
(333, '2024-03-18', 'Kentang Harvest 1kg,Begok Ayam Bakar Premium'),
(334, '2024-03-18', 'Boss sosis Sapi 500gr,Iga Super 1kg'),
(335, '2024-03-17', 'Essem Kornet 450gr,Chicken Cordon Blue,Bola Salmon 500gr'),
(336, '2024-03-17', 'Empal 500gr,Kentang Crincle 1kg,Rawon 1kg'),
(337, '2024-03-17', 'Begok Bebek Goreng Premium,Begok Bebek Bakar Premium'),
(338, '2024-03-17', 'Bandeng Presto,Iga Bakar Premium'),
(339, '2024-03-16', 'Fish Dumpling Chicken 500gr,Bakso Cumi 500gr'),
(340, '2024-03-16', 'Rawon 1kg,Iga Bakar Premium'),
(341, '2024-03-16', 'Iga Sop Mix 1kg,Bakso Cumi 500gr,Slice Teriaki Low Fat 500gr,Fish Dumpling Cheese 500gr'),
(342, '2024-03-16', 'Tulang Sum-Sum 1kg,Rawon 1kg,Iga Gondrong 1kg,Jantung 1kg,Hati Sapi 1kg'),
(343, '2024-03-16', 'Ayam Utuh 800gr,Kentang Harvest 1kg,Sosis Sapi isi 12'),
(344, '2024-03-16', 'Boss sosis Sapi 500gr,Kentang Harvest 1kg'),
(345, '2024-03-16', 'Iga Sop Mix 1kg,Paru Sapi 1kg,Rawon 1kg,Iga Gondrong 1kg,Tetelan Sop Super,Begok Bebek Bakar Premium,Begok Bebek Goreng Premium,Empal 500gr'),
(346, '2024-03-16', 'Kentang Harvest 1kg,Sosis Sapi isi 12'),
(347, '2024-03-14', 'Nugget Boss 1kg,Sosis Sapi isi 12,Kentang Harvest 1kg'),
(348, '2024-03-14', 'Nugget Boss 1kg,Chicken Cordon Blue,Sosis Sapi isi 12,Iga Bakar Premium'),
(349, '2024-03-14', 'Boss sosis Sapi 500gr,Crispy Chicken Nugget 120gr'),
(350, '2024-03-14', 'Boss sosis Sapi 500gr,Nugget Boss 1kg'),
(351, '2024-03-13', 'Yomas Spicy Wings 500gr,Crispy Chicken Nugget 120gr,Chicken Cordon Blue'),
(352, '2024-03-13', 'Fish Dumpling Chicken 500gr,Kentang Harvest 1kg'),
(353, '2024-03-13', 'Iga Gondrong 1kg,Slice Yoshinoya Grad B 500gr'),
(354, '2024-03-13', 'Ayam Utuh 800gr,Kanzler Crispy Chicken Nugget 450gr'),
(355, '2024-03-13', 'Ayam Utuh 800gr,Empal 500gr'),
(356, '2024-03-13', 'Bakso Cumi 500gr,Sosis Sapi isi 12'),
(357, '2024-03-13', 'Boss sosis Sapi 500gr,Kentang Harvest 1kg,Sosis Sapi isi 12,Iga Bakar Premium'),
(358, '2024-03-13', 'Tetelan Sop Super,Iga Super 1kg'),
(359, '2024-03-13', 'Bandeng Presto,Hati Sapi 1kg,Jantung 1kg'),
(360, '2024-03-12', 'Boss sosis Sapi 500gr,Crispy Chicken Nugget 120gr'),
(361, '2024-03-12', 'Boss sosis Sapi 500gr,Ayam Utuh 800gr'),
(362, '2024-03-12', 'Rendang Dadu 500gr,Begok Bebek Goreng Premium,Steamboat 500gr,Begok Bebek Bakar Premium,Baso Urat isi 50 700gr,Nugget Boss 1kg,Empal 500gr'),
(363, '2024-03-12', 'Boss sosis Sapi 500gr,Bola Salmon 500gr'),
(364, '2024-03-12', 'Murato Boss Chicken Nugget,Sosis Sapi isi 12'),
(365, '2024-03-11', 'Kanzler Crispy Chicken Nugget 450gr,Empal 500gr'),
(366, '2024-03-11', 'Nugget Boss 1kg,Kentang Crincle 1kg,Kentang Harvest 1kg'),
(367, '2024-03-11', 'Rendang Dadu 500gr,Cingur 500gr'),
(368, '2024-03-11', 'Rawon 1kg,Rendang Dadu 500gr'),
(369, '2024-03-11', 'Iga Gondrong 1kg,Ayam Utuh 800gr'),
(370, '2024-03-11', 'Iga Gondrong 1kg,Ayam Utuh 700gr'),
(371, '2024-03-11', 'Crispy Chicken Nugget 120gr,Kentang Harvest 1kg'),
(372, '2024-03-11', 'Boss sosis Sapi 500gr,Ayam Utuh 800gr'),
(373, '2024-03-11', 'Iga Gondrong 1kg,Rendang Dadu 500gr'),
(374, '2024-03-11', 'Iga Gondrong 1kg,Begok Bebek Bakar Premium'),
(375, '2024-03-11', 'Crispy Chicken Nugget 120gr,Boss sosis Sapi 500gr'),
(376, '2024-03-10', 'Rawon 1kg,Empal 500gr,Iga Gondrong 1kg'),
(377, '2024-03-10', 'Rawon 1kg,Iga Gondrong 1kg'),
(378, '2024-03-10', 'Daging Rendang Utuh 1kg,Rawon 1kg'),
(379, '2024-03-10', 'Baso Urat isi 50 700gr,Nugget Boss 1kg'),
(380, '2024-03-09', 'Boss sosis Sapi 500gr,Begok Bebek Goreng Premium,Otak Otak Ikan 500gr'),
(381, '2024-03-09', 'Boss sosis Sapi 500gr,Rendang Dadu 500gr,Kentang Harvest 1kg'),
(382, '2024-03-09', 'Kentang Harvest 1kg,Fish Dumpling Chicken 500gr,Fish Dumpling Cheese 500gr'),
(383, '2024-03-09', 'Boss sosis Sapi 500gr,Sosis Sapi isi 12,Fish Dumpling Chicken 500gr'),
(384, '2024-03-09', 'Empal 500gr,Iga Sop Mix 1kg'),
(385, '2024-03-09', 'Rawon 1kg,Crispy Chicken Nugget 120gr'),
(386, '2024-03-09', 'Cingur 500gr,Boss sosis Sapi 500gr,Sosis Sapi isi 12'),
(387, '2024-03-09', 'Kentang Harvest 1kg,Boss sosis Sapi 500gr'),
(388, '2024-03-09', 'Jantung 1kg,Hati Sapi 1kg'),
(389, '2024-03-09', 'Cingur 500gr,Tetelan Sop Super,Rawon 1kg'),
(390, '2024-03-09', 'Buntut Center Cut 500gr,Rawon 1kg,Iga Gondrong 1kg'),
(391, '2024-03-07', 'Jantung 1kg,Daging Rendang Utuh 1kg'),
(392, '2024-03-07', 'Kentang Harvest 1kg,Fish Dumpling Chicken 500gr'),
(393, '2024-03-07', 'Slice Yosinoya Premium 500gr,Slice Teriaki Low Fat 500gr,Saikoro 500gr'),
(394, '2024-03-07', 'Slice Teriaki Low Fat 500gr,Rendang Dadu 500gr'),
(395, '2024-03-07', 'Sengkel 1kg,Bola Salmon 500gr,Boss sosis Sapi 500gr,Nugget Boss 1kg,Sosis Sapi isi 12'),
(396, '2024-03-07', 'Baso Urat isi 50 700gr,Rendang Dadu 500gr,Iga Super 1kg'),
(397, '2024-03-07', 'Fish Dumpling Chicken 500gr,Fish Dumpling Cheese 500gr'),
(398, '2024-03-07', 'Boss sosis Sapi 500gr,Kentang Harvest 1kg'),
(399, '2024-03-07', 'Kentang Harvest 1kg,Crispy Chicken Nugget 120gr'),
(400, '2024-03-06', 'Ayam Utuh 800gr,Kentang Harvest 1kg,Rendang Dadu 500gr'),
(401, '2024-03-06', 'Boss sosis Sapi 500gr,Bakso Cumi 500gr'),
(402, '2024-03-06', 'Bakso Cumi 500gr,Nugget Boss 1kg,Sosis Sapi isi 12'),
(403, '2024-03-06', 'Kentang Harvest 1kg,Iga Gondrong 1kg'),
(404, '2024-03-06', 'Fish Dumpling Chicken 500gr,Boss sosis Sapi 500gr'),
(405, '2024-03-06', 'Fish Dumpling Chicken 500gr,Kentang Harvest 1kg,Crispy Chicken Nugget 120gr'),
(406, '2024-03-06', 'Kentang Harvest 1kg,Nugget Boss 1kg'),
(407, '2024-03-06', 'Kentang Harvest 1kg,Otak Otak Ikan 500gr'),
(408, '2024-03-06', 'Iga Gondrong 1kg,Slice Yoshinoya Grad B 500gr,Ikan Dori 1kg'),
(409, '2024-03-06', 'Kentang Harvest 1kg,Nugget Boss 1kg,Otak Otak Ikan 500gr'),
(410, '2024-03-05', 'Slice Yosinoya Premium 500gr,Essem Kornet 450gr,Nugget Boss 1kg,Saikoro 500gr,Sosis Sapi isi 12'),
(411, '2024-03-05', 'Bakso Cumi 500gr,Kentang Harvest 1kg'),
(412, '2024-03-05', 'Kentang Harvest 1kg,Boss sosis Sapi 500gr'),
(413, '2024-03-05', 'Kentang Harvest 1kg,Sosis Sapi isi 12'),
(414, '2024-03-05', 'Rawon 1kg,Begok Ayam Bakar Premium'),
(415, '2024-03-05', 'Begok Ayam Bakar Premium,Begok Bebek Goreng Premium'),
(416, '2024-03-05', 'Kentang Harvest 1kg,Nugget Boss 1kg,Otak Otak Ikan 500gr'),
(417, '2024-03-05', 'Ayam Utuh 800gr,Rawon 1kg'),
(418, '2024-03-04', 'Iga Konro Bakar,Baso Urat isi 50 700gr'),
(419, '2024-03-04', 'Kentang Harvest 1kg,Nugget Boss 1kg'),
(420, '2024-03-04', 'Kentang Harvest 1kg,Sosis Sapi isi 12'),
(421, '2024-03-04', 'Kentang Harvest 1kg,Tulang Sum-Sum 1kg'),
(422, '2024-03-04', 'Kentang Harvest 1kg,Begok Ayam Bakar Premium'),
(423, '2024-03-04', 'Kentang Harvest 1kg,Sosis Sapi isi 12'),
(424, '2024-03-04', 'Kentang Harvest 1kg,Meltique Tenderloin 1kg,Nugget Boss 1kg,Otak Otak Ikan 500gr,Sosis Sapi isi 12'),
(425, '2024-03-04', 'Kentang Harvest 1kg,Boss sosis Sapi 500gr'),
(426, '2024-03-04', 'Bakso Cumi 500gr,Kibif Bakso Super 600gr,Nugget Boss 1kg,Kentang Harvest 1kg,Sosis Sapi isi 12'),
(427, '2024-03-02', 'Murato Boss Chicken Nugget,Ayam Utuh 700gr'),
(428, '2024-03-02', 'Bakso gepeng isi 50,Iga Sop Mix 1kg'),
(429, '2024-03-02', 'Rawon 1kg,Iga Konro Bakar'),
(430, '2024-03-02', 'Kentang Crincle 1kg,Baso Urat isi 50 700gr'),
(431, '2024-03-02', 'Cingur 500gr,Iga Super 1kg,Paru Sapi 1kg,Slice Teriaki Low Fat 500gr,Buntut Center Lokal 1kg'),
(432, '2024-03-02', 'Tetelan Sop Super,Slice Teriaki Low Fat 500gr'),
(433, '2024-03-02', 'Boss sosis Sapi 500gr,Fish Dumpling Chicken 500gr'),
(434, '2024-03-02', 'Slice Yosinoya Premium 500gr,Meltique Tenderloin 1kg,Slice Teriaki Low Fat 500gr'),
(435, '2024-02-28', 'Kentang Harvest 1kg,Fish Dumpling Chicken 500gr'),
(436, '2024-02-28', 'Kentang Harvest 1kg,Boss sosis Sapi 500gr'),
(437, '2024-02-28', 'Boss sosis Sapi 500gr,Nugget Boss 1kg,Kentang Harvest 1kg'),
(438, '2024-02-28', 'Kentang Harvest 1kg,Boss sosis Sapi 500gr,Nugget Boss 1kg'),
(439, '2024-02-28', 'Kentang Harvest 1kg,Boss sosis Sapi 500gr,Sosis Sapi isi 12,Nugget Boss 1kg'),
(440, '2024-02-28', 'Bola Salmon 500gr,Kentang Harvest 1kg'),
(441, '2024-02-28', 'Kentang Harvest 1kg,Otak Otak Ikan 500gr'),
(442, '2024-02-28', 'Kentang Harvest 1kg,Fish Dumpling Cheese 500gr'),
(443, '2024-02-28', 'Bakso Cumi 500gr,Nugget Boss 1kg'),
(444, '2024-02-28', 'Boss sosis Sapi 500gr,Kentang Harvest 1kg'),
(445, '2024-02-28', 'Kentang Harvest 1kg,Steak Ribeyae 1kg'),
(446, '2024-02-28', 'Rawon 1kg,Sengkel 1kg'),
(447, '2024-02-28', 'Boss sosis Sapi 500gr,Kentang Harvest 1kg'),
(448, '2024-02-27', 'Bakso gepeng isi 50,Tulang Sum-Sum 1kg'),
(449, '2024-02-27', 'Rawon 1kg,Baso Urat isi 50 700gr'),
(450, '2024-02-27', 'Boss sosis Sapi 500gr,Kentang Harvest 1kg'),
(451, '2024-02-27', 'Rawon 1kg,Jantung 1kg'),
(452, '2024-02-27', 'Paru Sapi 1kg,Rendang Dadu 500gr,Cumi Flower 1kg'),
(453, '2024-02-27', 'Kentang Harvest 1kg,Boss sosis Sapi 500gr'),
(454, '2024-02-27', 'Murato Boss Chicken Nugget,Ayam Utuh 800gr'),
(455, '2024-02-27', 'Kentang Harvest 1kg,Boss sosis Sapi 500gr'),
(456, '2024-02-26', 'Sosis Sapi isi 12,Kentang Harvest 1kg,Fish Dumpling Chicken 500gr'),
(457, '2024-02-26', 'Kentang Harvest 1kg,Fish Dumpling Cheese 500gr'),
(458, '2024-02-26', 'Kentang Harvest 1kg,Boss sosis Sapi 500gr'),
(459, '2024-02-26', 'Boss sosis Sapi 500gr,Kentang Harvest 1kg,Sosis Sapi isi 12'),
(460, '2024-02-26', 'Kentang Harvest 1kg,Steak Ribeyae 1kg'),
(461, '2024-02-26', 'Fish Dumpling Chicken 500gr,Sosis Sapi isi 12,Tulang Sum-Sum 1kg'),
(462, '2024-02-26', 'Murato Boss Chicken Nugget,Baso Urat isi 50 700gr'),
(463, '2024-02-26', 'Kentang Harvest 1kg,Boss sosis Sapi 500gr,Sosis Sapi isi 12,Nugget Boss 1kg'),
(464, '2024-02-26', 'Jantung 1kg,Cingur 500gr,Nugget Boss 1kg'),
(465, '2024-02-26', 'Boss sosis Sapi 500gr,Kentang Harvest 1kg'),
(466, '2024-02-25', 'Ayam Utuh 700gr,Boss sosis Sapi 500gr,Sosis Sapi isi 12'),
(467, '2024-02-25', 'Baso Urat isi 50 700gr,Kikil Kaki 1kg'),
(468, '2024-02-24', 'Boss sosis Sapi 500gr,Ikan Dori 1kg'),
(469, '2024-02-24', 'Boss sosis Sapi 500gr,Bakso Cumi 500gr'),
(470, '2024-02-24', 'Boss sosis Sapi 500gr,Tulang Sum-Sum 1kg,Fish Dumpling Chicken 500gr,Iga Sop Mix 1kg,Fish Dumpling Cheese 500gr'),
(471, '2024-02-24', 'Boss sosis Sapi 500gr,Kentang Harvest 1kg'),
(472, '2024-02-24', 'Kentang Harvest 1kg,Sosis Sapi isi 12'),
(473, '2024-02-24', 'Boss sosis Sapi 500gr,Kentang Harvest 1kg,Steak Ribeyae 1kg'),
(474, '2024-02-24', 'Sosis Sapi isi 12,Boss sosis Sapi 500gr,Fish Dumpling Cheese 500gr'),
(475, '2024-02-24', 'Boss sosis Sapi 500gr,Sosis Sapi isi 12'),
(476, '2024-02-24', 'Kentang Harvest 1kg,Boss sosis Sapi 500gr,Sosis Sapi isi 12'),
(477, '2024-02-24', 'Boss sosis Sapi 500gr,Kentang Harvest 1kg'),
(478, '2024-02-24', 'Boss sosis Sapi 500gr,Kentang Harvest 1kg'),
(479, '2024-02-22', 'Baso Urat isi 50 700gr,Boss sosis Sapi 500gr,Fish Dumpling Cheese 500gr'),
(480, '2024-02-22', 'Boss sosis Sapi 500gr,Kentang Harvest 1kg'),
(481, '2024-02-22', 'Boss sosis Sapi 500gr,Kentang Harvest 1kg'),
(482, '2024-02-22', 'Sosis Sapi isi 12,Boss sosis Sapi 500gr'),
(483, '2024-02-22', 'Boss sosis Sapi 500gr,Kentang Harvest 1kg,Steak Ribeyae 1kg'),
(484, '2024-02-22', 'Boss sosis Sapi 500gr,Kentang Harvest 1kg'),
(485, '2024-02-22', 'Boss sosis Sapi 500gr,Fish Dumpling Chicken 500gr,Kentang Harvest 1kg'),
(486, '2024-02-22', 'Kentang Harvest 1kg,Bakso gepeng isi 50,Kibif Bakso Super 600gr'),
(487, '2024-02-21', 'Boss sosis Sapi 500gr,Baso Urat isi 50 700gr'),
(488, '2024-02-21', 'Fish Dumpling Chicken 500gr,Bola Salmon 500gr,Kentang Harvest 1kg'),
(489, '2024-02-21', 'Boss sosis Sapi 500gr,Begok Bebek Bakar Premium'),
(490, '2024-02-21', 'Kentang Harvest 1kg,Fish Dumpling Chicken 500gr,Bola Salmon 500gr,Nugget Boss 1kg,Otak Otak Ikan 500gr'),
(491, '2024-02-21', 'Kentang Harvest 1kg,Chicken Cordon Blue,Baso Urat isi 50 700gr'),
(492, '2024-02-21', 'Kentang Harvest 1kg,Boss sosis Sapi 500gr,Sosis Sapi isi 12'),
(493, '2024-02-21', 'Boss sosis Sapi 500gr,Kikil Kaki 1kg'),
(494, '2024-02-21', 'Kentang Harvest 1kg,Tulang Sum-Sum 1kg'),
(495, '2024-02-21', 'Kentang Harvest 1kg,Kibif Bakso Super 600gr'),
(496, '2024-02-20', 'Kentang Harvest 1kg,Boss sosis Sapi 500gr'),
(497, '2024-02-20', 'Iga Konro Bakar,Slice Teriaki Low Fat 500gr,Iga Gondrong 1kg'),
(498, '2024-02-20', 'Kanzler Ori Nugget 450gr,Rendang Dadu 500gr,Kentang Harvest 1kg'),
(499, '2024-02-20', 'Rawon 1kg,Meltique Tenderloin 1kg'),
(500, '2024-02-20', 'Boss sosis Sapi 500gr,Kentang Harvest 1kg,Steak Ribeyae 1kg'),
(501, '2024-02-20', 'Bakso gepeng isi 50,Chicken Cordon Blue'),
(502, '2024-02-20', 'Bakso gepeng isi 50,Sosis Sapi isi 12,Kentang Harvest 1kg,Nugget Boss 1kg,Tulang Sum-Sum 1kg'),
(503, '2024-02-20', 'Kentang Harvest 1kg,Boss sosis Sapi 500gr'),
(504, '2024-02-19', 'Begok Bebek Bakar Premium,Tetelan Sapi 1kg'),
(505, '2024-02-19', 'Iga Sop Mix 1kg,Tetelan Sop Super,Ayam Utuh 800gr'),
(506, '2024-02-19', 'Crispy Chicken Nugget 120gr,Meltique Tenderloin 1kg,Nugget Boss 1kg,Sosis Sapi isi 12'),
(507, '2024-02-19', 'Slice Teriaki Low Fat 500gr,Nugget Boss 1kg,Baso Urat isi 50 700gr,Kentang Harvest 1kg,Sosis Sapi isi 12'),
(508, '2024-02-19', 'Slice Yosinoya Premium 500gr,Ayam Utuh 800gr,Nugget Boss 1kg,Kentang Crincle 1kg,Chicken Cordon Blue,Boss sosis Sapi 500gr,Sosis Sapi isi 12,Kentang Harvest 1kg'),
(509, '2024-02-19', 'Iga Konro Bakar,Meltique Tenderloin 1kg,Boss sosis Sapi 500gr,Nugget Boss 1kg,Sosis Sapi isi 12'),
(510, '2024-02-19', 'Boss sosis Sapi 500gr,Meltique Tenderloin 1kg'),
(511, '2024-02-19', 'Bakso gepeng isi 50,Nugget Boss 1kg,Sosis Sapi isi 12'),
(512, '2024-02-19', 'Paru Sapi 1kg,Rawon 1kg'),
(513, '2024-02-19', 'Boss sosis Sapi 500gr,Kentang Harvest 1kg'),
(514, '2024-02-19', 'Kentang Harvest 1kg,Iga Bakar Premium'),
(515, '2024-02-19', 'Boss sosis Sapi 500gr,Iga Super 1kg'),
(516, '2024-02-19', 'Kentang Harvest 1kg,Boss sosis Sapi 500gr,Sosis Sapi isi 12'),
(517, '2024-02-18', 'Fish Dumpling Chicken 500gr,Rendang Dadu 500gr,Jantung 1kg'),
(518, '2024-02-18', 'Boss sosis Sapi 500gr,Crispy Chicken Nugget 120gr'),
(519, '2024-02-18', 'Kentang Harvest 1kg,Iga Gondrong 1kg'),
(520, '2024-02-18', 'Iga Gondrong 1kg,Steak Ribeyae 1kg'),
(521, '2024-02-18', 'Kentang Harvest 1kg,Boss sosis Sapi 500gr,Sosis Sapi isi 12'),
(522, '2024-02-18', 'Rendang Dadu 500gr,Meltique Tenderloin 1kg,Kibif Bakso Super 600gr,Boss sosis Sapi 500gr,Sosis Sapi isi 12,Nugget Boss 1kg,Kentang Harvest 1kg'),
(523, '2024-02-18', 'Kentang Harvest 1kg,Boss sosis Sapi 500gr'),
(524, '2024-02-18', 'Murato Boss Chicken Nugget,Iga Sop Mix 1kg'),
(525, '2024-02-18', 'Kentang Harvest 1kg,Bakso gepeng isi 50,Boss sosis Sapi 500gr'),
(526, '2024-02-18', 'Boss sosis Sapi 500gr,Kentang Harvest 1kg'),
(527, '2024-02-18', 'Kentang Harvest 1kg,Sosis Sapi isi 12,Nugget Boss 1kg'),
(528, '2024-02-17', 'Ayam Utuh 800gr,Slice Yoshinoya Grad B 500gr,Boss sosis Sapi 500gr'),
(529, '2024-02-17', 'Bakso gepeng isi 50,Jantung 1kg'),
(530, '2024-02-17', 'Fish Dumpling Chicken 500gr,Sosis Sapi isi 12,Kentang Harvest 1kg'),
(531, '2024-02-17', 'Kentang Harvest 1kg,Boss sosis Sapi 500gr'),
(532, '2024-02-17', 'Kentang Harvest 1kg,Rendang Dadu 500gr,Bola Salmon 500gr,Boss sosis Sapi 500gr,Sosis Sapi isi 12'),
(533, '2024-02-17', 'Rawon 1kg,Kibif Bakso Super 600gr'),
(534, '2024-02-17', 'Bakso gepeng isi 50,Nugget Boss 1kg,Kibif Bakso Super 600gr,Kentang Harvest 1kg'),
(535, '2024-02-15', 'Boss sosis Sapi 500gr,Chicken Cordon Blue'),
(536, '2024-02-15', 'Boss sosis Sapi 500gr,Sosis Sapi isi 12'),
(537, '2024-02-15', 'Kentang Harvest 1kg,Fish Dumpling Chicken 500gr'),
(538, '2024-02-15', 'Iga Sop Mix 1kg,Iga Gondrong 1kg'),
(539, '2024-02-15', 'Bola Salmon 500gr,Jantung 1kg,Nugget Boss 1kg,Otak Otak Ikan 500gr,Sosis Sapi isi 12'),
(540, '2024-02-15', 'Iga Bakar Premium,Iga Sop Mix 1kg,Slice Teriaki Low Fat 500gr'),
(541, '2024-02-15', 'Kentang Harvest 1kg,Boss sosis Sapi 500gr'),
(542, '2024-02-15', 'Ayam Utuh 700gr,Boss sosis Sapi 500gr'),
(543, '2024-02-15', 'Bakso gepeng isi 50,Nugget Boss 1kg'),
(544, '2024-02-15', 'Kentang Harvest 1kg,Boss sosis Sapi 500gr,Jantung 1kg,Nugget Boss 1kg,Fish Dumpling Cheese 500gr'),
(545, '2024-02-15', 'Kentang Harvest 1kg,Boss sosis Sapi 500gr'),
(546, '2024-02-15', 'Kentang Harvest 1kg,Boss sosis Sapi 500gr,Sosis Sapi isi 12'),
(547, '2024-02-13', 'Iga Gondrong 1kg,Slice Yosinoya Premium 500gr,Boss sosis Sapi 500gr,Sosis Sapi isi 12'),
(548, '2024-02-13', 'Murato Boss Chicken Nugget,Jantung 1kg,Meltique Tenderloin 1kg,Steak Ribeyae 1kg,Fish Dumpling Cheese 500gr'),
(549, '2024-02-13', 'Murato Boss Chicken Nugget,Cingur 500gr'),
(550, '2024-02-13', 'Kentang Harvest 1kg,Boss sosis Sapi 500gr'),
(551, '2024-02-13', 'Kentang Harvest 1kg,Fish Dumpling Chicken 500gr'),
(552, '2024-02-13', 'Slice Teriaki Low Fat 500gr,Rendang Dadu 500gr'),
(553, '2024-02-13', 'Tetelan Sapi 1kg,Nugget Boss 1kg,Sosis Sapi isi 12,Kentang Harvest 1kg'),
(554, '2024-02-13', 'Sosis Sapi isi 12,Jantung 1kg'),
(555, '2024-02-13', 'Rawon 1kg,Nugget Boss 1kg,Sosis Sapi isi 12'),
(556, '2024-02-13', 'Kentang Harvest 1kg,Boss sosis Sapi 500gr,Sosis Sapi isi 12'),
(557, '2024-02-12', 'Fish Dumpling Cheese 500gr,Kanzler Ori Nugget 450gr,Steak Ribeyae 1kg'),
(558, '2024-02-12', 'Boss sosis Sapi 500gr,Kentang Harvest 1kg'),
(559, '2024-02-12', 'Kentang Harvest 1kg,Essem Kornet 450gr,Steak Ribeyae 1kg'),
(560, '2024-02-12', 'Kentang Harvest 1kg,Nugget Boss 1kg,Otak Otak Ikan 500gr,Sosis Sapi isi 12'),
(561, '2024-02-12', 'Kentang Harvest 1kg,Steak Ribeyae 1kg,Nugget Boss 1kg,Otak Otak Ikan 500gr'),
(562, '2024-02-12', 'Bakso gepeng isi 50,Jantung 1kg'),
(563, '2024-02-12', 'Kikil Kaki 1kg,Fish Dumpling Cheese 500gr'),
(564, '2024-02-11', 'Fish Dumpling Chicken 500gr,Boss sosis Sapi 500gr,Kanzler Crispy Chicken Nugget 450gr'),
(565, '2024-02-11', 'Iga Sop Mix 1kg,Boss sosis Sapi 500gr,Sosis Sapi isi 12,Kentang Harvest 1kg'),
(566, '2024-02-10', 'Ikan Dori 1kg,Iga Sop Mix 1kg'),
(567, '2024-02-10', 'Boss sosis Sapi 500gr,Jantung 1kg,Nugget Boss 1kg,Kentang Harvest 1kg'),
(568, '2024-02-10', 'Slice Yoshinoya Grad B 500gr,Iga Gondrong 1kg,Kibif Bakso Super 600gr'),
(569, '2024-02-10', 'Iga Gondrong 1kg,Sosis Sapi isi 12,Essem Kornet 450gr,Nugget Boss 1kg,Otak Otak Ikan 500gr'),
(570, '2024-02-10', 'Murato Boss Chicken Nugget,Iga Gondrong 1kg,Kentang Harvest 1kg,Nugget Boss 1kg,Sosis Sapi isi 12'),
(571, '2024-02-10', 'Boss sosis Sapi 500gr,Champ Chicken Nugget 250g'),
(572, '2024-02-10', 'Kentang Crincle 1kg,Boss sosis Sapi 500gr,Nugget Boss 1kg,Otak Otak Ikan 500gr,Sosis Sapi isi 12'),
(573, '2024-02-08', 'Bakso Cumi 500gr,Nugget Boss 1kg,Otak Otak Ikan 500gr'),
(574, '2024-02-08', 'Ayam Utuh 800gr,Ikan Dori 1kg'),
(575, '2024-02-08', 'Ayam Utuh 800gr,Nugget Boss 1kg,Kentang Harvest 1kg'),
(576, '2024-02-08', 'Bakso gepeng isi 50,Nugget Boss 1kg,Sosis Sapi isi 12'),
(577, '2024-02-08', 'Fish Dumpling Chicken 500gr,Tetelan Sop Super'),
(578, '2024-02-08', 'Champ Chicken Nugget 250g,Baso Urat isi 50 700gr,Fish Dumpling Cheese 500gr'),
(579, '2024-02-08', 'Sosis Sapi isi 12,Nugget Boss 1kg'),
(580, '2024-02-08', 'Cingur 500gr,Tulang Sum-Sum 1kg'),
(581, '2024-02-08', 'Bakso gepeng isi 50,Rendang Dadu 500gr'),
(582, '2024-02-08', 'Kentang Harvest 1kg,Nugget Boss 1kg'),
(583, '2024-02-08', 'Boss sosis Sapi 500gr,Sosis Sapi isi 12,Nugget Boss 1kg'),
(584, '2024-02-08', 'Kentang Harvest 1kg,Tulang Sum-Sum 1kg'),
(585, '2024-02-08', 'Ayam Utuh 700gr,Tulang Sum-Sum 1kg'),
(586, '2024-02-08', 'Fish Dumpling Chicken 500gr,Nugget Boss 1kg,Otak Otak Ikan 500gr'),
(587, '2024-02-08', 'Boss sosis Sapi 500gr,Kentang Harvest 1kg'),
(588, '2024-02-08', 'Paru Sapi 1kg,Tulang Sum-Sum 1kg,Slice Teriaki Low Fat 500gr,Kikil Kaki 1kg,Tetelan Sop Super,Daging Rendang Utuh 1kg'),
(589, '2024-02-08', 'Fish Dumpling Chicken 500gr,Nugget Boss 1kg,Sosis Sapi isi 12,Kentang Harvest 1kg'),
(590, '2024-02-08', 'Boss sosis Sapi 500gr,Nugget Boss 1kg'),
(591, '2024-02-08', 'Boss sosis Sapi 500gr,Kentang Harvest 1kg'),
(592, '2024-02-08', 'Kentang Harvest 1kg,Boss sosis Sapi 500gr'),
(593, '2024-02-08', 'Daging Rendang Utuh 1kg,Meltique Tenderloin 1kg'),
(594, '2024-02-08', 'Sosis Sapi isi 12,Kibif Bakso Super 600gr'),
(595, '2024-02-08', 'Rawon 1kg,Nugget Boss 1kg,Otak Otak Ikan 500gr'),
(596, '2024-02-08', 'Hati Sapi 1kg,Cingur 500gr,Iga Gondrong 1kg,Jantung 1kg'),
(597, '2024-02-08', 'Essem Kornet 450gr,Murato Boss Chicken Nugget'),
(598, '2024-02-08', 'Nugget Boss 1kg,Slice Yosinoya Premium 500gr,Kanzler Ori Nugget 450gr,Kentang Harvest 1kg'),
(599, '2024-02-08', 'Ayam Utuh 700gr,Meltique Tenderloin 1kg'),
(600, '2024-02-05', 'Kentang Harvest 1kg,Nugget Boss 1kg'),
(601, '2024-02-05', 'Bakso Cumi 500gr,Boss sosis Sapi 500gr,Nugget Boss 1kg,Sosis Sapi isi 12'),
(602, '2024-02-05', 'Boss sosis Sapi 500gr,Meltique Tenderloin 1kg'),
(603, '2024-02-05', 'Kentang Harvest 1kg,Nugget Boss 1kg,Sosis Sapi isi 12'),
(604, '2024-02-05', 'Boss sosis Sapi 500gr,Nugget Boss 1kg,Kentang Harvest 1kg'),
(605, '2024-02-05', 'Fish Dumpling Chicken 500gr,Nugget Boss 1kg,Sosis Sapi isi 12'),
(606, '2024-02-05', 'Bakso gepeng isi 50,Steak Ribeyae 1kg'),
(607, '2024-02-05', 'Cingur 500gr,Rawon 1kg'),
(608, '2024-02-05', 'Boss sosis Sapi 500gr,Kentang Harvest 1kg,Meltique Tenderloin 1kg,Nugget Boss 1kg,Sosis Sapi isi 12'),
(609, '2024-02-05', 'Boss sosis Sapi 500gr,Kentang Harvest 1kg'),
(610, '2024-02-05', 'Iga Gondrong 1kg,Begok Bebek Goreng Premium,Boss sosis Sapi 500gr,Sosis Sapi isi 12,Nugget Boss 1kg'),
(611, '2024-02-03', 'Boss sosis Sapi 500gr,Begok Bebek Goreng Premium,Nugget Boss 1kg,Kentang Harvest 1kg,Sosis Sapi isi 12'),
(612, '2024-02-03', 'Sosis Sapi isi 12,Kentang Harvest 1kg,Boss sosis Sapi 500gr'),
(613, '2024-02-03', 'Kentang Harvest 1kg,Kentang Crincle 1kg,Cumi Tube 1kg,Nugget Boss 1kg,Otak Otak Ikan 500gr'),
(614, '2024-02-03', 'Nugget Boss 1kg,Iga Gondrong 1kg,Saikoro 500gr,Fish Dumpling Cheese 500gr,Sosis Sapi isi 12'),
(615, '2024-02-03', 'Boss sosis Sapi 500gr,Kibif Bakso Super 600gr'),
(616, '2024-02-03', 'Ayam Utuh 800gr,Kibif Bakso Super 600gr'),
(617, '2024-02-03', 'Nugget Boss 1kg,Kanzler Ori Nugget 450gr,Kentang Harvest 1kg,Otak Otak Ikan 500gr,Sosis Sapi isi 12'),
(618, '2024-02-03', 'Kentang Harvest 1kg,Baso Urat isi 50 700gr,Bandeng Presto,Meltique Tenderloin 1kg,Fish Dumpling Cheese 500gr'),
(619, '2024-02-03', 'Kentang Harvest 1kg,Boss sosis Sapi 500gr'),
(620, '2024-02-03', 'Boss sosis Sapi 500gr,Nugget Boss 1kg,Sosis Sapi isi 12'),
(621, '2024-02-03', 'Slice Teriaki Low Fat 500gr,Slice Yosinoya Premium 500gr,Daging Rendang Utuh 1kg,Meltique Tenderloin 1kg,Nugget Boss 1kg,Kentang Harvest 1kg'),
(622, '2024-02-03', 'Kanzler Crispy Chicken Nugget 450gr,Kentang Harvest 1kg,Bola Salmon 500gr,Nugget Boss 1kg'),
(623, '2024-02-02', 'Sosis Sapi isi 12,Nugget Boss 1kg'),
(624, '2024-02-02', 'Iga Gondrong 1kg,Kanzler Crispy Chicken Nugget 450gr'),
(625, '2024-02-02', 'Iga Gondrong 1kg,Iga Konro Bakar'),
(626, '2024-02-02', 'Kentang Harvest 1kg,Hati Sapi 1kg,Tulang Sum-Sum 1kg'),
(627, '2024-02-02', 'Kanzler Crispy Chicken Nugget 450gr,Tetelan Sop Super,Boss sosis Sapi 500gr,Sosis Sapi isi 12');
INSERT INTO `transaksi` (`id_transaksi`, `tanggal_transaksi`, `produk`) VALUES
(628, '2024-02-02', 'Sosis Sapi isi 12,Bakso gepeng isi 50,Nugget Boss 1kg,Otak Otak Ikan 500gr'),
(629, '2024-02-02', 'Boss sosis Sapi 500gr,Kentang Harvest 1kg,Fish Dumpling Cheese 500gr'),
(630, '2024-02-02', 'Fish Dumpling Chicken 500gr,Nugget Boss 1kg'),
(631, '2024-02-02', 'Kentang Harvest 1kg,Boss sosis Sapi 500gr'),
(632, '2024-02-02', 'Kentang Harvest 1kg,Boss sosis Sapi 500gr,Steak Ribeyae 1kg,Fish Dumpling Cheese 500gr'),
(633, '2024-02-02', 'Kentang Harvest 1kg,Fish Dumpling Cheese 500gr'),
(634, '2024-02-02', 'Boss sosis Sapi 500gr,Kentang Harvest 1kg'),
(635, '2024-02-01', 'Boss sosis Sapi 500gr,Kentang Harvest 1kg,Sosis Sapi isi 12,Nugget Boss 1kg'),
(636, '2024-02-01', 'Essem Kornet 450gr,Kanzler Ori Nugget 450gr'),
(637, '2024-02-01', 'Kentang Harvest 1kg,Cumi Tube 1kg,Bola Salmon 500gr'),
(638, '2024-02-01', 'Slice Yosinoya Premium 500gr,Slice Yoshinoya Grad B 500gr'),
(639, '2024-02-01', 'Boss sosis Sapi 500gr,Cumi Tube 1kg,Bandeng Presto'),
(640, '2024-02-01', 'Slice Yosinoya Premium 500gr,Essem Kornet 450gr'),
(641, '2024-02-01', 'Sosis Sapi isi 12,Boss sosis Sapi 500gr'),
(642, '2024-02-01', 'Sosis Sapi isi 12,Jantung 1kg'),
(643, '2024-02-01', 'Baso Urat isi 50 700gr,Slice Yosinoya Premium 500gr,Tetelan Sop Super,Nugget Boss 1kg,Kentang Harvest 1kg,Sosis Sapi isi 12'),
(644, '2024-02-01', 'Bakso gepeng isi 50,Nugget Boss 1kg'),
(645, '2024-02-01', 'Kentang Harvest 1kg,Nugget Boss 1kg'),
(646, '2024-02-01', 'Sosis Sapi isi 12,Bakso Cumi 500gr,Kibif Bakso Super 600gr'),
(647, '2024-02-01', 'Sosis Sapi isi 12,Nugget Boss 1kg,Otak Otak Ikan 500gr'),
(648, '2024-02-01', 'Kentang Harvest 1kg,Bola Salmon 500gr,Nugget Boss 1kg'),
(649, '2024-02-01', 'Kentang Harvest 1kg,Fish Dumpling Chicken 500gr,Nugget Boss 1kg,Otak Otak Ikan 500gr'),
(650, '2024-02-01', 'Cingur 500gr,Meltique Tenderloin 1kg,Steak Ribeyae 1kg,Nugget Boss 1kg,Kentang Harvest 1kg,Sosis Sapi isi 12,Boss sosis Sapi 500gr'),
(651, '2024-02-01', 'Slice Teriaki Low Fat 500gr,Begok Bebek Goreng Premium,Rendang Dadu 500gr,Nugget Boss 1kg,Otak Otak Ikan 500gr,Sosis Sapi isi 12');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `level` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id_user`, `username`, `password`, `level`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 1),
(2, 'user', 'ee11cbb19052e40b07aac0ca060c23ee', 2);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `proses_log`
--
ALTER TABLE `proses_log`
  ADD PRIMARY KEY (`id_proses`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `proses_log`
--
ALTER TABLE `proses_log`
  MODIFY `id_proses` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=652;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
