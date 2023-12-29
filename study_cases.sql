-- Study Case 1 : Query Sederhana
CREATE TABLE daily.dana (
    id_nasabah INT PRIMARY KEY,
    nama_nasabah VARCHAR(100),
    id_cabang INT,
    region VARCHAR(100),
    volume_tabungan INT
);



INSERT INTO daily.dana (id_nasabah, nama_nasabah, id_cabang, region, volume_tabungan)
VALUES
(1, 'Nasabah A', 101, 'Jakarta', 5000),
(2, 'Nasabah B', 102, 'Surabaya', 8000),
(3, 'Nasabah C', 103, 'Medan', 3000),
(4, 'Nasabah D', 101, 'Jakarta', 6000),
(5, 'Nasabah E', 102, 'Surabaya', 7000),
(6, 'Nasabah F', 103, 'Medan', 4500),
(7, 'Nasabah G', 101, 'Jakarta', 5500),
(8, 'Nasabah H', 102, 'Surabaya', 9000),
(9, 'Nasabah I', 103, 'Medan', 3500),
(10, 'Nasabah J', 101, 'Jakarta', 7000);



SELECT id_nasabah, nama_nasabah, id_cabang, region, volume_tabungan
FROM daily.dana;



SELECT
id_cabang,
COUNT(DISTINCT id_nasabah) AS jumlah_nasabah,
SUM(volume_tabungan) AS volume_tabungan
FROM
daily.dana d 
WHERE
region = 'Medan'
GROUP BY
id_cabang;


-----------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------

-- Case Study 2 Join Table
-- Ini bisa dilakukan dengan import file csv, namun dikarenakan data tidak disediakan data dan kesulitan convert jpg to excel
-- maka dilakukan query dari awal, ini dikarenakan data tidak terlalu besar, dan masih aman dilakukan query dari mulai 
-- pembuatan tabel hingga menyelesaikan kriteria tertentu dari study case yang kedua.


-- Membuat tabel atm_transaksi dalam schema daily2
CREATE TABLE daily2.atm_transaksi (
    id_transaksi INT PRIMARY KEY,
    id_nasabah INT,
    jenis_transaksi VARCHAR(50),
    jumlah_transaksi INT,
    tanggal_transaksi DATE,
    nomer_rekening VARCHAR(50)
);


-- Mengubah tipe data kolom nomer_rekening menjadi INT
ALTER TABLE daily2.atm_transaksi
ALTER COLUMN nomer_rekening TYPE INT
USING nomer_rekening::integer;


-- Memasukkan data ke dalam tabel atm_transaksi
INSERT INTO daily2.atm_transaksi (id_transaksi, id_nasabah, jenis_transaksi, jumlah_transaksi, tanggal_transaksi, nomer_rekening)
VALUES
(101, 1, 'Penarikan', 500000, '2023-01-01 08:15:00', '1001'),
(102, 2, 'Transfer', 200000, '2023-01-02 10:30:00', '1002'),
(103, 3, 'Setoran', 1000000, '2023-01-02 15:45:00', '1003');



-- Membuat tabel nasabah dalam schema daily2
CREATE TABLE daily2.nasabah (
    nomer_rekening INT,
    id_nasabah INT PRIMARY KEY,
    nama_nasabah VARCHAR(255),
    alamat VARCHAR(255),
    jenis_tabungan VARCHAR(50),
    FOREIGN KEY (nomer_rekening) REFERENCES daily2.atm_transaksi(nomer_rekening)
);

-- Menambahkan constraint unik pada kolom nomer_rekening di tabel atm_transaksi
ALTER TABLE daily2.atm_transaksi
ADD CONSTRAINT unique_nomer_rekening UNIQUE (nomer_rekening);


-- Memasukkan data ke dalam tabel nasabah
INSERT INTO daily2.nasabah (nomer_rekening, id_nasabah, nama_nasabah, alamat, jenis_tabungan)
VALUES
('1001', 1, 'John Doe', 'Jl. Merdeka No. 123', 'Tabungan Biasa'),
('1002', 2, 'Jane Smith', 'Jl. Pahlawan No. 456', 'Tabungan Bisnis'),
('1003', 3, 'Ahmad Abdullah', 'Jl. Damai No. 789', 'Tabungan Investasi');



-- Menjawab soal
SELECT
    N.jenis_tabungan AS Jenis_Tabungan,
    AT.jenis_transaksi AS Jenis_Transaksi,
    COUNT(DISTINCT N.id_nasabah) AS Jumlah_Nasabah,
    COUNT(AT.id_transaksi) AS Frekuensi_Transaksi,
    AVG(AT.jumlah_transaksi * 1.0) AS Rata_Rata_Jumlah_Transaksi
FROM
    daily2.nasabah N
