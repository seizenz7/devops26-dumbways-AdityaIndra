# Challenge :

1\. NodeJS + Python berjalan di background (tanpa kondisi attached di terminal)

\- artinya, teman-teman tetep bisa menggunakan terminal di window yang sama namun app tetap berjalan

2\. Golang bisa dibuka di browser kalian, menampilkan text "Jangan lupa sahur baby gurl rawr"

# Menjalankan Aplikasi di Background

Di sini saya menggunakan tmux untuk menjalankan aplikasi agar berjalan di background tanpa kondisi attached di terminal. Berikut langkah – Langkahnya.

1.  Buka terminal, masuk ke direktori aplikasi nodejs (wayshub)

<img src="images/media/image1.png" style="width:6.26806in;height:0.39097in" />

2.  Jalankan perintah tmux, buat session baru di tmux, gunakan perintah ‘ tmux new -s nodejs ‘

<img src="images/media/image2.png" style="width:4.59439in;height:0.2292in" />

3.  Setelah sesi tmux muncul, jalankan aplikasi nodejs dengan perintah ‘ npm start ‘  
    <img src="images/media/image3.png" style="width:6.26806in;height:5.89861in" />

4.  Keluar dari sesi tmux (detach) dengan cara tekan ‘ctrl+b’, lalu tekan ‘d’  
    <img src="images/media/image4.png" style="width:4.56314in;height:0.59383in" />

5.  Cek proses yang berjalan di background dengan perintah ‘ ps -a ‘  
    <img src="images/media/image5.png" style="width:3.61509in;height:1.79192in" />

6.  Masuk ke direktori aplikasi python

<img src="images/media/image6.png" style="width:2.7608in;height:0.80219in" />

7.  Jalankan perintah tmux, buat session baru untuk menjalankan aplikasi python ‘ tmux new -s python ‘

<img src="images/media/image7.png" style="width:3.78178in;height:0.17711in" />

8.  Jalankan aplikasi python dengan perintah ‘ python3 index.py ‘  
    <img src="images/media/image8.png" style="width:6.26806in;height:1.79306in" />

9.  Keluar dari sesi tmux (detach) dengan cara tekan ‘ctrl+b’, lalu tekan ‘d’  
    <img src="images/media/image9.png" style="width:3.81303in;height:0.58341in" />

10. Cek proses yang berjalan di background dengan perintah ‘ ps -a ‘  
    <img src="images/media/image10.png" style="width:3.06293in;height:2.09404in" />

# Golang

Langkah – langkah agar aplikasi Golang bisa dibuka di browser dan menapilkan text "Jangan lupa sahur baby gurl rawr"

1.  Buat script golang, gunakan fitur net/http sebagai berikut

<img src="images/media/image11.png" style="width:6.26806in;height:4.72708in" />

2.  Jalankan dengan perintah go main.go

<img src="images/media/image12.png" style="width:5.55286in;height:0.54174in" />

3.  Cek buka 192.168.18.208:6969 di web browser

<img src="images/media/image13.png" style="width:4.38603in;height:0.90638in" />
