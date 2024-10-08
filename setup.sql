USE [Saas_1]
GO
/****** Object:  Table [dbo].[ChiTietDonHang]    Script Date: 9/24/2024 8:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonHang](
	[CtdhId] [bigint] IDENTITY(1,1) NOT NULL,
	[DonHangId] [bigint] NULL,
	[SanPhamId] [int] NULL,
	[SpTypeId] [bigint] NULL,
	[DonGia] [int] NULL,
	[SoLuong] [int] NULL,
	[TongTien] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CtdhId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CuaHang]    Script Date: 9/24/2024 8:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CuaHang](
	[CuaHangId] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](200) NULL,
	[MoTa] [nvarchar](1000) NULL,
	[DienThoai] [varchar](20) NULL,
	[Email] [varchar](50) NULL,
	[NganHangId] [int] NULL,
	[SoTk] [varchar](20) NULL,
	[DiaChi] [nvarchar](200) NULL,
	[TinhTpId] [int] NULL,
	[HuyenQuanId] [int] NULL,
	[XaPhuongId] [int] NULL,
	[UpdatedAt] [datetime] NULL,
	[CreatedAt] [datetime] NULL,
 CONSTRAINT [PK__CuaHang__1BECA8F8AF6F2D0C] PRIMARY KEY CLUSTERED 
(
	[CuaHangId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CuaHangDanhMuc]    Script Date: 9/24/2024 8:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CuaHangDanhMuc](
	[ChdmId] [bigint] IDENTITY(1,1) NOT NULL,
	[CuaHangId] [int] NULL,
	[DanhMucId] [int] NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ChdmId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhMuc]    Script Date: 9/24/2024 8:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMuc](
	[DanhMucId] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](200) NULL,
	[ParentId] [int] NULL,
	[ThuocTinh] [varchar](200) NULL,
	[Level] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DanhMucId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiaChiGiaoHang]    Script Date: 9/24/2024 8:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiaChiGiaoHang](
	[DcghId] [int] IDENTITY(1,1) NOT NULL,
	[KhachHangId] [int] NULL,
	[Ten] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](200) NULL,
	[TinhTpId] [int] NULL,
	[HuyenQuanId] [int] NULL,
	[XaPhuongId] [int] NULL,
	[DienThoai] [varchar](20) NULL,
	[IsDefault] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[DcghId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DoiTacVanChuyen]    Script Date: 9/24/2024 8:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoiTacVanChuyen](
	[DtvcId] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](200) NULL,
	[MoTa] [nvarchar](1000) NULL,
	[DiaChi] [nvarchar](200) NULL,
	[TinhTpId] [int] NULL,
	[HuyenQuanId] [int] NULL,
	[XaPhuongId] [int] NULL,
	[DienThoai] [varchar](20) NULL,
	[Email] [varchar](50) NULL,
	[UpdatedAt] [datetime] NULL,
	[CreatedAt] [datetime] NULL,
 CONSTRAINT [PK__DoiTacVa__3E0603DB7CB4B458] PRIMARY KEY CLUSTERED 
(
	[DtvcId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 9/24/2024 8:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[DonHangId] [bigint] IDENTITY(1,1) NOT NULL,
	[KhachHangId] [int] NULL,
	[PtvcId] [int] NULL,
	[DcghId] [int] NULL,
	[TienVanChuyen] [int] NULL,
	[TongTien] [int] NULL,
	[SoTienThanhToan] [int] NULL,
	[HinhThucTT] [int] NULL,
	[TrangThai] [int] NULL,
	[ThongTinTrangThai] [nvarchar](1000) NULL,
	[UpdatedAt] [datetime] NULL,
	[CreatedAt] [datetime] NULL,
 CONSTRAINT [PK__DonHang__D159F4BEF84FFB8F] PRIMARY KEY CLUSTERED 
(
	[DonHangId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HuyenQuan]    Script Date: 9/24/2024 8:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HuyenQuan](
	[HuyenQuanId] [int] IDENTITY(1,1) NOT NULL,
	[TinhTpId] [int] NULL,
	[Ten] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[HuyenQuanId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 9/24/2024 8:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[KhachHangId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[HoTen] [nvarchar](50) NULL,
	[NgaySinh] [varchar](20) NULL,
	[GioiTinh] [bit] NULL,
	[DienThoai] [varchar](20) NULL,
	[Email] [varchar](50) NULL,
	[DiaChi] [nvarchar](200) NULL,
	[TinhTpId] [int] NULL,
	[HuyenQuanId] [int] NULL,
	[XaPhuongId] [int] NULL,
	[UpdatedAt] [datetime] NULL,
	[CreatedAt] [datetime] NULL,
 CONSTRAINT [PK__KhachHan__880F21FB4FBFF594] PRIMARY KEY CLUSTERED 
(
	[KhachHangId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LogChatSanPham]    Script Date: 9/24/2024 8:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogChatSanPham](
	[LogId] [bigint] IDENTITY(1,1) NOT NULL,
	[SanPhamId] [int] NULL,
	[KhachHangId] [int] NULL,
	[NoiDung] [nvarchar](1000) NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LogDonHang]    Script Date: 9/24/2024 8:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogDonHang](
	[LogId] [bigint] IDENTITY(1,1) NOT NULL,
	[DonHangId] [bigint] NULL,
	[TrangThai] [int] NULL,
	[ThongTinTrangThai] [nvarchar](1000) NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LogGiaSanPham]    Script Date: 9/24/2024 8:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogGiaSanPham](
	[LogId] [bigint] IDENTITY(1,1) NOT NULL,
	[SanPhamId] [int] NULL,
	[SpTypeId] [int] NULL,
	[DonGia] [int] NULL,
	[CreatedAt] [datetime] NULL,
 CONSTRAINT [PK__LogGiaSa__5E5486489421689B] PRIMARY KEY CLUSTERED 
(
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LogReviewSanPham]    Script Date: 9/24/2024 8:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogReviewSanPham](
	[LogId] [bigint] IDENTITY(1,1) NOT NULL,
	[SanPhamId] [int] NULL,
	[KhachHangId] [int] NULL,
	[NoiDung] [nvarchar](1000) NULL,
	[Diem] [float] NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NganHang]    Script Date: 9/24/2024 8:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NganHang](
	[NganHangId] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](20) NULL,
	[Ten] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[NganHangId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaSanXuat]    Script Date: 9/24/2024 8:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaSanXuat](
	[NsxId] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](200) NULL,
	[QuocTich] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[NsxId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhuongThucVanChuyen]    Script Date: 9/24/2024 8:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhuongThucVanChuyen](
	[PtvcId] [int] IDENTITY(1,1) NOT NULL,
	[DtvcId] [int] NULL,
	[HinhThuc] [int] NULL,
	[MoTa] [nvarchar](200) NULL,
	[DonGia] [int] NULL,
	[GiaMin] [int] NULL,
	[GiaMax] [int] NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[PtvcId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 9/24/2024 8:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[SanPhamId] [int] IDENTITY(1,1) NOT NULL,
	[DanhMucId] [int] NULL,
	[CuaHangId] [int] NULL,
	[NsxId] [int] NULL,
	[Ten] [nvarchar](200) NULL,
	[MoTaNgan] [nvarchar](1000) NULL,
	[MoTa] [nvarchar](4000) NULL,
	[ThongSo] [nvarchar](1000) NULL,
	[DonGia] [int] NULL,
	[TongSoLuong] [int] NULL,
	[IsPhanLoai] [bit] NULL,
	[UpdatedAt] [datetime] NULL,
	[CreatedAt] [datetime] NULL,
 CONSTRAINT [PK__SanPham__05180FD4B91F341E] PRIMARY KEY CLUSTERED 
(
	[SanPhamId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPhamImage]    Script Date: 9/24/2024 8:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPhamImage](
	[ImageId] [bigint] IDENTITY(1,1) NOT NULL,
	[SanPhamId] [int] NULL,
	[Url] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[ImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPhamReview]    Script Date: 9/24/2024 8:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPhamReview](
	[SanPhamId] [int] NOT NULL,
	[SoLanDanhGia] [int] NULL,
	[Diem5] [int] NULL,
	[Diem4] [int] NULL,
	[Diem3] [int] NULL,
	[Diem2] [int] NULL,
	[Diem1] [int] NULL,
	[Diem0] [int] NULL,
	[SoLanNhanXet] [int] NULL,
	[UpdatedAt] [datetime] NULL,
 CONSTRAINT [PK__SanPhamR__05180FD45CD9F3A5] PRIMARY KEY CLUSTERED 
(
	[SanPhamId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPhamType]    Script Date: 9/24/2024 8:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPhamType](
	[SpTypeId] [bigint] IDENTITY(1,1) NOT NULL,
	[SanPhamId] [int] NULL,
	[Type1Name] [nvarchar](20) NULL,
	[Type1Value] [nvarchar](20) NULL,
	[Type2Name] [nvarchar](20) NULL,
	[Type2Value] [nvarchar](20) NULL,
	[Type3Name] [nvarchar](20) NULL,
	[Type3Value] [nvarchar](2) NULL,
	[ImageUrl] [varchar](200) NULL,
	[DonGia] [int] NULL,
	[SoLuong] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SpTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThuocTinh]    Script Date: 9/24/2024 8:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThuocTinh](
	[ThuocTinhId] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](50) NULL,
	[MoTa] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[ThuocTinhId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThuocTinhValue]    Script Date: 9/24/2024 8:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThuocTinhValue](
	[TtValueId] [int] IDENTITY(1,1) NOT NULL,
	[ThuocTinhId] [int] NULL,
	[GiaTri] [nvarchar](50) NULL,
	[MoTa] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[TtValueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TinhTp]    Script Date: 9/24/2024 8:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinhTp](
	[TinhTpId] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[TinhTpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XaPhuong]    Script Date: 9/24/2024 8:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XaPhuong](
	[XaPhuongId] [int] IDENTITY(1,1) NOT NULL,
	[HuyenQuanId] [int] NULL,
	[Ten] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[XaPhuongId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_ChiTietDonHang_DonHangId]    Script Date: 9/24/2024 8:17:43 AM ******/
