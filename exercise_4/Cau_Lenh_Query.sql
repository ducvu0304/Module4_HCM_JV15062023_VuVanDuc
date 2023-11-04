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
SELECT CONCAT(HoSV, ' ', TenSV) AS HoTen, Phai, NgaySinh
FROM DMSV
WHERE MONTH(NgaySinh) BETWEEN 1 AND 3
  AND YEAR(NgaySinh) = 1990;

-- 20.Cho biết thông tin về mức học bổng của các sinh viên, gồm: Mã sinh viên, 
-- Phái, Mã khoa, Mức học bổng. Trong đó, mức học bổng sẽ hiển thị là “Học 
-- bổng cao” nếu giá trị của field học bổng lớn hơn 500,000 và ngược lại hiển 
-- thị là “Mức trung bình”
select MaSV,
       Phai,
       MaKhoa,
       case
           when HocBong > 500000 then ' Học bổng cao'
           else 'Mức trung bình'
           end as MucHocBong
from dmsv;

-- 21.Cho biết tổng số sinh viên của toàn trường
select count(MaSV) as Soluong
from dmsv;

-- 22.Cho biết tổng sinh viên và tổng sinh viên nữ.
SELECT COUNT(*)                                AS TongSinhVien,
       COUNT(CASE WHEN Phai = 'Nữ' THEN 1 END) AS TongSinhVienNu
FROM DMSV;

-- 23.Cho biết tổng số sinh viên của từng khoa.
select dmkhoa.TenKhoa, count(MaSV) as TongSinhVien
from dmkhoa
         join dmsv on dmkhoa.MaKhoa = dmsv.MaKhoa
group by dmkhoa.TenKhoa;

-- 24.Cho biết số lượng sinh viên học từng môn.
SELECT DMMH.MaMH, DMMH.TenMH, COUNT(DISTINCT DMSV.MaSV) AS NumberOfStudents
FROM DMMH
         LEFT JOIN KetQua ON DMMH.MaMH = KetQua.MaMH
         LEFT JOIN DMSV ON KetQua.MaSV = DMSV.MaSV
GROUP BY DMMH.MaMH, DMMH.TenMH;

-- 25.Cho biết số lượng môn học mà sinh viên đã học(tức tổng số môn học có  trong bảng kq)
SELECT KetQua.MaSV, DMSV.HoSV, DMSV.TenSV, COUNT(DISTINCT KetQua.MaMH) AS NumberOfSubjects
FROM KetQua
         LEFT JOIN DMSV ON KetQua.MaSV = DMSV.MaSV
GROUP BY KetQua.MaSV, DMSV.HoSV, DMSV.TenSV;

-- 26.Cho biết tổng số học bổng của mỗi khoa.
select dmsv.MaKhoa, TenKhoa, count(HocBong) as SoLuongHocBong
from dmkhoa
         left join dmsv on dmkhoa.MaKhoa = dmsv.MaKhoa
group by dmsv.MaKhoa, TenKhoa;


-- 27.Cho biết học bổng cao nhất của mỗi khoa.
select dmsv.MaKhoa, TenKhoa, max(HocBong) as MaxHocBong
from dmkhoa
         left join dmsv on dmkhoa.MaKhoa = dmsv.MaKhoa
group by dmsv.MaKhoa, TenKhoa;

-- 28.Cho biết tổng số sinh viên nam và tổng số sinh viên nữ của mỗi khoa.
select dmsv.MaKhoa,
       TenKhoa,
       sum(case
               when Phai = 'Nam' then 1
               else 0 end
       ) as SoLuongNam,
       sum(case
               when Phai = 'Nữ' then 1
               else 0 end
       ) as SoLuongNữ
from dmkhoa
         left join dmsv on dmkhoa.MaKhoa = dmsv.MaKhoa
group by dmsv.MaKhoa, TenKhoa;

-- 29.Cho biết số lượng sinh viên theo từng độ tuổi.
SELECT CASE
           WHEN DATEDIFF(CURDATE(), DMSV.NgaySinh) / 365 <= 20 THEN '0 - 20'
           WHEN DATEDIFF(CURDATE(), DMSV.NgaySinh) / 365 <= 25 THEN '21 - 25'
           WHEN DATEDIFF(CURDATE(), DMSV.NgaySinh) / 365 <= 30 THEN '26 - 30'
           ELSE '31+'
           END          AS AgeGroup,
       COUNT(DMSV.MaSV) AS NumberOfStudents
