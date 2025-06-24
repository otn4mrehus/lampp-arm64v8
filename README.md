# LAMPP-ARM64 STB
LAMPP Armbian 64 Bit | STB-B680H v2.1
## 1. Download
```
git clone https://github.com/otn4mrehus/lampp-arm64v8.git
cd lampp-arm64v8
```
## 2. Run Container
```
sh service-lampp.sh
```

## 3. Run Lampp
#### PHP 7.4
##### WEB
```
127.0.0.1:2000 
```
##### PHPMyAdmin
```
127.0.0.1:2001 
```
#### PHP 8.0
##### WEB
```
127.0.0.1:3000  
```
##### PHPMyAdmin
```
127.0.0.1:3001 
```

#### Opsional
```
2022 : Akses SSH Container PHP7.4
3022 : Akses SSH Container PHP8.0
```

## 4. Login
#### SSH
```
Container PHP7 / PHP8
user: root
pass: toor
```
#### PHPMyAdmin
```
Container PHP7 / PHP8
user: root
pass: toor

user: user
pass: userpass
```

## 5. Menu Admin (Otomatis)
```
sh service-lampp.sh
```

## 6. Opsional (Rewrite Server)
#### PHP7
```
docker exec -it lampp7-php7.4 bash
a2enmod rewrite && service apache2 restart  ## ENABLE
a2dismod rewrite && service apache2 restart  ## DISABLE
```

#### PHP8
```
docker exec -it lampp8-php8.0 bash
a2enmod rewrite && service apache2 restart  ## ENABLE
a2dismod rewrite && service apache2 restart  ## DISABLE
```

## 7. Koneksi database PHP - MySQL/MariaDB
##### <i>Contoh File Lengkap : tes-koneksi-database.php </i>
#### PHP7-MySQL
```
$host = 'mysql';      // atau 'mariadb' jika pakai mengarah ke container MySQL - PHP7.4 
$dbname = 'mysql';
$username = 'root';
$password = 'toor';
```

#### PHP8-MariaDB
```
$host = 'mariadb';      // atau 'mariadb' jika pakai mengarah ke container MySQL - PHP7.4 
$dbname = 'mysql';
$username = 'root';
$password = 'toor';
```
