USE [BookStore]
GO
SET IDENTITY_INSERT [dbo].[Authors] ON 

INSERT [dbo].[Authors] ([AuthorId], [AuthorName], [Status], [DOB], [DeleteFlag]) VALUES (1, N'James Joyce', 1, CAST(N'1882-02-02' AS Date), 0)
INSERT [dbo].[Authors] ([AuthorId], [AuthorName], [Status], [DOB], [DeleteFlag]) VALUES (2, N'J. K. Rowling', 1, CAST(N'1965-07-31' AS Date), 0)
INSERT [dbo].[Authors] ([AuthorId], [AuthorName], [Status], [DOB], [DeleteFlag]) VALUES (3, N'Fyodor Dostoevsky', 1, CAST(N'1821-11-11' AS Date), 0)
INSERT [dbo].[Authors] ([AuthorId], [AuthorName], [Status], [DOB], [DeleteFlag]) VALUES (4, N'Lev Tolstoy', 1, CAST(N'1828-09-09' AS Date), 0)
INSERT [dbo].[Authors] ([AuthorId], [AuthorName], [Status], [DOB], [DeleteFlag]) VALUES (5, N'Victor Hugo', 1, CAST(N'1802-02-26' AS Date), 0)
INSERT [dbo].[Authors] ([AuthorId], [AuthorName], [Status], [DOB], [DeleteFlag]) VALUES (6, N'Louis-Ferdinand Céline', 1, CAST(N'1894-05-27' AS Date), 0)
INSERT [dbo].[Authors] ([AuthorId], [AuthorName], [Status], [DOB], [DeleteFlag]) VALUES (7, N'Áo Test', 1, CAST(N'2023-12-12' AS Date), 0)
INSERT [dbo].[Authors] ([AuthorId], [AuthorName], [Status], [DOB], [DeleteFlag]) VALUES (8, N'okeok', 1, CAST(N'2023-12-13' AS Date), 0)
SET IDENTITY_INSERT [dbo].[Authors] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Status], [DeleteFlag]) VALUES (1, N'Mystery', 1, 0)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Status], [DeleteFlag]) VALUES (2, N'Romance', 1, 0)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Status], [DeleteFlag]) VALUES (3, N'Fiction', 1, 0)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Status], [DeleteFlag]) VALUES (4, N'Horror', 1, 0)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Status], [DeleteFlag]) VALUES (5, N'Fantasy', 1, 0)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Status], [DeleteFlag]) VALUES (6, N'123123', 1, 0)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Status], [DeleteFlag]) VALUES (7, N'Learning', 1, 0)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Publishers] ON 

INSERT [dbo].[Publishers] ([PublisherId], [PublisherName], [Country], [FoundedYear], [Status], [DeleteFlag]) VALUES (1, N'Nhà xuất bản thế giới', N'Việt Nam  ', 1998, 1, 0)
INSERT [dbo].[Publishers] ([PublisherId], [PublisherName], [Country], [FoundedYear], [Status], [DeleteFlag]) VALUES (2, N'QuangNV1', N'Vietnam   ', 2023, 1, 0)
INSERT [dbo].[Publishers] ([PublisherId], [PublisherName], [Country], [FoundedYear], [Status], [DeleteFlag]) VALUES (4, N'Oxford University Press', N'UK        ', 1478, 1, 0)
INSERT [dbo].[Publishers] ([PublisherId], [PublisherName], [Country], [FoundedYear], [Status], [DeleteFlag]) VALUES (5, N'HarperColli', N'US        ', 1817, 0, 0)
INSERT [dbo].[Publishers] ([PublisherId], [PublisherName], [Country], [FoundedYear], [Status], [DeleteFlag]) VALUES (6, N'ok', N'ok        ', 2222, 1, 0)
INSERT [dbo].[Publishers] ([PublisherId], [PublisherName], [Country], [FoundedYear], [Status], [DeleteFlag]) VALUES (7, N'okkkk', N'okkkk     ', 2222, 1, 0)
INSERT [dbo].[Publishers] ([PublisherId], [PublisherName], [Country], [FoundedYear], [Status], [DeleteFlag]) VALUES (8, N'okkkk', N'okkkk     ', 2222, 1, 0)
INSERT [dbo].[Publishers] ([PublisherId], [PublisherName], [Country], [FoundedYear], [Status], [DeleteFlag]) VALUES (9, N'okkkk', N'okkkk     ', 2222, 1, 0)
INSERT [dbo].[Publishers] ([PublisherId], [PublisherName], [Country], [FoundedYear], [Status], [DeleteFlag]) VALUES (10, N'okkkk', N'okkkk     ', 2222, 1, 0)
INSERT [dbo].[Publishers] ([PublisherId], [PublisherName], [Country], [FoundedYear], [Status], [DeleteFlag]) VALUES (11, N'oke', N'oke       ', 123123, 1, 0)
SET IDENTITY_INSERT [dbo].[Publishers] OFF
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
SET IDENTITY_INSERT [dbo].[BookImages] ON 

