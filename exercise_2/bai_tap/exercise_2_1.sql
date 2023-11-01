DROP DATABASE IF EXISTS store_management;
CREATE DATABASE IF NOT EXISTS store_management;
USE store_management;

CREATE TABLE nha_cc(
	ma_ncc 		INT AUTO_INCREMENT PRIMARY KEY,
    ten_ncc 	VARCHAR(255) NOT NULL,
    dia_chi 	VARCHAR(255) NOT NULL,
    sdt	 		VARCHAR(255) NOT NULL
);

CREATE TABLE vat_tu(
	ma_vtu INT AUTO_INCREMENT PRIMARY KEY,
    ten_vtu VARCHAR(255)
);

CREATE TABLE don_nh(
	so_hd 	INT AUTO_INCREMENT PRIMARY KEY,
    ngay_dh DATE,
    ma_ncc 	INT,
    ma_vtu 	INT,
    CONSTRAINT fk_ma_ncc 
    FOREIGN KEY (ma_ncc) 
    REFERENCES nha_cc(ma_ncc)
			ON UPDATE CASCADE
            ON DELETE SET NULL,
	CONSTRAINT fk_vat_tu 
    FOREIGN KEY (ma_vtu) 
	REFERENCES vat_tu(ma_vtu)
		ON UPDATE CASCADE
        ON DELETE SET NULL
);	

CREATE TABLE phieu_xuat(
	so_px 	INT AUTO_INCREMENT PRIMARY KEY,
    dg_xuat	DECIMAL(12,2),
    slg_xuat SMALLINT,
    ngay_xuat DATE,
	ma_vtu INT,
    FOREIGN KEY (ma_vtu) 
    REFERENCES vat_tu(ma_vtu) 
		ON UPDATE CASCADE
		ON DELETE SET NULL
);





