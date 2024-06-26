USE [master]
GO
/****** Object:  Database [StockManagementSystemDB]    Script Date: 8/13/2019 12:35:22 AM ******/
CREATE DATABASE [StockManagementSystemDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StockManagementSystemDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SHAHIDULSQLSERVER\MSSQL\DATA\StockManagementSystemDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'StockManagementSystemDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SHAHIDULSQLSERVER\MSSQL\DATA\StockManagementSystemDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [StockManagementSystemDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StockManagementSystemDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StockManagementSystemDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StockManagementSystemDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StockManagementSystemDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StockManagementSystemDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StockManagementSystemDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [StockManagementSystemDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StockManagementSystemDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [StockManagementSystemDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StockManagementSystemDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StockManagementSystemDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StockManagementSystemDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StockManagementSystemDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StockManagementSystemDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StockManagementSystemDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StockManagementSystemDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StockManagementSystemDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StockManagementSystemDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StockManagementSystemDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StockManagementSystemDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StockManagementSystemDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StockManagementSystemDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StockManagementSystemDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StockManagementSystemDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StockManagementSystemDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [StockManagementSystemDB] SET  MULTI_USER 
GO
ALTER DATABASE [StockManagementSystemDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StockManagementSystemDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StockManagementSystemDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StockManagementSystemDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [StockManagementSystemDB]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 8/13/2019 12:35:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CategorySetup]    Script Date: 8/13/2019 12:35:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CategorySetup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CategorySetup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CompanySetup]    Script Date: 8/13/2019 12:35:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CompanySetup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CompanySetup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Item]    Script Date: 8/13/2019 12:35:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Item](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[CompanyId] [int] NOT NULL,
	[ItemName] [varchar](50) NOT NULL,
	[ReorderLevel] [int] NOT NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StockIn]    Script Date: 8/13/2019 12:35:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockIn](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ItemId] [int] NOT NULL,
	[ReorderLevel] [int] NOT NULL,
	[AvailableQuantity] [int] NOT NULL,
	[EntryTime] [datetime] NOT NULL,
 CONSTRAINT [PK_StockIn] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StockOut]    Script Date: 8/13/2019 12:35:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StockOut](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ItemId] [int] NOT NULL,
	[ReorderLevel] [int] NOT NULL,
	[StockOutQuantity] [int] NOT NULL,
	[EntryTime] [datetime] NOT NULL,
	[Action] [varchar](50) NOT NULL,
 CONSTRAINT [PK_StockOut] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[GetAllCategoryView]    Script Date: 8/13/2019 12:35:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[GetAllCategoryView]
AS
SELECT        i.ItemName, i.CompanyId, i.CategoryId, s.ReorderLevel, s.AvailableQuantity, s.ItemId, cat.Name AS CategoryName, com.Name AS CompanyName
FROM            dbo.Item AS i INNER JOIN
                         dbo.StockIn AS s ON i.Id = s.ItemId INNER JOIN
                         dbo.CategorySetup AS cat ON i.CategoryId = cat.Id INNER JOIN
                         dbo.CompanySetup AS com ON i.CompanyId = com.Id

