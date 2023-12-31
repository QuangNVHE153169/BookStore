USE [master]
GO
/****** Object:  Database [BookStore]    Script Date: 12/9/2023 11:24:26 PM ******/
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
/****** Object:  Table [dbo].[Authors]    Script Date: 12/9/2023 11:24:27 PM ******/
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
/****** Object:  Table [dbo].[BookImages]    Script Date: 12/9/2023 11:24:27 PM ******/
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
/****** Object:  Table [dbo].[Books]    Script Date: 12/9/2023 11:24:27 PM ******/
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
/****** Object:  Table [dbo].[Categories]    Script Date: 12/9/2023 11:24:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](255) NOT NULL,
	[Status] [bit] NULL,
	[DeleteFlag] [bit] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 12/9/2023 11:24:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[BookId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[IsRated] [bit] Null,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 12/9/2023 11:24:27 PM ******/
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
	[OrderStatus] [tinyint] NOT NULL,
	[PaymentMethodId] [int] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentMethods]    Script Date: 12/9/2023 11:24:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentMethods](
	[PaymentMethodId] [int] IDENTITY(1,1) NOT NULL,
	[PaymentMethodName] [nvarchar](max) NOT NULL,
	[Status] [bit] NULL,
	[DeleteFlag] [bit] NULL,
 CONSTRAINT [PK_Payments] PRIMARY KEY CLUSTERED 
(
	[PaymentMethodId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publishers]    Script Date: 12/9/2023 11:24:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publishers](
	[PublisherId] [int] IDENTITY(1,1) NOT NULL,
	[PublisherName] [nvarchar](max) NULL,
	[Country] [nchar](10) NULL,
	[FoundedYear] [int] NULL,
	[Status] [bit] NULL,
	[DeleteFlag] [bit] NULL,
 CONSTRAINT [PK_Publishers] PRIMARY KEY CLUSTERED 
(
	[PublisherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RateBooks]    Script Date: 12/9/2023 11:24:27 PM ******/
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
	[Status] [bit] Null,
	[DeleteFlag] [bit] NULL,
 CONSTRAINT [PK_Rate_Books] PRIMARY KEY CLUSTERED 
(
	[RateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 12/9/2023 11:24:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](255) NOT NULL,
	[Status] [int] NULL,
	[DeleteFlag] [bit] NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/9/2023 11:24:27 PM ******/
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
	[gender] [tinyint] NULL,
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

INSERT [dbo].[Authors] ([AuthorId], [AuthorName], [Status], [DOB], [DeleteFlag]) VALUES (1, N'James Joyce', 1, CAST(N'1882-02-02' AS Date), 0)
INSERT [dbo].[Authors] ([AuthorId], [AuthorName], [Status], [DOB], [DeleteFlag]) VALUES (2, N'J. K. Rowling', 1, CAST(N'1965-07-31' AS Date), 0)
INSERT [dbo].[Authors] ([AuthorId], [AuthorName], [Status], [DOB], [DeleteFlag]) VALUES (3, N'Fyodor Dostoevsky', 1, CAST(N'1821-11-11' AS Date), 0)
INSERT [dbo].[Authors] ([AuthorId], [AuthorName], [Status], [DOB], [DeleteFlag]) VALUES (4, N'Lev Tolstoy', 1, CAST(N'1828-09-09' AS Date), 0)
INSERT [dbo].[Authors] ([AuthorId], [AuthorName], [Status], [DOB], [DeleteFlag]) VALUES (5, N'Victor Hugo', 1, CAST(N'1802-02-26' AS Date), 0)
INSERT [dbo].[Authors] ([AuthorId], [AuthorName], [Status], [DOB], [DeleteFlag]) VALUES (6, N'Louis-Ferdinand Céline', 1, CAST(N'1894-05-27' AS Date), 0)
INSERT [dbo].[Authors] ([AuthorId], [AuthorName], [Status], [DOB], [DeleteFlag]) VALUES (7, N'Áo Test', 1, CAST(N'2023-12-12' AS Date), 0)
SET IDENTITY_INSERT [dbo].[Authors] OFF
GO
SET IDENTITY_INSERT [dbo].[BookImages] ON 

INSERT [dbo].[BookImages] ([ImageId], [BookId], [Url], [DeleteFlag]) VALUES (1, 1, N'https://m.media-amazon.com/images/I/81Fyh2mrw4L._AC_UF1000,1000_QL80_.jpg', 0)
INSERT [dbo].[BookImages] ([ImageId], [BookId], [Url], [DeleteFlag]) VALUES (2, 2, N'https://prodimage.images-bn.com/lf?set=key%5Bresolve.pixelRatio%5D,value%5B1%5D&set=key%5Bresolve.width%5D,value%5B300%5D&set=key%5Bresolve.height%5D,value%5B10000%5D&set=key%5Bresolve.imageFit%5D,value%5Bcontainerwidth%5D&set=key%5Bresolve.allowImageUpscaling%5D,value%5B0%5D&set=key%5Bresolve.format%5D,value%5Bwebp%5D&source=url%5Bhttps://prodimage.images-bn.com/pimages/9780439064873_p0_v1_s600x595.jpg%5D&scale=options%5Blimit%5D,size%5B300x10000%5D&sink=format%5Bwebp%5D', 0)
INSERT [dbo].[BookImages] ([ImageId], [BookId], [Url], [DeleteFlag]) VALUES (3, 3, N'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1630547330i/5.jpg', 0)
INSERT [dbo].[BookImages] ([ImageId], [BookId], [Url], [DeleteFlag]) VALUES (4, 4, N'https://m.media-amazon.com/images/I/51iQwWIl+XL.jpg', 0)
INSERT [dbo].[BookImages] ([ImageId], [BookId], [Url], [DeleteFlag]) VALUES (5, 5, N'https://m.media-amazon.com/images/M/MV5BMTA1NDQ3NTcyOTNeQTJeQWpwZ15BbWU3MDA0MzA4MzE@._V1_.jpg', 0)
INSERT [dbo].[BookImages] ([ImageId], [BookId], [Url], [DeleteFlag]) VALUES (6, 6, N'https://m.media-amazon.com/images/M/MV5BNmVmYzcwNzMtMWM1NS00MWIyLThlMDEtYzUwZDgzODE1NmE2XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_FMjpg_UX1000_.jpg', 0)
INSERT [dbo].[BookImages] ([ImageId], [BookId], [Url], [DeleteFlag]) VALUES (7, 7, N'https://m.media-amazon.com/images/I/914h7ms4FXL._AC_UF1000,1000_QL80_.jpg', 0)
INSERT [dbo].[BookImages] ([ImageId], [BookId], [Url], [DeleteFlag]) VALUES (8, 8, N'https://m.media-amazon.com/images/I/91LUbAcpACL._AC_UF1000,1000_QL80_.jpg', 1)
INSERT [dbo].[BookImages] ([ImageId], [BookId], [Url], [DeleteFlag]) VALUES (26, 8, N'images/884fe658-1a30-420f-86f1-1d3c18c40006.png', 0)
SET IDENTITY_INSERT [dbo].[BookImages] OFF
GO
SET IDENTITY_INSERT [dbo].[Books] ON 

INSERT [dbo].[Books] ([BookId], [Title], [Price], [PageCount], [Status], [Quantity], [CategoryId], [AuthorId], [PublisherId], [PublicationYear], [Description], [DeleteFlag]) VALUES (1, N'Harry Potter and the Sorcerer’s Stone', 123, 128, 1, 18, 5, 2, 1, 2003, N'asdfsdfsdf', 0)
INSERT [dbo].[Books] ([BookId], [Title], [Price], [PageCount], [Status], [Quantity], [CategoryId], [AuthorId], [PublisherId], [PublicationYear], [Description], [DeleteFlag]) VALUES (2, N'Harry Potter and the Chamber of Secrets ', 23, 242, 1, 12, 5, 2, 1, 2003, N'Okeeeeeeee', 0)
INSERT [dbo].[Books] ([BookId], [Title], [Price], [PageCount], [Status], [Quantity], [CategoryId], [AuthorId], [PublisherId], [PublicationYear], [Description], [DeleteFlag]) VALUES (3, N'Harry Potter and the Prisoner of Azkaban', 344, 123, 1, 23, 5, 2, 1, 2003, N'Okeeeeeeee', 0)
INSERT [dbo].[Books] ([BookId], [Title], [Price], [PageCount], [Status], [Quantity], [CategoryId], [AuthorId], [PublisherId], [PublicationYear], [Description], [DeleteFlag]) VALUES (4, N'Harry Potter and the Order of the Phoenix', 42, 244, 1, 27, 2, 2, 1, 2023, N'Okeeeeeeee', 0)
INSERT [dbo].[Books] ([BookId], [Title], [Price], [PageCount], [Status], [Quantity], [CategoryId], [AuthorId], [PublisherId], [PublicationYear], [Description], [DeleteFlag]) VALUES (5, N'Pride and Prejudice', 23, 124, 1, 23, 2, 1, 4, 2001, N'In the quaint town of Echo Lake, a mysterious murder shakes the community to its core. Detective Sarah Mitchell, a sharp-witted investigator with a penchant for solving puzzles, is called to unravel the enigma. As she delves into the lives of the townsfolk, she uncovers long-buried secrets, deceit, and a trail of clues that lead to a shocking revelation. "The Enigma of Echo Lake" is a gripping mystery that keeps you on the edge of your seat until the very last page.', 0)
INSERT [dbo].[Books] ([BookId], [Title], [Price], [PageCount], [Status], [Quantity], [CategoryId], [AuthorId], [PublisherId], [PublicationYear], [Description], [DeleteFlag]) VALUES (6, N'To Kill a Mockingbird', 35, 234, 1, 28, 4, 6, 5, 1999, N'This novel promises an immersive experience, blending classic whodunit elements with a modern narrative. Readers will be captivated by the clever twists and turns, and the satisfying resolution that ties the story together.', 0)
INSERT [dbo].[Books] ([BookId], [Title], [Price], [PageCount], [Status], [Quantity], [CategoryId], [AuthorId], [PublisherId], [PublicationYear], [Description], [DeleteFlag]) VALUES (7, N'The Book Thief', 24, 197, 1, 23, 3, 2, 4, 2006, N'Detective Sarah Mitchell, a sharp-witted investigator with a penchant for solving puzzles, is called to unravel the enigma. As she delves into the lives of the townsfolk, she uncovers long-buried secrets, deceit, and a trail of clues that lead to a shocking revelation. "The Enigma of Echo Lake" is a gripping mystery that keeps you on the edge of your seat until the very last page.', 0)
INSERT [dbo].[Books] ([BookId], [Title], [Price], [PageCount], [Status], [Quantity], [CategoryId], [AuthorId], [PublisherId], [PublicationYear], [Description], [DeleteFlag]) VALUES (8, N'Animal Farm', 29, 242, 1, 24, 1, 1, 4, 2023, N'Eleanor M. Harper, known for her ability to blend historical accuracy with poignant storytelling, is a celebrated author of historical fiction. Her previous works have been praised for their depth of emotion and meticulous research.', 0)
SET IDENTITY_INSERT [dbo].[Books] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Status], [DeleteFlag]) VALUES (1, N'Mystery', 1, 0)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Status], [DeleteFlag]) VALUES (2, N'Romance', 1, 0)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Status], [DeleteFlag]) VALUES (3, N'Fiction', 1, 0)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Status], [DeleteFlag]) VALUES (4, N'Horror', 1, 0)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Status], [DeleteFlag]) VALUES (5, N'Fantasy', 1, 0)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Publishers] ON 

