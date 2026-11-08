use QLBH
go
create table NhomSanPham(
	maNhom char(10) not null primary key,
	tenNhom nvarchar(20)
)

create table NhaCungCap(
	maNCC char(10) not null primary key,
	tenNCC nvarchar(20),
	diaChi nvarchar(20),
	soDienThoai char(10)
)

create table NguoiDung(
	maNguoiDung char(10) not null primary key,
	tenNguoiDung nvarchar(20),
	soDienThoai char(10),
	email nvarchar(20)
)

create table CuaHang(
	maCuaHang char(10) not null primary key,
	maSoThue nvarchar(20),
	tenCuaHang nvarchar(20),
	diaChi nvarchar(20),
	soDienThoai char(10)
)

create table SanPham(
	maSanPham char(10) not null primary key,
	tenSanPham nvarchar(20),
	donViTinh nvarchar(20),
	gia float,
	maNhomSanPham char(10) not null foreign key references NhomSanPham(maNhom),
	maNCC char(10) not null foreign key references NhaCungCap(maNCC)
)

create table NhanVien(
	maNV char(10) not null primary key,
	tenNV nvarchar(20),
	soDienThoai char(10),
	email nvarchar(20),
	luong float,
	ngayLamVien date,
	maCuaHang char(10) not null foreign key references CuaHang(maCuaHang)
)

create table HoaDon(
	maHoaDon char(10) not null primary key,
	ngayLapHD nvarchar(20),
	donGia float,
	maNguoiDung char(10) not null foreign key references NguoiDung(maNguoiDung),
	maNV char(10) not null foreign key references NhanVien(maNV)
)

create table HoaDon_SanPham(
	maHoaDon char(10) not null foreign key references HoaDon(maHoaDon),
	maSanPham char(10) not null foreign key references SanPham(maSanPham),
	primary key (maHoaDon, maSanPham)
)

create table ThanhToan(
	maThanhToan char(10) not null primary key,
	ngayThanhToan date,
	maHoaDon char(10) not null foreign key references HoaDon(maHoaDon),
	nvThanhToan char(10) not null foreign key references NhanVien(maNV)
)

create table TonKho(
	maSanPham char(10) not null foreign key references SanPham(maSanPham),
	maCuaHang char(10) not null foreign key references CuaHang(maCuaHang),
	soLuong int,
	soLuongToiDa int,
	slToiThieu int,
	primary key (maSanPham, maCuaHang)
)