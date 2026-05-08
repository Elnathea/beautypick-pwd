<?php
session_start();
require 'koneksi.php';

// Keamanan: hanya bisa diakses jika sudah login
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit;
}

$user_id = (int) $_SESSION['user_id'];

// Hapus user dari database
// Rating akan terhapus otomatis karena ada ON DELETE CASCADE
mysqli_query($conn, "DELETE FROM users WHERE id = '$user_id'");

// Hancurkan session setelah akun dihapus
session_destroy();

// Redirect ke halaman register dengan pesan
header("Location: register.php?hapus=1");
exit;
?>