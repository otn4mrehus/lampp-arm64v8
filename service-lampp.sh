#!/bin/bash

COMPOSE_FILE="dokcer-compose_php8+php7.4+MariaDB10.5+MySQL5.7.yaml"

menu() {
echo "=== PILIH ENVIRONMENT LAMPP ==="
echo "1. Start PHP 7.4 + MySQL 5.7"
echo "2. Stop  PHP 7.4 + MySQL 5.7"
echo "3. Restart PHP 7.4 + MySQL 5.7"
echo "----------------------------"
echo "4. Start PHP 8 + MariaDB 10.5"
echo "5. Stop  PHP 8 + MariaDB 10.5"
echo "6. Restart PHP 8 + MariaDB 10.5"
echo "----------------------------"
echo "0. Keluar"
}

while true; do
    menu
    read -p "Masukkan pilihan [0-6]: " pilihan
    case $pilihan in
        1)
            echo "Menjalankan PHP 7.4 + MySQL 5.7 + phpMyAdmin..."
            docker-compose -f "$COMPOSE_FILE" -p 'lampp7.4' up -d web db phpmyadmin
            ;;
        2)
            echo "Menghentikan PHP 7.4 + MySQL 5.7 + phpMyAdmin..."
            docker-compose -f "$COMPOSE_FILE" -p 'lampp7.4' stop web db phpmyadmin
            ;;
        3)
            echo "Restart PHP 7.4 + MySQL 5.7 + phpMyAdmin..."
            docker-compose -f "$COMPOSE_FILE" -p 'lampp7.4' restart web db phpmyadmin
            ;;
        4)
            echo "Menjalankan PHP 8 + MariaDB 10.5 + phpMyAdmin..."
            docker-compose -f "$COMPOSE_FILE" -p 'lampp8.0' up -d web8 mariadb phpmyadmin8
            ;;
        5)
            echo "Menghentikan PHP 8 + MariaDB 10.5 + phpMyAdmin..."
            docker-compose -f "$COMPOSE_FILE" -p 'lampp8.0' stop web8 mariadb phpmyadmin8
            ;;
        6)
            echo "Restart PHP 8 + MariaDB 10.5 + phpMyAdmin..."
            docker-compose -f "$COMPOSE_FILE" -p 'lampp8.0' restart web8 mariadb phpmyadmin8
            ;;
        0)
            echo "Keluar."
            exit 0
            ;;
        *)
            echo "Pilihan tidak valid."
            ;;
    esac
    echo ""
done
