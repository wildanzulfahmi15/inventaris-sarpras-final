-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 08, 2026 at 03:52 AM
-- Server version: 8.4.3
-- PHP Version: 8.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sarpras_baru`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` int UNSIGNED NOT NULL,
  `nama_barang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stok` int NOT NULL DEFAULT '0',
  `id_kategori` int DEFAULT NULL,
  `gambar` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `stok`, `id_kategori`, `gambar`, `created_at`, `updated_at`, `deleted_at`) VALUES
(45, 'Proyektor', 20, 2, '1778205145.jpg', NULL, NULL, NULL),
(46, 'Bola Futsal', 12, 1, '1778205241.jpg', NULL, NULL, NULL),
(47, 'Bola Basket', 12, 1, '1778205391.jpg', NULL, NULL, NULL),
(48, 'Bola Voli', 12, 1, '1778205439.jpg', NULL, NULL, NULL),
(49, 'Kabel HDMI', 20, 2, '1778205485.jpg', NULL, NULL, NULL),
(50, 'Macbook', 25, 2, '1778205538.jpg', NULL, NULL, NULL),
(51, 'Mouse', 20, 2, '1778205568.jpg', NULL, NULL, NULL),
(52, 'Speaker', 15, 2, '1778205880_WhatsAppImage2020-10-22at16.18.26_1024x1024 (1).webp', NULL, NULL, NULL),
(53, 'Kamera', 3, 3, '1778205777_dreamina-2026-05-08-3926-Kamera.jpeg', NULL, NULL, NULL),
(54, 'Ruang Teori 1', 1, 4, '1778205942.jpg', NULL, NULL, NULL),
(55, 'Ruang Teori 2', 1, 4, '1778205969.jpg', NULL, NULL, NULL),
(56, 'Lab Software', 1, 5, '1778205997.jpg', NULL, NULL, NULL),
(57, 'Lab Database', 1, 5, '1778206013.jpg', NULL, NULL, NULL),
(58, 'Lapangan Utama', 1, 6, '1778206059.jpg', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `detail_peminjaman`
--

CREATE TABLE `detail_peminjaman` (
  `id_detail` int UNSIGNED NOT NULL,
  `id_peminjaman` int UNSIGNED DEFAULT NULL,
  `id_barang` int UNSIGNED DEFAULT NULL,
  `jumlah` int DEFAULT NULL,
  `status_peminjaman` enum('Menunggu Sarpras','Disetujui','Ditolak Sarpras','Stok Habis') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'Menunggu Sarpras',
  `status_pengembalian` enum('Belum','Menunggu Sarpras','Selesai','Ditolak Sarpras') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'Belum',
  `tanggal_pengembalian` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `foto_pengembalian` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jurusan`
--

CREATE TABLE `jurusan` (
  `id_jurusan` int UNSIGNED NOT NULL,
  `nama_jurusan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `jurusan`
--

INSERT INTO `jurusan` (`id_jurusan`, `nama_jurusan`) VALUES
(16, 'TFLN'),
(28, 'DKV'),
(29, 'RPL'),
(30, 'TKJ'),
(31, 'SIJA'),
(32, 'TOI'),
(33, 'TKP'),
(34, 'TP');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int NOT NULL,
  `nama_kategori` varchar(50) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `gambar` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`, `keterangan`, `created_at`, `updated_at`, `gambar`) VALUES
(1, 'Olahraga', 'Kategori olahraga mencakup berbagai perlengkapan dan fasilitas yang digunakan untuk kegiatan fisik dan olahraga di lingkungan sekolah.', '2025-12-22 12:09:22', '2025-12-29 20:52:26', 'olahraga.png'),
(2, 'Elektronik', 'Kategori elektronik berisi perangkat pendukung pembelajaran seperti proyektor, speaker, mikrofon, dan peralatan elektronik lainnya.', '2025-12-22 12:09:22', '2025-12-22 12:57:50', 'elektronik.png'),
(3, 'Kesenian', 'Kategori kesenian meliputi alat dan perlengkapan untuk kegiatan seni seperti melukis, menggambar, musik, dan kreativitas siswa.', '2025-12-22 12:09:22', '2025-12-22 12:57:50', 'kesenian.png'),
(4, 'Ruang Teori', 'Kategori ruang teori mencakup ruang kelas yang digunakan untuk kegiatan belajar mengajar teori dan pembelajaran umum.', '2025-12-22 12:09:22', '2025-12-22 12:57:50', 'kelas.png'),
(5, 'Lab', 'Kategori laboratorium berisi ruang dan peralatan praktikum seperti lab komputer, lab bahasa, dan lab sains.', '2025-12-22 12:09:22', '2025-12-22 12:57:50', 'lab.png'),
(6, 'Lapangan', 'Kategori lapangan meliputi fasilitas lapangan sekolah yang digunakan untuk olahraga dan kegiatan luar ruangan.', '2025-12-22 12:09:22', '2025-12-22 12:57:50', 'lapangan.png');

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` int UNSIGNED NOT NULL,
  `nama_kelas` varchar(20) NOT NULL,
  `id_jurusan` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `nama_kelas`, `id_jurusan`) VALUES
(35, 'XI DKV 2', 28),
(36, 'XI RPL 1', 29),
(37, 'XI RPL 2', 29),
(38, 'XI TKJ 1', 30),
(39, 'XI DKV 3', 28),
(40, 'XI TP 2', 34);

-- --------------------------------------------------------

--
-- Table structure for table `mapel`
--

CREATE TABLE `mapel` (
  `id_mapel` int NOT NULL,
  `nama_mapel` varchar(100) NOT NULL,
  `jenis_mapel` enum('jurusan','umum','ekskul') NOT NULL DEFAULT 'umum',
  `id_jurusan` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `mapel`
--

INSERT INTO `mapel` (`id_mapel`, `nama_mapel`, `jenis_mapel`, `id_jurusan`) VALUES
(1, 'PKN', 'umum', NULL),
(3, 'Pendidikan Kewarganegaraan', 'umum', NULL),
(4, 'Matematika', 'umum', NULL),
(5, 'Pemograman Berbasis Obyek', 'jurusan', 29),
(7, 'Ilmu Pengetahuan Alam', 'umum', NULL),
(8, 'Pendidikan Jasmani', 'umum', NULL),
(16, 'Pramuka', 'ekskul', NULL),
(17, 'Paskibra', 'ekskul', NULL),
(18, 'Futsal', 'ekskul', NULL),
(19, 'Basket', 'ekskul', NULL),
(20, 'Organisasi Siswa Intra Sekolah', 'ekskul', NULL),
(21, 'Palang Merah Remaja', 'ekskul', NULL),
(26, 'Database', 'jurusan', 29),
(27, 'Bahasa Indonesia', 'umum', NULL),
(28, 'Matematika', 'umum', NULL),
(29, 'Bahasa Inggris', 'umum', NULL),
(30, 'IPA Terapan', 'umum', NULL),
(31, 'PKN', 'umum', NULL),
(32, 'Sejarah Indonesia', 'umum', NULL),
(33, 'Seni Budaya', 'umum', NULL),
(34, 'PJOK', 'umum', NULL),
(35, 'Pemrograman Dasar', 'jurusan', 29),
(36, 'Basis Data', 'jurusan', 29),
(37, 'Pemrograman Web', 'jurusan', 29),
(38, 'Pemrograman Mobile', 'jurusan', 29),
(39, 'Jaringan Komputer', 'jurusan', 29),
(40, 'UI UX Design', 'jurusan', 29),
(41, 'Desain Grafis', 'jurusan', 28),
(42, 'Fotografi', 'jurusan', 28),
(43, 'Videografi', 'jurusan', 28),
(44, 'Animasi 2D', 'jurusan', 28),
(45, 'Desain Multimedia', 'jurusan', 28),
(46, 'Editing Video', 'jurusan', 28),
(47, 'Teknik Pemesinan', 'jurusan', 34),
(48, 'Gambar Teknik', 'jurusan', 34),
(49, 'Teknik Fabrikasi', 'jurusan', 34),
(50, 'Perawatan Mesin', 'jurusan', 34),
(51, 'CNC Dasar', 'jurusan', 34),
(52, 'Futsal', 'ekskul', NULL),
(53, 'Basket', 'ekskul', NULL),
(54, 'Voli', 'ekskul', NULL),
(55, 'Pramuka', 'ekskul', NULL),
(56, 'Paskibra', 'ekskul', NULL),
(57, 'PMR', 'ekskul', NULL),
(58, 'Rohis', 'ekskul', NULL),
(59, 'English Club', 'ekskul', NULL),
(60, 'Coding Club', 'ekskul', NULL),
(61, 'Desain Club', 'ekskul', NULL),
(62, 'Karya Ilmiah Remaja', 'ekskul', NULL),
(63, 'Musik', 'ekskul', NULL),
(64, 'Tari Tradisional', 'ekskul', NULL),
(65, 'Teater', 'ekskul', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_11_08_13000_create_barang_table', 1),
(5, '2025_11_08_13000_create_user_table', 1),
(6, '2025_11_08_13099_create_siswa_table', 1),
(7, '2025_11_08_13100_create_peminjaman_table', 1),
(8, '2025_11_08_131540_create_pengembalian_table', 1),
(10, '2026_04_30_122233_create_notifications_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('1180d11a-7b55-4dfc-8cab-809853e77d12', 'App\\Notifications\\PengajuanDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengajuan Ditolak \\u274c\",\"message\":\"Pengajuan untuk Harddisk External ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 09:24:03', '2026-05-01 09:23:48', '2026-05-01 09:24:03'),
('11de11cd-9c47-486b-8b3e-2916f88eed30', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Flashdisk untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_detail\":403,\"type\":\"peminjaman\"}', '2026-05-02 04:26:00', '2026-05-02 04:25:04', '2026-05-02 04:26:00'),
('11f3656d-e877-4444-80eb-20ceb8e54e11', 'App\\Notifications\\PengajuanDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengajuan Ditolak \\u274c\",\"message\":\"Pengajuan untuk Mouse ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 03:56:50', '2026-05-02 03:56:31', '2026-05-02 03:56:50'),
('1231b8be-e9fb-4b88-84ce-95472fddbc96', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru <b>dani<\\/b> menyetujui pengembalian barang <b>Harddisk External<\\/b> milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":320}', '2026-05-01 21:26:43', '2026-05-01 21:26:36', '2026-05-01 21:26:43'),
('1251ce2c-8d86-4d23-a5d1-40f2e213da9f', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Flashdisk untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_detail\":395,\"type\":\"peminjaman\"}', '2026-05-02 04:23:30', '2026-05-02 04:23:07', '2026-05-02 04:23:30'),
('12cbcf05-df7c-4402-a031-3b90ef4038f0', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 18, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Harddisk External milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":324,\"type\":\"pengembalian\"}', NULL, '2026-05-02 02:31:07', '2026-05-02 02:31:07'),
('130c386c-5ea3-40d5-ac1d-2d6f9e1d6428', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Mouse ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 03:39:30', '2026-05-02 02:32:14', '2026-05-02 03:39:30'),
('131ee6ef-73b2-49b9-9d7d-7e018b3b5891', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Mouse ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 06:08:17', '2026-05-02 06:00:14', '2026-05-02 06:08:17'),
('13320965-4d97-469f-b48b-69351677bc29', 'App\\Notifications\\PengajuanDisetujui', 'App\\Models\\User', 1, '{\"title\":\"Pengajuan Disetujui \\u2705\",\"message\":\"Pengajuan untuk Flashdisk telah disetujui\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-07 05:05:48', '2026-05-07 04:54:53', '2026-05-07 05:05:48'),
('13492692-9c85-44dd-a184-2ea9fd9c6fda', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Harddisk External milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":320,\"type\":\"pengembalian\"}', '2026-05-01 22:51:48', '2026-05-01 22:49:06', '2026-05-01 22:51:48'),
('1349bfde-394b-4775-9a32-5a1dcdc58d90', 'App\\Notifications\\PengajuanDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengajuan Ditolak \\u274c\",\"message\":\"Pengajuan untuk Harddisk External ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 20:33:21', '2026-05-01 20:33:03', '2026-05-01 20:33:21'),
('134a2726-7b1d-4b3e-a045-850c87cb728a', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Flashdisk untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_detail\":367,\"type\":\"peminjaman\"}', '2026-05-02 03:17:41', '2026-05-02 03:07:55', '2026-05-02 03:17:41'),
('145c7440-45b1-4914-94a4-f6cc8d10a714', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Harddisk External milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":332,\"type\":\"pengembalian\"}', '2026-05-02 03:17:41', '2026-05-02 02:40:45', '2026-05-02 03:17:41'),
('14c60d96-fa89-478a-ab32-e2c187b288de', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Mouse ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 03:39:30', '2026-05-02 02:32:24', '2026-05-02 03:39:30'),
('15c43aa9-8ed9-4d88-b950-111e34e9c302', 'App\\Notifications\\PengajuanDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengajuan Ditolak \\u274c\",\"message\":\"Pengajuan untuk Harddisk External ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 20:34:00', '2026-05-01 20:33:51', '2026-05-01 20:34:00'),
('17ecb76e-9372-4186-aaef-27ab0e700031', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Net ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 03:39:30', '2026-05-02 02:41:57', '2026-05-02 03:39:30'),
('1846c9b9-6321-402d-ae1b-b73c7a1b9467', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 18, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Harddisk External milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":322,\"type\":\"pengembalian\"}', NULL, '2026-05-02 02:34:42', '2026-05-02 02:34:42'),
('1904f020-5f4f-4601-832e-885e756456f1', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 18, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Net milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":330,\"type\":\"pengembalian\"}', NULL, '2026-05-02 02:40:33', '2026-05-02 02:40:33'),
('1922a29a-f363-4fb9-bbcb-b3442e586666', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 18, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Harddisk External milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":324,\"type\":\"pengembalian\"}', NULL, '2026-05-02 03:00:34', '2026-05-02 03:00:34'),
('199f3b4b-62a9-4518-ae5f-6303601ef10f', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Harddisk External milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":320,\"type\":\"pengembalian\"}', '2026-05-02 03:58:53', '2026-05-02 03:57:19', '2026-05-02 03:58:53'),
('1a6ee239-db48-49f9-88f9-4111164d44ce', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Mouse ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 09:24:35', '2026-05-01 09:24:11', '2026-05-01 09:24:35'),
('1b177642-092b-4390-a2ac-ec712dcfb390', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Mouse milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":291,\"type\":\"pengembalian\"}', '2026-05-01 22:52:22', '2026-05-01 22:49:05', '2026-05-01 22:52:22'),
('1bf24920-00a1-4d4b-b3dd-cbece0eddfda', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Proyektor untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_detail\":404,\"type\":\"peminjaman\"}', '2026-05-02 04:26:00', '2026-05-02 04:25:04', '2026-05-02 04:26:00'),
('1d536678-a209-4d1b-b34a-d0c694cd844c', 'App\\Notifications\\PengajuanDisetujui', 'App\\Models\\User', 1, '{\"title\":\"Pengajuan Disetujui \\u2705\",\"message\":\"Pengajuan untuk Flashdisk telah disetujui\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 20:34:23', '2026-05-01 20:34:14', '2026-05-01 20:34:23'),
('1d595b7a-46e8-48c6-b84d-3c115f19205d', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Laptop ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 20:36:20', '2026-05-01 20:35:07', '2026-05-01 20:36:20'),
('1e666452-38e2-4599-a309-342f9c209f37', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 18, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Harddisk External milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":324,\"type\":\"pengembalian\"}', NULL, '2026-05-02 02:58:43', '2026-05-02 02:58:43'),
('1f0aad44-8764-4279-8723-ba86786064c5', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Mouse ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 20:39:01', '2026-05-01 20:39:00', '2026-05-01 20:39:01'),
('1f4fb050-3037-4658-90cf-fb91e721d795', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Harddisk External untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_detail\":399,\"type\":\"peminjaman\"}', '2026-05-02 04:26:00', '2026-05-02 04:24:27', '2026-05-02 04:26:00'),
('1f821202-dc68-422d-b38c-ed7626b17564', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Harddisk External ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 02:27:07', '2026-05-01 22:52:07', '2026-05-02 02:27:07'),
('20f13fbb-9bc7-476c-9eae-24431de4a694', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Net ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 06:08:17', '2026-05-02 06:00:17', '2026-05-02 06:08:17'),
('217dc3af-09a8-4bf8-ada7-7e39b442998d', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 18, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Harddisk External milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":320,\"type\":\"pengembalian\"}', NULL, '2026-05-02 02:54:02', '2026-05-02 02:54:02'),
('219524fc-a5f9-4184-8993-b3e5a923af36', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Mouse milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":null,\"type\":\"pengembalian\"}', '2026-05-01 22:48:51', '2026-05-01 22:42:18', '2026-05-01 22:48:51'),
('21b22e25-e43d-494f-b7c9-a196ee3ae65c', 'App\\Notifications\\PengajuanDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengajuan Ditolak \\u274c\",\"message\":\"Pengajuan untuk Flashdisk ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 03:56:14', '2026-05-02 03:54:31', '2026-05-02 03:56:14'),
('21deca78-f6c1-427d-9526-eedb690b61eb', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Mouse ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 22:48:56', '2026-05-01 22:07:12', '2026-05-01 22:48:56'),
('21f09cfa-fa2f-4963-98ed-cadf648b5e7e', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Harddisk External ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 20:33:40', '2026-05-01 20:33:29', '2026-05-01 20:33:40'),
('222aab6a-6106-472e-81fa-7513ea8da648', 'App\\Notifications\\PengajuanDisetujui', 'App\\Models\\User', 1, '{\"title\":\"Pengajuan Disetujui \\u2705\",\"message\":\"Pengajuan untuk Flashdisk telah disetujui\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-07 05:07:54', '2026-05-07 05:05:54', '2026-05-07 05:07:54'),
('2277adb3-13ad-42a0-8e2b-8f945860f3aa', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Harddisk External milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":322,\"type\":\"pengembalian\"}', '2026-05-02 03:17:41', '2026-05-02 02:30:59', '2026-05-02 03:17:41'),
('2301a832-aea8-47ef-98cc-faed2e73c41b', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Flashdisk untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_detail\":380,\"type\":\"peminjaman\"}', '2026-05-02 03:59:06', '2026-05-02 03:55:46', '2026-05-02 03:59:06'),
('2374412d-f16a-4baa-a44a-f4eac1bbb8d4', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 18, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Harddisk External milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":322}', NULL, '2026-05-01 21:34:20', '2026-05-01 21:34:20'),
('23cd2b21-2d1a-414f-b8b8-6a700bca6493', 'App\\Notifications\\PengajuanDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengajuan Ditolak \\u274c\",\"message\":\"Pengajuan untuk Mouse ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-07 05:07:54', '2026-05-07 05:05:57', '2026-05-07 05:07:54'),
('23edee4e-c99a-48d6-9a06-636ee28e5423', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Harddisk External milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":292,\"type\":\"pengembalian\"}', '2026-05-02 03:17:41', '2026-05-02 02:29:16', '2026-05-02 03:17:41'),
('24174e3b-2b7e-4805-bd01-c1d92e9b9912', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Flashdisk untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_peminjaman\":211}', '2026-05-01 21:35:19', '2026-05-01 21:35:06', '2026-05-01 21:35:19'),
('244f27e1-f2a4-442b-8d5d-3fb2e2ca0514', 'App\\Notifications\\PengembalianDisetujui', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Disetujui \\u2705\",\"message\":\"Pengembalian Flashdisk telah diterima\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 09:25:09', '2026-05-01 09:25:03', '2026-05-01 09:25:09'),
('2485c96c-bcd6-4d1d-b9d3-c54b3b744338', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Harddisk External milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":379,\"type\":\"pengembalian\"}', '2026-05-07 04:36:37', '2026-05-02 05:03:25', '2026-05-07 04:36:37'),
('24c8a02d-326f-4987-a6b0-7515ab426f4e', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 18, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Mouse milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":326,\"type\":\"pengembalian\"}', NULL, '2026-05-02 02:59:01', '2026-05-02 02:59:01'),
('24e93d8c-4f66-40cb-9517-2a3f90435ade', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 18, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Harddisk External milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":292,\"type\":\"pengembalian\"}', NULL, '2026-05-02 02:51:29', '2026-05-02 02:51:29'),
('24fc0451-be1a-439f-8202-91c950fe1ea7', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Harddisk External milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":320,\"type\":\"pengembalian\"}', '2026-05-02 03:59:42', '2026-05-02 03:44:01', '2026-05-02 03:59:42'),
('2586ed2e-e4d2-4fcf-9c8b-664954e0a228', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Flashdisk ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 03:39:30', '2026-05-02 02:42:02', '2026-05-02 03:39:30'),
('26190cc9-7910-412a-95b6-7201fdbde58b', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Mouse untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_peminjaman\":210}', '2026-05-01 21:34:30', '2026-05-01 21:33:17', '2026-05-01 21:34:30'),
('2760a798-aedc-40ba-a977-c720f8abb093', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Laptop untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_detail\":390,\"type\":\"peminjaman\"}', '2026-05-02 04:19:05', '2026-05-02 04:18:37', '2026-05-02 04:19:05'),
('2886cedd-6fe3-408d-a912-7a85caa85c2f', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Harddisk External milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":324,\"type\":\"pengembalian\"}', '2026-05-02 03:17:41', '2026-05-02 02:31:07', '2026-05-02 03:17:41'),
('29014be2-e2c8-4f07-939b-fb82df9c1f37', 'App\\Notifications\\PengajuanDisetujui', 'App\\Models\\User', 1, '{\"title\":\"Pengajuan Disetujui \\u2705\",\"message\":\"Pengajuan untuk Flashdisk telah disetujui\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-07 05:05:48', '2026-05-07 04:51:38', '2026-05-07 05:05:48'),
('2909859b-6687-407a-aa67-f7bd38032a97', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Harddisk External untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_detail\":386,\"type\":\"peminjaman\"}', '2026-05-02 04:18:19', '2026-05-02 04:14:34', '2026-05-02 04:18:19'),
('2909fdeb-1d12-4cb0-a6da-b753377aa524', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Harddisk External milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":320,\"type\":\"pengembalian\"}', '2026-05-02 03:17:41', '2026-05-02 02:54:02', '2026-05-02 03:17:41'),
('295f955c-9c48-4629-a944-6c0314799958', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Harddisk External ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 03:39:30', '2026-05-02 02:32:19', '2026-05-02 03:39:30'),
('2985afca-9fa1-47eb-b6bd-771321f3bad0', 'App\\Notifications\\PengajuanDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengajuan Ditolak \\u274c\",\"message\":\"Pengajuan untuk Mouse ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 04:19:09', '2026-05-02 04:18:58', '2026-05-02 04:19:09'),
('2bd00674-7b9f-4f4f-ba0e-ca9041e408d0', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Flashdisk untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_detail\":364,\"type\":\"peminjaman\"}', '2026-05-02 03:17:41', '2026-05-02 03:05:45', '2026-05-02 03:17:41'),
('2d0ed27f-e461-4a6d-942e-edff312ded59', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Harddisk External milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":332}', '2026-05-01 21:38:07', '2026-05-01 21:37:59', '2026-05-01 21:38:07'),
('2d7cb2e6-528a-455b-b080-cc4678a2944b', 'App\\Notifications\\PengajuanDisetujui', 'App\\Models\\User', 1, '{\"title\":\"Pengajuan Disetujui \\u2705\",\"message\":\"Pengajuan untuk Harddisk External telah disetujui\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-07 05:05:48', '2026-05-07 04:51:31', '2026-05-07 05:05:48'),
('2dc06b5e-c2f6-4583-9d47-4c09dace92be', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 18, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Flashdisk milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":333}', NULL, '2026-05-01 21:38:00', '2026-05-01 21:38:00'),
('2dca2d1b-1e5f-42d3-b45b-0fa2bee99df5', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Flashdisk ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 08:59:31', '2026-05-01 08:59:20', '2026-05-01 08:59:31'),
('2f67eef5-f671-4c04-a7e5-c94eeebf2b5d', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Harddisk External ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 08:59:31', '2026-05-01 08:59:27', '2026-05-01 08:59:31'),
('2fc85b3d-c41e-4b5e-8702-4d8f2fa8c637', 'App\\Notifications\\PengajuanDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengajuan Ditolak \\u274c\",\"message\":\"Pengajuan untuk Flashdisk ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 03:56:50', '2026-05-02 03:56:28', '2026-05-02 03:56:50'),
('30e26bd0-320b-42a4-8b97-c6851d15c5dd', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Proyektor untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_detail\":421,\"type\":\"peminjaman\"}', '2026-05-07 19:00:36', '2026-05-07 05:06:35', '2026-05-07 19:00:36'),
('30f01d86-824b-4014-bc32-8708ebd02d16', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Flashdisk untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_peminjaman\":210}', '2026-05-01 21:34:30', '2026-05-01 21:33:17', '2026-05-01 21:34:30'),
('3249854e-4acb-440e-a0d3-9c296e1cea39', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Harddisk External ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 02:27:07', '2026-05-01 22:52:04', '2026-05-02 02:27:07'),
('326506cc-4946-445d-935b-c54abd3800b1', 'App\\Notifications\\PengembalianDisetujui', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Disetujui \\u2705\",\"message\":\"Pengembalian Harddisk External telah diterima\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 03:59:16', '2026-05-02 03:58:52', '2026-05-02 03:59:16'),
('33b7c1ab-4fb9-423f-b29f-18896cfae0a8', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 18, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru <b>dani<\\/b> menyetujui pengembalian barang <b>Harddisk External<\\/b> milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":320}', NULL, '2026-05-01 21:26:36', '2026-05-01 21:26:36'),
('346b2cf4-8b09-44a2-a362-934c13a266b5', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Harddisk External milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":292,\"type\":\"pengembalian\"}', '2026-05-01 22:52:22', '2026-05-01 22:49:05', '2026-05-01 22:52:22'),
('350c00f2-9501-4d39-982b-310455393245', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Mouse milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":null,\"type\":\"pengembalian\"}', '2026-05-01 22:30:08', '2026-05-01 22:07:28', '2026-05-01 22:30:08'),
('35509f58-ea31-44ae-9b2a-3e768bb8aa81', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Harddisk External milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":292,\"type\":\"pengembalian\"}', '2026-05-02 03:17:41', '2026-05-02 02:29:16', '2026-05-02 03:17:41'),
('3653a89b-1009-4b03-8dce-08466faa58a4', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Mouse milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":326,\"type\":\"pengembalian\"}', '2026-05-02 03:59:41', '2026-05-02 03:55:13', '2026-05-02 03:59:41'),
('36b2eb5c-4d67-4cdc-bb8e-68d823fb8c33', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 18, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Mouse untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_peminjaman\":211}', NULL, '2026-05-01 21:35:06', '2026-05-01 21:35:06'),
('36f54413-4d72-4dd4-a2a8-cec8d2bd2c75', 'App\\Notifications\\PengembalianDisetujui', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Disetujui \\u2705\",\"message\":\"Pengembalian Laptop telah diterima\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 20:33:40', '2026-05-01 20:33:26', '2026-05-01 20:33:40'),
('379ef9d8-5d81-446f-a066-553d197425f2', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 18, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Harddisk External milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":292,\"type\":\"pengembalian\"}', NULL, '2026-05-02 02:29:17', '2026-05-02 02:29:17'),
('3801a6d2-a5f7-405e-bb74-a0157cb1131e', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Mouse milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":296,\"type\":\"pengembalian\"}', '2026-05-02 03:58:55', '2026-05-02 03:57:18', '2026-05-02 03:58:55'),
('38f303bc-0091-453d-b424-f8c90560a438', 'App\\Notifications\\PengajuanDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengajuan Ditolak \\u274c\",\"message\":\"Pengajuan untuk Flashdisk ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 20:34:23', '2026-05-01 20:34:17', '2026-05-01 20:34:23'),
('39556046-0d1b-425b-a27d-6ae3c8f85939', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Laptop ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 20:33:21', '2026-05-01 20:33:13', '2026-05-01 20:33:21'),
('399b860e-ffab-4487-bb35-2dd41a1f54fa', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Mouse untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_peminjaman\":211}', '2026-05-01 21:35:19', '2026-05-01 21:35:06', '2026-05-01 21:35:19'),
('39f1a48c-4a98-4ebe-a0cc-c1eb24de7b4b', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Net milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":330,\"type\":\"pengembalian\"}', '2026-05-02 04:37:05', '2026-05-02 04:35:45', '2026-05-02 04:37:05'),
('3a3c71fa-3886-4f0d-877e-af22963d517f', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Flashdisk ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 09:25:09', '2026-05-01 09:25:09', '2026-05-01 09:25:09'),
('3a499cf2-4860-4319-8361-24d81e194297', 'App\\Notifications\\PengembalianDisetujui', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Disetujui \\u2705\",\"message\":\"Pengembalian Harddisk External telah diterima\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 20:39:01', '2026-05-01 20:36:29', '2026-05-01 20:39:01'),
('3aa4bb26-f26a-4bf6-ab59-ac4a5a77f3f2', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Flashdisk untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_detail\":398,\"type\":\"peminjaman\"}', '2026-05-02 04:24:04', '2026-05-02 04:23:45', '2026-05-02 04:24:04'),
('3b333af1-86e6-4ef5-bf4b-48965063f5ff', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Mouse ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 09:25:09', '2026-05-01 09:25:09', '2026-05-01 09:25:09'),
('3c0f8b05-6e07-434c-9a0c-74c4eb164727', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Harddisk External untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_detail\":366,\"type\":\"peminjaman\"}', '2026-05-02 03:17:41', '2026-05-02 03:07:55', '2026-05-02 03:17:41'),
('3cc9b60f-4459-415f-a973-7da683f41616', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Mouse untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_detail\":401,\"type\":\"peminjaman\"}', '2026-05-02 04:26:00', '2026-05-02 04:24:28', '2026-05-02 04:26:00'),
('3ceaca8a-371e-4509-b8bd-7bdb4c82e369', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Proyektor untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_detail\":419,\"type\":\"peminjaman\"}', '2026-05-02 04:48:48', '2026-05-02 04:48:30', '2026-05-02 04:48:48'),
('3e2f8f87-02b8-4a82-b8d9-2edfe7efd8d4', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Harddisk External untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_detail\":379,\"type\":\"peminjaman\"}', '2026-05-02 03:59:31', '2026-05-02 03:55:46', '2026-05-02 03:59:31'),
('3e60d92a-a279-4d33-8307-d6aa62c62f21', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Laptop ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 09:24:03', '2026-05-01 09:23:58', '2026-05-01 09:24:03'),
('3f4f1cc5-fc2c-4d6f-90f9-aaae6fe0847c', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Harddisk External ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 06:08:17', '2026-05-02 06:00:08', '2026-05-02 06:08:17'),
('3f8660dc-dc31-4321-9572-f74fc5918da2', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 18, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Harddisk External milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":320,\"type\":\"pengembalian\"}', NULL, '2026-05-02 02:29:19', '2026-05-02 02:29:19'),
('40f40e6e-d9c7-4ee8-b492-bb192d6c7166', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Laptop ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 08:59:31', '2026-05-01 08:59:27', '2026-05-01 08:59:31'),
('421f93c1-0708-4859-9973-80d86c828de3', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Harddisk External ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 03:39:30', '2026-05-02 02:41:44', '2026-05-02 03:39:30'),
('42633598-f8f4-46b9-b83c-580621fef3b3', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Harddisk External milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":292,\"type\":\"pengembalian\"}', '2026-05-02 03:17:41', '2026-05-02 02:32:46', '2026-05-02 03:17:41'),
('429a933c-c095-406e-9c02-6e24c8e76af7', 'App\\Notifications\\PengajuanDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengajuan Ditolak \\u274c\",\"message\":\"Pengajuan untuk Flashdisk ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 20:33:21', '2026-05-01 20:32:44', '2026-05-01 20:33:21'),
('42e8ced0-86d7-49cb-9724-e6ebc46306b6', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Mouse milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":329,\"type\":\"pengembalian\"}', '2026-05-02 03:17:41', '2026-05-02 02:39:32', '2026-05-02 03:17:41'),
('4312f776-6665-4f6b-b550-b33fb69fdf6a', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Mouse ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 02:27:07', '2026-05-01 22:52:09', '2026-05-02 02:27:07'),
('432664c5-b8f5-4d26-b47e-3d0ec173819e', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 18, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Net untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_detail\":363,\"type\":\"peminjaman\"}', NULL, '2026-05-02 02:27:29', '2026-05-02 02:27:29'),
('46330521-0490-413e-8331-71ba32eb8b4e', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Mouse milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":296,\"type\":\"pengembalian\"}', '2026-05-01 22:49:19', '2026-05-01 22:49:06', '2026-05-01 22:49:19'),
('4671e0ad-7171-4d57-93cd-413a736d2da4', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Mouse ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 22:48:56', '2026-05-01 22:48:53', '2026-05-01 22:48:56'),
('47900ff0-fc9d-4ccb-a5f5-e2a7fdf0167d', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Flashdisk ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 08:59:31', '2026-05-01 08:59:27', '2026-05-01 08:59:31'),
('4852852d-7eb5-4691-a602-9a7dee9ff90a', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Mouse ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 20:33:40', '2026-05-01 20:33:29', '2026-05-01 20:33:40'),
('48542797-bb5b-426d-8455-1fcc0141e8e9', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Gamelan untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_detail\":411,\"type\":\"peminjaman\"}', '2026-05-02 04:31:10', '2026-05-02 04:27:34', '2026-05-02 04:31:10'),
('4a76ddac-1f5e-47d4-a405-2fa31ae237e6', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Harddisk External ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 02:27:07', '2026-05-01 22:51:59', '2026-05-02 02:27:07'),
('4aecdb81-cd22-456a-a998-69023428109a', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Mouse untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_detail\":396,\"type\":\"peminjaman\"}', '2026-05-02 04:23:30', '2026-05-02 04:23:07', '2026-05-02 04:23:30'),
('4c5e083e-7591-4a2b-bfc4-31f29536dfc1', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 18, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Mouse milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":329}', NULL, '2026-05-01 21:35:45', '2026-05-01 21:35:45'),
('4e88e407-8bc4-430d-b850-f8e914052f75', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 18, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Mouse milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":null,\"type\":\"pengembalian\"}', NULL, '2026-05-01 22:42:18', '2026-05-01 22:42:18'),
('4f39725c-075f-4579-a586-d10209782f55', 'App\\Notifications\\PengajuanDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengajuan Ditolak \\u274c\",\"message\":\"Pengajuan untuk Harddisk External ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-07 05:05:48', '2026-05-07 04:54:48', '2026-05-07 05:05:48'),
('4f701d2b-d0d1-4ae2-ba16-3626db1d35a0', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 18, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Mouse milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":296,\"type\":\"pengembalian\"}', NULL, '2026-05-02 02:32:47', '2026-05-02 02:32:47'),
('4fd93121-cbd0-415c-b2f7-f9f43659e844', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Mouse milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":329,\"type\":\"pengembalian\"}', '2026-05-02 04:37:05', '2026-05-02 04:35:32', '2026-05-02 04:37:05'),
('501b9c95-9989-40d3-b8a3-2dfbaf75c571', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Harddisk External milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":324,\"type\":\"pengembalian\"}', '2026-05-02 03:17:41', '2026-05-02 02:30:59', '2026-05-02 03:17:41'),
('5097ffbc-55ae-4c8a-adec-03038640bfd6', 'App\\Notifications\\PengajuanDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengajuan Ditolak \\u274c\",\"message\":\"Pengajuan untuk Flashdisk ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 04:00:11', '2026-05-02 04:00:01', '2026-05-02 04:00:11'),
('520b6bd1-4fea-4738-8114-7e0c3280525b', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Mouse ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 20:36:20', '2026-05-01 20:35:07', '2026-05-01 20:36:20'),
('539a6507-4675-4095-8ab6-ddc241e5a3e9', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Flashdisk ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 09:24:03', '2026-05-01 09:23:58', '2026-05-01 09:24:03'),
('54d902f7-39e9-4034-a45b-6e211901e82e', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 18, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Harddisk External milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":320,\"type\":\"pengembalian\"}', NULL, '2026-05-02 02:54:02', '2026-05-02 02:54:02'),
('566eeeea-cc69-4933-9fbc-5704f421c6c0', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 18, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Mouse milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":326}', NULL, '2026-05-01 21:35:44', '2026-05-01 21:35:44'),
('56ed5f8d-678b-4377-97b8-603df839196f', 'App\\Notifications\\PengajuanDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengajuan Ditolak \\u274c\",\"message\":\"Pengajuan untuk Flashdisk ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-07 05:05:48', '2026-05-07 04:58:31', '2026-05-07 05:05:48'),
('58bede51-6b71-46ff-87fc-43b43d5cac13', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Mouse milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":326,\"type\":\"pengembalian\"}', '2026-05-02 04:18:19', '2026-05-02 04:01:22', '2026-05-02 04:18:19'),
('58d3769c-c472-45c9-8f4c-c00ad3876852', 'App\\Notifications\\PengembalianDisetujui', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Disetujui \\u2705\",\"message\":\"Pengembalian Mouse telah diterima\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 04:00:32', '2026-05-02 04:00:18', '2026-05-02 04:00:32'),
('5ac74218-5302-4ae8-987e-378d93872e68', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Mouse milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":329,\"type\":\"pengembalian\"}', '2026-05-02 03:17:41', '2026-05-02 03:01:30', '2026-05-02 03:17:41'),
('5b422f44-1142-4f0a-bf56-06808fd23e2c', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Mouse ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 02:27:07', '2026-05-01 22:52:19', '2026-05-02 02:27:07'),
('5be2908b-e9a9-40fc-b045-5b5479eaa9c3', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 18, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Harddisk External milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":332,\"type\":\"pengembalian\"}', NULL, '2026-05-02 02:40:45', '2026-05-02 02:40:45'),
('5c6e326d-7c33-40cb-adec-f8e903edc7e6', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Mouse milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":326,\"type\":\"pengembalian\"}', '2026-05-07 04:36:37', '2026-05-02 06:08:11', '2026-05-07 04:36:37'),
('5c729b79-9fe0-4b3b-9af4-044d87ea6052', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru <b>dani<\\/b> mengajukan peminjaman untuk Rahma Farhah. Barang: Laptop\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_peminjaman\":167}', '2026-05-01 09:21:02', '2026-05-01 09:20:55', '2026-05-01 09:21:02'),
('5d649da8-cc8c-4c9b-b784-b8b63e4efcbc', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Flashdisk untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_detail\":369,\"type\":\"peminjaman\"}', '2026-05-02 03:17:41', '2026-05-02 03:08:57', '2026-05-02 03:17:41'),
('5d7afa08-22b3-465c-ad2c-7fe3e2a5aeb2', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Mouse milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":296,\"type\":\"pengembalian\"}', '2026-05-02 03:17:41', '2026-05-02 02:52:04', '2026-05-02 03:17:41'),
('5eb3d4d1-d75c-4b24-a820-5236e091faae', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Harddisk External ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 09:24:03', '2026-05-01 09:23:58', '2026-05-01 09:24:03'),
('5ec43a6d-d9cb-411c-9e89-a53b6b84bcdc', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Harddisk External ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 03:39:30', '2026-05-02 02:32:11', '2026-05-02 03:39:30'),
('5f77f346-8773-4d9c-bc0c-ac617b1a4eaa', 'App\\Notifications\\PengembalianDisetujui', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Disetujui \\u2705\",\"message\":\"Pengembalian Harddisk External telah diterima\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 08:59:31', '2026-05-01 08:59:25', '2026-05-01 08:59:31'),
('60257fde-5e1d-44fc-9683-9f4189763739', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Harddisk External milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":322,\"type\":\"pengembalian\"}', '2026-05-02 03:17:41', '2026-05-02 02:34:42', '2026-05-02 03:17:41'),
('60f82889-a866-420c-88f1-1c93af99531a', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Mouse ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 04:33:01', '2026-05-02 04:26:47', '2026-05-02 04:33:01'),
('611bdecb-b5d4-422f-8baf-90297e13cf03', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 18, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Harddisk External milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":324,\"type\":\"pengembalian\"}', NULL, '2026-05-02 02:30:59', '2026-05-02 02:30:59'),
('62d98e0e-0ab2-4238-a637-3936c5d486f6', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Harddisk External ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 22:48:56', '2026-05-01 22:07:14', '2026-05-01 22:48:56'),
('6339e16a-60d3-44b0-9513-1d5dab975be7', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 18, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Mouse milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":296,\"type\":\"pengembalian\"}', NULL, '2026-05-02 02:52:04', '2026-05-02 02:52:04'),
('63708ddb-d716-41da-a8e2-5269ac221614', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 18, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Mouse milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":296,\"type\":\"pengembalian\"}', NULL, '2026-05-02 02:52:04', '2026-05-02 02:52:04'),
('642ecfa7-6491-475c-bb96-1e52c6b5af62', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Harddisk External ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 03:39:30', '2026-05-02 02:41:39', '2026-05-02 03:39:30'),
('6533a0b1-9c2f-4791-b919-3f6e1bb565ec', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Proyektor untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_detail\":416,\"type\":\"peminjaman\"}', '2026-05-02 04:43:12', '2026-05-02 04:42:01', '2026-05-02 04:43:12'),
('6930dd93-3d7b-4eaf-a017-c614674445d9', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Harddisk External milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":292,\"type\":\"pengembalian\"}', '2026-05-02 03:17:41', '2026-05-02 02:51:29', '2026-05-02 03:17:41'),
('699bdad0-a810-4664-a206-4def6d23afe0', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Harddisk External milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":null,\"type\":\"pengembalian\"}', '2026-05-01 22:14:11', '2026-05-01 22:07:29', '2026-05-01 22:14:11'),
('69fa3cfa-e464-400d-80da-13de9cd279cd', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Mouse milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":326,\"type\":\"pengembalian\"}', '2026-05-02 03:17:41', '2026-05-02 02:31:20', '2026-05-02 03:17:41'),
('6a7feff1-a997-4f1a-90e5-62bf3ee54e13', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Net milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":330,\"type\":\"pengembalian\"}', '2026-05-02 03:17:41', '2026-05-02 03:01:51', '2026-05-02 03:17:41');
INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('6b212141-e44d-4000-abb2-ce36e60ccfbf', 'App\\Notifications\\PengajuanDisetujui', 'App\\Models\\User', 1, '{\"title\":\"Pengajuan Disetujui \\u2705\",\"message\":\"Pengajuan untuk Harddisk External telah disetujui\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 03:56:14', '2026-05-02 03:54:27', '2026-05-02 03:56:14'),
('6bb5ba57-a58b-475d-8a34-8f2b7738c79f', 'App\\Notifications\\PengajuanDisetujui', 'App\\Models\\User', 1, '{\"title\":\"Pengajuan Disetujui \\u2705\",\"message\":\"Pengajuan untuk Harddisk External telah disetujui\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 09:24:03', '2026-05-01 09:23:46', '2026-05-01 09:24:03'),
('6cecb1b3-58e7-4ef3-8f8f-3d831b9b37f1', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Mouse ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 20:33:21', '2026-05-01 20:33:13', '2026-05-01 20:33:21'),
('6cf8323f-8f1e-4307-a098-9fe1d91c050c', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Flashdisk untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_detail\":400,\"type\":\"peminjaman\"}', '2026-05-02 04:26:00', '2026-05-02 04:24:28', '2026-05-02 04:26:00'),
('6d89b713-a457-4ad0-b636-68a735cd4a36', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Flashdisk ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 20:33:40', '2026-05-01 20:33:29', '2026-05-01 20:33:40'),
('6da6b766-3616-4967-9e92-4d23124defa8', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Harddisk External milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":null,\"type\":\"pengembalian\"}', '2026-05-01 22:07:40', '2026-05-01 22:07:28', '2026-05-01 22:07:40'),
('6f32b745-1f77-418e-9aea-0dc2532c0504', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 18, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Harddisk External milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":324}', NULL, '2026-05-01 21:34:20', '2026-05-01 21:34:20'),
('703635ba-3d1a-4525-a68b-594f07430c88', 'App\\Notifications\\PengembalianDisetujui', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Disetujui \\u2705\",\"message\":\"Pengembalian Laptop telah diterima\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 09:24:03', '2026-05-01 09:23:55', '2026-05-01 09:24:03'),
('71c50335-16b2-4ff7-bcf9-adcb43ccd6ca', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Mouse milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":326,\"type\":\"pengembalian\"}', '2026-05-02 03:17:41', '2026-05-02 03:01:18', '2026-05-02 03:17:41'),
('720cae00-022c-4f55-9767-8439f58cbb04', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Speaker untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_detail\":412,\"type\":\"peminjaman\"}', '2026-05-02 04:31:10', '2026-05-02 04:27:34', '2026-05-02 04:31:10'),
('72152be3-b790-4770-af86-ac84bbd21302', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Laptop ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 08:59:31', '2026-05-01 08:59:22', '2026-05-01 08:59:31'),
('7240f05b-6a5e-4295-9983-eea34ef38b73', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Harddisk External untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_detail\":382,\"type\":\"peminjaman\"}', '2026-05-02 04:18:19', '2026-05-02 04:05:05', '2026-05-02 04:18:19'),
('73ad64aa-6029-4c0e-8b94-2f872aa79ceb', 'App\\Notifications\\PengembalianDisetujui', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Disetujui \\u2705\",\"message\":\"Pengembalian Flashdisk telah diterima\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 20:33:21', '2026-05-01 20:33:10', '2026-05-01 20:33:21'),
('749ee73e-d35c-464e-bb01-6bfb47cf1fb1', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Proyektor untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_detail\":414,\"type\":\"peminjaman\"}', '2026-05-02 04:43:12', '2026-05-02 04:42:01', '2026-05-02 04:43:12'),
('763467b9-9eb8-4c08-911a-7b4f85cc7cab', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Flashdisk milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":333}', '2026-05-01 21:38:05', '2026-05-01 21:37:59', '2026-05-01 21:38:05'),
('763ff3d0-e150-4546-be5c-44a012b56b6f', 'App\\Notifications\\PengajuanDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengajuan Ditolak \\u274c\",\"message\":\"Pengajuan untuk Mouse ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 03:59:48', '2026-05-02 03:59:25', '2026-05-02 03:59:48'),
('76750d68-067a-4a96-9bd3-dba432d2150d', 'App\\Notifications\\PengajuanDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengajuan Ditolak \\u274c\",\"message\":\"Pengajuan untuk Harddisk External ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 09:24:58', '2026-05-01 09:24:50', '2026-05-01 09:24:58'),
('784f4b6f-c092-4bbe-ba27-496dd6106f9a', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Harddisk External milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":322,\"type\":\"pengembalian\"}', '2026-05-02 03:17:41', '2026-05-02 02:57:47', '2026-05-02 03:17:41'),
('79637992-acce-441f-ac8b-d4263addb69a', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Harddisk External untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_detail\":368,\"type\":\"peminjaman\"}', '2026-05-02 03:17:41', '2026-05-02 03:08:57', '2026-05-02 03:17:41'),
('79abe77f-203d-4188-9f4a-8d2b8478ce60', 'App\\Notifications\\PengajuanDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengajuan Ditolak \\u274c\",\"message\":\"Pengajuan untuk Mouse ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 04:19:09', '2026-05-02 04:19:03', '2026-05-02 04:19:09'),
('7a04e42b-11fc-4387-9d68-087b86c15af2', 'App\\Notifications\\PengembalianDisetujui', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Disetujui \\u2705\",\"message\":\"Pengembalian Mouse telah diterima\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 20:36:20', '2026-05-01 20:35:04', '2026-05-01 20:36:20'),
('7add9b10-96c6-4fb4-8dd1-48ff4ebc0abc', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Harddisk External ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 08:59:31', '2026-05-01 08:59:20', '2026-05-01 08:59:31'),
('7b4926fd-88ee-4341-88cf-9815e70306a9', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Harddisk External milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":320,\"type\":\"pengembalian\"}', '2026-05-02 03:17:41', '2026-05-02 02:29:19', '2026-05-02 03:17:41'),
('7c04d217-2f36-4b00-b31b-7f533a1d3cb6', 'App\\Notifications\\PengajuanDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengajuan Ditolak \\u274c\",\"message\":\"Pengajuan untuk Laptop ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-07 05:05:48', '2026-05-07 05:03:54', '2026-05-07 05:05:48'),
('7dd7c218-5ad4-400f-a3fd-250b2577a7ff', 'App\\Notifications\\PengajuanDisetujui', 'App\\Models\\User', 1, '{\"title\":\"Pengajuan Disetujui \\u2705\",\"message\":\"Pengajuan untuk Harddisk External telah disetujui\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 03:59:48', '2026-05-02 03:59:21', '2026-05-02 03:59:48'),
('7e2ca31e-a04c-45ed-8fab-1718d753bb48', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Harddisk External ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 20:39:01', '2026-05-01 20:36:38', '2026-05-01 20:39:01'),
('7f6be018-941c-47ec-aaf6-372659bb743c', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Flashdisk milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":333,\"type\":\"pengembalian\"}', '2026-05-02 03:17:41', '2026-05-02 02:41:20', '2026-05-02 03:17:41'),
('7fbed462-de3d-4df4-a80f-c5e219263a74', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Mouse ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 03:56:14', '2026-05-02 03:54:09', '2026-05-02 03:56:14'),
('7fdd738f-b4d8-4516-8028-b76c0ba79de3', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 18, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru <b>dani<\\/b> mengajukan peminjaman untuk Rahma Farhah. Barang: Flashdisk\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_peminjaman\":209}', NULL, '2026-05-01 21:29:33', '2026-05-01 21:29:33'),
('7ffcfca3-cf0d-4c3b-b7eb-ac4063bee6c3', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Harddisk External milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":320,\"type\":\"pengembalian\"}', '2026-05-02 03:17:41', '2026-05-02 02:34:41', '2026-05-02 03:17:41'),
('800804b5-5e4c-4eee-8834-fc0c28366db1', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Harddisk External milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":292,\"type\":\"pengembalian\"}', '2026-05-02 04:00:06', '2026-05-02 03:28:34', '2026-05-02 04:00:06'),
('81a2261f-0f1d-43b7-b9a9-b854a74bffbb', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Laptop untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_detail\":394,\"type\":\"peminjaman\"}', '2026-05-02 04:23:30', '2026-05-02 04:23:07', '2026-05-02 04:23:30'),
('82d0b6d1-f561-406f-8a23-87f7972a0ea2', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Mouse ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 09:24:03', '2026-05-01 09:23:58', '2026-05-01 09:24:03'),
('846c71b5-251b-41e9-a0d4-e4721c9d383e', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Mouse ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 04:33:01', '2026-05-02 04:26:52', '2026-05-02 04:33:01'),
('85fe5ad1-b79e-41ad-9fb8-6709e91cf300', 'App\\Notifications\\PengembalianDisetujui', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Disetujui \\u2705\",\"message\":\"Pengembalian Laptop telah diterima\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 09:24:35', '2026-05-01 09:24:08', '2026-05-01 09:24:35'),
('865fe3f4-d690-4b71-8001-ea7215884fd9', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Proyektor untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_detail\":406,\"type\":\"peminjaman\"}', '2026-05-02 04:26:00', '2026-05-02 04:25:04', '2026-05-02 04:26:00'),
('8a1304c0-0324-4c60-bfcd-fef02a364b64', 'App\\Notifications\\PengembalianDisetujui', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Disetujui \\u2705\",\"message\":\"Pengembalian Laptop telah diterima\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 08:59:31', '2026-05-01 08:59:17', '2026-05-01 08:59:31'),
('8a88a662-3383-48a3-bfc2-50533edc85b2', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Mouse ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 20:39:26', '2026-05-01 20:39:14', '2026-05-01 20:39:26'),
('8b0b418e-c4ab-422a-aa2f-e67db0605102', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Harddisk External untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_detail\":378,\"type\":\"peminjaman\"}', '2026-05-02 03:59:41', '2026-05-02 03:38:55', '2026-05-02 03:59:41'),
('8b1efa40-aeb8-48ab-bfde-26cf03552e23', 'App\\Notifications\\PengajuanDisetujui', 'App\\Models\\User', 1, '{\"title\":\"Pengajuan Disetujui \\u2705\",\"message\":\"Pengajuan untuk Harddisk External telah disetujui\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 03:59:48', '2026-05-02 03:59:34', '2026-05-02 03:59:48'),
('8b8cfb0c-fcfb-49d8-b059-2c740ebce01e', 'App\\Notifications\\PengajuanDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengajuan Ditolak \\u274c\",\"message\":\"Pengajuan untuk Flashdisk ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 03:59:16', '2026-05-02 03:59:06', '2026-05-02 03:59:16'),
('8be6e1f9-3987-42ff-8490-61a33513a686', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Harddisk External ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 03:39:30', '2026-05-02 02:32:22', '2026-05-02 03:39:30'),
('8bf1d805-077e-4c41-b903-0c904e5fc1f0', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Mouse untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_detail\":391,\"type\":\"peminjaman\"}', '2026-05-02 04:19:06', '2026-05-02 04:18:37', '2026-05-02 04:19:06'),
('8c285f79-a538-44a8-b7bb-75a098686f39', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Net milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":330,\"type\":\"pengembalian\"}', '2026-05-07 04:36:37', '2026-05-02 06:08:12', '2026-05-07 04:36:37'),
('8e9b34d3-32f8-4cd3-a2a1-e17ba47887d2', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Harddisk External milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":292,\"type\":\"pengembalian\"}', '2026-05-07 04:36:37', '2026-05-02 06:08:09', '2026-05-07 04:36:37'),
('8eadc8ac-ae6f-463b-906b-c9db88bff0ba', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Harddisk External untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_detail\":397,\"type\":\"peminjaman\"}', '2026-05-02 04:24:04', '2026-05-02 04:23:45', '2026-05-02 04:24:04'),
('8f3f24b4-a19c-4f8c-97d8-ab98852ea678', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Net untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_detail\":363,\"type\":\"peminjaman\"}', '2026-05-02 03:17:41', '2026-05-02 02:27:29', '2026-05-02 03:17:41'),
('90690b5c-23ea-4f99-bd86-4335e802e809', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Mouse untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_detail\":415,\"type\":\"peminjaman\"}', '2026-05-02 04:43:12', '2026-05-02 04:42:01', '2026-05-02 04:43:12'),
('908889f8-e69c-4b92-941a-fc1bad596c1f', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Mouse milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":296,\"type\":\"pengembalian\"}', '2026-05-02 03:17:41', '2026-05-02 02:29:18', '2026-05-02 03:17:41'),
('90be81ae-f217-4c5e-931d-e91dd626cd96', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Harddisk External milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":324,\"type\":\"pengembalian\"}', '2026-05-02 02:59:14', '2026-05-02 02:58:43', '2026-05-02 02:59:14'),
('921b163b-5be3-4b4c-acc2-410f6894cac3', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 18, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Mouse milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":296,\"type\":\"pengembalian\"}', NULL, '2026-05-01 22:49:06', '2026-05-01 22:49:06'),
('93a3561f-1743-4a7a-8fd6-7e4caab18309', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Mouse untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_detail\":417,\"type\":\"peminjaman\"}', '2026-05-02 04:43:12', '2026-05-02 04:42:54', '2026-05-02 04:43:12'),
('93b9fbab-aa90-4c8e-8a4e-511f487ed4f3', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Harddisk External untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_detail\":393,\"type\":\"peminjaman\"}', '2026-05-02 04:22:49', '2026-05-02 04:22:16', '2026-05-02 04:22:49'),
('93c27a25-0f8b-4077-847e-816b2a460d82', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 18, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Flashdisk untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_peminjaman\":211}', NULL, '2026-05-01 21:35:06', '2026-05-01 21:35:06'),
('94227c49-b2ad-429b-96b2-32474abda6cd', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 18, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Harddisk External milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":322,\"type\":\"pengembalian\"}', NULL, '2026-05-02 02:57:47', '2026-05-02 02:57:47'),
('94ac399d-1a31-419e-b8bc-19093df7bf19', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 18, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Flashdisk milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":333,\"type\":\"pengembalian\"}', NULL, '2026-05-02 02:41:20', '2026-05-02 02:41:20'),
('959bf4ca-da31-463a-9f11-958640caa28a', 'App\\Notifications\\PengembalianDisetujui', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Disetujui \\u2705\",\"message\":\"Pengembalian Harddisk External telah diterima\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 03:59:48', '2026-05-02 03:59:39', '2026-05-02 03:59:48'),
('95d2ae54-8303-4e73-962a-8440fd97a4ad', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Mouse untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_detail\":405,\"type\":\"peminjaman\"}', '2026-05-02 04:26:00', '2026-05-02 04:25:04', '2026-05-02 04:26:00'),
('96a95905-193c-401a-ab63-b77c980895a0', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Mouse ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 03:39:30', '2026-05-02 02:41:52', '2026-05-02 03:39:30'),
('97688235-b4c1-4194-9d73-3b39e628b57f', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Harddisk External ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 03:39:30', '2026-05-02 02:32:17', '2026-05-02 03:39:30'),
('982c4f99-dcaa-4b50-9ce7-aa3ef94f286e', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 18, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Mouse milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":291,\"type\":\"pengembalian\"}', NULL, '2026-05-01 22:52:34', '2026-05-01 22:52:34'),
('986c7c8a-120a-4e56-a033-b1620af030d4', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Laptop ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 08:59:31', '2026-05-01 08:59:20', '2026-05-01 08:59:31'),
('997e4bba-8121-4935-8d0f-e3050f06437a', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Harddisk External ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 20:36:20', '2026-05-01 20:35:07', '2026-05-01 20:36:20'),
('997eb070-7ff9-4561-98c2-56ad6174c878', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Laptop ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 20:33:40', '2026-05-01 20:33:29', '2026-05-01 20:33:40'),
('99ce7969-9c79-45a5-8d94-fdb9ba2ec9c3', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Mouse untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_detail\":375,\"type\":\"peminjaman\"}', '2026-05-02 04:00:06', '2026-05-02 03:27:16', '2026-05-02 04:00:06'),
('99e18ac5-ddf9-4056-b6f5-c7cdeda5382b', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Harddisk External ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 03:39:30', '2026-05-02 02:41:47', '2026-05-02 03:39:30'),
('9a8aa63b-31d4-424d-93ae-b9967fa3b9c3', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Flashdisk ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 08:59:31', '2026-05-01 08:59:22', '2026-05-01 08:59:31'),
('9aab9943-94b5-4404-b4aa-71da0489464b', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Harddisk External ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 22:48:56', '2026-05-01 22:48:51', '2026-05-01 22:48:56'),
('9aba406b-0e8b-4ded-a294-d0bdec3e275e', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 18, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Mouse milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":null,\"type\":\"pengembalian\"}', NULL, '2026-05-01 22:07:27', '2026-05-01 22:07:27'),
('9bd74c19-3717-4372-a093-8905e708290f', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Harddisk External milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":292,\"type\":\"pengembalian\"}', '2026-05-02 04:18:19', '2026-05-02 04:01:00', '2026-05-02 04:18:19'),
('9d37ff7a-598e-44b2-9d41-02ef69103250', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Mouse milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":326}', '2026-05-01 21:35:57', '2026-05-01 21:35:44', '2026-05-01 21:35:57'),
('9ea04c83-7ffa-4c43-b87a-05c97069ebe8', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Laptop ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 20:39:01', '2026-05-01 20:36:38', '2026-05-01 20:39:01'),
('a03eec5a-f70d-431d-896a-78c1d972bc31', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Mouse ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 03:39:30', '2026-05-02 02:59:11', '2026-05-02 03:39:30'),
('a077f485-8548-4d00-90cb-8b3c4a247f05', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Harddisk External milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":378,\"type\":\"pengembalian\"}', '2026-05-02 04:18:19', '2026-05-02 04:04:17', '2026-05-02 04:18:19'),
('a16e91f5-44e0-4c29-9d54-68abf63f8a4a', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Harddisk External ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 22:48:56', '2026-05-01 22:48:56', '2026-05-01 22:48:56'),
('a2c540a5-5a81-49e8-95c1-ee09a176f818', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Harddisk External milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":324,\"type\":\"pengembalian\"}', '2026-05-02 04:18:19', '2026-05-02 04:03:21', '2026-05-02 04:18:19'),
('a3062473-ea53-4f29-86b3-d149da89e4ff', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Net ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 04:33:01', '2026-05-02 04:26:56', '2026-05-02 04:33:01'),
('a34ccbdb-3fad-4327-9458-f46cfbfb3833', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Flashdisk ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 20:39:01', '2026-05-01 20:36:38', '2026-05-01 20:39:01'),
('a57ef611-5be0-4006-a45c-f66d63f65357', 'App\\Notifications\\PengajuanDisetujui', 'App\\Models\\User', 1, '{\"title\":\"Pengajuan Disetujui \\u2705\",\"message\":\"Pengajuan untuk Flashdisk telah disetujui\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-07 05:05:48', '2026-05-07 04:52:35', '2026-05-07 05:05:48'),
('a5d55d91-3fd1-4c8e-865b-c177c47e5a97', 'App\\Notifications\\PengajuanDisetujui', 'App\\Models\\User', 1, '{\"title\":\"Pengajuan Disetujui \\u2705\",\"message\":\"Pengajuan untuk Harddisk External telah disetujui\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 20:34:00', '2026-05-01 20:33:46', '2026-05-01 20:34:00'),
('a5dd9426-14fb-4285-aae9-e910132df45c', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Flashdisk ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 09:24:35', '2026-05-01 09:24:11', '2026-05-01 09:24:35'),
('a5e92973-f777-476f-b034-c28347eeac90', 'App\\Notifications\\PengajuanDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengajuan Ditolak \\u274c\",\"message\":\"Pengajuan untuk Mouse ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 03:56:14', '2026-05-02 03:56:08', '2026-05-02 03:56:14'),
('a5eeef8a-1206-4b45-984d-9a0a141e7b70', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Harddisk External untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_detail\":378,\"type\":\"peminjaman\"}', '2026-05-02 04:00:06', '2026-05-02 03:38:55', '2026-05-02 04:00:06'),
('a60ebf33-f224-4709-a634-64abf31185fb', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Flashdisk milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":333,\"type\":\"pengembalian\"}', '2026-05-02 04:00:06', '2026-05-02 03:26:35', '2026-05-02 04:00:06'),
('a7674e8c-7826-4e85-8111-25b2334abc21', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Harddisk External ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 08:59:31', '2026-05-01 08:59:22', '2026-05-01 08:59:31'),
('a801f9a4-5137-48f5-b558-90fc9a31ed94', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Mouse ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 03:39:30', '2026-05-02 03:28:13', '2026-05-02 03:39:30'),
('a8451084-51e8-491f-a051-d486595d8d8e', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Flashdisk untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_detail\":373,\"type\":\"peminjaman\"}', '2026-05-02 03:17:41', '2026-05-02 03:17:31', '2026-05-02 03:17:41'),
('a89b0d17-9f14-4eb6-bccb-a84041e146da', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Harddisk External ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 03:39:30', '2026-05-02 03:28:15', '2026-05-02 03:39:30'),
('ab1b3861-8494-4356-a8f9-1e45144ccb38', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Laptop untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_detail\":402,\"type\":\"peminjaman\"}', '2026-05-02 04:26:00', '2026-05-02 04:25:04', '2026-05-02 04:26:00'),
('abe798d8-c7ea-497e-a37f-bcd064b8e488', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Mouse ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 20:39:01', '2026-05-01 20:36:38', '2026-05-01 20:39:01'),
('ad462c83-82af-41c8-93cf-ef20387625d7', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 18, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Harddisk External untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_peminjaman\":211}', NULL, '2026-05-01 21:35:06', '2026-05-01 21:35:06'),
('ad9ac6e0-4af3-4e98-b430-b2a1485e4846', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Flashdisk untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_detail\":383,\"type\":\"peminjaman\"}', '2026-05-02 04:18:19', '2026-05-02 04:05:05', '2026-05-02 04:18:19'),
('ae524561-3626-49e8-90fe-e8a68bbe036c', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Mouse ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 08:59:31', '2026-05-01 08:59:22', '2026-05-01 08:59:31'),
('ae60b4ab-2123-4d78-8c16-54ceb30fbcc2', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Mouse ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 03:39:30', '2026-05-02 02:41:41', '2026-05-02 03:39:30'),
('ae77b6cc-3b6c-493d-a7eb-f1b6cdcf1a30', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Harddisk External ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 03:39:30', '2026-05-02 02:59:14', '2026-05-02 03:39:30'),
('aea8fdee-fc1d-4479-ae2f-1b6c2e255b8b', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Laptop untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_peminjaman\":210}', '2026-05-01 21:34:30', '2026-05-01 21:33:17', '2026-05-01 21:34:30'),
('b0c9dcc0-5f29-4ad5-9c02-9fbdde1e6c99', 'App\\Notifications\\PengajuanDisetujui', 'App\\Models\\User', 1, '{\"title\":\"Pengajuan Disetujui \\u2705\",\"message\":\"Pengajuan untuk Mouse telah disetujui\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-07 05:05:48', '2026-05-07 05:03:11', '2026-05-07 05:05:48'),
('b18488e1-c2e2-445a-933b-61df8dbc5255', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Mouse ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 22:48:56', '2026-05-01 22:07:17', '2026-05-01 22:48:56'),
('b3bb7d83-a329-4a7c-a0ba-e61bb3e65dcd', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 18, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Harddisk External milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":322,\"type\":\"pengembalian\"}', NULL, '2026-05-02 02:31:06', '2026-05-02 02:31:06'),
('b42c882b-6908-4e1f-8c70-dce31bd923ad', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Mouse milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":null,\"type\":\"pengembalian\"}', '2026-05-01 22:07:38', '2026-05-01 22:07:27', '2026-05-01 22:07:38'),
('b4babdef-b532-4170-ba5b-31c4177d29b1', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Mouse milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":296,\"type\":\"pengembalian\"}', '2026-05-02 03:17:41', '2026-05-02 02:52:04', '2026-05-02 03:17:41'),
('b6025457-fab0-4433-82bf-be0f9b7994e1', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 18, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Mouse milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":null,\"type\":\"pengembalian\"}', NULL, '2026-05-01 22:07:28', '2026-05-01 22:07:28'),
('b6ca9fa3-ab81-408d-bc39-a9f355282125', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 18, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Harddisk External milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":292,\"type\":\"pengembalian\"}', NULL, '2026-05-02 02:32:46', '2026-05-02 02:32:46'),
('b88432fd-bbf0-45e7-a074-a47ff1463a8d', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 18, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Mouse milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":326,\"type\":\"pengembalian\"}', NULL, '2026-05-02 02:35:36', '2026-05-02 02:35:36'),
('b9a7febb-f11e-4edc-ae0e-0e847611a8b0', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Mouse untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_detail\":365,\"type\":\"peminjaman\"}', '2026-05-02 03:17:41', '2026-05-02 03:05:45', '2026-05-02 03:17:41'),
('ba30cf2d-048e-46d2-8f40-30ea3bd9b836', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Net milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":344,\"type\":\"pengembalian\"}', '2026-05-02 04:18:19', '2026-05-02 04:04:15', '2026-05-02 04:18:19'),
('badbff95-a684-4ff3-baef-4325b2de847c', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Harddisk External ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 02:27:07', '2026-05-01 22:52:14', '2026-05-02 02:27:07'),
('bb598eea-0cde-44b8-b6c4-46019c03951e', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Harddisk External ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 20:33:21', '2026-05-01 20:33:13', '2026-05-01 20:33:21'),
('bb8f7f1f-0c9c-487d-81aa-7f69b7f9e9a2', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Mouse untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_detail\":418,\"type\":\"peminjaman\"}', '2026-05-02 04:48:48', '2026-05-02 04:48:30', '2026-05-02 04:48:48'),
('bc760f6e-e417-439a-abc8-eafd39c01de8', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Harddisk External milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":332,\"type\":\"pengembalian\"}', '2026-05-02 04:37:05', '2026-05-02 04:35:47', '2026-05-02 04:37:05'),
('bca417b9-f26e-4f0f-96ed-0c0df0191c10', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Laptop ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 09:25:09', '2026-05-01 09:25:09', '2026-05-01 09:25:09'),
('bcc765fd-53c0-4b1d-95dd-49bfb643469c', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Mouse ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 22:48:56', '2026-05-01 22:48:48', '2026-05-01 22:48:56'),
('bd2ac653-994f-4ac0-a081-dfa835d4f01e', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Harddisk External untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_detail\":384,\"type\":\"peminjaman\"}', '2026-05-02 04:18:19', '2026-05-02 04:11:32', '2026-05-02 04:18:19'),
('bdaff29d-1534-425c-a4f6-8ef94baa3801', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 18, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Laptop untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_peminjaman\":210}', NULL, '2026-05-01 21:33:17', '2026-05-01 21:33:17'),
('bdcd0d92-939f-4cb0-9d6e-60b0cf8a653f', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Harddisk External untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_peminjaman\":211}', '2026-05-01 21:35:19', '2026-05-01 21:35:06', '2026-05-01 21:35:19'),
('bf01e990-f5c8-4a72-9ef0-8da05a39ff0d', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Flashdisk untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_detail\":392,\"type\":\"peminjaman\"}', '2026-05-02 04:22:49', '2026-05-02 04:19:32', '2026-05-02 04:22:49'),
('bf58c100-f52c-4df1-9793-2b3429498d88', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Harddisk External ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 03:59:16', '2026-05-02 03:57:07', '2026-05-02 03:59:16'),
('bffe5197-db93-4bd0-9ed8-b006a7614720', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 18, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Harddisk External milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":322,\"type\":\"pengembalian\"}', NULL, '2026-05-02 02:57:47', '2026-05-02 02:57:47'),
('c199a6af-aa8e-44ad-abda-41b0e9229925', 'App\\Notifications\\PengajuanDisetujui', 'App\\Models\\User', 1, '{\"title\":\"Pengajuan Disetujui \\u2705\",\"message\":\"Pengajuan untuk Mouse telah disetujui\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 09:24:45', '2026-05-01 09:24:41', '2026-05-01 09:24:45'),
('c23fa14e-ba5f-4b62-931a-b05babeadf71', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Net ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 02:27:07', '2026-05-01 22:52:12', '2026-05-02 02:27:07'),
('c346822f-4cb7-4ae6-b5d2-d55366d7b14e', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Mouse milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":326,\"type\":\"pengembalian\"}', '2026-05-02 03:17:41', '2026-05-02 02:35:36', '2026-05-02 03:17:41'),
('c3a83ed2-6c13-4de6-b444-f0ba34f09ab8', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 18, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Net milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":330}', NULL, '2026-05-01 21:36:52', '2026-05-01 21:36:52'),
('c3d7ce5a-6631-4c23-ad0e-815221d393a6', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 18, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Flashdisk untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_peminjaman\":210}', NULL, '2026-05-01 21:33:17', '2026-05-01 21:33:17'),
('c42dc68c-5720-4005-b91a-0918d9173fd2', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Harddisk External untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_detail\":372,\"type\":\"peminjaman\"}', '2026-05-02 03:17:41', '2026-05-02 03:15:19', '2026-05-02 03:17:41'),
('c5100a78-8e56-4c97-a1e5-cc1c1a73a06a', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Flashdisk milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":333,\"type\":\"pengembalian\"}', '2026-05-02 04:43:12', '2026-05-02 04:37:09', '2026-05-02 04:43:12'),
('c59aed76-0284-49fd-8f55-685f8b68b991', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Mouse untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_detail\":381,\"type\":\"peminjaman\"}', '2026-05-02 03:59:36', '2026-05-02 03:55:46', '2026-05-02 03:59:36'),
('c5d7eeba-aace-4b70-a5bb-0645e41aacf4', 'App\\Notifications\\PengajuanDisetujui', 'App\\Models\\User', 1, '{\"title\":\"Pengajuan Disetujui \\u2705\",\"message\":\"Pengajuan untuk Mouse telah disetujui\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 20:33:21', '2026-05-01 20:32:47', '2026-05-01 20:33:21'),
('c5f9c8f0-ccc9-45da-a92b-1a9633f98a28', 'App\\Notifications\\PengajuanDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengajuan Ditolak \\u274c\",\"message\":\"Pengajuan untuk Flashdisk ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 03:56:50', '2026-05-02 03:56:25', '2026-05-02 03:56:50'),
('c620552b-ac59-4af0-8886-fed02bbe0243', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Harddisk External ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 04:33:01', '2026-05-02 04:26:43', '2026-05-02 04:33:01'),
('c6303bc9-b799-41d1-84e1-dea8a1107b01', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Flashdisk ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 20:33:21', '2026-05-01 20:33:13', '2026-05-01 20:33:21'),
('c65a7107-213e-4eae-9911-0c719232a551', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Harddisk External untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_detail\":376,\"type\":\"peminjaman\"}', '2026-05-02 04:00:06', '2026-05-02 03:29:00', '2026-05-02 04:00:06'),
('c680f6bc-9c56-4913-a1ab-5b633d737efd', 'App\\Notifications\\PengajuanDisetujui', 'App\\Models\\User', 1, '{\"title\":\"Pengajuan Disetujui \\u2705\",\"message\":\"Pengajuan untuk Harddisk External telah disetujui\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 09:24:35', '2026-05-01 09:24:16', '2026-05-01 09:24:35'),
('c6f67054-bb5f-455a-b164-57fa27826cfd', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Net milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":330}', '2026-05-01 21:37:05', '2026-05-01 21:36:52', '2026-05-01 21:37:05'),
('c749d14d-ec08-4d6f-8082-5c9730d34257', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Harddisk External milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":292,\"type\":\"pengembalian\"}', '2026-05-02 04:32:58', '2026-05-02 04:31:31', '2026-05-02 04:32:58'),
('c76282b1-e154-47d1-9ce1-e2e6a2a4c7aa', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Harddisk External milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":324,\"type\":\"pengembalian\"}', '2026-05-07 04:36:37', '2026-05-02 06:08:10', '2026-05-07 04:36:37'),
('c77512c3-03fd-4235-930c-b6b9d8d7717d', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 18, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Harddisk External milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":null,\"type\":\"pengembalian\"}', NULL, '2026-05-01 22:07:29', '2026-05-01 22:07:29'),
('c95516f9-5ef4-4c1a-9afd-e940f471f14c', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Flashdisk untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_detail\":409,\"type\":\"peminjaman\"}', '2026-05-02 04:31:10', '2026-05-02 04:26:10', '2026-05-02 04:31:10'),
('c99e40f0-4f78-435e-96b6-9b8dd810e104', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 18, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Harddisk External milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":null,\"type\":\"pengembalian\"}', NULL, '2026-05-01 22:07:28', '2026-05-01 22:07:28'),
('ca220223-bea0-4372-b683-56933cc4f5f6', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Harddisk External ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 06:08:17', '2026-05-02 06:00:11', '2026-05-02 06:08:17'),
('ca3f758a-301f-4d12-ae59-9572d88915b2', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Harddisk External milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":336,\"type\":\"pengembalian\"}', '2026-05-02 04:18:19', '2026-05-02 04:01:23', '2026-05-02 04:18:19'),
('cbda303f-b14f-47e8-ba85-8950f3b2ffd6', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Harddisk External milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":324,\"type\":\"pengembalian\"}', '2026-05-02 03:17:41', '2026-05-02 02:35:35', '2026-05-02 03:17:41'),
('cce5205d-9873-4ac5-b166-cfb14675c44b', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Mouse ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 03:39:30', '2026-05-02 02:41:54', '2026-05-02 03:39:30'),
('ce13c120-bd5a-49e6-9c98-ed4ea44ad75f', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Harddisk External untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_detail\":374,\"type\":\"peminjaman\"}', '2026-05-02 04:00:06', '2026-05-02 03:19:38', '2026-05-02 04:00:06');
INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('ce9b05bd-d0c7-4abb-b20b-97745d13fb65', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Mouse ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 02:27:07', '2026-05-01 22:52:02', '2026-05-02 02:27:07'),
('ceaef691-4fef-4efb-b7cb-4bebdb785472', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Mouse ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 22:48:56', '2026-05-01 22:42:09', '2026-05-01 22:48:56'),
('cecfb871-773f-4d05-afed-180443b14836', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru <b>dani<\\/b> mengajukan peminjaman untuk Rahma Farhah. Barang: Flashdisk\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_peminjaman\":209}', '2026-05-01 21:32:56', '2026-05-01 21:29:33', '2026-05-01 21:32:56'),
('cfb2ae65-b79f-4a97-b957-73f262a65a65', 'App\\Notifications\\PengajuanDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengajuan Ditolak \\u274c\",\"message\":\"Pengajuan untuk Harddisk External ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-07 05:05:48', '2026-05-07 04:51:35', '2026-05-07 05:05:48'),
('d1229bf7-ffaa-43c2-b110-8cc6b4d19000', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 18, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Mouse milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":296,\"type\":\"pengembalian\"}', NULL, '2026-05-02 02:29:18', '2026-05-02 02:29:18'),
('d156a4e7-ecc7-46a5-970c-9ad97e186d09', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Harddisk External milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":320,\"type\":\"pengembalian\"}', '2026-05-02 03:17:41', '2026-05-02 02:29:19', '2026-05-02 03:17:41'),
('d1b20f37-4cb4-40ee-aa1a-220c8151bdd8', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Harddisk External ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 04:00:32', '2026-05-02 04:00:25', '2026-05-02 04:00:32'),
('d1fb8c0a-2830-49b9-aa92-3612fddb3165', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Harddisk External milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":324,\"type\":\"pengembalian\"}', '2026-05-02 03:17:41', '2026-05-02 03:00:34', '2026-05-02 03:17:41'),
('d306289d-4076-4554-907c-6c9547d0bdff', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Harddisk External ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 03:59:16', '2026-05-02 03:56:58', '2026-05-02 03:59:16'),
('d3773bd7-798e-4a74-b193-571ed0215132', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 18, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Harddisk External milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":324,\"type\":\"pengembalian\"}', NULL, '2026-05-02 02:35:35', '2026-05-02 02:35:35'),
('d4496a84-d366-4dba-ba33-e451f15e7c10', 'App\\Notifications\\PengembalianDisetujui', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Disetujui \\u2705\",\"message\":\"Pengembalian Harddisk External telah diterima\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 03:56:14', '2026-05-02 03:53:51', '2026-05-02 03:56:14'),
('d45a2f05-f194-4d7a-8cab-eed1d73b6094', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Flashdisk untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_detail\":385,\"type\":\"peminjaman\"}', '2026-05-02 04:18:19', '2026-05-02 04:11:32', '2026-05-02 04:18:19'),
('d49b7536-415c-4f88-8606-65cbda38e709', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Harddisk External milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":322,\"type\":\"pengembalian\"}', '2026-05-02 03:17:41', '2026-05-02 02:57:47', '2026-05-02 03:17:41'),
('d557272c-d18a-4d8d-a709-6fb3d91043e3', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Net milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":330,\"type\":\"pengembalian\"}', '2026-05-02 03:17:41', '2026-05-02 02:40:33', '2026-05-02 03:17:41'),
('d5ae6971-c67e-4d22-8990-2c4e696ef8e0', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Harddisk External untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_detail\":377,\"type\":\"peminjaman\"}', '2026-05-02 04:00:06', '2026-05-02 03:33:33', '2026-05-02 04:00:06'),
('d5b1c615-61b0-49ac-9eaf-6e41291d6e0c', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 18, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Mouse milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":329,\"type\":\"pengembalian\"}', NULL, '2026-05-02 02:31:21', '2026-05-02 02:31:21'),
('d679054f-c149-478d-bd81-444aab7caf01', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Harddisk External ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 04:33:01', '2026-05-02 04:26:39', '2026-05-02 04:33:01'),
('d6a129ae-3257-4ce0-92f1-9558f9bb05c6', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Harddisk External ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 03:39:30', '2026-05-02 03:28:10', '2026-05-02 03:39:30'),
('d6a4d2a3-44a9-42e8-b7da-b29e4a5bc450', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Flashdisk ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 02:27:07', '2026-05-01 22:52:17', '2026-05-02 02:27:07'),
('d702de7d-54db-453d-82dd-686a53a4c0e4', 'App\\Notifications\\PengembalianDisetujui', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Disetujui \\u2705\",\"message\":\"Pengembalian Mouse telah diterima\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 02:27:07', '2026-05-01 22:52:51', '2026-05-02 02:27:07'),
('d8011e49-406d-4f8f-8b60-7858a764fca3', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Mouse milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":291,\"type\":\"pengembalian\"}', '2026-05-01 22:52:52', '2026-05-01 22:52:34', '2026-05-01 22:52:52'),
('d8a9e1e9-afc7-497e-a53d-1251111c9ec2', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Harddisk External ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 09:25:09', '2026-05-01 09:25:09', '2026-05-01 09:25:09'),
('d9017666-2fcd-40d4-91b9-e250c70a62a6', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 18, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Mouse milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":296,\"type\":\"pengembalian\"}', NULL, '2026-05-02 02:29:18', '2026-05-02 02:29:18'),
('dac47d47-5990-4e1c-abdf-50b858a5c96a', 'App\\Notifications\\PengajuanDisetujui', 'App\\Models\\User', 1, '{\"title\":\"Pengajuan Disetujui \\u2705\",\"message\":\"Pengajuan untuk Net telah disetujui\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 20:33:21', '2026-05-01 20:33:00', '2026-05-01 20:33:21'),
('db1822e3-dfba-493c-9685-aec21fad6527', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 18, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Harddisk External milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":322,\"type\":\"pengembalian\"}', NULL, '2026-05-02 02:30:59', '2026-05-02 02:30:59'),
('dbad5c6c-7d6f-42fd-9d45-2b277fe63a14', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 18, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Mouse milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":329,\"type\":\"pengembalian\"}', NULL, '2026-05-02 02:39:32', '2026-05-02 02:39:32'),
('dc2942d8-7282-425d-b7bd-b1181fd67a8b', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Flashdisk ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 04:33:01', '2026-05-02 04:27:04', '2026-05-02 04:33:01'),
('dc944d49-7c3e-4536-8be6-4f092f2b6706', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 18, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Harddisk External milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":320,\"type\":\"pengembalian\"}', NULL, '2026-05-02 02:34:41', '2026-05-02 02:34:41'),
('dd7d2b42-643f-4b70-9db2-69ecd2b14361', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Keyboard untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_detail\":410,\"type\":\"peminjaman\"}', '2026-05-02 04:31:10', '2026-05-02 04:27:34', '2026-05-02 04:31:10'),
('ddc894f1-a534-4ee0-bc2c-63f57fc0b91b', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Harddisk External milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":322,\"type\":\"pengembalian\"}', '2026-05-02 03:17:41', '2026-05-02 02:31:06', '2026-05-02 03:17:41'),
('deb32fdf-1f05-464f-b693-2d0da3aff510', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Mouse untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_detail\":417,\"type\":\"peminjaman\"}', '2026-05-02 04:43:12', '2026-05-02 04:42:54', '2026-05-02 04:43:12'),
('e0670d63-90bd-4a65-8884-7bd5db9f030b', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Flashdisk untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_detail\":407,\"type\":\"peminjaman\"}', '2026-05-02 04:26:00', '2026-05-02 04:25:34', '2026-05-02 04:26:00'),
('e154673c-6165-4031-8db4-a990d99a2e2e', 'App\\Notifications\\PengajuanDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengajuan Ditolak \\u274c\",\"message\":\"Pengajuan untuk Flashdisk ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-07 05:05:48', '2026-05-07 04:58:21', '2026-05-07 05:05:48'),
('e1dc277a-828b-4ff3-99aa-5d55582bd708', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Mouse milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":329}', '2026-05-01 21:35:57', '2026-05-01 21:35:45', '2026-05-01 21:35:57'),
('e29354e1-6b4d-4d7f-91eb-8cac9f3e1d6f', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 18, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Mouse untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_peminjaman\":210}', NULL, '2026-05-01 21:33:17', '2026-05-01 21:33:17'),
('e2a6fa8f-d095-4a44-976c-465e69f54749', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Harddisk External ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 04:33:01', '2026-05-02 04:27:00', '2026-05-02 04:33:01'),
('e37426a0-d173-4b46-bc4e-9bafbe31e44c', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Harddisk External milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":324}', '2026-05-01 21:34:30', '2026-05-01 21:34:20', '2026-05-01 21:34:30'),
('e409a20c-58a9-4004-ada2-9b5badb702f0', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Harddisk External milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":379,\"type\":\"pengembalian\"}', '2026-05-07 04:36:37', '2026-05-02 05:03:25', '2026-05-07 04:36:37'),
('e51ae6e6-a480-4f07-924f-bed86a89cb5f', 'App\\Notifications\\PengajuanDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengajuan Ditolak \\u274c\",\"message\":\"Pengajuan untuk Flashdisk ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 03:56:14', '2026-05-02 03:56:04', '2026-05-02 03:56:14'),
('e57a8a7c-c3f1-4d92-9cb6-403b2cdd2123', 'App\\Notifications\\PengajuanDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengajuan Ditolak \\u274c\",\"message\":\"Pengajuan untuk Harddisk External ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 03:56:14', '2026-05-02 03:56:12', '2026-05-02 03:56:14'),
('e5d0fac7-abcb-4b55-8e4e-b389416cea5f', 'App\\Notifications\\PengajuanDisetujui', 'App\\Models\\User', 1, '{\"title\":\"Pengajuan Disetujui \\u2705\",\"message\":\"Pengajuan untuk Harddisk External telah disetujui\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 08:59:31', '2026-05-01 08:59:08', '2026-05-01 08:59:31'),
('e73e2a6d-3a67-44cc-9aaf-0a77257873ad', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Mouse ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 03:39:30', '2026-05-02 02:32:27', '2026-05-02 03:39:30'),
('e747ed0f-da5b-4354-85d7-78f7700cc788', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Mouse ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 03:59:16', '2026-05-02 03:57:02', '2026-05-02 03:59:16'),
('e76f2a12-f768-4e56-a942-c6662dec927c', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Mouse milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":296,\"type\":\"pengembalian\"}', '2026-05-02 04:00:06', '2026-05-02 03:30:25', '2026-05-02 04:00:06'),
('e88886fc-daa8-40f9-9695-5814d4925183', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Mouse milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":329,\"type\":\"pengembalian\"}', '2026-05-02 03:17:41', '2026-05-02 02:31:21', '2026-05-02 03:17:41'),
('e95575ac-f285-4807-abae-e3e4834ca1f8', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Harddisk External milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":322}', '2026-05-01 21:34:37', '2026-05-01 21:34:20', '2026-05-01 21:34:37'),
('ed840666-ae47-4bfa-bcd3-9df48f50f3ac', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 18, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Harddisk External milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":292,\"type\":\"pengembalian\"}', NULL, '2026-05-02 02:29:16', '2026-05-02 02:29:16'),
('ed9dacf6-90c0-4f9a-aeea-cca80b6161f8', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Mouse ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 03:59:48', '2026-05-02 03:59:29', '2026-05-02 03:59:48'),
('f2eef865-3abd-4df0-a81e-49ed2092a99b', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Harddisk External ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 20:22:59', '2026-05-01 09:25:17', '2026-05-01 20:22:59'),
('f31342da-e45e-4e20-bda7-c4d894cd94e7', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Mouse untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_detail\":420,\"type\":\"peminjaman\"}', '2026-05-07 04:36:37', '2026-05-07 04:36:07', '2026-05-07 04:36:37'),
('f3cf7d15-377d-41d6-b92a-00882011006b', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Harddisk External milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":324,\"type\":\"pengembalian\"}', '2026-05-02 04:37:05', '2026-05-02 04:33:11', '2026-05-02 04:37:05'),
('f5355f44-5117-4972-b019-8d8e0c9a33c6', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Mouse untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_detail\":413,\"type\":\"peminjaman\"}', '2026-05-02 04:43:12', '2026-05-02 04:37:39', '2026-05-02 04:43:12'),
('f5d0ee87-8f19-4c08-b19f-45d7dbe377e8', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru <b>dani<\\/b> mengajukan peminjaman untuk Rahma Farhah. Barang: Laptop\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_peminjaman\":167}', '2026-05-01 09:13:33', '2026-05-01 09:11:46', '2026-05-01 09:13:33'),
('f5e2de65-368e-4918-a4c2-a076121574f3', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Harddisk External ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 03:39:30', '2026-05-02 02:41:49', '2026-05-02 03:39:30'),
('f6d70463-0dd0-4fee-8c49-e677e64ccab6', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Harddisk External ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-02 02:27:07', '2026-05-01 22:51:48', '2026-05-02 02:27:07'),
('f7b5f144-0362-4ddf-a6c2-afe079860025', 'App\\Notifications\\PengajuanDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengajuan Ditolak \\u274c\",\"message\":\"Pengajuan untuk Flashdisk ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 09:24:35', '2026-05-01 09:24:19', '2026-05-01 09:24:35'),
('fa2b7a63-0c48-4d04-abd6-d38fbad3bf2b', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Flashdisk untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_detail\":392,\"type\":\"peminjaman\"}', '2026-05-02 04:22:49', '2026-05-02 04:19:32', '2026-05-02 04:22:49'),
('fab84c4f-d91b-4bf0-90bb-a14473bf8725', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Harddisk External milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":332,\"type\":\"pengembalian\"}', '2026-05-02 03:17:41', '2026-05-02 03:02:01', '2026-05-02 03:17:41'),
('fb9bc124-acd2-45fa-93e7-7b946b470423', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 18, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Mouse milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":291,\"type\":\"pengembalian\"}', NULL, '2026-05-01 22:49:05', '2026-05-01 22:49:05'),
('fbd7cb6c-3569-4691-bf30-34eeaf21c1e4', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 18, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Harddisk External milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":320,\"type\":\"pengembalian\"}', NULL, '2026-05-01 22:49:06', '2026-05-01 22:49:06'),
('fd0bc167-52d1-497c-bcb0-07c00a087846', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Harddisk External untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_detail\":371,\"type\":\"peminjaman\"}', '2026-05-02 03:17:41', '2026-05-02 03:13:03', '2026-05-02 03:17:41'),
('fd6171e9-03b9-4a48-9498-12f146c90c10', 'App\\Notifications\\PengajuanMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Peminjaman Baru \\ud83d\\udce5\",\"message\":\"Guru dani mengajukan Mouse untuk Rahma Farhah\",\"url\":\"\\/sarpras\\/peminjaman\",\"id_detail\":391,\"type\":\"peminjaman\"}', '2026-05-02 04:19:07', '2026-05-02 04:18:37', '2026-05-02 04:19:07'),
('fdbd62f2-3d65-4776-bc01-cb888296d958', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Mouse milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":296,\"type\":\"pengembalian\"}', '2026-05-02 03:17:41', '2026-05-02 02:32:47', '2026-05-02 03:17:41'),
('ff2ff058-1f68-43e0-a1ae-fcc4a2782209', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Mouse ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 08:59:31', '2026-05-01 08:59:27', '2026-05-01 08:59:31'),
('ff49addc-bde0-418b-9852-851d9dd491e6', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Laptop ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 09:24:35', '2026-05-01 09:24:11', '2026-05-01 09:24:35'),
('ff725ad2-c748-4d4f-af9a-aa9e0b52a6d2', 'App\\Notifications\\PengembalianDitolak', 'App\\Models\\User', 1, '{\"title\":\"Pengembalian Ditolak \\u274c\",\"message\":\"Pengembalian Flashdisk ditolak\",\"url\":\"\\/guru\\/riwayat\"}', '2026-05-01 20:36:20', '2026-05-01 20:35:07', '2026-05-01 20:36:20'),
('ffef00ed-b87b-4cee-a033-114d8dbfe945', 'App\\Notifications\\PengembalianMasuk', 'App\\Models\\User', 3, '{\"title\":\"Pengajuan Pengembalian Baru \\ud83d\\udd04\",\"message\":\"Guru dani mengajukan pengembalian barang Harddisk External milik Rahma Farhah\",\"url\":\"\\/sarpras\\/pengembalian\",\"id_detail\":292,\"type\":\"pengembalian\"}', '2026-05-02 04:32:58', '2026-05-02 04:31:13', '2026-05-02 04:32:58');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_peminjaman` int UNSIGNED NOT NULL,
  `id_siswa` int UNSIGNED DEFAULT NULL,
  `id_mapel` int DEFAULT NULL,
  `id_guru` int UNSIGNED DEFAULT NULL,
  `tanggal_pinjam` date DEFAULT NULL,
  `alasan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('Dipinjam','Dikembalikan','Ditolak','Diajukan') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Dipinjam',
  `ruangan` bigint UNSIGNED DEFAULT NULL,
  `no_wa` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foto_pinjam` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `id_siswa` int UNSIGNED NOT NULL,
  `nis` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_kelas` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`id_siswa`, `nis`, `nama`, `id_kelas`) VALUES
(50, '12345', 'Rahma Farhah', 35),
(52, '123456', 'Farrel', 35),
(53, '123123123123', 'Asep Nugroho', 36),
(54, '1203', 'Jonah', 36),
(55, '234561', 'Rizky', 35),
(56, '234562', 'Dinda', 35),
(57, '234564', 'Salsa', 36),
(58, '234565', 'Fikri', 35),
(59, '234567', 'Rehan', 36),
(60, '234568', 'Citra', 35),
(61, '234570', 'Aulia', 36),
(62, '123121323', 'Maman', 36);

-- --------------------------------------------------------

--
-- Table structure for table `tempat`
--

CREATE TABLE `tempat` (
  `id` bigint UNSIGNED NOT NULL,
  `nama` varchar(100) NOT NULL,
  `kategori` enum('teori','lab','lainnya') NOT NULL,
  `aktif` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tempat`
--

INSERT INTO `tempat` (`id`, `nama`, `kategori`, `aktif`, `created_at`, `updated_at`) VALUES
(1, 'Ruang 1', 'teori', 1, '2026-01-28 04:57:30', '2026-02-01 04:14:35'),
(2, 'Ruang 2', 'teori', 1, '2026-01-28 04:57:30', '2026-01-28 04:57:30'),
(3, 'Ruang 3', 'teori', 1, '2026-01-28 04:57:30', '2026-01-28 04:57:30'),
(4, 'Ruang 4', 'teori', 1, '2026-01-28 04:57:30', '2026-01-28 04:57:30'),
(5, 'Ruang 5', 'teori', 1, '2026-01-28 04:57:30', '2026-01-28 04:57:30'),
(6, 'Ruang 6', 'teori', 1, '2026-01-28 04:57:30', '2026-01-28 04:57:30'),
(7, 'Ruang 7', 'teori', 1, '2026-01-28 04:57:30', '2026-01-28 04:57:30'),
(8, 'Ruang 8', 'teori', 1, '2026-01-28 04:57:30', '2026-01-28 04:57:30'),
(9, 'Ruang 9', 'teori', 1, '2026-01-28 04:57:30', '2026-01-28 04:57:30'),
(10, 'Ruang 10', 'teori', 1, '2026-01-28 04:57:30', '2026-01-28 04:57:30'),
(11, 'Ruang 11', 'teori', 0, '2026-01-28 04:57:30', '2026-02-01 04:15:19'),
(12, 'Ruang 12', 'teori', 1, '2026-01-28 04:57:30', '2026-01-28 04:57:30'),
(13, 'Ruang 13', 'teori', 1, '2026-01-28 04:57:30', '2026-01-28 04:57:30'),
(14, 'Ruang 14', 'teori', 1, '2026-01-28 04:57:30', '2026-01-28 04:57:30'),
(15, 'Ruang 15', 'teori', 1, '2026-01-28 04:57:30', '2026-01-28 04:57:30'),
(16, 'Ruang 16', 'teori', 1, '2026-01-28 04:57:30', '2026-01-28 04:57:30'),
(17, 'Ruang 17', 'teori', 1, '2026-01-28 04:57:30', '2026-01-28 04:57:30'),
(18, 'Ruang 18', 'teori', 1, '2026-01-28 04:57:30', '2026-01-28 04:57:30'),
(19, 'Ruang 19', 'teori', 1, '2026-01-28 04:57:30', '2026-01-28 04:57:30'),
(20, 'Ruang 20', 'teori', 1, '2026-01-28 04:57:30', '2026-01-28 04:57:30'),
(21, 'Ruang 21', 'teori', 1, '2026-01-28 04:57:30', '2026-01-28 04:57:30'),
(22, 'Ruang 22', 'teori', 1, '2026-01-28 04:57:30', '2026-01-28 04:57:30'),
(23, 'Ruang 23', 'teori', 1, '2026-01-28 04:57:30', '2026-01-28 04:57:30'),
(24, 'Ruang 24', 'teori', 1, '2026-01-28 04:57:30', '2026-01-28 04:57:30'),
(25, 'Ruang 25', 'teori', 1, '2026-01-28 04:57:30', '2026-01-28 04:57:30'),
(26, 'Ruang 26', 'teori', 1, '2026-01-28 04:57:30', '2026-01-28 04:57:30'),
(27, 'Lab Kimia', 'lab', 1, '2026-01-28 04:57:56', '2026-01-28 04:57:56'),
(28, 'Lab Fisika', 'lab', 1, '2026-01-28 04:57:56', '2026-01-28 04:57:56'),
(29, 'Lab Biologi', 'lab', 1, '2026-01-28 04:57:56', '2026-01-28 04:57:56'),
(30, 'Lab Komputer', 'lab', 1, '2026-01-28 04:57:56', '2026-01-28 04:57:56'),
(31, 'Lab Bahasa', 'lab', 1, '2026-01-28 04:57:56', '2026-01-28 04:57:56'),
(32, 'Aula', 'lainnya', 1, '2026-01-28 04:58:19', '2026-01-28 04:58:19'),
(33, 'Lapangan', 'lainnya', 1, '2026-01-28 04:58:19', '2026-01-28 04:58:19'),
(34, 'Perpustakaan', 'lainnya', 1, '2026-01-28 04:58:19', '2026-01-28 04:58:19'),
(35, 'Teori 10', 'teori', 1, '2026-05-07 19:58:29', '2026-05-07 19:58:29');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int UNSIGNED NOT NULL,
  `nama` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('guru','sarpras') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_jurusan` int UNSIGNED DEFAULT NULL,
  `fcm_token` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama`, `password`, `role`, `id_jurusan`, `fcm_token`) VALUES
(1, 'dani', '$2y$12$WVF5I5ciF0pn93AjZ0zuf.TY/3wfDmwOQSdtSGQb7Govw1H0t2MLO', 'guru', NULL, NULL),
(3, 'Admin Sarpras', '$2y$12$qq9Ax9A5gPnuyzk.lesoPOaV69CRaPHbV5lbBIWLFfLgqJdX687Nq', 'sarpras', NULL, 'cNSbN-pDf2H6IBL3tSIrrQ:APA91bGWHiMXgYarQu2FGZwbQHEKQqThqjS1d3L3ErKfONCXZHFOsbxcTW7jdFnpxYkEJBs-YECXGUI1rgwbmTJU2r7fD1Q5kBfeuWQkl9yqsPM5a_biI3k'),
(4, 'Andi Saputra', '$2y$12$OAn6ektWs.V92E3gvOpQjuaSzQcxnsiPimZTOoJ0m8fSCgr/0yQIu', 'guru', NULL, NULL),
(5, 'Sari Wulandari', '$2y$12$CnNpgjkeKGex0mmJ8tG6d.MLWTYNy./MCPBuzvb3Sb/LRYkgQtmjO', 'guru', NULL, NULL),
(6, 'Budi Santoso', '$2y$12$CnNpgjkeKGex0mmJ8tG6d.MLWTYNy./MCPBuzvb3Sb/LRYkgQtmjO', 'guru', NULL, NULL),
(7, 'Rina Maharani', '$2y$12$CnNpgjkeKGex0mmJ8tG6d.MLWTYNy./MCPBuzvb3Sb/LRYkgQtmjO', 'guru', NULL, NULL),
(8, 'Dedi Pratama', '$2y$12$CnNpgjkeKGex0mmJ8tG6d.MLWTYNy./MCPBuzvb3Sb/LRYkgQtmjO', 'guru', NULL, NULL),
(9, 'Lina Oktaviani', '$2y$12$CnNpgjkeKGex0mmJ8tG6d.MLWTYNy./MCPBuzvb3Sb/LRYkgQtmjO', 'guru', NULL, NULL),
(10, 'Rudi Kurniawan', '$2y$12$CnNpgjkeKGex0mmJ8tG6d.MLWTYNy./MCPBuzvb3Sb/LRYkgQtmjO', 'guru', NULL, NULL),
(11, 'Yoga Prasetyo', '$2y$12$CnNpgjkeKGex0mmJ8tG6d.MLWTYNy./MCPBuzvb3Sb/LRYkgQtmjO', 'guru', NULL, NULL),
(12, 'Nina Amelia', '$2y$12$CnNpgjkeKGex0mmJ8tG6d.MLWTYNy./MCPBuzvb3Sb/LRYkgQtmjO', 'guru', NULL, NULL),
(13, 'Hendra Wijaya', '$2y$12$CnNpgjkeKGex0mmJ8tG6d.MLWTYNy./MCPBuzvb3Sb/LRYkgQtmjO', 'guru', NULL, NULL),
(16, 'ujang', '$2y$12$9ErjVqcx6hara2kquAUxy.ijQmrsCQlfSH6OXmSo2aK6UypxZmP4O', 'guru', NULL, NULL),
(17, 'Budi', '$2y$12$/rNJouZssNA28i8FBdnVieqpF6JYIyG2goRAiuUeSTYEoKpZr0Xmm', 'guru', NULL, NULL),
(19, 'Halley Wide', '$2y$12$F88c2ogEofEEYKGqJxdlUeQ00Q7TZ4RSNmbJY.VBPhnM8LUF.eKbm', 'guru', NULL, NULL),
(36, 'Yoga', '$2y$12$kC8X6cIdQm/qurGdc//TdOwOXd30FUSp6effxVQ92LQFzqROsP/26', 'guru', NULL, NULL),
(46, 'Rizal', '$2y$12$euV9Yx2Gfz8Ik0v4Gtu8yuItJFcP6YMDR1DCmFgZNIcR3JDCh4LNC', 'guru', 29, NULL),
(47, 'Nabila', '$2y$12$qv.g08ApfwlxSE95dHkyQ.x3wdo/mqd4pN93b1ixGgORfvgrXLbE6', 'guru', 28, NULL),
(48, 'Arif', '$2y$12$4vBF3CPKKaSQKWNLMTKggeiBlIBN565owv.FypvoG0zJ3DqODavRq', 'guru', 34, NULL),
(49, 'Santi', '$2y$12$JfelxPT8h.dLRRj2tYCQA.Vs6IojFANiHFhCE6P/sfhxWccApH6JW', 'guru', NULL, NULL),
(50, 'Dimas', '$2y$12$RgdaIAOKC8yGW5.egIrL6ukjE12bVVRZ8YWnGhHs.v3GjusuY2Yye', 'guru', 29, NULL),
(51, 'Putri', '$2y$12$iT7PdmN3Yz1vF1qIhn94IueNgcX9XJfApsZFlH9/flXiK1yCjqZQC', 'guru', 28, NULL),
(52, 'Yusuf', '$2y$12$l5PdNXgr8oEb2NMxIru9Zu7eZomODYada48nHuMn.GySZ2a5REoHa', 'guru', 34, NULL),
(53, 'Lestari', '$2y$12$td3jLvc4VTnaV5D6Si56mOPiY6UdYpilgTF1H9m2UvIkd6Oe9q79G', 'guru', NULL, NULL),
(54, 'Hendra', '$2y$12$yk6jJR9QpOkMkep.mmXKZeIqSk4Ba.1E4BvTgoNOqVxz5EIg6vsqS', 'guru', 29, NULL),
(55, 'Maya', '$2y$12$nTV2Yme3grO/eB9c4AmnaeLoQhm7ClyentiW6TQVa9aD.ERkQhzzi', 'guru', 28, NULL),
(56, 'Galih', '$2y$12$V2dFyAZbrM2eyGD0Z4qr8ubWSd34XWU1yw2AVr4aSCV43JFDtknH6', 'guru', 34, NULL),
(57, 'Taufik', '$2y$12$.V7ZV4XFLNDOdKhycUNcUOuJ3yrYcdKQbjebh1jCn9pJAfC5gHS1q', 'guru', NULL, NULL),
(58, 'Indah', '$2y$12$yYGZBaItXrbU6l9Yij0Jq..BTG2lDoN3cZxKLbMvBrpabrT8ZzVXG', 'guru', 29, NULL),
(59, 'Rafi', '$2y$12$MLg5SSvtAMFk1GJ.JQegGulP23bTm2XCGjz4.ed1Tdgs2cgKpbdNG', 'guru', 28, NULL),
(60, 'Bambang', '$2y$12$9Rpr/0LYfvXOBPIu5onwa.Zsa0UEyGanmG7hOdNoAPpFeVp/BpkO2', 'guru', 34, NULL),
(61, 'Staff1', '$2y$12$8cp5bB6vBzPrvPTcR5nFYuyK6J1.LBR7TK6Mu5o8dgkFOCTSdvkhC', 'sarpras', NULL, NULL),
(62, 'Staff2', '$2y$12$ZAF8Je/MQXJDQWZKnbogC.lXSpIXIt1gte6vjR0YoYfXBlIt7j9jy', 'sarpras', NULL, NULL),
(63, 'KepalaSarpras', '$2y$12$o48/dBgUXs3txAX3j9vsouZAkJQHFYoXKRO0zxIEWHfXeuPzSd0xm', 'sarpras', NULL, NULL),
(64, 'AdminUtama', '$2y$12$aKtoaPZ6jx540lqyJMk2p.AKt.xE36caDxW53UzFO4gsgz2yA3or2', 'sarpras', NULL, NULL),
(65, 'PetugasGudang', '$2y$12$dcXQZEytZeea1WrYxBb/yOG/gSCGK6wir5JZWTJ3Ew/HHQu2CzTHK', 'sarpras', NULL, NULL),
(66, 'Rizal', '$2y$12$Aju7IZfedrUYCjNoukJ75OZrsnJAG7bO10pLD5/yoDTWwJWwQo42G', 'guru', 29, NULL),
(67, 'Nabila', '$2y$12$0Q0NBVsc72X.YJBkGV2lL.CdKkSN5oURXTlrwRBAGQZdteIq3263q', 'guru', 28, NULL),
(68, 'Arif', '$2y$12$w5N7vDEyKohXXbv1.1O0f.4QSiHf9rj8QzsxAkfEN9G52Fl8zGHzS', 'guru', 34, NULL),
(69, 'Santi', '$2y$12$fGikQdwnr6e6rAdOPT7dZeMedM07qD2np0kk1ll.ePKXqKZ.qOqiq', 'guru', NULL, NULL),
(70, 'Dimas', '$2y$12$SYDrixUPcobR5Q3bI9ADiu6VHo.JE0eFHXW2GqgVfhgfqh8f4XPi.', 'guru', 29, NULL),
(71, 'Putri', '$2y$12$L6dojjSxHQr7iXbMZOMgZOyTHYO1Qso70YzbpVhsZWyoLEZqmbaU.', 'guru', 28, NULL),
(72, 'Yusuf', '$2y$12$wT25Tm0Zp/FfBu1NkLgpZ.9R5v/PwHAX8qLc/r9hwpxUws4MnRbc6', 'guru', 34, NULL),
(73, 'Lestari', '$2y$12$FTbnZPn.pe6/SZ6jaDpyCO2jBemEC12w53ELTRca/xybiQ8VUqt4C', 'guru', NULL, NULL),
(74, 'Hendra', '$2y$12$yPhH.fMC5pxWNKKbV6irU.G6ok5Juc4dAm1Wq03GqiBuK80JGUw9e', 'guru', 29, NULL),
(75, 'Maya', '$2y$12$gBjVe5wBDKN6matK4yNjJe7W.uqolkzDYXOIO173Z4A/MYpAcWpje', 'guru', 28, NULL),
(76, 'Galih', '$2y$12$7WWZldTQLFG7fGT0m/YyIOBJd//7zVKZtjNgi0PZYOi/cKJrxBDD.', 'guru', 34, NULL),
(77, 'Taufik', '$2y$12$/ZS4xOhRFI4lhAZsdZavluNBg4NayvTee7.3iNJ5nZ8zSEfPxAuf.', 'guru', NULL, NULL),
(78, 'Indah', '$2y$12$00u6g.wxdJbor8wEsOphkONSiIbklxEjC3Qwv/hF2PJzvTrAK8rVG', 'guru', 29, NULL),
(79, 'Rafi', '$2y$12$/XjSFr4IPTbuAYosvtQaHOSh0UhJ/XMOFGaPjHhJmomgIpE7dcEf2', 'guru', 28, NULL),
(80, 'Bambang', '$2y$12$ESUcVxXCamvHzLjPd2gIH.S3t5dG2zT4GsL7dED5XuqOJdkcMsF3e', 'guru', 34, NULL),
(81, 'Staff1', '$2y$12$XoqDrSsa9H6hfCSMS27CbuOyUyi4GhPX.FQrnEaRUBOwsycSZ/c.q', 'sarpras', NULL, NULL),
(82, 'Staff2', '$2y$12$7CEFRwnBFfaXEkT5DAUWle1MKlnj0UrtQy0FRCynkJAfZP0lh8YjS', 'sarpras', NULL, NULL),
(83, 'KepalaSarpras', '$2y$12$vWosGv1RGoUl8TEHPCUkmOW9.hdJY0GSDQbIEzQXM7yJEqhYObBxC', 'sarpras', NULL, NULL),
(84, 'AdminUtama', '$2y$12$fFWKLmT2hSk1VjiDcGDWfeW1uXsjPEp/bvIMe9isHYLl40l20rb0.', 'sarpras', NULL, NULL),
(85, 'PetugasGudang', '$2y$12$CmRECVA09XCShhRJ7w9PxusCryU/V5eWpHqIQQdM7DaGWRn8jPnT2', 'sarpras', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`),
  ADD KEY `fk_barang_kategori` (`id_kategori`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `detail_peminjaman`
--
ALTER TABLE `detail_peminjaman`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `id_peminjaman` (`id_peminjaman`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`id_jurusan`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`),
  ADD UNIQUE KEY `nama_kategori` (`nama_kategori`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id_kelas`),
  ADD KEY `kelas_ibfk_1` (`id_jurusan`);

--
-- Indexes for table `mapel`
--
ALTER TABLE `mapel`
  ADD PRIMARY KEY (`id_mapel`),
  ADD KEY `fk_mapel_jurusan` (`id_jurusan`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id_peminjaman`),
  ADD KEY `peminjaman_id_siswa_foreign` (`id_siswa`),
  ADD KEY `peminjaman_id_guru_foreign` (`id_guru`),
  ADD KEY `fk_peminjaman_mapel` (`id_mapel`),
  ADD KEY `fk_peminjaman_tempat` (`ruangan`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id_siswa`),
  ADD UNIQUE KEY `nis` (`nis`),
  ADD KEY `fk_siswa_kelas` (`id_kelas`);

--
-- Indexes for table `tempat`
--
ALTER TABLE `tempat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `fk_user_jurusan` (`id_jurusan`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id_barang` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `detail_peminjaman`
--
ALTER TABLE `detail_peminjaman`
  MODIFY `id_detail` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=422;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jurusan`
--
ALTER TABLE `jurusan`
  MODIFY `id_jurusan` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id_kelas` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `mapel`
--
ALTER TABLE `mapel`
  MODIFY `id_mapel` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id_peminjaman` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=246;

--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id_siswa` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `tempat`
--
ALTER TABLE `tempat`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `fk_barang_kategori` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `detail_peminjaman`
--
ALTER TABLE `detail_peminjaman`
  ADD CONSTRAINT `detail_peminjaman_ibfk_1` FOREIGN KEY (`id_peminjaman`) REFERENCES `peminjaman` (`id_peminjaman`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_peminjaman_ibfk_2` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kelas`
--
ALTER TABLE `kelas`
  ADD CONSTRAINT `kelas_ibfk_1` FOREIGN KEY (`id_jurusan`) REFERENCES `jurusan` (`id_jurusan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mapel`
--
ALTER TABLE `mapel`
  ADD CONSTRAINT `fk_mapel_jurusan` FOREIGN KEY (`id_jurusan`) REFERENCES `jurusan` (`id_jurusan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `fk_peminjaman_mapel` FOREIGN KEY (`id_mapel`) REFERENCES `mapel` (`id_mapel`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_peminjaman_tempat` FOREIGN KEY (`ruangan`) REFERENCES `tempat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `peminjaman_id_guru_foreign` FOREIGN KEY (`id_guru`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `peminjaman_id_siswa_foreign` FOREIGN KEY (`id_siswa`) REFERENCES `siswa` (`id_siswa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `siswa`
--
ALTER TABLE `siswa`
  ADD CONSTRAINT `fk_siswa_kelas` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_user_jurusan` FOREIGN KEY (`id_jurusan`) REFERENCES `jurusan` (`id_jurusan`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
