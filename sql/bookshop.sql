/*
 Navicat Premium Data Transfer

 Source Server         : LAPTOP-EJ4J5JAQ
 Source Server Type    : SQL Server
 Source Server Version : 10504000
 Source Catalog        : bookshop
 Source Schema         : dbo

 Target Server Type    : SQL Server
 Target Server Version : 10504000
 File Encoding         : 65001

 Date: 22/06/2020 12:44:25
*/


-- ----------------------------
-- Table structure for admin
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[admin]') AND type IN ('U'))
	DROP TABLE [dbo].[admin]
GO

CREATE TABLE [dbo].[admin] (
  [adminId] int  IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
  [roleId] int  NULL,
  [adminName] char(20) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [password] char(20) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [realName] char(20) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[admin] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for bookinfo
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[bookinfo]') AND type IN ('U'))
	DROP TABLE [dbo].[bookinfo]
GO

CREATE TABLE [dbo].[bookinfo] (
  [bookId] int  IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
  [categoryId] int  NULL,
  [bookName] char(255) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [pictureUrl] char(255) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [price] float(53)  NOT NULL,
  [stock] int  NOT NULL,
  [description] char(255) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[bookinfo] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of [bookinfo]
-- ----------------------------
SET IDENTITY_INSERT [dbo].[bookinfo] ON
GO

INSERT INTO [dbo].[bookinfo] ([bookId], [categoryId], [bookName], [pictureUrl], [price], [stock], [description]) VALUES (N'1', N'1', N'深度学习                                                                                                                                                                                                                                                       ', N'https://img9.doubanio.com/view/subject/l/public/s29518349.jpg                                                                                                                                                                                                  ', N'118.000000000000000', N'37', N'ai圣经                                                                                                                                                                                                                                                         ')
GO

INSERT INTO [dbo].[bookinfo] ([bookId], [categoryId], [bookName], [pictureUrl], [price], [stock], [description]) VALUES (N'2', N'6', N'算法导论                                                                                                                                                                                                                                                       ', N'https://img9.doubanio.com/view/subject/l/public/s25648004.jpg                                                                                                                                                                                                  ', N'80.000000000000000', N'12', N'算法圣经                                                                                                                                                                                                                                                       ')
GO

INSERT INTO [dbo].[bookinfo] ([bookId], [categoryId], [bookName], [pictureUrl], [price], [stock], [description]) VALUES (N'4', N'6', N'CSAPP                                                                                                                                                                                                                                                          ', N'https://img9.doubanio.com/view/subject/l/public/s29195878.jpg                                                                                                                                                                                                  ', N'139.000000000000000', N'27', N'深入理解计算机系统                                                                                                                                                                                                                                             ')
GO

SET IDENTITY_INSERT [dbo].[bookinfo] OFF
GO


-- ----------------------------
-- Table structure for cart
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[cart]') AND type IN ('U'))
	DROP TABLE [dbo].[cart]
GO

CREATE TABLE [dbo].[cart] (
  [userCode] int  IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
  [bookId] int  NOT NULL,
  [quantity] int  NULL
)
GO

ALTER TABLE [dbo].[cart] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for category
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[category]') AND type IN ('U'))
	DROP TABLE [dbo].[category]
GO

CREATE TABLE [dbo].[category] (
  [categoryId] int  IDENTITY(1,1) NOT NULL,
  [categoryName] char(255) COLLATE Chinese_PRC_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[category] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of [category]
-- ----------------------------
SET IDENTITY_INSERT [dbo].[category] ON
GO

INSERT INTO [dbo].[category] ([categoryId], [categoryName]) VALUES (N'1', N'深度学习                                                                                                                                                                                                                                                       ')
GO

INSERT INTO [dbo].[category] ([categoryId], [categoryName]) VALUES (N'2', N'python                                                                                                                                                                                                                                                         ')
GO

INSERT INTO [dbo].[category] ([categoryId], [categoryName]) VALUES (N'3', N'java                                                                                                                                                                                                                                                           ')
GO

INSERT INTO [dbo].[category] ([categoryId], [categoryName]) VALUES (N'4', N'c/c++                                                                                                                                                                                                                                                          ')
GO

INSERT INTO [dbo].[category] ([categoryId], [categoryName]) VALUES (N'5', N'mysql                                                                                                                                                                                                                                                          ')
GO

INSERT INTO [dbo].[category] ([categoryId], [categoryName]) VALUES (N'6', N'计算机基础                                                                                                                                                                                                                                                     ')
GO

SET IDENTITY_INSERT [dbo].[category] OFF
GO


-- ----------------------------
-- Table structure for customer
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[customer]') AND type IN ('U'))
	DROP TABLE [dbo].[customer]
GO

CREATE TABLE [dbo].[customer] (
  [userCode] int  IDENTITY(1,1) NOT NULL,
  [userName] char(20) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [password] char(20) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [realName] char(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [phone] int  NOT NULL,
  [email] char(255) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [address] char(255) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [registerDate] datetime  NOT NULL
)
GO

ALTER TABLE [dbo].[customer] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of [customer]
-- ----------------------------
SET IDENTITY_INSERT [dbo].[customer] ON
GO

INSERT INTO [dbo].[customer] ([userCode], [userName], [password], [realName], [phone], [email], [address], [registerDate]) VALUES (N'1', N'ztt                 ', N'123456              ', N'zyj                 ', N'123456', N'ztt@qq.com                                                                                                                                                                                                                                                     ', N'china                                                                                                                                                                                                                                                          ', N'2020-06-14 22:19:32.093')
GO

INSERT INTO [dbo].[customer] ([userCode], [userName], [password], [realName], [phone], [email], [address], [registerDate]) VALUES (N'2', N'java                ', N'123                 ', N'zhangsan            ', N'123456', N'aaaa@qq.com                                                                                                                                                                                                                                                    ', N'china                                                                                                                                                                                                                                                          ', N'2020-06-20 21:21:15.063')
GO

SET IDENTITY_INSERT [dbo].[customer] OFF
GO


-- ----------------------------
-- Table structure for order
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[order]') AND type IN ('U'))
	DROP TABLE [dbo].[order]
GO

CREATE TABLE [dbo].[order] (
  [orderId] int  NOT NULL,
  [userCode] int  NOT NULL,
  [totalPrice] float(53)  NOT NULL,
  [orderTime] datetime  NULL,
  [totalQuantity] int  NOT NULL
)
GO

ALTER TABLE [dbo].[order] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of [order]
-- ----------------------------
INSERT INTO [dbo].[order]  VALUES (N'506520', N'1', N'337.000000000000000', N'2020-06-21 14:51:48.483', N'3')
GO

INSERT INTO [dbo].[order]  VALUES (N'365352', N'1', N'594.000000000000000', N'2020-06-20 21:19:53.777', N'5')
GO

INSERT INTO [dbo].[order]  VALUES (N'734239', N'1', N'236.000000000000000', N'2020-06-22 12:38:18.753', N'2')
GO


-- ----------------------------
-- Table structure for orderDetail
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[orderDetail]') AND type IN ('U'))
	DROP TABLE [dbo].[orderDetail]
GO

CREATE TABLE [dbo].[orderDetail] (
  [orderId] int  IDENTITY(1,1) NOT NULL,
  [bookId] int  NOT NULL,
  [price] float(53)  NOT NULL,
  [quantity] int  NOT NULL
)
GO

ALTER TABLE [dbo].[orderDetail] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of [orderDetail]
-- ----------------------------
SET IDENTITY_INSERT [dbo].[orderDetail] ON
GO

INSERT INTO [dbo].[orderDetail] ([orderId], [bookId], [price], [quantity]) VALUES (N'365352', N'1', N'118.000000000000000', N'2')
GO

INSERT INTO [dbo].[orderDetail] ([orderId], [bookId], [price], [quantity]) VALUES (N'365352', N'2', N'80.000000000000000', N'1')
GO

INSERT INTO [dbo].[orderDetail] ([orderId], [bookId], [price], [quantity]) VALUES (N'365352', N'4', N'139.000000000000000', N'2')
GO

INSERT INTO [dbo].[orderDetail] ([orderId], [bookId], [price], [quantity]) VALUES (N'506520', N'1', N'118.000000000000000', N'1')
GO

INSERT INTO [dbo].[orderDetail] ([orderId], [bookId], [price], [quantity]) VALUES (N'506520', N'2', N'80.000000000000000', N'1')
GO

INSERT INTO [dbo].[orderDetail] ([orderId], [bookId], [price], [quantity]) VALUES (N'506520', N'4', N'139.000000000000000', N'1')
GO

INSERT INTO [dbo].[orderDetail] ([orderId], [bookId], [price], [quantity]) VALUES (N'734239', N'1', N'118.000000000000000', N'2')
GO

SET IDENTITY_INSERT [dbo].[orderDetail] OFF
GO


-- ----------------------------
-- Table structure for role
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[role]') AND type IN ('U'))
	DROP TABLE [dbo].[role]
GO

CREATE TABLE [dbo].[role] (
  [roleId] int  IDENTITY(1,1) NOT NULL,
  [roleName] char(255) COLLATE Chinese_PRC_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[role] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of [role]
-- ----------------------------
SET IDENTITY_INSERT [dbo].[role] ON
GO

INSERT INTO [dbo].[role] ([roleId], [roleName]) VALUES (N'1', N'系统管理员                                                                                                                                                                                                                                                     ')
GO

SET IDENTITY_INSERT [dbo].[role] OFF
GO


-- ----------------------------
-- Indexes structure for table admin
-- ----------------------------
CREATE NONCLUSTERED INDEX [belongs to_FK]
ON [dbo].[admin] (
  [roleId] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table admin
-- ----------------------------
ALTER TABLE [dbo].[admin] ADD CONSTRAINT [PK_ADMIN] PRIMARY KEY NONCLUSTERED ([adminId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table bookinfo
-- ----------------------------
CREATE NONCLUSTERED INDEX [category_FK]
ON [dbo].[bookinfo] (
  [categoryId] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table bookinfo
-- ----------------------------
ALTER TABLE [dbo].[bookinfo] ADD CONSTRAINT [PK_BOOKINFO] PRIMARY KEY NONCLUSTERED ([bookId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table cart
-- ----------------------------
CREATE NONCLUSTERED INDEX [cart_FK]
ON [dbo].[cart] (
  [userCode] ASC
)
GO

CREATE NONCLUSTERED INDEX [cart2_FK2]
ON [dbo].[cart] (
  [bookId] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table cart
-- ----------------------------
ALTER TABLE [dbo].[cart] ADD CONSTRAINT [PK_CART] PRIMARY KEY CLUSTERED ([userCode], [bookId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table category
-- ----------------------------
ALTER TABLE [dbo].[category] ADD CONSTRAINT [PK_CATEGORY] PRIMARY KEY NONCLUSTERED ([categoryId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table customer
-- ----------------------------
ALTER TABLE [dbo].[customer] ADD CONSTRAINT [PK_CUSTOMER] PRIMARY KEY NONCLUSTERED ([userCode])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table order
-- ----------------------------
ALTER TABLE [dbo].[order] ADD CONSTRAINT [PK_ORDER] PRIMARY KEY NONCLUSTERED ([orderId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table orderDetail
-- ----------------------------
CREATE NONCLUSTERED INDEX [orderDetail_FK]
ON [dbo].[orderDetail] (
  [orderId] ASC
)
GO

CREATE NONCLUSTERED INDEX [orderDetail2_FK]
ON [dbo].[orderDetail] (
  [bookId] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table orderDetail
-- ----------------------------
ALTER TABLE [dbo].[orderDetail] ADD CONSTRAINT [PK_ORDERDETAIL] PRIMARY KEY CLUSTERED ([orderId], [bookId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table role
-- ----------------------------
ALTER TABLE [dbo].[role] ADD CONSTRAINT [PK_ROLE] PRIMARY KEY NONCLUSTERED ([roleId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Foreign Keys structure for table admin
-- ----------------------------
ALTER TABLE [dbo].[admin] ADD CONSTRAINT [FK_ADMIN_BELONGS T_ROLE] FOREIGN KEY ([roleId]) REFERENCES [role] ([roleId]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table bookinfo
-- ----------------------------
ALTER TABLE [dbo].[bookinfo] ADD CONSTRAINT [FK_BOOKINFO_CATEGORY_CATEGORY] FOREIGN KEY ([categoryId]) REFERENCES [category] ([categoryId]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table cart
-- ----------------------------
ALTER TABLE [dbo].[cart] ADD CONSTRAINT [FK_CART_CART_CUSTOMER] FOREIGN KEY ([userCode]) REFERENCES [customer] ([userCode]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[cart] ADD CONSTRAINT [FK_CART_CART2_BOOKINFO] FOREIGN KEY ([bookId]) REFERENCES [bookinfo] ([bookId]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table orderDetail
-- ----------------------------
ALTER TABLE [dbo].[orderDetail] ADD CONSTRAINT [FK_ORDERDET_ORDERDETA_BOOKINFO] FOREIGN KEY ([bookId]) REFERENCES [bookinfo] ([bookId]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[orderDetail] ADD CONSTRAINT [FK_ORDERDET_ORDERDETA_ORDER] FOREIGN KEY ([orderId]) REFERENCES [order] ([orderId]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

