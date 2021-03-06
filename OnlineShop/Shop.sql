USE [master]
GO
/****** Object:  Database [OnlineShop]    Script Date: 18/06/2017 3:23:19 SA ******/
CREATE DATABASE [OnlineShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OnlineShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\OnlineShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OnlineShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\OnlineShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [OnlineShop] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OnlineShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OnlineShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OnlineShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OnlineShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OnlineShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OnlineShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [OnlineShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OnlineShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OnlineShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OnlineShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OnlineShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OnlineShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OnlineShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OnlineShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OnlineShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OnlineShop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [OnlineShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OnlineShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OnlineShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OnlineShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OnlineShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OnlineShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OnlineShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OnlineShop] SET RECOVERY FULL 
GO
ALTER DATABASE [OnlineShop] SET  MULTI_USER 
GO
ALTER DATABASE [OnlineShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OnlineShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OnlineShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OnlineShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OnlineShop] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'OnlineShop', N'ON'
GO
ALTER DATABASE [OnlineShop] SET QUERY_STORE = OFF
GO
USE [OnlineShop]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [OnlineShop]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 18/06/2017 3:23:19 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[RealName] [nvarchar](100) NULL,
	[UserName] [nvarchar](100) NULL,
	[Password] [varchar](50) NULL,
	[Email] [varchar](100) NULL,
	[LevelUser] [varchar](100) NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ads]    Script Date: 18/06/2017 3:23:19 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ads](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](250) NULL,
	[DisplayOrder] [int] NULL,
	[Link] [nvarchar](250) NULL,
	[Description] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Bill]    Script Date: 18/06/2017 3:23:19 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ClientID] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[ProductID] [bigint] NULL,
	[Quantity] [int] NULL,
	[Price] [decimal](18, 0) NULL,
	[TotalPrice] [decimal](18, 0) NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 18/06/2017 3:23:19 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [varchar](250) NULL,
	[ParentID] [bigint] NULL,
	[DisplayOrder] [int] NULL,
	[SeoTitle] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nchar](250) NULL,
	[Status] [bit] NOT NULL,
	[ShowOnHome] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Content]    Script Date: 18/06/2017 3:23:19 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Content](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [varchar](250) NULL,
	[Description] [nvarchar](550) NULL,
	[Images] [nvarchar](250) NULL,
	[CategoryID] [bigint] NULL,
	[Detail] [ntext] NULL,
	[Warranty] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nchar](250) NULL,
	[Status] [bit] NOT NULL,
	[TopHot] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 18/06/2017 3:23:19 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Content] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Footer]    Script Date: 18/06/2017 3:23:19 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Footer](
	[ID] [varchar](50) NOT NULL,
	[Content] [ntext] NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Menu]    Script Date: 18/06/2017 3:23:19 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](50) NULL,
	[Link] [nvarchar](250) NULL,
	[DisplayOrder] [int] NULL,
	[Target] [nvarchar](50) NULL,
	[Status] [bit] NOT NULL,
	[TypeID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MenuType]    Script Date: 18/06/2017 3:23:19 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderBy]    Script Date: 18/06/2017 3:23:19 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderBy](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CustomerID] [bigint] NULL,
	[ShipName] [nvarchar](50) NULL,
	[ShipMobile] [varchar](50) NULL,
	[ShipAddress] [nvarchar](250) NULL,
	[ShipEmail] [nvarchar](100) NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 18/06/2017 3:23:19 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductID] [bigint] NOT NULL,
	[OrderID] [bigint] NOT NULL,
	[Quantity] [int] NULL,
	[Price] [decimal](18, 0) NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 18/06/2017 3:23:19 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Code] [varchar](20) NULL,
	[MetaTitle] [varchar](250) NULL,
	[Description] [ntext] NULL,
	[Images] [nvarchar](250) NULL,
	[MoreImages] [xml] NULL,
	[Price] [decimal](18, 0) NULL,
	[Quantity] [int] NULL,
	[CategoryID] [bigint] NULL,
	[Detail] [ntext] NULL,
	[Warranty] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nchar](250) NULL,
	[Status] [bit] NOT NULL,
	[TopHot] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 18/06/2017 3:23:19 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [varchar](250) NULL,
	[ParentID] [bigint] NULL,
	[DisplayOrder] [int] NULL,
	[SeoTitle] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nchar](250) NULL,
	[Status] [bit] NOT NULL,
	[ShowOnHome] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Slide]    Script Date: 18/06/2017 3:23:19 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slide](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](250) NULL,
	[DisplayOrder] [int] NULL,
	[Link] [nvarchar](250) NULL,
	[Description] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SystemConfig]    Script Date: 18/06/2017 3:23:19 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemConfig](
	[ID] [varchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Type] [varchar](50) NULL,
	[Value] [nvarchar](250) NULL,
	[Status] [bit] NOT NULL
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([ID], [RealName], [UserName], [Password], [Email], [LevelUser], [Status]) VALUES (1, N'Nguyễn Đức Trí', N'tri', N'b85593ca6abda3f203e0af8239beb228', N'tri@tgmail.com', N'client', 1)
INSERT [dbo].[Account] ([ID], [RealName], [UserName], [Password], [Email], [LevelUser], [Status]) VALUES (2, N'Đinh Văn Trơn', N'admin', N'4a1b9957d604c17c8e2490afc75aa6d8', N'htcvtc59@gmail.com', N'admin', 1)
INSERT [dbo].[Account] ([ID], [RealName], [UserName], [Password], [Email], [LevelUser], [Status]) VALUES (3, N'Đinh Bảo', N'bao', N'bao123', N'bao@gmail.com', N'client', 1)
INSERT [dbo].[Account] ([ID], [RealName], [UserName], [Password], [Email], [LevelUser], [Status]) VALUES (4, N'Đinh Tiến', N'tien', N'tien213', N'tien@gmail.com', N'client', 1)
INSERT [dbo].[Account] ([ID], [RealName], [UserName], [Password], [Email], [LevelUser], [Status]) VALUES (5, N'Vũ Lê Minh', N'minh', N'minh123', N'minh@gmail.com', N'client', 1)
SET IDENTITY_INSERT [dbo].[Account] OFF
SET IDENTITY_INSERT [dbo].[Ads] ON 

INSERT [dbo].[Ads] ([ID], [Image], [DisplayOrder], [Link], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1, N'/Data/images/home-bottom-ipad-new-1040x194.jpg', 0, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Ads] ([ID], [Image], [DisplayOrder], [Link], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2, N'/Data/images/home-bottom-iphone7-red-1040x194.jpg', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Ads] ([ID], [Image], [DisplayOrder], [Link], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (3, N'/Data/images/home-bottom-macbook-new-touchbar-1040x191.jpg', 2, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Ads] ([ID], [Image], [DisplayOrder], [Link], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (4, N'/Data/images/home-bottom-pk-chinh-hang1-1040x191.jpg', 3, NULL, NULL, NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Ads] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (1, N'Hướng dẫn và thủ thuật game', N'Huong-dan-va-thu-thuat-game', NULL, 0, NULL, CAST(N'2017-06-17T01:19:10.337' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Category] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (2, N'Chương trình khuyến mãi', N'Chuong-trinh-khuyen-mai', NULL, 1, NULL, CAST(N'2017-06-17T01:19:54.523' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Category] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (3, N'Trên tay sản phẩm', N'Tren-tay-san-pham', NULL, 3, NULL, CAST(N'2017-06-17T01:20:11.180' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Category] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (4, N'Tin tức tổng hợp', N'Tin-tuc-tong-hop', NULL, 2, NULL, CAST(N'2017-06-17T01:20:27.693' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Content] ON 

INSERT [dbo].[Content] ([ID], [Name], [MetaTitle], [Description], [Images], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot]) VALUES (1, N'Hướng dẫn cập nhật PES 2017', N'HuongdancapnhatPES2017', N'Tải file cập nhật tại đây 1. Format usb thành FAT32 trên máy tính. 2. Copy những option file vào thư mục WEPES trong usb. 3. Trên máy PS4, chúng ta vào menu EXTRAS -> EDIT 4. Vào “Data Manageme...', N'/Data/images/Content/huong-dan-cap-nhat-pes-2017-800x468.jpg', 1, N'<div class="row" id="contentLarge">
    <div class="col-sm-8 col-sm-offset-2">
        <div id="headerCate">
            Hướng dẫn cập nhật PES 2017
        </div>
        <div style="text-align: center;">
            <iframe width="560" height="315"
                    src="https://www.youtube.com/embed/kcvoqyuqvLk" frameborder="0" allowfullscreen></iframe>
        </div>
        <p style="color: #5bc0de">Tải file cập nhật tại đây</p><br>
        <p>1. Format usb thành FAT32 trên máy tính.</p><br>
        <div class="imgcenternew">
            <img src="http://haloshop.vn/image/data/blogs/2017/huong-dan-cap-nhat-pes-2017-1.jpg"/>
        </div>
        <br>
        <p>2. Copy những option file vào thư mục WEPES trong usb.</p><br>
        <div class="imgcenternew">
            <img style="padding-left: 10%;" src="http://haloshop.vn/image/data/blogs/2017/huong-dan-cap-nhat-pes-2017-2.jpg"/>
        </div><br>
<p>3. Trên máy PS4, chúng ta vào menu EXTRAS -> EDIT</p>
        <div class="imgcenternew">
            <img style="padding-left: 10%;" src="http://haloshop.vn/image/data/blogs/2017/huong-dan-cap-nhat-pes-2017-3.jpg"/>
        </div><br>
<p>4. Vào “Data Management” -> “Import/Export” -> “Import images” -> Competition Emblems như hình dưới đây.</p><br>
        <div class="imgcenternew">
            <img style="padding-left: 10%;" src="http://haloshop.vn/image/data/blogs/2017/huong-dan-cap-nhat-pes-2017-4.jpg"/>
        </div><br>
        <div class="imgcenternew">
            <img style="padding-left: 10%;" src="http://haloshop.vn/image/data/blogs/2017/huong-dan-cap-nhat-pes-2017-5.jpg"/>
        </div><br>
        <div class="imgcenternew">
            <img style="padding-left: 10%;" src="http://haloshop.vn/image/data/blogs/2017/huong-dan-cap-nhat-pes-2017-6.jpg"/>
        </div><br>
        <div class="imgcenternew">
            <img style="padding-left: 10%;" src="http://haloshop.vn/image/data/blogs/2017/huong-dan-cap-nhat-pes-2017-7.jpg"/>
        </div><br>
        <p>5. Sau đó chọn những hình có Logo của các giải đấu -> OK</p><br>
        <div class="imgcenternew">
            <img style="padding-left: 10%;" src="http://haloshop.vn/image/data/blogs/2017/huong-dan-cap-nhat-pes-2017-8.jpg"/>
        </div><br>
        <p>
            6. Sau đó ra ngoài Menu chính của Edit chọn mục Competitions để chỉnh sửa Tên, Logo, Banh v.v… các giải đấu như Premier League (Ngoại hạng Anh).
        </p><br>
        <div class="imgcenternew">
            <img style="padding-left: 10%;" src="http://haloshop.vn/image/data/blogs/2017/huong-dan-cap-nhat-pes-2017-9.jpg"/>
        </div><br>
        <p>7. Chúng ta chỉnh lại tên và logo giải đấu các nước đúng với hiện tại.</p><br>
        <div class="imgcenternew">
            <img style="padding-left: 10%;" src="http://haloshop.vn/image/data/blogs/2017/huong-dan-cap-nhat-pes-2017-10.jpg"/>
        </div><br>
        <div class="imgcenternew">
            <img style="padding-left: 10%;" src="http://haloshop.vn/image/data/blogs/2017/huong-dan-cap-nhat-pes-2017-11.jpg"/>
        </div><br>
        <div class="imgcenternew">
            <img style="padding-left: 10%;" src="http://haloshop.vn/image/data/blogs/2017/huong-dan-cap-nhat-pes-2017-12.jpg"/>
        </div><br>

    </div>
</div>', NULL, CAST(N'2017-06-17T02:19:18.573' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[Content] OFF
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (2, N'APPLE', N'APPLE', 0, NULL, 1, NULL)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (3, N'ĐIỆN THOẠI', N'DIEN-THOAI', 1, NULL, 1, NULL)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (4, N'MÁY TÍNH', N'MAY-TINH', 2, NULL, 1, NULL)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (5, N'MÁY GAME', N'MAY-GAME', 3, NULL, 1, NULL)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (6, N'PHỤ KIỆN', N'PHU-KIEN', 4, NULL, 1, NULL)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (7, N'BẢN TIN', N'BAN-TIN', 5, NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[Menu] OFF
SET IDENTITY_INSERT [dbo].[OrderBy] ON 

INSERT [dbo].[OrderBy] ([ID], [CreatedDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (1, CAST(N'2017-06-11T05:52:27.390' AS DateTime), NULL, N'Minh', N'0312312313', N'Số 7 Tôn Thất Thuyết,Cầu giấy', N'abc@gmail.com', 0)
INSERT [dbo].[OrderBy] ([ID], [CreatedDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (13, CAST(N'2017-06-14T05:56:02.443' AS DateTime), NULL, N'Duc', N'013213213123', N'Viet ', N'123@gmail.com', 0)
INSERT [dbo].[OrderBy] ([ID], [CreatedDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (14, CAST(N'2017-06-17T05:27:39.603' AS DateTime), NULL, N'Nguyễn Đức Trí', N'012344234354', N'Số 7 Tôn Thất Thuyết,Cầu giấy', N'tri@gmail.com', 0)
INSERT [dbo].[OrderBy] ([ID], [CreatedDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (15, CAST(N'2017-06-17T09:40:23.980' AS DateTime), NULL, N'Tron', N'01234567', N'Số 7 Tôn Thất Thuyết,Cầu giấy', N'123@gmail.com', 0)
SET IDENTITY_INSERT [dbo].[OrderBy] OFF
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([ID], [ProductID], [OrderID], [Quantity], [Price], [Status]) VALUES (1, 14, 1, 1, CAST(20850000 AS Decimal(18, 0)), 1)
INSERT [dbo].[OrderDetail] ([ID], [ProductID], [OrderID], [Quantity], [Price], [Status]) VALUES (9, 9, 13, 1, CAST(19650000 AS Decimal(18, 0)), 1)
INSERT [dbo].[OrderDetail] ([ID], [ProductID], [OrderID], [Quantity], [Price], [Status]) VALUES (10, 15, 14, 1, CAST(16700000 AS Decimal(18, 0)), 1)
INSERT [dbo].[OrderDetail] ([ID], [ProductID], [OrderID], [Quantity], [Price], [Status]) VALUES (11, 9, 14, 1, CAST(19650000 AS Decimal(18, 0)), 1)
INSERT [dbo].[OrderDetail] ([ID], [ProductID], [OrderID], [Quantity], [Price], [Status]) VALUES (12, 53, 14, 1, CAST(20500000 AS Decimal(18, 0)), 1)
INSERT [dbo].[OrderDetail] ([ID], [ProductID], [OrderID], [Quantity], [Price], [Status]) VALUES (13, 9, 15, 2, CAST(19650000 AS Decimal(18, 0)), 1)
INSERT [dbo].[OrderDetail] ([ID], [ProductID], [OrderID], [Quantity], [Price], [Status]) VALUES (14, 14, 15, 1, CAST(20850000 AS Decimal(18, 0)), 1)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Images], [MoreImages], [Price], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot]) VALUES (8, N'Máy đo chất lượng không khí Xiaomi PM2.5 Detector', N'PK01', N'May-do-chat-luong-khong-khi-Xiaomi-PM25-Detector', NULL, N'/Data/images/xiaomi-pm25-00-250x219.jpg', NULL, CAST(1700000 AS Decimal(18, 0)), 12, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Images], [MoreImages], [Price], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot]) VALUES (9, N'iPhone 7 Plus - 128GB', N'IP01', N'iPhone7Plus128GB', N'<div class="embed-responsive embed-responsive-16by9" >
    <iframe id="video" src="https://www.cnet.com/videos/share/iphone-7-plus-our-photo-field-test/"
            frameBorder="0" allowFullScreen></iframe>

</div>
<p style="margin-top: 10px">
    iPhone 7 đã ra mắt và mang đến vô số những thay đổi to lớn trong ngành công nghệ.
    Giờ đây, bạn không chỉ cầm trên tay và cảm nhận iPhone 7 như một chiếc smartphone, mà đó là một chiếc camera
    chụp ảnh siêu việt, cỗ máy chơi game hoàn hảo, dàn âm thanh mini chất lượng cao hay thiết bị điện tử siêu bền
    bỉ miễn nhiễm với nước và bụi bẩn.<br>
    <span>Thiết kế khác biệt và vượt trội</span><br>
    iPhone 7 đạt đến độ hoàn thiện cao nhất, với hình mẫu thiết kế như một siêu phẩm đi trước thời đại.
    Bổ sung thêm màu sắc Jet Black không chỉ làm phong phú cho bộ sưu tập iPhone 7 mà còn là điểm nhấn trong
    khâu thiết kế. Bên cạnh đó, nút Home trên iPhone 7 cũng được thiết kế lại, bổ sung thêm tính năng cảm ứng
    lực cũng như trông hoàn hảo hơn khi đặt lên bộ khung của flag-ship nhà Apple.<br>

    Vật liệu được sử dụng chính là nhôm 7000 Series siêu cứng, siêu bền, giảm trầy xước
    cùng 5 màu sắc, 2 kích thước khiến bộ đôi iPhone 7 và iPhone 7 Plus luôn mang tính thời trang
    và thể hiện được cá tính riêng của người sử dụng.<br>

    Khả năng chống nước và bụi lần đầu tiên được mang lên một chiếc iPhone. Thách thức thời
    tiết bây giờ không còn là vấn đề với iPhone 7 với chuẩn IP67. Những chuyến dã ngoại, pool party vô
    tư cùng bạn bè mà vẫn yên tâm vì luôn có người bạn iPhone 7 bên cạnh.<br>
</p>
<img src="http://haloshop.vn/image/data/products/apple/iphone/iphone-7-21.jpg" /><br>
<span>Hệ thống camera siêu việt</span><br>
<p>
    Độ phân giải 12MP cùng khẩu độ f/1.8 rất lớn cho smartphone và thấu kính 6 thành phần trên iPhone 7 sẽ tạo nên những bức ảnh chụp thiếu sáng tốt hơn rất nhiều. Quay video ở độ phân giải 4K cũng vậy, một khi chiêm ngưỡng những thước phim từ iPhone 7 bạn sẽ không ngừng hỏi vì sao một chiếc smartphone lại có thể quay video đẹp đến vậy !
    Mỗi khoảnh khắc bạn chạm để chụp, công nghệ ISP hoàn toàn mới được kích hoạt và xử lý đến 100 tỉ phép tính trong thời gian chưa đến 1 giây để hòa trộn và tạo ra một bức hình trông tuyệt nhất. Đó chính là sự thông minh và đó chính là sự ưu việt trên iPhone 7.
    <br>
    Riêng iPhone 7 Plus đang tạo nên một sự đột phá lớn khi được trang bị đến 2 camera độ phân giải 12MP. Một cho chụp ảnh góc rộng và một cho chụp ảnh tele với khả năng zoom đến 10x. Hiệu ứng trên những bức ảnh chụp chân dung sẽ có chiều sâu tuyệt vời và ảnh chụp phong cảnh sẽ rõ nét đến từng chi tiết khi bạn zoom vào. Tất cả sẽ phải ngỡ ngàng với những shoot hình được chụp từ iPhone 7 Plus.
    Camera trước được nâng độ phân giải lên đến 7MP cùng với việc cung cấp dải màu rộng hơn. Selfie hay chat video qua FaceTime sẽ "sướng hơn !
    
</p>
<img src="http://haloshop.vn/image/data/products/apple/iphone/iphone-7-22.jpg" /><br>
<span>Màn hình Retina hiển thị rực rỡ</span><br>
<p>
    Hầu như tất cả các thao tác cũng như sự trải nghiệm đều thông qua màn hình hiển thị. Cho dù là xem hình ảnh, chơi game, đọc tin tức, tin nhắn bạn vẫn phải xem và tương tác trên màn hình. Và thật tuyệt khi iPhone 7 được trang bị màn hình Retina thế hệ cho độ sáng cao hơn 25%, dải màu hiển thị rộng hơn và tính năng 3D Touch thông minh sẽ nâng tầm trải nghiệm cho chính bạn. Mỗi cú chạm lên màn hình là mỗi lần bạn cảm nhận được tính ưu việt của màn hình Retina.
</p><br>
<img src="http://haloshop.vn/image/data/products/apple/iphone/iphone-7-23.jpg"/>
', N'/Data/images/iphone-7-plus-00-250x219.jpg', N'/Data/images/DetailPro/iphone-7-plus-00-700x700.jpg,/Data/images/DetailPro/iphone-7-plus-41-700x700.jpg,/Data/images/DetailPro/iphone-7-plus-46-700x700.jpg,', CAST(19650000 AS Decimal(18, 0)), 10, 6, N'<div class="headerDetailDes">Kết nối dữ liệu</div>
<div class="itemDetailDes">
    <table>
        <tr>
            <td class="iitemDes" >Loại sim</td>
            <td class="citemDes" >Nano-SIM</td>
        </tr>
        <tr>
            <td class="iitemDes" >GPS</td>
            <td class="citemDes" >Có, A-GPS, GLONASS</td>
        </tr>
        <tr>
            <td class="iitemDes" >Wi-Fi</td>
            <td class="citemDes" >Wi-Fi 802.11 a / b / g / n / ac, Băng tần kép</td>
        </tr>
        <tr>
            <td class="iitemDes" >Wi-Fi Hotspot</td>
            <td class="citemDes" >Có</td>
        </tr>
        <tr>
            <td class="iitemDes" >Bluetooth</td>
            <td class="citemDes" >v4.2, A2DP, LE</td>
        </tr>
        <tr>
            <td class="iitemDes" >NFC</td>
            <td class="citemDes" >Có (thanh toán Apple Pay)</td>
        </tr>
    </table>

</div>
<div class="headerDetailDes">Cấu hình chi tiết</div>
<div class="itemDetailDes">
    <table>
        <tr>
            <td class="iitemDes" >Bộ nhớ trong</td>
            <td class="citemDes" >128 GB</td>
        </tr>
        <tr>
            <td class="iitemDes" >Hệ điều hành</td>
            <td class="citemDes" >iOS 10</td>
        </tr>
        <tr>
            <td class="iitemDes" >Hỗ trợ thẻ nhớ</td>
            <td class="citemDes" >Không</td>
        </tr>
        <tr>
            <td class="iitemDes" >Chipset</td>
            <td class="citemDes" >Apple A10 Fusion</td>
        </tr>
        <tr>
            <td class="iitemDes" >Chi tiết CPU</td>
            <td class="citemDes" >Quad-core</td>
        </tr>
        <tr>
            <td class="iitemDes" >Ram</td>
            <td class="citemDes" >3 GB</td>
        </tr>
        <tr>
            <td class="iitemDes" >Cảm biến</td>
            <td class="citemDes" >Cảm biến gia tốc, Con quay hồi chuyển, Cảm biến tiệm cận, La bàn, Cảm biến vân tay, Cảm biến áp suất</td>
        </tr>
        <tr>
            <td class="iitemDes" >Trình duyệt web</td>
            <td class="citemDes" >HTML5 (Safari)</td>
        </tr>
        <tr>
            <td class="iitemDes" >Ngôn ngữ</td>
            <td class="citemDes" >Đa ngôn ngữ</td>
        </tr>
        <tr>
            <td class="iitemDes" >Ram</td>
            <td class="citemDes" >3 GB</td>
        </tr>
    </table>

</div>
<div class="headerDetailDes">Màn hình</div>
<div class="itemDetailDes">
    <table>
        <tr>
            <td class="iitemDes" >Kích thước màn hình</td>
            <td class="citemDes" >5.5 inches</td>
        </tr>
        <tr>
            <td class="iitemDes" >Loại màn hình</td>
            <td class="citemDes" >IPS LCD, 3D Touch, kính cường lực, lớp phủ chống thấm </td>
        </tr>
        <tr>
            <td class="iitemDes" >Màu màn hình</td>
            <td class="citemDes" >16 triệu</td>
        </tr>
        <tr>
            <td class="iitemDes" >Độ phân giải</td>
            <td class="citemDes" >1080 x 1920 pixels</td>
        </tr>
        <tr>
            <td class="iitemDes" >Mật độ điểm ảnh</td>
            <td class="citemDes" >401 ppi</td>
        </tr>
    </table>

</div>
<div class="headerDetailDes">Camera</div>
<div class="itemDetailDes">
    <table>
        <tr>
            <td class="iitemDes" >Camera chính</td>
            <td class="citemDes" >Dual 12 MP, f/1.8, 28mm & f/2.8, 56mm</td>
        </tr>
        <tr>
            <td class="iitemDes" >Camera phụ</td>
            <td class="citemDes" >7 MP, f/2.2</td>
        </tr>
        <tr>
            <td class="iitemDes" >Flash</td>
            <td class="citemDes" >Có, Quad-LED (dual-tone)</td>
        </tr>
        <tr>
            <td class="iitemDes" >Tính năng camera</td>
            <td class="citemDes" >Chống rung quang học OIS, Panorama, Geo-tagging, Chạm để lấy nét,
                Ghi đồng thời video 4K và hình ảnh 8MP, Nhận diện khuôn mặt và nụ cười, HDR,
                Tự động lấy nét</td>
        </tr>
        <tr>
            <td class="iitemDes" >Quay phim</td>
            <td class="citemDes" >Quay video 4K 60fps, , 2160p@30fps, 1080p@120/60fps, 720p@240fps</td>
        </tr>
        <tr>
            <td class="iitemDes" >Video Call</td>
            <td class="citemDes" >Có, 1080p@30fps</td>
        </tr>
    </table>

</div>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Images], [MoreImages], [Price], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot]) VALUES (10, N'MacBook Pro 13-inch with Touch Bar Silver - 256GB', N'MB', N'MacBook-Pro-13inch-with-Touch-Bar-Silver--256GB', NULL, N'/Data/images/macbook-pro-2016-13-inch-with-touch-bar-white-00-250x219.jpg', NULL, CAST(38000000 AS Decimal(18, 0)), 20, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Images], [MoreImages], [Price], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot]) VALUES (11, N'Tekken 7', N'NT01', N'Tekken-7', NULL, N'/Data/images/tekken-7-xbox-one-250x250.jpg', NULL, CAST(1530000 AS Decimal(18, 0)), 4, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Images], [MoreImages], [Price], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot]) VALUES (12, N'The Binding of Isaac: Afterbirth+ - US', N'NT02', N'The-Binding-of-Isaac-Afterbirth--US', NULL, N'/Data/images/the-binding-of-isaac-afterbirth-plus-switch-250x250.jpg', NULL, CAST(1150000 AS Decimal(18, 0)), 3, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Images], [MoreImages], [Price], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot]) VALUES (13, N'Xbox One S - 1TB - Battlefield 1', N'XB01', N'Xbox-One-S--1TB--Battlefield-1', NULL, N'/Data/images/xbox-one-s-1tb-battlefield-1-00-250x250.jpg', NULL, CAST(8880000 AS Decimal(18, 0)), 15, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Images], [MoreImages], [Price], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot]) VALUES (14, N'iPhone 7 Plus - 256GB', NULL, N'iPhone-7-Plus--256GB', NULL, N'/Data/images/iphone-7-plus-00-250x219.jpg', NULL, CAST(20850000 AS Decimal(18, 0)), 16, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Images], [MoreImages], [Price], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot]) VALUES (15, N'iPhone 7 - 128GB 99%', NULL, N'iPhone-7--128GB-99', NULL, N'/Data/images/iphone-7-00-250x250.jpg', NULL, CAST(16700000 AS Decimal(18, 0)), 3, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Images], [MoreImages], [Price], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot]) VALUES (16, N'iPhone 6s - 32GB', NULL, N'iPhone-6s--32GB', NULL, N'/Data/images/iphone-6s-00-250x250.jpg', NULL, CAST(13600000 AS Decimal(18, 0)), 2, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Images], [MoreImages], [Price], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot]) VALUES (17, N'iPhone SE - 16GB', NULL, N'iPhone-SE--16GB', NULL, N'/Data/images/iphone-se-00-250x250.jpg', NULL, CAST(10380000 AS Decimal(18, 0)), 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Images], [MoreImages], [Price], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot]) VALUES (18, N'iPhone 7 - 128GB - RED', NULL, N'iPhone-7--128GB--RED', NULL, N'/Data/images/iphone-7-red-00-250x250.jpg', NULL, CAST(17750000 AS Decimal(18, 0)), 13, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Images], [MoreImages], [Price], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot]) VALUES (19, N'iPhone 7 - 256GB - RED', NULL, N'iPhone-7--256GB--RED', NULL, N'/Data/images/iphone-7-red-00-250x250.jpg', NULL, CAST(21500000 AS Decimal(18, 0)), 7, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Images], [MoreImages], [Price], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot]) VALUES (20, N'iPhone 7 Plus - 128GB - RED', NULL, N'iPhone-7-Plus--128GB--RED', NULL, N'/Data/images/iphone-7-red-00-250x250.jpg', NULL, CAST(20950000 AS Decimal(18, 0)), 6, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Images], [MoreImages], [Price], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot]) VALUES (21, N'iPhone 7 Plus - 256GB - RED', NULL, N'iPhone-7-Plus--256GB--RED', NULL, N'/Data/images/iphone-7-red-00-250x250.jpg', NULL, CAST(23050000 AS Decimal(18, 0)), 5, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Images], [MoreImages], [Price], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot]) VALUES (22, N'Samsung Galaxy S8', NULL, N'Samsung-Galaxy-S8', NULL, N'/Data/images/636310466030005418_s81o.jpg', NULL, CAST(18490000 AS Decimal(18, 0)), 3, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Images], [MoreImages], [Price], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot]) VALUES (23, N'Samsung Galaxy S7 Edge Black Pearl 128GB', NULL, N'Samsung-Galaxy-S7-Edge-Black-Pearl-128GB', NULL, N'/Data/images/636186286268833312_Samsung-S7-Edge-Black-Pearl-1o.jpg', NULL, CAST(16990000 AS Decimal(18, 0)), 4, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Images], [MoreImages], [Price], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot]) VALUES (24, N'Samsung Galaxy S7 Edge Blue Coral', NULL, N'Samsung-Galaxy-S7-Edge-Blue-Coral', NULL, N'/Data/images/636186285157578318_Samsung-Galaxy-S7-Edge-Blue-Coral.png', NULL, CAST(15490000 AS Decimal(18, 0)), 2, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Images], [MoreImages], [Price], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot]) VALUES (25, N'Samsung Galaxy C9 Pro', NULL, N'SamsungGalaxyC9Pro', NULL, N'/Data/images/636264884383794375_C9-pro-1.png', NULL, CAST(11490000 AS Decimal(18, 0)), 3, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Images], [MoreImages], [Price], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot]) VALUES (26, N'Samsung Galaxy Note 5', NULL, N'Samsung-Galaxy-Note-5', NULL, N'/Data/images/635744747929826487_note-5-1o.jpg', NULL, CAST(10990000 AS Decimal(18, 0)), 2, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Images], [MoreImages], [Price], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot]) VALUES (27, N'Samsung Galaxy A7 (2017)', NULL, N'Samsung-Galaxy-A7-2017', NULL, N'/Data/images/636312429101807042_a7-2017.jpg', NULL, CAST(10990000 AS Decimal(18, 0)), 4, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Images], [MoreImages], [Price], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot]) VALUES (28, N'Samsung Galaxy J5 2016', NULL, N'Samsung-Galaxy-J5-2016', NULL, N'/Data/images/636177371940417796_636171500785551590_Samsung-galaxy-j5-2016-black-1.jpg', NULL, CAST(4490000 AS Decimal(18, 0)), 3, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Images], [MoreImages], [Price], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot]) VALUES (29, N'Dell Inspiron N3567C', NULL, N'Dell-Inspiron-N3567C', NULL, N'/Data/images/636195689128102400_Dell-Inspiron-N3567-1.png', NULL, CAST(9990000 AS Decimal(18, 0)), 3, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Images], [MoreImages], [Price], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot]) VALUES (30, N'Dell Ins N3558G', NULL, N'Dell-Ins-N3558G', NULL, N'/Data/images/636032236925462262_3558G.jpg', NULL, CAST(9990000 AS Decimal(18, 0)), 6, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Images], [MoreImages], [Price], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot]) VALUES (31, N'Dell Ins N3458/i3-5005U', NULL, N'Dell-Ins-N3458i35005U', NULL, N'/Data/images/635932067849527923_Dell-Ins-N3458.jpg', NULL, CAST(10290000 AS Decimal(18, 0)), 3, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Images], [MoreImages], [Price], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot]) VALUES (32, N'Dell V3468', NULL, N'Dell-V3468', NULL, N'/Data/images/636195689128102400_Dell-Inspiron-N3567-1.png', NULL, CAST(10990000 AS Decimal(18, 0)), 2, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Images], [MoreImages], [Price], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot]) VALUES (33, N'Dell Ins N3567', NULL, N'Dell-Ins-N3567', NULL, N'/Data/images/636245856530196538_1o.jpg', NULL, CAST(10990000 AS Decimal(18, 0)), 3, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Images], [MoreImages], [Price], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot]) VALUES (34, N'Dell Ins N3467/i5-7200U', NULL, N'Dell-Ins-N3467i57200U', NULL, N'/Data/images/636172230916533275_Dell-Ins-N3467i5-7200U.jpg', NULL, CAST(12690000 AS Decimal(18, 0)), 7, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Images], [MoreImages], [Price], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot]) VALUES (35, N'Dell Ins N3558/i5-5200U', NULL, N'Dell-Ins-N3558i55200U', NULL, N'/Data/images/635821402473810204_laptop-dell-vostro-3558-i3-4005u-1cell.jpg', NULL, CAST(13690000 AS Decimal(18, 0)), 5, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Images], [MoreImages], [Price], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot]) VALUES (36, N'Dell V5568', NULL, N'Dell-V5568', NULL, N'/Data/images/636284588178379901_V5568-1.png', NULL, CAST(13990000 AS Decimal(18, 0)), 6, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Images], [MoreImages], [Price], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot]) VALUES (37, N'Playstation 4 Slim - 500GB - Uncharted 4 Bundle', NULL, N'Playstation-4-Slim--500GB--Uncharted-4-Bundle', NULL, N'/Data/images/ps4-slim-500gb-uncharted-4-00-250x250.jpg', NULL, CAST(7380000 AS Decimal(18, 0)), 4, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Images], [MoreImages], [Price], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot]) VALUES (38, N'DiRT 4', NULL, N'DiRT-4', NULL, N'/Data/images/dirt-4-ps4-250x250.jpg', NULL, CAST(1530000 AS Decimal(18, 0)), 2, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Images], [MoreImages], [Price], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot]) VALUES (39, N'Dark Rose Valkyrie - US', NULL, N'Dark-Rose-Valkyrie--US', NULL, N'/Data/images/dark-rose-valkyrie-ps4-250x250.jpg', NULL, CAST(1530000 AS Decimal(18, 0)), 6, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Images], [MoreImages], [Price], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot]) VALUES (40, N'Lock''s Quest - US', NULL, N'Locks-Quest--US', NULL, N'/Data/images/locks-quest-ps4-250x250.jpg', NULL, CAST(680000 AS Decimal(18, 0)), 2, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Images], [MoreImages], [Price], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot]) VALUES (41, N'Puyo Puyo Tetris - US', NULL, N'Puyo-Puyo-Tetris--US', NULL, N'/Data/images/puyo-puyo-tetris-ps4-250x250.jpg', NULL, CAST(930000 AS Decimal(18, 0)), 9, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Images], [MoreImages], [Price], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot]) VALUES (42, N'Wipeout Omega Collection - US', NULL, N'Wipeout-Omega-Collection--US', NULL, N'/Data/images/wipeout-omega-collection-ps4-250x250.jpg', NULL, CAST(1100000 AS Decimal(18, 0)), 4, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Images], [MoreImages], [Price], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot]) VALUES (43, N'Tekken 7 - US', NULL, N'Tekken-7--US', NULL, N'/Data/images/tekken-7-ps4-250x250.jpg', NULL, CAST(1530000 AS Decimal(18, 0)), 4, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Images], [MoreImages], [Price], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot]) VALUES (44, N'RiME - US', NULL, N'RiME--US', NULL, N'/Data/images/rime-ps4-250x250.jpg', NULL, CAST(1350000 AS Decimal(18, 0)), 2, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Images], [MoreImages], [Price], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot]) VALUES (45, N'Star Trek Bridge Crew - US', NULL, N'Star-Trek-Bridge-Crew--US', NULL, N'/Data/images/star-trek-bridge-view-ps4-250x250.jpg', NULL, CAST(1280000 AS Decimal(18, 0)), 3, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Images], [MoreImages], [Price], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot]) VALUES (46, N'Pokemon Case for iPhone 6s / 6s Plus', NULL, N'Pokemon-Case-for-iPhone-6s--6s-Plus', NULL, N'/Data/images/pokemon-case-00-250x250.jpg', NULL, CAST(180000 AS Decimal(18, 0)), 10, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Images], [MoreImages], [Price], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot]) VALUES (47, N'Case Mèo Thần Tài iPhone 7 / 7 Plus', NULL, N'Case-Meo-Than-Tai-iPhone-7--7-Plus', NULL, N'/Data/images/case-li-xi-00-250x250.jpg', NULL, CAST(90000 AS Decimal(18, 0)), 16, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Images], [MoreImages], [Price], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot]) VALUES (48, N'Case Memumi Lily iPhone 7', NULL, N'Case-Memumi-Lily-iPhone-7', NULL, N'/Data/images/memumi-lily-iphone-7-41-250x250.jpg', NULL, CAST(230000 AS Decimal(18, 0)), 18, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Images], [MoreImages], [Price], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot]) VALUES (49, N'Case Da Cá Sấu iPhone 7 Plus', NULL, N'Case-Da-Ca-Sau-iPhone-7-Plus', NULL, N'/Data/images/case-iphone-6s-plus-da-ca-sau-00-250x250.jpg', NULL, CAST(180000 AS Decimal(18, 0)), 13, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Images], [MoreImages], [Price], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot]) VALUES (50, N'Avenger Case for iPhone 7 / 7 Plus', NULL, N'Avenger-Case-for-iPhone-7--7-Plus', NULL, N'/Data/images/avenger-case-00-250x250.jpg', NULL, CAST(280000 AS Decimal(18, 0)), 5, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Images], [MoreImages], [Price], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot]) VALUES (51, N'iPhone 7 Plus - 32GB 99%', NULL, N'iPhone7Plus32GB99', NULL, N'/Data/images/iphone-6s-00-250x250.jpg', N'/Data/images/DetailPro/iphone-7-45-700x700.jpg,/Data/images/DetailPro/iphone-7-plus-00-700x700.jpg,/Data/images/DetailPro/iphone-7-plus-41-700x700.jpg,/Data/images/DetailPro/iphone-7-plus-46-700x700.jpg,', CAST(18450000 AS Decimal(18, 0)), 4, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Images], [MoreImages], [Price], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot]) VALUES (52, N'iPad Pro 10.5" - Wi-Fi - 256GB', NULL, N'iPadPro105WiFi256GB', N'<div class="embed-responsive embed-responsive-16by9">
    <iframe id="video" src="https://www.youtube.com/embed/UR5ODc5Wbbo"
            frameBorder="0" allowFullScreen></iframe>

</div>
<br>
<p style="margin-top: 10px">
    <b>iPad Pro 10.5 inch</b> sở hữu kích thước tối ưu nhất, không to nặng và cồng
    kềnh nhưng màn hình cũng đủ rộng để mang lại trải nghiệm tốt nhất.
    Nay với rất nhiều cải tiến,<b>iPad Pro 10.5 inch</b> đã bước lên tầm cao mới về tính hữu dụng
    , tính chuyên nghiệp và tính trải nghiệm.
    <div style="margin-top: 10px; margin-bottom: 10px;"></div>
    <img src="http://haloshop.vn/image/data/products/apple/ipad/ipad-pro-10-21.jpg"/><br>
    <span>Màn hình hiển thị tuyệt vời</span><br>
    Chìa khóa trải nghiệm trên iPad Pro 10.5 inch chính là hàng triệu điểm ảnh nằm trên màn hình
    Multi-Touch của máy. Nay với tốc độ quét 120Hz mà chưa có chiếc tablet nào làm được, mọi khung
    hình hiển thị trên iPad Pro 10.5 inch đều trở thành mượt mà và chân thực hơn. Bên cạnh đó, màn
    hình 120Hz cũng hỗ trợ tối đa cho Apple Pencil, giúp chiếc bút "quyền năng" này phản hồi nhanh
    và nhạy hơn.<br>
    iPad Pro 10.5 inch còn sở hữu màn hình sáng hơn thế hệ trước, độ nhạy cao hơn, hiển thị dải màu
    tốt hơn giúp những tác vụ chuyên sâu như thiết kế, đồ họa được chính xác hơn.
    <br>
    <img src="http://haloshop.vn/image/data/products/apple/ipad/ipad-pro-10-22.jpg"/><br>
<div style="background-color: #e5e5e5;height: 30px;max-width: 600px;line-height:30px;text-align: center;">
    iPad Pro 10.5 inch - Chiếc tablet hoàn hảo nhất.
</div>
<span>Vi xử lý mạnh ngang laptop</span><br>
Trái tim của iPad Pro 10.5 inch chính là bộ vi xử lý Apple A10X, một sức mạnh tương đương với các
máy tính để bàn đang nằm trên tay bạn. Chỉnh sửa video 4K, render các mô hình 3D, hay tạo các tài
liệu thuyết trình với độ phức tạp cao đều không là vấn đề với iPad Pro 10.5 inch.
Nói về các thông số, tốc độ xử lý tác vụ của chip A10X đã nhanh hơn đến 30%, tốc độ xử lý đồ họa
nhanh hơn đến 40% so với A9X mà vẫn giữ được thời lượng pin cực dài lên đến 10 giờ.
<br>
</p>
<img src="http://haloshop.vn/image/data/products/apple/ipad/ipad-pro-10-23.jpg"/><br>
<span>Apple Pencil - Vũ khí quyền năng của iPad Pro</span><br>
<p>
    Việc trang bị màn hình thế hệ mới làm cho độ nhạy của Apple Pencil cũng tăng đáng kể. Và chính
    xác những nhà thiết kế, hội họa, kiến trúc rất cần những ưu điểm ấy. Với iPad Pro 10.5 inch
    cộng với Apple Pencil, những tác phẩm ấn tượng sẽ được ra đời.
    <br>
    <img src="http://haloshop.vn/image/data/products/apple/ipad/ipad-pro-10-24.jpg"/><br>
    <span>Trải nghiệm tuyệt vời trong mỗi lần chạm</span><br>
    Hệ điều hành iOS 11 sắp ra mắt vào mùa thu hứa hẹn đem lại trải nghiệm người dùng trực quan
    nhất, tiên tiến nhất và an toàn nhất trên thế giới. Bên cạnh đó, nhờ vào việc sử dụng tối đa
    phần cứng mạnh mẽ từ iPad Pro 10.5 inch giúp bạn có thể sáng tạo mọi thứ mình muốn, vượt ra
    ngoài mọi khuôn khổ mà những thiết bị di động khác đang mắc phải.

</p>
<img src="http://haloshop.vn/image/data/products/apple/ipad/ipad-pro-10-25.jpg"/><br>

', N'/Data/images/ipad-pro-10-00-250x250.jpg', N'/Data/images/DetailPro/ipad-pro-10-00-700x700.jpg,/Data/images/DetailPro/ipad-pro-97-43-700x700.jpg,/Data/images/DetailPro/ipad-pro-97-44-700x700.jpg,/Data/images/DetailPro/ipad-pro-97-45-700x700.jpg,', CAST(18500000 AS Decimal(18, 0)), 7, 7, N'<div class="headerDetailDes">Kết nối dữ liệu</div>
<div class="itemDetailDes">
    <table>
        <tr>
            <td class="iitemDes" >GPS</td>
            <td class="citemDes" >Không</td>
        </tr>
        <tr>
            <td class="iitemDes" >Wi-Fi</td>
            <td class="citemDes" >Wi-Fi 802.11 a / b / g / n / ac, Băng tần kép</td>
        </tr>
        <tr>
            <td class="iitemDes" >Wi-Fi Hotspot</td>
            <td class="citemDes" >Có</td>
        </tr>
        <tr>
            <td class="iitemDes" >Bluetooth</td>
            <td class="citemDes" >v4.2, A2DP, EDR</td>
        </tr>
        <tr>
            <td class="iitemDes" >NFC</td>
            <td class="citemDes" >Có</td>
        </tr>
        <tr>
            <td class="iitemDes" >Cổng kết nối</td>
            <td class="citemDes" >jack 3.5mm, Lightning USB v2.0</td>
        </tr>
    </table>

</div>
<div class="headerDetailDes">Cấu hình chi tiết</div>
<div class="itemDetailDes">
    <table>
        <tr>
            <td class="iitemDes" >Bộ nhớ trong</td>
            <td class="citemDes" >256 GB</td>
        </tr>
        <tr>
            <td class="iitemDes" >Hệ điều hành</td>
            <td class="citemDes" >iOS 11</td>
        </tr>
        <tr>
            <td class="iitemDes" >Hỗ trợ thẻ nhớ</td>
            <td class="citemDes" >Không</td>
        </tr>
        <tr>
            <td class="iitemDes" >Chipset</td>
            <td class="citemDes" >Apple A10X</td>
        </tr>
        <tr>
            <td class="iitemDes" >Chi tiết CPU</td>
            <td class="citemDes" >Quad-core</td>
        </tr>
        <tr>
            <td class="iitemDes" >GPU</td>
            <td class="citemDes" >Chưa rõ</td>
        </tr>
        <tr>
            <td class="iitemDes" >Ram</td>
            <td class="citemDes" >Chưa rõ</td>
        </tr>
        <tr>
            <td class="iitemDes" >Cảm biến</td>
            <td class="citemDes" >Cảm biến gia tốc, Con quay hồi chuyển, La bàn, Cảm biến áp suất, Cảm biến vân tay Touch ID</td>
        </tr>
        <tr>
            <td class="iitemDes" >Trình duyệt web</td>
            <td class="citemDes" >HTML5 (Safari)</td>
        </tr>
        <tr>
            <td class="iitemDes" >Ngôn ngữ</td>
            <td class="citemDes" >Đa ngôn ngữ</td>
        </tr>
    </table>

</div>
<div class="headerDetailDes">Màn hình</div>
<div class="itemDetailDes">
    <table>
        <tr>
            <td class="iitemDes" >Kích thước màn hình</td>
            <td class="citemDes" >10.5"</td>
        </tr>
        <tr>
            <td class="iitemDes" >Loại màn hình</td>
            <td class="citemDes" >IPS LCD</td>
        </tr>
        <tr>
            <td class="iitemDes" >Màu màn hình</td>
            <td class="citemDes" >16 triệu</td>
        </tr>
        <tr>
            <td class="iitemDes" >Độ phân giải</td>
            <td class="citemDes" >1668 x 2224 pixels</td>
        </tr>
        <tr>
            <td class="iitemDes" >Mật độ điểm ảnh</td>
            <td class="citemDes" >265 ppi</td>
        </tr>
    </table>

</div>
<div class="headerDetailDes">Camera</div>
<div class="itemDetailDes">
    <table>
        <tr>
            <td class="iitemDes" >Camera chính</td>
            <td class="citemDes" >12 MP, f/1.8</td>
        </tr>
        <tr>
            <td class="iitemDes" >Camera phụ</td>
            <td class="citemDes" >7 MP, f/2.2</td>
        </tr>
        <tr>
            <td class="iitemDes" >Flash</td>
            <td class="citemDes" >Quad-LED True Tone flash</td>
        </tr>
        <tr>
            <td class="iitemDes" >Tính năng camera</td>
            <td class="citemDes" >Panorama, Geo-tagging, Chạm để lấy nét, Ghi đồng thời video
                4K và hình ảnh 8MP, Nhận diện khuôn mặt và nụ cười, HDR, Tự động lấy nét</td>
        </tr>
        <tr>
            <td class="iitemDes" >Quay phim</td>
            <td class="citemDes" >2160p@30fps, 1080p@30/60fps, 1080p@120fps, 720p@240fps</td>
        </tr>
        <tr>
            <td class="iitemDes" >Video Call</td>
            <td class="citemDes" >Có</td>
        </tr>
    </table>

</div>
<div class="headerDetailDes">Thông số vật lý</div>
<div class="itemDetailDes">
    <table>
        <tr>
            <td class="iitemDes" >Kích thước (Dài x Ngang x Dày)</td>
            <td class="citemDes" >250.6 x 174.1 x 6.1 mm</td>
        </tr>
        <tr>
            <td class="iitemDes" >Trọng lượng</td>
            <td class="citemDes" >477 g</td>
        </tr>
        <tr>
            <td class="iitemDes" >Nắp pin tháo rời</td>
            <td class="citemDes" >Không</td>
        </tr>
        <tr>
            <td class="iitemDes" >Chất liệu chính</td>
            <td class="citemDes" >Nhôm</td>
        </tr>
        <tr>
            <td class="iitemDes" >Dung lượng pin</td>
            <td class="citemDes" >30.4 Wh</td>
        </tr>
        <tr>
            <td class="iitemDes" >Thời gian chờ</td>
            <td class="citemDes" >Chưa rõ</td>
        </tr>
        <tr>
            <td class="iitemDes" >Thời gian thoại</td>
            <td class="citemDes" >10 tiếng</td>
        </tr>
    </table>
</div>



', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Images], [MoreImages], [Price], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot]) VALUES (53, N'iPad Pro 10.5" - Wi-Fi - 512GB', NULL, N'iPad-Pro-105--WiFi--512GB', NULL, N'/Data/images/ipad-pro-10-00-250x250.jpg', N'/Data/images/DetailPro/ipad-pro-10-00-700x700.jpg,/Data/images/DetailPro/ipad-pro-97-43-700x700.jpg,/Data/images/DetailPro/ipad-pro-97-44-700x700.jpg,/Data/images/DetailPro/ipad-pro-97-45-700x700.jpg,', CAST(20500000 AS Decimal(18, 0)), 8, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Images], [MoreImages], [Price], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot]) VALUES (54, N'iPad Pro 10.5" - Wi-Fi - 64GB', NULL, N'iPad-Pro-105--WiFi--64GB', NULL, N'/Data/images/ipad-pro-10-00-250x250.jpg', N'/Data/images/DetailPro/ipad-pro-10-00-700x700.jpg,/Data/images/DetailPro/ipad-pro-97-43-700x700.jpg,/Data/images/DetailPro/ipad-pro-97-44-700x700.jpg,/Data/images/DetailPro/ipad-pro-97-45-700x700.jpg,', CAST(16700000 AS Decimal(18, 0)), 3, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Images], [MoreImages], [Price], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot]) VALUES (55, N'iPad mini 4 - Wi-Fi - 16GB', NULL, N'iPad-mini-4--WiFi--16GB', NULL, N'/Data/images/ipad-mini-4-00-250x250.jpg', N'/Data/images/DetailPro/ipad-mini-4-00-700x700.jpg,/Data/images/DetailPro/ipad-mini-4-44-700x700.jpg,/Data/images/DetailPro/ipad-mini-4-45-700x700.jpg,/Data/images/DetailPro/ipad-mini-4-46-700x700.jpg,', CAST(8880000 AS Decimal(18, 0)), 3, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Images], [MoreImages], [Price], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot]) VALUES (56, N'iPad mini 4 - Wi-Fi - 64GB', NULL, N'iPad-mini-4--WiFi--64GB', NULL, N'/Data/images/ipad-mini-4-00-250x250.jpg', N'/Data/images/DetailPro/ipad-mini-4-00-700x700.jpg,/Data/images/DetailPro/ipad-mini-4-44-700x700.jpg,/Data/images/DetailPro/ipad-mini-4-45-700x700.jpg,/Data/images/DetailPro/ipad-mini-4-46-700x700.jpg,', CAST(11280000 AS Decimal(18, 0)), 3, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Images], [MoreImages], [Price], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot]) VALUES (57, N'iPad Pro 10.5" - Wi-Fi + Cellular - 512GB', NULL, N'iPad-Pro-105--WiFi--Cellular--512GB', NULL, N'/Data/images/ipad-pro-10-00-250x250.jpg', N'/Data/images/DetailPro/ipad-pro-10-00-700x700.jpg,/Data/images/DetailPro/ipad-pro-97-43-700x700.jpg,/Data/images/DetailPro/ipad-mini-4-00-700x700.jpg,/Data/images/DetailPro/ipad-pro-97-45-700x700.jpg,', CAST(24600000 AS Decimal(18, 0)), 8, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (6, N'iPhone', N'iPhone', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (7, N'iPad', N'iPad', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (8, N'Mac', N'Mac', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (9, N'Watch', N'Watch', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (10, N'Samsung', N'Samsung', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (11, N'OPPO', N'OPPO', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (12, N'LG', N'LG', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (13, N'Google', N'Google', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (14, N'Nokia', N'Nokia', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (15, N'Dell', N'Dell', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (16, N'Lenovo', N'Lenovo', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (17, N'Asus', N'Asus', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (18, N'MSI', N'MSI', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (19, N'Sony Playstation', N'Sony-Playstation', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (20, N'Nintendo', N'Nintendo', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (21, N'Bao da ốp lưng', N'Bao-da-op-lung', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (22, N'Chuột', N'Chuot', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (23, N'Tai nghe', N'Tai-nghe', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (24, N'Tin tức', N'Tin-tuc', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (25, N'Đồ chơi công nghệ', N'Do-choi-cong-nghe', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (26, N'Microsoft Xbox', N'Microsoft-Xbox', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
SET IDENTITY_INSERT [dbo].[Slide] ON 

INSERT [dbo].[Slide] ([ID], [Image], [DisplayOrder], [Link], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1, N'/Data/images/ps4-chinh-hang-tang-pes-1040x400.jpg', 0, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Slide] ([ID], [Image], [DisplayOrder], [Link], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2, N'/Data/images/ps-vr-giam-gia-tang-qua-1040x400.jpg', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Slide] ([ID], [Image], [DisplayOrder], [Link], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (3, N'/Data/images/macbook-cu-tang-1-tr-1040x400.jpg', 2, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Slide] ([ID], [Image], [DisplayOrder], [Link], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (4, N'/Data/images/s8-da-co-hang-1040x400.jpg', 3, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Slide] ([ID], [Image], [DisplayOrder], [Link], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (5, N'/Data/images/ipad-pro-10-da-co-hang-1040x400.jpg', 4, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Slide] ([ID], [Image], [DisplayOrder], [Link], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (6, N'/Data/images/macbook-pro-2017-da-co-hang-1040x400.jpg', 5, NULL, NULL, NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Slide] OFF
ALTER TABLE [dbo].[Account] ADD  DEFAULT ('client') FOR [LevelUser]
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Ads] ADD  DEFAULT ((1)) FOR [DisplayOrder]
GO
ALTER TABLE [dbo].[Ads] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Ads] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Bill] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Bill] ADD  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Bill] ADD  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Bill] ADD  DEFAULT ((0)) FOR [TotalPrice]
GO
ALTER TABLE [dbo].[Bill] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Category] ADD  DEFAULT ((0)) FOR [DisplayOrder]
GO
ALTER TABLE [dbo].[Category] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Category] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Category] ADD  DEFAULT ((0)) FOR [ShowOnHome]
GO
ALTER TABLE [dbo].[Content] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Content] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Feedback] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Feedback] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Footer] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Menu] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[OrderBy] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[OrderBy] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  DEFAULT ((0)) FOR [DisplayOrder]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  DEFAULT ((0)) FOR [ShowOnHome]
GO
ALTER TABLE [dbo].[Slide] ADD  DEFAULT ((1)) FOR [DisplayOrder]
GO
ALTER TABLE [dbo].[Slide] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Slide] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[SystemConfig] ADD  DEFAULT ((1)) FOR [Status]
GO
USE [master]
GO
ALTER DATABASE [OnlineShop] SET  READ_WRITE 
GO
