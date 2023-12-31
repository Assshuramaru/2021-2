USE [master]
GO
/****** Object:  Database [user57]    Script Date: 02.10.2023 11:15:42 ******/
CREATE DATABASE [user57]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'user57', FILENAME = N'C:\Users\ADMIN\user57.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'user57_log', FILENAME = N'C:\Users\ADMIN\user57_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [user57] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [user57].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [user57] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [user57] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [user57] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [user57] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [user57] SET ARITHABORT OFF 
GO
ALTER DATABASE [user57] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [user57] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [user57] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [user57] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [user57] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [user57] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [user57] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [user57] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [user57] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [user57] SET  ENABLE_BROKER 
GO
ALTER DATABASE [user57] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [user57] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [user57] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [user57] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [user57] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [user57] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [user57] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [user57] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [user57] SET  MULTI_USER 
GO
ALTER DATABASE [user57] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [user57] SET DB_CHAINING OFF 
GO
ALTER DATABASE [user57] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [user57] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [user57] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [user57] SET QUERY_STORE = OFF
GO
USE [user57]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [user57]
GO
/****** Object:  Table [dbo].[Agent]    Script Date: 02.10.2023 11:15:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agent](
	[AgentId] [int] IDENTITY(1,1) NOT NULL,
	[AgentName] [nvarchar](50) NOT NULL,
	[AgentTypeId] [int] NOT NULL,
	[LegalAddress] [nvarchar](100) NOT NULL,
	[INN] [nvarchar](20) NOT NULL,
	[KPP] [nvarchar](50) NOT NULL,
	[ManagerFIO] [nvarchar](100) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Logo] [nvarchar](100) NULL,
	[Priority] [smallint] NULL,
 CONSTRAINT [PK_Agents] PRIMARY KEY CLUSTERED 
(
	[AgentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgentPoint]    Script Date: 02.10.2023 11:15:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgentPoint](
	[PointId] [int] IDENTITY(1,1) NOT NULL,
	[PointName] [nvarchar](1000) NOT NULL,
	[Address] [nvarchar](1000) NOT NULL,
	[AgentId] [int] NOT NULL,
 CONSTRAINT [PK_Points] PRIMARY KEY CLUSTERED 
(
	[PointId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgentType]    Script Date: 02.10.2023 11:15:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgentType](
	[AgentTypeId] [int] IDENTITY(1,1) NOT NULL,
	[AgentTypeName] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_AgentType] PRIMARY KEY CLUSTERED 
(
	[AgentTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Door]    Script Date: 02.10.2023 11:15:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Door](
	[DoorId] [int] IDENTITY(1,1) NOT NULL,
	[DoorPlace] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Doors] PRIMARY KEY CLUSTERED 
(
	[DoorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material]    Script Date: 02.10.2023 11:15:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[MaterialId] [int] IDENTITY(1,1) NOT NULL,
	[MaterialName] [nvarchar](100) NOT NULL,
	[MaterialTypeId] [int] NOT NULL,
	[CountInPack] [float] NOT NULL,
	[UnitTypeId] [int] NOT NULL,
	[MinimalCount] [int] NOT NULL,
	[Description] [nvarchar](100) NULL,
	[Image] [nvarchar](50) NULL,
	[Price] [float] NOT NULL,
 CONSTRAINT [PK_Materials] PRIMARY KEY CLUSTERED 
(
	[MaterialId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialSupplier]    Script Date: 02.10.2023 11:15:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialSupplier](
	[MaterialSupplierId] [int] IDENTITY(1,1) NOT NULL,
	[MaterialId] [int] NOT NULL,
	[SupplierId] [int] NOT NULL,
	[Quality] [int] NOT NULL,
	[DeliveryDate] [datetime] NOT NULL,
	[Count] [int] NOT NULL,
 CONSTRAINT [PK_MaterialSuppliers] PRIMARY KEY CLUSTERED 
(
	[MaterialSupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialType]    Script Date: 02.10.2023 11:15:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialType](
	[MaterialTypeId] [int] IDENTITY(1,1) NOT NULL,
	[MaterialTypeName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_MaterialTypes] PRIMARY KEY CLUSTERED 
(
	[MaterialTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialWarehouse]    Script Date: 02.10.2023 11:15:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialWarehouse](
	[MaterialWarehouseId] [int] IDENTITY(1,1) NOT NULL,
	[MaterialId] [int] NOT NULL,
	[OperationTypeId] [int] NOT NULL,
	[OperationDate] [datetime] NOT NULL,
	[Count] [int] NOT NULL,
 CONSTRAINT [PK_MaterialWarehouse] PRIMARY KEY CLUSTERED 
(
	[MaterialWarehouseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OperationType]    Script Date: 02.10.2023 11:15:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OperationType](
	[OperationTypeId] [int] IDENTITY(1,1) NOT NULL,
	[OperationTypeName] [nvarchar](50) NULL,
 CONSTRAINT [PK_OperationTypes] PRIMARY KEY CLUSTERED 
(
	[OperationTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 02.10.2023 11:15:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[DateOfFormation] [datetime] NULL,
	[DateOfPrepayment] [datetime] NULL,
	[IsActive] [bit] NULL,
	[DateOfPayment] [datetime] NULL,
	[AgentId] [int] NOT NULL,
	[SellDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 02.10.2023 11:15:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[OrderProductId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Count] [int] NOT NULL,
 CONSTRAINT [PK_Sell] PRIMARY KEY CLUSTERED 
(
	[OrderProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PriceHistory]    Script Date: 02.10.2023 11:15:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PriceHistory](
	[PriceHistoryId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[MinimalPrice] [float] NOT NULL,
	[AcceptanceDate] [datetime] NOT NULL,
 CONSTRAINT [PK_AgentProducts] PRIMARY KEY CLUSTERED 
(
	[PriceHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PriorityHistory]    Script Date: 02.10.2023 11:15:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PriorityHistory](
	[PriorityHistoryId] [int] IDENTITY(1,1) NOT NULL,
	[AgentId] [int] NOT NULL,
	[Priority] [int] NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_PriorityHistory] PRIMARY KEY CLUSTERED 
(
	[PriorityHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 02.10.2023 11:15:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[Artikul] [nvarchar](50) NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[ProductTypeId] [int] NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[Image] [nvarchar](50) NULL,
	[Length] [float] NULL,
	[Height] [float] NULL,
	[Width] [float] NULL,
	[Netto] [float] NULL,
	[Brutto] [float] NULL,
	[Certificate] [nvarchar](50) NULL,
	[StandartNum] [nvarchar](100) NULL,
	[PeopleCount] [int] NOT NULL,
	[WorkshopId] [int] NOT NULL,
	[ProductionTime] [int] NULL,
	[MinimalPrice] [float] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductMaterial]    Script Date: 02.10.2023 11:15:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductMaterial](
	[ProductMaterialId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[MaterialId] [int] NOT NULL,
	[Count] [int] NOT NULL,
 CONSTRAINT [PK_ProductMaterials] PRIMARY KEY CLUSTERED 
(
	[ProductMaterialId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 02.10.2023 11:15:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[ProductTypeId] [int] IDENTITY(1,1) NOT NULL,
	[ProductTypeName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_ProductTypes] PRIMARY KEY CLUSTERED 
(
	[ProductTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SellHistory]    Script Date: 02.10.2023 11:15:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SellHistory](
	[SellHistoryId] [int] IDENTITY(1,1) NOT NULL,
	[AgentId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_SellHistories] PRIMARY KEY CLUSTERED 
(
	[SellHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Speciality]    Script Date: 02.10.2023 11:15:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Speciality](
	[SpecialityId] [int] IDENTITY(1,1) NOT NULL,
	[SpecialityName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Specialities] PRIMARY KEY CLUSTERED 
(
	[SpecialityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 02.10.2023 11:15:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[SupplierId] [int] IDENTITY(1,1) NOT NULL,
	[SupplierName] [nvarchar](100) NOT NULL,
	[INN] [nvarchar](50) NOT NULL,
	[SupplierTypeId] [int] NOT NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[SupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SupplierType]    Script Date: 02.10.2023 11:15:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupplierType](
	[SupplierTypeId] [int] IDENTITY(1,1) NOT NULL,
	[SupplierTypeName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_SupplierTypes] PRIMARY KEY CLUSTERED 
(
	[SupplierTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UnitType]    Script Date: 02.10.2023 11:15:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnitType](
	[UnitTypeId] [int] IDENTITY(1,1) NOT NULL,
	[UnitTypeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UnitTypes] PRIMARY KEY CLUSTERED 
(
	[UnitTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Worker]    Script Date: 02.10.2023 11:15:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Worker](
	[WorkerId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[Surname] [nvarchar](100) NOT NULL,
	[MiddleName] [nvarchar](100) NULL,
	[DateBirth] [date] NOT NULL,
	[PassportSeries] [int] NOT NULL,
	[PassportNumber] [int] NOT NULL,
	[PassportInfo] [nvarchar](1000) NOT NULL,
	[BankAccount] [nvarchar](1000) NOT NULL,
	[SpecialityId] [int] NOT NULL,
	[FamilyInfo] [nvarchar](1000) NULL,
	[HealthyInfo] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Worker] PRIMARY KEY CLUSTERED 
(
	[WorkerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkerDoor]    Script Date: 02.10.2023 11:15:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkerDoor](
	[WorkerDoorId] [int] IDENTITY(1,1) NOT NULL,
	[WorkerId] [int] NOT NULL,
	[DoorId] [int] NOT NULL,
	[DateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_WorkerDoors] PRIMARY KEY CLUSTERED 
(
	[WorkerDoorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkerWorkshop]    Script Date: 02.10.2023 11:15:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkerWorkshop](
	[WorkerWorkshopId] [int] IDENTITY(1,1) NOT NULL,
	[WorkerId] [int] NOT NULL,
	[WorkshopId] [int] NOT NULL,
	[WorkShift] [int] NOT NULL,
 CONSTRAINT [PK_WorkerWorkshops] PRIMARY KEY CLUSTERED 
(
	[WorkerWorkshopId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Workshop]    Script Date: 02.10.2023 11:15:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Workshop](
	[WorkshopId] [int] IDENTITY(1,1) NOT NULL,
	[WorkshopName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Workshops] PRIMARY KEY CLUSTERED 
(
	[WorkshopId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Material] ON 

INSERT [dbo].[Material] ([MaterialId], [MaterialName], [MaterialTypeId], [CountInPack], [UnitTypeId], [MinimalCount], [Description], [Image], [Price]) VALUES (1, N'Вата серый 1x1', 1, 7, 1, 34, NULL, NULL, 6009)
INSERT [dbo].[Material] ([MaterialId], [MaterialName], [MaterialTypeId], [CountInPack], [UnitTypeId], [MinimalCount], [Description], [Image], [Price]) VALUES (2, N'Ткань белый 2x2', 2, 10, 1, 18, NULL, NULL, 13742)
INSERT [dbo].[Material] ([MaterialId], [MaterialName], [MaterialTypeId], [CountInPack], [UnitTypeId], [MinimalCount], [Description], [Image], [Price]) VALUES (3, N'Металлический стержень белый 0x2', 3, 9, 2, 12, NULL, NULL, 10633)
INSERT [dbo].[Material] ([MaterialId], [MaterialName], [MaterialTypeId], [CountInPack], [UnitTypeId], [MinimalCount], [Description], [Image], [Price]) VALUES (4, N'Силикон серый 1x1', 4, 2, 1, 12, NULL, NULL, 2343)
INSERT [dbo].[Material] ([MaterialId], [MaterialName], [MaterialTypeId], [CountInPack], [UnitTypeId], [MinimalCount], [Description], [Image], [Price]) VALUES (5, N'Силикон белый 0x3', 4, 8, 2, 17, NULL, NULL, 12097)
INSERT [dbo].[Material] ([MaterialId], [MaterialName], [MaterialTypeId], [CountInPack], [UnitTypeId], [MinimalCount], [Description], [Image], [Price]) VALUES (6, N'Силикон белый 1x3', 4, 4, 2, 46, NULL, NULL, 13550)
INSERT [dbo].[Material] ([MaterialId], [MaterialName], [MaterialTypeId], [CountInPack], [UnitTypeId], [MinimalCount], [Description], [Image], [Price]) VALUES (7, N'Ткань серый 0x3', 2, 10, 1, 17, NULL, NULL, 15210)
INSERT [dbo].[Material] ([MaterialId], [MaterialName], [MaterialTypeId], [CountInPack], [UnitTypeId], [MinimalCount], [Description], [Image], [Price]) VALUES (8, N'Резинка зеленый 1x0', 5, 8, 2, 9, NULL, NULL, 32616)
INSERT [dbo].[Material] ([MaterialId], [MaterialName], [MaterialTypeId], [CountInPack], [UnitTypeId], [MinimalCount], [Description], [Image], [Price]) VALUES (9, N'Металлический стержень белый 2x2', 3, 9, 1, 36, NULL, NULL, 36753)
INSERT [dbo].[Material] ([MaterialId], [MaterialName], [MaterialTypeId], [CountInPack], [UnitTypeId], [MinimalCount], [Description], [Image], [Price]) VALUES (10, N'Ткань синий 3x3', 2, 5, 1, 39, NULL, NULL, 32910)
INSERT [dbo].[Material] ([MaterialId], [MaterialName], [MaterialTypeId], [CountInPack], [UnitTypeId], [MinimalCount], [Description], [Image], [Price]) VALUES (11, N'Ткань белый 3x2', 2, 9, 1, 25, NULL, NULL, 782)
INSERT [dbo].[Material] ([MaterialId], [MaterialName], [MaterialTypeId], [CountInPack], [UnitTypeId], [MinimalCount], [Description], [Image], [Price]) VALUES (12, N'Вата розовый 1x0', 1, 3, 1, 32, NULL, NULL, 35776)
INSERT [dbo].[Material] ([MaterialId], [MaterialName], [MaterialTypeId], [CountInPack], [UnitTypeId], [MinimalCount], [Description], [Image], [Price]) VALUES (13, N'Вата серый 3x2', 1, 5, 2, 40, NULL, NULL, 20453)
INSERT [dbo].[Material] ([MaterialId], [MaterialName], [MaterialTypeId], [CountInPack], [UnitTypeId], [MinimalCount], [Description], [Image], [Price]) VALUES (14, N'Ткань розовый 0x0', 2, 3, 1, 29, NULL, NULL, 41101)
INSERT [dbo].[Material] ([MaterialId], [MaterialName], [MaterialTypeId], [CountInPack], [UnitTypeId], [MinimalCount], [Description], [Image], [Price]) VALUES (15, N'Металлический стержень цветной 3x1', 3, 4, 1, 49, NULL, NULL, 55742)
INSERT [dbo].[Material] ([MaterialId], [MaterialName], [MaterialTypeId], [CountInPack], [UnitTypeId], [MinimalCount], [Description], [Image], [Price]) VALUES (16, N'Резинка синий 1x0', 5, 3, 2, 11, NULL, NULL, 1407)
INSERT [dbo].[Material] ([MaterialId], [MaterialName], [MaterialTypeId], [CountInPack], [UnitTypeId], [MinimalCount], [Description], [Image], [Price]) VALUES (17, N'Металлический стержень цветной 1x2', 3, 8, 1, 26, NULL, NULL, 26137)
INSERT [dbo].[Material] ([MaterialId], [MaterialName], [MaterialTypeId], [CountInPack], [UnitTypeId], [MinimalCount], [Description], [Image], [Price]) VALUES (18, N'Ткань цветной 2x1', 2, 2, 1, 34, NULL, NULL, 15628)
INSERT [dbo].[Material] ([MaterialId], [MaterialName], [MaterialTypeId], [CountInPack], [UnitTypeId], [MinimalCount], [Description], [Image], [Price]) VALUES (19, N'Силикон белый 2x0', 4, 10, 1, 38, NULL, NULL, 22538)
INSERT [dbo].[Material] ([MaterialId], [MaterialName], [MaterialTypeId], [CountInPack], [UnitTypeId], [MinimalCount], [Description], [Image], [Price]) VALUES (20, N'Силикон зеленый 3x1', 4, 2, 1, 46, NULL, NULL, 17312)
INSERT [dbo].[Material] ([MaterialId], [MaterialName], [MaterialTypeId], [CountInPack], [UnitTypeId], [MinimalCount], [Description], [Image], [Price]) VALUES (21, N'Вата серый 3x3', 1, 1, 2, 12, NULL, NULL, 19528)
INSERT [dbo].[Material] ([MaterialId], [MaterialName], [MaterialTypeId], [CountInPack], [UnitTypeId], [MinimalCount], [Description], [Image], [Price]) VALUES (22, N'Вата белый 2x0', 1, 8, 2, 49, NULL, NULL, 38432)
INSERT [dbo].[Material] ([MaterialId], [MaterialName], [MaterialTypeId], [CountInPack], [UnitTypeId], [MinimalCount], [Description], [Image], [Price]) VALUES (23, N'Вата розовый 3x1', 1, 3, 2, 41, NULL, NULL, 44015)
INSERT [dbo].[Material] ([MaterialId], [MaterialName], [MaterialTypeId], [CountInPack], [UnitTypeId], [MinimalCount], [Description], [Image], [Price]) VALUES (24, N'Ткань синий 2x0', 2, 4, 1, 16, NULL, NULL, 19507)
INSERT [dbo].[Material] ([MaterialId], [MaterialName], [MaterialTypeId], [CountInPack], [UnitTypeId], [MinimalCount], [Description], [Image], [Price]) VALUES (25, N'Металлический стержень зеленый 2x2', 3, 4, 1, 34, NULL, NULL, 32205)
INSERT [dbo].[Material] ([MaterialId], [MaterialName], [MaterialTypeId], [CountInPack], [UnitTypeId], [MinimalCount], [Description], [Image], [Price]) VALUES (26, N'Резинка зеленый 0x0', 5, 7, 1, 19, NULL, NULL, 42640)
INSERT [dbo].[Material] ([MaterialId], [MaterialName], [MaterialTypeId], [CountInPack], [UnitTypeId], [MinimalCount], [Description], [Image], [Price]) VALUES (27, N'Ткань синий 0x2', 2, 8, 2, 21, NULL, NULL, 27338)
INSERT [dbo].[Material] ([MaterialId], [MaterialName], [MaterialTypeId], [CountInPack], [UnitTypeId], [MinimalCount], [Description], [Image], [Price]) VALUES (28, N'Ткань зеленый 2x2', 2, 4, 1, 7, NULL, NULL, 55083)
INSERT [dbo].[Material] ([MaterialId], [MaterialName], [MaterialTypeId], [CountInPack], [UnitTypeId], [MinimalCount], [Description], [Image], [Price]) VALUES (29, N'Металлический стержень синий 0x1', 3, 9, 1, 20, NULL, NULL, 19715)
INSERT [dbo].[Material] ([MaterialId], [MaterialName], [MaterialTypeId], [CountInPack], [UnitTypeId], [MinimalCount], [Description], [Image], [Price]) VALUES (30, N'Резинка белый 3x3', 5, 1, 1, 26, NULL, NULL, 35230)
INSERT [dbo].[Material] ([MaterialId], [MaterialName], [MaterialTypeId], [CountInPack], [UnitTypeId], [MinimalCount], [Description], [Image], [Price]) VALUES (31, N'Резинка зеленый 3x0', 5, 10, 2, 40, NULL, NULL, 41227)
INSERT [dbo].[Material] ([MaterialId], [MaterialName], [MaterialTypeId], [CountInPack], [UnitTypeId], [MinimalCount], [Description], [Image], [Price]) VALUES (32, N'Ткань белый 1x3', 2, 8, 1, 9, NULL, NULL, 38232)
INSERT [dbo].[Material] ([MaterialId], [MaterialName], [MaterialTypeId], [CountInPack], [UnitTypeId], [MinimalCount], [Description], [Image], [Price]) VALUES (33, N'Силикон цветной 1x0', 4, 10, 1, 28, NULL, NULL, 34664)
INSERT [dbo].[Material] ([MaterialId], [MaterialName], [MaterialTypeId], [CountInPack], [UnitTypeId], [MinimalCount], [Description], [Image], [Price]) VALUES (34, N'Силикон зеленый 0x3', 4, 9, 2, 35, NULL, NULL, 24117)
INSERT [dbo].[Material] ([MaterialId], [MaterialName], [MaterialTypeId], [CountInPack], [UnitTypeId], [MinimalCount], [Description], [Image], [Price]) VALUES (35, N'Вата серый 0x1', 1, 8, 1, 38, NULL, NULL, 42948)
INSERT [dbo].[Material] ([MaterialId], [MaterialName], [MaterialTypeId], [CountInPack], [UnitTypeId], [MinimalCount], [Description], [Image], [Price]) VALUES (36, N'Металлический стержень белый 3x1', 3, 9, 1, 30, NULL, NULL, 9136)
INSERT [dbo].[Material] ([MaterialId], [MaterialName], [MaterialTypeId], [CountInPack], [UnitTypeId], [MinimalCount], [Description], [Image], [Price]) VALUES (37, N'Резинка синий 3x1', 5, 4, 2, 36, NULL, NULL, 36016)
INSERT [dbo].[Material] ([MaterialId], [MaterialName], [MaterialTypeId], [CountInPack], [UnitTypeId], [MinimalCount], [Description], [Image], [Price]) VALUES (38, N'Металлический стержень синий 3x1', 3, 6, 1, 24, NULL, NULL, 26976)
INSERT [dbo].[Material] ([MaterialId], [MaterialName], [MaterialTypeId], [CountInPack], [UnitTypeId], [MinimalCount], [Description], [Image], [Price]) VALUES (39, N'Силикон белый 1x2', 4, 2, 1, 30, NULL, NULL, 33801)
INSERT [dbo].[Material] ([MaterialId], [MaterialName], [MaterialTypeId], [CountInPack], [UnitTypeId], [MinimalCount], [Description], [Image], [Price]) VALUES (40, N'Резинка цветной 1x1', 5, 8, 1, 13, NULL, NULL, 26244)
INSERT [dbo].[Material] ([MaterialId], [MaterialName], [MaterialTypeId], [CountInPack], [UnitTypeId], [MinimalCount], [Description], [Image], [Price]) VALUES (41, N'Силикон розовый 1x3', 4, 9, 1, 25, NULL, NULL, 33874)
INSERT [dbo].[Material] ([MaterialId], [MaterialName], [MaterialTypeId], [CountInPack], [UnitTypeId], [MinimalCount], [Description], [Image], [Price]) VALUES (42, N'Резинка синий 3x2', 5, 5, 1, 31, NULL, NULL, 44031)
INSERT [dbo].[Material] ([MaterialId], [MaterialName], [MaterialTypeId], [CountInPack], [UnitTypeId], [MinimalCount], [Description], [Image], [Price]) VALUES (43, N'Резинка розовый 1x0', 5, 1, 1, 21, NULL, NULL, 36574)
INSERT [dbo].[Material] ([MaterialId], [MaterialName], [MaterialTypeId], [CountInPack], [UnitTypeId], [MinimalCount], [Description], [Image], [Price]) VALUES (44, N'Резинка зеленый 0x3', 5, 8, 2, 17, NULL, NULL, 45349)
INSERT [dbo].[Material] ([MaterialId], [MaterialName], [MaterialTypeId], [CountInPack], [UnitTypeId], [MinimalCount], [Description], [Image], [Price]) VALUES (45, N'Резинка цветной 0x1', 5, 8, 1, 32, NULL, NULL, 47198)
INSERT [dbo].[Material] ([MaterialId], [MaterialName], [MaterialTypeId], [CountInPack], [UnitTypeId], [MinimalCount], [Description], [Image], [Price]) VALUES (46, N'Вата розовый 3x3', 1, 10, 1, 31, NULL, NULL, 2517)
INSERT [dbo].[Material] ([MaterialId], [MaterialName], [MaterialTypeId], [CountInPack], [UnitTypeId], [MinimalCount], [Description], [Image], [Price]) VALUES (47, N'Резинка цветной 0x2', 5, 10, 1, 31, NULL, NULL, 55495)
INSERT [dbo].[Material] ([MaterialId], [MaterialName], [MaterialTypeId], [CountInPack], [UnitTypeId], [MinimalCount], [Description], [Image], [Price]) VALUES (48, N'Вата серый 3x0', 1, 8, 2, 32, NULL, NULL, 49181)
INSERT [dbo].[Material] ([MaterialId], [MaterialName], [MaterialTypeId], [CountInPack], [UnitTypeId], [MinimalCount], [Description], [Image], [Price]) VALUES (49, N'Резинка серый 3x3', 5, 4, 1, 8, NULL, NULL, 51550)
INSERT [dbo].[Material] ([MaterialId], [MaterialName], [MaterialTypeId], [CountInPack], [UnitTypeId], [MinimalCount], [Description], [Image], [Price]) VALUES (50, N'Резинка серый 0x0', 5, 7, 1, 20, NULL, NULL, 43414)
SET IDENTITY_INSERT [dbo].[Material] OFF
GO
SET IDENTITY_INSERT [dbo].[MaterialType] ON 

INSERT [dbo].[MaterialType] ([MaterialTypeId], [MaterialTypeName]) VALUES (1, N' Вата')
INSERT [dbo].[MaterialType] ([MaterialTypeId], [MaterialTypeName]) VALUES (2, N' Ткань')
INSERT [dbo].[MaterialType] ([MaterialTypeId], [MaterialTypeName]) VALUES (3, N' Стержень')
INSERT [dbo].[MaterialType] ([MaterialTypeId], [MaterialTypeName]) VALUES (4, N' Силикон')
INSERT [dbo].[MaterialType] ([MaterialTypeId], [MaterialTypeName]) VALUES (5, N' Резинка')
SET IDENTITY_INSERT [dbo].[MaterialType] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (1, N'59922', N'Полумаска "Moon" (Элипс) P3', 1, NULL, N'5fb128cd1e2b9.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 4, NULL, 2690)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (2, N'5028556', N'Повязка санитарно–гигиеническая многоразовая с лог', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 9, NULL, 49)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (3, N'5028272', N'Повязка санитарно–гигиеническая многоразовая черна', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 4, NULL, 59)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (4, N'5028247', N'Маска одноразовая трехслойная из нетканого материа', 2, NULL, N'5fb128cc69235.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 2, NULL, 6)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (5, N'5028229', N'Повязка санитарно–гигиеническая многоразовая с при', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 10, NULL, 49)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (6, N'5030981', N'Маска из нетканого материала KN95', 3, NULL, N'5fb128cc719a6.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 5, NULL, 59)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (7, N'5029784', N'Маска из нетканого материала с клапаном KN95', 3, NULL, N'5fb128cc753e3.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 4, NULL, 79)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (8, N'58953', N'Респиратор У-2К', 3, NULL, N'5fb128cc7941f.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 6, NULL, 95)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (9, N'5026662', N'Респиратор 9101 FFP1', 4, NULL, N'5fb128cc7d798.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 8, NULL, 189)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (10, N'59043', N'Респиратор противоаэрозольный 9312', 4, NULL, N'5fb128cc80a10.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 7, NULL, 399)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (11, N'58376', N'Респиратор 3M 8112 противоаэрозольный с клапаном в', 4, NULL, N'5fb128cc84474.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 1, NULL, 299)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (12, N'58375', N'Респиратор 3M 8101 противоаэрозольный', 4, NULL, N'5fb128cc87b90.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 149)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (13, N'59324', N'Респиратор "Алина" 110', 4, NULL, N'5fb128cc8b750.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 9, NULL, 129)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (14, N'58827', N'Респиратор "Алина" 100', 4, NULL, N'5fb128cc8f4dd.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 8, NULL, 99)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (15, N'59898', N'Респиратор "Нева" 109', 4, NULL, N'5fb128cc9414b.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 1, NULL, 129)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (16, N'59474', N'Респиратор "Юлия" 109', 4, NULL, N'5fb128cc97ff4.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 8, NULL, 129)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (17, N'59472', N'Респиратор "Юлия" 119', 4, NULL, N'5fb128cc9bd36.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 7, NULL, 149)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (18, N'5033136', N'Респиратор 3M с клапаном 9162', 4, NULL, N'5fb128cc9f069.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 9, NULL, 349)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (19, N'5028048', N'Респиратор 3M 9152 FFP2', 4, NULL, N'5fb128cca31d9.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 8, NULL, 390)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (20, N'58796', N'Респиратор противоаэрозольный 9322', 4, NULL, N'5fb128cca6910.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 4, NULL, 449)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (21, N'58568', N'Респиратор с клапаном 9926', 4, NULL, N'5fb128cca9d9b.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 5, NULL, 699)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (22, N'58466', N'Респиратор 3M 8102 противоаэрозольный', 4, NULL, N'5fb128ccae21a.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 9, NULL, 199)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (23, N'58445', N'Респиратор 3M 8122', 4, NULL, N'5fb128ccb1958.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 6, NULL, 299)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (24, N'5031919', N'Респиратор M1200VWC FFP2 Delta Plus (Дельта Плюс)', 4, NULL, N'5fb128ccb4e8c.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 8, NULL, 349)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (25, N'5030026', N'Респиратор RK6021', 4, NULL, N'5fb128ccb97a0.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 8, NULL, 290)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (26, N'5030020', N'Респиратор RK6020', 4, NULL, N'5fb128ccbd227.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 5, NULL, 129)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (27, N'5030072', N'Респиратор Алина 210', 4, NULL, N'5fb128ccc1592.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 5, NULL, 290)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (28, N'5030062', N'Респиратор Алина 211', 4, NULL, N'5fb128ccc4a86.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 6, NULL, 290)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (29, N'58826', N'Респиратор "Алина" 200', 4, NULL, N'5fb128ccc9a9e.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 5, NULL, 149)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (30, N'58825', N'Респиратор "Алина" П', 4, NULL, N'5fb128cccdbee.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 5, NULL, 290)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (31, N'58584', N'Респиратор "Алина" АВ', 4, NULL, N'5fb128ccd133c.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 5, NULL, 249)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (32, N'59736', N'Респиратор "Нева" 210', 4, NULL, N'5fb128ccd5dc2.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 3, NULL, 109)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (33, N'59735', N'Респиратор "Нева" 200', 4, NULL, N'5fb128ccd8ff6.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 3, NULL, 79)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (34, N'5027238', N'Респиратор полумаска НРЗ-0102 FFP2 NR D', 4, NULL, N'5fb128ccdca1e.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 4, NULL, 149)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (35, N'59475', N'Респиратор "Юлия" 219', 4, NULL, N'5fb128cce0042.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 8, NULL, 249)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (36, N'59473', N'Респиратор "Юлия" 215', 4, NULL, N'5fb128cce39fa.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 4, NULL, 349)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (37, N'59470', N'Респиратор "Юлия" 209', 4, NULL, N'5fb128cce7971.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 8, NULL, 179)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (38, N'5031924', N'Респиратор M1300V2С FFP3 Delta Plus (Дельта Плюс)', 4, NULL, N'5fb128cceae7c.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 2, NULL, 490)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (39, N'5030022', N'Респиратор RK6030', 4, NULL, N'5fb128ccef256.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 6, NULL, 390)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (40, N'58850', N'Респиратор "Алина" 310', 4, NULL, N'5fb128ccf3dd2.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 6, NULL, 490)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (41, N'59739', N'Респиратор "Нева" 310', 4, NULL, N'5fb128cd0544b.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 3, NULL, 289)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (42, N'59471', N'Респиратор "Юлия" 319', 4, NULL, N'5fb128cd08e3f.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 8, NULL, 490)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (43, N'5027980', N'Полумаска "Elipse" (Элипс) ABEK1P3', 4, NULL, N'5fb128cd0d0b1.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1, NULL, 4990)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (44, N'5027965', N'Полумаска "Elipse" (Элипс) A2P3', 1, NULL, N'5fb128cd10ec2.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 2, NULL, 4490)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (45, N'5027958', N'Полумаска "Elipse" (Элипс) А1', 1, NULL, N'5fb128cd157f9.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 4, NULL, 3190)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (46, N'59923', N'Полумаска "Elipse" (Элипс) P3 (анти-запах)', 1, NULL, N'5fb128cd19baa.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 9, NULL, 2790)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (47, N'59922', N'Полумаска "Elipse" (Элипс) P3', 1, NULL, N'5fb128cd1e2b9.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 4, NULL, 2690)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (48, N'59921', N'Полумаска "Elipse" (Элипс) A1P3', 1, NULL, N'5fb128cd2215f.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 9, NULL, 5690)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (49, N'59920', N'Полумаска "Elipse" (Элипс) ABEK1', 1, NULL, N'5fb128cd268bf.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 8, NULL, 5690)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (50, N'58974', N'Респиратор-полумаска "3М" серия 6000', 1, NULL, N'5fb128cd2ab69.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 9, NULL, 3490)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (51, N'59334', N'Респиратор-полумаска Исток 300/400', 1, NULL, N'5fb128cd2ef7a.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 7, NULL, 490)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (52, N'4969295', N'Комплект для защиты дыхания J-SET 6500 JETA', 1, NULL, N'5fb128cd331c4.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 4, NULL, 2490)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (53, N'5029610', N'Лицевая маска Elipse Integra А1P3', 1, NULL, N'5fb128cd3674d.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 10, NULL, 9890)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (54, N'5029091', N'Лицевая маска Elipse Integra P3', 5, NULL, N'5fb128cd3af5c.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 9, NULL, 7490)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (55, N'60360', N'Лицевая маска Elipse Integra (Элипс интегра) P3 (а', 5, NULL, N'5fb128cd3e7e4.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 4, NULL, 7590)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (56, N'4958042', N'Полнолицевая маска 5950 JETA', 5, NULL, N'5fb128cd41ece.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 5, NULL, 11490)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (57, N'59271', N'Сменный патрон с фильтром 6054 для масок и полумас', 6, NULL, N'5fb128cd4672c.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 2, NULL, 1890)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (58, N'59253', N'Сменный патрон с фильтром 6059 для масок и полумас', 7, NULL, N'5fb128cd4c99d.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 9, NULL, 2290)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (59, N'5028197', N'Сменный фильтр 6510 A1 JETA', 7, NULL, N'5fb128cd50a70.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 9, NULL, 990)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (60, N'5027978', N'Запасные фильтры к полумаске Elipse ABEK1P3', 7, NULL, N'5fb128cd5433e.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 6, NULL, 2990)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (61, N'5027961', N'Запасные фильтры к полумаске Elipse A2P3', 8, NULL, N'5fb128cd5838d.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 9, NULL, 2590)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (62, N'5027921', N'Запасные фильтры к полумаске Elipse (Элипс) А1', 8, NULL, N'5fb128cd5bb7d.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 4, NULL, 1290)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (63, N'4958040', N'Сменный фильтр 6541 ABEK1 JETA', 7, NULL, N'5fb128cd5ff78.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 6, NULL, 1290)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (64, N'59919', N'Запасные фильтры к полумаске "Elipse" (Элипс) P3 (', 8, NULL, N'5fb128cd63666.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 4, NULL, 1690)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (65, N'59918', N'Запасные фильтры к полумаске "Elipse" (Элипс) P3', 8, NULL, N'5fb128cd66df6.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 7, NULL, 1390)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (66, N'59917', N'Запасные фильтры к полумаске "Elipse" (Элипс) A1P3', 8, NULL, N'5fb128cd6a2b6.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 3, NULL, 2190)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (67, N'59916', N'Запасные фильтры к полумаске "Elipse" (Элипс) ABEK', 8, NULL, N'5fb128cd6e4ee.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 10, NULL, 2590)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (68, N'59708', N'Запасные фильтры (пара) АВЕ1 к полумаскам "Адванте', 8, NULL, N'5fb128cd71db3.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 3, NULL, 1490)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (69, N'67661', N'Запасной фильтр к полумаске Исток-300 (РПГ-67) мар', 8, NULL, N'5fb128cd7518c.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 9, NULL, 110)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (70, N'67660', N'Запасной фильтр к полумаске Исток-300 (РПГ-67) мар', 8, NULL, N'5fb128cd78fce.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 1, NULL, 110)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (71, N'4958041', N'Держатель предфильтра 5101 JETA', 8, NULL, N'5fb128cd7d2cd.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 7, NULL, 199)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (72, N'58431', N'Держатели предфильтра для масок и полумасок "3М" с', 9, NULL, N'5fb128cd80a06.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 264)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (73, N'4958039', N'Предфильтр Р2 (4 шт) 6020 JETA', 9, NULL, N'5fb128cd8417e.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 7, NULL, 380)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (74, N'58917', N'Предфильтры для масок и полумасок "3М" серии 6000', 10, NULL, N'5fb128cd8818d.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 3, NULL, 409)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (75, N'59324', N'Респиратор "Мадонна" 110', 4, NULL, N'5fb128cc8b750.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 9, NULL, 129)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (76, N'58827', N'Респиратор "Витязь" 100', 4, NULL, N'5fb128cc8f4dd.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 8, NULL, 99)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (77, N'59898', N'Респиратор "Серёга" 109', 4, NULL, N'5fb128cc9414b.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 1, NULL, 129)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (78, N'59474', N'Респиратор "Амперметр" 109', 4, NULL, N'5fb128cc97ff4.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 8, NULL, 129)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (79, N'59324', N'Респиратор "Фирюза" 110', 4, NULL, N'5fb128cc8b750.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 9, NULL, 129)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (80, N'58827', N'Респиратор "Красный" 100', 4, NULL, N'5fb128cc8f4dd.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 8, NULL, 99)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (81, N'59898', N'Респиратор "Волга" 109', 4, NULL, N'5fb128cc9414b.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 1, NULL, 129)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (82, N'59474', N'Респиратор "Мадонна" 220', 4, NULL, N'5fb128cc97ff4.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 8, NULL, 129)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (83, N'59324', N'Респиратор "Витязь" 220', 4, NULL, N'5fb128cc8b750.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 9, NULL, 129)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (84, N'58827', N'Респиратор "Серёга" 220', 4, NULL, N'5fb128cc8f4dd.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 8, NULL, 99)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (85, N'59898', N'Респиратор "Амперметр" 220', 4, NULL, N'5fb128cc9414b.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 1, NULL, 129)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (86, N'59474', N'Респиратор "Фирюза" 220', 4, NULL, N'5fb128cc97ff4.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 8, NULL, 129)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (87, N'59324', N'Респиратор "Красный" 220', 4, NULL, N'5fb128cc8b750.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 9, NULL, 129)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (88, N'58827', N'Респиратор "Волга" 220', 4, NULL, N'5fb128cc8f4dd.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 8, NULL, 99)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (89, N'5027980', N'Полумаска "Sunset" ABEK1P3', 4, NULL, N'5fb128cd0d0b1.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1, NULL, 4990)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (90, N'5027965', N'Полумаска "Sunset" A2P3', 1, NULL, N'5fb128cd10ec2.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 2, NULL, 4490)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (91, N'5027958', N'Полумаска "Sunset" А1', 1, NULL, N'5fb128cd157f9.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 4, NULL, 3190)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (92, N'59923', N'Полумаска "Sunset" P3 (анти-запах)', 1, NULL, N'5fb128cd19baa.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 9, NULL, 2790)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (93, N'59922', N'Полумаска "Sunset" (Элипс) P3', 1, NULL, N'5fb128cd1e2b9.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 4, NULL, 2690)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (94, N'59921', N'Полумаска "Sunset" A1P3', 1, NULL, N'5fb128cd2215f.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 9, NULL, 5690)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (95, N'59920', N'Полумаска "Sunset" ABEK1', 1, NULL, N'5fb128cd268bf.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 8, NULL, 5690)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (96, N'59920', N'Полумаска "Moon" ABEK1', 1, NULL, N'5fb128cd268bf.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 8, NULL, 5690)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (97, N'5027980', N'Полумаска "Moon" ABEK1P3', 4, NULL, N'5fb128cd0d0b1.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1, NULL, 4990)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (98, N'5027965', N'Полумаска "Moon" A2P3', 1, NULL, N'5fb128cd10ec2.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 2, NULL, 4490)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (99, N'5027958', N'Полумаска "Moon" А1', 1, NULL, N'5fb128cd157f9.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 4, NULL, 3190)
GO
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [Certificate], [StandartNum], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (100, N'59923', N'Полумаска "Moon" P3 (анти-запах)', 1, NULL, N'5fb128cd19baa.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 9, NULL, 2790)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductType] ON 

INSERT [dbo].[ProductType] ([ProductTypeId], [ProductTypeName]) VALUES (1, N'Полумаски')
INSERT [dbo].[ProductType] ([ProductTypeId], [ProductTypeName]) VALUES (2, N'Повязки')
INSERT [dbo].[ProductType] ([ProductTypeId], [ProductTypeName]) VALUES (3, N'Маски')
INSERT [dbo].[ProductType] ([ProductTypeId], [ProductTypeName]) VALUES (4, N'Респираторы')
INSERT [dbo].[ProductType] ([ProductTypeId], [ProductTypeName]) VALUES (5, N'На лицо')
INSERT [dbo].[ProductType] ([ProductTypeId], [ProductTypeName]) VALUES (6, N'Полнолицевые')
INSERT [dbo].[ProductType] ([ProductTypeId], [ProductTypeName]) VALUES (7, N'Сменные части')
INSERT [dbo].[ProductType] ([ProductTypeId], [ProductTypeName]) VALUES (8, N'Запасные части')
INSERT [dbo].[ProductType] ([ProductTypeId], [ProductTypeName]) VALUES (9, N'Держители')
INSERT [dbo].[ProductType] ([ProductTypeId], [ProductTypeName]) VALUES (10, N'Предфильтры')
SET IDENTITY_INSERT [dbo].[ProductType] OFF
GO
SET IDENTITY_INSERT [dbo].[UnitType] ON 

INSERT [dbo].[UnitType] ([UnitTypeId], [UnitTypeName]) VALUES (1, N' м')
INSERT [dbo].[UnitType] ([UnitTypeId], [UnitTypeName]) VALUES (2, N' кг')
SET IDENTITY_INSERT [dbo].[UnitType] OFF
GO
SET IDENTITY_INSERT [dbo].[Workshop] ON 

INSERT [dbo].[Workshop] ([WorkshopId], [WorkshopName]) VALUES (1, N'1')
INSERT [dbo].[Workshop] ([WorkshopId], [WorkshopName]) VALUES (2, N'2')
INSERT [dbo].[Workshop] ([WorkshopId], [WorkshopName]) VALUES (3, N'3')
INSERT [dbo].[Workshop] ([WorkshopId], [WorkshopName]) VALUES (4, N'4')
INSERT [dbo].[Workshop] ([WorkshopId], [WorkshopName]) VALUES (5, N'5')
INSERT [dbo].[Workshop] ([WorkshopId], [WorkshopName]) VALUES (6, N'6')
INSERT [dbo].[Workshop] ([WorkshopId], [WorkshopName]) VALUES (7, N'7')
INSERT [dbo].[Workshop] ([WorkshopId], [WorkshopName]) VALUES (8, N'8')
INSERT [dbo].[Workshop] ([WorkshopId], [WorkshopName]) VALUES (9, N'9')
INSERT [dbo].[Workshop] ([WorkshopId], [WorkshopName]) VALUES (10, N'10')
SET IDENTITY_INSERT [dbo].[Workshop] OFF
GO
ALTER TABLE [dbo].[Agent]  WITH CHECK ADD  CONSTRAINT [FK_Agents_AgentTypes] FOREIGN KEY([AgentTypeId])
REFERENCES [dbo].[AgentType] ([AgentTypeId])
GO
ALTER TABLE [dbo].[Agent] CHECK CONSTRAINT [FK_Agents_AgentTypes]
GO
ALTER TABLE [dbo].[AgentPoint]  WITH CHECK ADD  CONSTRAINT [FK_AgentPoints_Agents] FOREIGN KEY([AgentId])
REFERENCES [dbo].[Agent] ([AgentId])
GO
ALTER TABLE [dbo].[AgentPoint] CHECK CONSTRAINT [FK_AgentPoints_Agents]
GO
ALTER TABLE [dbo].[Material]  WITH CHECK ADD  CONSTRAINT [FK_Materials_MaterialTypes] FOREIGN KEY([MaterialTypeId])
REFERENCES [dbo].[MaterialType] ([MaterialTypeId])
GO
ALTER TABLE [dbo].[Material] CHECK CONSTRAINT [FK_Materials_MaterialTypes]
GO
ALTER TABLE [dbo].[Material]  WITH CHECK ADD  CONSTRAINT [FK_Materials_UnitTypes] FOREIGN KEY([UnitTypeId])
REFERENCES [dbo].[UnitType] ([UnitTypeId])
GO
ALTER TABLE [dbo].[Material] CHECK CONSTRAINT [FK_Materials_UnitTypes]
GO
ALTER TABLE [dbo].[MaterialSupplier]  WITH CHECK ADD  CONSTRAINT [FK_MaterialSuppliers_Materials] FOREIGN KEY([MaterialId])
REFERENCES [dbo].[Material] ([MaterialId])
GO
ALTER TABLE [dbo].[MaterialSupplier] CHECK CONSTRAINT [FK_MaterialSuppliers_Materials]
GO
ALTER TABLE [dbo].[MaterialSupplier]  WITH CHECK ADD  CONSTRAINT [FK_MaterialSuppliers_Suppliers] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Supplier] ([SupplierId])
GO
ALTER TABLE [dbo].[MaterialSupplier] CHECK CONSTRAINT [FK_MaterialSuppliers_Suppliers]
GO
ALTER TABLE [dbo].[MaterialWarehouse]  WITH CHECK ADD  CONSTRAINT [FK_MaterialWarehouse_Materials1] FOREIGN KEY([MaterialId])
REFERENCES [dbo].[Material] ([MaterialId])
GO
ALTER TABLE [dbo].[MaterialWarehouse] CHECK CONSTRAINT [FK_MaterialWarehouse_Materials1]
GO
ALTER TABLE [dbo].[MaterialWarehouse]  WITH CHECK ADD  CONSTRAINT [FK_MaterialWarehouse_OperationTypes] FOREIGN KEY([OperationTypeId])
REFERENCES [dbo].[OperationType] ([OperationTypeId])
GO
ALTER TABLE [dbo].[MaterialWarehouse] CHECK CONSTRAINT [FK_MaterialWarehouse_OperationTypes]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Agents] FOREIGN KEY([AgentId])
REFERENCES [dbo].[Agent] ([AgentId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Orders_Agents]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderProducts_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_OrderProducts_Products]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_Sell_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_Sell_Orders]
GO
ALTER TABLE [dbo].[PriceHistory]  WITH CHECK ADD  CONSTRAINT [FK_AgentProducts_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[PriceHistory] CHECK CONSTRAINT [FK_AgentProducts_Products]
GO
ALTER TABLE [dbo].[PriorityHistory]  WITH CHECK ADD  CONSTRAINT [FK_PriorityHistories_Agents] FOREIGN KEY([AgentId])
REFERENCES [dbo].[Agent] ([AgentId])
GO
ALTER TABLE [dbo].[PriorityHistory] CHECK CONSTRAINT [FK_PriorityHistories_Agents]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductTypes] FOREIGN KEY([ProductTypeId])
REFERENCES [dbo].[ProductType] ([ProductTypeId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Products_ProductTypes]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Products_Workshops] FOREIGN KEY([WorkshopId])
REFERENCES [dbo].[Workshop] ([WorkshopId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Products_Workshops]
GO
ALTER TABLE [dbo].[ProductMaterial]  WITH CHECK ADD  CONSTRAINT [FK_ProductMaterials_Materials] FOREIGN KEY([MaterialId])
REFERENCES [dbo].[Material] ([MaterialId])
GO
ALTER TABLE [dbo].[ProductMaterial] CHECK CONSTRAINT [FK_ProductMaterials_Materials]
GO
ALTER TABLE [dbo].[ProductMaterial]  WITH CHECK ADD  CONSTRAINT [FK_ProductMaterials_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[ProductMaterial] CHECK CONSTRAINT [FK_ProductMaterials_Products]
GO
ALTER TABLE [dbo].[SellHistory]  WITH CHECK ADD  CONSTRAINT [FK_SellHistories_Agents] FOREIGN KEY([AgentId])
REFERENCES [dbo].[Agent] ([AgentId])
GO
ALTER TABLE [dbo].[SellHistory] CHECK CONSTRAINT [FK_SellHistories_Agents]
GO
ALTER TABLE [dbo].[SellHistory]  WITH CHECK ADD  CONSTRAINT [FK_SellHistories_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[SellHistory] CHECK CONSTRAINT [FK_SellHistories_Products]
GO
ALTER TABLE [dbo].[Supplier]  WITH CHECK ADD  CONSTRAINT [FK_Suppliers_SupplierTypes] FOREIGN KEY([SupplierTypeId])
REFERENCES [dbo].[SupplierType] ([SupplierTypeId])
GO
ALTER TABLE [dbo].[Supplier] CHECK CONSTRAINT [FK_Suppliers_SupplierTypes]
GO
ALTER TABLE [dbo].[Worker]  WITH CHECK ADD  CONSTRAINT [FK_Workers_Specialities] FOREIGN KEY([SpecialityId])
REFERENCES [dbo].[Speciality] ([SpecialityId])
GO
ALTER TABLE [dbo].[Worker] CHECK CONSTRAINT [FK_Workers_Specialities]
GO
ALTER TABLE [dbo].[WorkerDoor]  WITH CHECK ADD  CONSTRAINT [FK_WorkerDoors_Doors] FOREIGN KEY([DoorId])
REFERENCES [dbo].[Door] ([DoorId])
GO
ALTER TABLE [dbo].[WorkerDoor] CHECK CONSTRAINT [FK_WorkerDoors_Doors]
GO
ALTER TABLE [dbo].[WorkerDoor]  WITH CHECK ADD  CONSTRAINT [FK_WorkerDoors_Worker] FOREIGN KEY([WorkerId])
REFERENCES [dbo].[Worker] ([WorkerId])
GO
ALTER TABLE [dbo].[WorkerDoor] CHECK CONSTRAINT [FK_WorkerDoors_Worker]
GO
ALTER TABLE [dbo].[WorkerWorkshop]  WITH CHECK ADD  CONSTRAINT [FK_WorkerWorkshops_Worker] FOREIGN KEY([WorkerId])
REFERENCES [dbo].[Worker] ([WorkerId])
GO
ALTER TABLE [dbo].[WorkerWorkshop] CHECK CONSTRAINT [FK_WorkerWorkshops_Worker]
GO
ALTER TABLE [dbo].[WorkerWorkshop]  WITH CHECK ADD  CONSTRAINT [FK_WorkerWorkshops_Workshops] FOREIGN KEY([WorkshopId])
REFERENCES [dbo].[Workshop] ([WorkshopId])
GO
ALTER TABLE [dbo].[WorkerWorkshop] CHECK CONSTRAINT [FK_WorkerWorkshops_Workshops]
GO
USE [master]
GO
ALTER DATABASE [user57] SET  READ_WRITE 
GO
