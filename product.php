<?php
session_start();
require 'koneksi.php';

$query = mysqli_query($conn,
    "SELECT p.*, k.nama AS nama_kategori,
            ROUND(AVG(r.rating), 1) AS rata_rating,
            COUNT(r.id) AS jml_rating
     FROM produk p
     LEFT JOIN kategori k ON p.kategori_id = k.id
     LEFT JOIN ratings r ON p.id = r.produk_id
     GROUP BY p.id
     ORDER BY k.nama, p.nama"
);

$rating_user = [];
if (isset($_SESSION['user_id'])) {
    $uid = (int) $_SESSION['user_id'];
    $q   = mysqli_query($conn, "SELECT produk_id, rating FROM ratings WHERE user_id='$uid'");
    while ($r = mysqli_fetch_assoc($q)) $rating_user[$r['produk_id']] = $r['rating'];
}

$pesan_tipe = $pesan_isi = "";
if (isset($_POST['submit_rating'])) {
    if (!isset($_SESSION['user_id'])) {
        $pesan_tipe = "danger"; $pesan_isi = "Harus login!";
    } else {
        $user_id = (int) $_SESSION['user_id'];
        $produk_id = (int) $_POST['produk_id'];
        $rating = (int) $_POST['rating'];
        if ($rating < 1 || $rating > 5) {
            $pesan_tipe = "danger"; $pesan_isi = "Rating tidak valid!";
        } else {
            $cek = mysqli_query($conn, "SELECT id FROM ratings WHERE user_id='$user_id' AND produk_id='$produk_id'");
            if (mysqli_num_rows($cek) > 0) {
                mysqli_query($conn, "UPDATE ratings SET rating='$rating' WHERE user_id='$user_id' AND produk_id='$produk_id'");
                $pesan_tipe = "success"; $pesan_isi = "Rating diperbarui!";
            } else {
                mysqli_query($conn, "INSERT INTO ratings (user_id, produk_id, rating) VALUES ('$user_id','$produk_id','$rating')");
                $pesan_tipe = "success"; $pesan_isi = "Rating disimpan!";
            }
        }
    }
    header("Location: product.php?pesan=$pesan_tipe&isi=" . urlencode($pesan_isi));
    exit;
}
if (isset($_GET['pesan'])) { $pesan_tipe = $_GET['pesan']; $pesan_isi = $_GET['isi']; }
?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Katalog Produk - Beauty Pick</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="style.css">
</head>
<body>
<nav class="navbar navbar-expand-lg bg-white shadow-sm sticky-top">
    <div class="container">
        <a class="navbar-brand" href="index.php"><i class="fas fa-leaf"></i> Beauty Pick</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto"><li class="nav-item"><a class="nav-link" href="index.php">Home</a></li><li class="nav-item"><a class="nav-link active" href="product.php">Produk</a></li></ul>
            <div class="d-flex gap-2">
                <?php if (isset($_SESSION['user_id'])): ?>
                    <span class="navbar-text me-2"><i class="fas fa-user-circle"></i> <b><?= htmlspecialchars($_SESSION['username']) ?></b></span>
                    <button class="btn btn-outline-danger btn-sm" data-bs-toggle="modal" data-bs-target="#modalHapusAkun"><i class="fas fa-trash-alt"></i> Hapus Akun</button>
                    <a href="logout.php" class="btn btn-danger btn-sm"><i class="fas fa-sign-out-alt"></i> Logout</a>
                <?php else: ?>
                    <a href="login.php" class="btn btn-outline-primary btn-sm"><i class="fas fa-sign-in-alt"></i> Login</a>
                    <a href="register.php" class="btn btn-primary btn-sm"><i class="fas fa-user-plus"></i> Register</a>
                <?php endif; ?>
            </div>
        </div>
    </div>
