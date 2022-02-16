-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 15, 2022 at 08:24 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 5.6.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projek_sistemkeuanganlab`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `First Name` varchar(25) NOT NULL,
  `Last Name` varchar(25) NOT NULL,
  `Email` varchar(25) NOT NULL,
  `Password` varchar(25) NOT NULL,
  `Hak_Akses` enum('KAJUR','KALAB','AIL') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`First Name`, `Last Name`, `Email`, `Password`, `Hak_Akses`) VALUES
('alex', 'pajitnov', 'alex@pcr.ac.id', 'alex', 'AIL'),
('Andi', 'Lanang', 'andi@pcr.ac.id', '123445', 'KAJUR'),
('bon', 'bon', 'bon@pcr.ac.id', 'bon', 'AIL'),
('hartanto', 'situmorang', 'hartanto.s20ti@gmail.com', '123', 'KAJUR'),
('Nocty', 'Noctis', 'nocty@pcr.ac.id', 'nocty', 'KALAB');

--
-- Triggers `account`
--
DELIMITER $$
CREATE TRIGGER `create_ail_trigger` BEFORE INSERT ON `account` FOR EACH ROW BEGIN
	if NEW.Hak_Akses = 'AIL' then
        insert into ail 
        values('', NEW.`First Name`,
        NEW.Email, New.Password);
    end if;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ail`
--

