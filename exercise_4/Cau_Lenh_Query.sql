-- 1. Liệt kê danh sách sinh viên, gồm các thông tin sau: Mã sinh viên, Họ sinh 
-- viên, Tên sinh viên, Học bổng. Danh sách sẽ được sắp xếp theo thứ tự Mã 
-- sinh viên tăng dần
SELECT 	MaSV, HoSV, TenSV, HocBong FROM dmsv ORDER BY Phai;

-- 2. Danh sách các sinh viên gồm thông tin sau: Mã sinh viên, họ tên sinh viên, 
-- Phái, Ngày sinh. Danh sách sẽ được sắp xếp theo thứ tự Nam/Nữ.
SELECT MaSV, concat(HoSV, TenSv ), Phai, NgaySinh FROM dmsv 
ORDER BY Phai;

-- 3. Thông tin các sinh viên gồm: Họ tên sinh viên, Ngày sinh, Học bổng. Thông 
-- tin sẽ được sắp xếp theo thứ tự Ngày sinh tăng dần và Học bổng giảm dần.
SELECT concat(HoSV, TenSv ) HoTenSV, NgaySinh, HocBong FROM dmsv 
ORDER BY 
	NgaySinh ASC,
    HocBong DESC;

-- 4. Danh sách các môn học có tên bắt đầu bằng chữ T, gồm các thông tin: Mã 
-- môn, Tên môn, Số tiết.
SELECT * FROM dmmh WHERE TenMH LIKE('T%');

-- 5. Liệt kê danh sách những sinh viên có chữ cái cuối cùng trong tên là I, gồm 
-- các thông tin: Họ tên sinh viên, Ngày sinh, Phái.
SELECT * FROM dmkhoa WHERE TenKhoa LIKE('%n%');

-- 6. Danh sách những khoa có ký tự thứ hai của tên khoa có chứa chữ N, gồm 
-- các thông tin: Mã khoa, Tên khoa.
SELECT * FROM dmkhoa WHERE TenKhoa LIKE('%n%');

-- 7. Liệt kê những sinh viên mà họ có chứa chữ Thị.
SELECT * FROM dmsv WHERE HoSV LIKE('%Thị%');

-- 8. Cho biết danh sách các sinh viên có học bổng lớn hơn 100,000, gồm các 
-- thông tin: Mã sinh viên, Họ tên sinh viên, Mã khoa, Học bổng. Danh sách sẽ
-- được sắp xếp theo thứ tự Mã khoa giảm dần
SELECT MaSV, concat(HoSV, TenSV) HoTenSV, MaKhoa, HocBong FROM dmsv WHERE HocBong > 100000;

-- 9. Liệt kê các sinh viên có học bổng từ 150,000 trở lên và sinh ở Hà Nội, gồm 
-- các thông tin: Họ tên sinh viên, Mã khoa, Nơi sinh, Học bổng.
SELECT MaSV, concat(HoSV, TenSV) HoTenSV, MaKhoa, HocBong FROM dmsv WHERE HocBong > 150000;
-- 10.Danh sách các sinh viên của khoa Anh văn và khoa Vật lý, gồm các thông tin: Mã sinh viên, Mã khoa, Phái.
SELECT MaSV,  MaKhoa, Phai 
FROM dmsv 
WHERE MaKhoa IN (SELECT MaKhoa FROM dmkhoa WHERE TenKhoa IN('Anh văn', 'Vật Lý'));

-- 11.Cho biết những sinh viên có ngày sinh từ ngày 01/01/1991 đến ngày 
-- 05/06/1992 gồm các thông tin: Mã sinh viên, Ngày sinh, Nơi sinh, Học 
-- bổng.
SELECT MaSV, NgaySinh, NoiSinh, HocBong FROM dmsv WHERE NgaySinh BETWEEN '1991-01-01' AND '1992-06-05';

-- 12.Danh sách những sinh viên có học bổng từ 80.000 đến 150.000, gồm các 
-- thông tin: Mã sinh viên, Ngày sinh, Phái, Mã khoa.
SELECT MaSV, NgaySinh, Phai, MaKhoa FROM dmsv WHERE HocBong BETWEEN 80000 AND 150000;

