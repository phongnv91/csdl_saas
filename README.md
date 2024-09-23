# 1.PHÂN TÍCH THIẾT KẾ
## 1.1. Xác định yêu cầu
### 1.1.1. Chức năng của dự án: 
    Hệ thống cơ sở dữ liệu cho nền tảng Saas    
### 1.1.2. Đặt vấn đề:
    - Hệ thống hỗ trợ nhiều Cửa Hàng.
    - Mỗi Khách Hàng cần 1 tài khoản đăng nhập nhưng có thể giao hàng ở nhiều địa điểm khách nhau.
    - Có nhiều Danh Mục với nhiều cấp để phân loại sản phẩm, và mỗi danh mục sẽ có các thuộc tính riêng để mô tả sản phẩm.
    - Các Sản Phẩm sẽ thuộc từng Cửa Hàng, Danh Mục và cho phép Cửa Hàng phân loại sản phẩm theo nhu cầu, các Sản Phẩm cho phép người dùng đánh giá, nhận xét.
    - Có nhiều Đối Tác Vận Chuyển và mỗi Đối Tác sẽ có nhiều Phương Thức Vận Chuyển với mức giá và thời gian khác nhau.
    - Mỗi Khách Hàng có thể mua nhiều Đơn Hàng, và Mỗi Đơn Hàng sẽ có nhiều sản phẩm và mỗi loại có thể mua số lượng khác nhau.
    - Địa Chỉ có có thể được đưa ra để phân loại.
    - Có một số Log theo yêu cầu  
##  1.2. Thiết kế chi tiết
### 1.2.1. Thiết kế các bảng dữ liệu
### 1.2.1.1. Bảng phục vụ thông tin Địa Chỉ:
    1) TinhTp : Các địa điểm Tỉnh, Thành Phố trên cả Nước
      - TinhTpId int [primary key, increment] -> Khóa chính, tự tăng.
      - Ten nvarchar(50) -> Tên của Tỉnh, Thành Phố.
      
    2) HuyenQuan: Các địa điểm Huyện, Quận trên cả Nước
      - HuyenQuanId int [primary key, increment] -> Khóa chính, tự tăng
      - TinhTpId int -> Id của Tỉnh, Thành Phố mà Huyện, Quận đó trực thuộc
      - Ten nvarchar(50) -> Tên của Huyện, Quận
      
    3) XaPhuong: Các địa điểm Xã, Phường trên cả Nước
      - XaPhuongId int [primary key, increment] -> Khóa chính, tự tăng
      - HuyenQuanId int -> Id của Huyện, Quận mà Xã, Phường đó trực thuộc
      - Ten nvarchar(50) -> Tên của Xã, Phường  
### 1.2.1.2. Bảng phục vụ thông tin Cửa Hàng
    1) NganHang : Các ngân hàng và thông tin
      - NganHangId int [primary key, increment] -> Khóa chính, tự tăng
      - Code varchar(20) -> Mã ngân hàng
      - Ten nvarchar(50) -> Tên ngân hàng
        
    2) CuaHang: Thông tin mỗi Row là 1 cửa hàng
      - CuaHangId int [primary key, increment]) -> Khóa chính, tự tăng
      - Ten nvarchar(200) -> Tên cửa hàng
      - MoTa nvarchar(1000) -> Mô tả ngắn về cửa hàng
      - DienThoai varchar(20) -> Số điện thoại của cửa hàng
      - Email varchar(50) -> Email liên hệ
      - NganHangId int -> Id của ngân hàng
      - SoTk varchar(20) -> Số tài khoản ngân hàng
      - DiaChi nvarchar(200) -> Địa chỉ cụ thể. Vd: Số 01, Lê Văn Lương
      - TinhTpId int -> Id của Tỉnh, Thành Phố 
      - HuyenQuanId int -> Id của Huyện, Quận
      - XaPhuongId int -> Id của Xã, Phường
      - UpdatedAt datetime -> Thời gian cập nhật
      - CreatedAt datetime  -> Thời gian tạo

    3) CuaHangDanhMuc: Lưu lại các danh mục hàng hóa mà Cửa Hàng đang bán
      - ChdmId bigint [primary key, increment] -> Khóa chính, tự tăng
      - CuaHangId int -> Id của Cửa Hàng
      - DanhMucId int -> Id của Danh mục
      - CreatedAt datetime -> Thời gian tạo
        
