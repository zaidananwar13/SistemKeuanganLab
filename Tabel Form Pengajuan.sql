-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 09 Feb 2022 pada 13.54
-- Versi server: 10.4.18-MariaDB
-- Versi PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sikel_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `form_pengajuan`
--

CREATE TABLE `form_pengajuan` (
  `id` int(100) NOT NULL,
  `id_ail` int(11) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `jumlah_barang` int(50) NOT NULL,
  `tanggal_pengajuan` date NOT NULL,
  `deskripsi` varchar(100) NOT NULL,
  `ket` enum('penting','segera','tidak mendadak') NOT NULL,
  `status` enum('terima','tolak','nunggu') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `form_pengajuan`
--

INSERT INTO `form_pengajuan` (`id`, `id_ail`, `nama_barang`, `jumlah_barang`, `tanggal_pengajuan`, `deskripsi`, `ket`, `status`) VALUES
(17, 2, 'Komputer', 10, '2022-02-09', 'ASUS All-in-One PC V222GAK-BA141T 21.5 FHD J4025 4GB 1TB Win10 PC AIO', 'segera', 'terima'),
(18, 3, 'Laptop', 2, '2022-02-10', 'Acer SWIFT 3 (SF314-511) - Intel EVO I5-1135G7 16GB 512GB SSD FHD IPS WIN10 OHS', 'penting', 'terima');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `form_pengajuan`
--
ALTER TABLE `form_pengajuan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ail` (`id_ail`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `form_pengajuan`
--
ALTER TABLE `form_pengajuan`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `form_pengajuan`
--
ALTER TABLE `form_pengajuan`
  ADD CONSTRAINT `fk_ail` FOREIGN KEY (`id_ail`) REFERENCES `ail` (`id_ail`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