-- 13.Cho biết những môn học có số tiết lớn hơn 30 và nhỏ hơn 45, gồm các thông 
-- tin: Mã môn học, Tên môn học, Số tiết.
SELECT * FROM quanlydiemsv.dmmh WHERE SoTiet BETWEEN 30 AND 45;

-- 14.Liệt kê những sinh viên nam của khoa Anh văn và khoa tin học, gồm các 
-- thông tin: Mã sinh viên, Họ tên sinh viên, tên khoa, Phái.
SELECT sv.MaSV, concat(sv.HoSV, sv.TenSV), k.TenKhoa, sv.Phai
FROM dmsv sv
INNER JOIN dmkhoa k ON k.MaKhoa = sv.MaKhoa
WHERE k.TenKhoa IN ('Anh Văn', 'Tin Học');

-- 15.Liệt kê những sinh viên nữ, tên có chứa chữ N
SELECT * FROM quanlydiemsv.dmsv
WHERE Phai LIKE('Nữ') AND TenSV LIKE('%N');

-- 16.Danh sách sinh viên có nơi sinh ở Hà Nội và sinh vào tháng 02, gồm các 
-- thông tin: Họ sinh viên, Tên sinh viên, Nơi sinh, Ngày sinh.
SELECT HoSV, TenSV, NoiSinh, NgaySinh
FROM quanlydiemsv.dmsv
WHERE month(NgaySinh) = 2;

-- 17.Cho biết những sinh viên có tuổi lớn hơn 20, thông tin gồm: Họ tên sinh viên, Tuổi,Học bổng.
SELECT concat(sv.HoSV, sv.TenSV)HoTen, (year(now()) - year(NgaySinh)) AS tuoi, sv.HocBong
FROM dmsv sv
INNER JOIN dmkhoa k ON k.MaKhoa = sv.MaKhoa
WHERE (year(now()) - year(NgaySinh)) >= 20;

-- 18.Danh sách những sinh viên có tuổi từ 20 đến 25, thông tin gồm: Họ tên sinh 
-- viên, Tuổi, Tên khoa.
SELECT concat(sv.HoSV, sv.TenSV)HoTen, (year(now()) - year(NgaySinh)) AS tuoi, k.TenKhoa
FROM dmsv sv
INNER JOIN dmkhoa k ON k.MaKhoa = sv.MaKhoa
WHERE (year(now()) - year(NgaySinh)) >= 20 AND (year(now()) - year(NgaySinh)) <= 25;

-- 19.Danh sách sinh viên sinh vào mùa xuân năm 1990, gồm các thông tin: Họ
-- tên sinh viên,Phái, Ngày sinh.


-- 20.Cho biết thông tin về mức học bổng của các sinh viên, gồm: Mã sinh viên, 
-- Phái, Mã khoa, Mức học bổng. Trong đó, mức học bổng sẽ hiển thị là “Học 
-- bổng cao” nếu giá trị của field học bổng lớn hơn 500,000 và ngược lại hiển 
-- thị là “Mức trung bình”
-- 21.Cho biết tổng số sinh viên của toàn trường
-- 22.Cho biết tổng sinh viên và tổng sinh viên nữ.
-- 23.Cho biết tổng số sinh viên của từng khoa.
-- 24.Cho biết số lượng sinh viên học từng môn.
-- 25.Cho biết số lượng môn học mà sinh viên đã học(tức tổng số môn học có 
-- trong bảng kq)
-- 26.Cho biết tổng số học bổng của mỗi khoa.
-- 27.Cho biết học bổng cao nhất của mỗi khoa.
-- 28.Cho biết tổng số sinh viên nam và tổng số sinh viên nữ của mỗi khoa.
-- 29.Cho biết số lượng sinh viên theo từng độ tuổi.
-- 30.Cho biết những năm sinh nào có 2 sinh viên đang theo học tại trường.
-- 31.Cho biết những nơi nào có hơn 2 sinh viên đang theo học tại trường.
-- 32.Cho biết những môn nào có trên 3 sinh viên dự thi.
-- 33.Cho biết những sinh viên thi lại trên 2 lần.
-- 34.Cho biết những sinh viên nam có điểm trung bình lần 1 trên 7.0
-- 35.Cho biết danh sách các sinh viên rớt trên 2 môn ở lần thi 1.
-- 36.Cho biết danh sách những khoa có nhiều hơn 2 sinh viên nam
-- 37.Cho biết những khoa có 2 sinh đạt học bổng từ 200.000 đến 300.000.
-- 38.Cho biết số lượng sinh viên đậu và số lượng sinh viên rớt của từng môn 
-- trong lần thi 1.
-- 39.Cho biết sinh viên nào có học bổng cao nhất.
-- 40.Cho biết sinh viên nào có điểm thi lần 1 môn cơ sở dữ liệu cao nhất.
SELECT 
	sv.TenSV
