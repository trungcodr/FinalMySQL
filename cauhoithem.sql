use PetSpaManagement;

/*Tim ra khach hang danh gia nhieu nhat*/
create view View_KhachHang_DanhGia as
select
    KH.IdKhachHang,
    KH.HoTen,
    count(DG.IdDanhGia) as TongSoDanhGia
from KhachHang KH
left join DanhGia DG on KH.IdKhachHang = DG.IdKhachHang
group by KH.IdKhachHang, KH.HoTen;

select * 
from View_KhachHang_DanhGia
where TongSoDanhGia = (
    select max(TongSoDanhGia) from View_KhachHang_DanhGia
);


/*Tim ra so dich vu khach hang su dung ten khach hang so dich vu*/
select kh.HoTen, count(lh.IdDichVu) as SoDichVusuDung
from KhachHang kh
join LichHen lh
on kh.IdKhachHang = lh.IdKhachHang
group by kh.HoTen;

/* function de dem so lich hen cua khach hang*/
delimiter //
create function LayLichHenKh(
	 f_IdKhachHang int
)
returns int
deterministic
begin
	declare ketQua int;
    
	select count(*) into ketQua from LichHen
    where IdKhachHang = p_IdKhachHang;
    
    if ketQua = 0 then
		return 'Khong co lich hen nao';
	end if;
    
    return ketQua;
end //
delimiter ;

select LayLichHenKh(1) as 'Thong bao';
select LayLichHenKh(11) as 'Thong bao';

-- procedure de lay ra thong tin nha cung cap vat tu dua tren id nha cung cap
delimiter //
create procedure LayThongTinNCC(
 in p_IdNhaCungCap int
)
begin 
	select ncc.IdNhaCungCap, ncc.TenNhaCungCap, vt.IdVatTu, vt.TenVatTu, vt.SoLuong
    from NhaCungCap ncc
    join NhaCungCap_VatTu nccvt on ncc.IdNhaCungCap = nccvt.IdNhaCungCap
    join VatTu vt on nccvt.IdVatTu = vt.IdVatTu
    where ncc.IdNhaCungCap = p_IdNhaCungCap;
    
end //
delimiter ;

call LayThongTinNCC(2);


-- Lay ra nhan vien co nhieu lich lam viec nhat
create view View_NhanVien_LichLamViec as
select
    nv.IdNhanVien,
    nv.HoTen,
    count(llv.IdLichLamViec) as TongSoLichLamViec
from NhanVien nv
left join LichLamViec llv on nv.IdNhanVien = llv.IdNhanVien
group by nv.IdNhanVien, nv.HoTen;

select * 
from View_NhanVien_LichLamViec
where TongSoLichLamViec = (
    select max(TongSoLichLamViec) from View_NhanVien_LichLamViec
);













