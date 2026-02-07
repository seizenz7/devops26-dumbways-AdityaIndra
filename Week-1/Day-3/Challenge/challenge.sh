#!/bin/bash
# Baris ini dikenal sebagai "shebang". Ini memberi tahu sistem operasi bahwa script ini harus dieksekusi menggunakan interpreter Bash.

# Ini adalah script untuk mengeksekusi perintah untuk no 3 & 4 pada task challenge
# Script ini dirancang untuk mengotomatiskan dua jenis tugas:
# 1. Mengelola aturan firewall UFW (Uncomplicated Firewall) untuk port tertentu.
# 2. Menjalankan serangkaian perintah manipulasi file dan teks.

# --- Variabel Global untuk Mengontrol Alur Eksekusi ---

# Flag boolean untuk menentukan apakah perintah UFW harus dijalankan.
# Defaultnya adalah 'false' (tidak dijalankan) kecuali opsi -a atau -d diberikan.
RUN_UFW=false
# Flag boolean untuk menentukan apakah perintah manipulasi teks harus dijalankan.
# Defaultnya adalah 'false' (tidak dijalankan) kecuali opsi -t diberikan.
RUN_TEXT=false

# --- Fungsi untuk Menampilkan Bantuan (Usage) ---

# Fungsi ini menampilkan cara penggunaan script dan opsi-opsi yang tersedia.
usage() {
  echo "Penggunaan: $0 [-a | -d] [-p \"port1 port2...\"] [-t] [-h]"
  echo ""
  echo "  Opsi UFW:"
  echo "    -a : Atur tindakan UFW ke 'allow'. Ini akan mengizinkan akses ke port yang ditentukan."
  echo "    -d : Atur tindakan UFW ke 'deny'. Ini akan memblokir akses ke port yang ditentukan."
  echo "    -p \"<port1 port2...>\" : Tentukan daftar port yang akan dikelola oleh UFW, dipisahkan oleh spasi."
  echo "                  Contoh: -p \"80 443 22\""
  echo "                  Default port: $DEFAULT_PORTS (akan ditampilkan nilainya nanti)"
  echo ""
  echo "  Opsi Perintah Tambahan:"
  echo "    -t : Jalankan serangkaian perintah manipulasi file/teks yang telah didefinisikan dalam fungsi execute_text."
  echo ""
  echo "  Opsi Lain:"
  echo "    -h : Tampilkan bantuan ini (fungsi usage)"
  exit 1 # Keluar dari script dengan kode status 1 (menandakan error atau non-sukses).
}

# --- Fungsi untuk Mengeksekusi Perintah Manipulasi File/Teks ---

