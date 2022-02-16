-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 09, 2022 at 02:13 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
('Nocty', 'Noctis', 'nocty@pcr.ac.id', 'nocty', 'AIL');

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
(1, 'AIL1', 'ail1@pcr.ac.id', 'ail'),
(2, '0', 'nocty@pcr.ac.id', 'nocty'),
(3, 'bon', 'bon@pcr.ac.id', 'bon');

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
-- Table structure for table `notifikasi`
--

CREATE TABLE `notifikasi` (
  `id_notifikasi` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `no_pengajuan` varchar(100) NOT NULL,
  `status` enum('terima','tolak') NOT NULL,
  `deskripsi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notifikasi`
--

INSERT INTO `notifikasi` (`id_notifikasi`, `id_pembelian`, `no_pengajuan`, `status`, `deskripsi`) VALUES
(1, 1, 'hehes', 'tolak', 'ahahahahasd;lmgslkdm'),
(2, 1, '1 - Pengajuan Belanja Mouse Logitechy', 'terima', 'Selamat, silahkan hubungi bagian selanjutnya untuk proses selanjutnya'),
(4, 1, 'hehes', 'tolak', 'wahhaokaspd'),
(5, 2, '2 - Pengajuan Belanja Keyboard Asus', 'terima', 'null'),
(6, 2, '2 - Pengajuan Belanja Keyboard Asus', 'terima', 'Lorem dolor sit amet'),
(9, 1, 'testtt', 'terima', 'testtt');

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
(1, 1, 1, 'unread'),
(2, 2, 1, 'unread'),
(3, 1, 1, 'unread'),
(4, 2, 1, 'unread'),
(6, 1, 1, 'unread'),
(7, 2, 1, 'unread'),
(8, 4, 1, 'unread'),
(9, 1, 1, 'unread'),
(10, 2, 1, 'unread'),
(11, 4, 1, 'unread'),
(12, 5, 1, 'unread'),
(16, 1, 1, 'unread'),
(17, 1, 2, 'unread'),
(18, 1, 3, 'unread'),
(19, 2, 1, 'unread'),
(20, 2, 2, 'unread'),
(21, 2, 3, 'unread'),
(22, 4, 1, 'unread'),
(23, 4, 2, 'unread'),
(24, 4, 3, 'unread'),
(25, 5, 1, 'unread'),
(26, 5, 2, 'unread'),
(27, 5, 3, 'unread'),
(28, 6, 1, 'unread'),
(29, 6, 2, 'unread'),
(30, 6, 3, 'unread');

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
  `status_pembelian` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`id_pembelian`, `id_supplier`, `id_ail`, `id_lab`, `nama_barang`, `jumlah_barang`, `harga_per_unit`, `tanggal_pembelian`, `status_pembelian`) VALUES
(1, 1, 1, 302, 'Mouse Logitechy', 4, '65000', '2022-02-06', 0),
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
-- Indexes for table `notifikasi`
--
ALTER TABLE `notifikasi`
  ADD PRIMARY KEY (`id_notifikasi`),
  ADD KEY `id_pembelian` (`id_pembelian`);

--
-- Indexes for table `notifikasi_ail`
--
ALTER TABLE `notifikasi_ail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_notifikasi` (`id_notifikasi`);

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
-- AUTO_INCREMENT for table `notifikasi`
--
ALTER TABLE `notifikasi`
  MODIFY `id_notifikasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `notifikasi_ail`
--
ALTER TABLE `notifikasi_ail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id_pembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
-- Constraints for table `notifikasi`
--
ALTER TABLE `notifikasi`
  ADD CONSTRAINT `notifikasi_ibfk_1` FOREIGN KEY (`id_pembelian`) REFERENCES `pembelian` (`id_pembelian`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notifikasi_ail`
--
ALTER TABLE `notifikasi_ail`
  ADD CONSTRAINT `notifikasi_ail_ibfk_1` FOREIGN KEY (`id_notifikasi`) REFERENCES `notifikasi` (`id_notifikasi`) ON DELETE CASCADE ON UPDATE CASCADE;

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