JOIN
    daily2.atm_transaksi AT ON N.nomer_rekening = AT.nomer_rekening
GROUP BY
    N.jenis_tabungan, AT.jenis_transaksi
HAVING
    AVG(AT.jumlah_transaksi * 1.0) > 500000;


-----------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
   
-- Case Study 3 Statistika
-- Membuat tabel dalam schema daily3
CREATE TABLE daily3.transaksi (
    ID_Transaksi INT PRIMARY KEY,
    ID_Nasabah INT,
    Jenis_Transaksi VARCHAR(50),
    Jumlah_Transaksi INT,
    Tanggal_Transaksi DATE
);

-- Menyisipkan data ke dalam tabel
INSERT INTO daily3.transaksi (ID_Transaksi, ID_Nasabah, Jenis_Transaksi, Jumlah_Transaksi, Tanggal_Transaksi)
VALUES
    (1, 101, 'Pembayaran', 5000000, '2023-01-05'),
    (2, 102, 'Tagihan', 2000000, '2023-01-10'),
    (3, 103, 'Transfer', 1000000, '2023-02-15'),
    (4, 101, 'Pembayaran', 3000000, '2023-03-20'),
    (5, 104, 'Tarik Tunai', 1500000, '2023-04-25');
   
SELECT id_transaksi, id_nasabah, jenis_transaksi, jumlah_transaksi, tanggal_transaksi
FROM daily3.transaksi;

-- Jawaban soal
-- Analisa Sentralitas: Hitung total, rata-rata, median, dan modus dari Jumlah_Transaksi
-- Total
SELECT SUM(Jumlah_Transaksi) AS Total_Transaksi
FROM daily3.transaksi;

-- Rata-rata
SELECT AVG(Jumlah_Transaksi) AS Rata_Rata_Transaksi
FROM daily3.transaksi;

-- Median
SELECT
  Jumlah_Transaksi
FROM (
  SELECT
    Jumlah_Transaksi,
    ROW_NUMBER() OVER (ORDER BY Jumlah_Transaksi) AS RowAsc,
    ROW_NUMBER() OVER (ORDER BY Jumlah_Transaksi DESC) AS RowDesc
  FROM daily3.transaksi
) AS t
WHERE RowAsc = RowDesc OR RowAsc + 1 = RowDesc OR RowAsc = RowDesc + 1
ORDER BY Jumlah_Transaksi
LIMIT 1;

-- Modus
SELECT
  Jumlah_Transaksi,
  COUNT(*) AS Frekuensi
FROM daily3.transaksi
GROUP BY Jumlah_Transaksi
ORDER BY Frekuensi DESC
LIMIT 3;

-- Hitung Frekuensi transaksi per hari/bulan berdasarkan Tanggal_Transaksi
-- 1. Frekuensi transaksi per hari
SELECT
  Tanggal_Transaksi,
  COUNT(*) AS Frekuensi_Transaksi_Harian
FROM daily3.transaksi
GROUP BY Tanggal_Transaksi
ORDER BY Tanggal_Transaksi;


-- 2. Frekuensi transaksi per bulan
SELECT
  EXTRACT(MONTH FROM Tanggal_Transaksi) AS Bulan,
  COUNT(*) AS Frekuensi_Transaksi_Bulanan
FROM daily3.transaksi
GROUP BY Bulan
ORDER BY Bulan;


-- Hitung frekuensi masing-masing Jenis_Transaksi.
-- Frekuensi masing-masing Jenis_Transaksi
SELECT
  Jenis_Transaksi,
  COUNT(*) AS Frekuensi_Jenis_Transaksi
FROM daily3.transaksi
GROUP BY Jenis_Transaksi
ORDER BY Frekuensi_Jenis_Transaksi DESC;


-- Rata-rata transaksi per nasabah berdasarkan ID_Nasabah.
-- Rata-rata transaksi per nasabah
SELECT
  ID_Nasabah,
  AVG(Jumlah_Transaksi) AS Rata_Rata_Transaksi_Nasabah
FROM daily3.transaksi
GROUP BY ID_Nasabah
ORDER BY Rata_Rata_Transaksi_Nasabah DESC;


----------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
-- REAL STUDY CASE
SELECT age, ed, employ, address, income, debtinc, creddebt, othdebt, "default"
FROM real_study_case.bankloans;


 -- Query untuk mendapatkan hasil berdasarkan kriteria dan diurutkan dari yang terkecil
 SELECT
  age,
  ed,
  employ,
  address,
  income,
  debtinc,
  creddebt,
  othdebt,
  "default"
FROM
  real_study_case.bankloans
WHERE
  debtinc < 43
  AND POWER(creddebt, -1) < 0.3
ORDER BY
  debtinc;



 