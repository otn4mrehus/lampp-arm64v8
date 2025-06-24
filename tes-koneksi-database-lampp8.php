<?php
$host = 'mariadb';      // atau 'mariadb' jika pakai mengarah ke container MariaDB - PHP8.0
$dbname = 'mysql';
$username = 'root';
$password = 'toor';

try {
    $conn = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    // Set error mode ke exception
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo " <h1>Koneksi ke Database Lampp 8 Berhasil!</h1>";
} catch (PDOException $e) {
    echo " <h1>Koneksi Database Lampp 8 Gagal: </h1>" . $e->getMessage();
}
?>
