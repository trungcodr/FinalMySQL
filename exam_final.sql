create database PetSpaManagement;

use PetSpaManagement;

create table KhachHang(
	IdKhachHang int primary key auto_increment,
    HoTen varchar(100) not null,
	NgaySinh date ,
    GioiTinh enum ('Nam', 'Nu', 'Khac'),
    DiaChi varchar(200),
	SDT varchar(15),
    Email varchar(100),
    unique(SDT, Email)
);

create table NhanVien(
	IdNhanVien int primary key auto_increment,
    HoTen VARCHAR(100) NOT NULL,
    NgaySinh DATE,
    GioiTinh ENUM('Nam', 'Nữ', 'Khác'),
    SDT VARCHAR(15),
    Email VARCHAR(100),
    unique(SDT,Email),
    VaiTro varchar(100)
);

create table ThuCung(
	IdThuCung int primary key auto_increment,
    TenThuCung varchar(100) not null,
    GiongLoai varchar(100),
    Tuoi int check (Tuoi > 0),
    GioiTinh enum('Đực', 'Cái'),
    IdKhachHang int,
    foreign key (IdKhachHang) references KhachHang(IdKhachHang)
);

create table DichVu(
	IdDichVu int primary key auto_increment,
    TenDichVu varchar(100) not null,
    MoTa text,
    GiaTien decimal (10,2) not null check (GiaTien > 0)
);

create table LichHen(
	IdLichHen int primary key auto_increment,
	NgayDatLich datetime not null,
    TrangThai enum('Đã lên lịch', 'Đã hoàn thành', 'Đã hủy'),
    IdKhachHang int,
    IdNhanVien int,
    IdThuCung int,
    IdDichVu int,
    foreign key (IdKhachHang) references KhachHang(IdKhachHang),
    foreign key (IdNhanVien) references NhanVien(IdNhanVien),
    foreign key (IdThuCung) references ThuCung(IdThuCung),
    foreign key (IdDichVu) references DichVu(IdDichVu)
);

create table ThanhToan(
	IdThanhToan int primary key auto_increment,
    IdKhachHang int not null,
    TongTien decimal(10,2) not null,
	ThoiGianThanhToan datetime,
    PhuongThucThanhToan enum('Tiền mặt', 'Thẻ ngân hàng', 'Chuyển khoản'),
	TrangThai enum ('Đã thanh toán', 'Chưa thanh toán'),
    foreign key (IdKhachHang) references KhachHang(IdKhachHang)
);


create table LichLamViec(
	IdLichLamViec int primary key auto_increment,
    NgayLam date not null,
    ThoiGianBatDau time not null,
    ThoiGianKetThuc time not null,
    IdNhanVien int,
    foreign key (IdNhanVien) references NhanVien(IdNhanVien)
);

create table DanhGia(
	IdDanhGia int primary key auto_increment,
    IdKhachHang int,
    IdDichVu int,
    DanhGia int check (DanhGia between 1 and 5),
    BinhLuan text,
    NgayDanhGia datetime default current_timestamp,
    foreign key (IdKhachHang) references KhachHang(IdKhachHang),
    foreign key (IdDichVu) references DichVu(IdDichVu)
);

CREATE TABLE VatTu (
    IdVatTu INT PRIMARY KEY AUTO_INCREMENT,
    TenVatTu VARCHAR(100) NOT NULL,
    SoLuong INT NOT NULL,
    DonGia DECIMAL(10, 2) NOT NULL
);

CREATE TABLE NhaCungCap (
    IdNhaCungCap INT PRIMARY KEY AUTO_INCREMENT,
    TenNhaCungCap VARCHAR(100) NOT NULL,
    NguoiLienHe VARCHAR(100),
    SDT VARCHAR(15),
    Email VARCHAR(100),
    DiaChi VARCHAR(255)
);

CREATE TABLE NhaCungCap_VatTu (
	ID int primary key auto_increment,
    IdNhaCungCap INT,
    IdVatTu INT,
    unique(IdNhaCungCap,IdVatTu),
    FOREIGN KEY (IdNhaCungCap) REFERENCES NhaCungCap(IdNhaCungCap),
    FOREIGN KEY (IdVatTu) REFERENCES VatTu(IdVatTu) 
);