### 1.2.1.3. Bảng phục vụ thông tin Khách Hàng
    1) KhachHang : Thông tin mỗi Row là 1 khách hàng
      - KhachHangId int [primary key, increment] -> Khóa chính, tự tăng
      - Username varchar(50) -> Tên đăng nhập
      - Password varchar(50) -> Mật khẩu đăng nhập
      - HoTen nvarchar(50) -> Họ tên
      - NgaySinh varchar(20) - > Ngày sinh
      - GioiTinh bit -> Giới tính: 0: Nữ | 1: Nam
      - DienThoai varchar(20) -> Số điện thoại
      - Email varchar(50) -> Email liên hệ
      - DiaChi nvarchar(200) -> Địa chỉ cụ thể
      - TinhTpId int -> Id của Tỉnh, Thành Phố
      - HuyenQuanId int -> Id của Huyện, Quận
      - XaPhuongId int -> Id của Phường, Xã
      - UpdatedAt datetime -> Thời gian cập nhật
      - CreatedAt datetime -> Thời gian tạo
        
    2) DiaChiGiaoHang: Thông tin về địa chỉ giao hàng của khách hàng
      - DcghId int [primary key, increment] -> Khóa chính, tự tăng
      - KhachHangId int -> Id của khách hàng
      - Ten nvarchar(50) -> Tên người nhận ở địa chỉ này
      - DiaChi nvarchar(200) -> Địa chỉ cụ thể
      - TinhTpId int -> Id của Tỉnh, Thành Phố
      - HuyenQuanId int -> Id của Huyện, Quận
      - XaPhuongId int -> Id của Xã, Phường
      - DienThoai varchar(20) -> Số điện thoại của người nhận
      - IsDefault bit -> Địa chỉ mặc định gửi hàng về khi khách hàng đặt hàng
