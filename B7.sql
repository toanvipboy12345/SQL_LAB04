-- 1. Viết câu truy vấn để tạo bảng có tên DeleteTable gồm các thông tin sau: Mã sinh viên, Họ tên sinh viên, Phái, Ngày sinh, Nơi sinh, Tên khoa, Học bổng
CREATE TABLE DeleteTable (
    MaSV NVARCHAR(10),
    HoTen NVARCHAR(100),
    Phai BIT,
    NgaySinh DATE,
    NoiSinh NVARCHAR(100),
    TenKhoa NVARCHAR(100),
    HocBong FLOAT
);
-- 2. Xoá tất cả những sinh viên không có học bổng trong bảng DeleteTable
DELETE FROM DeleteTable
WHERE HocBong IS NULL OR HocBong = 0;
-- 3. Xoá tất cả những sinh viên trong bảng DeleteTable sinh vào ngày 20/12/1987
DELETE FROM DeleteTable
WHERE NgaySinh = '1987-12-20';
-- 4. Xoá tất cả những sinh viên trong bảng DeleteTable sinh trước tháng 3 năm 1987
DELETE FROM DeleteTable
WHERE NgaySinh < '1987-03-01';
-- 5. Xoá tất cả những sinh viên nam của khoa Tin học trong bảng DeleteTable
DELETE FROM DeleteTable
WHERE Phai = 0 AND TenKhoa = 'Tin học';