INSERT [dbo].[Publishers] ([PublisherId], [PublisherName], [Country], [FoundedYear], [Status], [DeleteFlag]) VALUES (1, N'Nhà xuất bản thế giới', N'Việt Nam  ', 1998, 1, 0)
INSERT [dbo].[Publishers] ([PublisherId], [PublisherName], [Country], [FoundedYear], [Status], [DeleteFlag]) VALUES (4, N'Oxford University Press', N'UK        ', 1478, 1, 0)
INSERT [dbo].[Publishers] ([PublisherId], [PublisherName], [Country], [FoundedYear], [Status], [DeleteFlag]) VALUES (5, N'HarperCollins', N'US        ', 1817, 1, 0)
SET IDENTITY_INSERT [dbo].[Publishers] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleId], [RoleName], [Status], [DeleteFlag]) VALUES (1, N'Admin', 1, 0)
INSERT [dbo].[Roles] ([RoleId], [RoleName], [Status], [DeleteFlag]) VALUES (2, N'Customer', 1, 0)
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleId], [Status], [Description], [DeleteFlag]) VALUES (3, N'Đức Hải', N'haidt@gmail.com', N'210b48b542659fb951a80a15c5997513', N'0767867555', CAST(N'2023-08-17' AS Date), N'Hà nội', NULL, 0, 2, 1, NULL, 0)
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleId], [Status], [Description], [DeleteFlag]) VALUES (6, N'Admin', N'admin@gmail.com', N'210b48b542659fb951a80a15c5997513', N'0987654321', CAST(N'2023-08-30' AS Date), N'Hà nội', NULL, 1, 1, 1, NULL, 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[PaymentMethods] ADD  CONSTRAINT [DF_PaymentMethods_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[PaymentMethods] ADD  CONSTRAINT [DF_PaymentMethods_DeleteFlag]  DEFAULT ((0)) FOR [DeleteFlag]
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
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Payments] FOREIGN KEY([PaymentMethodId])
REFERENCES [dbo].[PaymentMethods] ([PaymentMethodId])
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
ALTER TABLE [dbo].[RateBooks]  WITH CHECK ADD  CONSTRAINT [FK_RateBooks_Users1] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[RateBooks] CHECK CONSTRAINT [FK_RateBooks_Users1]
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