-- Insert dữ liệu vào các bảng:
INSERT INTO KhachHang (HoTen, NgaySinh, GioiTinh, DiaChi, SDT, Email) VALUES
('Nguyen Van A', '1990-05-10', 'Nam', 'Hà Nội', '0987654321', 'a@gmail.com'),
('Tran Thi B', '1995-09-15', 'Nu', 'Hồ Chí Minh', '0912345678', 'b@gmail.com'),
('Le Van C', '1987-07-20', 'Nam', 'Đà Nẵng', '0909876543', 'c@gmail.com'),
('Pham Thi D', '2000-03-25', 'Nu', 'Cần Thơ', '0934567890', 'd@gmail.com'),
('Hoang Van E', '1993-11-30', 'Nam', 'Hải Phòng', '0923456789', 'e@gmail.com'),
('Dang Thi F', '1989-02-18', 'Nu', 'Bình Dương', '0911223344', 'f@gmail.com'),
('Bui Van G', '1992-06-12', 'Nam', 'Nha Trang', '0976543210', 'g@gmail.com'),
('Nguyen Thi H', '1997-08-22', 'Nu', 'Huế', '0965432109', 'h@gmail.com'),
('Pham Van I', '1994-10-05', 'Nam', 'Đà Lạt', '0954321098', 'i@gmail.com'),
('Le Thi J', '1985-12-08', 'Nu', 'Vũng Tàu', '0943210987', 'j@gmail.com');
select * from KhachHang;

INSERT INTO NhanVien (HoTen, NgaySinh, GioiTinh, SDT, Email, VaiTro) VALUES
('Nguyen Van K', '1980-04-10', 'Nam', '0981111111', 'k@gmail.com', 'Quản lý'),
('Tran Thi L', '1992-09-20', 'Nu', '0972222222', 'l@gmail.com', 'Bác sĩ'),
('Le Van M', '1988-07-15', 'Nam', '0963333333', 'm@gmail.com', 'Bác sĩ'),
('Pham Thi N', '1995-03-12', 'Nu', '0954444444', 'n@gmail.com', 'Nhân viên CSKH'),
('Hoang Van O', '1993-11-28', 'Nam', '0945555555', 'o@gmail.com', 'Nhân viên CSKH'),
('Dang Thi P', '1990-02-05', 'Nu', '0936666666', 'p@gmail.com', 'Lễ tân'),
('Bui Van Q', '1991-06-25', 'Nam', '0927777777', 'q@gmail.com', 'Bác sĩ'),
('Nguyen Thi R', '1987-08-18', 'Nu', '0918888888', 'r@gmail.com', 'Lễ tân'),
('Pham Van S', '1984-10-01', 'Nam', '0909999999', 's@gmail.com', 'Bác sĩ'),
('Le Thi T', '1996-12-11', 'Nu', '0890000000', 't@gmail.com', 'Nhân viên CSKH');

INSERT INTO ThuCung (TenThuCung, GiongLoai, Tuoi, GioiTinh, IdKhachHang) VALUES
('Bobby', 'Chó Poodle', 3, 'Đực', 1),
('Mimi', 'Mèo Ba Tư', 2, 'Cái', 2),
('Tom', 'Chó Husky', 4, 'Đực', 3),
('Jerry', 'Chuột Hamster', 1, 'Cái', 4),
('Rocky', 'Chó Becgie', 5, 'Đực', 5),
('Lulu', 'Mèo Anh lông ngắn', 3, 'Cái', 6),
('Coco', 'Chó Corgi', 2, 'Cái', 7),
('Bunny', 'Thỏ cảnh', 1, 'Cái', 8),
('Max', 'Chó Phốc sóc', 2, 'Đực', 9),
('Bella', 'Mèo Ragdoll', 4, 'Cái', 10);
select * from ThuCung;