INSERT [dbo].[BookImages] ([ImageId], [BookId], [Url], [DeleteFlag]) VALUES (1, 1, N'https://m.media-amazon.com/images/I/81Fyh2mrw4L._AC_UF1000,1000_QL80_.jpg', 0)
INSERT [dbo].[BookImages] ([ImageId], [BookId], [Url], [DeleteFlag]) VALUES (2, 2, N'https://prodimage.images-bn.com/lf?set=key%5Bresolve.pixelRatio%5D,value%5B1%5D&set=key%5Bresolve.width%5D,value%5B300%5D&set=key%5Bresolve.height%5D,value%5B10000%5D&set=key%5Bresolve.imageFit%5D,value%5Bcontainerwidth%5D&set=key%5Bresolve.allowImageUpscaling%5D,value%5B0%5D&set=key%5Bresolve.format%5D,value%5Bwebp%5D&source=url%5Bhttps://prodimage.images-bn.com/pimages/9780439064873_p0_v1_s600x595.jpg%5D&scale=options%5Blimit%5D,size%5B300x10000%5D&sink=format%5Bwebp%5D', 0)
INSERT [dbo].[BookImages] ([ImageId], [BookId], [Url], [DeleteFlag]) VALUES (3, 3, N'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1630547330i/5.jpg', 0)
INSERT [dbo].[BookImages] ([ImageId], [BookId], [Url], [DeleteFlag]) VALUES (4, 4, N'https://m.media-amazon.com/images/I/51iQwWIl+XL.jpg', 0)
INSERT [dbo].[BookImages] ([ImageId], [BookId], [Url], [DeleteFlag]) VALUES (5, 5, N'https://m.media-amazon.com/images/M/MV5BMTA1NDQ3NTcyOTNeQTJeQWpwZ15BbWU3MDA0MzA4MzE@._V1_.jpg', 0)
INSERT [dbo].[BookImages] ([ImageId], [BookId], [Url], [DeleteFlag]) VALUES (6, 6, N'https://m.media-amazon.com/images/M/MV5BNmVmYzcwNzMtMWM1NS00MWIyLThlMDEtYzUwZDgzODE1NmE2XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_FMjpg_UX1000_.jpg', 0)
INSERT [dbo].[BookImages] ([ImageId], [BookId], [Url], [DeleteFlag]) VALUES (7, 7, N'https://m.media-amazon.com/images/I/914h7ms4FXL._AC_UF1000,1000_QL80_.jpg', 0)
INSERT [dbo].[BookImages] ([ImageId], [BookId], [Url], [DeleteFlag]) VALUES (8, 8, N'https://m.media-amazon.com/images/I/91LUbAcpACL._AC_UF1000,1000_QL80_.jpg', 1)
INSERT [dbo].[BookImages] ([ImageId], [BookId], [Url], [DeleteFlag]) VALUES (26, 8, N'images/Log-in.png', 0)
SET IDENTITY_INSERT [dbo].[BookImages] OFF
GO
SET IDENTITY_INSERT [dbo].[PaymentMethods] ON 