# Fungsi ini berisi serangkaian perintah Bash untuk memanipulasi file dan teks.
execute_text() {
echo "---------------------------------------------------"
echo "Menjalankan perintah manipulasi file/teks..."
echo "---------------------------------------------------"
ls -la # Menampilkan daftar file dan direktori di lokasi saat ini secara detail.
echo "------------- Manipulasi menggunakan echo & cat  -----------------"
cat file1 # Menampilkan isi dari 'file1'. Asumsi 'file1' sudah ada.
echo "Ini adalah isi dari file1 setelah di overwrite dengan perintah echo & cat" | cat > file1
cat file1
# Perintah ini akan:
# 1. Mencetak string "Ini adalah isi dari file1 setelah di overwrite dengan perintah cat".
# 2. Output dari `echo` kemudian di-pipe (|) ke perintah `cat`.
# 3. Output dari `cat` tersebut kemudian diarahkan ulang (>) untuk menimpa seluruh isi 'file1'.
#    Jadi, 'file1' akan berisi string yang baru saja dicetak.
echo "------------ Menggabungkan isi file1 & file2 ke file3 ---------------"
echo "------------ Menampilkan file1 & file2 ---------------"
cat file1 # Menampilkan kembali isi 'file1' setelah ditimpa.
cat file2 # Menampilkan isi dari 'file2'. Asumsi 'file2' sudah ada.
cat file1 file2 > file3
# Menggabungkan isi 'file1' dan 'file2' secara berurutan,
# lalu menuliskan hasilnya ke 'file3'. Jika 'file3' sudah ada, isinya akan ditimpa.
echo "------------ Menampilkan hasil (isi file3) ---------------"
cat file3
echo "---------------- Manipulasi menggunakan sed -----------------"
echo "--- Menggunakan 'sed' untuk mencari semua kemunculan string 'setelah' dalam 'file1' dan menggantinya dengan 'sebelum' ---"
cat file1
sed -i 's/setelah/sebelum/g' file1
# Menggunakan `sed` (stream editor) untuk mencari semua kemunculan string "setelah" dalam 'file1'
# dan menggantinya dengan "sebelum".
# Opsi `-i` (in-place) berarti perubahan akan disimpan langsung ke 'file1'.
# 'g' setelah 's/' berarti ganti semua kemunculan dalam satu baris (global).
cat file1 # Menampilkan kembali isi 'file1' setelah perubahan `sed`.
echo "--- Menggunakan 'sed' untuk mengganti semua kemunculan 'adalah' dengan 'merupakan' di 'file3' ---"
echo "--- Tanpa merubah isi asli dari file 3 ---"
cat file3 # Menampilkan isi file3
sed 's/adalah/merupakan/g' file3
# Menggunakan `sed` untuk mengganti semua kemunculan "adalah" dengan "merupakan" di 'file3'.
# Karena tidak ada opsi `-i`, perubahan ini hanya akan ditampilkan ke standar output (konsol)
# dan tidak akan disimpan ke 'file3'.
cat file3 # Menampilkan isi asli 'file3' (tanpa perubahan dari `sed` sebelumnya).
echo "------------------- Manipulasi menggunakan grep --------------------"
grep Ini file3 # Mencari baris yang mengandung kata "Ini" dalam 'file3' dan menampilkannya.
grep -c Ini file3 # Mencari kata "Ini" dalam 'file3' dan menampilkan hitungan (count) berapa kali kata itu ditemukan.
grep adalah * --exclude=*.sh
# Mencari baris yang mengandung kata "adalah" di semua file (*) dalam direktori saat ini,
# KECUALI semua file '.sh'.
}

# --- Definisi Nilai Default ---

# Default action UFW jika tidak ditentukan oleh user.
UFW_ACTION="allow"
# Port default yang akan dikelola UFW jika opsi -p tidak diberikan.
# Disimpan sebagai string dengan port dipisahkan oleh spasi.
DEFAULT_PORTS="22 80 443 3000 5000 6969"
# Variabel yang akan menyimpan daftar port yang akan digunakan.
# Diinisialisasi dengan nilai default, tetapi bisa di-override oleh opsi -p.
PORTS="$DEFAULT_PORTS"

# --- Parsing Opsi Baris Perintah Menggunakan getopts ---

# `while getopts ":adp:th" opt; do ... done` adalah loop standar untuk memparsing opsi baris perintah.
# ":adp:th" adalah string opsi.
#   - Titik dua di awal (:) berarti getopts akan beroperasi dalam "silent error reporting mode".
#     Ini berarti getopts tidak akan mencetak pesan kesalahan secara otomatis.
#   - Huruf-huruf ('a', 'd', 't', 'h') adalah opsi tanpa argumen.
#   - Huruf dengan titik dua ('p:') adalah opsi yang memerlukan argumen (misalnya, -p "80 443").
#   - Variabel `opt` akan berisi opsi yang ditemukan.
#   - Variabel `OPTARG` akan berisi argumen dari opsi (jika opsi memerlukan argumen).
#   - Variabel `OPTIND` adalah indeks argumen berikutnya yang akan diproses.
while getopts ":adp:th" opt; do
  case $opt in # Struktur `case` digunakan untuk menangani setiap opsi yang ditemukan.
    a) # Jika opsi '-a' diberikan:
      UFW_ACTION="allow" # Set tindakan UFW menjadi 'allow'.
      RUN_UFW=true       # Aktifkan flag untuk menjalankan perintah UFW.
      ;; # Akhir dari case 'a'.
    d) # Jika opsi '-d' diberikan:
      UFW_ACTION="deny"  # Set tindakan UFW menjadi 'deny'.
      RUN_UFW=true       # Aktifkan flag untuk menjalankan perintah UFW.
      ;; # Akhir dari case 'd'.
    p) # Jika opsi '-p' diberikan (memerlukan argumen):
      PORTS="$OPTARG"    # Ambil argumen setelah -p dan simpan ke variabel PORTS.
      ;; # Akhir dari case 'p'.
    t) # Jika opsi '-t' diberikan:
      RUN_TEXT=true      # Aktifkan flag untuk menjalankan perintah manipulasi teks.
      ;; # Akhir dari case 't'.
    h) # Jika opsi '-h' diberikan:
      usage              # Panggil fungsi bantuan (usage) dan script akan keluar.
      ;; # Akhir dari case 'h'.
    \?) # Jika opsi tidak valid (misalnya, -x):
      echo "Error: Opsi tidak valid: -$OPTARG" >&2 # Cetak pesan error ke stderr.
      usage              # Tampilkan bantuan dan keluar.
      ;; # Akhir dari case '\?'.
    :) # Jika opsi memerlukan argumen tetapi tidak diberikan (misalnya, -p tanpa port):
      echo "Error: Opsi -$OPTARG memerlukan argumen." >&2 # Cetak pesan error ke stderr.
      usage              # Tampilkan bantuan dan keluar.
      ;; # Akhir dari case ':'.
  esac
