-- 1. Membuat Tabel Users (Sintaks ENUM langsung digabung di dalam tabel)
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('user', 'admin') NOT NULL DEFAULT 'user',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert data ke tabel users
INSERT INTO users (username, password, role) VALUES 
('admin', 'password123', 'admin');


-- 2. Membuat Tabel Buku
CREATE TABLE buku (
    buku_id INT AUTO_INCREMENT PRIMARY KEY,
    judul VARCHAR(255) UNIQUE NOT NULL,
    pengarang VARCHAR(255) NOT NULL,
    penerbit VARCHAR(255) NOT NULL,
    tahun_terbit INT NOT NULL, 
    kategori VARCHAR(255) NOT NULL, 
    jumlah INT
);

-- Insert data ke tabel buku
INSERT INTO buku (judul, pengarang, penerbit, tahun_terbit, kategori, jumlah) VALUES
('Laskar Pelangi', 'Andrea Hirata', 'Bentang Pustaka', 2005, 'Fiksi', 10),
('Demon Slayer', 'Koyoharu Gotouge', 'Shueisha', 2016, 'Komik', 12),
('Sejarah Indonesia Modern', 'M.C. Ricklefs', 'Gadjah Mada Univ', 2001, 'Sejarah', 7),
('VALORANT: Official Guide', 'Aditya Wijaya Putra', 'Riot Games', 2020, 'Game', 9),
('Pengantar Teknik Informatika', 'Rosa A. & Shalahuddin', 'Andi Publisher', 2018, 'Teknologi/Informatika', 6);


-- 3. Membuat Tabel Peminjaman (Menyesuaikan urutan & fungsi tanggal MySQL)
CREATE TABLE peminjaman (
    peminjaman_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    buku_id INT NOT NULL,
    tanggal_pinjam DATE NOT NULL DEFAULT (CURRENT_DATE),
    tanggal_kembali DATE,
    status VARCHAR(50) DEFAULT 'Dipinjam',
 
    CONSTRAINT fk_user_id 
        FOREIGN KEY (user_id) 
        REFERENCES users(user_id) 
        ON DELETE CASCADE,
 
    CONSTRAINT fk_buku_id 
        FOREIGN KEY (buku_id) 
        REFERENCES buku(buku_id) 
        ON DELETE CASCADE
);

-- Menampilkan isi data tabel
SELECT * FROM buku;
SELECT * FROM users;