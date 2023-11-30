JAWABAN:

-- Nama    : Dendra Hilal Ma'ruf
-- NIM     :22512011

-- 1.  Pertama, buat tabel products:
    => CREATE TABLE products (
    id VARCHAR(10) NOT NULL PRIMARY KEY,
    nama_barang VARCHAR(100) NOT NULL,
    kategori_barang ENUM(
        'Handphone',
        'Laptop',
        'Alat Elektronik'
    ),
    harga_barang INT(10),
    jumlah_barang INT(10)
);
    -- Kedua, describe struktur tabel
    => DESCRIBE products;

-- 2. Perintah untuk menambah value
    INSERT INTO products
        (id, nama_barang, kategori_barang, harga_barang, jumlah_barang)
    VALUES
        ('P004', 'Laptop ASUS', 'Laptop', 12000000, 50);

-- 3.  Pertama, dapatkan harga rata-rata:
    => SELECT AVG
	(harga_barang) as rata2_harga
    FROM
	products;

    -- Kedua, dapatkan harga yang nilainya di atas rata-rata:
    => SELECT * FROM
	products
    WHERE
	harga_barang > 6462500;

-- 4.  Mengubah jumlah_barang id 'P003' ke 75
    => UPDATE
	products
    SET
	jumlah_barang = 75
    WHERE
	id = 'P003';

-- 5.  Menghitung jumlah produk terjual di setiap kategori:
    -- Pertama, tambahkan column barang_terjual:
    => ALTER TABLE
	products
    ADD COLUMN
	barang_terjual INT(10)
    AFTER
	diskon;
    -- Kedua, isi data colum barang_terjual:
    => UPDATE
	products
    SET
	barang_terjual = 10
    WHERE
	id = 'P004';
    -- Ketiga, jumlahkan produk setiap kategori yang terjual:
    => SELECT SUM(barang_terjual)
    FROM
	products
    WHERE
	kategori_barang = 'Laptop';

-- 6.  Tampilkan produk dengan harga < 15000000 dan jumlah > 20:
    => SELECT * FROM
	products
    WHERE
	jumlah_barang > 20 AND harga_barang < 15000000;

-- 7.  Mengurut produk dari termurah ke termahal:
    => SELECT * FROM
	products
    ORDER BY
	harga_barang ASC;

-- 8.  Jelaskan apa yang terjadi dari dijalankan perintah berikut:
    => DELETE FROM
	products
    WHERE
	jumlah_barang < 10;
    -- => Hal yang akan terjadi adalah data dengan value jumlah_barang kurang dari 10 akan terhapus

-- 9.  Hitung total nilai jumlah (harga * jumlah):
    => SELECT SUM(harga_barang*jumlah_barang) as nilai FROM products;

-- 10. Tambah kolom baru 'diskon' dengan tipe data DECIMAL(5.2):
    => ALTER TABLE
	products
    ADD COLUMN
	diskon DECIMAL(5.2)
    AFTER
	jumlah_barang;