INSERT INTO DichVu (TenDichVu, MoTa, GiaTien) VALUES
('Cắt tỉa lông', 'Cắt tỉa lông cho thú cưng', 200000),
('Tắm rửa', 'Dịch vụ tắm rửa vệ sinh', 150000),
('Khám tổng quát', 'Kiểm tra sức khỏe toàn diện', 300000),
('Tiêm phòng', 'Tiêm phòng các loại bệnh phổ biến', 250000),
('Chăm sóc răng miệng', 'Làm sạch răng cho thú cưng', 180000),
('Massage thú cưng', 'Thư giãn, giảm stress', 220000),
('Dịch vụ trông giữ', 'Giữ thú cưng theo giờ/ngày', 500000),
('Dịch vụ phẫu thuật', 'Phẫu thuật thú y chuyên nghiệp', 1000000),
('Chăm sóc da', 'Điều trị bệnh ngoài da', 270000),
('Huấn luyện cơ bản', 'Dạy các lệnh cơ bản cho chó/mèo', 600000);
select * from DichVu;

INSERT INTO LichHen (NgayDatLich, TrangThai, IdKhachHang, IdNhanVien, IdThuCung, IdDichVu) VALUES
('2025-02-10 10:00:00', 'Đã lên lịch', 1, 1, 1, 1),
('2025-02-11 11:00:00', 'Đã hoàn thành', 2, 2, 2, 2),
('2025-02-12 14:00:00', 'Đã lên lịch', 3, 3, 3, 3),
('2025-02-13 15:00:00', 'Đã hủy', 4, 4, 4, 4),
('2025-02-14 09:00:00', 'Đã hoàn thành', 5, 5, 5, 5),
('2025-02-15 16:00:00', 'Đã lên lịch', 6, 6, 6, 6),
('2025-02-16 13:00:00', 'Đã hoàn thành', 7, 7, 7, 7),
('2025-02-17 12:00:00', 'Đã hủy', 8, 8, 8, 8),
('2025-02-18 17:00:00', 'Đã lên lịch', 9, 9, 9, 9),
('2025-02-19 11:30:00', 'Đã hoàn thành', 10, 10, 10, 10),
('2025-02-20 17:00:00', 'Đã lên lịch', 10, 5, 10, 8);

select * from LichHen;

INSERT INTO ThanhToan (IdKhachHang, TongTien, ThoiGianThanhToan, PhuongThucThanhToan,TrangThai) VALUES
(1, 500000, '2025-02-10 10:30:00', 'Tiền mặt','Đã thanh toán'),
(2, 300000, '2025-02-11 14:45:00', 'Chuyển khoản','Đã thanh toán'),
(3, 450000, '2025-02-12 09:20:00', 'Thẻ ngân hàng','Đã thanh toán'),
(4, 600000, null, 'Tiền mặt','Chưa thanh toán'),
(5, 700000, '2025-02-14 11:05:00', 'Chuyển khoản','Đã thanh toán'),
(6, 250000, '2025-02-15 13:40:00', 'Thẻ ngân hàng','Đã thanh toán'),
(7, 800000, null, 'Tiền mặt','Chưa thanh toán'),
(8, 900000, '2025-02-17 12:50:00', 'Chuyển khoản','Đã thanh toán'),
(9, 150000, '2025-02-18 10:15:00', 'Thẻ ngân hàng','Đã thanh toán'),
(10, 350000, null, 'Tiền mặt','Chưa thanh toán');
select * from ThanhToan;

INSERT INTO LichLamViec (NgayLam, ThoiGianBatDau, ThoiGianKetThuc, IdNhanVien) VALUES
('2025-02-10', '08:00:00', '17:00:00', 1),
('2025-02-11', '09:00:00', '18:00:00', 2),
('2025-02-12', '10:00:00', '19:00:00', 3),
('2025-02-13', '08:30:00', '17:30:00', 4),
('2025-02-14', '09:30:00', '18:30:00', 5),
('2025-02-15', '07:30:00', '16:30:00', 6),
('2025-02-16', '08:00:00', '17:00:00', 7),
('2025-02-17', '10:00:00', '19:00:00', 8),
('2025-02-18', '09:00:00', '18:00:00', 9),
('2025-02-19', '08:30:00', '17:30:00', 10);
select * from LichLamViec;