INSERT [dbo].[PaymentMethods] ([PaymentMethodId], [PaymentMethodName], [Status], [DeleteFlag]) VALUES (1, N'Cash After Delivery', 1, 0)
SET IDENTITY_INSERT [dbo].[PaymentMethods] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleId], [RoleName], [Status], [DeleteFlag]) VALUES (1, N'Admin', 1, 0)
INSERT [dbo].[Roles] ([RoleId], [RoleName], [Status], [DeleteFlag]) VALUES (2, N'Customer', 1, 0)
INSERT [dbo].[Roles] ([RoleId], [RoleName], [Status], [DeleteFlag]) VALUES (3, N'Admin Sale', 1, 0)
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleId], [Status], [Description], [DeleteFlag]) VALUES (3, N'Đức Hải', N'haidt@gmail.com', N'210b48b542659fb951a80a15c5997513', N'0767867555', CAST(N'2023-08-17' AS Date), N'Hà nội', N'https://static-00.iconduck.com/assets.00/avatar-default-symbolic-icon-479x512-n8sg74wg.png', 0, 2, 1, NULL, 0)
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleId], [Status], [Description], [DeleteFlag]) VALUES (4, N'onething', N'lemiruss1@gmail.com', N'787bf9d15ab61107a51c6c6e13c44298', N'0337498466', CAST(N'2023-12-06' AS Date), N'asfd', NULL, 1, 1, 1, NULL, 0)
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleId], [Status], [Description], [DeleteFlag]) VALUES (6, N'Admin', N'admin@gmail.com', N'210b48b542659fb951a80a15c5997513', N'0987654321', CAST(N'2023-08-30' AS Date), N'Hà nội', N'https://static-00.iconduck.com/assets.00/avatar-default-symbolic-icon-479x512-n8sg74wg.png', 1, 1, 1, NULL, 0)
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleId], [Status], [Description], [DeleteFlag]) VALUES (9, N'Admin Sal', N'adminsale@gmail.com', N'210b48b542659fb951a80a15c5997513', N'Admin Sal', CAST(N'2002-02-09' AS Date), N'Admin Sal', N'https://static-00.iconduck.com/assets.00/avatar-default-symbolic-icon-479x512-n8sg74wg.png', 0, 3, 0, NULL, 0)
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleId], [Status], [Description], [DeleteFlag]) VALUES (10, N'test', N'ndminh10@gmail.com', N'210b48b542659fb951a80a15c5997513', N'0987654321', CAST(N'2023-12-14' AS Date), N'Hà nội', N'https://static-00.iconduck.com/assets.00/avatar-default-symbolic-icon-479x512-n8sg74wg.png', 1, 3, 1, N'ok', 0)
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleId], [Status], [Description], [DeleteFlag]) VALUES (11, N'Áo Test', N'pronameminh1@gmail.com', N'210b48b542659fb951a80a15c5997513', N'4325234523', CAST(N'2023-12-06' AS Date), N'Hà nội', N'https://static-00.iconduck.com/assets.00/avatar-default-symbolic-icon-479x512-n8sg74wg.png', 1, 3, 1, N'', 0)
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleId], [Status], [Description], [DeleteFlag]) VALUES (12, N'Gấu trúc ống', N'ndminh10210@gmail.com', N'210b48b542659fb951a80a15c5997513', N'1231233444', CAST(N'2023-12-06' AS Date), N'Hà nội', N'https://static-00.iconduck.com/assets.00/avatar-default-symbolic-icon-479x512-n8sg74wg.png', 1, 3, 1, N'', 0)
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleId], [Status], [Description], [DeleteFlag]) VALUES (13, N'test', N'ndminh1010@gmail.com', N'210b48b542659fb951a80a15c5997513', N'1231233333', CAST(N'2023-12-02' AS Date), N'Hà nội', N'https://static-00.iconduck.com/assets.00/avatar-default-symbolic-icon-479x512-n8sg74wg.png', 1, 3, 1, N'', 0)
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleId], [Status], [Description], [DeleteFlag]) VALUES (14, N'123123', N'satff2@gmail.com', N'210b48b542659fb951a80a15c5997513', N'1231233333', CAST(N'2023-12-04' AS Date), N'Hà nội', N'https://static-00.iconduck.com/assets.00/avatar-default-symbolic-icon-479x512-n8sg74wg.png', 1, 3, 1, N'hdfh', 0)
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleId], [Status], [Description], [DeleteFlag]) VALUES (15, N'1234123', N'bu', N'210b48b542659fb951a80a15c5997513', N'0', CAST(N'2023-12-21' AS Date), N'1234', N'https://static-00.iconduck.com/assets.00/avatar-default-symbolic-icon-479x512-n8sg74wg.png', 1, 3, 1, N'124', 0)
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleId], [Status], [Description], [DeleteFlag]) VALUES (16, N'okela', N'staff3@gmail.com', N'210b48b542659fb951a80a15c5997513', N'1231233333', CAST(N'2023-12-04' AS Date), N'Hà nội', N'https://static-00.iconduck.com/assets.00/avatar-default-symbolic-icon-479x512-n8sg74wg.png', 1, 3, 1, NULL, 0)
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleId], [Status], [Description], [DeleteFlag]) VALUES (17, N'ok', N'nonnno@gmail.com', N'210b48b542659fb951a80a15c5997513', N'0767867867', CAST(N'2023-12-12' AS Date), N'Hà nội', N'https://static-00.iconduck.com/assets.00/avatar-default-symbolic-icon-479x512-n8sg74wg.png', 0, 3, 1, N'', 0)
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleId], [Status], [Description], [DeleteFlag]) VALUES (20, N'Minh Nguyen', N'asodfk@gmail.com', N'210b48b542659fb951a80a15c5997513', N'0983218694', CAST(N'2023-11-29' AS Date), N'Số 958 đường Điện Biên', NULL, 0, 2, 1, NULL, 0)
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleId], [Status], [Description], [DeleteFlag]) VALUES (21, N'oke', N'oke', N'oke', N'oke', CAST(N'2023-12-10' AS Date), N'oke', N'https://static-00.iconduck.com/assets.00/avatar-default-symbolic-icon-479x512-n8sg74wg.png', 1, 1, 1, N'oke', 0)
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleId], [Status], [Description], [DeleteFlag]) VALUES (24, N'Minh', N'ndminh1234@gmail.com', N'210b48b542659fb951a80a15c5997513', N'0983218694', CAST(N'2023-12-12' AS Date), N'Minh Nguyen', N'https://static-00.iconduck.com/assets.00/avatar-default-symbolic-icon-479x512-n8sg74wg.png', 1, 3, 1, N'oke', 0)
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleId], [Status], [Description], [DeleteFlag]) VALUES (25, N'Minh Nguyen', N'ndminh120@gmail.com', N'210b48b542659fb951a80a15c5997513', N'0983218694', CAST(N'2023-12-04' AS Date), N'Minh Nguyen', N'https://static-00.iconduck.com/assets.00/avatar-default-symbolic-icon-479x512-n8sg74wg.png', 1, 3, 1, N'', 0)
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleId], [Status], [Description], [DeleteFlag]) VALUES (26, N'Minh Nguyen', N'ndmi0@gmail.com', N'210b48b542659fb951a80a15c5997513', N'0983218694', CAST(N'2023-12-04' AS Date), N'Minh Nguyen', N'https://static-00.iconduck.com/assets.00/avatar-default-symbolic-icon-479x512-n8sg74wg.png', 1, 3, 1, N'', 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
