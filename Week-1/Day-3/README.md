# Task :

1\. Akses server menggunakan terminal

(Windows Terminal/PuTTY/etc.)

2\. Konfigurasi ssh kalian agar bisa di akses \*hanya menggunakan publickey\* (password opsional, bisa dimatikan)

3\. Buat step by step penggunaan text manipulation! (grep, sed, cat, echo)

4\. Nyalakan ufw dengan memberikan akses untuk port 22, 80, 443, 3000, 5000 dan 6969!

# Akses Server Via SSH Menggunakan Terminal

Langkah – Langkah :

1.  Cek ip server VM dengan perintah “ip a” pada server VM

<img src="images/media/image1.png" style="width:6.26806in;height:2.275in" />

2.  Install openssh-server pada server dengan perintah “sudo apt install openssh-server”

<img src="images/media/image2.png" style="width:5.62579in;height:1.22934in" />

3.  Cek status sistem pada server apakah openssh sudah berjalan / belum dengan perintah “systemctl status ssh”

<img src="images/media/image3.png" style="width:6.26806in;height:2.67292in" />

4.  Jika sudah, beralih ke terminal windows dan masukkan perintah “ssh \<user-server@ip-server\>”. Di sini saya memasukkan perintah sesuai dengan user dan ip server saya “ssh <aditya@192.168.18.208>”. Nanti akan diminta untuk verifikasi fingerprint ketik “yes” dan enter, lalu masukkan password server dan tekan enter.

<img src="images/media/image4.png" style="width:6.26806in;height:3.60208in" />

5.  Selesai, sudah berhasil masuk ke server melalui terminal windows

# Konfigurasi SSH

Agar dapat mengakses server dengan publik key tanpa memasukkan password. Langkah – langkah :

1.  Buka terminal windows dan gunakan perintah “ssh-keygen”

<img src="images/media/image5.png" style="width:6.26806in;height:2.28958in" />

2.  Masuk ke direktori hasil generating publik key ssh dengan perintah cd “C:\Users\Aditya Indra W\\ssh” dan ls untuk menampilkan isi file yang ada pada direktori.

<img src="images/media/image6.png" style="width:5.77164in;height:2.29199in" />

3.  Pada direktori terdapat file “kunci_dumbways.pub”. Lihat isi file tersebut dengan perintah “cat kunci_dumbways.pub”

<img src="images/media/image7.png" style="width:6.26806in;height:2.1875in" />

4.  Salin isi file tersebut “ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIALmQ4W/f1j6kTVajntwv/vUhnS7+8wgrUIT7zAOg9ae aditya indra w@MSI”.

5.  Login ke server VM dan masuk ke direktori /.ssh

<img src="images/media/image8.png" style="width:4.82359in;height:0.83345in" />

6.  Pada direktori /.ssh terdapat file authorized_keys. Edit file tersebut menggunakan perintah “nano authorized_keys”. Masukkan isi dari file yang sudah kita copy tadi.

<img src="images/media/image9.png" style="width:6.26806in;height:3.12431in" />

7.  Test login ke server tanpa menggunakan password dengan cara masukkan perintah “ssh -i \<direktori-kunci/nama-kunci\> user@ip”. Di sini saya menggunakan perintah “ssh -i .ssh/kunci_dumbways <aditya@192.168.18.208>”.

<img src="images/media/image10.png" style="width:6.26806in;height:2.76458in" />

# Text Manipulation

## cat : Menampilkan isi file, menggabungkan isi file, overwrite isi file.

- Perintah “cat file1” ini akan membaca isi dari file1

- Perintah “cat \> file1” ini akan meng-overwrite isi dari sebuah file, namun jika file belum ada itu akan membuat file baru

<img src="images/media/image11.png" style="width:5.21948in;height:2.69829in" />

- Perintah “cat file1 file2 \> file3” ini akan menggabungkan isi dari file1 dan file2 ke dalam isi file3

<img src="images/media/image12.png" style="width:3.58383in;height:2.26073in" />

## sed : Editor stream untuk memfilter dan mentransformasi teks (find and replace).

- Perintah “sed -i ‘s/ini/berikut/g’ file1” ini akan mencari teks “ini” di dalam file1 dan mengubahnya menjadi teks “berikut”.

<img src="images/media/image13.png" style="width:4.17767in;height:1.88568in" />

- Perintah “sed ‘s/adalah/merupakan/g’ file3” ini akan mencari, mengubah dan menampilkan isi dari file3 tanpa mengubah isi asli dari file3

<img src="images/media/image14.png" style="width:4.33394in;height:2.06279in" />

## grep : Mencari pola dalam file. 

- Perintah “grep Ini file3” ini akan menunjukkan semua teks “ini” yang ada pada file3

<img src="images/media/image15.png" style="width:2.86498in;height:1.15641in" />

- Perintah “grep -c Ini file3” ini akan menunjukkan jumlah teks “ini” yang ada pada file3

<img src="images/media/image16.png" style="width:3.06293in;height:0.52091in" />

- Perintah “grep adalah \*” ini akan menunjukkan semua file yang mengandung teks “adalah”

<img src="images/media/image17.png" style="width:2.69829in;height:1.04181in" />

## echo : Memantulkan teks pesan ke user, menulis data ke dalam file

- Perintah “echo Hello World” ini akan menapilkan output teks “Hello World” itu sendiri

<img src="images/media/image18.png" style="width:3.12544in;height:0.85429in" />

- Perintah “echo Hello World \>\> file1” ini akan menambahkan/menuliskan teks “Hello World” ke dalam file1

<img src="images/media/image19.png" style="width:3.7922in;height:1.18767in" />

# Menyalakan UFW (Uncomplicated Firewall)

Kita akan menyalakan ufw dan memberikan akses untuk port 22, 80, 443, 3000, 5000 dan 6969. Langkah – langkah :

1.  Cek status UFW apakah sudah aktif / belum

<img src="images/media/image20.png" style="width:2.89624in;height:0.56258in" />

2.  Jika belum aktif, aktifkan terlebih dahulu

<img src="images/media/image21.png" style="width:4.13599in;height:0.59383in" />

3.  Berikan akses untuk semua port yang ingin diberikan akses ke server

<img src="images/media/image22.png" style="width:6.26806in;height:1.90278in" />

4.  Cek status ufw apakah semua port sudah diberikan akses

<img src="images/media/image23.png" style="width:4.36519in;height:3.26087in" />