</nav>
<?php if (isset($_SESSION['user_id'])): ?>
<div class="modal fade" id="modalHapusAkun" tabindex="-1"><div class="modal-dialog modal-dialog-centered"><div class="modal-content"><div class="modal-header bg-danger text-white"><h5 class="modal-title">Konfirmasi Hapus Akun</h5><button type="button" class="btn-close" data-bs-dismiss="modal"></button></div><div class="modal-body"><p>Hapus akun <b><?= htmlspecialchars($_SESSION['username']) ?></b>? Semua data rating akan hilang.</p></div><div class="modal-footer"><button class="btn btn-secondary" data-bs-dismiss="modal">Batal</button><a href="hapus_akun.php" class="btn btn-danger">Ya, Hapus</a></div></div></div></div>
<?php endif; ?>
<div class="container my-5">
    <div class="text-center mb-5"><h2 class="section-title"><i class="fas fa-store"></i> Semua Produk Skincare</h2><p class="section-subtitle">Temukan informasi lengkap harga, stok, dan rating</p></div>
    <?php if ($pesan_isi): ?><div class="alert alert-<?= htmlspecialchars($pesan_tipe) ?> alert-dismissible fade show"><?= htmlspecialchars($pesan_isi) ?><button type="button" class="btn-close" data-bs-dismiss="alert"></button></div><?php endif; ?>
    <?php
    $kategori_aktif = "";
    $ikon_kategori = ['Moisturizer'=>'🧴','Serum'=>'💧','Sunscreen'=>'☀️','Toner'=>'🌿','Cleanser'=>'🫧'];
    while ($p = mysqli_fetch_assoc($query)):
        if ($p['nama_kategori'] !== $kategori_aktif):
            if ($kategori_aktif !== "") echo '</div>';
            $kategori_aktif = $p['nama_kategori'];
            $ikon = $ikon_kategori[$kategori_aktif] ?? '✨';
            echo '<div class="category-header"><h4 class="category-title">'.$ikon.' '.htmlspecialchars($kategori_aktif).'</h4></div><div class="row g-4">';
        endif;
        $rata = $p['rata_rating'];
        $bintang_html = "";
        for ($i=1;$i<=5;$i++) $bintang_html .= ($rata && $i<=round($rata)) ? '<i class="fas fa-star text-warning"></i>' : '<i class="far fa-star text-muted"></i>';
        $slider_val = $rating_user[$p['id']] ?? 3;
        $harga_fmt = 'Rp ' . number_format($p['harga'],0,',','.');
    ?>
        <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6">
            <div class="product-card">
                <div class="product-image-wrapper"><img src="<?= htmlspecialchars($p['gambar']) ?>" class="product-image" alt="<?= htmlspecialchars($p['nama']) ?>"><div class="product-overlay"><a href="product_detail.php?id=<?= $p['id'] ?>" class="btn btn-view"><i class="fas fa-eye"></i> Detail</a></div></div>
                <div class="product-body">
                    <span class="badge-category"><?= htmlspecialchars($p['nama_kategori']) ?></span>
                    <h5 class="product-title"><?= htmlspecialchars($p['nama']) ?></h5>
                    <div class="product-price"><?= $harga_fmt ?></div>
                    <div class="product-stock"><?= ($p['stok']>0) ? '<i class="fas fa-check-circle text-success"></i> Stok: '.$p['stok'].' pcs' : '<i class="fas fa-times-circle text-danger"></i> Stok habis' ?></div>
                    <div class="product-rating mb-2"><?= $bintang_html ?> <span class="rating-count">(<?= (int)$p['jml_rating'] ?>)</span></div>
                    <?php if (isset($_SESSION['user_id'])): ?>
                        <form method="POST" class="rating-form">
                            <input type="hidden" name="produk_id" value="<?= $p['id'] ?>">
                            <input type="range" name="rating" min="1" max="5" value="<?= $slider_val ?>" class="form-range" oninput="this.nextElementSibling.children[0].innerText=this.value">
                            <div class="rating-labels"><span><?= $slider_val ?></span>/5</div>
                            <button type="submit" name="submit_rating" class="btn btn-sm btn-outline-primary w-100 mt-2"><i class="fas fa-star"></i> Beri Rating</button>
                        </form>
                    <?php else: ?>
                        <div class="text-center mt-3"><a href="login.php" class="btn btn-sm btn-primary"><i class="fas fa-sign-in-alt"></i> Login untuk Rating</a></div>
                    <?php endif; ?>
                </div>
            </div>
        </div>
    <?php endwhile; if ($kategori_aktif !== "") echo '</div>'; ?>
</div>
<footer class="footer"><div class="container"><div class="row"><div class="col-md-4 mb-4"><h5><i class="fas fa-leaf"></i> Beauty Pick</h5><p>Pusat informasi skincare.</p><div class="social-links"><a href="#"><i class="fab fa-instagram"></i></a><a href="#"><i class="fab fa-facebook"></i></a><a href="#"><i class="fab fa-twitter"></i></a></div></div><div class="col-md-4 mb-4"><h5>Informasi</h5><ul class="footer-links"><li><a href="#">Tentang Kami</a></li><li><a href="#">Kebijakan Privasi</a></li></ul></div><div class="col-md-4 mb-4"><h5>Kontak</h5><ul class="footer-links"><li><i class="fas fa-envelope"></i> hello@beautypick.com</li><li><i class="fas fa-phone"></i> (021) 1234-5678</li></ul></div></div><hr><div class="text-center"><small>© 2025 Beauty Pick.</small></div></div></footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>