FROM DMSV
GROUP BY AgeGroup;

-- 30.Cho biết những năm sinh nào có 2 sinh viên đang theo học tại trường.
SELECT YEAR(DMSV.NgaySinh) AS BirthYear, COUNT(DMSV.MaSV) AS StudentCount
FROM DMSV
GROUP BY BirthYear
HAVING COUNT(DMSV.MaSV) = 2;

-- 31.Cho biết những nơi nào có hơn 2 sinh viên đang theo học tại trường.
select NoiSinh
from dmsv
group by NoiSinh
having count(MaSV) >= 2;

-- 32.Cho biết những môn nào có trên 3 sinh viên dự thi.
select dmmh.MaMH, TenMH, count(distinct MaSV) as studentCount
from ketqua
         join dmmh on ketqua.MaMH = dmmh.MaMH
group by dmmh.MaMH, TenMH
having count(distinct MaSV) >= 3;

-- 33.Cho biết những sinh viên thi lại trên 2 lần.
select dmsv.MaSV, HoSV, TenSV, count(*) as ReExamCount
from ketqua
         join dmsv on ketqua.MaSV = dmsv.MaSV
where ketqua.LanThi > 1
group by dmsv.MaSV, TenSV
having count(*) >= 2;

-- 34.Cho biết những sinh viên nam có điểm trung bình lần 1 trên 7.0
select dmsv.MaSV, HoSV, TenSV, avg(Diem) as AveragerScore
from dmsv
         join ketqua on dmsv.MaSV = ketqua.MaSV
where Phai = 'Nam'
  and ketqua.LanThi = 1
group by dmsv.MaSV, HoSV, TenSV
having avg(Diem) > 7.0;

-- 35.Cho biết danh sách các sinh viên rớt trên 2 môn ở lần thi 1.
select dmsv.MaSV, HoSV, TenSV, count(*) as FailedCount
from dmsv
         join ketqua on dmsv.MaSV = ketqua.MaSV
where ketqua.LanThi = 1
  and ketqua.Diem < 5.0
group by dmsv.MaSV, HoSV, TenSV
having count(*) >= 2;

-- 36.Cho biết danh sách những khoa có nhiều hơn 2 sinh viên nam
SELECT DMKhoa.MaKhoa, DMKhoa.TenKhoa, COUNT(CASE WHEN DMSV.Phai = 'Nam' THEN 1 END) AS MaleStudentCount
FROM DMSV
         JOIN DMKhoa ON DMSV.MaKhoa = DMKhoa.MaKhoa
GROUP BY DMKhoa.MaKhoa, DMKhoa.TenKhoa
HAVING COUNT(CASE WHEN DMSV.Phai = 'Nam' THEN 1 END) >= 2;

-- 37.Cho biết những khoa có 2 sinh đạt học bổng từ 200.000 đến 300.000.
select dmsv.MaKhoa, TenKhoa, count(*) as HocBongCount
    from dmsv
    join dmkhoa on dmsv.MaKhoa = dmkhoa.MaKhoa
where HocBong between 100000 and 200000
group by dmsv.MaKhoa, TenKhoa
having count(*) >=2;

-- 38.Cho biết số lượng sinh viên đậu và số lượng sinh viên rớt của từng môn 
-- trong lần thi 1.
select dmmh.MaMH, TenMH,
       sum(case when Diem >=5 then 1 else 0 end) as Đậu,
       sum(case when Diem <5 then 1 else 0 end) as Rớt
    from dmmh
    join ketqua on dmmh.MaMH = ketqua.MaMH
    where LanThi =1
group by dmmh.MaMH, TenMH;

-- 39.Cho biết sinh viên nào có học bổng cao nhất.
select MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKhoa, HocBong
    from dmsv
    where HocBong = (select max(HocBong) from dmsv);
    
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
SELECT * 
FROM 
	(SELECT MaSV, MaMH
	 FROM ketqua
     WHERE LanThi = 2) AS A
LEFT JOIN 
	(SELECT MaSV, MaMH
	 FROM ketqua
	 WHERE LanThi  = 1
	 ORDER BY MaSV) AS B ON B.MaSV = A.MaSV AND B.MaMH = B.MaMH
HAVING B.MaSV IS NULL
ORDER BY A.MaSV

