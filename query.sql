USE [Saas_1]
GO
/****** Object:  StoredProcedure [dbo].[SP_Cau_1]    Script Date: 9/24/2024 1:07:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Cau_1]
	@_CuaHangId int
AS
BEGIN
	SELECT a.*, ((b.Diem5 * 5 + b.Diem4 * 4 + b.Diem3 * 3 + b.Diem2 * 2 + b.Diem1 * 1 + b.Diem0 * 0) / CAST(b.SoLanDanhGia as real)) AS DiemTrungBinh
	FROM dbo.SanPham AS a
	LEFT JOIN  dbo.SanPhamReview AS b
	ON a.SanPhamId = B.SanPhamId
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Cau_2]    Script Date: 9/24/2024 1:07:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Cau_2] 
	@_CuaHangId INT
AS
BEGIN
	SELECT ISNULL(SUM(TongTien),0) AS TongDoanhThu FROM dbo.ChiTietDonHang
	WHERE SanPhamId IN (SELECT SanPhamId FROM dbo.SanPham WHERE CuaHangId = @_CuaHangId)
	AND DonHangId IN (SELECT DonHangId FROM dbo.DonHang WHERE TrangThai = 2)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Cau_3]    Script Date: 9/24/2024 1:07:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Cau_3]
	@_StartTime DATETIME,
	@_EndTime DATETIME
AS
BEGIN
	SELECT c.DanhMucId, SUM(c.TongTien) AS DoanhThu FROM
		(SELECT a.DanhMucId, b.TongTien FROM dbo.[SanPham] a
		RIGHT JOIN
		(SELECT SanPhamId, Sum(TongTien) AS TongTien
		  FROM dbo.[ChiTietDonHang]
		  WHERE DonHangId IN 
		  (SELECT DonHangId FROM dbo.DonHang WHERE TrangThai = 2 AND UpdatedAt >= @_StartTime AND UpdatedAt <= @_EndTime)
		  GROUP BY sanphamid ) AS b
		  ON a.SanPhamId = b.SanPhamId) AS c
	GROUP BY c.DanhMucId
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Cau_4]    Script Date: 9/24/2024 1:07:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Cau_4] 
AS
BEGIN
		SELECT TOP (5) result.ParentId, SUM(result.DoanhThu) AS TongDoanhThu from 
	(SELECT (CASE 
				WHEN dm.[Level] = 2 THEN dm.DanhMucId
				when dm.[Level] = 3 THEN dm.ParentId
			END) AS ParentId, 
		  dm.[Level], dm.DanhMucId, tmp.DoanhThu FROM DanhMuc AS dm
	RIGHT JOIN
	(SELECT c.DanhMucId, SUM(c.TongTien) AS DoanhThu FROM
			(SELECT a.DanhMucId, b.TongTien FROM dbo.[SanPham] a
			RIGHT JOIN
			(SELECT SanPhamId, Sum(TongTien) AS TongTien
			  FROM dbo.[ChiTietDonHang]
			  WHERE DonHangId IN 
			  (SELECT DonHangId FROM dbo.DonHang WHERE TrangThai = 2)
			  GROUP BY sanphamid ) AS b
			  ON a.SanPhamId = b.SanPhamId) AS c
		GROUP BY c.DanhMucId) AS tmp
	ON dm.DanhMucId = tmp.DanhMucId) AS result
	GROUP BY result.ParentId
	ORDER BY TongDoanhThu DESC
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Cau_5]    Script Date: 9/24/2024 1:07:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Cau_5] 
AS
BEGIN
	SELECT TOP(5) a.TinhTpId, SUM(b.DoanhThu) AS TongDoanhThu FROM KhachHang AS a
	RIGHT JOIN 
	(SELECT KhachHangId, SUM(TongTien - TienVanChuyen) AS DoanhThu FROM DonHang 
	WHERE TrangThai = 2
	GROUP BY KhachHangId) AS b
	ON a.KhachHangId = b.KhachHangId
	GROUP BY a.TinhTpId
	ORDER BY TongDoanhThu DESC
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Cau_6]    Script Date: 9/24/2024 1:07:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Cau_6] 
AS
BEGIN
	SELECT TOP(5) a.TinhTpId, COUNT(b.DonBiHuy) AS SoLanBiHuy FROM KhachHang AS a
	RIGHT JOIN 
	(SELECT KhachHangId, COUNT(DonHangId) AS DonBiHuy FROM DonHang 
	WHERE TrangThai = -2
	GROUP BY KhachHangId) AS b
	ON a.KhachHangId = b.KhachHangId
	GROUP BY a.TinhTpId
	ORDER BY SoLanBiHuy DESC
END
GO
