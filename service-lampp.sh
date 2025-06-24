#!/bin/bash

COMPOSE_FILE="docker-compose_php8+php7.4+MariaDB10.5+MySQL5.7.yaml"

menu() {
    echo "=== MENU LAMPP DOCKER ==="
    echo "1. PHP 7.4 + MySQL 5.7"
    echo "2. PHP 8 + MariaDB 10.5"
    echo "0. Keluar"
}

submenu_php7() {
    echo "=== PHP 7.4 + MySQL 5.7 ==="
    echo "1. Instalasi & Start"
    echo "2. Stop"
    echo "3. Restart"
    echo "4. Down (stop & hapus kontainer/volume)"
    echo "5. Aktifkan SSH di PHP 7.4"
    echo "0. Kembali"
}

submenu_php8() {
    echo "=== PHP 8 + MariaDB 10.5 ==="
    echo "1. Instalasi & Start"
    echo "2. Stop"
    echo "3. Restart"
    echo "4. Down (stop & hapus kontainer/volume)"
    echo "5. Aktifkan SSH di PHP 8.0"
    echo "0. Kembali"
}

while true; do
    menu
    read -p "Pilih environment [0-2]: " env
    case $env in
        1)
            while true; do
                submenu_php7
                read -p "Pilih aksi untuk PHP 7.4 + MySQL 5.7 [0-5]: " aksi7
                case $aksi7 in
                    1)
                        echo "Menjalankan PHP 7.4 + MySQL 5.7 + phpMyAdmin..."
                        docker-compose -f "$COMPOSE_FILE" -p 'lampp7' up --build -d web7 mysql phpmyadmin7
                        ;;
                    2)
                        echo "Menghentikan PHP 7.4 + MySQL 5.7 + phpMyAdmin..."
                        docker-compose -f "$COMPOSE_FILE" -p 'lampp7' stop web7 mysql phpmyadmin7
                        ;;
                    3)
                        echo "Restart PHP 7.4 + MySQL 5.7 + phpMyAdmin..."
                        docker-compose -f "$COMPOSE_FILE" -p 'lampp7' restart web7 mysql phpmyadmin7
                        ;;
                    4)
                        echo "Down (stop & hapus kontainer/volume) PHP 7.4 + MySQL 5.7..."
                        docker-compose -f "$COMPOSE_FILE" -p 'lampp7' down -v
                        ;;
                    5)
                        echo "Mengaktifkan SSH di lampp-php7.4..."
                        docker exec -it lampp-php7.4 bash -c 'echo "apt -y update && apt -y install openssh-server && PermitRootLogin yes" >> /etc/ssh/sshd_config && echo "root:toor" | chpasswd && service ssh restart'
                        ;;
                    0)
                        break
                        ;;
                    *)
                        echo "Pilihan tidak valid."
                        ;;
                esac
                echo ""
            done
            ;;
        2)
            while true; do
                submenu_php8
                read -p "Pilih aksi untuk PHP 8 + MariaDB 10.5 [0-5]: " aksi8
                case $aksi8 in
                    1)
                        echo "Menjalankan PHP 8 + MariaDB 10.5 + phpMyAdmin..."
                        docker-compose -f "$COMPOSE_FILE" -p 'lampp8' up --build -d web8 mariadb phpmyadmin8
                        ;;
                    2)
                        echo "Menghentikan PHP 8 + MariaDB 10.5 + phpMyAdmin..."
                        docker-compose -f "$COMPOSE_FILE" -p 'lampp8' stop web8 mariadb phpmyadmin8
                        ;;
                    3)
                        echo "Restart PHP 8 + MariaDB 10.5 + phpMyAdmin..."
                        docker-compose -f "$COMPOSE_FILE" -p 'lampp8' restart web8 mariadb phpmyadmin8
                        ;;
                    4)
                        echo "Down (stop & hapus kontainer/volume) PHP 8 + MariaDB 10.5..."
                        docker-compose -f "$COMPOSE_FILE" -p 'lampp8' down -v
                        ;;
                    5)
                        echo "Mengaktifkan SSH di lampp-php8.0..."
                        docker exec -it lampp-php8.0 bash -c 'echo "apt -y update && apt -y install openssh-server &&  PermitRootLogin yes" >> /etc/ssh/sshd_config && echo "root:toor" | chpasswd && service ssh restart'
                        ;;
                    0)
                        break
                        ;;
                    *)
                        echo "Pilihan tidak valid."
                        ;;
                esac
                echo ""
            done
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