-- 54.Cho biết môn nào không có sinh viên khoa anh văn học.
SELECT 
	mh.TenMH
FROM dmmh mh
LEFT JOIN 
	(SELECT DISTINCT kq.MaMH MaMH, kq.MaSV MSV
	 FROM ketqua kq
     WHERE kq.MaSV IN (SELECT sv.MaSV
					   FROM dmsv sv
					   INNER JOIN dmkhoa k ON k.MaKhoa = sv.MaKhoa
					   WHERE k.TenKhoa LIKE('Anh Văn'))
	) AS B ON B.MaMH = mh.MaMH
WHERE B.MSV IS NULL;

-- 55.Cho biết những sinh viên khoa anh văn chưa học môn văn phạm.
SELECT sv.MaSV, sv.TenSV
FROM dmsv sv
INNER JOIN dmkhoa k ON k.MaKhoa = sv.MaKhoa
WHERE 
	k.TenKhoa LIKE ('Anh Văn') AND
    sv.MaSV NOT IN (SELECT kq.MaSV
					FROM ketqua kq
					INNER JOIN dmmh mh ON mh.MaMH = kq.MaMH
					WHERE mh.TenMH LIKE ('Văn Phạm'));
                    
-- 56.Cho biết những sinh viên không rớt môn nào.
SELECT sv.MaSV, concat(sv.HoSV, '', sv.TenSV) HoTen, kq.MaMH, kq.Diem, kq.LanThi
FROM dmsv sv
LEFT JOIN ketqua kq ON kq.MaSV = sv.MaSV
WHERE kq.Diem > 5;

-- 57.Cho biết những sinh viên học khoa anh văn có học bổng và những sinh viên 
-- chưa bao giờ rớt.
SELECT *
FROM dmsv sv
INNER JOIN dmkhoa k ON k.MaKhoa = sv.MaKhoa
WHERE k.TenKhoa LIKE('Anh Văn') AND sv.HocBong > 0;

-- 58.Cho biết khoa nào có đông sinh viên nhận học bổng nhất và khoa nào khoa 
-- nào có ít sinh viên nhận học bổng nhất.
SELECT 
	k.TenKhoa,
    count(sv.HocBong) so_lg
FROM dmsv sv
INNER JOIN dmkhoa k ON k.MaKhoa = sv.MaKhoa
WHERE sv.HocBong > 0
GROUP BY k.TenKhoa
HAVING count(sv.HocBong) 
IN 	  (SELECT max(A.so_lg) AS `Max`
	   FROM (SELECT k.TenKhoa, count(sv.HocBong) so_lg
			 FROM dmsv sv
			 INNER JOIN dmkhoa k ON k.MaKhoa = sv.MaKhoa
			 WHERE sv.HocBong > 0
			 GROUP BY k.TenKhoa) AS A);

-- 59.Cho biết 3 sinh viên có học nhiều môn nhất.
SELECT DISTINCT 
	kq.MaSV, 
    count(kq.MaSV) solg
FROM ketqua kq
GROUP BY kq.MaSV
ORDER BY  count(kq.MaSV) DESC
LIMIT 3;

-- 60.Cho biết những môn được tất cả các sinh viên theo học.
SELECT DISTINCT
	MaMH,
    count(MaMH) slg
FROM ketqua kq
GROUP BY MaMH
ORDER BY MaMH
LIMIT 1;

-- 61.Cho biết những sinh viên học những môn giống sinh viên có mã số A02 học.
SELECT DISTINCT A.MaSV
FROM 
	(SELECT DISTINCT MaSV, MaMH
	FROM quanlydiemsv.ketqua
	WHERE MaSV NOT LIKE ('A02')
	ORDER BY MaSV) AS A
INNER JOIN 
	(SELECT DISTINCT MaMH
	FROM ketqua kq
	WHERE MaSV = 'A02') AS B ON B.MaMH = A.MaMH;
    
-- 62.Cho biết những sinh viên học những môn bằng đúng những môn mà sinh viên A02 
SELECT  A.MaSV
FROM 
	(SELECT DISTINCT MaSV, MaMH
	FROM quanlydiemsv.ketqua
	WHERE MaSV NOT LIKE ('A02')
	ORDER BY MaSV) AS A
WHERE A.MaMH = ALL
	(SELECT DISTINCT MaMH
	FROM ketqua kq
	WHERE MaSV = 'A02');

