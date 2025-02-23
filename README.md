# FinalMySQL
Mô Tả Dự Án: Thiết Kế Cơ Sở Dữ Liệu Quản Lý Pet Spa
1. Mục Tiêu Dự Án
Xây dựng một hệ thống cơ sở dữ liệu để quản lý hoạt động của một Pet Spa, bao gồm:
- Quản lý thông tin khách hàng và thú cưng.
- Quản lý lịch hẹn và dịch vụ.
- Quản lý thanh toán.
- Quản lý thông tin và lịch làm việc của nhân viên.
- Quản lý vật tư và nhà cung cấp.
- Lưu trữ đánh giá của khách hàng về dịch vụ.
Làm quen với một quy trình thiết kế database, áp dụng được các kiến thức đã học vào dự án.
2. Các Bảng Chính và Mối Quan Hệ
- 2.1 Bảng KhachHang
  - Lưu trữ thông tin khách hàng.
  - Các trường: IdKhachHang, HoTen,NgaySinh,GioiTinh,DiaChi,SDT,Email.
  - Mối quan hệ:
     - 1:N với ThuCung --> Một khách hàng có thể có nhiều thú cưng .
     - 1:N với LichHen --> Một khách hàng có thể đặt nhiều lịch hẹn.
     - 1:N với DanhGia --> Một khách hàng có thể để lại nhiều đánh giá.
       
- 2.2 Bảng ThuCung
  - Lưu trữ thông tin thú cưng của khách hàng.   
  - Các trường: IdThuCung, IdKhachHang, TenThuCung,GiongLoai,Tuoi,GioiTinh.
  - Mối quan hệ:
      - N:1 với KhachHang --> Mỗi thú cưng thuộc về một khách hàng .
      - 1:N với LichHen --> Một thú cưng có thể có nhiều lịch hẹn .
        
- 2.3. Bảng DichVu
  - Lưu trữ thông tin các dịch vụ mà Pet Spa cung cấp.
  - Các trường:  IdDichVu, TenDichVu, MoTa, GiaTien.
  - Mối quan hệ:
    - 1:N với LichHen --> Một dịch vụ có thể được đặt trong nhiều lịch hẹn .
    - 1:N với DanhGia --> Một dịch vụ có thể nhận được nhiều đánh giá.
      
- 2.4. Bảng NhanVien
  - Lưu trữ thông tin nhân viên.
  - Các trường: IdNhanVien, HoTen, NgaySinh, GioiTinh, SDT, Email, VaiTro.
  - Mối quan hệ:
    - 1:N với LichHen --> Một nhân viên có thể phục vụ nhiều lịch hẹn.
    - 1:N với LichLamViec --> Một nhân viên có thể có nhiều lịch làm việc .
      
- 2.5. Bảng LichHen
  - Lưu trữ thông tin lịch hẹn của khách hàng.
  - Các trường: IdLichHen, NgayDatLich, TrangThai, IdKhachHang, IdNhanVien, IdThuCung, IdDichVu.
  - Mối quan hệ:
    - Mỗi LichHen liên quan đến một KhachHang, một ThuCung, một DichVu, và một NhanVien.
      
- 2.6. Bảng ThanhToan
  - Lưu trữ thông tin hóa đơn.
  - Các trường: IdThanhToan, IdKhachHang, TongTien, ThoiGianThanhToan, PhuongThucThanhToan, TrangThai.
  - Mối quan hệ:
    - N:1 với KhachHang --> Một khách hàng có thể có nhiều thanh toán.
      
- 2.7. Bảng LichLamViec
  - Lưu trữ lịch làm việc của nhân viên.
  - Các trường: IdLichLamViec, IdNhanVien, NgayLam, ThoiGianBatDau, ThoiGianKetThuc.
  - Mối quan hệ:
    - N:1 với NhanVien --> Một nhân viên có thể có nhiều lịch làm việc.
      
- 2.8. Bảng DanhGia
  - Lưu trữ đánh giá của khách hàng về dịch vụ.
  - Các trường: IdDanhGia, IdKhachHang, IdDichVu, DanhGia, BinhLuan, NgayDanhGia.
  - Mối quan hệ:
    - N:1 với khách hàng --> Một khách hàng có thể đánh giá nhiều dịch vụ.
    - N:1 với DichVu --> Một dịch vụ có thể có nhiều đánh giá.
      
- 2.9. Bảng VatTu
  - Lưu trữ thông tin vật tư sử dụng trong Pet Spa.
  - Các trường: IdVatTu, TenVatTu, SoLuong, DonGia.
  - Mối quan hệ:
    - N:N với NhaCungCap thông qua bảng NhaCungCap_VatTu --> Một nhà cung cấp có thể cung cấp nhiều vật tư, một vật tư có thể bán bởi nhiều nhà cung cấp.
      
- 2.10. Bảng NhaCungCap
  - Lưu trữ thông tin nhà cung cấp vật tư.
  - Các trường: IdNhaCungCap, TenNhaCungCap, NguoiLienHe, SDT, Email, DiaChi.
  - Mối Quan hệ:
    - N:N với VatTu thông qua bảng NhaCungCap_VatTu.
    
3. Ảnh Diagram và mối quan hệ giữa các bảng
![Screenshot (1627)](https://github.com/user-attachments/assets/fc16d361-c1a0-41ba-ac38-0f4e301c27f7)
