# Task :

1\. Buat sebuah diagram sebuah jaringan komputer dengan 4 device dengan kondisi :

\- IP Class C : 192.168.4.xxx

\- CIDR Block : 192.168.11.0/24

2\. Jelaskan perbedaan antara SH (Shell) dan BASH (Bourne-Again Shell)

3\. Buat dokumentasi/kumpulan command linux yang kalian ketahui! (Command diluar materi akan diberi nilai ++)

# Diagram Jaringan Komputer

<img src="images/media/image1.png" style="width:6.26806in;height:9.40556in" />

# Perbedaan SH (Shell) dan BASH (Bourne-Again Shell)

- **SH (Shell)**:

  - Merupakan shell asli yang dikembangkan oleh **Stephen Bourne** pada tahun 1977 untuk sistem operasi Unix.

  - Disebut juga sebagai **Bourne Shell**.

  - Shell ini sangat sederhana dan menjadi dasar untuk banyak shell lainnya.

  - Digunakan untuk menjalankan perintah-perintah dasar di sistem Unix/Linux.

- **BASH (Bourne-Again Shell)**:

  - Merupakan pengembangan dari **Bourne Shell (SH)** yang dibuat oleh **Brian Fox** pada tahun 1989.

  - BASH adalah shell yang lebih modern dan memiliki banyak fitur tambahan dibandingkan SH.

  - BASH adalah shell default di sebagian besar distribusi Linux modern.

Berikut tabel perbedaan fitur antara SH dan BASH:

| **Fitur** | **SH (Bourne Shell)** | **BASH (Bourne-Again Shell)** |
|----|----|----|
| **Kompatibilitas** | Sangat kompatibel dengan script Unix lama. | Kompatibel dengan SH, tetapi lebih modern. |
| **Command Line Editing** | Tidak mendukung. | Mendukung editing perintah (arrow keys, Ctrl+A, Ctrl+E, dll.). |
| **Tab Completion** | Tidak ada. | Mendukung penyelesaian otomatis dengan tombol Tab. |
| **Variabel dan Array** | Hanya mendukung variabel sederhana. | Mendukung array dan operasi array. |
| **Alias** | Tidak mendukung alias. | Mendukung pembuatan alias untuk perintah. |
| **Scripting Features** | Fitur scripting dasar. | Fitur scripting canggih seperti loop for, while, dan fungsi. |
| **Expansion** | Hanya ekspansi dasar (seperti \$var). | Mendukung ekspansi seperti \${var:-default} dan \${var//pattern/replace}. |
| **Job Control** | Tidak mendukung. | Mendukung job control (background, foreground, jobs, fg, bg). |
| **Command History** | Tidak menyimpan riwayat perintah. | Menyimpan riwayat perintah (bisa diakses dengan history). |

# Dokumentasi Perintah Linux Esensial untuk Praktisi DevOps

Dokumen ini adalah referensi cepat untuk perintah-perintah Linux yang paling sering digunakan praktisi DevOps. Fokus diberikan pada alat untuk otomatisasi, manajemen sistem, pemantauan, jaringan, dan *troubleshooting* yang efisien.

------------------------------------------------------------------------

## 1. Manajemen File & Direktori

| **Perintah** | **Deskripsi** | **Contoh Penggunaan & Konteks DevOps** |
|----|----|----|
| pwd | Menampilkan direktori kerja saat ini. | pwd (untuk verifikasi lokasi script/konfigurasi) |
| ls | Menampilkan daftar file dan direktori. | ls -lha (melihat detail izin, ukuran human-readable, termasuk file tersembunyi) |
| cd | Mengubah direktori. | cd /var/log/nginx (navigasi ke direktori log), cd ~/deployments |
| mkdir | Membuat direktori baru. | mkdir -p /opt/app/configs (membuat struktur direktori untuk aplikasi) |
| touch | Membuat file kosong atau memperbarui timestamp file. | touch /tmp/healthcheck.txt (untuk menandai file sebagai indikator kesehatan) |
| cp | Menyalin file atau direktori. | cp -r /tmp/build /var/www/html (deploy hasil build), cp .env.example .env |
| mv | Memindahkan atau mengubah nama file/direktori. | mv old_config.conf new_config.conf (update konfigurasi), mv /tmp/installer.sh . |
| rm | Menghapus file atau direktori. | rm -rf /tmp/old_build_artifacts (membersihkan ruang disk setelah deployment) |
| cat | Menampilkan isi file, menggabungkan file. | cat /etc/os-release (verifikasi distro OS), cat service_log.log |
| less | Menampilkan isi file halaman demi halaman (efisien untuk file besar). | less /var/log/syslog (menjelajahi log sistem) |
| head | Menampilkan beberapa baris pertama file. | head -n 20 /var/log/nginx/access.log (melihat entri log terbaru) |
| tail | Menampilkan beberapa baris terakhir file. | tail -f /var/log/app/app.log (memantau log aplikasi secara real-time) |
| find | Mencari file dan direktori. | find /var/www -name "\*.php" -type f (mencari semua file PHP di direktori web), find . -mtime +7 -delete (hapus file lebih dari 7 hari) |
| ln | Membuat tautan (link) ke file atau direktori. | ln -s /etc/nginx/sites-available/app.conf /etc/nginx/sites-enabled/app.conf (mengaktifkan konfigurasi Nginx) |

------------------------------------------------------------------------

## 2. Manajemen Sistem & Layanan

| **Perintah** | **Deskripsi** | **Contoh Penggunaan & Konteks DevOps** |
|----|----|----|
| uname | Menampilkan informasi sistem. | uname -a (verifikasi versi kernel dan arsitektur untuk kompatibilitas) |
| df | Menampilkan penggunaan disk space. | df -h (memantau ruang disk server) |
| du | Menampilkan penggunaan disk space oleh file/direktori. | du -sh /var/log (mencari tahu direktori mana yang menghabiskan banyak ruang) |
| free | Menampilkan penggunaan memori. | free -h (memantau penggunaan RAM server) |
| uptime | Menampilkan berapa lama sistem telah berjalan. | uptime (memeriksa stabilitas server dan waktu terakhir reboot) |
| hostname | Menampilkan atau mengatur hostname sistem. | hostname, sudo hostnamectl set-hostname webserver01 (konfigurasi server) |
| date | Menampilkan atau mengatur tanggal dan waktu sistem. | date (verifikasi sinkronisasi waktu, penting untuk log) |
| systemctl | Mengelola layanan sistem (systemd). | sudo systemctl status nginx, sudo systemctl restart docker, sudo systemctl enable jenkins (mengelola aplikasi/layanan) |
| journalctl | Mengkueri dan menampilkan pesan dari systemd journal. | journalctl -u nginx --since "1 hour ago" -f (memantau log layanan Nginx real-time dari 1 jam terakhir) |
| dmesg | Menampilkan pesan kernel ring buffer. | dmesg \| grep -i "error" (mencari error pada tingkat kernel) |
| reboot | Melakukan restart sistem. | sudo reboot (setelah patch kernel atau perubahan sistem kritis) |
| poweroff | Mematikan sistem. | sudo poweroff |

------------------------------------------------------------------------

## 3. Manajemen Proses & Sumber Daya

| **Perintah** | **Deskripsi** | **Contoh Penggunaan & Konteks DevOps** |
|----|----|----|
| ps | Menampilkan daftar proses yang sedang berjalan. | ps aux \| grep apache (mencari proses Apache), ps -ef \| grep "python script.py" |
| top | Menampilkan proses secara real-time dan penggunaan sumber daya. | top (pemantauan interaktif penggunaan CPU/memori/proses) |
| htop | Alternatif top yang lebih interaktif dan visual. | htop (memudahkan identifikasi bottleneck atau proses bermasalah) |
| kill | Mengirim sinyal ke proses (untuk menghentikan). | kill 12345 (menghentikan proses graceful), kill -9 12345 (menghentikan paksa) |
| pkill | Menghentikan proses berdasarkan nama atau kriteria. | pkill -f "java -jar myapp.jar" (menghentikan semua instance aplikasi Java) |
| pgrep | Mencari proses berdasarkan nama atau kriteria. | pgrep -f "nginx" (mendapatkan PID Nginx) |
| nohup | Menjalankan perintah di background agar tidak terhenti saat terminal ditutup. | nohup ./long_running_script.sh & (menjalankan script deployment tanpa terinterupsi) |
| jobs | Menampilkan daftar proses yang berjalan di background atau dihentikan di sesi shell. | jobs, fg %1 (mengelola proses background manual) |
| lsof | Mendaftar file yang dibuka oleh proses. | lsof -i :80 (melihat proses yang mendengarkan port 80), lsof /var/log/syslog |
| iotop | Memantau penggunaan I/O disk oleh proses. | sudo iotop (mendeteksi aplikasi yang banyak melakukan operasi disk) |
| iostat | Melaporkan statistik I/O perangkat. | iostat -xz 1 (memantau kinerja disk secara terus menerus) |
| vmstat | Melaporkan statistik memori virtual. | vmstat 1 (memantau memori, swap, CPU, dan I/O secara berkala) |

------------------------------------------------------------------------

## 4. Manajemen Pengguna, Grup & Hak Akses

| **Perintah** | **Deskripsi** | **Contoh Penggunaan & Konteks DevOps** |
|----|----|----|
| sudo | Menjalankan perintah sebagai superuser (root). | sudo apt update, sudo systemctl restart app (eksekusi perintah administratif) |
| su | Berubah ke pengguna lain. | su - deployuser (beralih ke user deployment untuk testing/troubleshooting) |
| useradd | Menambahkan pengguna baru. | sudo useradd -m -s /bin/bash deployuser (membuat user untuk CI/CD agent) |
| usermod | Mengubah properti pengguna. | sudo usermod -aG docker jenkins (menambahkan user Jenkins ke grup Docker) |
| groupadd | Menambahkan grup baru. | sudo groupadd devteam (membuat grup untuk tim pengembangan) |
| passwd | Mengubah kata sandi pengguna. | sudo passwd deployuser (setel password user baru) |
| chown | Mengubah kepemilikan user dan grup pada file/direktori. | sudo chown -R appuser:appgroup /var/www/app (menetapkan kepemilikan untuk aplikasi) |
| chgrp | Mengubah kepemilikan grup pada file/direktori. | sudo chgrp -R www-data /var/www/html |
| chmod | Mengubah hak akses file/direktori. | chmod 644 /etc/nginx/nginx.conf (setel izin untuk file konfigurasi), chmod +x deploy.sh (membuat script dapat dieksekusi) |
| id | Menampilkan ID pengguna dan grup. | id deployuser (verifikasi keanggotaan grup user) |
| whoami | Menampilkan nama pengguna yang sedang login. | whoami (verifikasi identitas pengguna saat ini) |

------------------------------------------------------------------------

## 5. Jaringan & Konektivitas

| **Perintah** | **Deskripsi** | **Contoh Penggunaan & Konteks DevOps** |
|----|----|----|
| ip | Menampilkan atau mengatur konfigurasi jaringan. | ip a (melihat IP address), ip route (melihat tabel routing) |
| ping | Menguji konektivitas ke host lain. | ping google.com, ping -c 4 192.168.1.1 (verifikasi konektivitas dasar) |
| ss | Utilitas untuk memeriksa soket (pengganti netstat yang lebih modern). | ss -tuln (melihat semua port TCP/UDP yang sedang listening), ss -tp sport = :80 (melihat koneksi ke port 80) |
| netstat | Menampilkan koneksi jaringan, tabel routing, statistik antarmuka (sedikit *deprecated*). | netstat -plnt (melihat port yang terbuka dan proses yang menggunakannya) |
| curl | Mentransfer data dari atau ke server (mendukung banyak protokol). | curl -sL https://get.docker.com \| sh (instalasi script), curl -X POST -H "Content-Type: application/json" -d '{"key":"value"}' http://localhost:8080/api/data (test API) |
| wget | Mengunduh file dari web. | wget https://example.com/software.tar.gz (mengunduh artefak atau dependensi) |
| ssh | Mengakses server secara remote dengan aman. | ssh user@remote-host, ssh -i ~/.ssh/id_rsa user@remote-host (akses server untuk deployment/troubleshooting) |
| scp | Menyalin file antar host di jaringan yang aman. | scp /local/path/file.txt user@remote-host:/remote/path/ (transfer file konfigurasi/deployment) |
| rsync | Sinkronisasi file dan direktori secara efisien. | rsync -avz /local/app/ user@remote-host:/var/www/app/ (deployment incremental) |
| netcat (nc) | Alat jaringan serbaguna (mendengar port, mengirim data). | nc -vz host port (cek port terbuka), echo "Hello" \| nc -N localhost 1234 |
| dig | Melakukan query DNS. | dig +short myapp.example.com (verifikasi resolusi DNS) |
| nslookup | Melakukan query DNS (juga untuk mencari informasi DNS). | nslookup myapp.example.com |
| traceroute | Melacak jalur paket ke tujuan. | traceroute google.com (diagnosa masalah routing jaringan) |

------------------------------------------------------------------------

## 6. Manajemen Paket & Software (Contoh untuk Debian/Ubuntu dan Red Hat/CentOS)

| **Perintah** | **Deskripsi** | **Contoh Penggunaan & Konteks DevOps** |
|----|----|----|
| apt update | Memperbarui daftar paket yang tersedia (Debian/Ubuntu). | sudo apt update (persiapan untuk instalasi/upgrade) |
| apt upgrade | Meng-upgrade paket yang terinstal (Debian/Ubuntu). | sudo apt upgrade -y (patching server secara otomatis) |
| apt install | Menginstal paket baru (Debian/Ubuntu). | sudo apt install -y nginx git vim (provisioning server dengan software dasar) |
| apt remove | Menghapus paket (Debian/Ubuntu). | sudo apt remove --purge some-old-package (membersihkan dependensi yang tidak perlu) |
| apt search | Mencari paket (Debian/Ubuntu). | apt search redis-server (menemukan nama paket yang tepat) |
| dpkg | Mengelola paket Debian (.deb) level rendah. | dpkg -i my_package.deb, dpkg -l \| grep jenkins (menginstal paket lokal, verifikasi paket terinstal) |
| dnf install | Menginstal paket baru (Fedora/CentOS Stream). | sudo dnf install -y httpd mariadb-server (untuk sistem berbasis Red Hat) |
| dnf update | Memperbarui daftar paket yang tersedia & upgrade (Fedora/CentOS Stream). | sudo dnf update -y |
| rpm | Mengelola paket Red Hat (.rpm) level rendah. | rpm -ivh my_package.rpm, rpm -qa \| grep docker |
| snap | Mengelola paket Snap (cross-distro). | sudo snap install --classic certbot |
| flatpak | Mengelola paket Flatpak (cross-distro). | flatpak install flathub org.mozilla.Thunderbird |

------------------------------------------------------------------------

## 7. Pencarian, Pemrosesan Teks & Otomatisasi

| **Perintah** | **Deskripsi** | **Contoh Penggunaan & Konteks DevOps** |
|----|----|----|
| grep | Mencari pola dalam file. | grep -Rn "ERROR" /var/log/app/ (mencari string "ERROR" secara rekursif di log), cat access.log \| grep " 404 " (mencari error 404 di log akses) |
| awk | Bahasa pemrograman untuk pemrosesan teks. | awk '{print \$1, \$4}' access.log (ekstrak IP dan timestamp dari log), ps aux \| awk '{print \$2, \$11}' (PID & Command) |
| sed | Editor stream untuk memfilter dan mentransformasi teks. | sed -i 's/old_url/new_url/g' config.yaml (mengganti string dalam file konfigurasi secara in-place), sed '/^#/d' file.conf (hapus baris komentar) |
| cut | Mengekstrak bagian dari setiap baris file. | cat /etc/passwd \| cut -d':' -f1,7 (mendapatkan username dan shell dari file passwd) |
| sort | Mengurutkan baris teks dari file. | cat access.log \| awk '{print \$1}' \| sort \| uniq -c \| sort -nr (mencari IP terbanyak di log akses) |
| uniq | Menghapus baris duplikat yang berurutan. | Digunakan dengan sort untuk menghitung kemunculan unik, seperti contoh di atas. |
| wc | Menghitung jumlah baris, kata, dan karakter dalam file. | wc -l my_script.sh (melihat jumlah baris kode), cat access.log \| wc -l |
| xargs | Membangun dan mengeksekusi baris perintah dari input standar. | find . -name "\*.log" \| xargs rm (menghapus semua file .log yang ditemukan) |
| tr | Mentranslate atau menghapus karakter. | echo "Hello World" \| tr ' ' '\_' (mengganti spasi dengan underscore) |
| tee | Membaca input standar dan menuliskannya ke output standar dan file. | command \| tee logfile.txt (melihat output sekaligus menyimpannya ke file) |
| grep -v | Mengeluarkan baris yang *tidak* cocok dengan pola. | cat service_log.log \| grep -v "INFO" (melihat log tanpa baris INFO) |

------------------------------------------------------------------------

## 8. Kompresi, Arsip & Transfer Data

| **Perintah** | **Deskripsi** | **Contoh Penggunaan & Konteks DevOps** |
|----|----|----|
| tar | Mengarsipkan file/direktori. | tar -czvf app_backup\_\$(date +%F).tar.gz /var/www/app (membuat backup terkompresi), tar -xvf deployment.tar.gz -C /opt/app (ekstrak paket deployment) |
| gzip | Mengkompresi file. | gzip access.log (menghemat ruang disk untuk log lama) |
| gunzip | Meng-uncompress file gzip. | gunzip access.log.gz |
| zip | Mengkompresi file ke format .zip. | zip -r myapp.zip /var/www/app |
| unzip | Meng-uncompress file .zip. | unzip deployment.zip -d /opt/app |
| bzip2 | Mengkompresi file (kompresi lebih baik dari gzip tetapi lebih lambat). | bzip2 large_data.csv |

------------------------------------------------------------------------

## 9. Variabel Lingkungan & Penjadwalan

| **Perintah** | **Deskripsi** | **Contoh Penggunaan & Konteks DevOps** |
|----|----|----|
| export | Mengatur variabel lingkungan. | export DATABASE_URL="mysql://user:pass@host/db", export PATH=\$PATH:/usr/local/bin (mengatur path untuk command) |
| printenv | Menampilkan semua variabel lingkungan. | printenv (melihat konfigurasi lingkungan) |
| env | Menampilkan atau menjalankan perintah di lingkungan baru. | env -i bash (memulai shell bersih tanpa variabel lingkungan) |
| crontab | Mengatur tugas terjadwal. | crontab -e (untuk mengedit cron jobs), crontab -l (melihat daftar cron jobs) |
| at | Menjadwalkan tugas untuk waktu tertentu di masa depan (sekali jalan). | echo "shutdown -h now" \| at 2am tomorrow |

------------------------------------------------------------------------

## 10. Perintah Lainnya yang Berguna

| **Perintah** | **Deskripsi** | **Contoh Penggunaan & Konteks DevOps** |
|----|----|----|
| man | Menampilkan manual (dokumentasi) untuk perintah. | man ssh (mencari opsi-opsi perintah SSH) |
| --help | Menampilkan bantuan singkat untuk perintah. | nginx -h, docker --help |
| alias | Membuat alias (nama panggilan) untuk perintah. | alias k='kubectl', alias ll='ls -lha' (mempercepat workflow CLI) |
| clear | Membersihkan layar terminal. | clear |
| history | Menampilkan riwayat perintah yang pernah dimasukkan. | history \| grep ssh (mencari perintah SSH yang pernah dijalankan) |
| watch | Menjalankan perintah secara berkala dan menampilkan outputnya. | watch -n 1 'df -h' (memantau penggunaan disk setiap 1 detik) |
| sudo !! | Menjalankan perintah sebelumnya dengan sudo. | Jika Anda lupa sudo pada apt update, cukup ketik sudo !! |
| \_ | Variabel shell yang berisi argumen terakhir dari perintah sebelumnya. | echo /path/to/file.txt, less !\$ (akan membuka /path/to/file.txt di less) |

------------------------------------------------------------------------

**Tips Tambahan untuk Praktisi DevOps:**

- **Pipa (\\)**: Gunakan pipa untuk merangkai perintah, mengalirkan output satu perintah ke input perintah berikutnya. Contoh: ps aux \\ grep nginx \\ awk '{print \$2}' \\ xargs kill

- **Redirect (\>, \>\>, \<, 2\>)**: Arahkan output ke file atau dari file. command \> output.txt (timpa), command \>\> output.txt (tambah), command \< input.txt (input dari file), command 2\> error.log (redirect error ke file)

- **Shell Scripting**: Kuasai dasar-dasar Bash scripting (if, for, while, variabel) untuk otomatisasi tugas.

- **Version Control (git)**: Meskipun bukan perintah Linux intrinsik, git adalah alat yang tak terpisahkan dari DevOps untuk mengelola kode dan konfigurasi.

- **Containerization (docker, podman)**: Perintah seperti docker ps, docker logs, docker exec adalah vital untuk mengelola aplikasi dalam kontainer.

- **Cloud CLIs (aws, az, gcloud)**: Banyak operasi di infrastruktur cloud dilakukan melalui CLI ini yang dieksekusi di terminal Linux.