### 1.2.1.4. Bảng phục vụ thông tin Sản Phẩm:
    1) NhaSanXuat: Thông tin về nhà sản xuất
      - NsxId int [primary key, increment] -> Khóa chính, tự tăng
      - Ten nvarchar(200) -> Tên nhà sản xuất
      - QuocTich nvarchar(50) -> Quốc tịch
      
    2) DanhMuc: Danh mục sản phẩm
      - DanhMucId int [primary key, increment] -> Khóa chính, tự tăng
      - Ten nvarchar(200) -> Tên danh mục
      - ParentId int [default: 0] -> Id của danh mục Cha
      - ThuocTinh varchar(200) -> Các Id thuộc tính mà danh mục này cần có. Vd: 1,2,3
      - Level int -> Cấp của danh mục này
      
    3) ThuocTinh: Các thuộc tính của sản phẩm
      - ThuocTinhId int [primary key, increment] -> Khóa chính, tự tăng
      - Ten nvarchar(50) -> Tên của thuộc tính
      - MoTa nvarchar(200) -> Mô tả về thuộc tính

    4) ThuocTinhValue: Các giá trị của các thuộc tính để chọn nhanh
      - TtValueId int [primary key, increment] -> Khóa chính, tự tăng
      - ThuocTinhId int -> Id của thuộc tính
      - GiaTri nvarchar(50) -> Giá trị 
      - MoTa nvarchar(200) -> Mô tả về giá trị
      
    5) SanPhamImage: Thông tin về Link ảnh của sản phẩm
      - ImageId bigint [primary key, increment] -> Khóa chính, tự tăng
      - SanPhamId int -> Id của sản phẩm
      - Url varchar(200) -> Link ảnh

    6) SanPham: Thông tin của sản phẩm
      - SanPhamId int [primary key, increment] -> Khóa chính, tự tăng
      - DanhMucId int -> Id của danh mục mà sản phẩm thuộc về
      - CuaHangId int -> Id của cửa hàng
      - NsxId int -> Id của nhà sản xuất
      - Ten nvarchar (200) -> Tên sản phẩm
      - MoTaNgan nvarchar (1000) -> Mô tả ngắn về sản phẩm
      - MoTa nvarchar(4000) -> Mô tả chi tiết về sản phầm
      - ThongSo varchar(200) -> Thông số cụ thể về sản phầm, là thông tin các thuộc tính ở trên
      - DonGia int -> Đơn giá sản phẩm
      - TongSoLuong int -> Số lượng sản phẩm còn trong kho
      - IsPhanLoai bit -> True nếu người dùng chọn phân loại sản phẩm này, lúc đó đơn giá và tổng số lượng sẽ lấy theo của từng loại
      - UpdatedAt datetime -> Thời gian cập nhật
      - CreatedAt datetime -> Thời gian tạo

    7) SanPhamType: Thông tin phân loại của sản phẩm
      - SpTypeId bigint [primary key, increment] -> Khóa chính, tự tăng
      - SanPhamId int -> Id của sản phẩm
      - Type1Name nvarchar(20) -> Tên phân loại 1. Vd: Màu
      - Type1Value nvarchar(20) -> Giá trị theo phân loại 1. Vd: Đỏ
      - Type2Name nvarchar(20) -> Tên phân loại 2
      - Type2Value nvarchar(20) -> Giá trị theo phân loại 2
      - Type3Name nvarchar(20) -> Tên phân loại 3
      - Type3Value nvarchar(2) -> Giá trị theo phân loại 3
      - ImageUrl varchar(200) -> Link ảnh đại diện
      - DonGia int -> Đơn giá theo phân loại
      - SoLuong int -> Số lượng sản phẩm còn trong kho

    8) SanPhamReview: Thông tin về các chỉ số đánh giá của người dùng cho sản phẩm. 
      - SanPhamId int [primary key] -> Id của sản phẩm
      - SoLanDanhGia int -> Tổng số lượt đánh giá
      - Diem5 int -> Số lượt đánh giá 5 sao
      - Diem4 int -> Số lượt đánh giá 4 sao
      - Diem3 int -> Số lượt đánh giá 3 sao
      - Diem2 int -> Số lượt đánh giá 2 sao
      - Diem1 int -> Số lượt đánh giá 1 sao
      - Diem0 int -> Số lượt đánh giá 0 sao
      - SoLanNhanXet int -> Tổng số lượt bình luật
      - DiemTrungBinh float -> Điểm trung bình của sản phẩm
      - UpdatedAt datetime -> Thời gian cập nhật
### 1.2.1.5.Bảng phục vụ thông tin Vận chuyển
    1) DoiTacVanChuyen: Thông tin của đối tác vận chuyển
      - DtvcId int [primary key, increment] -> Khóa chính, tự tăng
      - Ten nvarchar (200) -> Tên đối tác vận chuyển
      - MoTa nvarchar (1000) -> Mô tả
      - DiaChi nvarchar (200) -> Địa chỉ
      - TinhTpId int -> Id Tỉnh, Thành Phố
      - HuyenQuanId int -> Id Huyện, Quận
      - XaPhuongId int -> Id Xã, Phường
      - DienThoai varchar (20) -> Số điện thoại liên hệ
      - Email varchar (50) -> Email liên hệ
      - UpdatedAt datetime -> Thời gian cập nhật
      - CreatedAt datetime -> Thời gian tạo
      
    2) PhuongThucVanChuyen: Thông tin về phương thức vận chuyển của từng đối tác
      - PtvcId int [primary key, increment] -> Khóa chính, tự tăng
      - DtvcId int -> Id của đơn vị vận chuyển
      - HinhThuc int -> Hình thức vận chuyển. Vd: 0: Siêu nhanh, 1: Nhanh, 2: Chậm
      - MoTa nvarchar (200) -> Mô tả về hình thức vận chuyển
      - GioVanChuyen int -> Số giờ dự kiến vận chuyển xong
      - DonGia int -> Đơn giá vận chuyển (cần có công thức cụ thể)
      - GiaMin int -> Mức giá vận chuyển thấp nhất. Vd: Theo đơn gian là 5k nhưng GiaMin = 10k thì lấy GiaMin
      - GiaMax int -> Mức giá vận chuyển cao nhất

