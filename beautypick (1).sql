-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 08 Bulan Mei 2026 pada 08.05
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `beautypick`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id`, `nama`) VALUES
(1, 'Moisturizer'),
(2, 'Serum'),
(3, 'Sunscreen'),
(4, 'Toner'),
(5, 'Cleanser');

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id` int(11) NOT NULL,
  `nama` varchar(150) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `harga` int(11) NOT NULL,
  `gambar` varchar(255) DEFAULT 'img/default.jpg',
  `kategori_id` int(11) DEFAULT NULL,
  `stok` int(11) DEFAULT 50
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id`, `nama`, `deskripsi`, `harga`, `gambar`, `kategori_id`, `stok`) VALUES
(1, 'Wardah Hydrating Aloe Vera Moisturizer', 'Wardah Hydrating Aloe Vera Moisturizer adalah pelembab ringan yang diformulasikan khusus dengan ekstrak aloe vera segar dari dataran tinggi. Kandungan aloe vera yang kaya akan vitamin E dan antioksidan membantu melembabkan kulit secara intensif tanpa rasa lengket. Produk ini juga dilengkapi dengan teknologi HydraBooster yang mampu mempertahankan kelembaban kulit hingga 24 jam. Cocok digunakan untuk semua jenis kulit, termasuk kulit sensitif dan berjerawat. Penggunaan rutin setiap pagi dan malam akan membuat kulit terasa lebih lembut, kenyal, dan terhidrasi optimal. Tidak mengandung alkohol, pewangi buatan, dan paraben. Kemasan tube 50ml praktis dibawa bepergian.', 45000, 'img/wardah-moisturizer.jpg', 1, 80),
(2, 'Emina Bright Stuff Moisturizing Cream', 'Emina Bright Stuff Moisturizing Cream adalah krim pelembab harian yang diformulasikan khusus untuk remaja dan pemilik kulit normal hingga berminyak. Mengandung Niacinamide (Vitamin B3) konsentrasi 5% yang terbukti efektif mencerahkan kulit, menyamarkan noda bekas jerawat, dan meratakan warna kulit. Tekstur cream-to-water yang unik: saat dioleskan, krim berubah menjadi butiran air segar yang cepat meresap tanpa meninggalkan rasa lengket. Diperkaya dengan ekstrak bunga sakura dan vitamin E untuk perlindungan antioksidan ringan. Kemasan tube 40ml dengan desain lucu dan warna pastel. Aman digunakan setiap hari, tidak menyebabkan komedo, dan sudah teruji dermatologis.', 32000, 'img/emina-moisturizer.jpg', 1, 100),
(3, 'Avoskin Miraculous Refining Moisturizer', 'Avoskin Miraculous Refining Moisturizer adalah pelembab eksfoliasi tingkat lanjut yang menggabungkan AHA (Alpha Hydroxy Acid), BHA (Beta Hydroxy Acid), dan PHA (Polyhydroxy Acid) dalam satu formula. Kandungan AHA (Lactic Acid 5%) membantu mengangkat sel kulit mati dan meratakan tekstur kulit, BHA (Salicylic Acid 0.5%) membersihkan pori-pori dan mengurangi komedo, sementara PHA (Gluconolactone 3%) memberikan efek eksfoliasi lembut sekaligus melembabkan. Dilengkapi Ceramide dan Niacinamide untuk memperbaiki skin barrier. Sangat direkomendasikan untuk kulit berjerawat, bertekstur tidak rata, atau memiliki bekas jerawat. Gunakan malam hari dan selalu gunakan sunscreen di pagi hari. Kemasan jar 30ml dengan airless pump.', 150000, 'img/avoskin-moisturizer.jpg', 1, 40),
(4, 'Cetaphil Moisturizing Cream', 'Cetaphil Moisturizing Cream adalah pelembab ikonik yang direkomendasikan oleh para dermatologis di seluruh dunia. Diformulasikan khusus untuk kulit kering hingga sangat kering dan sensitif. Kandungan utama berupa emolien dan humektan yang bekerja sinergis mengikat air pada lapisan kulit sekaligus membentuk lapisan pelindung. Formula bebas parfum, bebas pewangi, bebas alkohol, dan non-comedogenic (tidak menyumbat pori). Setelah pemakaian, kulit terasa lembut, tidak tertarik, dan terlindungi dari kekeringan sepanjang hari. Ideal untuk penderita eksim, psoriasis, atau kulit yang sedang menjalani perawatan retinoid. Kemasan tube 100g, ekonomis dan tahan lama.', 125000, 'img/cetaphil-cream.jpg', 1, 60),
(5, 'Somethinc Niacinamide 10% + Zinc Serum', 'Somethinc Niacinamide 10% + Zinc Serum adalah serum perawatan harian dengan konsentrasi tinggi Niacinamide 10% yang diformulasikan untuk mengatasi berbagai masalah kulit seperti minyak berlebih, pori-pori besar, komedo, dan kulit kusam. Kandungan Zinc PCA 1% membantu mengontrol produksi sebum dan memiliki efek antibakteri ringan untuk mencegah jerawat. Tekstur serum bening, sangat ringan seperti air, dan cepat meresap. Dilengkapi dengan Hyaluronic Acid untuk menjaga kelembaban agar kulit tidak kering meskipun mengandung bahan aktif tinggi. Kemasan botol kaca 20ml dengan pipet tetes. Cocok untuk kulit berminyak, kombinasi, dan berjerawat. Gunakan 2x sehari setelah toner.', 89000, 'img/somethinc-niacinamide.jpg', 2, 75),
(6, 'Implora Vitamin C Serum', 'Implora Vitamin C Serum adalah serum pencerah dengan harga terjangkau yang mengandung 10% Ethyl Ascorbic Acid (turunan vitamin C yang stabil). Berfungsi mencerahkan kulit, meratakan warna kulit kusam, dan memberikan perlindungan antioksidan dari polusi dan paparan sinar UV. Diperkaya dengan ekstrak licorice dan vitamin E untuk efek brightening dan antioksidan tambahan. Tekstur serum agak kental namun mudah menyerap, tidak berminyak. Kemasan botol 15ml dengan pipet. Penggunaan rutin selama 4 minggu dapat menunjukkan hasil kulit lebih cerah dan bercahaya. Disarankan untuk melakukan uji patch terlebih dahulu jika kulit sensitif.', 25000, 'img/implora-vitc.jpg', 2, 120),
(7, 'Scarlett Brightly Serum', 'Scarlett Brightly Serum adalah serum pencerah yang menggabungkan tiga bahan aktif andalan: Alpha Arbutin 5% (pencerah yang lebih stabil dari hydroquinone), Niacinamide 10%, dan 10% Vitamin C (L-Ascorbic Acid). Formula triple brightening ini bekerja secara sinergis untuk menghambat produksi melanin, mencerahkan noda hitam, dan membuat kulit tampak glowing alami. Tekstur serum gel yang ringan, tidak lengket, dan cepat meresap. Kandungan tambahan seperti Witch Hazel dan Tea Tree Oil membantu menyamarkan bekas jerawat. Kemasan botol kaca 20ml dengan pipet. Disarankan penggunaan tepat 3 tetes untuk seluruh wajah, gunakan sunscreen di pagi hari.', 75000, 'img/scarlett-serum.jpg', 2, 90),
(8, 'The Originote Hyalucera Serum', 'The Originote Hyalucera Serum adalah serum hidrasi intensif yang menggabungkan 5 jenis Hyaluronic Acid dengan berbagai berat molekul (Sodium Hyaluronate, Hydrolyzed Hyaluronic Acid, Sodium Acetylated Hyaluronate, dsb) sehingga mampu menembus lapisan kulit yang berbeda. Kandungan Ceramide kompleks (Ceramide NP, AP, EOP) membantu memperbaiki skin barrier yang rusak akibat faktor lingkungan. Diperkaya dengan Panthenol (Vitamin B5) untuk menenangkan iritasi ringan. Tekstur serum bening agak kental seperti gel, memberikan sensasi segar dan melembabkan tanpa lengket. Kemasan botol 30ml dengan pump. Cocok untuk semua jenis kulit, terutama kulit kering dan dehidrasi.', 55000, 'img/originote-serum.jpg', 2, 65),
(9, 'Azarine Hydrasoothe Serum', 'Azarine Hydrasoothe Serum adalah serum calming-hydrating yang diformulasikan khusus untuk kulit sensitif, kemerahan, dan iritasi. Mengandung 10% Centella Asiatica Extract (Cica) yang terkenal akan khasiatnya dalam menyembuhkan luka, mengurangi peradangan, dan memperkuat skin barrier. Kombinasi dengan Hyaluronic Acid 3% memberikan hidrasi intensif tanpa rasa perih. Tekstur serum cair bening, sangat ringan seperti air, cocok untuk kulit berminyak sekalipun. Tidak mengandung alkohol, pewangi, dan bahan iritan lainnya. Kemasan botol 20ml dengan pipet. Ideal digunakan setelah prosedur skin treatment seperti facial atau eksfoliasi kimia.', 68000, 'img/azarine-serum.jpg', 2, 55),
(10, 'Azarine Hydrasoothe Sunscreen SPF 45', 'Azarine Hydrasoothe Sunscreen SPF 45 adalah tabir surya hybrid (perpaduan chemical dan physical) dengan tekstur ringan seperti serum. Dilengkapi SPF 45 PA++++ yang melindungi dari sinar UVA dan UVB dengan perlindungan sangat tinggi. Kandungan Centella Asiatica dan Hyaluronic Acid memberikan efek menenangkan dan melembabkan, sehingga sunscreen ini tidak menyisakan white cast meskipun diaplikasikan dalam jumlah cukup. Teksturnya sangat ringan, cepat meresap, dan tidak lengket sehingga nyaman digunakan sebagai base makeup. Tidak menyebabkan komedo, aman untuk kulit berjerawat. Kemasan tube 30ml dengan tutup flip-flop. Gunakan 15 menit sebelum beraktivitas di luar ruangan.', 68000, 'img/azarine-sunscreen.jpg', 3, 85),
(11, 'Emina Sun Protection SPF 30', 'Emina Sun Protection SPF 30 adalah sunscreen harian dengan SPF 30 PA+++ yang memberikan perlindungan cukup untuk aktivitas sehari-hari di dalam ruangan. Tekstur lotion ringan yang mudah merata dan cepat menyerap, tidak meninggalkan rasa lengket atau berminyak. Kandungan ekstrak aloe vera dan vitamin E memberikan kelembaban ekstra dan antioksidan ringan. Kemasan tube 30ml dengan desain warna-warni yang menarik remaja. Cocok digunakan sebagai base makeup karena teksturnya yang tidak menggumpal saat dipadukan dengan foundation. Wajib dipakai setiap pagi, terutama bagi yang sering terpapar sinar matahari melalui jendela kaca.', 35000, 'img/emina-sunscreen.jpg', 3, 110),
(12, 'Skintific Mineral Sunscreen SPF 50', 'Skintific Mineral Sunscreen SPF 50 adalah tabir surya fisik (mineral) 100% dengan kandungan Zinc Oxide 21% sebagai filter UV alami. Memberikan perlindungan SPF 50 PA++++ terhadap sinar UVA (penuaan) dan UVB (kemerahan). Teknologi Smart Shield Powder memastikan partikel zinc oxide terdistribusi merata tanpa white cast yang mencolok. Formula juga dilengkapi Ceramide dan Hyaluronic Acid untuk menjaga kelembaban kulit. Sangat aman untuk kulit sensitif, berjerawat, dan kulit yang sedang menjalani perawatan aktif (retinol, AHA). Tidak perlu reapply terlalu sering karena filter fisik lebih stabil. Kemasan tube 30ml dengan pump.', 119000, 'img/skintific-sunscreen.jpg', 3, 70),
(13, 'Wardah UV Shield Sunscreen SPF 50', 'Wardah UV Shield Sunscreen SPF 50 adalah tabir surya dengan perlindungan maksimal SPF 50 PA++++ yang diformulasikan khusus untuk kondisi outdoor dan iklim tropis. Mengandung 4 jenis filter UV (diethylamino hydroxybenzoyl hexyl benzoate, ethylhexyl triazone, dsb) yang memberikan perlindungan broad-spectrum. Tekstur lotion yang cukup kental namun tidak lengket setelah meresap. Dilengkapi dengan Vitamin E dan ekstrak green tea sebagai antioksidan. Tidak meninggalkan white cast pada kulit sawo matang. Kemasan tube 40ml yang praktis. Penggunaan cukup 1/2 sendok teh untuk seluruh wajah dan leher, reapply setiap 2-3 jam jika beraktivitas di luar ruangan.', 58000, 'img/wardah-sunscreen.jpg', 3, 95),
(14, 'Somethinc Level 1% BHA Pore Solution Toner', 'Somethinc Level 1% BHA Pore Solution Toner adalah toner eksfoliasi kimia dengan kandungan Beta Hydroxy Acid (Salicylic Acid) 1%. BHA bersifat lipofilik (larut dalam minyak) sehingga mampu menembus pori-pori untuk membersihkan sumbatan minyak dan sel kulit mati. Sangat efektif untuk mengatasi komedo (whitehead dan blackhead), pori-pori membesar, dan kulit berjerawat ringan. Tekstur toner cair bening seperti air, tidak lengket. Gunakan dengan kapas atau langsung ditepuk-tepuk setelah mencuci muka. Mulai dengan pemakaian 2-3x seminggu untuk kulit sensitif. Dilengkapi dengan ekstrak witch hazel dan tea tree untuk efek astringent ringan. Kemasan botol 100ml.', 99000, 'img/somethinc-toner.jpg', 4, 60),
(15, 'Hada Labo Gokujyun Premium Lotion', 'Hada Labo Gokujyun Premium Lotion adalah toner hidrasi terlaris dari Jepang yang mengandung 5 jenis Hyaluronic Acid dengan berat molekul berbeda. Jenis-jenisnya meliputi: Sodium Hyaluronate (berat molekul tinggi untuk hidrasi permukaan), Hydrolyzed Hyaluronic Acid (berat molekul rendah untuk penetrasi lebih dalam), Sodium Acetylated Hyaluronate (super hyaluronic acid dengan kemampuan mengikat air 2x lipat), Hydroxypropyltrimonium Hyaluronate, dan Hyaluronic Acid. Tekstur lotion kental seperti jelly yang terasa mewah saat diaplikasikan. Tidak mengandung pewangi, pewarna, alkohol, dan mineral oil. Cocok untuk kulit kering hingga sangat kering. Kemasan botol 170ml dengan pump. Gunakan setelah cleanser dan sebelum serum.', 145000, 'img/hadalabo-toner.jpg', 4, 45),
(16, 'Nacific Fresh Herb Origin Toner', 'Nacific Fresh Herb Origin Toner adalah toner herbal asal Korea yang mengandung 10 jenis ekstrak tanaman segar: chamomile, rosemary, lavender, peppermint, green tea, centella asiatica, witch hazel, aloe vera, licorice, dan sage. Kombinasi ekstrak ini memberikan efek menenangkan, anti-inflamasi, dan melembabkan tanpa iritasi. Formula tanpa alkohol, paraben, dan pewangi sintetis. Tekstur toner cair bening, ringan seperti air, cepat meresap. Dilengkapi dengan panthenol dan allantoin untuk mempercepat regenerasi kulit. Kemasan botol 200ml yang ekonomis. Penggunaan bisa dengan kapas atau langsung ditepuk-tepuk. Sangat cocok untuk kulit sensitif dan kemerahan.', 120000, 'img/nacific-toner.jpg', 4, 50),
(17, 'The Originote Ceramide Toner', 'The Originote Ceramide Toner adalah toner yang diformulasikan untuk memperkuat skin barrier dengan kandungan utama Ceramide kompleks (Ceramide NP, AP, EOP) serta Niacinamide 2%. Ceramide adalah lipid alami yang menyusun 50% struktur skin barrier dan berfungsi mencegah kehilangan air. Kandungan Niacinamide membantu mencerahkan dan mengontrol minyak. Ditambah dengan ekstrak oat dan allantoin untuk efek calming. Tekstur toner cair sedikit kental, memberikan sensasi lembab yang tahan lama. Kemasan botol 100ml dengan pump. Gunakan setiap pagi dan malam setelah mencuci muka. Sangat direkomendasikan bagi pemilik kulit kering, sensitif, atau yang sering mengalami iritasi.', 49000, 'img/originote-toner.jpg', 4, 80),
(18, 'Cetaphil Gentle Skin Cleanser', 'Cetaphil Gentle Skin Cleanser adalah pembersih wajah legendaris yang dikenal sangat lembut dan tidak menyebabkan iritasi. Mengandung teknologi Micellar Technology yang membersihkan kotoran, minyak berlebih, dan makeup ringan tanpa perlu dibilas (bisa dengan kapas). Formula bebas sabun (soap-free), bebas pewangi, bebas alkohol, dan non-comedogenic. pH seimbang 5.5-6.0 sesuai dengan pH alami kulit. Cocok untuk semua jenis kulit, terutama kulit sensitif, kering, dan yang sedang menjalani perawatan dermatologis (seperti pasca laser, eksim, rosacea). Tekstur lotion putih yang tidak berbusa. Kemasan botol 250ml dengan pump. Cara pemakaian: usapkan ke kulit wajah yang basah, pijat lembut, lalu bilas.', 98000, 'img/cetaphil-cleanser.jpg', 5, 75),
(19, 'Wardah Lightening Facial Wash', 'Wardah Lightening Facial Wash adalah sabun cuci muka dengan kandungan Vitamin C (Sodium Ascorbyl Phosphate) dan ekstrak buah bilberry yang membantu membersihkan sekaligus mencerahkan kulit wajah. Formula busa lembut yang mampu mengangkat kotoran dan sisa makeup tanpa membuat kulit kering. Kandungan ekstrak lidah buaya memberikan kelembaban ringan setelah mencuci muka. Dilengkapi dengan vitamin E sebagai antioksidan. Tekstur gel bening yang berubah menjadi busa saat dipijat dengan air. Kemasan tube 100ml, tersedia juga ukuran travel 30ml. Cocok untuk kulit normal hingga berminyak yang ingin mendapatkan efek brightening dari langkah pertama skincare.', 28000, 'img/wardah-facialwash.jpg', 5, 130),
(20, 'Bioderma Sensibio H2O Micellar Water', 'Bioderma Sensibio H2O Micellar Water adalah micellar water ikonik dari Prancis yang menjadi standar emas dalam pembersih wajah tanpa bilas. Mengandung teknologi micelles (misel) yang bekerja seperti magnet untuk mengangkat kotoran, minyak berlebih, dan makeup (termasuk waterproof) dengan lembut. Formula bebas alkohol, bebas pewangi, dan bebas paraben. Kandungan active ingredients: Cucumber extract untuk efek menenangkan, dan D.A.F. (Dermatological Advanced Formulation) yang meningkatkan toleransi kulit sensitif. Tekstur air bening yang tidak lengket. Kemasan botol 250ml dengan tutup flip-top. Cara pemakaian: basahi kapas, usapkan ke seluruh wajah dan mata, tidak perlu dibilas. Sangat direkomendasikan untuk kulit sensitif dan reaktif.', 185000, 'img/bioderma-micellar.jpg', 5, 35);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ratings`
--

