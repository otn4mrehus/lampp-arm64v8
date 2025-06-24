<?php
//$host = 'mariadb';      // atau 'mariadb' jika pakai mengarah ke container MariaDB - PHP8.0
// atau 
$host = 'mysql';      // atau 'mariadb' jika pakai mengarah ke container MySQL - PHP7.4 
$dbname = 'mysql';
$username = 'root';
$password = 'toor';

try {
    $conn = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    // Set error mode ke exception
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo " <h1>Koneksi ke database berhasil!</h1>";
} catch (PDOException $e) {
    echo " <h1>Koneksi gagal: </h1>" . $e->getMessage();
}
?>
