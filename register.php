<?php
session_start();
require 'koneksi.php';

if (isset($_SESSION['user_id'])) {
    header("Location: index.php");
    exit;
}

$pesan = "";

if (isset($_POST['register'])) {
    $username = trim($_POST['username']);
    $password = $_POST['password'];
    $konfirm  = $_POST['konfirm'];

    if (empty($username) || empty($password)) {
        $pesan = "Username dan password tidak boleh kosong!";
    } elseif ($password !== $konfirm) {
        $pesan = "Password dan konfirmasi password tidak sama!";
    } else {
        $cek = mysqli_query($conn, "SELECT id FROM users WHERE username='$username'");
        if (mysqli_num_rows($cek) > 0) {
            $pesan = "Username sudah digunakan, coba yang lain!";
        } else {
            $hash = password_hash($password, PASSWORD_DEFAULT);
            mysqli_query($conn, "INSERT INTO users (username, password) VALUES ('$username', '$hash')");
            header("Location: login.php?sukses=1");
            exit;
        }
    }
}
?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register — Beauty Pick</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="style.css">
</head>
<body class="auth-body">

<nav class="navbar bg-white shadow-sm">
    <div class="container">
        <a class="navbar-brand" href="index.php">
            <i class="fas fa-leaf"></i> Beauty Pick
        </a>
    </div>
</nav>

<div class="auth-container">
    <div class="auth-card">
        <div class="auth-header">
            <h4><i class="fas fa-user-plus"></i> Daftar Akun</h4>
            <p>Buat akun baru untuk mulai berbelanja</p>
        </div>

        <?php if (isset($_GET['hapus'])): ?>
            <div class="alert alert-warning">
                <i class="fas fa-info-circle"></i> Akun kamu berhasil dihapus. Silakan daftar lagi jika ingin kembali.
            </div>
        <?php endif; ?>

        <?php if ($pesan): ?>
            <div class="alert alert-danger">
                <i class="fas fa-exclamation-circle"></i> <?= htmlspecialchars($pesan) ?>
            </div>
        <?php endif; ?>

        <form method="POST">
            <div class="mb-3">
                <label class="form-label"><i class="fas fa-user"></i> Username</label>
                <input type="text" name="username" class="form-control" placeholder="Masukkan username" required>
            </div>
            <div class="mb-3">
                <label class="form-label"><i class="fas fa-key"></i> Password</label>
                <input type="password" name="password" class="form-control" placeholder="Masukkan password" required>
            </div>
            <div class="mb-3">
                <label class="form-label"><i class="fas fa-check-circle"></i> Konfirmasi Password</label>
                <input type="password" name="konfirm" class="form-control" placeholder="Ulangi password" required>
            </div>
            <button type="submit" name="register" class="btn btn-auth">
                <i class="fas fa-user-plus"></i> Daftar
            </button>
        </form>

        <hr>
        <p class="text-center mb-0">
            Sudah punya akun? <a href="login.php">Login di sini</a>
        </p>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>