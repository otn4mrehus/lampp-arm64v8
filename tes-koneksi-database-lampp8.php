<?php
$host = 'mariadb';      // atau 'mariadb' jika pakai mengarah ke container MariaDB - PHP8.0
$dbname = 'mysql';
$username = 'root';
$password = 'toor';

try {
    $conn = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    // Set error mode ke exception
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo " <h1>Koneksi ke database Lampp 8 berhasil!</h1>";
} catch (PDOException $e) {
    echo " <h1>Koneksi Lampp 8 gagal: </h1>" . $e->getMessage();
}
?>