FROM dmsv sv
INNER JOIN ketqua kq ON kq.MaSV =  sv.MaSV
INNER JOIN dmmh mh ON mh.MaMH = kq.MaMH
WHERE mh.TenMH LIKE('Cơ Sở Dữ Liệu')
GROUP BY sv.TenSV;

-- 41.Cho biết sinh viên khoa anh văn có tuổi lớn nhất.
SELECT 
	sv.MaSV, sv.TenSV, (year(now()) - year(sv.NgaySinh)) as tuoi
FROM dmsv sv
WHERE (year(now()) - year(sv.NgaySinh)) = (SELECT max((year(now()) - year(sv.NgaySinh)))  as max FROM dmsv sv);

-- 42.Cho biết khoa nào có đông sinh viên nhất.
SELECT 
	sv.MaKhoa,
    count(sv.MaKhoa) soluong_Sv
FROM dmkhoa k 
LEFT JOIN dmsv sv ON sv.MaKhoa = k.MaKhoa
GROUP BY k.MaKhoa;

-- 43.Cho biết khoa nào có đông nữ nhất.
SELECT 
	sv.MaKhoa,
	count(sv.Phai) solg
FROM dmkhoa k 
LEFT JOIN dmsv sv ON sv.MaKhoa = k.MaKhoa
WHERE sv.Phai LIKE('Nữ')
GROUP BY k.MaKhoa
HAVING solg = 2;

-- 44.Cho biết môn nào có nhiều sinh viên rớt lần 1 nhiều nhất.
SELECT 
	mh.TenMH
FROM ketqua kq
INNER JOIN dmmh mh ON mh.MaMH = kq.MaMH
WHERE kq.LanThi = 1 AND kq.Diem < 5
GROUP BY (mh.TenMH )
ORDER BY count(mh.TenMH) DESC
LIMIT 1;

-- 45.Cho biết sinh viên không học khoa anh văn có điểm thi môn phạm lớn hơn 
-- điểm thi văn của sinh viên học khoa anh văn.
SELECT 
	sv.TenSV,
    r.kq
FROM dmsv sv
INNER JOIN dmkhoa k ON k.MaKhoa = sv.MaKhoa
INNER JOIN (
	SELECT 
		kq.MaSV MaSV, kq.MaMH, mh.TenMH, kq.Diem Kq
	FROM ketqua kq
	INNER JOIN dmmh mh ON mh.MaMH = kq.MaMH
	WHERE mh.TenMH LIKE('Văn Phạm')
) AS r ON r.MaSV = sv.MaSV
WHERE k.TenKhoa LIKE ('Anh Văn');

-- 46.Cho biết sinh viên có nơi sinh cùng với Hải.
SELECT * FROM dmsv sv2
WHERE sv2.NoiSinh IN (SELECT sv.NoiSinh FROM dmsv sv WHERE sv.TenSV LIKE('Hải'));

-- 47.Cho biết những sinh viên nào có học bổng lớn hơn tất cả học bổng của sinh viên thuộc khoa anh văn
SELECT *
FROM dmsv sv1
INNER JOIN dmkhoa k ON k.MaKhoa = sv1.MaKhoa
WHERE 
	k.TenKhoa NOT LIKE('Anh Văn') 
	AND 
    sv1.HocBong > ALL (SELECT sv.HocBong
					FROM dmsv sv
					INNER JOIN dmkhoa k ON k.MaKhoa = sv.MaKhoa
					WHERE k.TenKhoa LIKE('Anh Văn'));


