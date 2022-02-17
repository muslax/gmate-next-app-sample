-- 
-- Meta
-- 
DROP TABLE IF EXISTS meta;
CREATE TABLE meta (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    versi               TEXT NOT NULL UNIQUE,
    deskripsi           TEXT,
    kondisi             INTEGER,        -- jumlah kondisi
    soal                INTEGER,        -- jumlah soal
    leader              TEXT,           -- "S02 S05 S19 S20 S21"
    kunci               TEXT,           -- "p1"
    s1                  INTEGER,        -- jumlah kondisi dengan soal tunggal
    s2                  INTEGER,        -- jumlah kondisi dengan soal 2
    s3                  INTEGER,        -- jumlah kondisi dengan soal 3
    s4                  INTEGER,        -- jumlah kondisi dengan soal 4
    s5                  INTEGER,        -- jumlah kondisi dengan soal 5
    waktu               INTEGER,
    reviewer            TEXT,
    tanggalReview       TEXT
);

-- Meta
INSERT INTO meta (versi, deskripsi, kondisi, soal, leader, kunci, waktu, reviewer, tanggalReview) VALUES (
    "MATE20220211",
    "[Belum ada deskripsi]",
    26,
    45,
    "K02 K05 K19 K20 K21",
    "a",
    45,
    "ARS, OOH, HAR, GAP, DFL, ANP, YUH, HYA, SYA",
    "2022-02-11"
);

-- 
-- Kondisi
-- 
DROP TABLE IF EXISTS kondisi;
CREATE TABLE kondisi (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    versi       TEXT REFERENCES meta(versi),
    seq         TEXT,                   -- CHECK (sekuen > 0 sekuen < 27),
    item        INTEGER DEFAULT 1,      -- jumlah item soal
    konten TEXT NOT NULL,
    UNIQUE (versi, seq)
);