CREATE NONCLUSTERED INDEX [IX_ChiTietDonHang_DonHangId] ON [dbo].[ChiTietDonHang]
(
	[DonHangId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ChiTietDonHang_SanPhamId]    Script Date: 9/24/2024 8:17:43 AM ******/
CREATE NONCLUSTERED INDEX [IX_ChiTietDonHang_SanPhamId] ON [dbo].[ChiTietDonHang]
(
	[SanPhamId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_DonHang_KhachHangId]    Script Date: 9/24/2024 8:17:43 AM ******/
CREATE NONCLUSTERED INDEX [IX_DonHang_KhachHangId] ON [dbo].[DonHang]
(
	[KhachHangId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_DonHang_TrangThai]    Script Date: 9/24/2024 8:17:43 AM ******/
CREATE NONCLUSTERED INDEX [IX_DonHang_TrangThai] ON [dbo].[DonHang]
(
	[TrangThai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_DonHang_UpdatedAt]    Script Date: 9/24/2024 8:17:43 AM ******/
CREATE NONCLUSTERED INDEX [IX_DonHang_UpdatedAt] ON [dbo].[DonHang]
(
	[UpdatedAt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SanPham_CuaHangId]    Script Date: 9/24/2024 8:17:43 AM ******/
CREATE NONCLUSTERED INDEX [IX_SanPham_CuaHangId] ON [dbo].[SanPham]
(
	[CuaHangId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SanPham_DanhMucId]    Script Date: 9/24/2024 8:17:43 AM ******/
CREATE NONCLUSTERED INDEX [IX_SanPham_DanhMucId] ON [dbo].[SanPham]
(
	[DanhMucId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SanPham_Ten]    Script Date: 9/24/2024 8:17:43 AM ******/
CREATE NONCLUSTERED INDEX [IX_SanPham_Ten] ON [dbo].[SanPham]
(
	[Ten] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DanhMuc] ADD  DEFAULT ((0)) FOR [ParentId]
GO
ALTER TABLE [dbo].[LogGiaSanPham] ADD  CONSTRAINT [DF_LogGiaSanPham_SpTypeId]  DEFAULT ((0)) FOR [SpTypeId]
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK__ChiTietDo__DonHa__6FE99F9F] FOREIGN KEY([DonHangId])
REFERENCES [dbo].[DonHang] ([DonHangId])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK__ChiTietDo__DonHa__6FE99F9F]
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK__ChiTietDo__SanPh__6C190EBB] FOREIGN KEY([SanPhamId])
REFERENCES [dbo].[SanPham] ([SanPhamId])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK__ChiTietDo__SanPh__6C190EBB]
GO
ALTER TABLE [dbo].[CuaHang]  WITH CHECK ADD  CONSTRAINT [FK__CuaHang__HuyenQu__571DF1D5] FOREIGN KEY([HuyenQuanId])
REFERENCES [dbo].[HuyenQuan] ([HuyenQuanId])
GO
ALTER TABLE [dbo].[CuaHang] CHECK CONSTRAINT [FK__CuaHang__HuyenQu__571DF1D5]
GO
ALTER TABLE [dbo].[CuaHang]  WITH CHECK ADD  CONSTRAINT [FK__CuaHang__NganHan__72C60C4A] FOREIGN KEY([NganHangId])
REFERENCES [dbo].[NganHang] ([NganHangId])
GO
ALTER TABLE [dbo].[CuaHang] CHECK CONSTRAINT [FK__CuaHang__NganHan__72C60C4A]
GO
ALTER TABLE [dbo].[CuaHang]  WITH CHECK ADD  CONSTRAINT [FK__CuaHang__TinhTpI__52593CB8] FOREIGN KEY([TinhTpId])
REFERENCES [dbo].[TinhTp] ([TinhTpId])
GO
ALTER TABLE [dbo].[CuaHang] CHECK CONSTRAINT [FK__CuaHang__TinhTpI__52593CB8]
GO
ALTER TABLE [dbo].[CuaHang]  WITH CHECK ADD  CONSTRAINT [FK__CuaHang__XaPhuon__5BE2A6F2] FOREIGN KEY([XaPhuongId])
REFERENCES [dbo].[XaPhuong] ([XaPhuongId])
GO
ALTER TABLE [dbo].[CuaHang] CHECK CONSTRAINT [FK__CuaHang__XaPhuon__5BE2A6F2]
GO
ALTER TABLE [dbo].[CuaHangDanhMuc]  WITH CHECK ADD  CONSTRAINT [FK__CuaHangDa__CuaHa__619B8048] FOREIGN KEY([CuaHangId])
REFERENCES [dbo].[CuaHang] ([CuaHangId])
GO
ALTER TABLE [dbo].[CuaHangDanhMuc] CHECK CONSTRAINT [FK__CuaHangDa__CuaHa__619B8048]
GO
ALTER TABLE [dbo].[CuaHangDanhMuc]  WITH CHECK ADD FOREIGN KEY([DanhMucId])
REFERENCES [dbo].[DanhMuc] ([DanhMucId])
GO
ALTER TABLE [dbo].[DiaChiGiaoHang]  WITH CHECK ADD FOREIGN KEY([HuyenQuanId])
REFERENCES [dbo].[HuyenQuan] ([HuyenQuanId])
GO
ALTER TABLE [dbo].[DiaChiGiaoHang]  WITH CHECK ADD  CONSTRAINT [FK__DiaChiGia__Khach__656C112C] FOREIGN KEY([KhachHangId])
REFERENCES [dbo].[KhachHang] ([KhachHangId])
GO
ALTER TABLE [dbo].[DiaChiGiaoHang] CHECK CONSTRAINT [FK__DiaChiGia__Khach__656C112C]
GO
ALTER TABLE [dbo].[DiaChiGiaoHang]  WITH CHECK ADD FOREIGN KEY([TinhTpId])
REFERENCES [dbo].[TinhTp] ([TinhTpId])
GO
ALTER TABLE [dbo].[DiaChiGiaoHang]  WITH CHECK ADD FOREIGN KEY([XaPhuongId])
REFERENCES [dbo].[XaPhuong] ([XaPhuongId])
GO
ALTER TABLE [dbo].[DoiTacVanChuyen]  WITH CHECK ADD  CONSTRAINT [FK__DoiTacVan__Huyen__5812160E] FOREIGN KEY([HuyenQuanId])
REFERENCES [dbo].[HuyenQuan] ([HuyenQuanId])
GO
ALTER TABLE [dbo].[DoiTacVanChuyen] CHECK CONSTRAINT [FK__DoiTacVan__Huyen__5812160E]
GO
ALTER TABLE [dbo].[DoiTacVanChuyen]  WITH CHECK ADD  CONSTRAINT [FK__DoiTacVan__TinhT__534D60F1] FOREIGN KEY([TinhTpId])
REFERENCES [dbo].[TinhTp] ([TinhTpId])
GO
ALTER TABLE [dbo].[DoiTacVanChuyen] CHECK CONSTRAINT [FK__DoiTacVan__TinhT__534D60F1]
GO
ALTER TABLE [dbo].[DoiTacVanChuyen]  WITH CHECK ADD  CONSTRAINT [FK__DoiTacVan__XaPhu__5CD6CB2B] FOREIGN KEY([XaPhuongId])
REFERENCES [dbo].[XaPhuong] ([XaPhuongId])
GO
ALTER TABLE [dbo].[DoiTacVanChuyen] CHECK CONSTRAINT [FK__DoiTacVan__XaPhu__5CD6CB2B]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK__DonHang__DcghId__71D1E811] FOREIGN KEY([DcghId])
REFERENCES [dbo].[DiaChiGiaoHang] ([DcghId])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK__DonHang__DcghId__71D1E811]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK__DonHang__KhachHa__6477ECF3] FOREIGN KEY([KhachHangId])
REFERENCES [dbo].[KhachHang] ([KhachHangId])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK__DonHang__KhachHa__6477ECF3]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK__DonHang__PtvcId__6EF57B66] FOREIGN KEY([PtvcId])
REFERENCES [dbo].[PhuongThucVanChuyen] ([PtvcId])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK__DonHang__PtvcId__6EF57B66]
GO
ALTER TABLE [dbo].[HuyenQuan]  WITH CHECK ADD FOREIGN KEY([TinhTpId])
REFERENCES [dbo].[TinhTp] ([TinhTpId])
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD  CONSTRAINT [FK__KhachHang__Huyen__5629CD9C] FOREIGN KEY([HuyenQuanId])
REFERENCES [dbo].[HuyenQuan] ([HuyenQuanId])
GO
ALTER TABLE [dbo].[KhachHang] CHECK CONSTRAINT [FK__KhachHang__Huyen__5629CD9C]
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD  CONSTRAINT [FK__KhachHang__TinhT__5165187F] FOREIGN KEY([TinhTpId])
REFERENCES [dbo].[TinhTp] ([TinhTpId])
GO
ALTER TABLE [dbo].[KhachHang] CHECK CONSTRAINT [FK__KhachHang__TinhT__5165187F]
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD  CONSTRAINT [FK__KhachHang__XaPhu__5AEE82B9] FOREIGN KEY([XaPhuongId])
REFERENCES [dbo].[XaPhuong] ([XaPhuongId])
GO
ALTER TABLE [dbo].[KhachHang] CHECK CONSTRAINT [FK__KhachHang__XaPhu__5AEE82B9]
GO
ALTER TABLE [dbo].[LogChatSanPham]  WITH CHECK ADD  CONSTRAINT [FK__LogChatSa__Khach__6383C8BA] FOREIGN KEY([KhachHangId])
REFERENCES [dbo].[KhachHang] ([KhachHangId])
GO
ALTER TABLE [dbo].[LogChatSanPham] CHECK CONSTRAINT [FK__LogChatSa__Khach__6383C8BA]
GO
ALTER TABLE [dbo].[LogChatSanPham]  WITH CHECK ADD  CONSTRAINT [FK__LogChatSa__SanPh__68487DD7] FOREIGN KEY([SanPhamId])
REFERENCES [dbo].[SanPham] ([SanPhamId])
GO
ALTER TABLE [dbo].[LogChatSanPham] CHECK CONSTRAINT [FK__LogChatSa__SanPh__68487DD7]
GO
ALTER TABLE [dbo].[LogDonHang]  WITH CHECK ADD  CONSTRAINT [FK__LogDonHan__DonHa__70DDC3D8] FOREIGN KEY([DonHangId])
REFERENCES [dbo].[DonHang] ([DonHangId])
GO
ALTER TABLE [dbo].[LogDonHang] CHECK CONSTRAINT [FK__LogDonHan__DonHa__70DDC3D8]
GO
ALTER TABLE [dbo].[LogGiaSanPham]  WITH CHECK ADD  CONSTRAINT [FK__LogGiaSan__SanPh__66603565] FOREIGN KEY([SanPhamId])
REFERENCES [dbo].[SanPham] ([SanPhamId])
GO
ALTER TABLE [dbo].[LogGiaSanPham] CHECK CONSTRAINT [FK__LogGiaSan__SanPh__66603565]
GO
ALTER TABLE [dbo].[LogReviewSanPham]  WITH CHECK ADD  CONSTRAINT [FK__LogReview__Khach__628FA481] FOREIGN KEY([KhachHangId])
REFERENCES [dbo].[KhachHang] ([KhachHangId])
GO
ALTER TABLE [dbo].[LogReviewSanPham] CHECK CONSTRAINT [FK__LogReview__Khach__628FA481]
GO
ALTER TABLE [dbo].[LogReviewSanPham]  WITH CHECK ADD  CONSTRAINT [FK__LogReview__SanPh__6754599E] FOREIGN KEY([SanPhamId])
REFERENCES [dbo].[SanPham] ([SanPhamId])
GO
ALTER TABLE [dbo].[LogReviewSanPham] CHECK CONSTRAINT [FK__LogReview__SanPh__6754599E]
GO
ALTER TABLE [dbo].[PhuongThucVanChuyen]  WITH CHECK ADD  CONSTRAINT [FK__PhuongThu__DtvcI__6E01572D] FOREIGN KEY([DtvcId])
REFERENCES [dbo].[DoiTacVanChuyen] ([DtvcId])
GO
ALTER TABLE [dbo].[PhuongThucVanChuyen] CHECK CONSTRAINT [FK__PhuongThu__DtvcI__6E01572D]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK__SanPham__CuaHang__60A75C0F] FOREIGN KEY([CuaHangId])
REFERENCES [dbo].[CuaHang] ([CuaHangId])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK__SanPham__CuaHang__60A75C0F]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK__SanPham__DanhMuc__5EBF139D] FOREIGN KEY([DanhMucId])
REFERENCES [dbo].[DanhMuc] ([DanhMucId])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK__SanPham__DanhMuc__5EBF139D]
GO
ALTER TABLE [dbo].[SanPhamImage]  WITH CHECK ADD  CONSTRAINT [FK__SanPhamIm__SanPh__693CA210] FOREIGN KEY([SanPhamId])
REFERENCES [dbo].[SanPham] ([SanPhamId])
GO
ALTER TABLE [dbo].[SanPhamImage] CHECK CONSTRAINT [FK__SanPhamIm__SanPh__693CA210]
GO
ALTER TABLE [dbo].[SanPhamReview]  WITH CHECK ADD  CONSTRAINT [FK__SanPhamRe__SanPh__6A30C649] FOREIGN KEY([SanPhamId])
REFERENCES [dbo].[SanPham] ([SanPhamId])
GO
ALTER TABLE [dbo].[SanPhamReview] CHECK CONSTRAINT [FK__SanPhamRe__SanPh__6A30C649]
GO
ALTER TABLE [dbo].[SanPhamType]  WITH CHECK ADD  CONSTRAINT [FK__SanPhamTy__SanPh__6B24EA82] FOREIGN KEY([SanPhamId])
REFERENCES [dbo].[SanPham] ([SanPhamId])
GO
ALTER TABLE [dbo].[SanPhamType] CHECK CONSTRAINT [FK__SanPhamTy__SanPh__6B24EA82]
GO
ALTER TABLE [dbo].[ThuocTinhValue]  WITH CHECK ADD FOREIGN KEY([ThuocTinhId])
REFERENCES [dbo].[ThuocTinh] ([ThuocTinhId])
GO
ALTER TABLE [dbo].[XaPhuong]  WITH CHECK ADD FOREIGN KEY([HuyenQuanId])
REFERENCES [dbo].[HuyenQuan] ([HuyenQuanId])
GO