CREATE TABLE `ail` (
  `id_ail` int(11) NOT NULL,
  `nama_ail` varchar(50) NOT NULL,
  `email_ail` varchar(50) NOT NULL,
  `password_ail` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ail`
--

INSERT INTO `ail` (`id_ail`, `nama_ail`, `email_ail`, `password_ail`) VALUES
(0, 'hartanto', 'hartanto.s20ti@gmail.com', '123'),
(1, 'Harumin,S.ST', 'harumin@pcr.ac.id', 'ail'),
(2, 'Susiyanti,S.ST', 'susiyanti@pcr.ac.id', 'susiyanti'),
(3, 'Nessa Chainari Bemin,S.ST', 'nessa@pcr.ac.id', 'nessa');

-- --------------------------------------------------------

--
-- Table structure for table `form_pengajuan`
--

CREATE TABLE `form_pengajuan` (
  `id` int(100) NOT NULL,
  `id_ail` int(11) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `jumlah_barang` int(50) NOT NULL,
  `tanggal_pengajuan` date NOT NULL,
  `deskripsi` varchar(100) NOT NULL,
  `ket` enum('penting','segera','tidak mendadak') NOT NULL,
  `status` enum('menunggu','terima','tolak') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `form_pengajuan`
--

INSERT INTO `form_pengajuan` (`id`, `id_ail`, `nama_barang`, `jumlah_barang`, `tanggal_pengajuan`, `deskripsi`, `ket`, `status`) VALUES
(1, 2, 'laptop i7', 13, '2022-02-11', '343rewr', 'tidak mendadak', 'terima'),
(3, 3, '241', 12421, '2022-02-18', '4124214', 'penting', 'menunggu'),
(4, 2, 'Cisco', 1, '2022-01-19', 'Dibutuhkan untuk UAS', 'penting', 'menunggu'),
(5, 1, 'CPU i9', 5, '2022-01-06', 'Dibutuhkan untuk  2 Bulan Kedepan', 'penting', 'menunggu'),
(6, 3, 'Keyboard', 6, '2021-12-07', 'Banyak Keyboard yang tidak berfungsi  lagi', 'segera', 'terima'),
(7, 1, 'Keyboard', 23, '2022-02-18', 'Cepat', 'penting', 'tolak'),
(8, 1, 'flashdisk', 23, '2022-02-18', 'Cepat', 'penting', 'terima'),
(9, 1, 'flashdisk', 13, '2022-02-18', 'tidak ada', 'tidak mendadak', 'terima');

-- --------------------------------------------------------

--
-- Table structure for table `kalab`
--

CREATE TABLE `kalab` (
  `id_kalab` int(11) NOT NULL,
  `id_lab` int(11) NOT NULL,
  `nama_kalab` varchar(50) NOT NULL,
  `email_kalab` varchar(50) NOT NULL,
  `password_kalab` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kalab`
--

INSERT INTO `kalab` (`id_kalab`, `id_lab`, `nama_kalab`, `email_kalab`, `password_kalab`) VALUES
(1, 302, 'Kalab 1', 'kalab1@pcr.ac.id', 'password_panjang_bet');

-- --------------------------------------------------------

--
-- Table structure for table `lab`
--

CREATE TABLE `lab` (
  `id_lab` int(11) NOT NULL,
  `id_pic` int(11) NOT NULL,
  `id_kalab` int(11) NOT NULL,
  `nama_lab` varchar(30) NOT NULL,
  `status_lab` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lab`
--

INSERT INTO `lab` (`id_lab`, `id_pic`, `id_kalab`, `nama_lab`, `status_lab`) VALUES
(302, 1, 1, 'Lab 302', 'Kosong');

-- --------------------------------------------------------

--
-- Table structure for table `laporan`
--

CREATE TABLE `laporan` (
  `id` int(200) NOT NULL,
  `id_ail` int(15) NOT NULL,
  `nama_file` varchar(200) NOT NULL,
  `laporan` varchar(200) DEFAULT NULL,
  `tanggal_laporan` date NOT NULL,
  `status` enum('Menunggu','terima','tolak') NOT NULL,
  `baca` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `laporan`
--

INSERT INTO `laporan` (`id`, `id_ail`, `nama_file`, `laporan`, `tanggal_laporan`, `status`, `baca`) VALUES
(9, 1, 'ContohLPJ2.pdf', NULL, '2022-01-05', 'Menunggu', '0'),
(10, 2, 'ContohLPJ2.pdf', NULL, '2022-02-01', 'Menunggu', '0'),
(13, 2, 'ContohLPJ2.pdf', NULL, '2022-02-18', 'terima', '1'),
(14, 1, 'ContohLPJ1.pdf', NULL, '2022-02-12', 'terima', '0');

-- --------------------------------------------------------

--
-- Table structure for table `notifikasi`
--

CREATE TABLE `notifikasi` (
  `id_notifikasi` int(11) NOT NULL,
  `ail` int(20) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `no_pengajuan` varchar(100) NOT NULL,
  `status` enum('terima','tolak') NOT NULL,
  `deskripsi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notifikasi`
--

INSERT INTO `notifikasi` (`id_notifikasi`, `ail`, `id_pembelian`, `nama_barang`, `no_pengajuan`, `status`, `deskripsi`) VALUES
(91, 1, 0, '', '11 - Pengajuan Belanja Mouse Logitechy', 'terima', 'tt'),
(102, 1, 0, '', '22 - Pengajuan Belanja Keyboard Fantech', 'tolak', 'rr'),
(115, 1, 3, '', '33 - Pengajuan Belanja Keyboard Asus', 'terima', 'yt');

--
-- Triggers `notifikasi`
--
DELIMITER $$
CREATE TRIGGER `create_notification` BEFORE INSERT ON `notifikasi` FOR EACH ROW BEGIN
insert into notifikasi_ail(id_notifikasi, id_ail) 
	select id_notifikasi, id_ail
    from notifikasi cross join ail;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `notifikasi_ail`
--

CREATE TABLE `notifikasi_ail` (
  `id` int(11) NOT NULL,
  `id_notifikasi` int(11) NOT NULL,
  `id_ail` int(11) NOT NULL,
  `status` enum('read','unread') DEFAULT 'unread'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notifikasi_ail`
--

INSERT INTO `notifikasi_ail` (`id`, `id_notifikasi`, `id_ail`, `status`) VALUES
(120, 91, 0, 'unread'),
(121, 91, 1, 'unread'),
(122, 91, 2, 'unread'),
(123, 91, 3, 'unread'),
(244, 91, 0, 'unread'),
(245, 91, 1, 'unread'),
(246, 91, 2, 'unread'),
(247, 91, 3, 'unread'),
(248, 102, 0, 'unread'),
(249, 102, 1, 'unread'),
(250, 102, 2, 'unread'),
(251, 102, 3, 'unread');

-- --------------------------------------------------------

--
-- Table structure for table `notifikasi_laporan`
--

CREATE TABLE `notifikasi_laporan` (
  `id_ail` int(20) NOT NULL,
  `id_notifikasi` int(11) NOT NULL,
  `status` varchar(200) NOT NULL,
  `komentar` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notifikasi_laporan`
--

INSERT INTO `notifikasi_laporan` (`id_ail`, `id_notifikasi`, `status`, `komentar`) VALUES
(2, 65, '\'terima\'', 'null '),
(2, 66, '\'terima\'', 'null '),
(1, 67, '\'tolak\'', 'e '),
(2, 68, '\'terima\'', 'null '),
(1, 69, '\'terima\'', 'null '),
(1, 70, '\'tolak\'', 'asdasd '),
(2, 71, '\'tolak\'', 'sadsd '),
(1, 72, '\'tolak\'', 'asdsdsad '),
(3, 73, '\'tolak\'', '------ '),
(2, 74, '\'terima\'', 'null '),
(1, 75, '\'terima\'', 'null ');

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `id_pembelian` int(11) NOT NULL,
  `id_supplier` int(11) NOT NULL,
  `id_ail` int(11) NOT NULL,
  `id_lab` int(11) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `jumlah_barang` int(11) NOT NULL,
  `harga_per_unit` varchar(15) NOT NULL,
  `tanggal_pembelian` date NOT NULL,
  `status_pembelian` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`id_pembelian`, `id_supplier`, `id_ail`, `id_lab`, `nama_barang`, `jumlah_barang`, `harga_per_unit`, `tanggal_pembelian`, `status_pembelian`) VALUES
(0, 1, 1, 302, 'Mouse Logitechy', 4, '65000', '2022-02-06', 0),
(2, 1, 1, 302, 'Keyboard Asus', 8, '300000', '2022-02-09', 0),
(3, 1, 1, 302, 'Keyboard Asus', 8, '300000', '2022-02-09', 0);

-- --------------------------------------------------------

--
-- Table structure for table `pic`
--

CREATE TABLE `pic` (
  `id_pic` int(11) NOT NULL,
  `id_lab` int(11) NOT NULL,
  `nama_pic` varchar(50) NOT NULL,
  `email_pic` varchar(50) NOT NULL,
  `password_pic` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pic`
--

INSERT INTO `pic` (`id_pic`, `id_lab`, `nama_pic`, `email_pic`, `password_pic`) VALUES
(1, 302, 'PIC 1', 'pic1@pcr.ac.d', 'reee');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id_supplier` int(11) NOT NULL,
  `nama_supplier` varchar(50) NOT NULL,
  `alamat_supplier` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id_supplier`, `nama_supplier`, `alamat_supplier`) VALUES
(1, 'Supplier 1', 'Jalan Yos Sudarso');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`Email`);

--
-- Indexes for table `ail`
--
ALTER TABLE `ail`
  ADD PRIMARY KEY (`id_ail`);

--
-- Indexes for table `form_pengajuan`
--
ALTER TABLE `form_pengajuan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ail` (`id_ail`);

--
-- Indexes for table `kalab`
--
ALTER TABLE `kalab`
  ADD PRIMARY KEY (`id_kalab`),
  ADD KEY `id_lab` (`id_lab`);

--
-- Indexes for table `lab`
--
ALTER TABLE `lab`
  ADD PRIMARY KEY (`id_lab`),
  ADD KEY `id_kalab` (`id_kalab`),
  ADD KEY `id_pic` (`id_pic`);

--
-- Indexes for table `laporan`
--
ALTER TABLE `laporan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_fk_ail` (`id_ail`);

--
-- Indexes for table `notifikasi`
--
ALTER TABLE `notifikasi`
  ADD PRIMARY KEY (`id_notifikasi`),
  ADD KEY `id_pembelian` (`id_pembelian`),
  ADD KEY `ail_fk_id` (`ail`);

--
-- Indexes for table `notifikasi_ail`
--
ALTER TABLE `notifikasi_ail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_notifikasi` (`id_notifikasi`);

--
-- Indexes for table `notifikasi_laporan`
--
ALTER TABLE `notifikasi_laporan`
  ADD PRIMARY KEY (`id_notifikasi`),
  ADD KEY `ailid_fk` (`id_ail`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id_pembelian`),
  ADD KEY `id_ail` (`id_ail`),
  ADD KEY `id_lab` (`id_lab`),
  ADD KEY `id_supplier` (`id_supplier`);

--
-- Indexes for table `pic`
--
ALTER TABLE `pic`
  ADD PRIMARY KEY (`id_pic`),
  ADD KEY `id_lab` (`id_lab`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id_supplier`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ail`
--
ALTER TABLE `ail`
  MODIFY `id_ail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `form_pengajuan`
--
ALTER TABLE `form_pengajuan`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `kalab`
--
ALTER TABLE `kalab`
  MODIFY `id_kalab` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lab`
--
ALTER TABLE `lab`
  MODIFY `id_lab` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=303;

--
-- AUTO_INCREMENT for table `laporan`
--
ALTER TABLE `laporan`
  MODIFY `id` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `notifikasi`
--
ALTER TABLE `notifikasi`
  MODIFY `id_notifikasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT for table `notifikasi_ail`
--
ALTER TABLE `notifikasi_ail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=255;

--
-- AUTO_INCREMENT for table `notifikasi_laporan`
--
ALTER TABLE `notifikasi_laporan`
  MODIFY `id_notifikasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id_pembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pic`
--
ALTER TABLE `pic`
  MODIFY `id_pic` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id_supplier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `form_pengajuan`
--
ALTER TABLE `form_pengajuan`
  ADD CONSTRAINT `fk_ail` FOREIGN KEY (`id_ail`) REFERENCES `ail` (`id_ail`);

--
-- Constraints for table `kalab`
--
ALTER TABLE `kalab`
  ADD CONSTRAINT `kalab_ibfk_1` FOREIGN KEY (`id_lab`) REFERENCES `lab` (`id_lab`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lab`
--
ALTER TABLE `lab`
  ADD CONSTRAINT `lab_ibfk_1` FOREIGN KEY (`id_kalab`) REFERENCES `kalab` (`id_kalab`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lab_ibfk_2` FOREIGN KEY (`id_pic`) REFERENCES `pic` (`id_pic`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `laporan`
--
ALTER TABLE `laporan`
  ADD CONSTRAINT `id_fk_ail` FOREIGN KEY (`id_ail`) REFERENCES `ail` (`id_ail`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notifikasi`
--
ALTER TABLE `notifikasi`
  ADD CONSTRAINT `ail_fk_id` FOREIGN KEY (`ail`) REFERENCES `ail` (`id_ail`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notifikasi_ibfk_1` FOREIGN KEY (`id_pembelian`) REFERENCES `pembelian` (`id_pembelian`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notifikasi_ail`
--
ALTER TABLE `notifikasi_ail`
  ADD CONSTRAINT `notifikasi_ail_ibfk_1` FOREIGN KEY (`id_notifikasi`) REFERENCES `notifikasi` (`id_notifikasi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notifikasi_laporan`
--
ALTER TABLE `notifikasi_laporan`
  ADD CONSTRAINT `ailid_fk` FOREIGN KEY (`id_ail`) REFERENCES `ail` (`id_ail`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD CONSTRAINT `pembelian_ibfk_1` FOREIGN KEY (`id_ail`) REFERENCES `ail` (`id_ail`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pembelian_ibfk_2` FOREIGN KEY (`id_lab`) REFERENCES `lab` (`id_lab`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pembelian_ibfk_3` FOREIGN KEY (`id_supplier`) REFERENCES `supplier` (`id_supplier`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pic`
--
ALTER TABLE `pic`
  ADD CONSTRAINT `pic_ibfk_1` FOREIGN KEY (`id_lab`) REFERENCES `lab` (`id_lab`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
