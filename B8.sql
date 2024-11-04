-- 1. Cập nhật số tiết của môn Văn phạm thành 45 tiết
UPDATE MonHoc 
SET SoTiet = 45 
WHERE TenMH = N'Văn phạm';
-- 2. Cập nhật tên của sinh viên Trần Thanh Mai thành Trần Thanh Kỳ
UPDATE SinhVien 
SET TenSV = N'Kỳ' 
WHERE HoSV = N'Trần' AND TenSV = N'Thanh Mai';
-- 3. Cập nhật phái của sinh viên Trần Thanh Kỳ thành phái Nam
UPDATE SinhVien 
SET Phai = 0 
WHERE HoSV = N'Trần' AND TenSV = N'Thanh Kỳ';
-- 4. Cập nhật ngày sinh của sinh viên Trần Thị Thu Thủy thành 05/07/1990
UPDATE SinhVien 
SET NgaySinh = '1990-07-05' 
WHERE HoSV = N'Trần' AND TenSV = N'Thị Thu Thủy';
-- 5. Tăng học bổng cho tất cả những sinh viên của khoa Anh Văn thêm 100,000
UPDATE SinhVien 
SET HocBong = HocBong + 100000 
WHERE MaKH = (SELECT MaKH FROM Khoa WHERE TenKH = N'Anh Văn');
-- 6. Cộng thêm 5 điểm môn Trí Tuệ Nhân Tạo cho các sinh viên thuộc khoa Anh Văn. Điểm tối đa của môn là 10
UPDATE Ketqua 
SET Diem = CASE 
                WHEN Diem + 5 > 10 THEN 10 
                ELSE Diem + 5 
            END
WHERE MaMH = (SELECT MaMH FROM MonHoc WHERE TenMH = N'Trí tuệ nhân tạo') 
AND MaSV IN (SELECT MaSV FROM SinhVien WHERE MaKH = (SELECT MaKH FROM Khoa WHERE TenKH = N'Anh Văn'));
-- 7. Tăng học bổng cho sinh viên theo mô tả:
-- Nếu là phái nữ của khoa Anh văn thì tăng 100,000
-- Phái nam của khoa Tin học thì tăng 150,000
-- Những sinh viên khác thì tăng 50,000
UPDATE SinhVien 
SET HocBong = CASE 
                   WHEN Phai = 1 AND MaKH = (SELECT MaKH FROM Khoa WHERE TenKH = N'Anh Văn') THEN HocBong + 100000
                   WHEN Phai = 0 AND MaKH = (SELECT MaKH FROM Khoa WHERE TenKH = N'Tin học') THEN HocBong + 150000
                   ELSE HocBong + 50000
               END;
-- 8. Thay đổi kết quả thi của các sinh viên theo mô tả:
-- Nếu sinh viên của khoa Anh văn thì tăng điểm môn Cơ sở dữ liệu lên 2 điểm
-- Nếu sinh viên của khoa Tin học thì giảm điểm môn Cơ sở dữ liệu xuống 1 điểm
-- Những sinh viên của khoa khác thì không thay đổi kết quả
-- Điểm nhỏ nhất là 0 và cao nhất là 10
UPDATE Ketqua 
SET Diem = CASE 
                WHEN MaMH = (SELECT MaMH FROM MonHoc WHERE TenMH = N'Cơ sở dữ liệu') 
                     AND MaSV IN (SELECT MaSV FROM SinhVien WHERE MaKH = (SELECT MaKH FROM Khoa WHERE TenKH = 'Anh Văn')) THEN 
                        CASE 
                            WHEN Diem + 2 > 10 THEN 10 
                            ELSE Diem + 2 
                        END
                WHEN MaMH = (SELECT MaMH FROM MonHoc WHERE TenMH = N'Cơ sở dữ liệu') 
                     AND MaSV IN (SELECT MaSV FROM SinhVien WHERE MaKH = (SELECT MaKH FROM Khoa WHERE TenKH = 'Tin học')) THEN 
                        CASE 
                            WHEN Diem - 1 < 0 THEN 0 
                            ELSE Diem - 1 
                        END
                ELSE Diem 
            END;




