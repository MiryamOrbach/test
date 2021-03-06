USE [master]
GO
/****** Object:  Database [clothing Store]    Script Date: 31/08/2017 14:17:08 ******/
CREATE DATABASE [clothing Store]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Clothes Shop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Clothes Shop.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Clothes Shop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Clothes Shop_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [clothing Store] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [clothing Store].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [clothing Store] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [clothing Store] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [clothing Store] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [clothing Store] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [clothing Store] SET ARITHABORT OFF 
GO
ALTER DATABASE [clothing Store] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [clothing Store] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [clothing Store] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [clothing Store] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [clothing Store] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [clothing Store] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [clothing Store] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [clothing Store] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [clothing Store] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [clothing Store] SET  DISABLE_BROKER 
GO
ALTER DATABASE [clothing Store] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [clothing Store] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [clothing Store] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [clothing Store] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [clothing Store] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [clothing Store] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [clothing Store] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [clothing Store] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [clothing Store] SET  MULTI_USER 
GO
ALTER DATABASE [clothing Store] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [clothing Store] SET DB_CHAINING OFF 
GO
ALTER DATABASE [clothing Store] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [clothing Store] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [clothing Store] SET DELAYED_DURABILITY = DISABLED 
GO
USE [clothing Store]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 31/08/2017 14:17:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[AdminId] [int] IDENTITY(1,1) NOT NULL,
	[AdminName] [nvarchar](50) NOT NULL,
	[AdminPassword] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[AdminId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Categories]    Script Date: 31/08/2017 14:17:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Clothes]    Script Date: 31/08/2017 14:17:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clothes](
	[ClothId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[TypeId] [int] NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[Discount] [real] NULL CONSTRAINT [DF_Clothes_Discount]  DEFAULT ((0)),
	[Image] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Clothes] PRIMARY KEY CLUSTERED 
(
	[ClothId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Companies]    Script Date: 31/08/2017 14:17:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Companies](
	[CompanyId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Companies] PRIMARY KEY CLUSTERED 
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Types]    Script Date: 31/08/2017 14:17:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Types](
	[TypeId] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Types] PRIMARY KEY CLUSTERED 
(
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([AdminId], [AdminName], [AdminPassword]) VALUES (1, N'מרים', N'1234')
SET IDENTITY_INSERT [dbo].[Admin] OFF
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (1, N'נשים')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (2, N'ילדים')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (3, N'גברים')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (4, N'תינוקות')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Clothes] ON 