done

# Menghapus opsi yang sudah diproses dari argumen positional ($1, $2, dll.).
# `OPTIND` adalah indeks argumen berikutnya yang belum diproses oleh getopts.
# `shift $((OPTIND - 1))` akan memindahkan argumen-argumen (options) yang telah diproses
# sehingga variabel posisi ($1, $2, dst.) hanya berisi argumen non-opsi yang tersisa.
shift $((OPTIND - 1))

# Baris `shift $((OPTIND - 1))` ini adalah duplikasi dan tidak diperlukan.
# Cukup satu kali setelah loop `while getopts`. Baris kedua ini bisa dihapus.
# shift $((OPTIND - 1))

# --- Logika Eksekusi Default ---

# Blok ini akan dijalankan jika TIDAK ADA opsi -a, -d, atau -t yang diberikan oleh user.
# Ini berfungsi sebagai perilaku default script jika dijalankan tanpa argumen spesifik.
if ! $RUN_UFW && ! $RUN_TEXT; then
  # Jika tidak ada flag UFW yang diatur DAN tidak ada flag teks yang diatur:
  RUN_TEXT=true    # Secara default, aktifkan flag untuk menjalankan perintah manipulasi teks.
  RUN_UFW=true     # Secara default, aktifkan flag untuk menjalankan perintah UFW.
  UFW_ACTION="allow" # Set tindakan UFW default ke 'allow'.
fi
# `fi` adalah penutup dari pernyataan `if`.

# --- Fungsi untuk Mengeksekusi Perintah UFW ---

# Fungsi ini mengelola aturan UFW berdasarkan UFW_ACTION dan daftar PORTS.
execute_ufw() {
  echo "---------------------------------------------------"
  echo "Menjalankan perintah UFW..."
  echo "---------------------------------------------------"
  # Loop melalui setiap port dalam variabel PORTS (yang dipisahkan spasi).
  for port in $PORTS; do
    # Jalankan perintah `sudo ufw <ACTION> <PORT>`.
    # `sudo` diperlukan karena UFW memerlukan hak akses root.
    sudo ufw "$UFW_ACTION" "$port"
  done
}

# --- Eksekusi Akhir Berdasarkan Flag ---

# Eksekusi perintah manipulasi file/teks jika flag RUN_TEXT disetel ke 'true'.
if $RUN_TEXT; then
  execute_text # Panggil fungsi execute_text.
fi
# `fi` adalah penutup dari pernyataan `if`.

# Eksekusi perintah UFW jika flag RUN_UFW disetel ke 'true'.
if $RUN_UFW; then
  execute_ufw # Panggil fungsi execute_ufw.
fi
# `fi` adalah penutup dari pernyataan `if`.

echo "Script selesai dijalankan!" # Pesan akhir yang menunjukkan script telah selesai.