-- Data Kondisi
INSERT INTO kondisi VALUES
(1, "MATE20220211", "K01", 3, '<p>Divisi Anda telah menunjukkan prestasi terbaik pada tahun ini, dan perusahaan memberikan insentif berupa paket liburan ke sejumlah tujuan wisata dalam dan luar negeri. Biasanya, dalam menentukan siapa yang berhak berwisata di dalam kota, ke luar kota atau yang berhak ke luar negeri, tolok ukur utamanya adalah hierarki jabatan dan masa kerja. Namun Anda berpandangan bahwa prestasi kerja (nilai kinerja) merupakan kriteria utama, diikuti dengan yang kedua: hierarki jabatan, lalu gaji dan yang terakhir masa kerja. Untuk membantu Anda mengambil keputusan, Anda telah menentukan bahwa prestasi dua kali lebih penting daripada gaji, dan masa kerja hanya setengah pentingnya dari gaji. Jawablah pertanyaan-pertanyaan berikut berdasarkan informasi di bawah ini.</p> <figure><img src="" title="Tabel dan Grafik Hierarki Jabatan"/></figure>'),
(2, "MATE20220211", "K02", 1, '<figure><img src="" title="Keuntungan dari 5 Perusahaan Sejenis"/></figure>'),
(3, "MATE20220211", "K03", 1, '<p>Gosip beredar bahwa sistem promosi karyawan yang terjadi di perusahaan Anda lebih banyak ditentukan secara subjektif. Tetapi, Anda tidak menghiraukan gosip itu dan tetap percaya bahwa aturan perusahaan yang menyatakan prestasi kerja merupakan tolok ukur utama masih berlaku, sehingga seorang karyawan yang berprestasi tetap akan mendapat prioritas untuk dipromosikan tanpa mengandalkan nasib baik.</p> <p>Karena banyaknya keluhan yang diajukan bawahan, Anda perlu mengkaji ulang proses promosi. Departemen HRD memberi Anda daftar yang bersifat rahasia yang digunakan oleh pihak manajemen (tim penilai) dalam menentukan promosi, meskipun tabel/kolom yang berisi komentar pribadi para penilai tidak diikutsertakan.</p> <figure><img src="" title="Tabel Kriteria Promosi"/></figure>'),
(4, "MATE20220211", "K04", 3, '<p>Berdasarkan penelitian terhadap beragam sepatu sport untuk anak muda yang telah dilakukan oleh lembaga independen, Anda sebagai Manager Marketing dari sebuah perusahaan distributor peralatan olah raga, diminta untuk mengidentifikasi beragam peluang pemasaran untuk masing-masing produk sepatu tersebut. Adapun hasil penelitiannya adalah sebagai berikut:</p> <figure><img src="" title="Tabel Rating Per Merek Sepatu"/></figure>'),
(5, "MATE20220211", "K05", 2, '<h3>Proses Tender PT Tipsani Indonusa</h3> <ul> <li>Nilai Tender kurang dari Rp. 25.000.000,- disetujui oleh Manajer Pembelian atau Kepala Divisi Terkait</li> <li>Nilai Tender antara Rp. 25.000.000,-  s/d Rp. 100.000.000,-  disetujui oleh Kepala Divisi Terkait dan Kepala Divisi Pengadaan</li> <li>Nilai Tender lebih dari Rp. 100.000.000,- s/d Rp. 500.000.000,- disetujui oleh Kepala Divisi Pengadaan atau Direktur Operasional; Direktur Utama juga harus menyetujui.</li> </ul>'),
(6, "MATE20220211", "K06", 2, '<h3>Ringkasan Hasil Evaluasi Karyawan</h3> <p><strong>AMIR</strong> Memiliki kemampuan analisa dan sintesa yang baik meskipun kemampuannya dalam mengorganisir pekerjaan menjadi titik lemahnya. Ia mampu menuangkan hasil analisanya dalam bentuk presentasi lisan maupun tulisan secara baik, namun kurang bisa membangun hubungan kerja sama dengan tim, termasuk dalam memimpin. Ia mampu bekerja baik di bawah tekanan  sama halnya dengan dorongan untuk memberikan prestasi yang terbaik; namun dalam kesehariannya, ia belum bisa menunjukkan prestasi kerja yang baik</p> <p><strong>BERTA</strong> Memiliki kemampuan yang baik dalam mengorganisir pekerjaan dengan didukung kemampuan analisa yang mendalam, namun punya kesulitan dalam menyampaikan pikiran dan gagasan secara verbal. Walaupun kooperatif bila bekerja dengan orang lain, ia menunjukkan sikap dingin dan menjaga jarak saat berperan sebagai pemimpin. Dalam kesehariannya, prestasi kerja yang ditunjukkannya tergolong normatif. </p> <p><strong>CARLO</strong> Ia memiliki kemampuan analisa yang memadai, serta menunjukkan ketenangan dan keyakinan saat bekerja dalam tekanan dan memenuhi target. Dalam kesehariannya, prestasi kerja yang ditunjukkannya tergolong normatif. Ia merupakan karyawan terbaru, namun mudah beradaptasi dan menunjukkan sikap kooperatif yang menonjol. Dalam beberapa hal ia juga dapat memainkan peran sebagai pimpinan yang efektif. Kelugasannya tersebut juga tampak saat ia harus mengkomunikasikan gagasannya secara lisan meskipun masih memerlukan perbaikan untuk komunikasi tulisan.</p> <p><strong>DENNY</strong> Salah seorang karyawan paling produktif di departemen. Meskipun ia gampang tersinggung dan mempunyai kesulitan dalam berteman atau bergaul dalam kelompok. Ia memiliki kemampuan menyesuaikan diri terhadap tekanan tugas yang baik. Walaupun lancar berbicara, namun gaya berbicaranya tampak kaku. Kemampuan analisa dan sintesanya tergolong rata-rata</p> <p><strong>ERNI</strong> Karyawan yang kooperatif dan banyak disukai dengan skill komunikasi yang kuat. Namun sikapnya santai dan tidak suka repot-repot membuat ia kurang optimal dalam mengerjakan tugas analisa dan sintesa. Meskipun ia suka menjadi pemimpin, tetapi kemampuan pengelolaan pekerjaannya tidak optimal. Ia terkadang terlambat memenuhi target namun ia mampu untuk bekerja di bawah tekanan.</p>'),
(7, "MATE20220211", "K07", 1, '<p>Perusahaan Anda, sebuah pabrik <em>manufacturing</em> mesin diesel untuk industri, telah bekerja beberapa bulan dalam rangka mengembangkan sebuah tipe <em>genset</em> (pembangkit listrik) baru. Pada sebuah <em>meeting</em> dengan departemen produksi, dampak pengembangan produk baru itu dipaparkan secara ringkas dan perubahan berikut akan terjadi di jalur produksi A dan/atau B.</p> <ul> <li>Jalur produksi A akan kekurangan lima karyawan atau jalur produksi B akan kekurangan sepuluh karyawan.</li> <li>Biaya <em>training</em> perusahaan akan meningkat jika jalur produksi A menambah karyawan baru.</li> <li>Produktivitas keseluruhan akan menurun jika jalur produksi A atau B menambah karyawan baru.</li> <li>Area kerja harus diperluas jika departemen B menambah karyawan baru.</li> </ul>'),
(8, "MATE20220211", "K08", 2, '<p>Sebagai seorang manajer, Anda mempunyai sebuah proyek yang terdiri dari empat tahap. Masing-masing tahap memerlukan waktu dua minggu dan dikerjakan oleh satu tim yang terdiri dari dua orang.</p> <p>Anda mempunyai enam orang staff, 4 diantaranya: Yudi, Yuda, Parti, dan Heru yang karena kesibukannya hanya bisa terlibat untuk satu tahap saja; sedangkan dua yang lainnya adalah Tari dan Gilang.</p> <p>Parti hanya memiliki waktu luang di bulan pertama dan tidak bisa bekerja sama dengan Tari. Gilang bertanggungjawab untuk implementasi dan lebih suka bekerja di bagian akhir. Yuda hanya bisa bekerja pada tahap dua atau tiga.</p> <p>Heru lebih suka bekerja di bulan pertama, namun dia tidak cocok bekerja dengan Parti dan/atau Yudi. Tari adalah pemimpin tim secara keseluruhan sehingga harus bekerja di tahap pertama dan empat. Hal lain yang perlu diperhatikan adalah tak seorang pun boleh bekerja lebih dari dua tahap.</p>'),
(9, "MATE20220211", "K09", 3, '<figure><img src="" title="Gambar Aturan Absensi Karyawan"/></figure> <p>Berdasarkan aturan absensi karyawan dan catatan kehadiran enam bulan terakhir dari tiap-tiap karyawan pada kondisi di atas, jawablah pertanyaan-pertanyaan berikut.</p>'),
(10, "MATE20220211", "K10", 1, '<p>Sebagai seorang manajer penjualan, Anda mengetahui bahwa salah seorang <em>salesman</em> Anda tidak menindaklanjuti komitmennya pada seorang customer besar, yang dahulu adalah salah satu dari customer Anda ketika masih menjadi <em>salesman</em>.</p> <p>Hari ini, <em>customer</em> tersebut menelpon Anda dan mengeluhkan pelayanan yang kurang memadai dari <em>salesman</em> Anda, terutama ketidakmampuannya untuk memberikan informasi yang diminta secara tepat waktu. </p>'),
(11, "MATE20220211", "K11", 1, '<p>Berikut ini sebuah cuplikan dari sebuah rapat bisnis. Pak Yunus bertindak sebagai ketua panel, dan Fred, seorang manajer Produksi.</p> <p>Pak Yunus: "…. dan dengan proses kerja yang selaras dan terpadu antar departemen, serta keseragaman persepsi terhadap visi/misi perusahaan, kita dapat memastikan efisiensi dan efektivitas di setiap lini organisasi yang pada akhirnya akan menjamin tercapainya keuntungan perusahaan."</p> <p>Fred: "Maaf saya berbeda pendapat, Pak, tapi berdasarkan biaya produksi saat ini, akan sulit untuk bisa balik modal di tahun ini, apalagi meraih keuntungan."</p>'),
(12, "MATE20220211", "K12", 1, '<figure><img src="" title="Gambar Kerja dan Efisiensi"/></figure>'),
(13, "MATE20220211", "K13", 3, '<p>Sebagai manajer keuangan, Anda bekerja di kantor dari jam 09.00 hingga 14.00 setiap hari, kecuali pada hari Kamis, ketika Anda menghadiri rapat perusahaan sebagai wakil divisi dari jam 12.00 hingga 15.00 (Anda tetap bekerja di kantor dari jam 09.00 hingga 12.00).</p> <p>Pada hari Senin, Anda bekerja dengan Agung untuk tugas di luar kantor dari jam 14.00 hingga 17.00. Pada hari Selasa jam 15.00 Anda memimpin rapat sebuah komite, yang biasanya berlangsung hingga jam 17.30 atau 16.00.</p> <p>Pada hari Rabu, Anda harus mengunjungi beberapa cabang mulai jam 14.00. Pada hari Jumat, Anda biasanya mengadakan rapat informal dengan staff kantor dari jam 15.00 hingga 16.00, yang terkadang berlangsung hingga jam 16.30 atau 17.00</p>'),
(14, "MATE20220211", "K14", 1, '<figure><img src="" title="Grafik Presentase Nilai Penjualan per Cabang (dibanding total penjualan)"/></figure>'),
(15, "MATE20220211", "K15", 2, '<figure><img src="" title="Tabel Hasil Evaluasi Kemampuan Karyawan"/></figure>'),
(16, "MATE20220211", "K16", 2, '<p>Tabel di bawah ini dipergunakan oleh Departemen Pembelian untuk memastikan bahwa pesanan material bisa datang tepat waktu agar tidak mengganggu proses produksi. Sebagai Manajer Pembelian, Anda melakukan pengawasan rutin pada bawahan Anda. Berikut ini adalah hasil pekerjaan Karno.</p> <figure><img src="" title="Tabel Rencana Pemesanan Material"/></figure>'),
(17, "MATE20220211", "K17", 2, '<figure><img src="" title="Tabel Alokasi Waktu per Proyek"/></figure>'),
(18, "MATE20220211", "K18", 1, '<figure><img src="" title="Grafik Keuntungan per Tahun Div A, B, dan C"/></figure>'),
(19, "MATE20220211", "K19", 2, '<p>Sebuah perusahaan akan membeli sejumlah perangkat teknologi informasi (IT) dari sebuah distributor perlengkapan komputer. Pada saat penawaran, Anda sebagai Manager Penjualan pada perusahaan distributor tersebut menjelaskan kepada <em>salesman</em> Anda tentang kemungkinan permasalahan yang akan terjadi apabila beberapa perangkat dihubungkan satu sama lain. Beberapa catatan tersebut adalah:</p> <ul> <li>Program Akuntansi SIMKEU akan bermasalah bila digabung dengan <em>printer</em> merek Conan, karena program ini tidak cocok dengan <em>printer</em> Conan</li> <li><em>Notebook</em> merek Anyer tidak cocok dipasangkan dengan <em>wireless mouse</em> merek Logik, karena ketidaksesuaian sistem <em>infrared</em>-nya</li> <li>Komputer PC merek BIM tidak boleh dipadukan dengan monitor merek GL, karena ketidak sesuaian sistem digital-nya.</li> </ul>'),
(20, "MATE20220211", "K20", 1, '<figure><img src="" title="Tabel Penawaran Service Fotokopi AMAN"/></figure>'),
(21, "MATE20220211", "K21", 2, '<figure><img src="" title="Tabel Hasil Tes Keterampilan Dasar Supervisor"/></figure>'),
(22, "MATE20220211", "K22", 2, '<p>Hasil survey terhadap para karyawan yang dengan keluar secara sukarela, menunjukkan bahwa lima alasan tertinggi untuk mencari pekerjaan di tempat lain adalah:</p> <ol> <li>Kejemuan karena tidak cukup banyak tugas yang non-rutin</li> <li>Keinginan untuk mencoba pekerjaan di bidang lain</li> <li>Lembur yang diharapkan tidak datang-datang juga</li> <li>Tidak cocok dengan rekan sekerja</li> <li>Ketidak mampuan menyelesaikan beban pekerjaan.</li> </ol>'),
(23, "MATE20220211", "K23", 1, '<p>Anda adalah manager yang bertanggungjawab atas pengadaan bahan mentah untuk produksi; dan salah satu tugas utamanya adalah mengevaluasi tawaran <em>supplier</em> setiap tahunnya. Tiga minggu yang lalu supervisor Anda pensiun dan digantikan oleh Pundi, seorang supervisor muda yang berkarir pesat yang berasal dari perusahaan kompetitor terbesar.</p> <p>Hubungan Anda dengan Pundi belum cukup harmonis, dan pada suatu hari, mendekati akhir proses evaluasi tahunan, Pundi menaruh kontrak dengan <em>supplier</em> Bina Utama, yang sudah dia tandatangani, di meja Anda, sambil memberitahu dia telah memutuskan untuk memilih <em>supplier</em> tersebut.</p> <p>Adapun alasannya karena dia pernah bekerja sama dengan Bina Utama di masa lalu dan benar-benar mempercayai produk dan service-nya, sambil menambahkan bahwa dia juga tahu kalau Bina Utama merupakan salah satu <em>supplier</em> yang sedang Anda pertimbangkan.</p>'),
(24, "MATE20220211", "K24", 1, '<p>Anda Manajer HRD yang baru di PLP Industries, yang selama ini selalu mengalami permasalahan naik turunnya jumlah pekerja di pabrik secara tak terduga. Permasalahan menjadi lebih rumit ketika persyaratan produksi minimum per bulan juga fluktuatif sebagaimana permintaan pasar yang juga fluktuatif. Untuk itu Anda perlu terlebih dahulu melakukan pemetaan terhadap fluktuasi jumlah pekerja satu tahun terakhir yang dibandingkan dengan hasil produksi pabrik.</p> <figure><img src="" title="Grafik Rerata Produksi tahun 20xx PLP Industries"/></figure>'),
(25, "MATE20220211", "K25", 3, '<figure><img src="" title="Grafik Karyawan per Cabang vs Grafik Profit per Cabang"/></figure>'),
(26, "MATE20220211", "K26", 1, '<p>Anda melihat dua orang bawahan Bu Yati sedang berdebat seru, yang semakin lama meningkat menjadi pertengkaran mulut yang kasar dan mengganggu suasana kerja di sekitarnya, meskipun beberapa saat kemudian perdebatan tersebut berakhir ketika salah seorang bergegas menyingkir. </p> <p>Di lain pihak, pada waktu yang bersamaan, di sekitar tempat perdebatan terjadi, Anda melihat Bu Yati sedang berbicara dengan seorang pelanggan; dan setelah pelanggan itu pergi, Bu Yati kembali ke ruang kerjanya tanpa melakukan apa-apa terhadap kedua bawahannya yang berdebat tadi.</p> <p>Anda merasa kedua karyawan tersebut harus ditegur, karena berdebat dan bertengkar mulut di hadapan pelanggan adalah hal yang tabu di perusahaan. Pak Farid, sebagai atasan Anda dan Bu Yati, keluar kantor hari ini; dan Anda sendiri harus menemui pelanggan yang 15 menit lagi akan tiba.</p>');