INSERT INTO DanhGia (IdKhachHang, IdDichVu, DanhGia, BinhLuan, NgayDanhGia) VALUES
(1, 1, 5, 'Dịch vụ tuyệt vời, rất hài lòng!', '2025-02-10 12:00:00'),
(2, 2, 4, 'Dịch vụ tốt nhưng cần cải thiện tốc độ.', '2025-02-11 14:30:00'),
(3, 3, 5, 'Mọi thứ đều hoàn hảo, tôi rất hài lòng!', '2025-02-12 16:45:00'),
(4, 4, 3, 'Dịch vụ ổn, nhưng có thể cải thiện chất lượng.', '2025-02-13 09:10:00'),
(5, 5, 4, 'Dịch vụ khá tốt, nhân viên nhiệt tình.', '2025-02-14 13:20:00'),
(6, 6, 5, 'Thật tuyệt vời, tôi sẽ quay lại!', '2025-02-15 15:30:00'),
(7, 7, 5, 'Dịch vụ rất tốt, không có gì để chê.', '2025-02-16 10:00:00'),
(8, 8, 4, 'Chất lượng dịch vụ ổn, có thể cải thiện thêm.', '2025-02-17 14:40:00'),
(9, 9, 3, 'Dịch vụ chưa đạt như kỳ vọng, cần cải thiện.', '2025-02-18 11:10:00'),
(10, 10, 5, 'Rất hài lòng, dịch vụ rất chu đáo!', '2025-02-19 17:25:00');

INSERT INTO VatTu (TenVatTu, SoLuong, DonGia) VALUES
('Cát vệ sinh cho mèo', 50, 100000),
('Máng ăn cho chó', 30, 150000),
('Lồng nuôi chó', 20, 300000),
('Thức ăn cho mèo', 100, 80000),
('Khăn tắm cho thú cưng', 60, 50000),
('Bộ đồ chơi cho chó', 40, 200000),
('Chuồng cho thỏ', 15, 250000),
('Bột tẩy rửa lồng', 70, 120000),
('Dây xích cho chó', 80, 60000),
('Chậu tắm cho mèo', 50, 180000);

INSERT INTO NhaCungCap (TenNhaCungCap, NguoiLienHe, SDT, Email, DiaChi) VALUES
('Nha Cung Cấp A', 'Nguyen Thi Lan', '0981234567', 'a@gmail.com', 'Hà Nội'),
('Nha Cung Cấp B', 'Tran Thi Mai', '0912345678', 'b@gmail.com', 'Hồ Chí Minh'),
('Nha Cung Cấp C', 'Le Thi Lan', '0909876543', 'c@gmail.com', 'Đà Nẵng'),
('Nha Cung Cấp D', 'Pham Thi Minh', '0934567890', 'd@gmail.com', 'Cần Thơ'),
('Nha Cung Cấp E', 'Hoang Thi Lan', '0943210987', 'e@gmail.com', 'Hải Phòng'),
('Nha Cung Cấp F', 'Dang Thi Bao', '0911223344', 'f@gmail.com', 'Bình Dương'),
('Nha Cung Cấp G', 'Bui Thi Lan', '0976543210', 'g@gmail.com', 'Nha Trang'),
('Nha Cung Cấp H', 'Nguyen Thi Mai', '0965432109', 'h@gmail.com', 'Huế'),
('Nha Cung Cấp I', 'Pham Thi Bao', '0954321098', 'i@gmail.com', 'Đà Lạt'),
('Nha Cung Cấp J', 'Le Thi Minh', '0943210987', 'j@gmail.com', 'Vũng Tàu');

INSERT INTO NhaCungCap_VatTu (IdNhaCungCap, IdVatTu) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(4, 7),
(4, 8),
(5, 9),
(5, 10),
(6, 1),
(6, 3),
(7, 2),
(7, 5),
(8, 6),
(8, 7),
(9, 8),
(9, 9),
(10, 10);

/*Lấy ra nhân viên có giới tính là nam và có vai trò là bác sĩ*/
select *
from NhanVien nv
where nv.GioiTinh = 'Nam' and nv.VaiTro = 'Bác sĩ';

/*Lấy ra Khách hàng địa chỉ là hà nội hoặc cần thơ*/
select * 
from KhachHang kh
where kh.DiaChi = 'Hà Nội' or kh.DiaChi = 'Cần Thơ';

/*Lấy ra các thanh toán mà phương thức thanh toán không phải tiền mặt*/
select * 
from ThanhToan tt
where not tt.PhuongThucThanhToan = 'Tiền mặt';

/*Lay ra dich vu co gia tien cao nhat*/
select *
from DichVu 
where GiaTien = (select max(GiaTien) from DichVu);