CREATE TABLE `ratings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `produk_id` int(11) NOT NULL,
  `rating` tinyint(4) NOT NULL CHECK (`rating` between 1 and 5),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `ratings`
--

INSERT INTO `ratings` (`id`, `user_id`, `produk_id`, `rating`, `created_at`) VALUES
(1, 1, 4, 5, '2026-05-07 09:08:51'),
(4, 4, 6, 4, '2026-05-07 10:46:12'),
(5, 5, 4, 3, '2026-05-07 11:36:51'),
(6, 5, 2, 5, '2026-05-07 11:37:54');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'sam', '$2y$10$3gL7ThPt/UYR1WG0eL5PRuN6uEgvwSUuzfr3z.nNtJeV9Zm7pDxdC'),
(4, 'epan', '$2y$10$5yKAIpFyO4ezt3ArplJjt./9PRcG.MDzmbfTzbzXJT/rr3VOsUW9q'),
(5, 'Younove', '$2y$10$6O59LpEOQq7sg8ZpFqgNSOVSZPn.idpnuxl.A7EE5X9O.TxZ3d98.'),
(8, 'batu', '$2y$10$/NG6l6cHftTaLDcofW7vXuJKrNe9Byb7FN52S4BRVj39wS7BpxfqC');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kategori_id` (`kategori_id`);

--
-- Indeks untuk tabel `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_rating` (`user_id`,`produk_id`),
  ADD KEY `produk_id` (`produk_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `produk_ibfk_1` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