### 1.2.1.6 Bảng phục vụ thông tin Đơn hàng
    1) DonHang: Thông tin đơn hàng
      - DonHangId bigint [primary key, increment] -> Khóa chính, tự tăng
      - KhachHangId int -> Id của khách hàng
      - PtvcId int -> Id của phương thức giao hàng
      - DcghId int -> Id của địa chỉ giao hàng
      - TienVanChuyen int -> Số tiền vận chuyển
      - TongTien int -> Tổng tiền của đơn
      - SoTienThanhToan int -> Số tiền đã thanh toán
      - HinhThucTT int -> Hình thức thanh toán. Vd: 0 : Tiền mặt, 1: Thẻ Nội địa, 2: Thẻ Visa, 3: Ví điện tử
      - TrangThai int -> Trạng thái của đơn hàng. Vd: -2: Giao hàng thất bại, -1: Chưa mua, 0: Đã mua, đang chờ lấy hàng, 1: Đang vận chuyển, 2: Giao hàng thành công
      - ThongTinTrangThai nvarchar (1000) -> Thông tin của trạng thái. Ví dụ: Đang Vận Chuyển, Ở tại kho Long Biên
      - UpdatedAt datetime -> Thời gian cập nhật
      - CreatedAt datetime - > Thời gian tạo

    2) ChiTietDonHang: Thông tin chi tiết đơn hàng
      - CtdhId bigint [primary key, increment] -> Khóa chính, tự tăng
      - DonHangId bigint -> Id của đơn hàng
      - SanPhamId int -> Id của Sản phẩm
      - SpTypeId bigint [default: 0] -> Id của SanPhamType, bằng 0 nếu sản phẩm không phân loại
      - DonGia int -> Đơn giá của sản phẩm
      - SoLuong int -> Số lượng đặt hàng
      - TongTien int -> Tổng tiền 
### 1.2.1.7 Bảng phục vụ Log 1 số thông tin 
    1) LogGiaSanPham: Log việc thay đổi giá sản phẩm
      - LogId bigint [primary key, increment]: Khóa chính, tự tăng
      - SanPhamId int: Id của sản phẩm
      - SpTypeId int [default: 0] -> Id của phân loại, bằng 0 nếu sản phẩm không phân loại
      - DonGia int -> Giá cài đặt
      - CreatedAt datetime -> Thời gian tạo

    2) LogReviewSanPham: Thông tin người chơi nhận xét và đánh giá sản phẩm
      - LogId bigint [primary key, increment] : Khóa chính, tự tăng
      - SanPhamId int -> Id của sản phẩm
      - KhachHangId int -> Id của khách hàng
      - NoiDung nvarchar (1000) -> Nội dung nhận xét
      - Diem float -> Số điểm đánh giá
      - CreatedAt datetime -> Thời gian tạo

    3) LogChatSanPham: Log trao dổi về sản phẩm của người chơi và cửa hàng
      - LogId bigint [primary key, increment] : Khóa chính, tự tăng
      - SanPhamId int -> Id sản phẩm
      - KhachHangId int -> Id của khách hàng
      - NoiDung nvarchar (1000) -> Nội dung tin nhắn
      - CreatedAt datetime -> Thời gian tạo

    4) LogDonHang: Log thay đổi trạng thái đơn hàng
      - LogId bigint [primary key, increment]: Khóa chính, tự tăng
      - DonHangId bigint -> Id đơn hàng
      - TrangThai int -> Trạng thái của đơn hàng
      - ThongTinTrangThai nvarchar (1000) -> Thông tin của trạng thái
      - CreatedAt datetime -> Thời gian tạo

 ### 1.2.2 Sơ đồ quan hệ ERD
     ![ERD](https://github.com/phongnv91/csdl_saas/blob/main/erd_saas.png)
