<?php
$host = 'mysql';      // atau 'mariadb' jika pakai mengarah ke container MySQL - PHP7.4 
$dbname = 'mysql';
$username = 'root';
$password = 'toor';

try {
    $conn = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    // Set error mode ke exception
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo " <h1>Koneksi ke Database Lampp 7 Berhasil!</h1>";
} catch (PDOException $e) {
    echo " <h1>Koneksi Database Lampp 7 Gagal: </h1>" . $e->getMessage();
}
?>
