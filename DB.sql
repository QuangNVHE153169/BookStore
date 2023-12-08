USE [master]
GO
/****** Object:  Database [BookStore]    Script Date: 12/7/2023 9:11:42 PM ******/
CREATE DATABASE [BookStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MYDATA\MSSQL\DATA\BookStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BookStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MYDATA\MSSQL\DATA\BookStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BookStore] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BookStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookStore] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BookStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BookStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookStore] SET RECOVERY FULL 
GO
ALTER DATABASE [BookStore] SET  MULTI_USER 
GO
ALTER DATABASE [BookStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BookStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BookStore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BookStore', N'ON'
GO
ALTER DATABASE [BookStore] SET QUERY_STORE = OFF
GO
USE [BookStore]
GO
/****** Object:  Table [dbo].[Authors]    Script Date: 12/7/2023 9:11:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authors](
	[AuthorId] [int] IDENTITY(1,1) NOT NULL,
	[AuthorName] [nvarchar](max) NULL,
	[Status] [bit] NULL,
	[DOB] [date] NULL,
	[DeleteFlag] [bit] NULL,
 CONSTRAINT [PK_Authors] PRIMARY KEY CLUSTERED 
(
	[AuthorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookImages]    Script Date: 12/7/2023 9:11:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookImages](
	[ImageId] [int] IDENTITY(1,1) NOT NULL,
	[BookId] [int] NOT NULL,
	[Url] [text] NULL,
	[DeleteFlag] [bit] NULL,
 CONSTRAINT [PK_BookImages] PRIMARY KEY CLUSTERED 
(
	[ImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 12/7/2023 9:11:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[BookId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NULL,
	[Price] [float] NULL,
	[PageCount] [int] NULL,
	[Status] [bit] NULL,
	[Quantity] [int] NULL,
	[CategoryId] [int] NULL,
	[AuthorId] [int] NULL,
	[PublisherId] [int] NULL,
	[PublicationYear] [int] NULL,
	[Description] [ntext] NULL,
	[DeleteFlag] [bit] NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 12/7/2023 9:11:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] NOT NULL,
	[CategoryName] [nvarchar](255) NOT NULL,
	[Status] [bit] NULL,
	[DeleteFlag] [bit] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 12/7/2023 9:11:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[BookId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[TotalPrice] [money] NULL,
	[Rate] [float] NULL,
	[Comment] [nvarchar](max) NULL,
	[IsRated] [bit] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 12/7/2023 9:11:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NULL,
	[Customer_Name] [nvarchar](255) NULL,
	[Customer_Email] [varchar](255) NULL,
	[Customer_Phone] [varchar](20) NULL,
	[Customer_Address] [nvarchar](255) NULL,
	[OrderDate] [datetime] NOT NULL,
	[PaymentMethod] [int] NOT NULL,
	[OrderStatus] [int] NULL,
	[TotalOrder] [money] NULL,
	[Status] [tinyint] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentMethods]    Script Date: 12/7/2023 9:11:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentMethods](
	[PaymentId] [int] IDENTITY(1,1) NOT NULL,
	[PaymentMethod] [nvarchar](max) NULL,
	[Status] [bit] NULL,
	[DeleteFlag] [bit] NULL,
 CONSTRAINT [PK_Payments] PRIMARY KEY CLUSTERED 
(
	[PaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publishers]    Script Date: 12/7/2023 9:11:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publishers](
	[PublisherId] [int] IDENTITY(1,1) NOT NULL,
	[PublisherName] [nvarchar](max) NULL,
	[Country] [nchar](10) NULL,
	[FoundedYear] [int] NULL,
	[DeleteFlag] [bit] NULL,
 CONSTRAINT [PK_Publishers] PRIMARY KEY CLUSTERED 
(
	[PublisherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RateBooks]    Script Date: 12/7/2023 9:11:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RateBooks](
	[RateID] [int] IDENTITY(1,1) NOT NULL,
	[Rate] [float] NULL,
	[Comment] [nvarchar](max) NULL,
	[CustomerId] [int] NULL,
	[BookId] [int] NULL,
	[Date] [date] NULL,
	[DeleteFlag] [bit] NULL,
 CONSTRAINT [PK_Rate_Books] PRIMARY KEY CLUSTERED 
(
	[RateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 12/7/2023 9:11:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] NOT NULL,
	[RoleName] [nvarchar](255) NOT NULL,
	[Status] [bit] NULL,
	[DeleteFlag] [bit] NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/7/2023 9:11:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](255) NOT NULL,
	[Email] [varchar](255) NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[Phone] [varchar](10) NULL,
	[DOB] [date] NULL,
	[Address] [nvarchar](max) NULL,
	[Avatar] [text] NULL,
	[Gender] [tinyint] NULL,
	[RoleId] [int] NULL,
	[Status] [bit] NULL,
	[Description] [nvarchar](max) NULL,
	[DeleteFlag] [bit] NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Authors] ON 

INSERT [dbo].[Authors] ([AuthorId], [AuthorName], [Status], [DOB], [DeleteFlag]) VALUES (1, N'Jonh Kenedy', 1, CAST(N'1999-02-02' AS Date), 0)
INSERT [dbo].[Authors] ([AuthorId], [AuthorName], [Status], [DOB], [DeleteFlag]) VALUES (2, N'J. K. Rowling', 1, CAST(N'1965-03-31' AS Date), 0)
SET IDENTITY_INSERT [dbo].[Authors] OFF
GO
SET IDENTITY_INSERT [dbo].[BookImages] ON 

INSERT [dbo].[BookImages] ([ImageId], [BookId], [Url], [DeleteFlag]) VALUES (1, 1, N'https://www.dragonsteelbooks.com/cdn/shop/files/YUMI_BACKBOOK.jpg?v=1689008718', 0)
SET IDENTITY_INSERT [dbo].[BookImages] OFF
GO
SET IDENTITY_INSERT [dbo].[Books] ON 

INSERT [dbo].[Books] ([BookId], [Title], [Price], [PageCount], [Status], [Quantity], [CategoryId], [AuthorId], [PublisherId], [PublicationYear], [Description], [DeleteFlag]) VALUES (1, N'Harry Potter and the Sorcerer’s Stone', 123, 128, 1, 18, 5, 2, 1, 2003, N'asdfsdfsdf', 0)
INSERT [dbo].[Books] ([BookId], [Title], [Price], [PageCount], [Status], [Quantity], [CategoryId], [AuthorId], [PublisherId], [PublicationYear], [Description], [DeleteFlag]) VALUES (2, N'Harry Potter and the Chamber of Secrets ', 23, 242, 1, 12, 5, 2, 1, 2003, N'Okeeeeeeee', 0)
INSERT [dbo].[Books] ([BookId], [Title], [Price], [PageCount], [Status], [Quantity], [CategoryId], [AuthorId], [PublisherId], [PublicationYear], [Description], [DeleteFlag]) VALUES (3, N'Harry Potter and the Prisoner of Azkaban', 344, 123, 1, 23, 5, 2, 1, 2003, N'Okeeeeeeee', 0)
INSERT [dbo].[Books] ([BookId], [Title], [Price], [PageCount], [Status], [Quantity], [CategoryId], [AuthorId], [PublisherId], [PublicationYear], [Description], [DeleteFlag]) VALUES (4, N'Harry Potter and the Order of the Phoenix', 42, 244, 1, 27, 2, 2, 1, 2023, N'Okeeeeeeee', 0)
SET IDENTITY_INSERT [dbo].[Books] OFF
GO
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Status], [DeleteFlag]) VALUES (1, N'Mystery', 1, 0)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Status], [DeleteFlag]) VALUES (2, N'Romance', 1, 0)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Status], [DeleteFlag]) VALUES (3, N'
Fiction', 1, 0)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Status], [DeleteFlag]) VALUES (4, N'Horror', 1, 0)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Status], [DeleteFlag]) VALUES (5, N'
Fantasy', 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Publishers] ON 

INSERT [dbo].[Publishers] ([PublisherId], [PublisherName], [Country], [FoundedYear], [DeleteFlag]) VALUES (1, N'Nhà xuất bản thế giới', N'Việt Nam  ', 1998, 0)
SET IDENTITY_INSERT [dbo].[Publishers] OFF
GO
INSERT [dbo].[Roles] ([RoleId], [RoleName], [Status], [DeleteFlag]) VALUES (1, N'Admin', 1, 0)
INSERT [dbo].[Roles] ([RoleId], [RoleName], [Status], [DeleteFlag]) VALUES (2, N'Customer', 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [DOB], [Address], [Avatar], [Gender], [RoleId], [Status], [Description], [DeleteFlag]) VALUES (3, N'Đức Hải', N'haidt@gmail.com', N'210b48b542659fb951a80a15c5997513', N'0767867555', CAST(N'2023-08-17' AS Date), N'Hà nội', NULL, 0, 2, 1, NULL, 0)
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [DOB], [Address], [Avatar], [Gender], [RoleId], [Status], [Description], [DeleteFlag]) VALUES (6, N'Admin', N'admin@gmail.com', N'210b48b542659fb951a80a15c5997513', N'0987654321', CAST(N'2023-08-30' AS Date), N'Hà nội', NULL, 1, 1, 1, NULL, 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[BookImages]  WITH CHECK ADD  CONSTRAINT [FK_BookImages_Books] FOREIGN KEY([BookId])
REFERENCES [dbo].[Books] ([BookId])
GO
ALTER TABLE [dbo].[BookImages] CHECK CONSTRAINT [FK_BookImages_Books]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Authors] FOREIGN KEY([AuthorId])
REFERENCES [dbo].[Authors] ([AuthorId])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Authors]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Categories]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Publishers] FOREIGN KEY([PublisherId])
REFERENCES [dbo].[Publishers] ([PublisherId])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Publishers]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Books] FOREIGN KEY([BookId])
REFERENCES [dbo].[Books] ([BookId])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Books]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Payments] FOREIGN KEY([PaymentMethod])
REFERENCES [dbo].[PaymentMethods] ([PaymentId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Payments]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users]
GO
ALTER TABLE [dbo].[RateBooks]  WITH CHECK ADD  CONSTRAINT [FK_RateBooks_Books] FOREIGN KEY([BookId])
REFERENCES [dbo].[Books] ([BookId])
GO
ALTER TABLE [dbo].[RateBooks] CHECK CONSTRAINT [FK_RateBooks_Books]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
USE [master]
GO
ALTER DATABASE [BookStore] SET  READ_WRITE 
GO