/*Lay ra tat ca nhan vien va sap xep ho ten tu cao xuong thap*/
select * 
from NhanVien nv
order by nv.HoTen desc;

/*Thong ke so lan khach hang dat lich hen, chi hien thi khach hang da len lich*/
select kh.IdKhachHang, kh.HoTen, count(lh.IdKhachHang) as 'So lan dat lich'
from KhachHang kh
join LichHen lh
on kh.IdKhachHang = lh.IdKhachHang
group by kh.IdKhachHang, kh.HoTen
having count(lh.IdLichHen) >= 2;

/*Tinh so tien trung binh ma cac khach hang da thanh toan*/
select avg(TongTien) as 'So tien trung binh'
from ThanhToan
where ThanhToan.TrangThai = 'Đã thanh toán';

/*Tinh tong so tien cua vat tu. hien thi ra id vật tư, tên vật tư id nhà cung cấp, tên nhà cung cấp*/
select vt.IdVatTu, vt.TenVatTu, sum(vt.DonGia* vt.SoLuong) as 'Tong so tien mua vat tu', ncc.IdNhaCungCap, ncc.TenNhaCungCap
from VatTu vt
join NhaCungCap_VatTu nccvt on nccvt.IdVatTu = vt.IdVatTu
join NhaCungCap ncc on ncc.IdNhaCungCap = nccvt.IdNhaCungCap
group by vt.IdVatTu, vt.TenVatTu, ncc.IdNhaCungCap,ncc.TenNhaCungCap;

/*Tinh tong so tien phai mua vat tu*/
select sum(vt.DonGia * vt.SoLuong) as 'Tong so tien mua'
from VatTu vt;

/*Lay tat ca khach hang co ho ten bat dau bang chu N*/
select * 
from KhachHang
where HoTen like 'N%';

/*Lấy tất cả thú cưng thuộc giống Bergi, chuột hamster, thỏ cảnh*/
select * 
from ThuCung
where GiongLoai in ('Chó Becgie', 'Chuột Hamster','Thỏ Cảnh');

/*Tạo VIEW hiển thị danh sách nhân viên cùng với số lượng lịch hẹn mà họ đã xử lý 
(bao gồm cả hoàn thành, hủy, và lên lịch).*/
create view ViewShowListEmployee as
select nv.IdNhanVien, nv.HoTen, count(lh.IdLichHen) as 'Số lượng lịch hẹn'
from NhanVien nv
join LichHen lh
on nv.IdNhanVien = lh.IdNhanVien
group by nv.IdNhanVien, nv.HoTen;

select * from ViewShowListEmployee;

/*Tạo VIEW hiển thị tổng doanh thu của từng dịch vụ (chỉ tính lịch hẹn đã hoàn thành).*/
create view ViewGetSumService as
select dv.IdDichVu, dv.TenDichVu, sum(dv.GiaTien) 
from DichVu dv
join LichHen lh
on dv.IdDichVu = lh.IdDichVu
where lh.TrangThai = 'Đã hoàn thành'
group by dv.IdDichVu, dv.TenDichVu;

select * from ViewGetSumService;

/*Tạo Procedure để kiểm tra xem một nhân viên có làm việc vào một ngày cụ thể không*/
delimiter //
create procedure CheckWorkingDate(
	in p_IdNhanVien int, 
	in p_NgayLam date
)
begin 
	declare soLuong int;
	select count(*) into soLuong
    from LichLamViec
    where IdNhanVien = p_IdNhanVien and NgayLam = p_NgayLam;
    
    if soLuong > 0 then
		select 'Nhân viên có lịch làm việc' as 'Kết quả';
	else
		select 'Nhân viên không có lịch làm việc' as 'Kết quả';
	end if;
    
end //
delimiter ;

call CheckWorkingDate(1,'2025-02-10');
call CheckWorkingDate(3,'2025-02-10');

/*Viết một hàm để lấy số lượng đánh giá của một dịch vụ*/
delimiter //
create function GetRating(f_IdDichVu int)
returns int
deterministic
begin
	declare SoLuong int;
    select count(*) into SoLuong
    from DanhGia
    where DanhGia.IdDichVu = f_IdDichVu;
    
    return SoLuong ;
end //
delimiter ;

select GetRating(1) as 'Só lượng đánh giá 1 dịch vụ';