-- 
-- Soal
-- 
DROP TABLE IF EXISTS soal;
CREATE TABLE soal (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    versi       TEXT REFERENCES meta(versi),
    ref         TEXT REFERENCES kondisi(seq),
    seq         TEXT NOT NULL,
    faktor      TEXT,
    konten      TEXT NOT NULL,
    a           TEXT NOT NULL,
    b           TEXT NOT NULL,
    c           TEXT NOT NULL,
    d           TEXT NOT NULL,
    e           TEXT NOT NULL,
    UNIQUE (versi, ref, seq)
);

-- Data Soal
INSERT INTO soal (versi, ref, seq, konten, a, b, c, d, e) VALUES
("MATE20220211", "K01", "S01", '<p>Jika berwisata ke Taman Bunga Indonusa adalah insentif yang nilainya terendah, kepada siapa saja insentif tersebut akan Anda berikan?</p>', "Kelly, Sunarto, Chris, Truno", "Kelly, Sunarto, Sandra, Chris", "Tina, Sunarto, Kelly, Sandra", "Muladi, Sunarto, Kelly, Truno", "Kelly, Sandra, Sunarto, Truno"),
("MATE20220211", "K01", "S02", '<p>Jika tiga peringkat teratas paket ke luar negeri adalah ke Amerika Serikat (sudah diberikan ke Muladi), ke Perancis (sudah diberikan ke Petra), dan ke Inggris; siapakah yang berhak menerima paket ke Inggris?</p>', "Sambas", "Tina", "Lisa", "Sandra", "Chris"),
("MATE20220211", "K01", "S03", '<p>Jika tiga paket ke luar kota peringkatnya adalah: ke Bali dan Lombok selama 2 minggu, kemudian ke Bali 1 minggu dan ke Bali 3 hari, siapa saja yang berhak menerima paket tersebut sesuai dengan urutan peringkatnya? (urutan nama menunjukkan peringkat)</p>', "Tina, Sandra, Sambas", "Sambas, Sandra, Tina", "Tina, Sambas, Sandra", "Sandra, Sambas, Tina", "Sambas, Tina, Sandra"),
("MATE20220211", "K02", "S04", '<p>Perusahaan mana yang mempunyai keuntungan kumulatif tertinggi untuk kuartal 3 dan 4?</p>', "DEF", "JKL", "ABC", "MNO", "GHI"),
("MATE20220211", "K03", "S05", '<p>Pernyataan mana di bawah ini yang paling akurat sehubungan dengan informasi yang Anda miliki?</p>', "Komentar pribadi jelas berpengaruh dalam proses promosi", "Masa kerja di posisi saat ini dapat menutupi kinerja yang kurang sempurna", "Jarwo dipromosikan menggunakan tolok ukur yang subjektif", "Karyawan lebih tua selalu dipromosikan sebelum karyawan lebih muda", "Gunawan dan Elizabeth akan dipromosikan pada proses promosi berikutnya"),
("MATE20220211", "K04", "S06", '<p>Berdasarkan informasi di atas, sepatu merek apa yang dianggap paling mampu memenuhi keinginan pasar sepatu sport untuk anak muda?</p>', "Niko", "Tiger", "Elang", "Advantage", "Newlife"),
("MATE20220211", "K04", "S07", '<p>Sepatu merek apa yang dianggap paling mampu memenuhi keinginan pasar sepatu sport untuk anak muda dalam hal harga, tanpa mempedulikan masalah keawetan?</p>', "Advantage", "Niko", "Tiger", "Elang", "Newlife"),
("MATE20220211", "K04", "S08", '<p>Sepatu merek apa yang anda anggap dapat meraih pasar terbesar untuk mereka yang mengutamakan penampilan?</p>', "Niko", "Tiger", "Elang", "Advantage", "Newlife"),
("MATE20220211", "K05", "S09", '<p>Dari pernyataan berikut ini, mana yang tidak akan menghasilkan keputusan "ya" untuk tender sebuah proyek senilai Rp 125.000.000,- ?</p>', "Manajer Pembelian, Kepala Divisi Terkait, Kepala Divisi Pengadaan, Direktur Operasional dan Direktur Utama menyetujui.", "Kepala Divisi Pengadaan dan Direktur Operasional menyetujui, tetapi Direktur Utama tidak setuju", "Kepala Divisi Pengadaan dan Direktur Operasional menyetujui, demikian juga Direktur Utama", "Kepala Divisi Pengadaan tidak menyetujui, namun Direktur Operasional dan Direktur Utama menyetujui", "Direktur Utama dan Kepala Divisi Pengadaan keduanya menyetujui"),
("MATE20220211", "K05", "S10", '<p>Untuk tender dengan nilai di atas Rp 500.000.000,- tim yang paling tepat untuk memberikan persetujuan tender tersebut adalah:</p>', "Hanya Direktur Utama", "Dir Utama dan Dir. Keuangan", "Dir Utama dan Dir. Operasional atau Dir Keuangan", "Dir Utama, Dir. Operasional dan Dir Keuangan", "Dir Utama, Dir. Operasional dan Kadiv Pengadaan"),
("MATE20220211", "K06", "S11", '<p>Berdasarkan hasil evaluasi di atas, karyawan mana yang akan Anda pilih untuk menyelesaikan sebuah proyek dengan deadline yang ketat dan melibatkan analisis data yang mendalam? Selain itu, hasil proyek tersebut harus dipresentasikan secara lisan pada pertemuan departemen dalam bahasa yang mudah dipahami.</p>', "Amir", "Berta", "Carlo", "Denny", "Erni"),
("MATE20220211", "K06", "S12", '<p>Berdasarkan hasil evaluasi di atas, siapa yang akan yang anda pilih untuk memimpin proyek dengan anggota tim yang banyak dan beragam serta jangka waktu yang lama?</p>', "Amir", "Berta", "Carlo", "Denny", "Erni"),
("MATE20220211", "K07", "S13", '<p>Jika hasil <em>meeting</em> di atas harus Anda sampaikan secara ringkas kepada atasan Anda, mana di antara alternatif berikut ini yang akan Anda pilih sebagai kesimpulan yang Anda ambil?</p>', "Perusahaan harus menambah 15 karyawan baru, biaya <em>training</em> akan meningkat, dan ruang kantor diperluas", "Jalur produksi A harus menambah lima karyawan baru dan biaya <em>training</em> akan menurun.", "Jalur produksi B harus menambah lima karyawan baru dan produktivitas akan menurun", "Produktivitas dan biaya <em>training</em> akan meningkat", "Ruang kantor mungkin harus diperluas dan produktivitas akan menurun"),
("MATE20220211", "K08", "S14", '<p>Pada tahap mana saja Gilang akan bekerja?</p>', "1 dan 4", "3 dan 4", "2 dan 3", "2 dan 4", "1 dan 3"),
("MATE20220211", "K08", "S15", '<p>Siapa sajakah anggota tim untuk tahap 1?</p>', "Parti dan Tari", "Parti dan Heru", "Tari dan Yudi", "Heru dan Tari", "Gilang dan Tari"),
("MATE20220211", "K09", "S16", '<p>Karyawan mana yang kemungkinan besar dapat Anda andalkan untuk dapat tepat waktu pada meeting di pagi hari?</p>', "Yuli, Yudi dan Melisa", "Yuli", "Melisa", "Yudi", "Tidak dapat ditentukan"),
("MATE20220211", "K09", "S17", '<p>Dengan menggunakan informasi kebijakan dan catatan kehadiran Yudi, situasi mana di bawah ini akan/dapat berkonflik dengan kebijakan cuti?</p>', "Cuti kematian di bulan Februari", "Hari-hari sakit di bulan Januari", "19 April hari ijin pribadi", "16 Maret hari sakit", "Dimintakan pada hari Selasa untuk mengambil cuti pada hari Rabu minggu berikutnya sebagai hari ijin pribadi untuk mempersiapkan pesta ulang tahun anaknya"),
("MATE20220211", "K09", "S18", '<p>Karyawan mana yang kebiasaan cutinya paling mengkhawatirkan?</p>', "Melisa", "Yudi", "Yuli", "Melisa dan Yudi", "Yuli dan Melisa"),
("MATE20220211", "K10", "S19", '<p>Sekarang jam 13.00 dan <em>salesman</em> tersebut sedang keluar makan siang. Sebagai manajer, tindakan apa yang paling tepat Anda lakukan?</p>', "Menanyakan kepada <em>customer</em> itu apakah ia ingin memilih seorang <em>salesman</em> baru atau apakah ia akan lebih suka jika Anda sendiri yang bertindak menjadi <em>salesman</em>", "Memberitahukan kepada <em>customer</em> itu bahwa kalau bukan <em>salesman</em> itu, Anda sendiri yang akan menghubunginya hari ini juga untuk memberi informasi yang diminta.", "Memberitahu <em>customer</em> itu bahwa Anda akan meninggalkan pesan untuk <em>salesman</em> tersebut agar segera menghubunginya", "Setuju untuk membantu <em>customer</em> itu dan menjanjikan jawaban dari <em>salesman</em> tersebut pada hari ini sebelum jam 17.00.", "Menjelaskan kepada <em>customer</em> bahwa bukanlah tanggungjawab Anda untuk menangani keluhan dan menyarankan agar dia menghubungi <em>customer service</em>."),
("MATE20220211", "K11", "S20", '<p>Arti lain dari pernyataan Fred dalam percakapan di atas adalah:</p>', "Fred ingin menunjukkan bahwa Pak Yunus omong kosong atau mengada-ada.", "Fred berpikir bahwa keuntungan jangka pendek selaras dengan keuntungan jangka panjang", "Fred fokus pada biaya produksi yang dibandingkan dengan harga jual.", "Fred mengingatkan pada semua bahwa upaya kerja sama antar departemen tidak berjalan sejak tahun lalu", "Fred berpikir keuntungan perusahaan dan ekspansi itu saling bergantung satu sama lain"),
("MATE20220211", "K12", "S21", '<p>Asumsikan semua pernyataan di bawah benar, pernyataan mana yang paling jelas menunjukkan ketidak-cocokan rumus di atas untuk menghitung tingkat efisiensi?</p>', "Tak seorang pun di antara <em>salesman</em> itu mempunyai tingkat efisiensi yang dapat diterima", "Tingkat efisiensi gabungan untuk Melani dan Amy lebih tinggi daripada Lerbin dan Yusti", "Penjualan Amy merupakan 40% total penjualan.", "Yusti menggunakan kebanyakan waktu di luar kantor.", "Melani adalah <em>salesman</em> yang paling efisien di perusahaan."),
("MATE20220211", "K13", "S22", '<p>Jika Anda diminta untuk mengerjakan riset di luar kantor selama dua jam pada sore hari, hari apakah yang paling cocok?</p>', "Senin", "Selasa", "Rabu", "Kamis", "Jumat"),
("MATE20220211", "K13", "S23", '<p>Anda harus ke luar kota pada hari Jumat jam 14.00. Dengan berpegang pada jadwal Anda seperti tercantum pada Kondisi di atas, kapankah waktu terbaik untuk menjadwal-ulang rapat informal dengan staf di kantor?</p>', "Rabu jam 14.00", "Kamis jam 15.00", "Senin jam 14.00", "Selasa jam 14.00", "Bukan semua di atas"),
("MATE20220211", "K13", "S24", '<p>Salah seorang klien akan berkunjung ke kantor Anda minggu depan. Hari apa yang paling memungkinkan jika Anda harus menggunakan satu hari penuh dengan klien Anda?</p>', "Senin", "Selasa", "Rabu", "Kamis", "Jumat"),
("MATE20220211", "K14", "S25", '<p>Perusahaan Anda sedang mempertimbangkan untuk melakukan restrukturisasi, di mana Anda adalah orang yang diminta untuk mempertimbangkan gagasan itu. Dengan data-data sebagaimana grafik-grafik di atas, rekomendasi terbaik apa yang dapat Anda sampaikan?</p>', "Perusahaan tidak perlu melakukan restrukturisasi", "Jangan sarankan apapun; sampai Anda memperoleh lebih banyak informasi tentang hal-hal yang berhubungan dengan restrukturisasi.", "Upayakan agar persentase nilai penjualan tiap cabang menandingi persentase nilai penjualan kompetitor.", "Perkuat cabang Jawa Timur dan Jawa Tengah untuk mengambil keuntungan dari lebih kecilnya persentase nilai penjualan kompetitor", "Mengurangi persentase nilai penjualan Jawa Barat dan DKI agar setara dengan persentase nilai penjualan kompetitor"),
("MATE20220211", "K15", "S26", '<p>Siapakah yang Anda asumsikan akan paling jarang mengalami masalah dalam menjalankan pekerjaannya secara keseluruhan?</p>', "Ari", "Bayu", "Cahyo", "Dina", "Emil"),
("MATE20220211", "K15", "S27", '<p>Siapakah yang paling mungkin mengalami hal berikut ini: mampu bekerja dalam kelompok yang anggotanya berasal dari beragam fungsi, namun akan mengalami kesulitan ketika terlibat pada beberapa kegiatan secara bersamaan?</p>', "Ari", "Bayu", "Cahyo", "Dina", "Emil"),
("MATE20220211", "K16", "S28", '<p>Berdasarkan tabel rencana pemesanan di atas, Anda mengidentifikasi sebuah pemesanan material yang akan menimbulkan problem produksi. Material apakah yang dimaksud?</p>', "Baja Gulung", "Pipa Aluminium", "Besi Cor", "Baja Lembaran", "Kawat Baja"),
("MATE20220211", "K16", "S29", '<p>Berdasarkan data di atas Anda menyadari bahwa ada dokumen penagihan untuk salah satu item yang dipesan Karno akan dipertanyakan oleh bagian Keuangan. Item mana yang memiliki kemungkinan terbesar akan dipertanyakan?</p>', "Pipa Baja", "Kawat Baja", "Baja Lembaran", "Besi Cor", "Baja Gulung"),
("MATE20220211", "K17", "S30", '<p>Meskipun alokasi waktu Meri pada proyek C, Tomi pada proyek B, dan Sari pada proyek A sama-sama sebesar 10 jam/minggu, tetapi:</p>', "Kontribusi Meri terhadap proyek C lebih tinggi dari kontribusi Tomi pada proyek B", "Kontribusi Meri terhadap proyek C sama dengan kontribusi Sari pada proyek A", "Kontribusi Tomi pada proyek A lebih tinggi dari kontribusi Sari pada Proyek B", "Kontribusi Tomi pada proyek B sama dengan kontribusi Sari pada Proyek A", "Kontribusi Tomi pada proyek B lebih tinggi dari kontribusi Sari pada Proyek A"),
("MATE20220211", "K17", "S31", '<p>Siapakah yang akan paling memberikan dampak terbesar terhadap seluruh proyek ketika dia tidak masuk?</p>', "Meri atau Tomi", "Tomi atau Sari", "Meri", "Tomi", "Sari"),
("MATE20220211", "K18", "S32", '<p>Berdasarkan grafik dan tabel di atas, tentukan mana di antara pernyataan-pernyataan berikut yang salah.</p>', "Pada tahun 2000, nilai keuntungan divisi A adalah Rp 650.000.000,-", "Pada tahun 1996, divisi B memiliki angka indeks keuntungan tertinggi", "Pada tahun 1997, divisi A dan C sama-sama memberikan keuntungan", "Pada tahun 1998, angka indeks keuntungan divisi C lebih kecil dari pada divisi B", "Pada tahun 1999, angka indeks keuntungan divisi A lebih besar daripada divisi B"),
("MATE20220211", "K19", "S33", '<p>Mana pengaturan <em>display/set</em> berikut yang harus dihindari oleh <em>salesman</em> Anda?</p>', "Program SIMKEU, Notebook Anyer, dan Monitor GL", "Notebook Anyer, Monitor GL, dan Printer Conan", "Mouse Logik, Komputer BIM, dan Printer Conan", "Mouse Logik, Komputer BIM, dan Printer Conan", "Program SIMKEU, Komputer PC BIM, dan Monitor GL"),
("MATE20220211", "K19", "S34", '<p>Jika komputer BIM tidak dijadikan satu dengan <em>printer</em> Conan, produk apa saja yang bisa digabung dengan komputer BIM?</p>', "Mouse Logik dan Monitor GL", "Monitor GL dan Program SIMKEU", "Program SIMKEU dan <em>Notebook</em> Anyer", "Mouse Logic dan <em>Notebook</em> Anyer", "Bukan semua jawaban di atas"),
("MATE20220211", "K20", "S35", '<p>Kedua perusahaan di atas menawarkan untuk memberikan pelayanan mesin fotokopi dengan kesepakatan <em>service</em> seperti di atas. Mesin fotokopi yang mereka tawarkan berasal dari merek dan tipe yang sama, namun pelayanannya yang berbeda. Jika Anda memilih perusahaan fotokopi BERSAUDARA, alasan apa yang mendasari keputusan tersebut?</p>', "Perusahaan BERSAUDARA tidak menarik biaya perjalanan untuk 5 kilometer pertama.", "Jenis mesin fotokopi lebih penting daripada biaya <em>service</em>.", "Anda merasa lebih cocok mempunyai kontrak dengan perusahaan yang sudah mapan.", "Biaya sifatnya kritikal dan perusahaan BERSAUDARA akan melayani pembelanjaan besar.", "Perusahaan Anda tidak berencana membeli sebuah mesin fotokopi sampai layanan ini tidak berjalan lancar; sehingga garansi penggantian <em>spare-parts</em> menjadi penting."),
("MATE20220211", "K21", "S36", '<p>Perusahaan Anda mengadakan Program Pelatihan Manajemen Madya. Semua supervisor yang berminat mengikuti program tersebut diharuskan mencapai nilai minimal pada sejumlah tes: nilai 40 untuk Keterampilan Verbal, nilai 45 untuk Pemahaman Bacaan, dan nilai 30 untuk Penalaran Matematika. Siapa di antara supervisor di bawah ini yang memenuhi syarat untuk mengikuti program pelatihan tersebut?</p>', "Budi, Karmila", "Karmila, Rudi", "Budi, Karmila, Rudi", "Karno, Karmila, Rudi", "Budi, Karno, Rudi"),
("MATE20220211", "K21", "S37", '<p>Ada sejumlah inisiatif proyek baru akan dilakukan dalam waktu 12 bulan mendatang. Untuk bisa terlibat dalam proyek tersebut, para supervisor harus mencapai nilai 25, 23, dan 35 berturut-turut pada tes Penalaran Matematika, Keterampilan Verbal dan Pemahaman Bacaan.</p>', "Budi saja", "Sumadi saja", "Gina saja", "Gina dan Sumadi", "Budi dan Gina"),
("MATE20220211", "K22", "S38", '<p>Manakah alasan keluar yang mengindikasikan ketidakmampuan orang untuk menetapkan prioritas dan mengorganisasikan tugas-tugas?</p>', "1", "2", "3", "4", "5"),
("MATE20220211", "K22", "S39", '<p>Jika penjelasan mengenai tugas dan tanggung jawab pekerjaan yang diberikan kepada para pelamar cukup jelas dan tidak dilebih-lebihkan; alasan keluar manakah yang paling mungkin akan berkurang?</p>', "1", "2", "5", "1 dan 5", "1 dan 2"),
("MATE20220211", "K23", "S40", '<p>Anda tersinggung karena bukan haknya untuk memutuskan hal tersebut, namun Anda tidak ingin menambah jarak lebih jauh lagi. Langkah apa terbaik untuk Anda lakukan?</p>', "Menyetujui keputusan Pundi dan kontrak itu berlaku", "Kontrak itu tetap berlaku, namun informasikan kepada manajemen yang lebih tinggi mengenai adanya pelanggaran prosedur", "Hubungi Bina Utama, dan jelaskan bahwa kontrak itu tidak sah namun mereka masih punya kesempatan untuk mendapatkan yang sah", "Jelaskan proses evaluasi tawaran kepada Pundi, dan biarkan dia memutuskan apakah kontrak itu masih berlaku atau tidak", "Lakukan proses evaluasi tawaran seperti biasa, dan abaikan kontrak yang dibuat oleh Pundi"),
("MATE20220211", "K24", "S41", '<p>Berdasarkan informasi dan grafik di atas, pada kuartal ke berapa konfigurasi kondisi jumlah pekerja dibandingkan dengan rerata produksi paling optimal?</p>', "Kuartal ke-1", "Kuartal ke-2", "Kuartal ke-3", "Kuartal ke-4", "Bukan semua di atas"),
("MATE20220211", "K25", "S42", '<p>Berdasarkan grafik di atas, cabang manakah yang bisa dianggap paling efisien?</p>', "Medan", "Surabaya", "Surakarta", "Yogyakarta", "Denpasar"),
("MATE20220211", "K25", "S43", '<p>Berdasarkan grafik di atas, cabang mana sajakah yang paling tepat guna untuk dijadikan obyek riset dan pengembangan strategi penjualan dan pemasaran?</p>', "Surakarta dan Semarang", "Yogyakarta dan Jakarta", "Bandung dan Jakarta", "Palembang dan Bandung", "Yogyakarta dan Palembang"),
("MATE20220211", "K25", "S44", '<p>Berdasarkan grafik di atas, cabang manakah yang memberi keuntungan paling tinggi?</p>', "Jakarta", "Surabaya", "Surakarta", "Medan", "Semarang"),
("MATE20220211", "K26", "S45", '<p>Jika Anda ingin memastikan kedua bawahan Bu Yati yang bertengkar itu ditegur, sementara Anda dan Bu Yati adalah kolega yang setara kedudukannya. Bagaimana cara yang paling diplomatis untuk melakukannya?</p>', "Dekati karyawan yang masih di situ dan dengan perlahan beri teguran.", "Panggil kedua bawahan Bu Yati tersebut ke ruangan Anda setelah Anda berbicara dengan klien Anda.", "Beritahu Pak Farid mengenai kekhawatiran Anda dengan harapan Beliau akan membicarakannya secara serius dengan Bu Yati.", "Dekati Bu Yati dan sarankan agar dia mendisiplin karyawannya.", "Selesaikan urusan dengan pelanggan Anda terlebih dahulu baru kemudian memikirkan rencana tindakan sehubungan dengan kasus perdebatan tadi.");