INSERT [dbo].[Clothes] ([ClothId], [CategoryId], [TypeId], [CompanyId], [Price], [Discount], [Image]) VALUES (34, 3, 6, 2, 100.0000, 10, N'BlackBelt.jpg')
INSERT [dbo].[Clothes] ([ClothId], [CategoryId], [TypeId], [CompanyId], [Price], [Discount], [Image]) VALUES (36, 3, 5, 2, 200.0000, 30, N'BlackJacket.jpg')
INSERT [dbo].[Clothes] ([ClothId], [CategoryId], [TypeId], [CompanyId], [Price], [Discount], [Image]) VALUES (42, 3, 1, 4, 200.0000, NULL, N'whitelightbluelongshirt.jpeg')
INSERT [dbo].[Clothes] ([ClothId], [CategoryId], [TypeId], [CompanyId], [Price], [Discount], [Image]) VALUES (44, 2, 4, 4, 100.0000, 7, N'arcolpant.jpeg')
INSERT [dbo].[Clothes] ([ClothId], [CategoryId], [TypeId], [CompanyId], [Price], [Discount], [Image]) VALUES (48, 2, 4, 3, 100.0000, 30, N'beigepant.jpeg')
INSERT [dbo].[Clothes] ([ClothId], [CategoryId], [TypeId], [CompanyId], [Price], [Discount], [Image]) VALUES (49, 2, 9, 1, 200.0000, 70, N'bluepinkcoat.jpeg')
INSERT [dbo].[Clothes] ([ClothId], [CategoryId], [TypeId], [CompanyId], [Price], [Discount], [Image]) VALUES (50, 2, 1, 3, 95.0000, 40, N'bluesleeves.jpeg')
INSERT [dbo].[Clothes] ([ClothId], [CategoryId], [TypeId], [CompanyId], [Price], [Discount], [Image]) VALUES (51, 2, 1, 4, 120.0000, 30, N'bluewhitebloose.jpeg')
INSERT [dbo].[Clothes] ([ClothId], [CategoryId], [TypeId], [CompanyId], [Price], [Discount], [Image]) VALUES (52, 2, 10, 2, 100.0000, 20, N'ccc50139-e285-4a05-8083-0b372524567b.jpg')
INSERT [dbo].[Clothes] ([ClothId], [CategoryId], [TypeId], [CompanyId], [Price], [Discount], [Image]) VALUES (55, 2, 10, 4, 140.0000, 40, N'dotsweater.jpeg')
INSERT [dbo].[Clothes] ([ClothId], [CategoryId], [TypeId], [CompanyId], [Price], [Discount], [Image]) VALUES (56, 2, 1, 4, 150.0000, NULL, N'ginesshirt.jpeg')
INSERT [dbo].[Clothes] ([ClothId], [CategoryId], [TypeId], [CompanyId], [Price], [Discount], [Image]) VALUES (58, 2, 1, 4, 150.0000, NULL, N'lightbueshirt.jpeg')
INSERT [dbo].[Clothes] ([ClothId], [CategoryId], [TypeId], [CompanyId], [Price], [Discount], [Image]) VALUES (59, 2, 1, 2, 70.0000, 20, N'fb92f3df-988a-4efa-9cd8-875d15d7eff9.jpg')
INSERT [dbo].[Clothes] ([ClothId], [CategoryId], [TypeId], [CompanyId], [Price], [Discount], [Image]) VALUES (60, 2, 7, 1, 150.0000, 70, N'siversandal.jpg')
INSERT [dbo].[Clothes] ([ClothId], [CategoryId], [TypeId], [CompanyId], [Price], [Discount], [Image]) VALUES (62, 1, 10, 4, 100.0000, 0, N'beigesweater.jpeg')
INSERT [dbo].[Clothes] ([ClothId], [CategoryId], [TypeId], [CompanyId], [Price], [Discount], [Image]) VALUES (63, 1, 8, 4, 300.0000, 50, N'bluewhitebag.jpeg')
INSERT [dbo].[Clothes] ([ClothId], [CategoryId], [TypeId], [CompanyId], [Price], [Discount], [Image]) VALUES (64, 1, 1, 4, 130.0000, 70, N'dress.jpeg')
INSERT [dbo].[Clothes] ([ClothId], [CategoryId], [TypeId], [CompanyId], [Price], [Discount], [Image]) VALUES (65, 1, 10, 4, 150.0000, 60, N'golddots.jpeg')
INSERT [dbo].[Clothes] ([ClothId], [CategoryId], [TypeId], [CompanyId], [Price], [Discount], [Image]) VALUES (66, 1, 9, 4, 320.0000, 20, N'offwhitecoat.jpeg')
INSERT [dbo].[Clothes] ([ClothId], [CategoryId], [TypeId], [CompanyId], [Price], [Discount], [Image]) VALUES (67, 1, 1, 3, 130.0000, 35, N'redblueshirt.jpg')
INSERT [dbo].[Clothes] ([ClothId], [CategoryId], [TypeId], [CompanyId], [Price], [Discount], [Image]) VALUES (68, 1, 3, 2, 180.0000, 50, N'RedFlowerDress.jpg')
INSERT [dbo].[Clothes] ([ClothId], [CategoryId], [TypeId], [CompanyId], [Price], [Discount], [Image]) VALUES (69, 1, 1, 4, 145.0000, 45, N'shifonshirt.jpeg')
INSERT [dbo].[Clothes] ([ClothId], [CategoryId], [TypeId], [CompanyId], [Price], [Discount], [Image]) VALUES (70, 1, 1, 3, 100.0000, 30, N'whitetshirt.jpeg')
INSERT [dbo].[Clothes] ([ClothId], [CategoryId], [TypeId], [CompanyId], [Price], [Discount], [Image]) VALUES (71, 4, 12, 1, 110.0000, 25, N'babygro.jpg')
INSERT [dbo].[Clothes] ([ClothId], [CategoryId], [TypeId], [CompanyId], [Price], [Discount], [Image]) VALUES (72, 4, 12, 3, 125.0000, 70, N'ChildrensBodysuits.jpg')
INSERT [dbo].[Clothes] ([ClothId], [CategoryId], [TypeId], [CompanyId], [Price], [Discount], [Image]) VALUES (73, 4, 11, 1, 70.0000, 50, N'pinkribbon.jpg')
INSERT [dbo].[Clothes] ([ClothId], [CategoryId], [TypeId], [CompanyId], [Price], [Discount], [Image]) VALUES (74, 4, 11, 1, 70.0000, 50, N'redribbon.jpg')
INSERT [dbo].[Clothes] ([ClothId], [CategoryId], [TypeId], [CompanyId], [Price], [Discount], [Image]) VALUES (75, 2, 3, 4, 100.0000, 50, N'222c5358-1f32-43de-8c36-e085ee5ec9bc.jpeg')
INSERT [dbo].[Clothes] ([ClothId], [CategoryId], [TypeId], [CompanyId], [Price], [Discount], [Image]) VALUES (76, 3, 1, 4, 200.0000, 50, N'e5b5c149-d2d2-424c-b9c7-4ce5f6ddb73a.jpeg')
INSERT [dbo].[Clothes] ([ClothId], [CategoryId], [TypeId], [CompanyId], [Price], [Discount], [Image]) VALUES (77, 4, 12, 1, 20.0000, 2, N'5b85f878-0bdf-4648-bdee-e1e4b9e863f7.jpeg')
INSERT [dbo].[Clothes] ([ClothId], [CategoryId], [TypeId], [CompanyId], [Price], [Discount], [Image]) VALUES (78, 2, 3, 3, 130.0000, 70, N'95d17093-cac0-4680-8dc1-cf49ef2b4f02.jpeg')
INSERT [dbo].[Clothes] ([ClothId], [CategoryId], [TypeId], [CompanyId], [Price], [Discount], [Image]) VALUES (79, 2, 1, 4, 130.0000, 60, N'6dbbc192-e096-4553-9939-8f7c39e7293b.jpeg')
INSERT [dbo].[Clothes] ([ClothId], [CategoryId], [TypeId], [CompanyId], [Price], [Discount], [Image]) VALUES (80, 3, 4, 2, 100.0000, 10, N'bea6ad0a-4be2-4b19-9add-3a77e0db0355.jpeg')
INSERT [dbo].[Clothes] ([ClothId], [CategoryId], [TypeId], [CompanyId], [Price], [Discount], [Image]) VALUES (81, 2, 1, 4, 80.0000, 20, N'acd92940-f8f9-4408-b306-7af3fd0da21d.jpeg')
INSERT [dbo].[Clothes] ([ClothId], [CategoryId], [TypeId], [CompanyId], [Price], [Discount], [Image]) VALUES (82, 3, 1, 4, 100.0000, 15, N'4f37df5c-f26c-4873-aef4-1d3a769861fc.jpeg')
INSERT [dbo].[Clothes] ([ClothId], [CategoryId], [TypeId], [CompanyId], [Price], [Discount], [Image]) VALUES (83, 3, 1, 4, 200.0000, 70, N'8467b421-dd44-46c0-8e9e-b63d148bfc04.jpeg')
INSERT [dbo].[Clothes] ([ClothId], [CategoryId], [TypeId], [CompanyId], [Price], [Discount], [Image]) VALUES (84, 3, 1, 4, 170.0000, 70, N'b844f088-2f37-46b0-83f3-f37cd8e1be8b.jpeg')
INSERT [dbo].[Clothes] ([ClothId], [CategoryId], [TypeId], [CompanyId], [Price], [Discount], [Image]) VALUES (85, 3, 10, 4, 180.0000, 20, N'ebc43c76-ff18-43ed-b055-5bc310e8c48c.jpeg')
INSERT [dbo].[Clothes] ([ClothId], [CategoryId], [TypeId], [CompanyId], [Price], [Discount], [Image]) VALUES (87, 2, 9, 3, 300.0000, 20, N'27529148-fcde-4319-a12f-ddd203d54f64.jpeg')
INSERT [dbo].[Clothes] ([ClothId], [CategoryId], [TypeId], [CompanyId], [Price], [Discount], [Image]) VALUES (88, 2, 3, 4, 120.0000, 70, N'd393cbeb-9add-48f3-802a-d29ac76fb2dc.jpeg')
INSERT [dbo].[Clothes] ([ClothId], [CategoryId], [TypeId], [CompanyId], [Price], [Discount], [Image]) VALUES (89, 2, 1, 4, 100.0000, 50, N'91994777-bdbf-4546-bdfe-28e4aa80d1af.jpeg')
INSERT [dbo].[Clothes] ([ClothId], [CategoryId], [TypeId], [CompanyId], [Price], [Discount], [Image]) VALUES (90, 2, 3, 4, 180.0000, 70, N'bd3c1b9d-f597-4b23-8048-8f64012ac6e9.jpeg')
INSERT [dbo].[Clothes] ([ClothId], [CategoryId], [TypeId], [CompanyId], [Price], [Discount], [Image]) VALUES (91, 3, 10, 4, 200.0000, 30, N'eb0f3eae-b982-4b15-8ff9-7b5807bbcac2.jpeg')
INSERT [dbo].[Clothes] ([ClothId], [CategoryId], [TypeId], [CompanyId], [Price], [Discount], [Image]) VALUES (92, 3, 10, 4, 200.0000, 35, N'cf8ac59b-b902-438c-89ed-625520edecd0.jpeg')
INSERT [dbo].[Clothes] ([ClothId], [CategoryId], [TypeId], [CompanyId], [Price], [Discount], [Image]) VALUES (93, 4, 12, 4, 130.0000, 70, N'9b310dcc-2f3a-4a58-b008-dca027103257.jpeg')
INSERT [dbo].[Clothes] ([ClothId], [CategoryId], [TypeId], [CompanyId], [Price], [Discount], [Image]) VALUES (94, 2, 1, 4, 80.0000, 70, N'9227ca2f-6d3a-4d29-82e7-db155c68daaa.jpeg')
INSERT [dbo].[Clothes] ([ClothId], [CategoryId], [TypeId], [CompanyId], [Price], [Discount], [Image]) VALUES (95, 2, 3, 4, 150.0000, 70, N'5b6e14a6-7cb6-45c7-a67e-a1954d1d8856.jpeg')
INSERT [dbo].[Clothes] ([ClothId], [CategoryId], [TypeId], [CompanyId], [Price], [Discount], [Image]) VALUES (96, 3, 10, 2, 180.0000, 20, N'10c48e06-001b-40b8-bf1a-a59092acc9b5.jpeg')
INSERT [dbo].[Clothes] ([ClothId], [CategoryId], [TypeId], [CompanyId], [Price], [Discount], [Image]) VALUES (97, 3, 10, 4, 200.0000, 35, N'ca50e178-1319-46d2-b826-87e8f5ba2a4e.jpeg')
INSERT [dbo].[Clothes] ([ClothId], [CategoryId], [TypeId], [CompanyId], [Price], [Discount], [Image]) VALUES (98, 3, 10, 4, 200.0000, 30, N'5f02ffbe-fe85-46e2-9738-488c41586186.jpeg')
INSERT [dbo].[Clothes] ([ClothId], [CategoryId], [TypeId], [CompanyId], [Price], [Discount], [Image]) VALUES (99, 3, 10, 1, 250.0000, 40, N'833f4ca2-ca45-4a7b-8f62-29355b0b8fa9.jpeg')
INSERT [dbo].[Clothes] ([ClothId], [CategoryId], [TypeId], [CompanyId], [Price], [Discount], [Image]) VALUES (100, 2, 1, 4, 130.0000, 40, N'38019985-c957-4eb7-bc75-5e40bcdc8b27.jpeg')
INSERT [dbo].[Clothes] ([ClothId], [CategoryId], [TypeId], [CompanyId], [Price], [Discount], [Image]) VALUES (101, 3, 10, 4, 200.0000, 40, N'13e0d303-3404-4206-bbcb-3662358aa80e.jpeg')
INSERT [dbo].[Clothes] ([ClothId], [CategoryId], [TypeId], [CompanyId], [Price], [Discount], [Image]) VALUES (102, 2, 3, 4, 145.0000, 70, N'ca25ca6a-96ee-4303-8df7-0bbc151682f2.jpeg')
INSERT [dbo].[Clothes] ([ClothId], [CategoryId], [TypeId], [CompanyId], [Price], [Discount], [Image]) VALUES (103, 2, 1, 4, 70.0000, 60, N'83044520-3c50-4f0e-a12b-f996a47f7b33.jpeg')
INSERT [dbo].[Clothes] ([ClothId], [CategoryId], [TypeId], [CompanyId], [Price], [Discount], [Image]) VALUES (104, 4, 12, 4, 100.0000, 35, N'cdf8a5a7-34b6-41f5-9ff8-0fddedbd89b0.jpeg')
INSERT [dbo].[Clothes] ([ClothId], [CategoryId], [TypeId], [CompanyId], [Price], [Discount], [Image]) VALUES (105, 4, 3, 4, 130.0000, 70, N'cc829149-a684-48c9-878e-491872cc7e36.jpeg')
INSERT [dbo].[Clothes] ([ClothId], [CategoryId], [TypeId], [CompanyId], [Price], [Discount], [Image]) VALUES (106, 2, 1, 4, 100.0000, 70, N'a319df55-a635-4110-81a5-a07094416679.jpeg')
INSERT [dbo].[Clothes] ([ClothId], [CategoryId], [TypeId], [CompanyId], [Price], [Discount], [Image]) VALUES (107, 2, 1, 4, 100.0000, 70, N'83a0b206-e237-462b-a921-9afcc23c8e22.jpeg')
INSERT [dbo].[Clothes] ([ClothId], [CategoryId], [TypeId], [CompanyId], [Price], [Discount], [Image]) VALUES (108, 3, 10, 4, 200.0000, 30, N'2667cf71-60d2-43fe-8e82-66844b264885.jpeg')
INSERT [dbo].[Clothes] ([ClothId], [CategoryId], [TypeId], [CompanyId], [Price], [Discount], [Image]) VALUES (109, 2, 10, 4, 150.0000, 30, N'69ce67a0-5759-4b43-9c36-5709f8e95cab.jpeg')
INSERT [dbo].[Clothes] ([ClothId], [CategoryId], [TypeId], [CompanyId], [Price], [Discount], [Image]) VALUES (110, 2, 1, 4, 100.0000, 70, N'cc962742-c01d-4f1b-828e-4827e835a8eb.jpeg')
INSERT [dbo].[Clothes] ([ClothId], [CategoryId], [TypeId], [CompanyId], [Price], [Discount], [Image]) VALUES (111, 2, 4, 1, 123.0000, 12, N'638794af-085d-4e5a-b21b-b6d8306e6b7b.jpg')
INSERT [dbo].[Clothes] ([ClothId], [CategoryId], [TypeId], [CompanyId], [Price], [Discount], [Image]) VALUES (118, 3, 1, 4, 400.0000, 0, N'f11db070-4021-43d8-a3fc-8bf1cf8bb7c7.jpeg')
INSERT [dbo].[Clothes] ([ClothId], [CategoryId], [TypeId], [CompanyId], [Price], [Discount], [Image]) VALUES (119, 3, 1, 4, 500.0000, 50, N'cf1eab24-657c-4f07-96d5-1222ec967a5f.jpeg')
SET IDENTITY_INSERT [dbo].[Clothes] OFF
SET IDENTITY_INSERT [dbo].[Companies] ON 

