# Task :

NodeJS

\- Deploy app wayshub-frontend

\- Berjalan di port 3000

\- Menggunakan NodeJS 10 & 12

\`\`\`https://github.com/dumbwaysdev/wayshub-frontend\`\`\`

Python

\- Deploy app menampilkan text nama kalian!

\- Berjalan di port 5000 & bisa dibuka melalui web

Golang

\- Deploy app menampilkan text "Golang geming!"

Note : Semua app WAJIB bisa diakses dengan \*\*UFW enabled\*\* (firewall menyala abangkuh 🔥🔥🔥)

# NodeJs

Langkah – langkah deploy :

1.  Install nodejs menggunakan nvm menggunakan perintah berikut.

\# Download and install nvm:

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh \| bash

\# Restart shell

Exec bash

\# Download and install Node.js:

nvm install 12

\# Verify the Node.js version:

node -v

\# Verify npm version:

npm -v

<img src="images/media/image1.png" style="width:6.26806in;height:3.23819in" />

2.  Clone github repo <https://github.com/dumbwaysdev/wayshub-frontend> dengan perintah “ git clone <git@github.com:dumbwaysdev/wayshub-frontend.git> “

3.  Masuk ke direktori wayshub-frontend dan lakukan inisialisasi dengan perintah “npm i”

<img src="images/media/image2.png" style="width:6.26806in;height:2.68056in" /> <img src="images/media/image3.png" style="width:6.08418in;height:0.62509in" />

4.  Cek isi dalam direktori apakah sudah ada folder node_module

<img src="images/media/image4.png" style="width:5.71955in;height:3.00042in" />

5.  Cek port 3000 pada UFW status apakah sudah Allow

<img src="images/media/image5.png" style="width:4.46937in;height:4.64648in" />

6.  Jika sudah, lakukan perintah npm start untuk menjalankan app nodejs

<img src="images/media/image6.png" style="width:4.41728in;height:0.89596in" />

7.  Cek buka http://192.168.18.208/3000 pada web browser

<img src="images/media/image7.png" style="width:6.26806in;height:3.16528in" />

# Python

Langkah – langkah deploy :

1.  Cek apakah python sudah terinstall di server

<img src="images/media/image8.png" style="width:3.19836in;height:0.60425in" />

Jika belum, lakukan perintah “ sudo apt install python3 “ untuk installasi

2.  Cek apakah pip (package manager python) sudah terinstall di server

<img src="images/media/image9.png" style="width:5.50077in;height:0.62509in" />

Jika belum, lakukan perintah “ sudo apt install python3-pip “ untuk installasi

3.  Install framework flask menggunakan perintah “ pip install flask “

<img src="images/media/image10.png" style="width:6.26806in;height:2.12639in" />

4.  Buat file.py / script aplikasi python yang menampilkan text nama pada web, gunakan perintah “ nano index.py “

<img src="images/media/image11.png" style="width:6.26806in;height:1.55764in" />

5.  Cek port 5000 pada UFW apakah sudah Allow

<img src="images/media/image12.png" style="width:4.49021in;height:0.73969in" />

6.  Jika sudah, jalankan aplikasi python menggunakan perintah “ python3 index.py “

<img src="images/media/image13.png" style="width:6.26806in;height:1.60972in" />

7.  Cek buka <http://192.168.18.208:5000> pada web browser

<img src="images/media/image14.png" style="width:4.1985in;height:1.72941in" />

# Golang

Langkah – langkah deploy :

1.  Download file installasi golang pada server

<img src="images/media/image15.png" style="width:6.26806in;height:2.975in" />

2.  Masuk sebagai admin dengan sudo su, lalu install menggunakan perintah “ rm -rf /usr/local/go && tar -C /usr/local -xzf go1.24.12.linux-amd64.tar.gz “, kemudian export path “ export PATH=\$PATH:/usr/local/go/bin “

3.  Cek versi golang

<img src="images/media/image16.png" style="width:2.84415in;height:0.66676in" />

4.  Buat file.go / script aplikasi golang yang menampilkan text "Golang geming!". Gunakan perintah “ nano main.go “

<img src="images/media/image17.png" style="width:6.26806in;height:4.76806in" />

5.  Jalankan aplikasi dengan perintah “ go run main.go “

<img src="images/media/image18.png" style="width:5.4591in;height:0.56258in" />

6.  Cek buka <http://192.168.18.208:6969> pada web browser

<img src="images/media/image19.png" style="width:4.37561in;height:1.02098in" />