-- 48.Cho biết những sinh viên có học bổng lớn hơn bất kỳ học bổng của sinh viên 
-- học khóa anh văn
SELECT *
FROM dmsv sv1
INNER JOIN dmkhoa k ON k.MaKhoa = sv1.MaKhoa
WHERE 
	k.TenKhoa NOT LIKE('Anh Văn') 
	AND 
    sv1.HocBong > ANY (SELECT sv.HocBong
					FROM dmsv sv
					INNER JOIN dmkhoa k ON k.MaKhoa = sv.MaKhoa
					WHERE k.TenKhoa LIKE('Anh Văn'));

-- 49. ho biết sinh viên nào có điểm thi môn cơ sở dữ liệu lần 2 lớn hơn tất cả điểm 
-- thi lần 1 môn cơ sở dữ liệu của những sinh viên khác.
SELECT 
	kq.MaSV,
	kq.Diem
FROM ketqua kq
INNER JOIN dmmh mh ON mh.MaMH = kq.MaMH
WHERE kq.LanThi = 2 AND mh.TenMH LIKE('Cơ Sở Dữ Liệu')
HAVING kq.Diem >= ALL(SELECT kq.Diem
					FROM ketqua kq
					INNER JOIN dmmh mh ON mh.MaMH = kq.MaMH
					WHERE kq.LanThi = 1 AND mh.TenMH LIKE('Cơ Sở Dữ Liệu'));
                    
-- 50.Cho biết những sinh viên đạt điểm cao nhất trong từng môn.
SELECT 
    sv.TenSV,
	mh.TenMH,
    kq.Diem
FROM ketqua kq
INNER JOIN dmsv sv ON sv.MaSV = kq.MaSV
INNER JOIN dmmh mh ON mh.MaMH = kq.MaMH
WHERE kq.Diem >= ALL (SELECT max(kq.Diem)
				FROM ketqua kq
				INNER JOIN dmmh mh ON mh.MaMH = kq.MaMH
				GROUP BY mh.TenMH);
                
-- 51.Cho biết những khoa không có sinh viên học.
SELECT 
	k.MaKhoa,
    k.TenKhoa,
    count(sv.MaKhoa) solg
FROM dmkhoa k 
LEFT JOIN dmsv sv ON  sv.MaKhoa = k.MaKhoa
GROUP BY k.MaKhoa
HAVING solg = 0 ;

-- 52.Cho biết sinh viên chưa thi môn cơ sở dữ liệu.
SELECT * 
FROM dmsv
WHERE MaSV NOT IN (SELECT kq.MaSV
					FROM ketqua kq
					INNER JOIN dmmh mh ON mh.MaMH = kq.MaMH
					WHERE mh.TenMH LIKE('Cơ Sở Dữ Liệu')
					GROUP BY kq.MaSV);
                    
-- 53.Cho biết sinh viên nào không thi lần 1 mà có dự thi lần 2.
-- 54.Cho biết môn nào không có sinh viên khoa anh văn học.


-- 55.Cho biết những sinh viên khoa anh văn chưa học môn văn phạm.

-- 56.Cho biết những sinh viên không rớt môn nào.
-- 57.Cho biết những sinh viên học khoa anh văn có học bổng và những sinh viên 
-- chưa bao giờ rớt.
-- 58.Cho biết khoa nào có đông sinh viên nhận học bổng nhất và khoa nào khoa 
-- nào có ít sinh viên nhận học bổng nhất.
-- 59.Cho biết 3 sinh viên có học nhiều môn nhất.
-- 60.Cho biết những môn được tất cả các sinh viên theo học.
-- 61.Cho biết những sinh viên học những môn giống sinh viên có mã số A02 học.
-- 62.Cho biết những sinh viên học những môn bằng đúng những môn mà sinh viên A02 học