USE [cellphones]
GO
/****** Object:  User [root]    Script Date: 3/28/2023 7:08:49 PM ******/
CREATE USER [root] FOR LOGIN [root] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Schema [cellphones]    Script Date: 3/28/2023 7:08:50 PM ******/
CREATE SCHEMA [cellphones]
GO
/****** Object:  Table [dbo].[cellphoneapp_branch]    Script Date: 3/28/2023 7:08:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cellphoneapp_branch](
	[Id] [int] IDENTITY(4,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[EstablishmentDate] [date] NOT NULL,
 CONSTRAINT [PK_cellphoneapp_branch_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cellphoneapp_branch_product_color]    Script Date: 3/28/2023 7:08:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cellphoneapp_branch_product_color](
	[Id] [int] IDENTITY(256,1) NOT NULL,
	[Amount] [int] NOT NULL,
	[idBranch_id] [int] NOT NULL,
	[idProductColor_id] [int] NOT NULL,
 CONSTRAINT [PK_cellphoneapp_branch_product_color_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cellphoneapp_branch_promotion_product]    Script Date: 3/28/2023 7:08:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cellphoneapp_branch_promotion_product](
	[Id] [int] IDENTITY(125,1) NOT NULL,
	[discountRate] [float] NOT NULL,
	[idBrandProductColor_id] [int] NOT NULL,
	[idPromotion_id] [int] NOT NULL,
 CONSTRAINT [PK_cellphoneapp_branch_promotion_product_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cellphoneapp_color]    Script Date: 3/28/2023 7:08:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cellphoneapp_color](
	[names] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_cellphoneapp_color_names] PRIMARY KEY CLUSTERED 
(
	[names] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cellphoneapp_comment]    Script Date: 3/28/2023 7:08:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cellphoneapp_comment](
	[Id] [int] IDENTITY(71,1) NOT NULL,
	[contentComment] [nvarchar](100) NOT NULL,
	[idProduct_id] [int] NOT NULL,
	[idUser_id] [int] NOT NULL,
 CONSTRAINT [PK_cellphoneapp_comment_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cellphoneapp_earphone]    Script Date: 3/28/2023 7:08:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cellphoneapp_earphone](
	[product_ptr_id] [int] NOT NULL,
	[connectionType] [nvarchar](50) NOT NULL,
	[Design] [nvarchar](50) NOT NULL,
	[Frequency_Response] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_cellphoneapp_earphone_product_ptr_id] PRIMARY KEY CLUSTERED 
(
	[product_ptr_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cellphoneapp_imageproduct]    Script Date: 3/28/2023 7:08:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cellphoneapp_imageproduct](
	[Id] [int] IDENTITY(86,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[linkImg] [nvarchar](255) NOT NULL,
	[idProduct_id] [int] NOT NULL,
 CONSTRAINT [PK_cellphoneapp_imageproduct_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cellphoneapp_laptop]    Script Date: 3/28/2023 7:08:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cellphoneapp_laptop](
	[product_ptr_id] [int] NOT NULL,
	[CPU] [nvarchar](50) NOT NULL,
	[RAM] [nvarchar](50) NOT NULL,
	[ROM] [nvarchar](50) NOT NULL,
	[Graphic_Card] [nvarchar](50) NOT NULL,
	[Battery] [nvarchar](30) NOT NULL,
	[operatorSystem] [nvarchar](50) NOT NULL,
	[Others] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_cellphoneapp_laptop_product_ptr_id] PRIMARY KEY CLUSTERED 
(
	[product_ptr_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cellphoneapp_manufacture]    Script Date: 3/28/2023 7:08:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cellphoneapp_manufacture](
	[names] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_cellphoneapp_manufacture_names] PRIMARY KEY CLUSTERED 
(
	[names] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cellphoneapp_order]    Script Date: 3/28/2023 7:08:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cellphoneapp_order](
	[Id] [int] IDENTITY(104,1) NOT NULL,
	[orderDate] [datetime2](6) NOT NULL,
	[deliveryAddress] [nvarchar](50) NOT NULL,
	[deliveryPhone] [nvarchar](50) NOT NULL,
	[Status] [nvarchar](30) NOT NULL,
	[idUser_id] [int] NOT NULL,
 CONSTRAINT [PK_cellphoneapp_order_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cellphoneapp_orderdetail]    Script Date: 3/28/2023 7:08:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cellphoneapp_orderdetail](
	[Id] [int] IDENTITY(184,1) NOT NULL,
	[Quantity] [int] NOT NULL,
	[idBrandProductColor_id] [int] NOT NULL,
	[idOder_id] [int] NOT NULL,
	[unit_price] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_cellphoneapp_orderdetail_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cellphoneapp_product]    Script Date: 3/28/2023 7:08:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cellphoneapp_product](
	[Id] [int] IDENTITY(59,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[nameManufacture_id] [nvarchar](100) NOT NULL,
	[Type] [nvarchar](50) NULL,
 CONSTRAINT [PK_cellphoneapp_product_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cellphoneapp_product_color]    Script Date: 3/28/2023 7:08:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cellphoneapp_product_color](
	[Id] [int] IDENTITY(91,1) NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[idProduct_id] [int] NOT NULL,
	[nameColor_id] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_cellphoneapp_product_color_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cellphoneapp_promotion]    Script Date: 3/28/2023 7:08:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cellphoneapp_promotion](
	[Id] [int] IDENTITY(4,1) NOT NULL,
	[timeStart] [datetime2](6) NOT NULL,
	[timeEnd] [datetime2](6) NOT NULL,
	[Active] [smallint] NOT NULL,
 CONSTRAINT [PK_cellphoneapp_promotion_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cellphoneapp_review]    Script Date: 3/28/2023 7:08:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cellphoneapp_review](
	[Id] [int] IDENTITY(41,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[idProduct_id] [int] NOT NULL,
 CONSTRAINT [PK_cellphoneapp_review_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cellphoneapp_role]    Script Date: 3/28/2023 7:08:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cellphoneapp_role](
	[nameRole] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_cellphoneapp_role_nameRole] PRIMARY KEY CLUSTERED 
(
	[nameRole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cellphoneapp_smartphone]    Script Date: 3/28/2023 7:08:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cellphoneapp_smartphone](
	[product_ptr_id] [int] NOT NULL,
	[Operator_System] [nvarchar](50) NOT NULL,
	[CPU] [nvarchar](50) NOT NULL,
	[RAM] [nvarchar](50) NOT NULL,
	[ROM] [nvarchar](50) NOT NULL,
	[Battery] [nvarchar](30) NOT NULL,
	[Others] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_cellphoneapp_smartphone_product_ptr_id] PRIMARY KEY CLUSTERED 
(
	[product_ptr_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cellphoneapp_user]    Script Date: 3/28/2023 7:08:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cellphoneapp_user](
	[Id] [int] IDENTITY(90,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Gender] [smallint] NOT NULL,
	[Hometown] [nvarchar](50) NOT NULL,
	[userName] [nvarchar](30) NOT NULL,
	[passWord] [nvarchar](255) NULL,
	[birthDay] [date] NOT NULL,
	[phoneNumber] [nvarchar](20) NOT NULL,
	[idRole_id] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_cellphoneapp_user_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cellphoneapp_branch] ON 

INSERT [dbo].[cellphoneapp_branch] ([Id], [Name], [Address], [Phone], [EstablishmentDate]) VALUES (1, N'Cửa hàng A', N'Ấp 3, xã Tân Trach, huyện Cần Đước, tỉnh Long An', N'0987654321', CAST(N'2020-01-01' AS Date))
INSERT [dbo].[cellphoneapp_branch] ([Id], [Name], [Address], [Phone], [EstablishmentDate]) VALUES (2, N'Cửa hàng B', N'Số 2, đường 7, quận Gò Vấp, TP HCM', N'0123456789', CAST(N'2019-03-15' AS Date))
INSERT [dbo].[cellphoneapp_branch] ([Id], [Name], [Address], [Phone], [EstablishmentDate]) VALUES (3, N'Cửa hàng C', N'Số 3, đường Hàm Nghi, phường 3, TP Trà Vinh', N'0999999999', CAST(N'2021-06-30' AS Date))
SET IDENTITY_INSERT [dbo].[cellphoneapp_branch] OFF
GO
SET IDENTITY_INSERT [dbo].[cellphoneapp_branch_product_color] ON 

INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (1, 32, 1, 1)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (2, 24, 1, 2)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (3, 11, 1, 3)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (4, 17, 1, 4)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (5, 27, 1, 5)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (6, 5, 1, 6)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (7, 29, 1, 7)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (8, 16, 1, 8)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (9, 7, 1, 9)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (10, 8, 1, 10)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (11, 0, 1, 11)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (12, 22, 1, 12)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (13, 18, 1, 13)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (14, 30, 1, 14)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (15, 6, 1, 15)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (16, 25, 1, 16)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (17, 13, 1, 17)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (18, 19, 1, 18)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (19, 20, 1, 19)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (20, 21, 1, 20)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (21, 0, 1, 21)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (22, 12, 1, 22)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (23, 26, 1, 23)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (24, 15, 1, 24)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (25, 9, 1, 25)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (26, 10, 1, 26)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (27, 23, 1, 27)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (28, 4, 1, 28)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (29, 31, 1, 29)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (30, 3, 1, 30)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (31, 7, 1, 31)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (32, 27, 1, 32)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (33, 2, 1, 33)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (34, 8, 1, 34)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (35, 16, 1, 35)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (36, 29, 1, 36)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (37, 1, 1, 37)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (38, 11, 1, 38)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (39, 5, 1, 39)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (40, 24, 1, 40)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (41, 17, 1, 41)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (42, 12, 1, 42)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (43, 25, 1, 43)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (44, 13, 1, 44)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (45, 19, 1, 45)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (46, 20, 1, 46)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (47, 21, 1, 47)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (48, 28, 1, 48)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (49, 4, 1, 49)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (50, 31, 1, 50)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (51, 9, 1, 51)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (52, 3, 1, 52)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (53, 22, 1, 53)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (54, 10, 1, 54)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (55, 15, 1, 55)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (56, 23, 1, 56)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (57, 18, 1, 57)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (58, 14, 1, 58)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (59, 26, 1, 59)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (60, 30, 1, 60)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (61, 6, 1, 61)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (62, 1, 1, 62)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (63, 19, 1, 63)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (64, 21, 1, 64)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (65, 2, 1, 65)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (66, 11, 1, 66)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (67, 7, 1, 67)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (68, 27, 1, 68)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (69, 4, 1, 69)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (70, 31, 1, 70)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (71, 24, 1, 71)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (72, 27, 1, 72)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (73, 12, 1, 73)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (74, 89, 1, 74)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (75, 54, 1, 75)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (76, 37, 1, 76)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (77, 2, 1, 77)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (78, 81, 1, 78)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (79, 45, 1, 79)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (80, 96, 1, 80)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (81, 33, 1, 81)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (82, 64, 1, 82)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (83, 19, 1, 83)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (84, 77, 1, 84)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (85, 41, 1, 85)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (86, 24, 2, 1)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (87, 37, 2, 2)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (88, 22, 2, 3)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (89, 48, 2, 4)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (90, 16, 2, 5)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (91, 42, 2, 6)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (92, 9, 2, 7)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (93, 31, 2, 8)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (94, 44, 2, 9)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (95, 19, 2, 10)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (96, 27, 2, 11)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (97, 14, 2, 12)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (98, 38, 2, 13)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (99, 46, 2, 14)
GO
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (100, 3, 2, 15)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (101, 35, 2, 16)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (102, 18, 2, 17)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (103, 49, 2, 18)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (104, 23, 2, 19)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (105, 47, 2, 20)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (106, 33, 2, 21)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (107, 2, 2, 22)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (108, 15, 2, 23)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (109, 26, 2, 24)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (110, 41, 2, 25)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (111, 13, 2, 26)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (112, 40, 2, 27)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (113, 12, 2, 28)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (114, 39, 2, 29)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (115, 10, 2, 30)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (116, 34, 2, 31)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (117, 21, 2, 32)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (118, 45, 2, 33)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (119, 5, 2, 34)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (120, 36, 2, 35)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (121, 28, 2, 36)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (122, 43, 2, 37)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (123, 20, 2, 38)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (124, 4, 2, 39)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (125, 25, 2, 40)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (126, 50, 2, 41)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (127, 8, 2, 42)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (128, 29, 2, 43)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (129, 36, 2, 44)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (130, 13, 2, 45)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (131, 21, 2, 46)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (132, 47, 2, 47)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (133, 49, 2, 48)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (134, 7, 2, 49)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (135, 27, 2, 50)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (136, 31, 2, 51)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (137, 16, 2, 52)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (138, 1, 2, 53)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (139, 38, 2, 54)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (140, 22, 2, 55)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (141, 50, 2, 56)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (142, 34, 2, 57)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (143, 6, 2, 58)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (144, 28, 2, 59)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (145, 15, 2, 60)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (146, 37, 2, 61)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (147, 19, 2, 62)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (148, 4, 2, 63)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (149, 33, 2, 64)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (150, 46, 2, 65)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (151, 41, 2, 66)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (152, 14, 2, 67)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (153, 29, 2, 68)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (154, 43, 2, 69)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (155, 35, 2, 70)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (156, 2, 2, 71)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (157, 17, 2, 72)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (158, 42, 2, 73)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (159, 23, 2, 74)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (160, 12, 2, 75)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (161, 30, 2, 76)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (162, 8, 2, 77)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (163, 39, 2, 78)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (164, 5, 2, 79)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (165, 0, 2, 80)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (166, 20, 2, 81)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (167, 40, 2, 82)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (168, 9, 2, 83)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (169, 26, 2, 84)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (170, 11, 2, 85)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (171, 35, 3, 1)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (172, 22, 3, 2)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (173, 0, 3, 3)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (174, 12, 3, 4)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (175, 23, 3, 5)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (176, 42, 3, 6)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (177, 14, 3, 7)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (178, 33, 3, 8)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (179, 26, 3, 9)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (180, 9, 3, 10)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (181, 29, 3, 11)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (182, 18, 3, 12)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (183, 43, 3, 13)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (184, 47, 3, 14)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (185, 4, 3, 15)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (186, 35, 3, 16)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (187, 20, 3, 17)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (188, 38, 3, 18)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (189, 42, 3, 19)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (190, 11, 3, 20)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (191, 22, 3, 21)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (192, 27, 3, 22)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (193, 35, 3, 23)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (194, 20, 3, 24)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (195, 13, 3, 25)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (196, 27, 3, 26)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (197, 41, 3, 27)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (198, 23, 3, 28)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (199, 23, 3, 29)
GO
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (200, 6, 3, 30)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (201, 32, 3, 31)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (202, 24, 3, 32)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (203, 15, 3, 33)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (204, 38, 3, 34)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (205, 7, 3, 35)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (206, 21, 3, 36)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (207, 45, 3, 37)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (208, 14, 3, 38)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (209, 26, 3, 39)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (210, 7, 3, 40)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (211, 29, 3, 41)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (212, 33, 3, 42)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (213, 18, 3, 43)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (214, 44, 3, 44)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (215, 20, 3, 45)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (216, 37, 3, 46)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (217, 6, 3, 47)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (218, 16, 3, 48)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (219, 48, 3, 49)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (220, 9, 3, 50)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (221, 28, 3, 51)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (222, 25, 3, 52)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (223, 13, 3, 53)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (224, 47, 3, 54)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (225, 8, 3, 55)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (226, 20, 3, 56)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (227, 45, 3, 57)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (228, 36, 3, 58)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (229, 22, 3, 59)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (230, 18, 3, 60)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (231, 32, 3, 61)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (232, 16, 3, 62)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (233, 13, 3, 63)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (234, 43, 3, 64)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (235, 38, 3, 65)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (236, 17, 3, 66)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (237, 22, 3, 67)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (238, 6, 3, 68)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (239, 47, 3, 69)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (240, 21, 3, 70)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (241, 29, 3, 71)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (242, 10, 3, 72)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (243, 16, 3, 73)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (244, 3, 3, 74)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (245, 41, 3, 75)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (246, 36, 3, 76)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (247, 8, 3, 77)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (248, 30, 3, 78)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (249, 45, 3, 79)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (250, 7, 3, 80)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (251, 0, 3, 81)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (252, 42, 3, 82)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (253, 18, 3, 83)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (254, 18, 3, 84)
INSERT [dbo].[cellphoneapp_branch_product_color] ([Id], [Amount], [idBranch_id], [idProductColor_id]) VALUES (255, 0, 3, 85)
SET IDENTITY_INSERT [dbo].[cellphoneapp_branch_product_color] OFF
GO
SET IDENTITY_INSERT [dbo].[cellphoneapp_branch_promotion_product] ON 

INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (1, 0.1, 1, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (2, 0.2, 2, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (3, 0.3, 3, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (4, 0.3, 4, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (5, 0.2, 5, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (6, 0.2, 6, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (7, 0.1, 7, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (8, 0.5, 8, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (9, 0.3, 9, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (10, 0.2, 10, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (11, 0.1, 11, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (12, 0.1, 12, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (13, 0.1, 13, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (14, 0.1, 14, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (15, 0.1, 15, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (16, 0.1, 16, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (17, 0.2, 17, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (18, 0.3, 18, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (19, 0.3, 19, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (20, 0.3, 20, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (21, 0.3, 21, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (22, 0.3, 22, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (23, 0.3, 23, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (24, 0.3, 24, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (25, 0.3, 25, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (26, 0.3, 26, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (27, 0.3, 27, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (28, 0.3, 28, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (29, 0.3, 29, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (30, 0.3, 30, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (31, 0.3, 31, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (32, 0.3, 32, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (33, 0.3, 33, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (34, 0.3, 34, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (35, 0.3, 35, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (36, 0.3, 36, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (37, 0.3, 37, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (38, 0.3, 38, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (39, 0.3, 39, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (40, 0.3, 40, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (41, 0.3, 61, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (42, 0.3, 62, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (43, 0.3, 63, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (44, 0.3, 64, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (45, 0.3, 65, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (46, 0.3, 66, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (47, 0.3, 67, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (48, 0.6, 86, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (49, 0.2, 87, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (50, 0.3, 88, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (51, 0.3, 89, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (52, 0.2, 90, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (53, 0.2, 91, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (54, 0.1, 92, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (55, 0.5, 93, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (56, 0.3, 94, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (57, 0.2, 95, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (58, 0.1, 96, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (59, 0.1, 97, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (60, 0.1, 98, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (61, 0.1, 99, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (62, 0.1, 100, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (63, 0.1, 101, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (64, 0.2, 102, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (65, 0.3, 103, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (66, 0.3, 104, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (67, 0.3, 105, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (68, 0.3, 106, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (69, 0.3, 107, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (70, 0.3, 108, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (71, 0.3, 109, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (72, 0.3, 110, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (73, 0.3, 111, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (74, 0.3, 112, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (75, 0.3, 113, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (76, 0.3, 114, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (77, 0.3, 115, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (78, 0.3, 116, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (79, 0.3, 117, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (80, 0.3, 118, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (81, 0.3, 119, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (82, 0.3, 120, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (83, 0.3, 121, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (84, 0.3, 122, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (85, 0.3, 123, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (86, 0.3, 124, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (87, 0.3, 125, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (88, 0.3, 146, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (89, 0.3, 147, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (90, 0.3, 148, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (91, 0.3, 149, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (92, 0.3, 150, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (93, 0.3, 151, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (94, 0.3, 152, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (95, 0.2, 171, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (96, 0.2, 172, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (97, 0.2, 173, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (98, 0.2, 174, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (99, 0.2, 175, 3)
GO
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (100, 0.2, 176, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (101, 0.1, 177, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (102, 0.3, 178, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (103, 0.2, 179, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (104, 0.2, 180, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (105, 0.2, 181, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (106, 0.2, 182, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (107, 0.2, 183, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (108, 0.2, 184, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (109, 0.2, 185, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (110, 0.3, 186, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (111, 0.1, 187, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (112, 0.3, 188, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (113, 0.2, 189, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (114, 0.2, 190, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (115, 0.1, 240, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (116, 0.2, 241, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (117, 0.3, 242, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (118, 0.1, 243, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (119, 0.2, 244, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (120, 0.2, 245, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (121, 0.1, 246, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (122, 0.2, 247, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (123, 0.3, 248, 3)
INSERT [dbo].[cellphoneapp_branch_promotion_product] ([Id], [discountRate], [idBrandProductColor_id], [idPromotion_id]) VALUES (124, 0.1, 249, 3)
SET IDENTITY_INSERT [dbo].[cellphoneapp_branch_promotion_product] OFF
GO
INSERT [dbo].[cellphoneapp_color] ([names]) VALUES (N'Đen')
INSERT [dbo].[cellphoneapp_color] ([names]) VALUES (N'Trắng')
INSERT [dbo].[cellphoneapp_color] ([names]) VALUES (N'Vàng')
INSERT [dbo].[cellphoneapp_color] ([names]) VALUES (N'Xám')
INSERT [dbo].[cellphoneapp_color] ([names]) VALUES (N'Xanh')
GO
SET IDENTITY_INSERT [dbo].[cellphoneapp_comment] ON 

INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (1, N'Đúng như thông tin, chúng thật tuyệt vời', 1, 1)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (2, N'Tôi rất hài lòng với sản phẩm này, cảm ơn nhà sản xuất!', 2, 2)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (3, N'Sản phẩm chất lượng, giá cả hợp lý, tôi rất hài lòng!', 3, 3)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (4, N'Chất lượng tuyệt vời, giao hàng nhanh chóng, tôi sẽ quay lại mua hàng!', 4, 4)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (5, N'Đóng gói sản phẩm rất cẩn thận, tôi rất hài lòng với dịch vụ của bạn!', 5, 5)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (6, N'Sản phẩm đáng tin cậy, tôi sẽ giới thiệu cho bạn bè của tôi!', 6, 6)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (7, N'Sản phẩm đẹp và chất lượng, cảm ơn nhà sản xuất!', 7, 7)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (8, N'Giao hàng rất nhanh chóng, tôi rất ấn tượng với dịch vụ của bạn!', 8, 8)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (9, N'Sản phẩm tuyệt vời, tôi rất hài lòng với dịch vụ của bạn!', 9, 9)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (10, N'Sản phẩm tốt và giá cả phải chăng, tôi sẽ mua lại sản phẩm này!', 10, 10)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (11, N'Sản phẩm rất tốt!', 1, 10)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (12, N'Mình rất hài lòng với sản phẩm này!', 1, 3)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (13, N'Đánh giá cao chất lượng sản phẩm!', 1, 12)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (14, N'Sản phẩm đáng mua!', 1, 5)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (15, N'Sản phẩm rất đáng tiền, chất lượng tuyệt vời!', 2, 7)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (16, N'Sản phẩm chất lượng, tôi rất hài lòng với mua hàng này', 2, 11)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (17, N'Sản phẩm tuyệt vời, giá thành hợp lý', 2, 2)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (18, N'Mua hàng rất nhanh chóng và sản phẩm rất đẹp', 2, 9)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (19, N'Sản phẩm rất tốt, đáng mua!', 3, 7)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (20, N'Tôi rất hài lòng với sản phẩm này!', 3, 12)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (21, N'Sản phẩm chất lượng, giá cả hợp lý', 3, 4)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (22, N'Sản phẩm tuyệt vời, mình đã mua và rất hài lòng!', 3, 8)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (23, N'Sản phẩm rất tốt, đáng mua!', 4, 10)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (24, N'Sản phẩm chất lượng, giá cả hợp lý', 4, 6)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (25, N'Tôi rất hài lòng với sản phẩm này!', 4, 14)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (26, N'Sản phẩm tuyệt vời, mình đã mua và rất hài lòng!', 4, 1)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (27, N'Sản phẩm tốt, giá cả hợp lý, rất hài lòng với dịch vụ', 5, 10)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (28, N'Sản phẩm đáng mua, chất lượng tuyệt vời, đóng gói kỹ lưỡng', 5, 7)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (29, N'Sản phẩm rất ổn, đóng gói kỹ càng, nhân viên phục vụ nhiệt tình', 5, 15)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (30, N'Sản phẩm chất lượng, đóng gói đẹp, đáng để mua', 5, 3)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (31, N'Hàng chất lượng, đáng mua', 6, 7)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (32, N'Sản phẩm tốt, giá cả hợp lý', 6, 14)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (33, N'Sản phẩm đúng như mô tả, rất ổn', 6, 6)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (34, N'Sản phẩm đáng mua, chất lượng tốt', 6, 9)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (35, N'Sản phẩm đẹp và chất lượng tuyệt vời, mình rất hài lòng về sản phẩm này', 7, 2)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (36, N'Sản phẩm rất tốt, mình sẽ giới thiệu cho bạn bè của mình', 7, 12)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (37, N'Mình rất thích sản phẩm này, rất đáng tiền', 7, 8)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (38, N'Sản phẩm đáng mua, mình đã mua và rất hài lòng với sản phẩm', 7, 5)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (39, N'Sản phẩm không tốt lắm, không đáp ứng được nhu cầu của mình', 8, 2)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (40, N'Tôi rất thích sản phẩm này, rất đáng tiền', 8, 10)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (41, N'Sản phẩm đáp ứng được nhu cầu của mình, tuyệt vời!', 8, 13)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (42, N'Sản phẩm chất lượng tốt, đáp ứng được mong đợi của mình', 8, 5)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (43, N'Tôi không hài lòng với sản phẩm này. Sản phẩm rất kém chất lượng.', 9, 10)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (44, N'Sản phẩm tốt và đáng giá tiền. Tôi rất hài lòng với sản phẩm này!', 9, 2)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (45, N'Sản phẩm không được như mình mong đợi. Tuy nhiên, dịch vụ khách hàng rất tốt.', 9, 11)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (46, N'Sản phẩm chất lượng cao và dịch vụ giao hàng nhanh chóng. Tôi rất hài lòng với sản phẩm này!', 9, 6)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (47, N'Sản phẩm này thật tuyệt vời, tôi đã sử dụng được một thời gian', 10, 7)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (48, N'Mình thấy sản phẩm này khá ổn, đáng đồng tiền bát gạo, sẽ tiếp tục mua ở đây!', 10, 11)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (49, N'Sản phẩm không được như mong đợi lắm, có vẻ chất lượng còn hạn chế', 10, 5)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (50, N'Mình cực kì hài lòng với sản phẩm này! Chất lượng đúng với giá tiền', 10, 14)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (51, N'Sản phẩm rất đẹp, tôi rất hài lòng với chất lượng của nó!', 16, 11)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (52, N'Tôi đã mua sản phẩm này cho người yêu của tôi và cô ấy rất thích nó!', 16, 5)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (53, N'Sản phẩm hoạt động tuyệt vời, tôi chắc chắn sẽ giới thiệu cho bạn bè của mình!', 16, 8)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (54, N'Tôi không thể tin được giá cả của sản phẩm này! Nó rất tốt!', 16, 3)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (55, N'Sản phẩm chất lượng tuyệt vời, giá cả phải chăng. Tôi rất hài lòng với sản phẩm này!', 17, 7)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (56, N'Mình rất thích sản phẩm này, đặc biệt là chất lượng và thiết kế của nó. Tuyệt vời!', 17, 9)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (57, N'Sản phẩm chất lượng và đáng tin cậy, tôi rất hài lòng với nó!', 17, 12)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (58, N'Mình đặt hàng sản phẩm này và rất vui vì đã làm như vậy. Sản phẩm rất tốt và đáng giá!', 17, 2)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (59, N'Sản phẩm tốt, tôi rất hài lòng với sản phẩm này', 18, 8)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (60, N'Sản phẩm đẹp, tuyệt vời', 18, 3)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (61, N'Sản phẩm chất lượng tốt, tôi rất hài lòng', 18, 11)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (62, N'Sản phẩm tuyệt vời, giá cả hợp lý', 18, 7)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (63, N'Sản phẩm tuyệt vời, tôi đã mua và rất hài lòng với nó.', 19, 5)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (64, N'Chất lượng tuyệt vời, đúng như mô tả.', 19, 8)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (65, N'Sản phẩm chất lượng, tôi rất hài lòng với sự lựa chọn này.', 19, 2)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (66, N'Cực kỳ hài lòng với sản phẩm, tôi đã mua hàng nhiều lần và không bao giờ thất vọng.', 19, 11)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (67, N'Sản phẩm tốt, đáng để sử dụng!', 20, 7)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (68, N'Rất hài lòng với sản phẩm này!', 20, 9)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (69, N'Đúng như mô tả, rất tuyệt vời!', 20, 3)
INSERT [dbo].[cellphoneapp_comment] ([Id], [contentComment], [idProduct_id], [idUser_id]) VALUES (70, N'Sản phẩm chất lượng, giá cả hợp lý!', 20, 13)
SET IDENTITY_INSERT [dbo].[cellphoneapp_comment] OFF
GO
INSERT [dbo].[cellphoneapp_earphone] ([product_ptr_id], [connectionType], [Design], [Frequency_Response]) VALUES (36, N'Bluetooth', N'In-ear', N'20 Hz - 20 kHz')
INSERT [dbo].[cellphoneapp_earphone] ([product_ptr_id], [connectionType], [Design], [Frequency_Response]) VALUES (37, N'Bluetooth', N'In-ear', N'20 Hz - 20 kHz')
INSERT [dbo].[cellphoneapp_earphone] ([product_ptr_id], [connectionType], [Design], [Frequency_Response]) VALUES (38, N'Bluetooth', N'In-ear', N'20 Hz - 20 kHz')
INSERT [dbo].[cellphoneapp_earphone] ([product_ptr_id], [connectionType], [Design], [Frequency_Response]) VALUES (39, N'Bluetooth', N'In-ear', N'20 Hz - 20 kHz')
INSERT [dbo].[cellphoneapp_earphone] ([product_ptr_id], [connectionType], [Design], [Frequency_Response]) VALUES (40, N'Bluetooth', N'In-ear', N'20 Hz - 20 kHz')
GO
SET IDENTITY_INSERT [dbo].[cellphoneapp_imageproduct] ON 

INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (1, N'Xám', N'https://cdn2.cellphones.com.vn/358x/media/catalog/product/s/a/samsung-galaxy-s21-ultra-1_1_1_2_2.jpg', 1)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (2, N'Đen', N'https://cdn2.cellphones.com.vn/358x/media/catalog/product/s/p/spa_800x800_1_4_1_2_1.png', 1)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (3, N'Xám', N'https://cdn2.cellphones.com.vn/358x/media/catalog/product/s/a/samsung-galaxy-s21-ultra-1_1_1_2_2.jpg', 41)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (4, N'Đen', N'https://cdn2.cellphones.com.vn/358x/media/catalog/product/s/p/spa_800x800_1_4_1_2_1.png', 41)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (5, N'Xanh', N'https://cdn2.cellphones.com.vn/358x/media/catalog/product/x/a/xanhh_3.jpg', 2)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (6, N'Trắng', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/4/_/4_36_3_2_1_9.jpg', 2)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (7, N'Xanh', N'https://cdn2.cellphones.com.vn/358x/media/catalog/product/x/a/xanhh_3.jpg', 42)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (8, N'Trắng', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/4/_/4_36_3_2_1_9.jpg', 42)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (9, N'Xám', N'https://cdn2.cellphones.com.vn/358x/media/catalog/product/x/i/xiaomi_poco_f4_plata_01_l_1.jpg', 3)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (10, N'Đen', N'https://cdn2.cellphones.com.vn/358x/media/catalog/product/x/i/xiaomi_poco_f4_negro_01_l_1.jpg', 3)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (11, N'Xám', N'https://cdn2.cellphones.com.vn/358x/media/catalog/product/x/i/xiaomi_poco_f4_plata_01_l_1.jpg', 43)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (12, N'Đen', N'https://cdn2.cellphones.com.vn/358x/media/catalog/product/x/i/xiaomi_poco_f4_negro_01_l_1.jpg', 43)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (13, N'Trắng', N'https://cdn2.cellphones.com.vn/358x/media/catalog/product/x/i/xiaomi-11-lite-5g-014_2.jpg', 4)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (14, N'Đen', N'https://cdn2.cellphones.com.vn/358x/media/catalog/product/x/i/xiaomi-11-lite-5g-011_2.jpg', 4)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (15, N'Trắng', N'https://cdn2.cellphones.com.vn/358x/media/catalog/product/x/i/xiaomi-11-lite-5g-014_2.jpg', 44)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (16, N'Đen', N'https://cdn2.cellphones.com.vn/358x/media/catalog/product/x/i/xiaomi-11-lite-5g-011_2.jpg', 44)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (17, N'Đen', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/o/p/oppo-find-x3-pro-5g-1_2_2.jpg', 5)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (18, N'Xám', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/o/p/oppo-find-x3-pro-5g-3_2_2.jpg', 5)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (19, N'Đen', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/o/p/oppo-find-x3-pro-5g-1_2_2.jpg', 45)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (20, N'Xám', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/o/p/oppo-find-x3-pro-5g-3_2_2.jpg', 45)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (21, N'Trắng', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/o/n/oneplus-9_1.jpg', 6)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (22, N'Xanh', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/o/n/oneplus-9rt-600x600.jpg', 6)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (23, N'Trắng', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/o/n/oneplus-9_1.jpg', 46)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (24, N'Xanh', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/o/n/oneplus-9rt-600x600.jpg', 46)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (25, N'Xám', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/r/e/realme-gt-master-edition-geekbench-245.jpg', 7)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (26, N'Trắng', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/r/e/realme-gt-master-edition-geekbench-1.jpg', 7)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (27, N'Xám', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/r/e/realme-gt-master-edition-geekbench-245.jpg', 47)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (28, N'Trắng', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/r/e/realme-gt-master-edition-geekbench-1.jpg', 47)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (29, N'Xanh', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/s/a/samsung-galaxy-a52-25.jpg', 8)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (30, N'Đen', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/s/a/samsung-galaxy-a52-24.jpg', 8)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (31, N'Xanh', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/s/a/samsung-galaxy-a52-25.jpg', 48)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (32, N'Đen', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/s/a/samsung-galaxy-a52-24.jpg', 48)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (33, N'Xanh', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/4/_/4_185_4.jpg', 9)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (34, N'Trắng', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/3/_/3_223_3.jpg', 9)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (35, N'Xanh', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/4/_/4_185_4.jpg', 49)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (36, N'Trắng', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/3/_/3_223_3.jpg', 49)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (37, N'Đen', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/s/m/sm-g990_s21fe_backfront_za.png', 10)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (38, N'Trắng', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/s/m/sm-g990_s21fe_backfront_zw.png', 10)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (39, N'Đen', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/s/m/sm-g990_s21fe_backfront_za.png', 50)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (40, N'Trắng', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/s/m/sm-g990_s21fe_backfront_zw.png', 50)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (41, N'Đen', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/s/m/sm-g990_s21fe_backfront_za.png', 11)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (42, N'Xám', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/s/m/sm-g990_s21fe_backfront_lg.png', 11)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (43, N'Đen', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/s/m/sm-g990_s21fe_backfront_za.png', 51)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (44, N'Xám', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/s/m/sm-g990_s21fe_backfront_lg.png', 51)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (45, N'Đen', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/8/0/800x800-640x640-5_2.png', 12)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (46, N'Xanh', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/8/0/800x800-1-640x640-5_2.png', 12)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (47, N'Đen', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/8/0/800x800-640x640-5_2.png', 52)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (48, N'Xanh', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/8/0/800x800-1-640x640-5_2.png', 52)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (49, N'Đen', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/x/i/xiaomi-redmi-10c-1-001.jpg', 13)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (50, N'Xanh', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/x/i/xiaomi-redmi-10c-1-003.jpg', 13)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (51, N'Đen', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/x/i/xiaomi-redmi-10c-1-001.jpg', 53)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (52, N'Xanh', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/x/i/xiaomi-redmi-10c-1-003.jpg', 53)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (53, N'Trắng', N'https://cdn2.cellphones.com.vn/358x/media/catalog/product/p/h/photo_2022-09-28_21-58-48_8.jpg', 14)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (54, N'Xanh', N'https://cdn2.cellphones.com.vn/358x/media/catalog/product/p/h/photo_2022-09-28_21-58-51_7.jpg', 14)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (55, N'Trắng', N'https://cdn2.cellphones.com.vn/358x/media/catalog/product/p/h/photo_2022-09-28_21-58-48_8.jpg', 54)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (56, N'Xanh', N'https://cdn2.cellphones.com.vn/358x/media/catalog/product/p/h/photo_2022-09-28_21-58-51_7.jpg', 54)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (57, N'Trắng', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/i/p/iphone-12_3__5.jpg', 15)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (58, N'Xanh', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/i/p/iphone-12_7__6.jpg', 15)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (59, N'Trắng', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/i/p/iphone-12_3__5.jpg', 55)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (60, N'Xanh', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/i/p/iphone-12_7__6.jpg', 55)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (61, N'Đen', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/t/u/tuf-706-1_compressed-600x600.jpg', 16)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (62, N'Đen', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/1/_/1_75_44.jpg', 17)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (63, N'Trắng', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/_/0/_0003_46527_swift_3_sf314_511_ha2.jpg', 18)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (64, N'Đen', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/_/0/_0000_asus-zenbook-duo-ux481fl-bm049t_1_.jpg', 19)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (65, N'Đen', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/2/_/2_49_1.png', 20)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (66, N'Trắng', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/5/_/5_267.png', 21)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (67, N'Đen', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/3/4/34_1_22.jpg', 22)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (68, N'Trắng', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/_/0/_0004_acer_swift_3_sf314-43-r4x3_44c1f.jpg', 23)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (69, N'Đen', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/a/c/acer-predator-helios-300-ph315-5.png', 24)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (70, N'Đen', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/l/a/laptop-acer-gaming-aspire-7-a715-ryzen-7-ssd-512gb_2__1.jpg', 25)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (71, N'Trắng', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/m/a/macbook-air-space-gray-select-201810.jpg', 26)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (72, N'Đen', N'https://cdn2.cellphones.com.vn/358x/media/catalog/product/m/a/macbook_air_m2_1_1_1_2.jpg', 27)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (73, N'Trắng', N'https://cdn2.cellphones.com.vn/358x/media/catalog/product/m/b/mbp-silver-select-202206_3.jpg', 28)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (74, N'Trắng', N'https://laptopvang.com/wp-content/uploads/2023/02/macbook_pro_2023_16_inch_m2_pro_sg_ac-600x600.jpg', 29)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (75, N'Trắng', N'https://macstores.vn/wp-content/uploads/2021/10/macbook-pro-14-inch-2021-new-16gb-512gb.jpg', 30)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (76, N'Trắng', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/m/a/macbook-pro-2021-006_4.jpg', 31)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (77, N'Trắng', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/m/b/mbp13touch-gray.jpeg', 32)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (78, N'Trắng', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/1/_/1_119_2.png', 33)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (79, N'Trắng', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/l/a/laptop_hp_envy_13-aq1022tu_8qn69pa__0005_layer_1.jpg', 34)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (80, N'Trắng', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/t/e/text_ng_n_13__2_10.png', 35)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (81, N'Trắng', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/m/w/mwp22_av2_2.jpg', 36)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (82, N'Đen', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/1/_/1_10_27.jpg', 37)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (83, N'Trắng', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/j/a/jabra-elite-85t.jpg', 38)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (84, N'Trắng', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/g/r/group_187_2.png', 39)
INSERT [dbo].[cellphoneapp_imageproduct] ([Id], [Name], [linkImg], [idProduct_id]) VALUES (85, N'Trắng', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/t/a/tai-nghe-khong-day-beats-studio-buds_1_1.jpg', 40)
SET IDENTITY_INSERT [dbo].[cellphoneapp_imageproduct] OFF
GO
INSERT [dbo].[cellphoneapp_laptop] ([product_ptr_id], [CPU], [RAM], [ROM], [Graphic_Card], [Battery], [operatorSystem], [Others]) VALUES (16, N'Intel Core i7-11800H', N'16GB DDR4 3200MHz', N'512GB M.2 NVMe PCIe 3.0 SSD', N'NVIDIA GeForce RTX 3050 Ti 4GB GDDR6', N'48Whr Battery', N'Windows 10 Home', N'Backlit Keyboard')
INSERT [dbo].[cellphoneapp_laptop] ([product_ptr_id], [CPU], [RAM], [ROM], [Graphic_Card], [Battery], [operatorSystem], [Others]) VALUES (17, N'Intel Core i7-1165G7', N'16GB LPDDR4x 4266MHz', N'512GB M.2 NVMe PCIe 3.0 SSD', N'Intel Iris Xe Graphics', N'67Whr Battery', N'Windows 10 Home', N'NumberPad 2.0')
INSERT [dbo].[cellphoneapp_laptop] ([product_ptr_id], [CPU], [RAM], [ROM], [Graphic_Card], [Battery], [operatorSystem], [Others]) VALUES (18, N'AMD Ryzen 7 5700U', N'16GB LPDDR4X', N'512GB NVMe SSD', N'AMD Radeon Graphics', N'59Whr Battery', N'Windows 10 Home', N'Fingerprint Reader')
INSERT [dbo].[cellphoneapp_laptop] ([product_ptr_id], [CPU], [RAM], [ROM], [Graphic_Card], [Battery], [operatorSystem], [Others]) VALUES (19, N'Intel Core i7-1165G7', N'16GB LPDDR4x 4266MHz', N'1TB M.2 NVMe PCIe 3.0 SSD', N'NVIDIA GeForce MX450 2GB GDDR6', N'70Whr Battery', N'Windows 10 Home', N'ScreenPad Plus')
INSERT [dbo].[cellphoneapp_laptop] ([product_ptr_id], [CPU], [RAM], [ROM], [Graphic_Card], [Battery], [operatorSystem], [Others]) VALUES (20, N'Intel Core i7-1165G7', N'16GB LPDDR4x 4266MHz', N'512GB NVMe SSD', N'Intel Iris Xe Graphics', N'57Whr Battery', N'Windows 10 Pro', N'Fingerprint Reader')
INSERT [dbo].[cellphoneapp_laptop] ([product_ptr_id], [CPU], [RAM], [ROM], [Graphic_Card], [Battery], [operatorSystem], [Others]) VALUES (21, N'Intel Core i5-1135G7', N'8GB DDR4', N'512GB NVMe SSD', N'Intel Iris Xe Graphics', N'48Whr Battery', N'Windows 10 Home', N'Fingerprint Reader')
INSERT [dbo].[cellphoneapp_laptop] ([product_ptr_id], [CPU], [RAM], [ROM], [Graphic_Card], [Battery], [operatorSystem], [Others]) VALUES (22, N'Intel Core i7-11800H', N'16GB DDR4 3200MHz', N'512GB M.2 NVMe PCIe SSD', N'NVIDIA GeForce RTX 3060 6GB GDDR6', N'57Whr Battery', N'Windows 10 Home', N'Backlit Keyboard')
INSERT [dbo].[cellphoneapp_laptop] ([product_ptr_id], [CPU], [RAM], [ROM], [Graphic_Card], [Battery], [operatorSystem], [Others]) VALUES (23, N'Intel Core i7-8500Y', N'16GB LPDDR3', N'512GB PCIe NVMe SSD', N'Intel UHD Graphics 615', N'42Whr Battery', N'Windows 10 Home', N'Fingerprint Reader')
INSERT [dbo].[cellphoneapp_laptop] ([product_ptr_id], [CPU], [RAM], [ROM], [Graphic_Card], [Battery], [operatorSystem], [Others]) VALUES (24, N'Intel Core i7-11800H', N'16GB DDR4 3200MHz', N'512GB M.2 NVMe PCIe SSD', N'NVIDIA GeForce RTX 3070 8GB GDDR6', N'59Whr Battery', N'Windows 10 Home', N'RGB Keyboard')
INSERT [dbo].[cellphoneapp_laptop] ([product_ptr_id], [CPU], [RAM], [ROM], [Graphic_Card], [Battery], [operatorSystem], [Others]) VALUES (25, N'AMD Ryzen 7 5700U', N'16GB DDR4 3200MHz', N'512GB PCIe NVMe SSD', N'NVIDIA GeForce GTX 1650 4GB GDDR6', N'48Whr Battery', N'Windows 10 Home', N'Backlit Keyboard')
INSERT [dbo].[cellphoneapp_laptop] ([product_ptr_id], [CPU], [RAM], [ROM], [Graphic_Card], [Battery], [operatorSystem], [Others]) VALUES (26, N'Apple M1 chip with 8-core CPU and 7-core GPU', N'8GB unified memory', N'256GB SSD', N'Apple 7-core GPU', N'Up to 15 hours of web browsing', N'macOS', N'Retina display, Touch ID')
INSERT [dbo].[cellphoneapp_laptop] ([product_ptr_id], [CPU], [RAM], [ROM], [Graphic_Card], [Battery], [operatorSystem], [Others]) VALUES (27, N'Apple M1 chip with 8-core CPU and 7-core GPU', N'8GB unified memory', N'256GB SSD', N'Apple 7-core GPU', N'Up to 15 hours of web browsing', N'macOS', N'Retina display, Touch ID')
INSERT [dbo].[cellphoneapp_laptop] ([product_ptr_id], [CPU], [RAM], [ROM], [Graphic_Card], [Battery], [operatorSystem], [Others]) VALUES (28, N'Apple M1 chip with 8-core CPU and 7-core GPU', N'8GB unified memory', N'512GB SSD', N'Apple 7-core GPU', N'Up to 15 hours of web browsing', N'macOS', N'Retina display, Touch ID')
INSERT [dbo].[cellphoneapp_laptop] ([product_ptr_id], [CPU], [RAM], [ROM], [Graphic_Card], [Battery], [operatorSystem], [Others]) VALUES (29, N'Apple M1 chip with 8-core CPU and 7-core GPU', N'8GB unified memory', N'512GB SSD', N'Apple 7-core GPU', N'Up to 15 hours of web browsing', N'macOS', N'Retina display, Touch ID')
INSERT [dbo].[cellphoneapp_laptop] ([product_ptr_id], [CPU], [RAM], [ROM], [Graphic_Card], [Battery], [operatorSystem], [Others]) VALUES (30, N'Apple M1 Pro chip with 10-core CPU and 8-core GPU', N'16GB unified memory', N'1TB SSD', N'AMD Radeon Pro 5550M with 8GB of GDDR6 memory', N'Up to 17 hours of web browsing', N'macOS Monterey', N'14-inch Retina display, Touch Bar and Touch ID')
INSERT [dbo].[cellphoneapp_laptop] ([product_ptr_id], [CPU], [RAM], [ROM], [Graphic_Card], [Battery], [operatorSystem], [Others]) VALUES (31, N'Apple M1 Max chip with 10-core CPU and 32-core GPU', N'32GB unified memory', N'2TB SSD', N'Apple M1 Max 32-core GPU', N'Up to 21 hours of web browsing', N'macOS Monterey', N'16-inch Retina XDR display, ProMotion technology')
INSERT [dbo].[cellphoneapp_laptop] ([product_ptr_id], [CPU], [RAM], [ROM], [Graphic_Card], [Battery], [operatorSystem], [Others]) VALUES (32, N'Quad-core 10th-generation Intel Core i5 processor', N'16GB 3733MHz LPDDR4X memory', N'512GB SSD storage', N'Intel Iris Plus Graphics', N'Up to 10 hours of web browsing', N'macOS', N'13.3-inch Retina display, Touch Bar and Touch ID')
INSERT [dbo].[cellphoneapp_laptop] ([product_ptr_id], [CPU], [RAM], [ROM], [Graphic_Card], [Battery], [operatorSystem], [Others]) VALUES (33, N'Intel Core i7-1165G7', N'16GB DDR4-3200 SDRAM', N'512GB PCIe NVMe M.2 SSD', N'NVIDIA GeForce GTX 1650', N'Up to 10 hours of web browsing', N'Windows 10 Home', N'15.6-inch diagonal FHD IPS ')
INSERT [dbo].[cellphoneapp_laptop] ([product_ptr_id], [CPU], [RAM], [ROM], [Graphic_Card], [Battery], [operatorSystem], [Others]) VALUES (34, N'Intel Core i7-1165G7 Processor', N'16GB DDR4', N'512GB PCIe NVMe M.2 SSD', N'Intel Iris Xe Graphics', N'Up to 10 hours of web browsing', N'Windows 10 Home', N'13.3-inch FHD IPS BrightView micro-edge display')
INSERT [dbo].[cellphoneapp_laptop] ([product_ptr_id], [CPU], [RAM], [ROM], [Graphic_Card], [Battery], [operatorSystem], [Others]) VALUES (35, N'Intel Core i5-1135G7', N'8GB DDR4-3200 SDRAM', N'256GB PCIe NVMe M.2 SSD', N'Intel Iris Xe Graphics', N'Up to 10 hours of web browsing', N'Windows 10 Home 64', N'14-inch Full HD IPS micro-edge display')
GO
INSERT [dbo].[cellphoneapp_manufacture] ([names]) VALUES (N'Acer')
INSERT [dbo].[cellphoneapp_manufacture] ([names]) VALUES (N'Apple')
INSERT [dbo].[cellphoneapp_manufacture] ([names]) VALUES (N'ASUS')
INSERT [dbo].[cellphoneapp_manufacture] ([names]) VALUES (N'Beats')
INSERT [dbo].[cellphoneapp_manufacture] ([names]) VALUES (N'Bose')
INSERT [dbo].[cellphoneapp_manufacture] ([names]) VALUES (N'Dell')
INSERT [dbo].[cellphoneapp_manufacture] ([names]) VALUES (N'Gigabyte')
INSERT [dbo].[cellphoneapp_manufacture] ([names]) VALUES (N'HP')
INSERT [dbo].[cellphoneapp_manufacture] ([names]) VALUES (N'Jabra')
INSERT [dbo].[cellphoneapp_manufacture] ([names]) VALUES (N'JBL')
INSERT [dbo].[cellphoneapp_manufacture] ([names]) VALUES (N'Lenovo')
INSERT [dbo].[cellphoneapp_manufacture] ([names]) VALUES (N'MSI')
INSERT [dbo].[cellphoneapp_manufacture] ([names]) VALUES (N'OPPO')
INSERT [dbo].[cellphoneapp_manufacture] ([names]) VALUES (N'Razer')
INSERT [dbo].[cellphoneapp_manufacture] ([names]) VALUES (N'Realme')
INSERT [dbo].[cellphoneapp_manufacture] ([names]) VALUES (N'Samsung')
INSERT [dbo].[cellphoneapp_manufacture] ([names]) VALUES (N'Sony')
INSERT [dbo].[cellphoneapp_manufacture] ([names]) VALUES (N'Xiaomi')
GO
SET IDENTITY_INSERT [dbo].[cellphoneapp_order] ON 

INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (1, CAST(N'2022-06-10T00:00:00.0000000' AS DateTime2), N'1/3 Nguyễn Thái Sơn, Gò Vấp, TP.HCM', N'9999999991', N'1', 1)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (2, CAST(N'2022-07-15T00:00:00.0000000' AS DateTime2), N'1/3 Lý Thượng Hiền, Gò Vấp, TP.HCM', N'9999999991', N'1', 1)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (3, CAST(N'2022-08-10T00:00:00.0000000' AS DateTime2), N'13 Nguyễn Kiệm, Gò Vấp, TP.HCM', N'9999999991', N'2', 1)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (4, CAST(N'2022-06-20T00:00:00.0000000' AS DateTime2), N'1/3 Nguyễn Thái Sơn, Gò Vấp, TP.HCM', N'9999999992', N'2', 2)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (5, CAST(N'2022-07-10T00:00:00.0000000' AS DateTime2), N'13 Nguyễn Kiệm, Gò Vấp, TP.HCM', N'9999999992', N'1', 2)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (6, CAST(N'2022-08-10T00:00:00.0000000' AS DateTime2), N'1/3 Lý Thượng Hiền, Gò Vấp, TP.HCM', N'9999999992', N'2', 2)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (7, CAST(N'2022-11-10T00:00:00.0000000' AS DateTime2), N'97 Hồ Hảo Hớn, Q1, TP.HCM', N'9999999993', N'1', 3)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (8, CAST(N'2022-12-10T00:00:00.0000000' AS DateTime2), N'1/3 Nguyễn Thái Sơn, Gò Vấp, TP.HCM', N'9999999993', N'1', 3)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (9, CAST(N'2022-10-15T00:00:00.0000000' AS DateTime2), N'1/3 Nguyễn Thái Sơn, Gò Vấp, TP.HCM', N'9999999993', N'1', 3)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (10, CAST(N'2022-10-11T00:00:00.0000000' AS DateTime2), N'97 Hồ Hảo Hớn, Q1, TP.HCM', N'9999999994', N'1', 4)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (11, CAST(N'2022-10-20T00:00:00.0000000' AS DateTime2), N'13 Nguyễn Kiệm, Gò Vấp, TP.HCM', N'9999999994', N'2', 4)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (12, CAST(N'2022-10-21T00:00:00.0000000' AS DateTime2), N'13 Nguyễn Kiệm, Gò Vấp, TP.HCM', N'9999999994', N'1', 4)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (13, CAST(N'2022-10-21T00:00:00.0000000' AS DateTime2), N'13 Nguyễn Kiệm, Gò Vấp, TP.HCM', N'9999999995', N'1', 5)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (14, CAST(N'2022-10-21T00:00:00.0000000' AS DateTime2), N'97 Hồ Hảo Hớn, Q1, TP.HCM', N'9999999995', N'1', 5)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (15, CAST(N'2022-10-21T00:00:00.0000000' AS DateTime2), N'13 Nguyễn Kiệm, Gò Vấp, TP.HCM', N'9999999995', N'1', 5)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (16, CAST(N'2022-06-05T00:00:00.0000000' AS DateTime2), N'13 Nguyễn Kiệm, Gò Vấp, TP.HCM', N'5555555555', N'2', 6)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (17, CAST(N'2022-10-15T00:00:00.0000000' AS DateTime2), N'97 Hồ Hảo Hớn, Q1, TP.HCM', N'5555555555', N'1', 6)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (18, CAST(N'2022-09-04T00:00:00.0000000' AS DateTime2), N'13 Nguyễn Kiệm, Gò Vấp, TP.HCM', N'5555555555', N'3', 6)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (19, CAST(N'2022-09-25T00:00:00.0000000' AS DateTime2), N'13 Nguyễn Kiệm, Gò Vấp, TP.HCM', N'7777777777', N'2', 7)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (20, CAST(N'2022-10-08T00:00:00.0000000' AS DateTime2), N'13 Nguyễn Kiệm, Gò Vấp, TP.HCM', N'7777777777', N'1', 7)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (21, CAST(N'2022-09-03T00:00:00.0000000' AS DateTime2), N'97 Hồ Hảo Hớn, Q1, TP.HCM', N'7777777777', N'3', 7)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (22, CAST(N'2022-06-23T00:00:00.0000000' AS DateTime2), N'97 Hồ Hảo Hớn, Q1, TP.HCM', N'2222222222', N'1', 8)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (23, CAST(N'2022-05-13T00:00:00.0000000' AS DateTime2), N'13 Nguyễn Kiệm, Gò Vấp, TP.HCM', N'2222222222', N'3', 8)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (24, CAST(N'2022-03-25T00:00:00.0000000' AS DateTime2), N'97 Hồ Hảo Hớn, Q1, TP.HCM', N'2222222222', N'2', 8)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (25, CAST(N'2022-08-14T00:00:00.0000000' AS DateTime2), N'97 Hồ Hảo Hớn, Q1, TP.HCM', N'4444444444', N'3', 9)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (26, CAST(N'2022-11-26T00:00:00.0000000' AS DateTime2), N'13 Nguyễn Kiệm, Gò Vấp, TP.HCM', N'4444444444', N'2', 9)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (27, CAST(N'2022-12-03T00:00:00.0000000' AS DateTime2), N'1/3 Nguyễn Thái Sơn, Gò Vấp, TP.HCM', N'4444444444', N'1', 9)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (28, CAST(N'2022-10-25T00:00:00.0000000' AS DateTime2), N'1/3 Nguyễn Thái Sơn, Gò Vấp, TP.HCM', N'9876543210', N'2', 10)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (29, CAST(N'2022-12-02T00:00:00.0000000' AS DateTime2), N'1/3 Nguyễn Thái Sơn, Gò Vấp, TP.HCM', N'9876543210', N'1', 10)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (30, CAST(N'2022-10-30T00:00:00.0000000' AS DateTime2), N'13 Nguyễn Kiệm, Gò Vấp, TP.HCM', N'9876543210', N'3', 10)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (31, CAST(N'2022-12-20T00:00:00.0000000' AS DateTime2), N'1/3 Nguyễn Thái Sơn, Gò Vấp, TP.HCM', N'6666666666', N'3', 11)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (32, CAST(N'2022-10-06T00:00:00.0000000' AS DateTime2), N'13 Nguyễn Kiệm, Gò Vấp, TP.HCM', N'6666666666', N'1', 11)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (33, CAST(N'2022-11-15T00:00:00.0000000' AS DateTime2), N'97 Hồ Hảo Hớn, Q1, TP.HCM', N'6666666666', N'2', 11)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (34, CAST(N'2022-09-08T00:00:00.0000000' AS DateTime2), N'13 Nguyễn Kiệm, Gò Vấp, TP.HCM', N'1111111111', N'2', 12)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (35, CAST(N'2022-09-15T00:00:00.0000000' AS DateTime2), N'97 Hồ Hảo Hớn, Q1, TP.HCM', N'1111111111', N'1', 12)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (36, CAST(N'2022-09-29T00:00:00.0000000' AS DateTime2), N'123 Đường số 5, P.Bình Thuận, Q.7, TP.HCM', N'1111111111', N'3', 12)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (37, CAST(N'2022-11-01T00:00:00.0000000' AS DateTime2), N'456 Nguyễn Văn Linh, Q.7, TP.HCM', N'8888888888', N'2', 13)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (38, CAST(N'2022-10-12T00:00:00.0000000' AS DateTime2), N'789 Lê Văn Lương, Q.7, TP.HCM', N'8888888888', N'1', 13)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (39, CAST(N'2022-11-25T00:00:00.0000000' AS DateTime2), N'321 Phan Văn Trị, Q.5, TP.HCM', N'8888888888', N'3', 13)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (40, CAST(N'2022-09-20T00:00:00.0000000' AS DateTime2), N'456 Lê Văn Việt, Q.9, TP.HCM', N'9999999999', N'1', 14)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (41, CAST(N'2022-09-12T00:00:00.0000000' AS DateTime2), N'789 Lý Thường Kiệt, Q.10, TP.HCM', N'9999999999', N'2', 14)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (42, CAST(N'2022-10-01T00:00:00.0000000' AS DateTime2), N'1000 Nguyễn Hữu Thọ, Q.7, TP.HCM', N'9999999999', N'3', 14)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (43, CAST(N'2022-09-12T00:00:00.0000000' AS DateTime2), N'999 Lũy Bán Bích, Tân Phú, TP.HCM', N'1234567890', N'2', 15)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (44, CAST(N'2022-09-08T00:00:00.0000000' AS DateTime2), N'888 Quang Trung, Gò Vấp, TP.HCM', N'1234567890', N'1', 15)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (45, CAST(N'2022-10-15T00:00:00.0000000' AS DateTime2), N'666 Nguyễn Văn Cừ, Q.5, TP.HCM', N'1234567890', N'3', 15)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (59, CAST(N'2023-03-17T14:18:01.6197720' AS DateTime2), N'080202004241', N'0937793157', N'3', 40)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (60, CAST(N'2023-03-17T14:42:34.4520560' AS DateTime2), N'080202004241', N'0937793157', N'3', 41)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (61, CAST(N'2023-03-17T14:45:50.8914480' AS DateTime2), N'080202004241', N'0937793157', N'1', 42)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (62, CAST(N'2023-03-18T04:59:26.7603350' AS DateTime2), N'Long an', N'0937793157', N'1', 43)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (63, CAST(N'2023-03-18T05:03:46.5114960' AS DateTime2), N'080202004241', N'0937793157', N'1', 44)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (64, CAST(N'2023-03-18T05:11:10.4710370' AS DateTime2), N'Long An', N'0937793157', N'1', 45)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (65, CAST(N'2023-03-18T11:08:55.1194510' AS DateTime2), N'080202004241', N'0937793157', N'1', 46)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (66, CAST(N'2023-03-18T11:31:55.6535180' AS DateTime2), N'080202004241', N'0937793157', N'1', 47)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (67, CAST(N'2023-03-18T11:33:52.7497360' AS DateTime2), N'234567', N'0868196036', N'1', 48)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (68, CAST(N'2023-03-18T11:36:00.2270070' AS DateTime2), N'080202004241', N'0937793157', N'1', 49)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (69, CAST(N'2023-03-18T11:39:28.5889930' AS DateTime2), N'080202004241', N'0937793159', N'1', 50)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (70, CAST(N'2023-03-18T11:48:16.0586520' AS DateTime2), N'080202004241', N'0937793157', N'1', 51)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (71, CAST(N'2023-03-18T11:54:10.3240930' AS DateTime2), N'080202004241', N'0937793157', N'1', 52)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (72, CAST(N'2023-03-18T11:57:59.7650030' AS DateTime2), N'080202004241', N'0937793157', N'1', 53)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (73, CAST(N'2023-03-18T12:00:45.9508740' AS DateTime2), N'080202004241', N'0937793157', N'1', 54)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (74, CAST(N'2023-03-18T12:02:12.0338120' AS DateTime2), N'080202004241', N'0937793157', N'1', 55)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (75, CAST(N'2023-03-18T12:05:26.5095800' AS DateTime2), N'080202004241', N'0937793157', N'1', 56)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (76, CAST(N'2023-03-18T12:10:03.0982180' AS DateTime2), N'080202004241', N'0937793157', N'1', 57)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (77, CAST(N'2023-03-18T12:15:17.7212400' AS DateTime2), N'080202004241', N'0937793157', N'1', 58)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (78, CAST(N'2023-03-18T12:16:43.4324360' AS DateTime2), N'080202004241', N'0937793157', N'1', 59)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (79, CAST(N'2023-03-18T12:17:59.2895100' AS DateTime2), N'080202004241', N'0937793157', N'1', 60)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (80, CAST(N'2023-03-18T12:21:45.7721790' AS DateTime2), N'080202004241', N'0937793157', N'1', 61)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (81, CAST(N'2023-03-18T12:22:24.4918480' AS DateTime2), N'080202004241', N'0937793157', N'1', 62)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (82, CAST(N'2023-03-18T12:25:03.0662740' AS DateTime2), N'080202004241', N'0937793157', N'1', 63)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (83, CAST(N'2023-03-18T12:26:30.3689350' AS DateTime2), N'080202004241', N'0937793157', N'1', 64)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (84, CAST(N'2023-03-18T12:27:59.6371020' AS DateTime2), N'080202004241', N'0937793157', N'1', 65)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (85, CAST(N'2023-03-18T12:29:59.5355930' AS DateTime2), N'080202004241', N'0937793157', N'1', 66)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (86, CAST(N'2023-03-18T12:45:43.9499120' AS DateTime2), N'080202004241', N'0937793157', N'1', 67)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (87, CAST(N'2023-03-18T12:49:28.8144950' AS DateTime2), N'080202004241', N'0937793157', N'1', 68)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (88, CAST(N'2023-03-18T13:51:21.6532860' AS DateTime2), N'Thủ Đức, Hồ Chí Minh', N'0352671408', N'1', 69)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (89, CAST(N'2023-03-18T16:32:51.3298110' AS DateTime2), N'080202004241', N'0937793157', N'1', 70)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (90, CAST(N'2023-03-18T16:33:23.2087870' AS DateTime2), N'080202004241', N'0937793155', N'1', 71)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (91, CAST(N'2023-03-18T16:34:09.3109620' AS DateTime2), N'080202004241', N'0937793157', N'1', 72)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (92, CAST(N'2023-03-19T11:35:20.1445240' AS DateTime2), N'qưewe', N'0123456789', N'1', 75)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (93, CAST(N'2023-03-19T11:39:18.1088460' AS DateTime2), N'cqfvwetbhvcfwrgve', N'0894473846', N'1', 76)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (94, CAST(N'2023-03-19T11:44:30.1111860' AS DateTime2), N'ávsavsad', N'0999999997', N'1', 78)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (95, CAST(N'2023-03-19T11:46:59.6190920' AS DateTime2), N'ưdgbefcbdgrcg', N'0999999997', N'1', 79)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (96, CAST(N'2023-03-19T13:01:42.6397600' AS DateTime2), N'th hcm', N'0999999966', N'1', 80)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (97, CAST(N'2023-03-19T13:06:45.0743090' AS DateTime2), N'long an', N'0999999955', N'1', 82)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (98, CAST(N'2023-03-19T13:07:16.1625100' AS DateTime2), N'long an', N'0999999944', N'1', 83)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (99, CAST(N'2023-03-20T18:11:55.8389480' AS DateTime2), N'long an', N'0933333333', N'1', 84)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (100, CAST(N'2023-03-21T02:06:02.5219110' AS DateTime2), N'tp hcm', N'0944444444', N'1', 86)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (101, CAST(N'2023-03-21T02:13:45.7234310' AS DateTime2), N'ưerwefqfvef', N'0955555555', N'1', 87)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (102, CAST(N'2023-03-21T02:34:23.1709740' AS DateTime2), N'ưqwee', N'0911111111', N'1', 88)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (103, CAST(N'2023-03-22T04:27:08.5828750' AS DateTime2), N'alo', N'0999999999', N'1', 89)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (104, CAST(N'2023-03-27T20:28:12.0320000' AS DateTime2), N'string', N'string', N'1', 95)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (105, CAST(N'2023-03-27T20:33:22.4470000' AS DateTime2), N'string', N'string', N'1', 96)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (106, CAST(N'2023-03-27T20:35:51.1970000' AS DateTime2), N'string', N'string', N'1', 97)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (107, CAST(N'2023-03-27T20:43:25.4390000' AS DateTime2), N'string', N'string', N'1', 98)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (108, CAST(N'2023-03-27T20:43:25.4390000' AS DateTime2), N'string', N'string', N'1', 99)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (109, CAST(N'2023-03-27T20:43:25.4390000' AS DateTime2), N'string', N'string', N'1', 100)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (110, CAST(N'2023-03-27T21:27:12.8960000' AS DateTime2), N'080202004241', N'0937793157', N'1', 101)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (111, CAST(N'2023-03-28T06:06:09.8210000' AS DateTime2), N'080202004241', N'0937793157', N'1', 102)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (112, CAST(N'2023-03-28T10:51:25.1820000' AS DateTime2), N'080202004241', N'0888888881', N'1', 106)
GO
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (113, CAST(N'2023-03-28T10:52:54.0630000' AS DateTime2), N'080202004241', N'0937793150', N'1', 107)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (114, CAST(N'2023-03-28T10:53:58.5910000' AS DateTime2), N'080202004241', N'0937793157', N'1', 108)
INSERT [dbo].[cellphoneapp_order] ([Id], [orderDate], [deliveryAddress], [deliveryPhone], [Status], [idUser_id]) VALUES (115, CAST(N'2023-03-28T11:09:20.0190000' AS DateTime2), N'080202004241', N'0937793151', N'1', 109)
SET IDENTITY_INSERT [dbo].[cellphoneapp_order] OFF
GO
SET IDENTITY_INSERT [dbo].[cellphoneapp_orderdetail] ON 

INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (1, 3, 5, 1, CAST(2500000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (2, 2, 10, 2, CAST(8000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (3, 2, 20, 3, CAST(3300000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (4, 2, 100, 4, CAST(1000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (5, 4, 150, 5, CAST(2500000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (6, 1, 201, 6, CAST(7000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (7, 3, 162, 7, CAST(2400000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (8, 2, 13, 8, CAST(12000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (9, 9, 19, 9, CAST(3300000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (10, 1, 18, 10, CAST(3000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (11, 2, 1, 11, CAST(2000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (12, 5, 9, 12, CAST(8000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (13, 2, 40, 13, CAST(1900000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (14, 2, 60, 14, CAST(2600000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (15, 7, 25, 15, CAST(2000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (16, 2, 5, 16, CAST(2500000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (17, 2, 5, 17, CAST(2500000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (18, 2, 66, 18, CAST(2800000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (19, 2, 88, 19, CAST(1800000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (20, 2, 82, 20, CAST(2500000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (21, 3, 123, 21, CAST(1700000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (22, 4, 243, 22, CAST(30000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (23, 1, 68, 23, CAST(2200000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (24, 5, 150, 24, CAST(2500000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (25, 2, 55, 25, CAST(3500000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (26, 1, 182, 26, CAST(1000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (27, 4, 240, 27, CAST(3000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (28, 2, 53, 28, CAST(3200000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (29, 1, 198, 29, CAST(9000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (30, 5, 97, 30, CAST(1000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (31, 5, 232, 31, CAST(2700000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (32, 4, 205, 32, CAST(2000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (33, 1, 75, 33, CAST(3100000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (34, 1, 211, 34, CAST(2100000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (35, 3, 165, 35, CAST(2600000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (36, 5, 44, 36, CAST(2300000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (37, 1, 39, 37, CAST(1900000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (38, 3, 184, 38, CAST(1200000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (39, 2, 27, 39, CAST(9000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (40, 3, 149, 40, CAST(3200000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (41, 5, 247, 41, CAST(2400000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (42, 1, 179, 42, CAST(8000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (43, 4, 245, 43, CAST(3100000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (44, 2, 12, 44, CAST(1000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (45, 1, 57, 45, CAST(2500000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (46, 2, 197, 1, CAST(9000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (47, 3, 60, 2, CAST(26000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (48, 1, 25, 3, CAST(10000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (49, 2, 105, 4, CAST(33000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (50, 3, 146, 5, CAST(26000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (51, 2, 5, 6, CAST(25000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (52, 1, 26, 7, CAST(10000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (53, 3, 30, 8, CAST(6000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (54, 5, 190, 9, CAST(33000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (55, 2, 20, 10, CAST(33000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (56, 1, 7, 11, CAST(24000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (57, 3, 56, 12, CAST(35500000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (58, 2, 53, 13, CAST(3200000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (59, 1, 36, 14, CAST(20500000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (60, 5, 45, 15, CAST(11000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (61, 1, 75, 16, CAST(31000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (62, 1, 49, 17, CAST(4000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (63, 2, 90, 18, CAST(25000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (64, 2, 72, 19, CAST(24000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (65, 2, 39, 20, CAST(19000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (66, 3, 61, 1, CAST(26000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (67, 2, 100, 2, CAST(10000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (68, 2, 182, 3, CAST(10000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (69, 2, 4, 4, CAST(18000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (70, 5, 9, 5, CAST(8000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (71, 2, 254, 6, CAST(2300000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (72, 2, 83, 7, CAST(2500000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (73, 1, 10, 8, CAST(8000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (74, 7, 23, 9, CAST(11000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (75, 2, 80, 10, CAST(26000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (76, 2, 139, 11, CAST(3250000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (77, 6, 225, 12, CAST(35000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (78, 2, 93, 13, CAST(24500000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (79, 2, 166, 14, CAST(3000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (80, 5, 252, 15, CAST(2500000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (81, 2, 65, 16, CAST(25000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (82, 2, 63, 17, CAST(30000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (83, 2, 177, 18, CAST(24000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (84, 1, 99, 19, CAST(12000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (85, 1, 200, 20, CAST(6000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (107, 2, 5, 59, CAST(20000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (108, 2, 6, 59, CAST(20400000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (109, 2, 5, 59, CAST(20000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (110, 2, 6, 59, CAST(20400000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (111, 2, 5, 60, CAST(20000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (112, 1, 190, 60, CAST(26400000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (113, 2, 5, 60, CAST(20000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (114, 1, 189, 61, CAST(26400000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (115, 1, 243, 61, CAST(27000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (116, 1, 185, 61, CAST(8000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (117, 1, 9, 62, CAST(5600000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (118, 2, 10, 62, CAST(5600000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (119, 1, 12, 62, CAST(9000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (120, 2, 10, 62, CAST(5600000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (121, 1, 9, 63, CAST(5600000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (122, 2, 10, 63, CAST(5600000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (123, 1, 12, 63, CAST(9000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (124, 2, 10, 63, CAST(5600000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (125, 1, 12, 64, CAST(9000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (126, 2, 12, 65, CAST(9000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (127, 2, 12, 65, CAST(9000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (128, 2, 12, 66, CAST(9000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (129, 2, 12, 66, CAST(9000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (130, 2, 12, 67, CAST(9000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (131, 2, 12, 67, CAST(9000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (132, 1, 1, 68, CAST(18000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (133, 1, 1, 69, CAST(18000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (134, 2, 17, 69, CAST(24000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (135, 1, 18, 69, CAST(24000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (136, 2, 17, 69, CAST(24000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (137, 1, 1, 70, CAST(18000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (138, 2, 17, 70, CAST(24000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (139, 1, 18, 70, CAST(24000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (140, 2, 17, 70, CAST(24000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (141, 1, 1, 74, CAST(18000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (142, 2, 17, 74, CAST(24000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (143, 1, 18, 74, CAST(24000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (144, 2, 17, 74, CAST(24000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (145, 2, 1, 85, CAST(18000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (146, 2, 5, 85, CAST(20000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (147, 2, 5, 86, CAST(20000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (148, 2, 51, 86, CAST(5000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (149, 2, 5, 87, CAST(20000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (150, 2, 51, 87, CAST(5000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (151, 1, 67, 87, CAST(16800000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (152, 2, 8, 88, CAST(22050000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (153, 1, 64, 88, CAST(22400000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (154, 2, 8, 89, CAST(22050000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (155, 1, 64, 89, CAST(22400000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (156, 2, 8, 90, CAST(22050000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (157, 1, 64, 90, CAST(22400000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (158, 2, 8, 91, CAST(22050000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (159, 1, 64, 91, CAST(22400000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (160, 1, 1, 92, CAST(18000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (161, 1, 13, 93, CAST(10800000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (162, 1, 14, 93, CAST(10800000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (163, 1, 15, 93, CAST(9000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (164, 1, 16, 93, CAST(9000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (165, 1, 13, 94, CAST(10800000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (166, 1, 14, 94, CAST(10800000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (167, 1, 15, 94, CAST(9000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (168, 1, 16, 94, CAST(9000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (169, 1, 187, 95, CAST(27000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (170, 1, 188, 95, CAST(27000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (171, 1, 190, 95, CAST(26400000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (172, 1, 9, 96, CAST(5600000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (173, 1, 33, 96, CAST(12600000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (174, 1, 34, 96, CAST(12950000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (175, 1, 33, 97, CAST(12600000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (176, 1, 34, 97, CAST(12950000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (177, 1, 33, 98, CAST(12600000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (178, 1, 34, 98, CAST(12950000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (179, 1, 29, 99, CAST(4200000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (180, 2, 26, 100, CAST(7000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (181, 1, 67, 101, CAST(16800000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (182, 1, 67, 102, CAST(16800000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (183, 1, 5, 103, CAST(20000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (187, 1, 1, 107, CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (188, 1, 1, 108, CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (189, 1, 1, 109, CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (190, 2, 2, 109, CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (191, 1, 1, 110, CAST(18000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (192, 1, 70, 111, CAST(30000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (193, 1, 1, 111, CAST(18000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (194, 1, 190, 112, CAST(26400000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (195, 1, 187, 112, CAST(27000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (196, 1, 246, 112, CAST(22500000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (197, 1, 199, 113, CAST(6000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (198, 1, 200, 113, CAST(6000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (199, 1, 201, 113, CAST(7000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (200, 1, 202, 113, CAST(7000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (201, 1, 202, 114, CAST(7000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (202, 2, 249, 114, CAST(27000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (203, 1, 248, 114, CAST(17500000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (204, 2, 202, 115, CAST(7000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (205, 2, 249, 115, CAST(27000000.00 AS Decimal(10, 2)))
INSERT [dbo].[cellphoneapp_orderdetail] ([Id], [Quantity], [idBrandProductColor_id], [idOder_id], [unit_price]) VALUES (206, 1, 248, 115, CAST(17500000.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[cellphoneapp_orderdetail] OFF
GO
SET IDENTITY_INSERT [dbo].[cellphoneapp_product] ON 

INSERT [dbo].[cellphoneapp_product] ([Id], [Name], [nameManufacture_id], [Type]) VALUES (1, N'Samsung Galaxy S21 Ultra', N'Samsung', N'phone')
INSERT [dbo].[cellphoneapp_product] ([Id], [Name], [nameManufacture_id], [Type]) VALUES (2, N'iPhone 13 Pro Max', N'Apple', N'phone')
INSERT [dbo].[cellphoneapp_product] ([Id], [Name], [nameManufacture_id], [Type]) VALUES (3, N'Xiaomi Poco F4', N'Xiaomi', N'phone')
INSERT [dbo].[cellphoneapp_product] ([Id], [Name], [nameManufacture_id], [Type]) VALUES (4, N'Xiaomi Mi 11 Ultra', N'Xiaomi', N'phone')
INSERT [dbo].[cellphoneapp_product] ([Id], [Name], [nameManufacture_id], [Type]) VALUES (5, N'OPPO Find X3 Pro', N'OPPO', N'phone')
INSERT [dbo].[cellphoneapp_product] ([Id], [Name], [nameManufacture_id], [Type]) VALUES (6, N'OnePlus 9 Pro', N'Xiaomi', N'phone')
INSERT [dbo].[cellphoneapp_product] ([Id], [Name], [nameManufacture_id], [Type]) VALUES (7, N'realme GT Master Edition', N'Realme', N'phone')
INSERT [dbo].[cellphoneapp_product] ([Id], [Name], [nameManufacture_id], [Type]) VALUES (8, N'Samsung Galaxy A52', N'Samsung', N'phone')
INSERT [dbo].[cellphoneapp_product] ([Id], [Name], [nameManufacture_id], [Type]) VALUES (9, N'iPhone 12 Pro', N'Apple', N'phone')
INSERT [dbo].[cellphoneapp_product] ([Id], [Name], [nameManufacture_id], [Type]) VALUES (10, N'Samsung Galaxy S21', N'Samsung', N'phone')
INSERT [dbo].[cellphoneapp_product] ([Id], [Name], [nameManufacture_id], [Type]) VALUES (11, N'Samsung Galaxy Note S21 Ultra', N'Samsung', N'phone')
INSERT [dbo].[cellphoneapp_product] ([Id], [Name], [nameManufacture_id], [Type]) VALUES (12, N'Xiaomi Redmi Note 11', N'Xiaomi', N'phone')
INSERT [dbo].[cellphoneapp_product] ([Id], [Name], [nameManufacture_id], [Type]) VALUES (13, N'Xiaomi Redmi 10C', N'Xiaomi', N'phone')
INSERT [dbo].[cellphoneapp_product] ([Id], [Name], [nameManufacture_id], [Type]) VALUES (14, N'iPhone 14 Plus', N'Apple', N'phone')
INSERT [dbo].[cellphoneapp_product] ([Id], [Name], [nameManufacture_id], [Type]) VALUES (15, N'iPhone 12 mini', N'Apple', N'phone')
INSERT [dbo].[cellphoneapp_product] ([Id], [Name], [nameManufacture_id], [Type]) VALUES (16, N'Laptop ASUS TUF Gaming F15', N'ASUS', N'laptop')
INSERT [dbo].[cellphoneapp_product] ([Id], [Name], [nameManufacture_id], [Type]) VALUES (17, N'Laptop ASUS ZenBook 14', N'ASUS', N'laptop')
INSERT [dbo].[cellphoneapp_product] ([Id], [Name], [nameManufacture_id], [Type]) VALUES (18, N'Laptop Acer Swift 3', N'Acer', N'laptop')
INSERT [dbo].[cellphoneapp_product] ([Id], [Name], [nameManufacture_id], [Type]) VALUES (19, N'Laptop ASUS ZenBook Duo', N'ASUS', N'laptop')
INSERT [dbo].[cellphoneapp_product] ([Id], [Name], [nameManufacture_id], [Type]) VALUES (20, N'Laptop Lenovo ThinkPad X1 Carbon', N'Lenovo', N'laptop')
INSERT [dbo].[cellphoneapp_product] ([Id], [Name], [nameManufacture_id], [Type]) VALUES (21, N'Laptop Acer Aspire 5', N'Acer', N'laptop')
INSERT [dbo].[cellphoneapp_product] ([Id], [Name], [nameManufacture_id], [Type]) VALUES (22, N'Laptop Gaming Acer Nitro 5', N'Acer', N'laptop')
INSERT [dbo].[cellphoneapp_product] ([Id], [Name], [nameManufacture_id], [Type]) VALUES (23, N'Laptop Acer Swift 7', N'Acer', N'laptop')
INSERT [dbo].[cellphoneapp_product] ([Id], [Name], [nameManufacture_id], [Type]) VALUES (24, N'Laptop Gaming Acer Predator Helios 300', N'Acer', N'laptop')
INSERT [dbo].[cellphoneapp_product] ([Id], [Name], [nameManufacture_id], [Type]) VALUES (25, N'Laptop Acer Aspire 7', N'Acer', N'laptop')
INSERT [dbo].[cellphoneapp_product] ([Id], [Name], [nameManufacture_id], [Type]) VALUES (26, N'Laptop MacBook Air M1', N'Apple', N'laptop')
INSERT [dbo].[cellphoneapp_product] ([Id], [Name], [nameManufacture_id], [Type]) VALUES (27, N'Laptop MacBook Air M2', N'Apple', N'laptop')
INSERT [dbo].[cellphoneapp_product] ([Id], [Name], [nameManufacture_id], [Type]) VALUES (28, N'Laptop MacBook Pro 13 M2', N'Apple', N'laptop')
INSERT [dbo].[cellphoneapp_product] ([Id], [Name], [nameManufacture_id], [Type]) VALUES (29, N'Laptop MacBook Pro 16', N'Apple', N'laptop')
INSERT [dbo].[cellphoneapp_product] ([Id], [Name], [nameManufacture_id], [Type]) VALUES (30, N'Laptop MacBook Pro 14', N'Apple', N'laptop')
INSERT [dbo].[cellphoneapp_product] ([Id], [Name], [nameManufacture_id], [Type]) VALUES (31, N'Laptop MacBook Pro 16 M1', N'Apple', N'laptop')
INSERT [dbo].[cellphoneapp_product] ([Id], [Name], [nameManufacture_id], [Type]) VALUES (32, N'MacBook Pro 13-inch Touch Bar', N'Apple', N'laptop')
INSERT [dbo].[cellphoneapp_product] ([Id], [Name], [nameManufacture_id], [Type]) VALUES (33, N'Laptop HP Pavilion 15', N'HP', N'laptop')
INSERT [dbo].[cellphoneapp_product] ([Id], [Name], [nameManufacture_id], [Type]) VALUES (34, N'Laptop HP Envy 13', N'HP', N'laptop')
INSERT [dbo].[cellphoneapp_product] ([Id], [Name], [nameManufacture_id], [Type]) VALUES (35, N'Laptop HP Pavilion 14', N'HP', N'laptop')
INSERT [dbo].[cellphoneapp_product] ([Id], [Name], [nameManufacture_id], [Type]) VALUES (36, N'AirPods Pro', N'Apple', N'earphone')
INSERT [dbo].[cellphoneapp_product] ([Id], [Name], [nameManufacture_id], [Type]) VALUES (37, N'Bose QuietComfort Earbuds', N'Bose', N'earphone')
INSERT [dbo].[cellphoneapp_product] ([Id], [Name], [nameManufacture_id], [Type]) VALUES (38, N'Jabra Elite 85t', N'Jabra', N'earphone')
INSERT [dbo].[cellphoneapp_product] ([Id], [Name], [nameManufacture_id], [Type]) VALUES (39, N'Sony WF-1000XM4', N'Sony', N'earphone')
INSERT [dbo].[cellphoneapp_product] ([Id], [Name], [nameManufacture_id], [Type]) VALUES (40, N'Beats Studio Buds', N'Beats', N'earphone')
INSERT [dbo].[cellphoneapp_product] ([Id], [Name], [nameManufacture_id], [Type]) VALUES (41, N'Samsung Galaxy S21 Ultra', N'Samsung', N'phone')
INSERT [dbo].[cellphoneapp_product] ([Id], [Name], [nameManufacture_id], [Type]) VALUES (42, N'iPhone 13 Pro Max', N'Apple', N'phone')
INSERT [dbo].[cellphoneapp_product] ([Id], [Name], [nameManufacture_id], [Type]) VALUES (43, N'Xiaomi Poco F4', N'Xiaomi', N'phone')
INSERT [dbo].[cellphoneapp_product] ([Id], [Name], [nameManufacture_id], [Type]) VALUES (44, N'Xiaomi Mi 11 Ultra', N'Xiaomi', N'phone')
INSERT [dbo].[cellphoneapp_product] ([Id], [Name], [nameManufacture_id], [Type]) VALUES (45, N'OPPO Find X3 Pro', N'OPPO', N'phone')
INSERT [dbo].[cellphoneapp_product] ([Id], [Name], [nameManufacture_id], [Type]) VALUES (46, N'OnePlus 9 Pro', N'Xiaomi', N'phone')
INSERT [dbo].[cellphoneapp_product] ([Id], [Name], [nameManufacture_id], [Type]) VALUES (47, N'realme GT Master Edition', N'realme', N'phone')
INSERT [dbo].[cellphoneapp_product] ([Id], [Name], [nameManufacture_id], [Type]) VALUES (48, N'Samsung Galaxy A52', N'Samsung', N'phone')
INSERT [dbo].[cellphoneapp_product] ([Id], [Name], [nameManufacture_id], [Type]) VALUES (49, N'iPhone 12 Pro', N'Apple', N'phone')
INSERT [dbo].[cellphoneapp_product] ([Id], [Name], [nameManufacture_id], [Type]) VALUES (50, N'Samsung Galaxy S21', N'Samsung', N'phone')
INSERT [dbo].[cellphoneapp_product] ([Id], [Name], [nameManufacture_id], [Type]) VALUES (51, N'Samsung Galaxy Note S21 Ultra', N'Samsung', N'phone')
INSERT [dbo].[cellphoneapp_product] ([Id], [Name], [nameManufacture_id], [Type]) VALUES (52, N'Xiaomi Redmi Note 11', N'Xiaomi', N'phone')
INSERT [dbo].[cellphoneapp_product] ([Id], [Name], [nameManufacture_id], [Type]) VALUES (53, N'Xiaomi Redmi 10C', N'Xiaomi', N'phone')
INSERT [dbo].[cellphoneapp_product] ([Id], [Name], [nameManufacture_id], [Type]) VALUES (54, N'iPhone 14 Plus', N'Apple', N'phone')
INSERT [dbo].[cellphoneapp_product] ([Id], [Name], [nameManufacture_id], [Type]) VALUES (55, N'iPhone 12 mini', N'Apple', N'phone')
INSERT [dbo].[cellphoneapp_product] ([Id], [Name], [nameManufacture_id], [Type]) VALUES (56, N'samsung j7', N'Samsung', N'phone')
INSERT [dbo].[cellphoneapp_product] ([Id], [Name], [nameManufacture_id], [Type]) VALUES (58, N'siêu cấp samsung cực mạnh', N'Samsung', N'phone')
SET IDENTITY_INSERT [dbo].[cellphoneapp_product] OFF
GO
SET IDENTITY_INSERT [dbo].[cellphoneapp_product_color] ON 

INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (1, CAST(20000000.00 AS Decimal(10, 2)), 1, N'Xám')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (2, CAST(20000000.00 AS Decimal(10, 2)), 1, N'Đen')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (3, CAST(18000000.00 AS Decimal(10, 2)), 41, N'Xám')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (4, CAST(18000000.00 AS Decimal(10, 2)), 41, N'Đen')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (5, CAST(25000000.00 AS Decimal(10, 2)), 2, N'Xanh')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (6, CAST(25500000.00 AS Decimal(10, 2)), 2, N'Trắng')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (7, CAST(24000000.00 AS Decimal(10, 2)), 42, N'Xanh')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (8, CAST(24500000.00 AS Decimal(10, 2)), 42, N'Trắng')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (9, CAST(8000000.00 AS Decimal(10, 2)), 3, N'Xám')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (10, CAST(8000000.00 AS Decimal(10, 2)), 3, N'Đen')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (11, CAST(10000000.00 AS Decimal(10, 2)), 43, N'Xám')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (12, CAST(10000000.00 AS Decimal(10, 2)), 43, N'Đen')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (13, CAST(12000000.00 AS Decimal(10, 2)), 4, N'Trắng')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (14, CAST(12000000.00 AS Decimal(10, 2)), 4, N'Đen')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (15, CAST(10000000.00 AS Decimal(10, 2)), 44, N'Trắng')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (16, CAST(10000000.00 AS Decimal(10, 2)), 44, N'Đen')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (17, CAST(30000000.00 AS Decimal(10, 2)), 5, N'Đen')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (18, CAST(30000000.00 AS Decimal(10, 2)), 5, N'Xám')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (19, CAST(33000000.00 AS Decimal(10, 2)), 45, N'Đen')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (20, CAST(33000000.00 AS Decimal(10, 2)), 45, N'Xám')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (21, CAST(12000000.00 AS Decimal(10, 2)), 6, N'Trắng')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (22, CAST(12000000.00 AS Decimal(10, 2)), 6, N'Xanh')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (23, CAST(11000000.00 AS Decimal(10, 2)), 46, N'Trắng')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (24, CAST(11000000.00 AS Decimal(10, 2)), 46, N'Xanh')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (25, CAST(10000000.00 AS Decimal(10, 2)), 7, N'Xám')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (26, CAST(10000000.00 AS Decimal(10, 2)), 7, N'Trắng')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (27, CAST(9000000.00 AS Decimal(10, 2)), 47, N'Xám')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (28, CAST(9000000.00 AS Decimal(10, 2)), 47, N'Trắng')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (29, CAST(6000000.00 AS Decimal(10, 2)), 8, N'Xanh')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (30, CAST(6000000.00 AS Decimal(10, 2)), 8, N'Đen')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (31, CAST(7000000.00 AS Decimal(10, 2)), 48, N'Xanh')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (32, CAST(7000000.00 AS Decimal(10, 2)), 48, N'Đen')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (33, CAST(18000000.00 AS Decimal(10, 2)), 9, N'Xanh')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (34, CAST(18500000.00 AS Decimal(10, 2)), 9, N'Trắng')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (35, CAST(20000000.00 AS Decimal(10, 2)), 49, N'Xanh')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (36, CAST(20500000.00 AS Decimal(10, 2)), 49, N'Trắng')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (37, CAST(17000000.00 AS Decimal(10, 2)), 10, N'Đen')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (38, CAST(17000000.00 AS Decimal(10, 2)), 10, N'Trắng')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (39, CAST(19000000.00 AS Decimal(10, 2)), 50, N'Đen')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (40, CAST(19000000.00 AS Decimal(10, 2)), 50, N'Trắng')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (41, CAST(21000000.00 AS Decimal(10, 2)), 11, N'Đen')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (42, CAST(21000000.00 AS Decimal(10, 2)), 11, N'Xám')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (43, CAST(23000000.00 AS Decimal(10, 2)), 51, N'Đen')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (44, CAST(23000000.00 AS Decimal(10, 2)), 51, N'Xám')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (45, CAST(11000000.00 AS Decimal(10, 2)), 12, N'Đen')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (46, CAST(11000000.00 AS Decimal(10, 2)), 12, N'Xanh')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (47, CAST(12000000.00 AS Decimal(10, 2)), 52, N'Đen')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (48, CAST(12000000.00 AS Decimal(10, 2)), 52, N'Xanh')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (49, CAST(4000000.00 AS Decimal(10, 2)), 13, N'Đen')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (50, CAST(4000000.00 AS Decimal(10, 2)), 13, N'Xanh')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (51, CAST(5000000.00 AS Decimal(10, 2)), 53, N'Đen')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (52, CAST(5000000.00 AS Decimal(10, 2)), 53, N'Xanh')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (53, CAST(3200000.00 AS Decimal(10, 2)), 14, N'Xanh')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (54, CAST(3250000.00 AS Decimal(10, 2)), 14, N'Trắng')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (55, CAST(35000000.00 AS Decimal(10, 2)), 54, N'Xanh')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (56, CAST(35500000.00 AS Decimal(10, 2)), 54, N'Trắng')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (57, CAST(2500000.00 AS Decimal(10, 2)), 15, N'Trắng')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (58, CAST(2500000.00 AS Decimal(10, 2)), 15, N'Xanh')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (59, CAST(26000000.00 AS Decimal(10, 2)), 55, N'Trắng')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (60, CAST(26000000.00 AS Decimal(10, 2)), 55, N'Xanh')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (61, CAST(26000000.00 AS Decimal(10, 2)), 16, N'Đen')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (62, CAST(27000000.00 AS Decimal(10, 2)), 17, N'Đen')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (63, CAST(30000000.00 AS Decimal(10, 2)), 18, N'Trắng')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (64, CAST(32000000.00 AS Decimal(10, 2)), 19, N'Đen')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (65, CAST(25000000.00 AS Decimal(10, 2)), 20, N'Đen')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (66, CAST(28000000.00 AS Decimal(10, 2)), 21, N'Trắng')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (67, CAST(24000000.00 AS Decimal(10, 2)), 22, N'Đen')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (68, CAST(22000000.00 AS Decimal(10, 2)), 23, N'Trắng')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (69, CAST(23000000.00 AS Decimal(10, 2)), 24, N'Đen')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (70, CAST(30000000.00 AS Decimal(10, 2)), 25, N'Đen')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (71, CAST(28000000.00 AS Decimal(10, 2)), 26, N'Trắng')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (72, CAST(24000000.00 AS Decimal(10, 2)), 27, N'Đen')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (73, CAST(30000000.00 AS Decimal(10, 2)), 28, N'Trắng')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (74, CAST(26000000.00 AS Decimal(10, 2)), 29, N'Trắng')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (75, CAST(31000000.00 AS Decimal(10, 2)), 30, N'Trắng')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (76, CAST(25000000.00 AS Decimal(10, 2)), 31, N'Trắng')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (77, CAST(24000000.00 AS Decimal(10, 2)), 32, N'Trắng')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (78, CAST(25000000.00 AS Decimal(10, 2)), 33, N'Trắng')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (79, CAST(30000000.00 AS Decimal(10, 2)), 34, N'Trắng')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (80, CAST(26000000.00 AS Decimal(10, 2)), 35, N'Trắng')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (81, CAST(3000000.00 AS Decimal(10, 2)), 36, N'Trắng')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (82, CAST(2500000.00 AS Decimal(10, 2)), 37, N'Đen')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (83, CAST(2500000.00 AS Decimal(10, 2)), 38, N'Trắng')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (84, CAST(2300000.00 AS Decimal(10, 2)), 39, N'Trắng')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (85, CAST(2200000.00 AS Decimal(10, 2)), 40, N'Trắng')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (88, CAST(12345678.00 AS Decimal(10, 2)), 58, N'Trắng')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (89, CAST(2000000.00 AS Decimal(10, 2)), 58, N'Xám')
INSERT [dbo].[cellphoneapp_product_color] ([Id], [Price], [idProduct_id], [nameColor_id]) VALUES (90, CAST(3000000.00 AS Decimal(10, 2)), 58, N'Xanh')
SET IDENTITY_INSERT [dbo].[cellphoneapp_product_color] OFF
GO
SET IDENTITY_INSERT [dbo].[cellphoneapp_promotion] ON 

INSERT [dbo].[cellphoneapp_promotion] ([Id], [timeStart], [timeEnd], [Active]) VALUES (1, CAST(N'2022-04-10T00:00:00.0000000' AS DateTime2), CAST(N'2022-05-10T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[cellphoneapp_promotion] ([Id], [timeStart], [timeEnd], [Active]) VALUES (2, CAST(N'2022-06-10T00:00:00.0000000' AS DateTime2), CAST(N'2022-07-10T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[cellphoneapp_promotion] ([Id], [timeStart], [timeEnd], [Active]) VALUES (3, CAST(N'2023-03-10T00:00:00.0000000' AS DateTime2), CAST(N'2023-04-10T00:00:00.0000000' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[cellphoneapp_promotion] OFF
GO
SET IDENTITY_INSERT [dbo].[cellphoneapp_review] ON 

INSERT [dbo].[cellphoneapp_review] ([Id], [Title], [Content], [idProduct_id]) VALUES (1, N'Samsung Galaxy S21 Ultra', N'Mạnh mẽ và sắc nét, Samsung S21 Ultra có màn hình Dynamic AMOLED 2X 6.8 inch, bộ 4 camera 108 MP và vi xử lý Exynos 2100/Snapdragon 888', 1)
INSERT [dbo].[cellphoneapp_review] ([Id], [Title], [Content], [idProduct_id]) VALUES (2, N'iPhone 13 Pro Max', N'Mạnh mẽ và sang trọng, iPhone 13 Pro Max có màn hình Super Retina XDR OLED 6.7 inch, bộ vi xử lý A15 Bionic, và hệ thống camera siêu khủng.', 2)
INSERT [dbo].[cellphoneapp_review] ([Id], [Title], [Content], [idProduct_id]) VALUES (3, N'Xiaomi Poco F4', N'Màn hình AMOLED 120Hz lớn, bộ vi xử lý Snapdragon 888 Plus và hệ thống camera chất lượng cao đặt vivo X70 Pro+ ở đẳng cấp hàng đầu.', 3)
INSERT [dbo].[cellphoneapp_review] ([Id], [Title], [Content], [idProduct_id]) VALUES (4, N'Xiaomi Mi 11 Ultra', N'Xiaomi Mi 11 Ultra là chiếc smartphone đỉnh cao của Xiaomi với màn hình AMOLED 6.81 inch, bộ vi xử lý Snapdragon 888 và camera siêu khủng.', 4)
INSERT [dbo].[cellphoneapp_review] ([Id], [Title], [Content], [idProduct_id]) VALUES (5, N'OPPO Find X3 Pro', N'OPPO Find X3 Pro là chiếc smartphone cao cấp với màn hình AMOLED 120Hz, bộ vi xử lý Snapdragon 888 và hệ thống camera siêu nét 50MP.', 5)
INSERT [dbo].[cellphoneapp_review] ([Id], [Title], [Content], [idProduct_id]) VALUES (6, N'OnePlus 9 Pro', N'OnePlus 9 Pro là chiếc smartphone cao cấp với màn hình Fluid AMOLED 120Hz, bộ vi xử lý Snapdragon 888 và hệ thống camera đa năng 48MP.', 6)
INSERT [dbo].[cellphoneapp_review] ([Id], [Title], [Content], [idProduct_id]) VALUES (7, N'realme GT Master Edition', N'realme GT Master Edition là một smartphone tầm trung với màn hình AMOLED 120Hz, bộ vi xử lý Snapdragon 778G và hệ thống camera đa năng 64MP.', 7)
INSERT [dbo].[cellphoneapp_review] ([Id], [Title], [Content], [idProduct_id]) VALUES (8, N'Samsung Galaxy A52', N'Samsung Galaxy A52 là một smartphone tầm trung với màn hình Super AMOLED 90Hz, bộ vi xử lý Snapdragon 720G và hệ thống camera đa năng 64MP.', 8)
INSERT [dbo].[cellphoneapp_review] ([Id], [Title], [Content], [idProduct_id]) VALUES (9, N'iPhone 12 Pro', N'iPhone 12 Pro là một trong những chiếc smartphone hàng đầu của Apple, với màn hình OLED 6.1 inch, chip A14 Bionic và hệ thống camera đa năng 12MP.', 9)
INSERT [dbo].[cellphoneapp_review] ([Id], [Title], [Content], [idProduct_id]) VALUES (10, N'Samsung Galaxy S21', N'Với màn hình Dynamic AMOLED 2X, camera chuyên nghiệp và tốc độ xử lý nhanh như gió, Samsung Galaxy S21 sẽ đem đến cho bạn trải nghiệm sắc nét và đỉnh cao của công nghệ di động', 10)
INSERT [dbo].[cellphoneapp_review] ([Id], [Title], [Content], [idProduct_id]) VALUES (11, N'Samsung Galaxy Note S21 Ultra', N'Samsung Galaxy Note S21 Ultra - Thiết kế sang trọng, camera chất lượng cao, màn hình cực đỉnh, sạc nhanh 45W, bút S Pen tiện lợi. Sản phẩm đáng mua nhất năm', 11)
INSERT [dbo].[cellphoneapp_review] ([Id], [Title], [Content], [idProduct_id]) VALUES (12, N'Xiaomi Redmi Note 11', N'Với thiết kế mỏng nhẹ, hiệu năng cao và màn hình đẹp, Xiaomi Redmi Note 11 là lựa chọn hoàn hảo cho công việc và giải trí.', 12)
INSERT [dbo].[cellphoneapp_review] ([Id], [Title], [Content], [idProduct_id]) VALUES (13, N'Xiaomi Redmi 10C', N'Thiết kế mỏng nhẹ, cấu hình mạnh mẽ cho trải nghiệm làm việc và giải trí tuyệt vời', 13)
INSERT [dbo].[cellphoneapp_review] ([Id], [Title], [Content], [idProduct_id]) VALUES (14, N'iPhone 14 Plus', N'iPhone 14 Plus có thiết kế siêu mỏng nhẹ, màn hình cực kỳ sắc nét, hiệu năng mạnh mẽ và pin bền bỉ lên tới 19,5 giờ sử dụng.', 14)
INSERT [dbo].[cellphoneapp_review] ([Id], [Title], [Content], [idProduct_id]) VALUES (15, N'iPhone 12 mini', N'iPhone 12 mini là một chiếc điênh thoại siêu mỏng nhẹ với thiết kế bền bỉ và đầy đủ tính năng, phù hợp cho doanh nhân di chuyển nhiều.', 15)
INSERT [dbo].[cellphoneapp_review] ([Id], [Title], [Content], [idProduct_id]) VALUES (16, N'Laptop ASUS TUF Gaming F15', N'ASUS TUF Gaming F15 là một trong những laptop gaming đáng mua nhất hiện nay, được trang bị cấu hình mạnh mẽ và thiết kế bền bỉ', 16)
INSERT [dbo].[cellphoneapp_review] ([Id], [Title], [Content], [idProduct_id]) VALUES (17, N'Laptop ASUS ZenBook 14', N'Laptop mỏng nhẹ, thiết kế sang trọng, cấu hình mạnh mẽ với chip Intel Core i7 và card đồ họa NVIDIA GeForce MX450.', 17)
INSERT [dbo].[cellphoneapp_review] ([Id], [Title], [Content], [idProduct_id]) VALUES (18, N'Laptop Acer Swift 3', N'Laptop Acer Swift 3 với thiết kế mỏng nhẹ, màn hình Full HD, bộ vi xử lý mạnh mẽ và đầy đủ tính năng hiện đại sẽ đem đến cho bạn trải nghiệm tuyệt vời khi làm việc hay giải trí.', 18)
INSERT [dbo].[cellphoneapp_review] ([Id], [Title], [Content], [idProduct_id]) VALUES (19, N'Laptop ASUS ZenBook Duo', N'Laptop ASUS ZenBook Duo là chiếc laptop đột phá với màn hình thứ hai cảm ứng 14 inch nằm phía trên bàn phím, cho phép người dùng dễ dàng sử dụng nhiều tác vụ cùng lúc. Ngoài ra, sản phẩm này còn được trang bị bộ xử lý Intel Core i7 và card đồ họa NVIDIA GeForce MX250, đảm bảo hiệu suất mạnh mẽ cho người dùng.', 19)
INSERT [dbo].[cellphoneapp_review] ([Id], [Title], [Content], [idProduct_id]) VALUES (20, N'Laptop Lenovo ThinkPad X1 Carbon', N'Laptop Lenovo ThinkPad X1 Carbon là dòng laptop doanh nhân cao cấp của Lenovo, sở hữu thiết kế tinh tế, mỏng nhẹ, màn hình đẹp, cấu hình mạnh mẽ, bảo mật cao và độ bền tuyệt vời.', 20)
INSERT [dbo].[cellphoneapp_review] ([Id], [Title], [Content], [idProduct_id]) VALUES (21, N'Laptop Acer Aspire 5', N'Acer Aspire 5 là chiếc laptop đáng mua trong tầm giá với cấu hình tốt, thiết kế đẹp và tính di động cao', 21)
INSERT [dbo].[cellphoneapp_review] ([Id], [Title], [Content], [idProduct_id]) VALUES (22, N'Laptop Gaming Acer Nitro 5', N'Acer Nitro 5 là dòng laptop chơi game đáng mua trong tầm giá với hiệu năng mạnh mẽ và thiết kế đẹp mắt. Màn hình full HD 15.6 inch và card đồ họa rời NVIDIA GTX giúp trải nghiệm game thêm phần sống động.', 22)
INSERT [dbo].[cellphoneapp_review] ([Id], [Title], [Content], [idProduct_id]) VALUES (23, N'Laptop Acer Swift 7', N'Laptop Acer Swift 7 là một trong những mẫu laptop mỏng nhẹ và sang trọng của hãng Acer, với thiết kế đẹp mắt, cấu hình mạnh mẽ và hiệu năng ổn định, thích hợp cho người dùng cần sự tiện dụng và đẳng cấp.', 23)
INSERT [dbo].[cellphoneapp_review] ([Id], [Title], [Content], [idProduct_id]) VALUES (24, N'Laptop Gaming Acer Predator Helios 300', N'Laptop Gaming Acer Predator Helios 300 là một trong những sản phẩm được đánh giá cao về khả năng chơi game với cấu hình mạnh mẽ. Với vi xử lý Intel Core i7, card đồ họa rời NVIDIA GeForce RTX 3060, màn hình Full HD 144Hz, máy đáp ứng nhu cầu giải trí và làm việc đa nhiệm với hiệu suất ấn tượng.', 24)
INSERT [dbo].[cellphoneapp_review] ([Id], [Title], [Content], [idProduct_id]) VALUES (25, N'Laptop Acer Aspire 7', N'Laptop Acer Aspire 7 được trang bị vi xử lý Intel Core i5, card đồ họa rời NVIDIA GeForce GTX 1650Ti, RAM 8GB và ổ cứng SSD 512GB, đem lại hiệu suất mạnh mẽ cho người dùng.', 25)
INSERT [dbo].[cellphoneapp_review] ([Id], [Title], [Content], [idProduct_id]) VALUES (26, N'Laptop MacBook Air M1', N'Laptop MacBook Air M1 là một trong những sản phẩm đáng chú ý của Apple. Với chip M1 được thiết kế bởi chính Apple, MacBook Air M1 có hiệu suất mạnh mẽ và tuổi thọ pin lâu hơn. Thiết kế siêu mỏng nhẹ, màn hình Retina đẹp mắt và bàn phím Magic Keyboard đầy đủ tính năng là những điểm nhấn của sản phẩm.', 26)
INSERT [dbo].[cellphoneapp_review] ([Id], [Title], [Content], [idProduct_id]) VALUES (27, N'Laptop MacBook Air M2', N'Laptop MacBook Air M2 là phiên bản mới nhất của dòng sản phẩm MacBook Air của Apple, được trang bị chip M2 mới nhất của hãng. Thiết kế siêu mỏng nhẹ và hiệu suất mạnh mẽ, MacBook Air M2 là một sự lựa chọn tuyệt vời cho người dùng yêu thích thương hiệu Apple.', 27)
INSERT [dbo].[cellphoneapp_review] ([Id], [Title], [Content], [idProduct_id]) VALUES (28, N'Laptop MacBook Pro 13 M2', N'Laptop MacBook Pro 13 M2 sở hữu bộ xử lý M2 tốc độ cao và màn hình Retina sắc nét, cùng với thiết kế sang trọng, đây là sản phẩm lý tưởng cho các nhà thiết kế đồ họa và dân kỹ thuật.', 28)
INSERT [dbo].[cellphoneapp_review] ([Id], [Title], [Content], [idProduct_id]) VALUES (29, N'Laptop MacBook Pro 16', N'Laptop MacBook Pro 16 là một sản phẩm mới nhất của Apple với màn hình Retina 16 inch, bộ xử lý Intel Core i9 và card đồ họa AMD Radeon Pro 5500M. Thiết kế sang trọng, mỏng nhẹ cùng với bàn phím Magic Keyboard được cải tiến, đây là một trong những laptop cao cấp nhất trên thị trường hiện nay.', 29)
INSERT [dbo].[cellphoneapp_review] ([Id], [Title], [Content], [idProduct_id]) VALUES (30, N'Laptop MacBook Pro 14', N'MacBook Pro 14 là chiếc laptop cao cấp mới nhất của Apple, được trang bị bộ vi xử lý M2 mới nhất và màn hình Retina 14 inch. Thiết kế siêu mỏng và nhẹ, đem lại sự tiện dụng và di động tối đa cho người dùng.', 30)
INSERT [dbo].[cellphoneapp_review] ([Id], [Title], [Content], [idProduct_id]) VALUES (31, N'Laptop MacBook Pro 16 M1', N'Laptop MacBook Pro 16 M1 là một trong những sản phẩm mới nhất của Apple. Với chip M1 mới, máy đem lại hiệu suất mạnh mẽ và tiết kiệm pin hơn. Bên cạnh đó, màn hình Retina lớn và bàn phím Magic Keyboard cải tiến sẽ giúp bạn trải nghiệm công việc và giải trí một cách tốt nhất.', 31)
INSERT [dbo].[cellphoneapp_review] ([Id], [Title], [Content], [idProduct_id]) VALUES (32, N'MacBook Pro 13-inch Touch Bar', N'The MacBook Pro 13-inch Touch Bar features a stunning Retina display, powerful processors, and the Touch Bar for intuitive shortcuts. With its sleek design and advanced features, it''s the perfect choice for professionals and power users alike.', 32)
INSERT [dbo].[cellphoneapp_review] ([Id], [Title], [Content], [idProduct_id]) VALUES (33, N'Laptop HP Pavilion 15', N'Laptop HP Pavilion 15 là sản phẩm máy tính xách tay của hãng HP với thiết kế hiện đại và cấu hình mạnh mẽ. Với bộ vi xử lý Intel Core i5 thế hệ 10, card đồ họa rời NVIDIA GeForce GTX 1650 Ti và 8GB RAM, Laptop HP Pavilion 15 sẽ mang lại cho người dùng những trải nghiệm tuyệt vời trong việc làm việc và giải trí.', 33)
INSERT [dbo].[cellphoneapp_review] ([Id], [Title], [Content], [idProduct_id]) VALUES (34, N'Laptop HP Envy 13', N'Laptop HP Envy 13 là sản phẩm máy tính xách tay của hãng HP với thiết kế hiện đại và cấu hình mạnh mẽ. Với bộ vi xử lý Intel Core i5 thế hệ 10, card đồ họa rời NVIDIA GeForce GTX 1650 Ti và 8GB RAM, Laptop HP Pavilion 15 sẽ mang lại cho người dùng những trải nghiệm tuyệt vời trong việc làm việc và giải trí.', 34)
INSERT [dbo].[cellphoneapp_review] ([Id], [Title], [Content], [idProduct_id]) VALUES (35, N'Laptop HP Pavilion 14', N'Laptop HP Pavilion 14 là sản phẩm máy tính xách tay của hãng HP với thiết kế hiện đại và cấu hình mạnh mẽ. Với bộ vi xử lý Intel Core i5 thế hệ 10, card đồ họa rời NVIDIA GeForce GTX 1650 Ti và 8GB RAM, Laptop HP Pavilion 15 sẽ mang lại cho người dùng những trải nghiệm tuyệt vời trong việc làm việc và giải trí.', 35)
INSERT [dbo].[cellphoneapp_review] ([Id], [Title], [Content], [idProduct_id]) VALUES (36, N'AirPods Pro', N'AirPods Pro là một trong những sản phẩm tai nghe không dây phổ biến của Apple. Với chất lượng âm thanh tốt, tính năng chống ồn và thiết kế nhỏ gọn, AirPods Pro đã trở thành một lựa chọn ưa thích cho những người yêu thích công nghệ. Nếu bạn đang tìm kiếm một sản phẩm tai nghe không dây đáng mua, AirPods Pro là một lựa chọn tuyệt vời.', 36)
INSERT [dbo].[cellphoneapp_review] ([Id], [Title], [Content], [idProduct_id]) VALUES (37, N'Bose QuietComfort Earbuds', N'Bose QuietComfort Earbuds là một trong những sản phẩm tai nghe không dây có tính năng chống ồn tốt nhất trên thị trường hiện nay. Với thiết kế nhỏ gọn và chất lượng âm thanh tuyệt vời, Bose QuietComfort Earbuds là một sự lựa chọn tuyệt vời cho những người yêu thích âm nhạc và muốn trải nghiệm chất lượng âm thanh tốt nhất.', 37)
INSERT [dbo].[cellphoneapp_review] ([Id], [Title], [Content], [idProduct_id]) VALUES (38, N'Jabra Elite 85t', N'Jabra Elite 85t là một trong những sản phẩm tai nghe không dây chất lượng cao của Jabra. Với thiết kế sang trọng, chất lượng âm thanh tuyệt vời và tính năng chống ồn tiên tiến, Jabra Elite 85t là một lựa chọn hàng đầu cho những người yêu thích công nghệ và âm nhạc.', 38)
INSERT [dbo].[cellphoneapp_review] ([Id], [Title], [Content], [idProduct_id]) VALUES (39, N'Sony WF-1000XM4', N'Sony WF-1000XM4 là một trong những sản phẩm tai nghe không dây cao cấp của Sony. Với thiết kế đẹp mắt, chất lượng âm thanh tuyệt vời và tính năng chống ồn tốt, Sony WF-1000XM4 được đánh giá là một trong những tai nghe không dây tốt nhất trên thị trường hiện nay. Nếu bạn đang tìm kiếm một sản phẩm tai nghe không dây đáng mua, Sony WF-1000XM4 là một lựa chọn tuyệt vời.', 39)
INSERT [dbo].[cellphoneapp_review] ([Id], [Title], [Content], [idProduct_id]) VALUES (40, N'Beats Studio Buds', N'Beats Studio Buds là một sản phẩm tai nghe không dây mới ra mắt của hãng Beats. Với thiết kế nhỏ gọn, tính năng chống ồn và chất lượng âm thanh tuyệt vời, Beats Studio Buds đang trở thành một trong những lựa chọn được ưa chuộng cho những người yêu thích công nghệ và âm nhạc. Nếu bạn đang tìm kiếm một tai nghe không dây đầy đủ tính năng, Beats Studio Buds là một sự lựa chọn đáng cân nhắc.', 40)
SET IDENTITY_INSERT [dbo].[cellphoneapp_review] OFF
GO
INSERT [dbo].[cellphoneapp_role] ([nameRole]) VALUES (N'customer')
GO
INSERT [dbo].[cellphoneapp_smartphone] ([product_ptr_id], [Operator_System], [CPU], [RAM], [ROM], [Battery], [Others]) VALUES (1, N'Android 11', N'Exynos 2100 / Snapdragon 888', N'12GB', N'256GB', N'5000 mAh', N'5G, S Pen support, 120Hz refresh rate')
INSERT [dbo].[cellphoneapp_smartphone] ([product_ptr_id], [Operator_System], [CPU], [RAM], [ROM], [Battery], [Others]) VALUES (2, N'iOS 15', N'Apple A15 Bionic', N'6GB', N'512GB', N'3687 mAh', N'5G, Face ID, LiDAR Scanner')
INSERT [dbo].[cellphoneapp_smartphone] ([product_ptr_id], [Operator_System], [CPU], [RAM], [ROM], [Battery], [Others]) VALUES (3, N'Android 12', N'Qualcomm Snapdragon 888', N'8 GB', N'128 GB', N'4,500 mAh', N'5G, Wi-Fi 6, Bluetooth 5.2, NFC, USB-C')
INSERT [dbo].[cellphoneapp_smartphone] ([product_ptr_id], [Operator_System], [CPU], [RAM], [ROM], [Battery], [Others]) VALUES (4, N'Android 11', N'Qualcomm Snapdragon 888', N'12GB', N'256GB', N'5000 mAh', N'5G, IP68 water resistance, 120Hz refresh rate')
INSERT [dbo].[cellphoneapp_smartphone] ([product_ptr_id], [Operator_System], [CPU], [RAM], [ROM], [Battery], [Others]) VALUES (5, N'Android 11', N'Qualcomm Snapdragon 888', N'12GB', N'256GB', N'4500 mAh', N'5G, 10-bit color depth, 120Hz refresh rate')
INSERT [dbo].[cellphoneapp_smartphone] ([product_ptr_id], [Operator_System], [CPU], [RAM], [ROM], [Battery], [Others]) VALUES (6, N'Android 11', N'Qualcomm Snapdragon 888', N'8GB', N'256GB', N'4500 mAh', N'5G, Hasselblad camera, 120Hz refresh rate')
INSERT [dbo].[cellphoneapp_smartphone] ([product_ptr_id], [Operator_System], [CPU], [RAM], [ROM], [Battery], [Others]) VALUES (7, N'Android 11', N'Qualcomm Snapdragon 778G 5G', N'8GB', N'256GB', N'4300 mAh', N'5G, 120Hz refresh rate, Master Design')
INSERT [dbo].[cellphoneapp_smartphone] ([product_ptr_id], [Operator_System], [CPU], [RAM], [ROM], [Battery], [Others]) VALUES (8, N'Android 11', N'Snapdragon 720G', N'6 GB', N'128 GB', N'4500 mAh', N'5G capable, IP67 water resistance')
INSERT [dbo].[cellphoneapp_smartphone] ([product_ptr_id], [Operator_System], [CPU], [RAM], [ROM], [Battery], [Others]) VALUES (9, N'iOS 14', N'A14 Bionic', N'6 GB', N'128 GB', N'2815 mAh', N'5G capable, Dolby Vision HDR recording')
INSERT [dbo].[cellphoneapp_smartphone] ([product_ptr_id], [Operator_System], [CPU], [RAM], [ROM], [Battery], [Others]) VALUES (10, N'Android 11', N'Exynos 2100', N'8 GB', N'128 GB', N'4000 mAh', N'5G capable, IP68 water resistance')
INSERT [dbo].[cellphoneapp_smartphone] ([product_ptr_id], [Operator_System], [CPU], [RAM], [ROM], [Battery], [Others]) VALUES (11, N'Android 11', N'Exynos 2100', N'12GB', N'128GB', N'5000mAh', N'5G support, S-Pen support')
INSERT [dbo].[cellphoneapp_smartphone] ([product_ptr_id], [Operator_System], [CPU], [RAM], [ROM], [Battery], [Others]) VALUES (12, N'Android 11', N'Snapdragon 888', N'8 GB', N'128 GB', N'4600 mAh', N'5G capable, 108MP camera')
INSERT [dbo].[cellphoneapp_smartphone] ([product_ptr_id], [Operator_System], [CPU], [RAM], [ROM], [Battery], [Others]) VALUES (13, N'Android 11', N'MediaTek Helio G88', N'4GB', N'64GB', N'5000 mAh', N'6.5 inch display, 50MP camera')
INSERT [dbo].[cellphoneapp_smartphone] ([product_ptr_id], [Operator_System], [CPU], [RAM], [ROM], [Battery], [Others]) VALUES (14, N'iOS 16', N'A16 Bionic', N'6GB', N'128GB', N'4000 mAh', N'5G, LiDAR Scanner, Ceramic Shield front cover')
INSERT [dbo].[cellphoneapp_smartphone] ([product_ptr_id], [Operator_System], [CPU], [RAM], [ROM], [Battery], [Others]) VALUES (15, N'iOS 14', N'A14 Bionic', N'8GB', N'128GB', N'2227 mAh', N'5G support, Ceramic Shield front cover')
INSERT [dbo].[cellphoneapp_smartphone] ([product_ptr_id], [Operator_System], [CPU], [RAM], [ROM], [Battery], [Others]) VALUES (41, N'Android 11', N'Exynos 2100 / Snapdragon 888', N'8GB', N'128GB', N'5000 mAh', N'5G, S Pen support, 120Hz refresh rate')
INSERT [dbo].[cellphoneapp_smartphone] ([product_ptr_id], [Operator_System], [CPU], [RAM], [ROM], [Battery], [Others]) VALUES (42, N'iOS 15', N'Apple A15 Bionic', N'8GB', N'256GB', N'3687 mAh', N'5G, Face ID, LiDAR Scanner')
INSERT [dbo].[cellphoneapp_smartphone] ([product_ptr_id], [Operator_System], [CPU], [RAM], [ROM], [Battery], [Others]) VALUES (43, N'Android 12', N'Qualcomm Snapdragon 888', N'12 GB', N'256 GB', N'4,500 mAh', N'5G, Wi-Fi 6, Bluetooth 5.2, NFC')
INSERT [dbo].[cellphoneapp_smartphone] ([product_ptr_id], [Operator_System], [CPU], [RAM], [ROM], [Battery], [Others]) VALUES (44, N'Android 11', N'Qualcomm Snapdragon 888', N'8GB', N'128GB', N'5000 mAh', N'5G, IP68 water resistance, 120Hz refresh rate')
INSERT [dbo].[cellphoneapp_smartphone] ([product_ptr_id], [Operator_System], [CPU], [RAM], [ROM], [Battery], [Others]) VALUES (45, N'Android 11', N'Qualcomm Snapdragon 888', N'8GB', N'128GB', N'4500 mAh', N'5G, 10-bit color depth, 120Hz refresh rate')
INSERT [dbo].[cellphoneapp_smartphone] ([product_ptr_id], [Operator_System], [CPU], [RAM], [ROM], [Battery], [Others]) VALUES (46, N'Android 11', N'Qualcomm Snapdragon 888', N'8GB', N'128GB', N'4500 mAh', N'5G, Hasselblad camera, 120Hz refresh rate')
INSERT [dbo].[cellphoneapp_smartphone] ([product_ptr_id], [Operator_System], [CPU], [RAM], [ROM], [Battery], [Others]) VALUES (47, N'Android 11', N'Qualcomm Snapdragon 778G 5G', N'8GB', N'128GB', N'4300 mAh', N'5G, 120Hz refresh rate, Master Design')
INSERT [dbo].[cellphoneapp_smartphone] ([product_ptr_id], [Operator_System], [CPU], [RAM], [ROM], [Battery], [Others]) VALUES (48, N'Android 11', N'Snapdragon 720G', N'8 GB', N'256 GB', N'4500 mAh', N'5G capable, IP67 water resistance')
INSERT [dbo].[cellphoneapp_smartphone] ([product_ptr_id], [Operator_System], [CPU], [RAM], [ROM], [Battery], [Others]) VALUES (49, N'iOS 14', N'A14 Bionic', N'8 GB', N'256 GB', N'2815 mAh', N'5G capable, Dolby Vision HDR recording')
INSERT [dbo].[cellphoneapp_smartphone] ([product_ptr_id], [Operator_System], [CPU], [RAM], [ROM], [Battery], [Others]) VALUES (50, N'Android 11', N'Exynos 2100', N'8 GB', N'256 GB', N'4000 mAh', N'5G capable, IP68 water resistance')
INSERT [dbo].[cellphoneapp_smartphone] ([product_ptr_id], [Operator_System], [CPU], [RAM], [ROM], [Battery], [Others]) VALUES (51, N'Android 11', N'Exynos 2100', N'12GB', N'256GB', N'5000mAh', N'5G support, S-Pen support')
INSERT [dbo].[cellphoneapp_smartphone] ([product_ptr_id], [Operator_System], [CPU], [RAM], [ROM], [Battery], [Others]) VALUES (52, N'Android 11', N'Snapdragon 888', N'8 GB', N'256 GB', N'4600 mAh', N'5G capable, 108MP camera')
INSERT [dbo].[cellphoneapp_smartphone] ([product_ptr_id], [Operator_System], [CPU], [RAM], [ROM], [Battery], [Others]) VALUES (53, N'Android 11', N'MediaTek Helio G88', N'8GB', N'256GB', N'5000 mAh', N'6.5 inch display, 50MP camera')
INSERT [dbo].[cellphoneapp_smartphone] ([product_ptr_id], [Operator_System], [CPU], [RAM], [ROM], [Battery], [Others]) VALUES (54, N'iOS 16', N'A16 Bionic', N'8GB', N'256GB', N'4000 mAh', N'5G, LiDAR Scanner, Ceramic Shield front cover')
INSERT [dbo].[cellphoneapp_smartphone] ([product_ptr_id], [Operator_System], [CPU], [RAM], [ROM], [Battery], [Others]) VALUES (55, N'iOS 14', N'A14 Bionic', N'8GB', N'256GB', N'2227 mAh', N'5G support, Ceramic Shield front cover')
GO
SET IDENTITY_INSERT [dbo].[cellphoneapp_user] ON 

INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (1, N'John Doe', N'johndoe@example.com', 1, N'New York', N'johndoe', N'123', CAST(N'1990-01-01' AS Date), N'9999999991', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (2, N'Jane Smith', N'janesmith@example.com', 1, N'Los Angeles', N'janesmith', N'123', CAST(N'1995-05-10' AS Date), N'9999999992', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (3, N'Bob Johnson', N'bjohnson@example.com', 1, N'Chicago', N'bjohnson', N'123', CAST(N'1985-11-12' AS Date), N'9999999993', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (4, N'Alice Williams', N'awilliams@example.com', 0, N'Houston', N'awilliams', N'123', CAST(N'1998-02-14' AS Date), N'9999999994', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (5, N'Tom Lee', N'tlee@example.com', 0, N'San Francisco', N'tlee', N'123', CAST(N'1992-09-22' AS Date), N'9999999995', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (6, N'Emily Brown', N'ebrown@example.com', 1, N'New York', N'ebrown', N'abc123', CAST(N'1990-05-15' AS Date), N'5555555555', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (7, N'Jason Chen', N'jchen@example.com', 0, N'Los Angeles', N'jchen', N'qwe123', CAST(N'1988-01-20' AS Date), N'7777777777', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (8, N'Mia Davis', N'mdavis@example.com', 1, N'Chicago', N'mdavis', N'hello123', CAST(N'1995-11-30' AS Date), N'2222222222', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (9, N'William Kim', N'wkim@example.com', 0, N'Houston', N'wkim', N'world123', CAST(N'1991-07-02' AS Date), N'4444444444', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (10, N'Sarah Lee', N'slee@example.com', 1, N'Los Angeles', N'slee', N'hello123', CAST(N'1995-02-14' AS Date), N'9876543210', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (11, N'John Smith', N'jsmith@example.com', 0, N'New York', N'jsmith', N'password123', CAST(N'1988-12-01' AS Date), N'6666666666', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (12, N'Emily Chen', N'echen@example.com', 1, N'San Francisco', N'echen', N'abcd1234', CAST(N'1990-05-28' AS Date), N'1111111111', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (13, N'James Lee', N'jlee@example.com', 0, N'Chicago', N'jlee', N'qwerty123', CAST(N'1994-10-18' AS Date), N'8888888888', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (14, N'Rachel Kim', N'rkim@example.com', 1, N'Houston', N'rkim', N'iloveyou123', CAST(N'1992-03-07' AS Date), N'9999999999', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (15, N'Michael Johnson', N'mjohnson@example.com', 0, N'Seattle', N'mjohnson', N'pass1234', CAST(N'1985-09-22' AS Date), N'1234567890', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (22, N'Đặng Vỹ Khôi', N'', 0, N'080202004241', N'', N'', CAST(N'2023-03-17' AS Date), N'0937793157', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (23, N'Đặng Vỹ Khôi', N'', 0, N'080202004241', N'', N'', CAST(N'2023-03-17' AS Date), N'0937793157', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (24, N'Đặng Vỹ Khôi', N'', 0, N'080202004241', N'', N'', CAST(N'2023-03-17' AS Date), N'0937793157', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (25, N'Đặng Vỹ Khôi', N'', 0, N'080202004241', N'', N'', CAST(N'2023-03-17' AS Date), N'0937793157', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (26, N'Đặng Vỹ Khôi', N'', 0, N'080202004241', N'', N'', CAST(N'2023-03-17' AS Date), N'0937793157', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (27, N'Đặng Vỹ Khôi', N'', 0, N'080202004241', N'', N'', CAST(N'2023-03-17' AS Date), N'0937793157', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (28, N'Đặng Vỹ Khôi', N'', 0, N'080202004241', N'', N'', CAST(N'2023-03-17' AS Date), N'0937793157', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (29, N'Đặng Vỹ Khôi', N'', 0, N'080202004241', N'', N'', CAST(N'2023-03-17' AS Date), N'0937793157', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (30, N'Đặng Vỹ Khôi', N'', 0, N'080202004241', N'', N'', CAST(N'2023-03-17' AS Date), N'0937793157', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (31, N'Đặng Vỹ Khôi', N'', 0, N'080202004241', N'', N'', CAST(N'2023-03-17' AS Date), N'0937793157', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (32, N'Đặng Vỹ Khôi', N'', 0, N'080202004241', N'', N'', CAST(N'2023-03-17' AS Date), N'0937793157', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (33, N'Đặng Vỹ Khôi', N'', 0, N'080202004241', N'', N'', CAST(N'2023-03-17' AS Date), N'0937793157', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (34, N'Đặng Vỹ Khôi', N'', 0, N'080202004241', N'', N'', CAST(N'2023-03-17' AS Date), N'0937793157', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (35, N'Đặng Vỹ Khôi', N'', 0, N'080202004241', N'', N'', CAST(N'2023-03-17' AS Date), N'0937793157', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (36, N'Khôi moi', N'', 0, N'1/3 nguyễn kiệm', N'', N'', CAST(N'2023-03-17' AS Date), N'02030200202', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (37, N'nguyen luan', N'', 0, N'1/2 nguyễn kiệm', N'', N'', CAST(N'2023-03-17' AS Date), N'0868196036', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (38, N'Đặng Vỹ Khôi', N'', 0, N'080202004241', N'', N'', CAST(N'2023-03-17' AS Date), N'0937793157', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (39, N'Đặng Vỹ Khôi', N'', 0, N'080202004241', N'', N'', CAST(N'2023-03-17' AS Date), N'0937793157', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (40, N'Đặng Vỹ Khôi', N'', 0, N'080202004241', N'', N'', CAST(N'2023-03-17' AS Date), N'0937793157', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (41, N'Đặng Vỹ Khôi', N'', 0, N'080202004241', N'', N'', CAST(N'2023-03-17' AS Date), N'0937793157', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (42, N'Đặng Vỹ Khôi', N'', 0, N'080202004241', N'', N'', CAST(N'2023-03-17' AS Date), N'0937793157', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (43, N'Đặng Vỹ Khôi', N'', 0, N'Long an', N'', N'', CAST(N'2023-03-18' AS Date), N'0937793157', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (44, N'Đặng Vỹ Khôi', N'', 0, N'080202004241', N'', N'', CAST(N'2023-03-18' AS Date), N'0937793157', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (45, N'Đặng Vỹ Khôi', N'', 0, N'Long An', N'', N'', CAST(N'2023-03-18' AS Date), N'0937793157', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (46, N'Đặng Vỹ Khôi', N'', 0, N'080202004241', N'', N'', CAST(N'2023-03-18' AS Date), N'0937793157', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (47, N'Đặng Vỹ Khôi', N'', 0, N'080202004241', N'', N'', CAST(N'2023-03-18' AS Date), N'0937793157', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (48, N'Đặng Vỹ Khôi', N'', 0, N'234567', N'', N'', CAST(N'2023-03-18' AS Date), N'0868196036', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (49, N'Đặng Vỹ Khôi', N'', 0, N'080202004241', N'', N'', CAST(N'2023-03-18' AS Date), N'0937793157', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (50, N'Đặng Vỹ Khôi', N'', 0, N'080202004241', N'', N'', CAST(N'2023-03-18' AS Date), N'0937793159', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (51, N'Đặng', N'', 0, N'080202004241', N'', N'', CAST(N'2023-03-18' AS Date), N'0937793157', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (52, N'Ố oke', N'', 0, N'080202004241', N'', N'', CAST(N'2023-03-18' AS Date), N'0937793157', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (53, N'Đặng Vỹ Khôi', N'', 0, N'080202004241', N'', N'', CAST(N'2023-03-18' AS Date), N'0937793157', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (54, N'Đặng Vỹ Khôi', N'', 0, N'080202004241', N'', N'', CAST(N'2023-03-18' AS Date), N'0937793157', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (55, N'Đặng Vỹ Khôi', N'', 0, N'080202004241', N'', N'', CAST(N'2023-03-18' AS Date), N'0937793157', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (56, N'nghĩa', N'', 0, N'080202004241', N'', N'', CAST(N'2023-03-18' AS Date), N'0937793157', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (57, N'Đặng Vỹ Khôi', N'', 0, N'080202004241', N'', N'', CAST(N'2023-03-18' AS Date), N'0937793157', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (58, N'Đặng Vỹ Khôi', N'', 0, N'080202004241', N'', N'', CAST(N'2023-03-18' AS Date), N'0937793157', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (59, N'Đặng Vỹ Khôi', N'', 0, N'080202004241', N'', N'', CAST(N'2023-03-18' AS Date), N'0937793157', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (60, N'Đặng Vỹ Khôi', N'', 0, N'080202004241', N'', N'', CAST(N'2023-03-18' AS Date), N'0937793157', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (61, N'Đặng Vỹ Khôi', N'', 0, N'080202004241', N'', N'', CAST(N'2023-03-18' AS Date), N'0937793157', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (62, N'Đặng Vỹ Khôi', N'', 0, N'080202004241', N'', N'', CAST(N'2023-03-18' AS Date), N'0937793157', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (63, N'Đặng Vỹ Khôi', N'', 0, N'080202004241', N'', N'', CAST(N'2023-03-18' AS Date), N'0937793157', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (64, N'Đặng Vỹ Khôi', N'', 0, N'080202004241', N'', N'', CAST(N'2023-03-18' AS Date), N'0937793157', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (65, N'Đặng Vỹ Khôi', N'', 0, N'080202004241', N'', N'', CAST(N'2023-03-18' AS Date), N'0937793157', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (66, N'Đặng Vỹ Khôi', N'', 0, N'080202004241', N'', N'', CAST(N'2023-03-18' AS Date), N'0937793157', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (67, N'Đặng Vỹ Khôi', N'', 0, N'080202004241', N'', N'', CAST(N'2023-03-18' AS Date), N'0937793157', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (68, N'Đặng Vỹ Khôi', N'', 0, N'080202004241', N'', N'', CAST(N'2023-03-18' AS Date), N'0937793157', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (69, N'Nguyễn Quốc Kỳ', N'', 0, N'Thủ Đức, Hồ Chí Minh', N'', N'', CAST(N'2023-03-18' AS Date), N'0352671408', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (70, N'Đặng Vỹ Khôi', N'', 0, N'080202004241', N'', N'', CAST(N'2023-03-18' AS Date), N'0937793157', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (71, N'Đặng Vỹ Khôi', N'', 0, N'080202004241', N'', N'', CAST(N'2023-03-18' AS Date), N'0937793155', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (72, N'Đặng Vỹ Khôi', N'', 0, N'080202004241', N'', N'', CAST(N'2023-03-18' AS Date), N'0937793157', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (73, N'qừ', N'qqqq@gmail.com', 0, N'vwver', N'khoibu123', N'pbkdf2_sha256$390000$gBqcLOfUmuN1yKufoO3VpH$oqg+ihYbAANXOusadYOj4JH/8cd3h8Sx90iPpREY/ck=', CAST(N'2023-03-19' AS Date), N'0937793122', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (74, N'Võ Hữu Nghĩa', N'vohuuhung195@gmail.com', 1, N'qe', N'nghia123', N'pbkdf2_sha256$390000$t1xIfJ7tJUkca4it4lY4Gu$Zyt6wpI394l4dr/Sh9jAUzD626RIBSs0tZO/AGpIx8Y=', CAST(N'2023-03-19' AS Date), N'0352670408', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (75, N'khoi', N'', 0, N'qưewe', N'', N'', CAST(N'2023-03-19' AS Date), N'0123456789', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (76, N'khoi', N'', 0, N'cqfvwetbhvcfwrgve', N'', N'', CAST(N'2023-03-19' AS Date), N'0894473846', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (77, N'Võ Hữu Nghĩa', N'vohuuhung196@gmail.com', 0, N'ewqfwqfqwe', N'khoiu123', N'pbkdf2_sha256$390000$ux8smFhoULNqd1ANwFVjf8$AmDactcporeGMieDKy3koZZA5Jzz0Q7wKjGD6rsBNu8=', CAST(N'2023-03-19' AS Date), N'0999999997', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (78, N'khoi', N'', 0, N'ávsavsad', N'', N'', CAST(N'2023-03-19' AS Date), N'0999999997', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (79, N'khoi', N'', 0, N'ưdgbefcbdgrcg', N'', N'', CAST(N'2023-03-19' AS Date), N'0999999997', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (80, N'khoi', N'', 0, N'th hcm', N'', N'', CAST(N'2023-03-19' AS Date), N'0999999966', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (81, N'Võ Hữu Nghĩa', N'205105nghia@ou.edu.vn', 0, N'th hcm', N'usert123', N'pbkdf2_sha256$390000$htiUQBwQC8kSWn1J94zPW6$3SJa+DZOwSkA1EZ41pOM1iX6b2OhpjBzK5gQwdMd7qA=', CAST(N'2023-03-19' AS Date), N'0999999988', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (82, N'khoi', N'', 0, N'long an', N'', N'', CAST(N'2023-03-19' AS Date), N'0999999955', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (83, N'khoi', N'', 0, N'long an', N'', N'', CAST(N'2023-03-19' AS Date), N'0999999944', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (84, N'khoi', N'', 0, N'long an', N'', N'', CAST(N'2023-03-21' AS Date), N'0933333333', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (85, N'khoi', N'cuon23@gmail.com', 0, N'dcqwwec', N'khoii321', N'pbkdf2_sha256$390000$Nnr0H9AjjX5cClGRSV3MCd$WJ9JkDWWp0gXicpfPqEeUrRzYz6a8kbjluE9bNlM6sQ=', CAST(N'2023-03-21' AS Date), N'0933333334', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (86, N'khoi', N'', 0, N'tp hcm', N'', N'', CAST(N'2023-03-21' AS Date), N'0944444444', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (87, N'khoi', N'', 0, N'ưerwefqfvef', N'', N'', CAST(N'2023-03-21' AS Date), N'0955555555', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (88, N'khoi', N'', 0, N'ưqwee', N'', N'', CAST(N'2023-03-21' AS Date), N'0911111111', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (89, N'khoi', N'', 0, N'alo', N'', N'', CAST(N'2023-03-22' AS Date), N'0999999999', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (94, N'luan', N'', 0, N'uhghj', N'', N'', CAST(N'2023-03-11' AS Date), N'444444444', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (95, N'string', N'', 0, N'string', N'', N'', CAST(N'0001-01-01' AS Date), N'string', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (96, N'string', N'', 0, N'string', N'', N'', CAST(N'0001-01-01' AS Date), N'string', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (97, N'string', N'', 0, N'string', N'', N'', CAST(N'0001-01-01' AS Date), N'string', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (98, N'string', N'', 0, N'string', N'', N'', CAST(N'0001-01-01' AS Date), N'string', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (99, N'test-sql', N'', 0, N'string', N'', N'', CAST(N'0001-01-01' AS Date), N'string', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (100, N'test-sql', N'', 0, N'string', N'', N'', CAST(N'0001-01-01' AS Date), N'string', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (101, N'Đặng Vỹ Khôi', N'', 0, N'080202004241', N'', N'', CAST(N'0001-01-01' AS Date), N'0937793157', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (102, N'Đặng Vỹ Khôi', N'', 0, N'080202004241', N'', N'', CAST(N'0001-01-01' AS Date), N'0937793157', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (103, N'string', N'string', 0, N'string', N'string', N'73l8gRjwLftklgfdXT+MdiMEjJwGPVMsyVxe16iYpk8=', CAST(N'0001-01-01' AS Date), N'0999999999', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (104, N'string', N'string', 0, N'string', N'string2', N'73l8gRjwLftklgfdXT+MdiMEjJwGPVMsyVxe16iYpk8=', CAST(N'0001-01-01' AS Date), N'0999999999', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (105, N'Đặng Vỹ Khôi', N'vkhoi123@gmail.com', 0, N'Long An', N'vkhoi123', N'73l8gRjwLftklgfdXT+MdiMEjJwGPVMsyVxe16iYpk8=', CAST(N'0001-01-01' AS Date), N'0937793157', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (106, N'Đặng Vỹ Khôi', N'', 0, N'080202004241', N'', N'', CAST(N'0001-01-01' AS Date), N'0888888881', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (107, N'Đặng Vỹ Khôi', N'', 0, N'080202004241', N'', N'', CAST(N'0001-01-01' AS Date), N'0937793150', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (108, N'Đặng Vỹ Khôi', N'', 0, N'080202004241', N'', N'', CAST(N'0001-01-01' AS Date), N'0937793157', N'customer')
INSERT [dbo].[cellphoneapp_user] ([Id], [Name], [Email], [Gender], [Hometown], [userName], [passWord], [birthDay], [phoneNumber], [idRole_id]) VALUES (109, N'Đặng Vỹ Khôi', N'', 0, N'080202004241', N'', N'', CAST(N'0001-01-01' AS Date), N'0937793151', N'customer')
GO
SET IDENTITY_INSERT [dbo].[cellphoneapp_user] OFF
GO
ALTER TABLE [dbo].[cellphoneapp_product] ADD  DEFAULT (NULL) FOR [Type]
GO
ALTER TABLE [dbo].[cellphoneapp_user] ADD  DEFAULT (NULL) FOR [passWord]
GO
ALTER TABLE [dbo].[cellphoneapp_branch_product_color]  WITH NOCHECK ADD  CONSTRAINT [cellphoneapp_branch_product_color$cellphoneApp_branch__idBranch_id_edb533ab_fk_cellphone] FOREIGN KEY([idBranch_id])
REFERENCES [dbo].[cellphoneapp_branch] ([Id])
GO
ALTER TABLE [dbo].[cellphoneapp_branch_product_color] CHECK CONSTRAINT [cellphoneapp_branch_product_color$cellphoneApp_branch__idBranch_id_edb533ab_fk_cellphone]
GO
ALTER TABLE [dbo].[cellphoneapp_branch_product_color]  WITH NOCHECK ADD  CONSTRAINT [cellphoneapp_branch_product_color$cellphoneApp_branch__idProductColor_id_fbdccc0b_fk_cellphone] FOREIGN KEY([idProductColor_id])
REFERENCES [dbo].[cellphoneapp_product_color] ([Id])
GO
ALTER TABLE [dbo].[cellphoneapp_branch_product_color] CHECK CONSTRAINT [cellphoneapp_branch_product_color$cellphoneApp_branch__idProductColor_id_fbdccc0b_fk_cellphone]
GO
ALTER TABLE [dbo].[cellphoneapp_branch_promotion_product]  WITH NOCHECK ADD  CONSTRAINT [cellphoneapp_branch_promotion_product$cellphoneApp_branch__idBrandProductColor__95f82815_fk_cellphone] FOREIGN KEY([idBrandProductColor_id])
REFERENCES [dbo].[cellphoneapp_branch_product_color] ([Id])
GO
ALTER TABLE [dbo].[cellphoneapp_branch_promotion_product] CHECK CONSTRAINT [cellphoneapp_branch_promotion_product$cellphoneApp_branch__idBrandProductColor__95f82815_fk_cellphone]
GO
ALTER TABLE [dbo].[cellphoneapp_branch_promotion_product]  WITH NOCHECK ADD  CONSTRAINT [cellphoneapp_branch_promotion_product$cellphoneApp_branch__idPromotion_id_3456dae1_fk_cellphone] FOREIGN KEY([idPromotion_id])
REFERENCES [dbo].[cellphoneapp_promotion] ([Id])
GO
ALTER TABLE [dbo].[cellphoneapp_branch_promotion_product] CHECK CONSTRAINT [cellphoneapp_branch_promotion_product$cellphoneApp_branch__idPromotion_id_3456dae1_fk_cellphone]
GO
ALTER TABLE [dbo].[cellphoneapp_comment]  WITH NOCHECK ADD  CONSTRAINT [cellphoneapp_comment$cellphoneApp_comment_idProduct_id_886d85ab_fk_cellphone] FOREIGN KEY([idProduct_id])
REFERENCES [dbo].[cellphoneapp_product] ([Id])
GO
ALTER TABLE [dbo].[cellphoneapp_comment] CHECK CONSTRAINT [cellphoneapp_comment$cellphoneApp_comment_idProduct_id_886d85ab_fk_cellphone]
GO
ALTER TABLE [dbo].[cellphoneapp_comment]  WITH NOCHECK ADD  CONSTRAINT [cellphoneapp_comment$cellphoneApp_comment_idUser_id_d2fff2a5_fk_cellphoneApp_user_Id] FOREIGN KEY([idUser_id])
REFERENCES [dbo].[cellphoneapp_user] ([Id])
GO
ALTER TABLE [dbo].[cellphoneapp_comment] CHECK CONSTRAINT [cellphoneapp_comment$cellphoneApp_comment_idUser_id_d2fff2a5_fk_cellphoneApp_user_Id]
GO
ALTER TABLE [dbo].[cellphoneapp_earphone]  WITH NOCHECK ADD  CONSTRAINT [cellphoneapp_earphone$cellphoneApp_earphon_product_ptr_id_af17d76e_fk_cellphone] FOREIGN KEY([product_ptr_id])
REFERENCES [dbo].[cellphoneapp_product] ([Id])
GO
ALTER TABLE [dbo].[cellphoneapp_earphone] CHECK CONSTRAINT [cellphoneapp_earphone$cellphoneApp_earphon_product_ptr_id_af17d76e_fk_cellphone]
GO
ALTER TABLE [dbo].[cellphoneapp_imageproduct]  WITH NOCHECK ADD  CONSTRAINT [cellphoneapp_imageproduct$cellphoneApp_imagepr_idProduct_id_4de16385_fk_cellphone] FOREIGN KEY([idProduct_id])
REFERENCES [dbo].[cellphoneapp_product] ([Id])
GO
ALTER TABLE [dbo].[cellphoneapp_imageproduct] CHECK CONSTRAINT [cellphoneapp_imageproduct$cellphoneApp_imagepr_idProduct_id_4de16385_fk_cellphone]
GO
ALTER TABLE [dbo].[cellphoneapp_laptop]  WITH NOCHECK ADD  CONSTRAINT [cellphoneapp_laptop$cellphoneApp_laptop_product_ptr_id_137bfb4d_fk_cellphone] FOREIGN KEY([product_ptr_id])
REFERENCES [dbo].[cellphoneapp_product] ([Id])
GO
ALTER TABLE [dbo].[cellphoneapp_laptop] CHECK CONSTRAINT [cellphoneapp_laptop$cellphoneApp_laptop_product_ptr_id_137bfb4d_fk_cellphone]
GO
ALTER TABLE [dbo].[cellphoneapp_order]  WITH NOCHECK ADD  CONSTRAINT [cellphoneapp_order$cellphoneApp_order_idUser_id_bb73099a_fk_cellphoneApp_user_Id] FOREIGN KEY([idUser_id])
REFERENCES [dbo].[cellphoneapp_user] ([Id])
GO
ALTER TABLE [dbo].[cellphoneapp_order] CHECK CONSTRAINT [cellphoneapp_order$cellphoneApp_order_idUser_id_bb73099a_fk_cellphoneApp_user_Id]
GO
ALTER TABLE [dbo].[cellphoneapp_orderdetail]  WITH NOCHECK ADD  CONSTRAINT [cellphoneapp_orderdetail$cellphoneApp_orderde_idBrandProductColor__980f79ef_fk_cellphone] FOREIGN KEY([idBrandProductColor_id])
REFERENCES [dbo].[cellphoneapp_branch_product_color] ([Id])
GO
ALTER TABLE [dbo].[cellphoneapp_orderdetail] CHECK CONSTRAINT [cellphoneapp_orderdetail$cellphoneApp_orderde_idBrandProductColor__980f79ef_fk_cellphone]
GO
ALTER TABLE [dbo].[cellphoneapp_orderdetail]  WITH NOCHECK ADD  CONSTRAINT [cellphoneapp_orderdetail$cellphoneApp_orderde_idOder_id_6730d0c3_fk_cellphone] FOREIGN KEY([idOder_id])
REFERENCES [dbo].[cellphoneapp_order] ([Id])
GO
ALTER TABLE [dbo].[cellphoneapp_orderdetail] CHECK CONSTRAINT [cellphoneapp_orderdetail$cellphoneApp_orderde_idOder_id_6730d0c3_fk_cellphone]
GO
ALTER TABLE [dbo].[cellphoneapp_product]  WITH NOCHECK ADD  CONSTRAINT [cellphoneapp_product$cellphoneApp_product_nameManufacture_id_473540a7_fk_cellphone] FOREIGN KEY([nameManufacture_id])
REFERENCES [dbo].[cellphoneapp_manufacture] ([names])
GO
ALTER TABLE [dbo].[cellphoneapp_product] CHECK CONSTRAINT [cellphoneapp_product$cellphoneApp_product_nameManufacture_id_473540a7_fk_cellphone]
GO
ALTER TABLE [dbo].[cellphoneapp_product_color]  WITH NOCHECK ADD  CONSTRAINT [cellphoneapp_product_color$cellphoneApp_product_idProduct_id_057d2aaf_fk_cellphone] FOREIGN KEY([idProduct_id])
REFERENCES [dbo].[cellphoneapp_product] ([Id])
GO
ALTER TABLE [dbo].[cellphoneapp_product_color] CHECK CONSTRAINT [cellphoneapp_product_color$cellphoneApp_product_idProduct_id_057d2aaf_fk_cellphone]
GO
ALTER TABLE [dbo].[cellphoneapp_product_color]  WITH NOCHECK ADD  CONSTRAINT [cellphoneapp_product_color$cellphoneApp_product_nameColor_id_0ea8764a_fk_cellphone] FOREIGN KEY([nameColor_id])
REFERENCES [dbo].[cellphoneapp_color] ([names])
GO
ALTER TABLE [dbo].[cellphoneapp_product_color] CHECK CONSTRAINT [cellphoneapp_product_color$cellphoneApp_product_nameColor_id_0ea8764a_fk_cellphone]
GO
ALTER TABLE [dbo].[cellphoneapp_review]  WITH NOCHECK ADD  CONSTRAINT [cellphoneapp_review$cellphoneApp_review_idProduct_id_4ede3625_fk_cellphone] FOREIGN KEY([idProduct_id])
REFERENCES [dbo].[cellphoneapp_product] ([Id])
GO
ALTER TABLE [dbo].[cellphoneapp_review] CHECK CONSTRAINT [cellphoneapp_review$cellphoneApp_review_idProduct_id_4ede3625_fk_cellphone]
GO
ALTER TABLE [dbo].[cellphoneapp_smartphone]  WITH NOCHECK ADD  CONSTRAINT [cellphoneapp_smartphone$cellphoneApp_smartph_product_ptr_id_a0e68210_fk_cellphone] FOREIGN KEY([product_ptr_id])
REFERENCES [dbo].[cellphoneapp_product] ([Id])
GO
ALTER TABLE [dbo].[cellphoneapp_smartphone] CHECK CONSTRAINT [cellphoneapp_smartphone$cellphoneApp_smartph_product_ptr_id_a0e68210_fk_cellphone]
GO
ALTER TABLE [dbo].[cellphoneapp_user]  WITH NOCHECK ADD  CONSTRAINT [cellphoneapp_user$cellphoneApp_user_idRole_id_ad7e3037_fk_cellphone] FOREIGN KEY([idRole_id])
REFERENCES [dbo].[cellphoneapp_role] ([nameRole])
GO
ALTER TABLE [dbo].[cellphoneapp_user] CHECK CONSTRAINT [cellphoneapp_user$cellphoneApp_user_idRole_id_ad7e3037_fk_cellphone]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'cellphones.cellphoneapp_branch' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cellphoneapp_branch'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'cellphones.cellphoneapp_branch_product_color' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cellphoneapp_branch_product_color'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'cellphones.cellphoneapp_branch_promotion_product' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cellphoneapp_branch_promotion_product'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'cellphones.cellphoneapp_color' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cellphoneapp_color'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'cellphones.cellphoneapp_comment' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cellphoneapp_comment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'cellphones.cellphoneapp_earphone' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cellphoneapp_earphone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'cellphones.cellphoneapp_imageproduct' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cellphoneapp_imageproduct'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'cellphones.cellphoneapp_laptop' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cellphoneapp_laptop'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'cellphones.cellphoneapp_manufacture' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cellphoneapp_manufacture'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'cellphones.cellphoneapp_order' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cellphoneapp_order'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'cellphones.cellphoneapp_orderdetail' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cellphoneapp_orderdetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'cellphones.cellphoneapp_product' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cellphoneapp_product'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'cellphones.cellphoneapp_product_color' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cellphoneapp_product_color'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'cellphones.cellphoneapp_promotion' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cellphoneapp_promotion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'cellphones.cellphoneapp_review' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cellphoneapp_review'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'cellphones.cellphoneapp_role' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cellphoneapp_role'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'cellphones.cellphoneapp_smartphone' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cellphoneapp_smartphone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'cellphones.cellphoneapp_user' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cellphoneapp_user'
GO
