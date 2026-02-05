# Task :

1\. Penjelasan tentang git

2\. Buat sebuah repository bernama "devops26-dumbways-\<nama\>", lalu tambahkan 3 file yang berisi text

3\. Manage repository tugas kalian menggunakan terminal!

4\. Demokan cara untuk mencari perubahan text pada suatu file di GitHub!

# Apa itu Git?

Git adalah sebuah sistem yang membantu kamu melacak perubahan pada file atau kode yang kamu buat. Dengan Git, setiap kali kamu membuat perubahan penting, kamu bisa "menyimpan" versi baru dari kode yang kamu kerjakan. Ini seperti mengambil *snapshot* dari proyekmu pada saat itu.

# Membuat Repository & Menambahkan File ke Repo

1.  Buka https://github.com/login dan login dengan akun kita

2.  Setelah berhasil login buka menu / tab repository pada halaman Github

<img src="images/media/image1.png" style="width:6.26806in;height:2.75972in" />

3.  Untuk mebuat sebuah repository baru klik tombol New

<img src="images/media/image2.png" style="width:6.26806in;height:2.75972in" />

4.  Isi nama repository dan atur configurasi sesuai kebutuhan, jika sudah klik tombol Create repository

<img src="images/media/image3.png" style="width:6.26806in;height:2.90486in" />

5.  Tambahkan file baru ke repo, klik “creating a new file”

<img src="images/media/image4.png" style="width:6.26806in;height:3.06458in" />

6.  Isi nama file dan buat isi filenya, lalu klik tombol commit changes

<img src="images/media/image5.png" style="width:6.26806in;height:0.81181in" />

7.  Isikan commit message dan klik tombol commit changes

<img src="images/media/image6.png" style="width:5.08404in;height:4.80275in" />

8.  Tambahkan file sebanyak 3 file

<img src="images/media/image7.png" style="width:6.26806in;height:1.35486in" />

<img src="images/media/image8.png" style="width:6.26806in;height:2.63889in" />

# Manage Repository Melalui Terminal

Untuk dapat memanage repo melalui server terminal kita perlu mengatur configurasi github dan koneki SSH terlebih dahulu. Berikut langkah – langkahnya:

1.  Buka terminal dan ketik perintah “git config --global user.name seizenz7”, lalu Enter dan perintah “git config --global user.email <adityaiw4@gmail.com>" ”, Enter<img src="images/media/image9.png" style="width:6.11544in;height:1.50021in" />

2.  Setelah mengatur konfigurasi Git, ketik perintah “ssh-keygen -t rsa -b 4096”

<img src="images/media/image10.png" style="width:6.26806in;height:3.08542in" />

3.  Setelah ssh key tergenerate, masuk ke direktori hasil “cd /home/aditya/.ssh/”, kemudian cek isi direktorinya “ls -la”.

<img src="images/media/image11.png" style="width:5.31324in;height:1.72941in" />

4.  Buka isi file id_rsa_github_pub “cat id_rsa_github_pub”, lalu copy isinya<img src="images/media/image12.png" style="width:6.26806in;height:0.93056in" />

5.  Buka github.com, lalu masuk ke profile setting

<img src="images/media/image13.png" style="width:6.26806in;height:3.68958in" />

6.  Kemudian masuk ke menu ssh dan gpg keys

<img src="images/media/image14.png" style="width:6.26806in;height:3.82361in" />

7.  Klik tombol “New SSH Key”

<img src="images/media/image15.png" style="width:6.26806in;height:2.76944in" />

8.  Pastekan isi dari file id_rsa.pub yang sudah kita copy tadi kedalam Key, lalu klik tombol “Add SSH Key”

<img src="images/media/image16.png" style="width:6.26806in;height:2.82847in" />

<img src="images/media/image17.png" style="width:6.26806in;height:3.60694in" />

9.  Cek koneksi ssh ke Github dengan perintah “ssh -i .ssh/id_rsa_github git@github.com -T”

<img src="images/media/image18.png" style="width:6.26806in;height:0.33681in" />

10. Membuat direktori untuk dijadikan sebuah git/repo lokal dan masuk ke direktori tersebut

<img src="images/media/image19.png" style="width:4.53188in;height:1.35436in" />

11. Lakukan inisialisasi git dengan perintah “git init.”

<img src="images/media/image20.png" style="width:6.26806in;height:1.46736in" />

12. Setelah terinisialisasi, hubungkan repo lokal dengan repo asli yang sudah kita buat sebelumnya dengan perintah “git remote add origin \<link akses repo\>”

<img src="images/media/image21.png" style="width:6.26806in;height:0.13542in" />

13. Setelah terhubung lakukan git fetch untuk mendapatkan data terbaru dari repo asli dan git pull untuk mengupate data repo lokal sesuai dengan data repo asli terbaru

<img src="images/media/image22.png" style="width:5.98in;height:1.51063in" />

<img src="images/media/image23.png" style="width:5.84457in;height:2.28157in" />

# Mencari perubahan text pada file repo github

1.  Lakukan perubahan text pada file dan klik “commit changes”

<img src="images/media/image24.png" style="width:6.26806in;height:1.24722in" />

<img src="images/media/image25.png" style="width:5.09446in;height:5.56328in" />

2.  Masuk ke repo dan klik pada File1 yang telah diubah sebelumnya

<img src="images/media/image26.png" style="width:6.26806in;height:1.76597in" />

3.  Klik tombol History

<img src="images/media/image27.png" style="width:6.26806in;height:1.46528in" />

4.  Klik Update content of File1

<img src="images/media/image28.png" style="width:6.26806in;height:1.67986in" />

5.  Klik Load Diff untuk melihat perubahan text pada File1

<img src="images/media/image29.png" style="width:6.26806in;height:2.95486in" />

<img src="images/media/image30.png" style="width:6.26806in;height:1.21597in" />