INSERT [dbo].[Companies] ([CompanyId], [CompanyName]) VALUES (1, N'ZARA')
INSERT [dbo].[Companies] ([CompanyId], [CompanyName]) VALUES (2, N'CASTRO')
INSERT [dbo].[Companies] ([CompanyId], [CompanyName]) VALUES (3, N'GOLF')
INSERT [dbo].[Companies] ([CompanyId], [CompanyName]) VALUES (4, N'NAUTICA')
SET IDENTITY_INSERT [dbo].[Companies] OFF
SET IDENTITY_INSERT [dbo].[Types] ON 

INSERT [dbo].[Types] ([TypeId], [TypeName]) VALUES (1, N'חולצה')
INSERT [dbo].[Types] ([TypeId], [TypeName]) VALUES (2, N'חצאית')
INSERT [dbo].[Types] ([TypeId], [TypeName]) VALUES (3, N'שמלה')
INSERT [dbo].[Types] ([TypeId], [TypeName]) VALUES (4, N'מכנס')
INSERT [dbo].[Types] ([TypeId], [TypeName]) VALUES (5, N'חליפה')
INSERT [dbo].[Types] ([TypeId], [TypeName]) VALUES (6, N'חגורה')
INSERT [dbo].[Types] ([TypeId], [TypeName]) VALUES (7, N'נעל')
INSERT [dbo].[Types] ([TypeId], [TypeName]) VALUES (8, N'תיק')
INSERT [dbo].[Types] ([TypeId], [TypeName]) VALUES (9, N'מעיל')
INSERT [dbo].[Types] ([TypeId], [TypeName]) VALUES (10, N'סוודר')
INSERT [dbo].[Types] ([TypeId], [TypeName]) VALUES (11, N'סרט')
INSERT [dbo].[Types] ([TypeId], [TypeName]) VALUES (12, N'בייביגרו')
SET IDENTITY_INSERT [dbo].[Types] OFF
ALTER TABLE [dbo].[Clothes]  WITH CHECK ADD  CONSTRAINT [FK_Clothes_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
GO
ALTER TABLE [dbo].[Clothes] CHECK CONSTRAINT [FK_Clothes_Categories]
GO
ALTER TABLE [dbo].[Clothes]  WITH CHECK ADD  CONSTRAINT [FK_Clothes_Companies1] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([CompanyId])
GO
ALTER TABLE [dbo].[Clothes] CHECK CONSTRAINT [FK_Clothes_Companies1]
GO
ALTER TABLE [dbo].[Clothes]  WITH CHECK ADD  CONSTRAINT [FK_Clothes_Types] FOREIGN KEY([TypeId])
REFERENCES [dbo].[Types] ([TypeId])
GO
ALTER TABLE [dbo].[Clothes] CHECK CONSTRAINT [FK_Clothes_Types]
GO
USE [master]
GO
ALTER DATABASE [clothing Store] SET  READ_WRITE 
GO