GO
/****** Object:  View [dbo].[GetAllCompany]    Script Date: 8/13/2019 12:35:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[GetAllCompany]
AS
SELECT        i.Id AS ItemId, c.Name AS CompanyName, i.CompanyId, i.ItemName, i.ReorderLevel
FROM            dbo.Item AS i INNER JOIN
                         dbo.CompanySetup AS c ON i.CompanyId = c.Id

GO
/****** Object:  View [dbo].[GetItemView]    Script Date: 8/13/2019 12:35:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[GetItemView]
AS
SELECT        i.ItemName, s.ReorderLevel, s.AvailableQuantity, s.ItemId, i.CompanyId
FROM            dbo.Item AS i INNER JOIN
                         dbo.StockIn AS s ON i.Id = s.ItemId

GO
/****** Object:  View [dbo].[GetSalesBtnDateView]    Script Date: 8/13/2019 12:35:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[GetSalesBtnDateView]
As
Select c.Name As CompanyName,i.ItemName,st.StockOutQuantity, CONVERT(nvarchar,EntryTime,103) as EntryDate From StockOut AS st INNER JOIN Item As i ON st.ItemId =i.Id  Inner Join CompanySetup AS c  ON i.CompanyId = c.Id
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([Id], [Name], [Username], [Password], [Email]) VALUES (2, N'shahidul', N'shahid', N'123', N'shahidctg@gmail.com')
SET IDENTITY_INSERT [dbo].[Account] OFF
SET IDENTITY_INSERT [dbo].[CategorySetup] ON 

INSERT [dbo].[CategorySetup] ([Id], [Name]) VALUES (5, N'Bakery')
INSERT [dbo].[CategorySetup] ([Id], [Name]) VALUES (6, N'Chip')
INSERT [dbo].[CategorySetup] ([Id], [Name]) VALUES (1, N'Cosmetics')
INSERT [dbo].[CategorySetup] ([Id], [Name]) VALUES (2, N'Electronies')
INSERT [dbo].[CategorySetup] ([Id], [Name]) VALUES (3, N'Kitchen Items')
INSERT [dbo].[CategorySetup] ([Id], [Name]) VALUES (4, N'Stationary')
SET IDENTITY_INSERT [dbo].[CategorySetup] OFF
SET IDENTITY_INSERT [dbo].[CompanySetup] ON 

INSERT [dbo].[CompanySetup] ([Id], [Name]) VALUES (6, N'Arju Bakery')
INSERT [dbo].[CompanySetup] ([Id], [Name]) VALUES (4, N'Nova')
INSERT [dbo].[CompanySetup] ([Id], [Name]) VALUES (5, N'Pran')
INSERT [dbo].[CompanySetup] ([Id], [Name]) VALUES (2, N'RFL')
INSERT [dbo].[CompanySetup] ([Id], [Name]) VALUES (1, N'Unilever')
INSERT [dbo].[CompanySetup] ([Id], [Name]) VALUES (3, N'Walton')
SET IDENTITY_INSERT [dbo].[CompanySetup] OFF
SET IDENTITY_INSERT [dbo].[Item] ON 

INSERT [dbo].[Item] ([Id], [CategoryId], [CompanyId], [ItemName], [ReorderLevel]) VALUES (1, 2, 3, N'Tv', 5)
INSERT [dbo].[Item] ([Id], [CategoryId], [CompanyId], [ItemName], [ReorderLevel]) VALUES (2, 2, 3, N'LED Monitor', 5)
INSERT [dbo].[Item] ([Id], [CategoryId], [CompanyId], [ItemName], [ReorderLevel]) VALUES (3, 3, 2, N'Jar', 10)
INSERT [dbo].[Item] ([Id], [CategoryId], [CompanyId], [ItemName], [ReorderLevel]) VALUES (4, 1, 1, N'LUX', 15)
INSERT [dbo].[Item] ([Id], [CategoryId], [CompanyId], [ItemName], [ReorderLevel]) VALUES (5, 1, 1, N'Dove', 15)
INSERT [dbo].[Item] ([Id], [CategoryId], [CompanyId], [ItemName], [ReorderLevel]) VALUES (6, 2, 3, N'Mobile', 0)
INSERT [dbo].[Item] ([Id], [CategoryId], [CompanyId], [ItemName], [ReorderLevel]) VALUES (7, 5, 6, N'Bela Biscuit', 5)
INSERT [dbo].[Item] ([Id], [CategoryId], [CompanyId], [ItemName], [ReorderLevel]) VALUES (8, 5, 6, N'Toast', 0)
INSERT [dbo].[Item] ([Id], [CategoryId], [CompanyId], [ItemName], [ReorderLevel]) VALUES (9, 5, 6, N'Cake', 0)
INSERT [dbo].[Item] ([Id], [CategoryId], [CompanyId], [ItemName], [ReorderLevel]) VALUES (10, 5, 6, N'Bun', 10)
INSERT [dbo].[Item] ([Id], [CategoryId], [CompanyId], [ItemName], [ReorderLevel]) VALUES (11, 5, 6, N'Borhani', 0)
INSERT [dbo].[Item] ([Id], [CategoryId], [CompanyId], [ItemName], [ReorderLevel]) VALUES (12, 5, 6, N'Nimky', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [CompanyId], [ItemName], [ReorderLevel]) VALUES (13, 6, 5, N'mr. twist', 10)
SET IDENTITY_INSERT [dbo].[Item] OFF
SET IDENTITY_INSERT [dbo].[StockIn] ON 

INSERT [dbo].[StockIn] ([Id], [ItemId], [ReorderLevel], [AvailableQuantity], [EntryTime]) VALUES (1, 1, 5, 28, CAST(0x0000A9350169709B AS DateTime))
INSERT [dbo].[StockIn] ([Id], [ItemId], [ReorderLevel], [AvailableQuantity], [EntryTime]) VALUES (2, 2, 5, 8, CAST(0x0000A935016A2CB4 AS DateTime))
INSERT [dbo].[StockIn] ([Id], [ItemId], [ReorderLevel], [AvailableQuantity], [EntryTime]) VALUES (3, 3, 10, 53, CAST(0x0000A935016B0073 AS DateTime))
INSERT [dbo].[StockIn] ([Id], [ItemId], [ReorderLevel], [AvailableQuantity], [EntryTime]) VALUES (4, 4, 15, 50, CAST(0x0000A935016CA580 AS DateTime))
INSERT [dbo].[StockIn] ([Id], [ItemId], [ReorderLevel], [AvailableQuantity], [EntryTime]) VALUES (5, 5, 15, 25, CAST(0x0000A935016CBD0B AS DateTime))
INSERT [dbo].[StockIn] ([Id], [ItemId], [ReorderLevel], [AvailableQuantity], [EntryTime]) VALUES (6, 7, 5, 10, CAST(0x0000A94A00B8B46D AS DateTime))
INSERT [dbo].[StockIn] ([Id], [ItemId], [ReorderLevel], [AvailableQuantity], [EntryTime]) VALUES (7, 8, 0, 20, CAST(0x0000A94A00D08DE0 AS DateTime))
INSERT [dbo].[StockIn] ([Id], [ItemId], [ReorderLevel], [AvailableQuantity], [EntryTime]) VALUES (8, 9, 0, 15, CAST(0x0000A94A00D152A6 AS DateTime))
INSERT [dbo].[StockIn] ([Id], [ItemId], [ReorderLevel], [AvailableQuantity], [EntryTime]) VALUES (9, 13, 10, 9, CAST(0x0000AA7500BBED44 AS DateTime))
SET IDENTITY_INSERT [dbo].[StockIn] OFF
SET IDENTITY_INSERT [dbo].[StockOut] ON 

INSERT [dbo].[StockOut] ([Id], [ItemId], [ReorderLevel], [StockOutQuantity], [EntryTime], [Action]) VALUES (2, 1, 5, 20, CAST(0x0000A9350169709B AS DateTime), N'Sale')
INSERT [dbo].[StockOut] ([Id], [ItemId], [ReorderLevel], [StockOutQuantity], [EntryTime], [Action]) VALUES (3, 3, 10, 10, CAST(0x0000A93A0008B680 AS DateTime), N'Sell')
INSERT [dbo].[StockOut] ([Id], [ItemId], [ReorderLevel], [StockOutQuantity], [EntryTime], [Action]) VALUES (4, 4, 15, 5, CAST(0x0000A93A000FC17F AS DateTime), N'Sell')
INSERT [dbo].[StockOut] ([Id], [ItemId], [ReorderLevel], [StockOutQuantity], [EntryTime], [Action]) VALUES (5, 3, 10, 5, CAST(0x0000A93A0011B92E AS DateTime), N'Sell')
INSERT [dbo].[StockOut] ([Id], [ItemId], [ReorderLevel], [StockOutQuantity], [EntryTime], [Action]) VALUES (6, 3, 10, 5, CAST(0x0000A93A00122276 AS DateTime), N'Sell')
INSERT [dbo].[StockOut] ([Id], [ItemId], [ReorderLevel], [StockOutQuantity], [EntryTime], [Action]) VALUES (7, 3, 10, 5, CAST(0x0000A93A0012AC6A AS DateTime), N'Sell')
INSERT [dbo].[StockOut] ([Id], [ItemId], [ReorderLevel], [StockOutQuantity], [EntryTime], [Action]) VALUES (8, 5, 15, 10, CAST(0x0000A93A0012AC71 AS DateTime), N'Sell')
INSERT [dbo].[StockOut] ([Id], [ItemId], [ReorderLevel], [StockOutQuantity], [EntryTime], [Action]) VALUES (9, 3, 10, 10, CAST(0x0000A93A00134AFB AS DateTime), N'Sell')
INSERT [dbo].[StockOut] ([Id], [ItemId], [ReorderLevel], [StockOutQuantity], [EntryTime], [Action]) VALUES (10, 2, 5, 5, CAST(0x0000A93A00134B04 AS DateTime), N'Sell')
INSERT [dbo].[StockOut] ([Id], [ItemId], [ReorderLevel], [StockOutQuantity], [EntryTime], [Action]) VALUES (11, 3, 10, 5, CAST(0x0000A93A00A3426B AS DateTime), N'Sell')
INSERT [dbo].[StockOut] ([Id], [ItemId], [ReorderLevel], [StockOutQuantity], [EntryTime], [Action]) VALUES (12, 2, 5, 5, CAST(0x0000A93A00A34279 AS DateTime), N'Sell')
INSERT [dbo].[StockOut] ([Id], [ItemId], [ReorderLevel], [StockOutQuantity], [EntryTime], [Action]) VALUES (13, 3, 10, 5, CAST(0x0000A93A00B4A414 AS DateTime), N'Sell')
INSERT [dbo].[StockOut] ([Id], [ItemId], [ReorderLevel], [StockOutQuantity], [EntryTime], [Action]) VALUES (14, 2, 5, 5, CAST(0x0000A93A00B4BCB5 AS DateTime), N'Sell')
INSERT [dbo].[StockOut] ([Id], [ItemId], [ReorderLevel], [StockOutQuantity], [EntryTime], [Action]) VALUES (15, 4, 15, 5, CAST(0x0000A93A00B6613F AS DateTime), N'Damage')
INSERT [dbo].[StockOut] ([Id], [ItemId], [ReorderLevel], [StockOutQuantity], [EntryTime], [Action]) VALUES (16, 1, 5, 10, CAST(0x0000A93A00B67FF3 AS DateTime), N'Lost')
INSERT [dbo].[StockOut] ([Id], [ItemId], [ReorderLevel], [StockOutQuantity], [EntryTime], [Action]) VALUES (17, 2, 5, 5, CAST(0x0000A94800DF97AD AS DateTime), N'Sell')
INSERT [dbo].[StockOut] ([Id], [ItemId], [ReorderLevel], [StockOutQuantity], [EntryTime], [Action]) VALUES (18, 4, 15, 5, CAST(0x0000A94800DF97C1 AS DateTime), N'Sell')
INSERT [dbo].[StockOut] ([Id], [ItemId], [ReorderLevel], [StockOutQuantity], [EntryTime], [Action]) VALUES (19, 5, 15, 10, CAST(0x0000A94801872986 AS DateTime), N'Sell')
INSERT [dbo].[StockOut] ([Id], [ItemId], [ReorderLevel], [StockOutQuantity], [EntryTime], [Action]) VALUES (20, 2, 5, 2, CAST(0x0000A94801872990 AS DateTime), N'Sell')
INSERT [dbo].[StockOut] ([Id], [ItemId], [ReorderLevel], [StockOutQuantity], [EntryTime], [Action]) VALUES (21, 4, 15, 2, CAST(0x0000A94900835C9D AS DateTime), N'Sell')
INSERT [dbo].[StockOut] ([Id], [ItemId], [ReorderLevel], [StockOutQuantity], [EntryTime], [Action]) VALUES (22, 1, 5, 2, CAST(0x0000A94900835CAA AS DateTime), N'Sell')
INSERT [dbo].[StockOut] ([Id], [ItemId], [ReorderLevel], [StockOutQuantity], [EntryTime], [Action]) VALUES (23, 4, 15, 3, CAST(0x0000A94900836D4E AS DateTime), N'Sell')
INSERT [dbo].[StockOut] ([Id], [ItemId], [ReorderLevel], [StockOutQuantity], [EntryTime], [Action]) VALUES (24, 5, 15, 5, CAST(0x0000A9550126073C AS DateTime), N'Sell')
INSERT [dbo].[StockOut] ([Id], [ItemId], [ReorderLevel], [StockOutQuantity], [EntryTime], [Action]) VALUES (25, 3, 10, 2, CAST(0x0000A95501260750 AS DateTime), N'Sell')
INSERT [dbo].[StockOut] ([Id], [ItemId], [ReorderLevel], [StockOutQuantity], [EntryTime], [Action]) VALUES (26, 13, 10, 20, CAST(0x0000AA7500BC5BAB AS DateTime), N'Sell')
INSERT [dbo].[StockOut] ([Id], [ItemId], [ReorderLevel], [StockOutQuantity], [EntryTime], [Action]) VALUES (27, 13, 10, 91, CAST(0x0000AA7500BC9B44 AS DateTime), N'Sell')
SET IDENTITY_INSERT [dbo].[StockOut] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_User]    Script Date: 8/13/2019 12:35:22 AM ******/
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [IX_User] UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_CategorySetup]    Script Date: 8/13/2019 12:35:22 AM ******/
ALTER TABLE [dbo].[CategorySetup] ADD  CONSTRAINT [IX_CategorySetup] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_CompanySetup]    Script Date: 8/13/2019 12:35:22 AM ******/
ALTER TABLE [dbo].[CompanySetup] ADD  CONSTRAINT [IX_CompanySetup] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_StockIn]    Script Date: 8/13/2019 12:35:22 AM ******/
ALTER TABLE [dbo].[StockIn] ADD  CONSTRAINT [IX_StockIn] UNIQUE NONCLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_CategorySetup] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[CategorySetup] ([Id])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_CategorySetup]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_CompanySetup] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[CompanySetup] ([Id])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_CompanySetup]
GO
ALTER TABLE [dbo].[StockIn]  WITH CHECK ADD  CONSTRAINT [FK_StockIn_Item] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Item] ([Id])
GO
ALTER TABLE [dbo].[StockIn] CHECK CONSTRAINT [FK_StockIn_Item]
GO
ALTER TABLE [dbo].[StockOut]  WITH CHECK ADD  CONSTRAINT [FK_StockOut_Item] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Item] ([Id])
GO
ALTER TABLE [dbo].[StockOut] CHECK CONSTRAINT [FK_StockOut_Item]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[53] 4[20] 3[4] 2) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "i"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "s"
            Begin Extent = 
               Top = 10
               Left = 602
               Bottom = 140
               Right = 785
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "cat"
            Begin Extent = 
               Top = 174
               Left = 260
               Bottom = 270
               Right = 430
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "com"
            Begin Extent = 
               Top = 162
               Left = 593
               Bottom = 258
               Right = 763
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'GetAllCategoryView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'GetAllCategoryView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "i"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 172
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 102
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'GetAllCompany'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'GetAllCompany'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "i"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "s"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 429
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'GetItemView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'GetItemView'
GO
USE [master]
GO
ALTER DATABASE [StockManagementSystemDB] SET  READ_WRITE 
GO
