USE [master]
GO
/****** Object:  Database [ProjectPRJ]    Script Date: 11/6/2021 5:27:25 PM ******/
CREATE DATABASE [ProjectPRJ]
 
GO
ALTER DATABASE [ProjectPRJ] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProjectPRJ].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProjectPRJ] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProjectPRJ] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProjectPRJ] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProjectPRJ] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProjectPRJ] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProjectPRJ] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProjectPRJ] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProjectPRJ] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProjectPRJ] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProjectPRJ] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProjectPRJ] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProjectPRJ] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProjectPRJ] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProjectPRJ] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProjectPRJ] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ProjectPRJ] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProjectPRJ] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProjectPRJ] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProjectPRJ] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProjectPRJ] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProjectPRJ] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProjectPRJ] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProjectPRJ] SET RECOVERY FULL 
GO
ALTER DATABASE [ProjectPRJ] SET  MULTI_USER 
GO
ALTER DATABASE [ProjectPRJ] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProjectPRJ] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProjectPRJ] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProjectPRJ] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ProjectPRJ] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ProjectPRJ', N'ON'
GO
USE [ProjectPRJ]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 11/6/2021 5:27:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[username] [varchar](150) NOT NULL,
	[password] [varchar](150) NOT NULL,
	[displayname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Apartment]    Script Date: 11/6/2021 5:27:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Apartment](
	[ApartmentID] [nvarchar](10) NOT NULL,
	[BuildID] [int] NOT NULL,
	[AmountPeople] [int] NOT NULL,
 CONSTRAINT [PK_Apartment] PRIMARY KEY CLUSTERED 
(
	[ApartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Building]    Script Date: 11/6/2021 5:27:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Building](
	[BuildID] [int] NOT NULL,
	[Name] [nvarchar](10) NOT NULL,
	[NumberOfFloors] [int] NOT NULL,
 CONSTRAINT [PK_Building] PRIMARY KEY CLUSTERED 
(
	[BuildID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[F1F2Management]    Script Date: 11/6/2021 5:27:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[F1F2Management](
	[ID] [int] NOT NULL,
	[QuarantineStartDate] [date] NOT NULL,
 CONSTRAINT [PK_F1F2Management] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Feature]    Script Date: 11/6/2021 5:27:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Feature](
	[fid] [int] NOT NULL,
	[url] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Feature] PRIMARY KEY CLUSTERED 
(
	[fid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Group]    Script Date: 11/6/2021 5:27:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Group](
	[gid] [int] NOT NULL,
	[gname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[gid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GroupAccount]    Script Date: 11/6/2021 5:27:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GroupAccount](
	[gid] [int] NOT NULL,
	[username] [varchar](150) NOT NULL,
 CONSTRAINT [PK_GroupAccount] PRIMARY KEY CLUSTERED 
(
	[gid] ASC,
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GroupFeature]    Script Date: 11/6/2021 5:27:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupFeature](
	[gid] [int] NOT NULL,
	[fid] [int] NOT NULL,
 CONSTRAINT [PK_GroupFeature] PRIMARY KEY CLUSTERED 
(
	[gid] ASC,
	[fid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Resident]    Script Date: 11/6/2021 5:27:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resident](
	[ID] [int] NOT NULL,
	[ApartmentID] [nvarchar](10) NOT NULL,
	[FullName] [nvarchar](150) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[HomeTown] [nvarchar](150) NOT NULL,
	[Phone] [int] NOT NULL,
 CONSTRAINT [PK_Resident] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vaccination]    Script Date: 11/6/2021 5:27:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vaccination](
	[ID] [int] NOT NULL,
	[1 injection] [bit] NULL,
	[1injectionDate] [date] NULL,
	[2 injection] [bit] NULL,
	[2injectionDate] [date] NULL,
 CONSTRAINT [PK_Vaccination] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Account] ([username], [password], [displayname]) VALUES (N'admin', N'admin', N'Boss')
INSERT [dbo].[Account] ([username], [password], [displayname]) VALUES (N'teacher', N'sonnt', N'Teacher Sonnt Handsome')
INSERT [dbo].[Account] ([username], [password], [displayname]) VALUES (N'tung', N'1234', N'Nguyen Tung')
INSERT [dbo].[Account] ([username], [password], [displayname]) VALUES (N'viewer', N'1111', N'Viewer')
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'A101', 1, 5)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'A102', 1, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'A103', 1, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'A104', 1, 4)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'A105', 1, 3)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'A106', 1, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'A201', 1, 3)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'A202', 1, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'A203', 1, 4)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'A204', 1, 1)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'A205', 1, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'A206', 1, 3)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'A301', 1, 3)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'A302', 1, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'A303', 1, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'A304', 1, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'A305', 1, 1)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'A306', 1, 3)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'A401', 1, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'A402', 1, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'A403', 1, 3)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'A404', 1, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'A405', 1, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'A406', 1, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'A501', 1, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'A502', 1, 1)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'A503', 1, 3)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'A504', 1, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'A505', 1, 1)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'A506', 1, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'B101', 2, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'B102', 2, 3)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'B103', 2, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'B104', 2, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'B105', 2, 1)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'B106', 2, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'B201', 2, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'B202', 2, 1)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'B203', 2, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'B204', 2, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'B205', 2, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'B206', 2, 3)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'B301', 2, 1)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'B302', 2, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'B303', 2, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'B304', 2, 3)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'B305', 2, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'B306', 2, 1)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'B401', 2, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'B402', 2, 3)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'B403', 2, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'B404', 2, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'B405', 2, 1)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'B406', 2, 1)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'B501', 2, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'B502', 2, 1)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'B503', 2, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'B504', 2, 1)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'B505', 2, 1)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'B506', 2, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'C101', 3, 1)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'C102', 3, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'C103', 3, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'C104', 3, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'C105', 3, 1)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'C106', 3, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'C201', 3, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'C202', 3, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'C203', 3, 1)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'C204', 3, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'C205', 3, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'C206', 3, 1)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'C301', 3, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'C302', 3, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'C303', 3, 1)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'C304', 3, 3)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'C305', 3, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'C306', 3, 1)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'C401', 3, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'C402', 3, 1)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'C403', 3, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'C404', 3, 1)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'C405', 3, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'C406', 3, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'C501', 3, 1)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'C502', 3, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'C503', 3, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'C504', 3, 1)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'C505', 3, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'C506', 3, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'D101', 4, 1)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'D102', 4, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'D103', 4, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'D104', 4, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'D105', 4, 1)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'D106', 4, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'D201', 4, 1)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'D202', 4, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'D203', 4, 1)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'D204', 4, 2)
GO
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'D205', 4, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'D206', 4, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'D301', 4, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'D302', 4, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'D303', 4, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'D304', 4, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'D305', 4, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'D306', 4, 1)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'D401', 4, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'D402', 4, 1)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'D403', 4, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'D404', 4, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'D405', 4, 1)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'D406', 4, 3)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'D501', 4, 3)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'D502', 4, 1)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'D503', 4, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'D504', 4, 2)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'D505', 4, 1)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildID], [AmountPeople]) VALUES (N'D506', 4, 5)
INSERT [dbo].[Building] ([BuildID], [Name], [NumberOfFloors]) VALUES (1, N'Block A', 5)
INSERT [dbo].[Building] ([BuildID], [Name], [NumberOfFloors]) VALUES (2, N'Block B', 5)
INSERT [dbo].[Building] ([BuildID], [Name], [NumberOfFloors]) VALUES (3, N'Block C', 5)
INSERT [dbo].[Building] ([BuildID], [Name], [NumberOfFloors]) VALUES (4, N'Block D', 5)
INSERT [dbo].[F1F2Management] ([ID], [QuarantineStartDate]) VALUES (11523332, CAST(N'2021-10-28' AS Date))
INSERT [dbo].[F1F2Management] ([ID], [QuarantineStartDate]) VALUES (11778516, CAST(N'2021-10-28' AS Date))
INSERT [dbo].[F1F2Management] ([ID], [QuarantineStartDate]) VALUES (12201215, CAST(N'2021-10-30' AS Date))
INSERT [dbo].[F1F2Management] ([ID], [QuarantineStartDate]) VALUES (12604707, CAST(N'2021-10-28' AS Date))
INSERT [dbo].[F1F2Management] ([ID], [QuarantineStartDate]) VALUES (13011442, CAST(N'2021-10-28' AS Date))
INSERT [dbo].[F1F2Management] ([ID], [QuarantineStartDate]) VALUES (17094110, CAST(N'2021-10-28' AS Date))
INSERT [dbo].[F1F2Management] ([ID], [QuarantineStartDate]) VALUES (17507759, CAST(N'2021-10-28' AS Date))
INSERT [dbo].[F1F2Management] ([ID], [QuarantineStartDate]) VALUES (192482129, CAST(N'2021-11-03' AS Date))
INSERT [dbo].[F1F2Management] ([ID], [QuarantineStartDate]) VALUES (1063015013, CAST(N'2021-11-01' AS Date))
INSERT [dbo].[F1F2Management] ([ID], [QuarantineStartDate]) VALUES (1076008712, CAST(N'2021-10-20' AS Date))
INSERT [dbo].[F1F2Management] ([ID], [QuarantineStartDate]) VALUES (1800004593, CAST(N'2021-10-19' AS Date))
INSERT [dbo].[F1F2Management] ([ID], [QuarantineStartDate]) VALUES (1800005462, CAST(N'2021-10-19' AS Date))
INSERT [dbo].[F1F2Management] ([ID], [QuarantineStartDate]) VALUES (1800006029, CAST(N'2021-10-19' AS Date))
INSERT [dbo].[F1F2Management] ([ID], [QuarantineStartDate]) VALUES (1800007979, CAST(N'2021-10-19' AS Date))
INSERT [dbo].[F1F2Management] ([ID], [QuarantineStartDate]) VALUES (1800008648, CAST(N'2021-10-19' AS Date))
INSERT [dbo].[F1F2Management] ([ID], [QuarantineStartDate]) VALUES (1800008843, CAST(N'2021-10-18' AS Date))
INSERT [dbo].[F1F2Management] ([ID], [QuarantineStartDate]) VALUES (1800009081, CAST(N'2021-10-18' AS Date))
INSERT [dbo].[F1F2Management] ([ID], [QuarantineStartDate]) VALUES (1800009122, CAST(N'2021-10-18' AS Date))
INSERT [dbo].[F1F2Management] ([ID], [QuarantineStartDate]) VALUES (1800009484, CAST(N'2021-10-18' AS Date))
INSERT [dbo].[F1F2Management] ([ID], [QuarantineStartDate]) VALUES (1800009612, CAST(N'2021-10-18' AS Date))
INSERT [dbo].[F1F2Management] ([ID], [QuarantineStartDate]) VALUES (1800010187, CAST(N'2021-10-20' AS Date))
INSERT [dbo].[F1F2Management] ([ID], [QuarantineStartDate]) VALUES (1800010377, CAST(N'2021-10-20' AS Date))
INSERT [dbo].[F1F2Management] ([ID], [QuarantineStartDate]) VALUES (1800012260, CAST(N'2021-10-19' AS Date))
INSERT [dbo].[F1F2Management] ([ID], [QuarantineStartDate]) VALUES (1800012636, CAST(N'2021-10-29' AS Date))
INSERT [dbo].[F1F2Management] ([ID], [QuarantineStartDate]) VALUES (1800014422, CAST(N'2021-10-29' AS Date))
INSERT [dbo].[F1F2Management] ([ID], [QuarantineStartDate]) VALUES (1900000028, CAST(N'2021-10-29' AS Date))
INSERT [dbo].[F1F2Management] ([ID], [QuarantineStartDate]) VALUES (1900000123, CAST(N'2021-10-29' AS Date))
INSERT [dbo].[F1F2Management] ([ID], [QuarantineStartDate]) VALUES (1900008626, CAST(N'2021-10-29' AS Date))
INSERT [dbo].[F1F2Management] ([ID], [QuarantineStartDate]) VALUES (1900009059, CAST(N'2021-10-25' AS Date))
INSERT [dbo].[F1F2Management] ([ID], [QuarantineStartDate]) VALUES (1900011492, CAST(N'2021-10-25' AS Date))
INSERT [dbo].[F1F2Management] ([ID], [QuarantineStartDate]) VALUES (1900011759, CAST(N'2021-10-25' AS Date))
INSERT [dbo].[F1F2Management] ([ID], [QuarantineStartDate]) VALUES (1900012457, CAST(N'2021-10-25' AS Date))
INSERT [dbo].[F1F2Management] ([ID], [QuarantineStartDate]) VALUES (1900012661, CAST(N'2021-10-25' AS Date))
INSERT [dbo].[F1F2Management] ([ID], [QuarantineStartDate]) VALUES (1900013398, CAST(N'2021-10-25' AS Date))
INSERT [dbo].[F1F2Management] ([ID], [QuarantineStartDate]) VALUES (1900013522, CAST(N'2021-10-26' AS Date))
INSERT [dbo].[F1F2Management] ([ID], [QuarantineStartDate]) VALUES (1900013580, CAST(N'2021-10-26' AS Date))
INSERT [dbo].[F1F2Management] ([ID], [QuarantineStartDate]) VALUES (1900016141, CAST(N'2021-10-26' AS Date))
INSERT [dbo].[F1F2Management] ([ID], [QuarantineStartDate]) VALUES (1900018252, CAST(N'2021-10-26' AS Date))
INSERT [dbo].[F1F2Management] ([ID], [QuarantineStartDate]) VALUES (1900018963, CAST(N'2021-10-26' AS Date))
INSERT [dbo].[F1F2Management] ([ID], [QuarantineStartDate]) VALUES (1900019259, CAST(N'2021-10-26' AS Date))
INSERT [dbo].[F1F2Management] ([ID], [QuarantineStartDate]) VALUES (2000004187, CAST(N'2021-10-26' AS Date))
INSERT [dbo].[F1F2Management] ([ID], [QuarantineStartDate]) VALUES (2000005137, CAST(N'2021-10-26' AS Date))
INSERT [dbo].[F1F2Management] ([ID], [QuarantineStartDate]) VALUES (2000009018, CAST(N'2021-10-27' AS Date))
INSERT [dbo].[F1F2Management] ([ID], [QuarantineStartDate]) VALUES (2000009573, CAST(N'2021-10-27' AS Date))
INSERT [dbo].[F1F2Management] ([ID], [QuarantineStartDate]) VALUES (2000010096, CAST(N'2021-10-27' AS Date))
INSERT [dbo].[Feature] ([fid], [url]) VALUES (1, N'/resident/insertresident')
INSERT [dbo].[Feature] ([fid], [url]) VALUES (2, N'/resident/insertf1f2')
INSERT [dbo].[Feature] ([fid], [url]) VALUES (3, N'/resident/updateresident')
INSERT [dbo].[Feature] ([fid], [url]) VALUES (4, N'/resident/updatef1f2')
INSERT [dbo].[Feature] ([fid], [url]) VALUES (5, N'/resident/deleteresident')
INSERT [dbo].[Feature] ([fid], [url]) VALUES (6, N'/resident/deletef1f2')
INSERT [dbo].[Group] ([gid], [gname]) VALUES (1, N'Admin')
INSERT [dbo].[Group] ([gid], [gname]) VALUES (2, N'Mod')
INSERT [dbo].[Group] ([gid], [gname]) VALUES (3, N'Viewer')
INSERT [dbo].[GroupAccount] ([gid], [username]) VALUES (1, N'admin')
INSERT [dbo].[GroupAccount] ([gid], [username]) VALUES (1, N'teacher')
INSERT [dbo].[GroupAccount] ([gid], [username]) VALUES (2, N'tung')
INSERT [dbo].[GroupAccount] ([gid], [username]) VALUES (3, N'viewer')
INSERT [dbo].[GroupFeature] ([gid], [fid]) VALUES (1, 1)
INSERT [dbo].[GroupFeature] ([gid], [fid]) VALUES (1, 2)
INSERT [dbo].[GroupFeature] ([gid], [fid]) VALUES (1, 3)
INSERT [dbo].[GroupFeature] ([gid], [fid]) VALUES (1, 4)
INSERT [dbo].[GroupFeature] ([gid], [fid]) VALUES (1, 5)
INSERT [dbo].[GroupFeature] ([gid], [fid]) VALUES (1, 6)
INSERT [dbo].[GroupFeature] ([gid], [fid]) VALUES (2, 3)
INSERT [dbo].[GroupFeature] ([gid], [fid]) VALUES (2, 4)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1027280, N'C106', N'Tran Bao Ngan', CAST(N'1992-07-03' AS Date), N'Mong Cai-Quang Ninh', 384827425)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1804750, N'C201', N'Vu Thanh Hai', CAST(N'1989-01-30' AS Date), N'Bim Son-Thanh Hoa', 357966148)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (3378222, N'C106', N'Tran Thi Diem Hang', CAST(N'1992-01-12' AS Date), N'Mong Cai-Quang Ninh', 267625412)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (11318446, N'A406', N'Phan Thi Lan', CAST(N'1992-11-29' AS Date), N'Quoc Oai-Ha Noi', 972952583)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (11523332, N'A402', N'Phung Thi Thanh Tra', CAST(N'2000-03-20' AS Date), N'Cat Ba-Hai Phong', 902031669)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (11669541, N'A104', N'Nguyen Hong Phong', CAST(N'1989-07-22' AS Date), N'Kham Thien-Ha Noi', 913584555)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (11778516, N'B401', N'Vu Ngoc Anh', CAST(N'1993-10-20' AS Date), N'Hoang Mai-Ha Noi', 914383668)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (11808544, N'A103', N'Nguyen Thu Hien', CAST(N'1994-03-20' AS Date), N'Kim Thanh-Hai Duong', 904110302)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (11857941, N'A203', N'Nguyen Thi Thuy', CAST(N'1985-07-29' AS Date), N'Thach That-Ha Noi', 987574171)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (11934547, N'A103', N'Hoang Le Tu', CAST(N'1993-02-12' AS Date), N'Kim Thanh-Hai Duong', 905666621)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (11968867, N'A105 ', N'Tran Duc Thanh Trung', CAST(N'1991-02-20' AS Date), N'TP Bac Ninh', 903484879)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (11980534, N'B306', N'Tran Dinh Trung', CAST(N'1994-05-12' AS Date), N'Bach Mai-Ha Noi', 986192229)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (11987953, N'A106', N'Le Phuong Loan', CAST(N'1994-10-20' AS Date), N'Thuan Thanh-Bac Ninh', 983331216)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (12201215, N'A104', N'Vu Van Anh', CAST(N'1982-05-20' AS Date), N'Dong Da-Ha Noi', 982147678)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (12282100, N'A203', N'Doan Van Thanh', CAST(N'1987-04-29' AS Date), N'Thach That-Ha Noi', 961010168)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (12282102, N'A305', N'Dinh Thi Hoai Thu', CAST(N'1982-09-14' AS Date), N'Ha Dong-Ha Noi', 988841710)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (12339001, N'A206', N'Tran Bao Ngoc', CAST(N'1987-10-22' AS Date), N'TP Hung Yen', 918861986)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (12545317, N'B101', N'Nguyen Viet Ba', CAST(N'1992-11-30' AS Date), N'Kien Xuong-Thai Binh', 986088599)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (12604707, N'A505', N'Tran Le Cam Nhung', CAST(N'1994-04-29' AS Date), N'Ba Dinh-Ha Noi', 946391319)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (12631168, N'A401', N'Nguyen Thi Tuyet Mai', CAST(N'1992-09-20' AS Date), N'TP Hai Phong', 983396786)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (12727196, N'A503', N'Hoang Xuan Phuong', CAST(N'1999-06-19' AS Date), N'Thanh Oai-Ha Noi', 398207890)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (12828998, N'B105', N'Vu Van Tam', CAST(N'1986-04-14' AS Date), N'Long Bien-Ha Noi', 973580028)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (13003029, N'B402', N'Nguyen Thi Thu Huong', CAST(N'1972-11-20' AS Date), N'Vinh Bao-Hai Phong', 904622775)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (13011442, N'A301', N'Le Thi Khanh Huyen', CAST(N'1987-09-10' AS Date), N'My Hao-Hung Yen', 986945527)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (13047358, N'A506', N'Nguyen Thi Hien', CAST(N'1997-09-12' AS Date), N'Me Linh-Ha Noi', 969001331)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (13128735, N'B204', N'Nguyen Thi Thuy Linh', CAST(N'1999-01-01' AS Date), N'TP Cao Bang', 981912818)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (13136965, N'B203', N'Nguyen Cong Thang', CAST(N'1998-12-03' AS Date), N'TP Vinh Phuc', 965175005)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (13162238, N'A302', N'Nguyen Thu Ha', CAST(N'1992-12-01' AS Date), N'Luc Ngan-Bac Giang', 904633059)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (13457054, N'A203', N'Lam Thi Huong Giang', CAST(N'1972-10-19' AS Date), N'Dong Anh-Ha Noi', 904972428)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (13496366, N'B302', N'Nguyen Xuan Anh', CAST(N'1996-12-09' AS Date), N'Thanh Mien-Hai Duong', 368983336)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (13517255, N'A301', N'Vu Thi Thanh Huyen', CAST(N'1989-02-10' AS Date), N'TP Hung Yen', 983994854)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (17094110, N'B201', N'Nguyen Phuc Khanh', CAST(N'2001-02-10' AS Date), N'Hoang Hoa-Thanh Hoa', 986903638)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (17111475, N'B106', N'Dao Anh Dung', CAST(N'1999-05-12' AS Date), N'Nhu Quynh-Hung Yen', 984377511)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (17167901, N'B304', N'Nguyen Kim Huyen', CAST(N'1996-08-20' AS Date), N'Cat Ba-Hai Phong', 332767167)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (17228395, N'C104', N'Le Thu Hảo', CAST(N'1993-12-22' AS Date), N'Cam Pha-Quang Ninh', 964678663)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (17388028, N'A302', N'Nguyen Xuan Duc', CAST(N'1990-01-02' AS Date), N'Luc Ngan-Bac Giang', 934125483)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (17388327, N'A405', N'Do Thi Lan Anh', CAST(N'1992-01-29' AS Date), N'Soc Son-Ha Noi', 942761736)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (17488536, N'A306', N'Tran Tuyet Nhung ', CAST(N'1998-03-23' AS Date), N'Ha Long-Quang Ninh', 965057256)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (17507759, N'B303', N'Nguyen Minh Anh', CAST(N'1994-10-22' AS Date), N'TP Vinh Phuc', 989830426)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (17524500, N'B305', N'Nguyen Thuy Trang', CAST(N'1998-03-30' AS Date), N'Kim Bao-Hai Phong', 965794019)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (18008326, N'C202', N'Vu Dao Thien', CAST(N'1997-02-24' AS Date), N'Quang Xuong-Thanh Hoa', 384827225)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (18014139, N'C202', N'Pham Quang Tao', CAST(N'1997-03-22' AS Date), N'Quang Xuong-Thanh Hoa', 358585126)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (21002567, N'C201', N'Dang Van Huy', CAST(N'1993-02-17' AS Date), N'Bim Son-Thanh Hoa', 397249035)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (22208830, N'B404', N'Nguyen Duc Manh', CAST(N'1987-08-23' AS Date), N'Binh Giang-Hai Duong', 395121027)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (31980921, N'B501', N'Nguyen Thi Bich Ngoc', CAST(N'1993-06-17' AS Date), N'Dong My-Ha Noi', 964377169)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (60994449, N'B402', N'Ngo Khanh Ly', CAST(N'1971-10-02' AS Date), N'Vinh Bao-Hai Phong', 382362538)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (61111673, N'B402', N'Nguyen Minh Hoa', CAST(N'1976-05-12' AS Date), N'Vinh Bao-Hai Phong', 965109112)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (105047123, N'A105', N'Do Thi Kim Anh', CAST(N'1992-03-21' AS Date), N'Hoang Hoa-Thanh Hoa', 396961976)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (106072068, N'A106', N'Le Thi Hai Lan', CAST(N'1994-02-03' AS Date), N'Thuan Thanh-Bac Ninh', 983638900)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (107052405, N'A201', N'Tran Phuong Thao', CAST(N'1996-02-19' AS Date), N'TP Thai Nguyen', 985885080)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (108064852, N'A202', N'Nguyen Thi Quynh Hoa', CAST(N'1998-12-12' AS Date), N'Moc Chau-Son La', 986923545)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (108064856, N'A203', N'La Thi Thom', CAST(N'1973-03-23' AS Date), N'Quoc Oai-Ha Noi', 985193388)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (110067935, N'A205', N'Doan Thi Van Anh', CAST(N'2001-06-23' AS Date), N'TP Thai Binh', 915116292)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (110083253, N'A206', N'Ngo Bich Van', CAST(N'1992-02-27' AS Date), N'Khoai Chau-Hung Yen', 946295656)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (110145412, N'A303', N'Vu Nhu Quynh', CAST(N'1992-09-11' AS Date), N'TP Lao Cai', 838229553)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (110145416, N'A303', N'Pham Thi Ha', CAST(N'1992-02-22' AS Date), N'TP Lao Cai', 975821885)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (110145420, N'A304', N'Ha Thi Hai Yen', CAST(N'1979-03-30' AS Date), N'Cau Giay-Ha Noi', 987666993)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (110145423, N'A304', N'Pham Thi Thuong', CAST(N'1980-04-22' AS Date), N'My Dinh-Ha Noi', 903456880)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (111167397, N'A401', N'Phan Thu Hien', CAST(N'1992-08-22' AS Date), N'TP Hai Phong', 977030117)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (111184773, N'A403', N'Phan Duy Trung', CAST(N'2001-12-02' AS Date), N'Cam Giang-Hai Duong', 977858595)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (111213114, N'B403', N'Do Van Xuan', CAST(N'1993-07-04' AS Date), N'Vinh-Nghe An', 961265389)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (111336938, N'B101', N'Luong Ngoc Cuong', CAST(N'1993-12-22' AS Date), N'Kien Xuong-Thai Binh', 946665955)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (111662579, N'A301', N'Nguyen Thi Tham', CAST(N'1988-08-29' AS Date), N'My Hao-Hung Yen', 985439985)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (112099847, N'B406', N'Nguyen Van Thinh', CAST(N'1999-06-12' AS Date), N'Dong Da-Ha Noi', 933572868)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (112102270, N'A404', N'Tran Mai Phuong', CAST(N'2002-02-10' AS Date), N'Thach That-Ha Noi', 977046006)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (112102274, N'A404', N'Chu Van Dong', CAST(N'2001-03-21' AS Date), N'Thach That-Ha Noi', 983040707)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (112155635, N'A403', N'Nguyen Thi Thu Phuong', CAST(N'2001-04-30' AS Date), N'Cam Giang-Hai Duong', 949559859)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (112155851, N'A501', N'Luu Quang Son', CAST(N'1989-10-23' AS Date), N'Ba Vi-Ha Noi', 344298192)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (112165408, N'A502', N'Vu Thi Hong Phuong', CAST(N'1995-01-22' AS Date), N'Thuong Tin-Ha Noi', 972775698)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (112182524, N'A306', N'Hoang Le Quyen', CAST(N'1999-01-02' AS Date), N'Ha Long-Quang Ninh', 936563899)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (112366418, N'A406', N'Nguyen Thi Phuong', CAST(N'1993-11-22' AS Date), N'Quoc Oai-Ha Noi', 967629119)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (113077452, N'A504', N'Tran Thi Thanh Binh', CAST(N'1996-01-22' AS Date), N'TP Hoa Binh', 912062989)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (113358155, N'B401', N'Bui Van Lin', CAST(N'1992-01-20' AS Date), N'Hoang Mai-Ha Noi', 986459036)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (113458894, N'B403', N'Bui Tien Hoi', CAST(N'1992-12-07' AS Date), N'Vinh-Nghe An', 379862889)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (113494519, N'C105', N'Nguyen Thi Tuyet Nga', CAST(N'1991-05-02' AS Date), N'Uong Bi-Quang Ninh', 986937669)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (114097123, N'B102', N'Nguyen Quang Trung', CAST(N'1991-01-20' AS Date), N'Co Nhue-Ha Noi', 943973480)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (114162352, N'B102', N'Nguyen Thu Phuong', CAST(N'1991-05-01' AS Date), N'My Dinh-Ha Noi', 968010521)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (115030953, N'B103', N'Nguyen Thanh Cong', CAST(N'1990-07-19' AS Date), N'Thanh Oai-Ha Noi', 933292866)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (115134195, N'B104', N'Ta Doan Hoang', CAST(N'1988-01-29' AS Date), N'Hoa Lu-Ninh Binh', 902389686)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (115156353, N'B104', N'Nguyen Manh Cuong', CAST(N'1988-09-12' AS Date), N'Hoa Lu-Ninh Binh', 978309928)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (116002165, N'B106', N'Nguyen Thi Van', CAST(N'1999-07-27' AS Date), N'Nhu Quynh-Hung Yen', 363748758)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (116041253, N'B201', N'Do Phuc Ninh', CAST(N'2000-12-11' AS Date), N'Hoang Hoa-Thanh Hoa', 986807972)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (116166301, N'B202', N'Nguyen Thi Mai Anh', CAST(N'2002-03-12' AS Date), N'Nam Dan-Nghe An', 942468492)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (116167252, N'B203', N'Trinh Phuong Thao', CAST(N'2000-02-10' AS Date), N'TP Vinh Phuc', 963359936)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (116187553, N'B204', N'Nguyen Quang Vu', CAST(N'1999-12-12' AS Date), N'TP Cao Bang', 968038666)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (119847214, N'D506 ', N'Le Thi Thanh Thuy', CAST(N'1999-10-26' AS Date), N'Thuong Tin-Ha Noi', 982134567)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (119847299, N'D501 ', N'Le Thanh Binh', CAST(N'2001-11-21' AS Date), N'Thuong Tin-Ha Noi', 982224353)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (121183202, N'B206', N'Nguyen Le Minh Chau', CAST(N'1989-02-12' AS Date), N'Dong Trieu-Quang Ninh', 989106767)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (122123060, N'B301', N'Hoang Thu Hong', CAST(N'1998-09-22' AS Date), N'Chi Linh-Hai Duong', 815855112)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (123880351, N'B302', N'Hoang The Trung', CAST(N'1997-08-12' AS Date), N'Thanh Mien-Hai Duong', 965989846)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (124960401, N'B303', N'Phung Minh Hai', CAST(N'1993-11-20' AS Date), N'TP Vinh Phuc', 358442932)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (125328533, N'B304', N'Dinh Thi Huong Lam', CAST(N'1994-11-02' AS Date), N'Cat Ba-Hai Phong', 987996618)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (126178316, N'B304', N'Dao Duy Hoang', CAST(N'1995-02-18' AS Date), N'TP Hai Phong', 338329735)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (129102039, N'A102 ', N'Vu Xuan Huan', CAST(N'1986-06-10' AS Date), N'Binh Giang-Hai Duong', 129010303)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (129257159, N'B305', N'Nguyen Quynh Anh', CAST(N'1998-12-03' AS Date), N'Kim Bao-Hai Phong', 989906968)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (132095505, N'B205', N'Tran Manh An', CAST(N'1996-12-23' AS Date), N'TP Bac Kan', 977001608)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (135901719, N'B501', N'Phan Thi Thao Ly', CAST(N'1993-10-22' AS Date), N'Dong My-Ha Noi', 963907729)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (142492091, N'A501', N'Mai Thi Ngoc Thuong', CAST(N'1992-02-20' AS Date), N'Ba Vi-Ha Noi', 799287205)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (142554985, N'A506', N'Dao Do Ngoc Tuan', CAST(N'1995-07-21' AS Date), N'Me Linh-Ha Noi', 975789063)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (142699484, N'B206', N'Nguyen Thi Huong', CAST(N'1990-12-22' AS Date), N'Dong Trieu-Quang Ninh', 358978820)
GO
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (142772185, N'A101', N'Nguyen Thanh Tung', CAST(N'1996-08-20' AS Date), N'Binh Giang-Hai Duong', 969616268)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (162561066, N'A206', N'Trinh Van Ha', CAST(N'1986-11-30' AS Date), N'Khoai Chau-Hung Yen', 866143022)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (163097154, N'B206', N'Phan Van Ky', CAST(N'1988-01-30' AS Date), N'Dong Trieu-Quang Ninh', 973313365)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (163215419, N'B103', N'Pham Thu Hien', CAST(N'1993-12-02' AS Date), N'Thanh Oai-Ha Noi', 986785899)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (163419671, N'B505', N'Vu Thi Huong', CAST(N'1999-08-21' AS Date), N'TP Bac Kan', 848560333)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (168240221, N'B102', N'Nguyen Van Bo', CAST(N'1992-02-22' AS Date), N'Co Nhue-Ha Noi', 972130636)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (168302169, N'A504', N'Le Thi Van Anh', CAST(N'1995-09-29' AS Date), N'TP Hoa Binh', 346692669)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (168556171, N'B503', N'Ngo Cam Tu', CAST(N'2001-07-23' AS Date), N'My Dinh-Ha Noi', 962364234)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (172049318, N'A403', N'Nguyen Thi Trang ', CAST(N'2001-02-18' AS Date), N'Cam Giang-Hai Duong', 983281645)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (173069876, N'A405', N'Kim Thi Thuy Dung', CAST(N'1992-10-22' AS Date), N'Soc Son-Ha Noi', 975336627)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (173340300, N'A503', N'Pham Minh Trung', CAST(N'1999-09-11' AS Date), N'Thanh Oai-Ha Noi', 936300388)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (173761820, N'C104', N'Nguyen Thi Ngoc', CAST(N'1992-06-13' AS Date), N'Cam Pha-Quang Ninh', 936700166)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (174519324, N'C102', N'Chu Duc Linh', CAST(N'1999-02-22' AS Date), N'Nam Sach-Hai Duong', 396400665)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (181021837, N'A205', N'Nguyen Hong Lien', CAST(N'2002-03-30' AS Date), N'TP Thai Binh', 982429981)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (183207877, N'C103', N'Tran Kim Nhung', CAST(N'1995-05-12' AS Date), N'Thuong Tin-Ha Noi', 986173447)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (183395265, N'A503', N'Nguyen Trong Van', CAST(N'2000-07-28' AS Date), N'Thanh Oai-Ha Noi', 986441116)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (186291482, N'A402', N'Trang Hong Phong', CAST(N'2000-02-11' AS Date), N'Cat Ba-Hai Phong', 987207877)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (187267515, N'B205', N'Nguyen Thi Thuy Quynh', CAST(N'1997-01-20' AS Date), N'TP Bac Kan', 944228294)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (192482129, N'A101', N'Nguyen Thi Thu Phuong', CAST(N'1991-05-01' AS Date), N'Binh Giang-Hai Duong', 968010591)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (198920303, N'D506', N'Le Minh Khoi', CAST(N'1991-08-31' AS Date), N'Ba Dinh-Ha Noi', 999182376)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (203192389, N'A102 ', N'Phung Khoa Hoc', CAST(N'1996-12-02' AS Date), N'Ha Dong-Ha Noi', 129382122)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (222121342, N'B404', N'Loan Nhat Minh', CAST(N'1988-06-12' AS Date), N'Binh Giang-Hai Duong', 334909866)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (222131361, N'B405', N'Pham Thai Son', CAST(N'1997-03-06' AS Date), N'Ninh Giang-Hai Duong', 349152656)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (241770001, N'A202', N'Le Thanh Binh ', CAST(N'1990-12-03' AS Date), N'Moc Chau-Son La', 983652171)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (293182043, N'A102', N'Phung Thai Linh', CAST(N'1997-03-09' AS Date), N'Ha Dong-Ha Noi', 987287420)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (331400855, N'B502', N'Bui Quang Thanh', CAST(N'2000-01-21' AS Date), N'Ba Vi-Ha Noi', 868122555)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (332158454, N'B503', N'Pham Thi Tham', CAST(N'2001-05-12' AS Date), N'Bac Tu Liem-Ha Noi', 971026396)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (340800054, N'A204', N'Nguyen Dinh Kha', CAST(N'1996-08-08' AS Date), N'Thuong Tin-Ha Noi', 989380579)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (351810069, N'A201', N'Le Thi Bich Ngoc', CAST(N'1993-11-21' AS Date), N'TP Thai Nguyen', 982126689)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (362102890, N'B504', N'Nguyen Van Le', CAST(N'1995-02-14' AS Date), N'Kim Thanh-Hai Duong', 969085183)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (362216871, N'B506', N'Pham Mai Anh', CAST(N'2001-05-02' AS Date), N'Phin Ho-Lai Chau', 333749143)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (372016185, N'C101', N'Le Vu Thanh Binh', CAST(N'1990-01-20' AS Date), N'Tu Ky-Hai Duong', 379619297)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (382034344, N'C102', N'Nguyen Thi Khanh Linh', CAST(N'1999-10-21' AS Date), N'Nam Sach-Hai Duong', 356621235)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (770869011, N'C103', N'Le Quy Luyen', CAST(N'1994-03-13' AS Date), N'Thuong Tin-Ha Noi', 982113465)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1063015013, N'A104', N'Tran Dinh Quy', CAST(N'1985-05-29' AS Date), N'Dong Da-Ha Noi', 915185173)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1076008712, N'A104', N'Nguyen Huy Duong', CAST(N'1988-02-19' AS Date), N'Dong Da-Ha Noi', 964655976)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1082002636, N'A201', N'Nguyen Van Hieu', CAST(N'1992-09-10' AS Date), N'Phu Binh-Thai Nguyen', 979867080)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1181011736, N'A105', N'Ha Thu Trang', CAST(N'1992-09-19' AS Date), N'Kim Bang-Ha Nam', 904300881)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1291020391, N'D506 ', N'Tran Thai Linh', CAST(N'1997-04-12' AS Date), N'Thanh Xuan-Ha Noi', 999181222)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1709411021, N'A101 ', N'Nguyen Van Tuong', CAST(N'1968-06-10' AS Date), N'Binh Giang-Hai Duong', 972597666)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1800003364, N'D305', N'Tran Dinh Cao', CAST(N'2000-08-19' AS Date), N'Luc Ngan-Bac Giang', 378792168)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1800003429, N'D301', N'Nhu Thi Thao', CAST(N'2001-04-16' AS Date), N'Van Giang-Hung Yen', 336876734)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1800003921, N'D105', N'Duong Thi Dong', CAST(N'1999-06-24' AS Date), N'Phu Binh-Thai Nguyen', 964702633)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1800004278, N'D201', N'An Thi Lo', CAST(N'1978-07-12' AS Date), N'Bao Lam-Cao Bang', 384196128)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1800004562, N'D401', N'Duong Dinh An', CAST(N'1997-02-28' AS Date), N'Hiep Hoa-Bac Giang', 379106908)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1800004593, N'C503', N'Le Van Huan', CAST(N'1995-12-04' AS Date), N'An Duong-Hai Phong', 398254921)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1800005462, N'C406', N'Chu Thi Phuong', CAST(N'1994-12-03' AS Date), N'Yen Thuy-Hoa Binh', 366125638)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1800005807, N'D205', N'Tran Van Liem', CAST(N'1999-10-05' AS Date), N'Vu Thu-Thai Binh', 387718257)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1800006029, N'C405', N'Vu Thi Thanh', CAST(N'1986-05-31' AS Date), N'Mai Chau-Hoa Binh', 987248521)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1800006186, N'D103', N'Vu Ngoc Thinh', CAST(N'1993-12-08' AS Date), N'Gia Vien-Ninh Binh', 358139952)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1800006464, N'D405', N'Bui Thi Ly', CAST(N'1994-08-09' AS Date), N'Binh Giang-Hai Duong', 345005951)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1800007128, N'D206', N'Pham Thi Lan', CAST(N'2000-04-18' AS Date), N'Cho Moi-Bac Kan', 975928293)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1800007862, N'C206', N'Nguyen Van Hung', CAST(N'2000-06-30' AS Date), N'Sapa-Lao Cai', 975673610)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1800007979, N'D103', N'Vu Dinh Lan', CAST(N'1990-09-13' AS Date), N'Gia Vien-Ninh Binh', 356765435)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1800008648, N'C205', N'Pham Van Ngoc', CAST(N'1997-04-06' AS Date), N'Con Cuong-Nghe An', 396775761)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1800008843, N'C504', N'Vu Thi Phuong Nga', CAST(N'1992-05-19' AS Date), N'Cat Hai-Hai Phong', 345808870)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1800009081, N'D506', N'Nguyen Thanh Nga', CAST(N'2000-06-14' AS Date), N'Thanh Ba-Phu Tho', 963687290)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1800009122, N'D101', N'Ngo Duc Toan', CAST(N'1991-06-24' AS Date), N'Tam Diep-Ninh Binh', 983805199)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1800009484, N'D401', N'Le Huy Phai', CAST(N'1998-05-21' AS Date), N'Hiep Hoa-Bac Giang', 387950014)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1800009612, N'C502', N'Vu Dinh Luan', CAST(N'1999-06-23' AS Date), N'Thuy Nguyen-Hai Phong', 349411545)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1800010187, N'D302', N'Pham Dinh Tinh', CAST(N'1991-10-20' AS Date), N'Yen Phong-Bac Ninh', 968247486)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1800010377, N'D306', N'Nguyen Thi Tuyen', CAST(N'2001-11-29' AS Date), N'Thuan Thanh-Bac Ninh', 399279345)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1800011918, N'C301', N'Vu Dinh Binh', CAST(N'2001-08-31' AS Date), N'Bao Yen-Lao Cai', 985622524)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1800011975, N'D106', N'Le Huy Loi', CAST(N'1995-07-24' AS Date), N'Vu Thu-Thai Binh', 976192103)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1800012260, N'C303', N'Nguyen Thi Nghiem', CAST(N'1990-10-02' AS Date), N'Bac Son-Lang Son', 974324804)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1800012636, N'D501', N'Vu Thu Ha', CAST(N'1999-12-23' AS Date), N'Nghia Dan-Nghe An', 986292863)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1800012717, N'D304', N'Vu Huy Dien', CAST(N'1997-02-11' AS Date), N'Que Vo-Bac Ninh', 395870053)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1800013554, N'C304', N'Nguyen Thi Trieu', CAST(N'1989-08-21' AS Date), N'Chi Lang-Lang Son', 364425863)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1800014422, N'D104', N'Pham Van Huynh', CAST(N'1994-09-10' AS Date), N'Phu Luong-Thai Nguyen', 336192343)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1900000028, N'D501 ', N'Nguyen Cong Chung', CAST(N'1997-01-20' AS Date), N'Nghia Dan-Nghe An', 397367540)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1900000123, N'C501', N'Pham Van Lap', CAST(N'1994-07-16' AS Date), N'Chi Linh-Hai Duong', 366908638)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1900000422, N'C406', N'Nguyen Thi Tuyet', CAST(N'1998-04-10' AS Date), N'Yen Thuy-Hoa Binh', 356565863)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1900000780, N'D106', N'Vu Thi Van', CAST(N'1997-02-04' AS Date), N'Vu Thu-Thai Binh', 962287932)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1900001081, N'C404', N'Nguyen Van Bien', CAST(N'1988-06-01' AS Date), N'Kim Boi-Hoa Binh', 976884884)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1900003442, N'D206', N'Vu Quoc Huu', CAST(N'1998-02-13' AS Date), N'Cho Don-Bac Kan', 974382341)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1900004204, N'C204', N'Pham Van Dang', CAST(N'1998-04-12' AS Date), N'Dien Chau-Nghe An', 772361683)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1900004248, N'C505', N'Nguyen Thi Tam', CAST(N'1999-05-25' AS Date), N'Binh Lieu-Quang Ninh', 964096385)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1900004797, N'C301', N'Nguyen Van Quang', CAST(N'1994-07-27' AS Date), N'Bao Yen-Lao Cai', 975708387)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1900005593, N'D506', N'Luu Thi Huyen', CAST(N'2001-04-02' AS Date), N'Tan Son-Phu Tho', 984941137)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1900007102, N'D205', N'Vu Tat Bao', CAST(N'1999-01-06' AS Date), N'Quynh Phu-Thai Binh', 969598521)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1900007261, N'D503', N'Tran Thi Dung', CAST(N'1992-09-21' AS Date), N'Cao Loc-Lang Son', 393643725)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1900008115, N'D202', N'Pham Dinh Luong', CAST(N'1982-06-18' AS Date), N'Trung Khanh-Cao Bang', 986257988)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1900008626, N'D302', N'Nguyen Van Hao', CAST(N'1991-11-22' AS Date), N'Tien Du-Bac Ninh', 974176359)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1900009059, N'D402', N'Vu Thi Nguyet', CAST(N'1997-01-28' AS Date), N'Tu Son-Bac Ninh', 966468941)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1900009068, N'C502', N'Nguyen Thi Mien', CAST(N'1999-05-05' AS Date), N'Thuy Nguyen-Hai Phong', 979723920)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1900011492, N'C204', N'Vu Dinh Tuan', CAST(N'1990-01-04' AS Date), N'Dien Chau-Nghe An', 368225786)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1900011759, N'D403', N'Ha Thi Xuan', CAST(N'1998-05-19' AS Date), N'Van Giang-Hung Yen', 345358158)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1900011760, N'D403', N'Dinh Huu Mai', CAST(N'1993-04-25' AS Date), N'Yen My-Hung Yen', 345358158)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1900012457, N'C506', N'Vu Thi Phuong Nga', CAST(N'1996-09-19' AS Date), N'Vinh Yen-Vinh Phuc', 398818830)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1900012661, N'D204', N'Vu Nhat Vinh', CAST(N'1995-07-24' AS Date), N'Ba Be-Bac Kan', 366329122)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1900013326, N'C203', N'Le Thi Lan', CAST(N'1994-02-10' AS Date), N'Nghi Loc-Nghe An', 362543113)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1900013398, N'D504', N'Hoang Van Tinh', CAST(N'1990-08-02' AS Date), N'Bac Son-Lang Son', 338990368)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1900013521, N'D303', N'Nhu Van Thu', CAST(N'1997-03-23' AS Date), N'An Thi-Hung Yen', 353296672)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1900013522, N'D303', N'Nguyen Thi Ly', CAST(N'1999-09-20' AS Date), N'An Thi-Hung Yen', 327431487)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1900013580, N'D404', N'Vu Kim Hong', CAST(N'1992-07-07' AS Date), N'Tan Yen-Bac Giang', 387308680)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1900016141, N'D102', N'Bui Van Hung', CAST(N'1993-02-07' AS Date), N'Kim Son-Ninh Binh', 387829572)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1900016840, N'C302', N'Nguyen Van Truong', CAST(N'1991-09-03' AS Date), N'Bac Son-Lang Son', 979937063)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1900018252, N'C403', N'Vu Huy Dang', CAST(N'1996-05-06' AS Date), N'Yen Minh-Ha Giang', 988821955)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1900018963, N'C304', N'Vu Thi Dung', CAST(N'1999-07-02' AS Date), N'Van Quan-Lang Son', 335919672)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (1900019259, N'C405', N'Dang Dinh Quay', CAST(N'1990-04-13' AS Date), N'Mai Chau-Hoa Binh', 964793844)
GO
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (2000004187, N'C503', N'Nguyen Thi Ngoc', CAST(N'1997-04-17' AS Date), N'An Duong-Hai Phong', 769211098)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (2000005137, N'D203', N'Bui Thi Ha', CAST(N'1992-05-22' AS Date), N'Tien Hai-Thai Binh', 363288397)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (2000009018, N'C403', N'Vu Dinh Man', CAST(N'1990-04-23' AS Date), N'Yen Minh-Ha Giang', 962349724)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (2000009573, N'D406', N'Truong Thi Trang', CAST(N'1992-04-16' AS Date), N'Dong Hoi-Quang Binh', 355385279)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (2000010096, N'D304', N'Vu Thi Nga', CAST(N'1996-08-20' AS Date), N'Que Vo-Bac Ninh', 384645560)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (2000011306, N'D502', N'Pham Dinh Duy Tuyen', CAST(N'1998-04-02' AS Date), N'Tuong Duong-Nghe An ', 973814110)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (2000013369, N'D505', N'Vu The An', CAST(N'1999-01-02' AS Date), N'Lam Thao-Phu Tho', 977382355)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (2000013887, N'C401', N'Doan Thi Bich', CAST(N'1999-04-06' AS Date), N'Meo Vac-Ha Giang', 963918936)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (2000014065, N'C506', N'Vu Phuong Tue Anh', CAST(N'2000-03-05' AS Date), N'Vinh Yen-Vinh Phuc', 359005779)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (2100000626, N'D104', N'Tran Thi Trinh', CAST(N'1997-05-28' AS Date), N'Phu Luong-Thai Nguyen', 376422796)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (2100000627, N'C402', N'Vu Dinh Hong', CAST(N'1993-07-30' AS Date), N'Bac Quang-Ha Giang', 966182276)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (2100001079, N'C205', N'Nguyen Quang Hung', CAST(N'1998-07-02' AS Date), N'Con Cuong-Nghe An', 966769503)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (2100001197, N'D406', N'Vu Thi Thanh', CAST(N'1991-09-08' AS Date), N'Le Thuy-Quang Binh', 378426899)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (2100001401, N'C401', N'Ta Thi Nhan', CAST(N'1998-08-08' AS Date), N'Meo Vac-Ha Giang', 326771600)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (2100001656, N'C505', N'Nguyen Thi Dung', CAST(N'1997-06-29' AS Date), N'Binh Lieu-Quang Ninh', 329844468)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (2100001738, N'D102', N'Vu Van Hoan', CAST(N'1997-06-12' AS Date), N'Kim Son-Ninh Binh', 383890396)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (2100001739, N'C306', N'Vu Van Hoan', CAST(N'1995-07-01' AS Date), N'Tuan Giao-Dien Bien', 383890396)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (2100001943, N'D204', N'Nguyen Thi Hanh', CAST(N'1994-03-27' AS Date), N'Ba Be-Bac Kan', 355995442)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (2100002007, N'C304', N'Nghiem Van Doan', CAST(N'1988-09-13' AS Date), N'Chi Lang-Lang Son', 977764078)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (2100002278, N'D406', N'Nguyen Thu Duyen', CAST(N'1992-07-29' AS Date), N'Tuyen Hoa-Quang Binh', 973729512)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (2100002343, N'C302', N'Vu Thi Doan', CAST(N'1999-04-10' AS Date), N'Van Ban-Lao Cai', 336935513)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (2100002617, N'D404', N'Nguyen Thi Nguyen', CAST(N'1993-05-25' AS Date), N'Luc Nam-Bac Giang', 352812062)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (2100004281, N'D301', N'Nguyen Van Manh', CAST(N'1994-05-11' AS Date), N'Van Lam-Hung Yen', 337371026)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (2100004917, N'D305', N'Do Minh Khoi', CAST(N'2000-03-30' AS Date), N'Luc Ngan-Bac Giang', 987272540)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (2100005566, N'D202', N'Nguyen Tuan Anh', CAST(N'1984-06-16' AS Date), N'Trung Khanh-Cao Bang', 337371026)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (2100009305, N'D503', N'Pham Thi Huong', CAST(N'1993-05-29' AS Date), N'Cao Loc-Lang Son', 979579335)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (2100012676, N'C305', N'Nguyen Thi Linh', CAST(N'2000-04-02' AS Date), N'Muong Ang-Dien Bien', 332460329)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (2100012677, N'C305', N'Vu Trong Giang', CAST(N'2002-03-04' AS Date), N'Muong Ang-Dien Bien', 978813082)
INSERT [dbo].[Resident] ([ID], [ApartmentID], [FullName], [DateOfBirth], [HomeTown], [Phone]) VALUES (2100012848, N'D504', N'Pham Hoang Bien', CAST(N'1990-02-15' AS Date), N'Trang Dinh-Lang Son', 335329717)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1027280, 1, CAST(N'2021-10-18' AS Date), 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1804750, 1, CAST(N'2021-10-19' AS Date), 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (3378222, 1, CAST(N'2021-10-19' AS Date), 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (11318446, 1, CAST(N'2021-08-10' AS Date), 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (11523332, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (11669541, 1, CAST(N'2021-10-19' AS Date), 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (11778516, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (11808544, 1, CAST(N'2021-10-19' AS Date), 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (11857941, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (11934547, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (11968867, 1, CAST(N'2021-11-02' AS Date), 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (11980534, 1, CAST(N'2021-10-19' AS Date), 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (11987953, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (12201215, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (12282100, 1, CAST(N'2021-10-19' AS Date), 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (12282102, 1, CAST(N'2021-10-19' AS Date), 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (12339001, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (12545317, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (12604707, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (12631168, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (12727196, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (12828998, 1, CAST(N'2021-10-19' AS Date), 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (13003029, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (13011442, 1, CAST(N'2021-10-19' AS Date), 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (13047358, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (13128735, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (13136965, 1, CAST(N'2021-10-19' AS Date), 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (13162238, 1, CAST(N'2021-10-19' AS Date), 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (13457054, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (13496366, 1, CAST(N'2021-10-19' AS Date), 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (13517255, 1, CAST(N'2021-10-19' AS Date), 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (17094110, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (17111475, 1, CAST(N'2021-10-19' AS Date), 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (17167901, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (17228395, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (17388028, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (17388327, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (17488536, 1, CAST(N'2021-10-19' AS Date), 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (17507759, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (17524500, 1, CAST(N'2021-10-19' AS Date), 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (18008326, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (18014139, 1, CAST(N'2021-10-19' AS Date), 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (21002567, 1, CAST(N'2021-10-19' AS Date), 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (22208830, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (31980921, 1, CAST(N'2021-10-19' AS Date), 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (60994449, 1, CAST(N'2021-10-19' AS Date), 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (61111673, 1, CAST(N'2021-10-19' AS Date), 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (105047123, 1, CAST(N'2021-10-20' AS Date), 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (106072068, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (107052405, 1, CAST(N'2021-10-20' AS Date), 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (108064852, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (108064856, 1, CAST(N'2021-10-20' AS Date), 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (110067935, 1, CAST(N'2021-10-20' AS Date), 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (110083253, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (110145412, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (110145416, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (110145420, 1, CAST(N'2021-10-20' AS Date), 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (110145423, 1, CAST(N'2021-10-20' AS Date), 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (111167397, 1, CAST(N'2021-10-20' AS Date), 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (111184773, 1, CAST(N'2021-10-20' AS Date), 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (111213114, 1, CAST(N'2021-10-20' AS Date), 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (111336938, 1, CAST(N'2021-10-20' AS Date), 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (111662579, 1, CAST(N'2021-10-20' AS Date), 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (112099847, 1, CAST(N'2021-10-20' AS Date), 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (112102270, 1, CAST(N'2021-10-20' AS Date), 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (112102274, 1, CAST(N'2021-10-20' AS Date), 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (112155635, 1, CAST(N'2021-10-20' AS Date), 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (112155851, 1, CAST(N'2021-10-20' AS Date), 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (112165408, 1, CAST(N'2021-10-20' AS Date), 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (112182524, 1, CAST(N'2021-10-20' AS Date), 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (112366418, 1, CAST(N'2021-10-20' AS Date), 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (113077452, 1, CAST(N'2021-10-20' AS Date), 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (113358155, 1, CAST(N'2021-10-20' AS Date), 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (113458894, 1, CAST(N'2021-08-24' AS Date), 1, CAST(N'2021-10-30' AS Date))
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (113494519, 1, CAST(N'2021-08-24' AS Date), 1, CAST(N'2021-10-30' AS Date))
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (114097123, 1, CAST(N'2021-08-24' AS Date), 1, CAST(N'2021-10-30' AS Date))
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (114162352, 1, CAST(N'2021-08-24' AS Date), 1, CAST(N'2021-10-30' AS Date))
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (115030953, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (115134195, 1, CAST(N'2021-08-24' AS Date), 1, CAST(N'2021-10-30' AS Date))
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (115156353, 1, CAST(N'2021-08-24' AS Date), 1, CAST(N'2021-10-30' AS Date))
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (116002165, 1, CAST(N'2021-08-24' AS Date), 1, CAST(N'2021-10-30' AS Date))
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (116041253, 1, CAST(N'2021-08-24' AS Date), 1, CAST(N'2021-10-30' AS Date))
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (116166301, 1, CAST(N'2021-08-24' AS Date), 1, CAST(N'2021-10-30' AS Date))
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (116167252, 1, CAST(N'2021-08-24' AS Date), 1, CAST(N'2021-10-30' AS Date))
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (116187553, 1, CAST(N'2021-08-24' AS Date), 1, CAST(N'2021-10-30' AS Date))
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (119847214, 1, CAST(N'2021-11-01' AS Date), 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (119847299, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (121183202, 1, CAST(N'2021-08-24' AS Date), 1, CAST(N'2021-10-30' AS Date))
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (122123060, 1, CAST(N'2021-08-22' AS Date), 1, CAST(N'2021-10-28' AS Date))
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (123880351, 1, CAST(N'2021-08-22' AS Date), 1, CAST(N'2021-10-28' AS Date))
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (124960401, 1, CAST(N'2021-08-22' AS Date), 1, CAST(N'2021-10-28' AS Date))
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (125328533, 1, CAST(N'2021-08-22' AS Date), 1, CAST(N'2021-10-28' AS Date))
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (126178316, 1, CAST(N'2021-08-22' AS Date), 1, CAST(N'2021-10-28' AS Date))
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (129102039, 1, CAST(N'2021-08-22' AS Date), 1, CAST(N'2021-10-28' AS Date))
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (129257159, 1, CAST(N'2021-08-22' AS Date), 1, CAST(N'2021-10-28' AS Date))
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (132095505, 1, CAST(N'2021-08-22' AS Date), 1, CAST(N'2021-10-28' AS Date))
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (135901719, 1, CAST(N'2021-08-22' AS Date), 1, CAST(N'2021-10-28' AS Date))
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (142492091, 1, CAST(N'2021-08-22' AS Date), 1, CAST(N'2021-10-28' AS Date))
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (142554985, 1, CAST(N'2021-08-22' AS Date), 1, CAST(N'2021-10-28' AS Date))
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (142699484, 1, CAST(N'2021-08-22' AS Date), 1, CAST(N'2021-10-28' AS Date))
GO
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (142772185, 1, CAST(N'2021-08-22' AS Date), 1, CAST(N'2021-10-28' AS Date))
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (162561066, 1, CAST(N'2021-08-22' AS Date), 1, CAST(N'2021-10-28' AS Date))
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (163097154, 1, CAST(N'2021-08-22' AS Date), 1, CAST(N'2021-10-28' AS Date))
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (163215419, 1, CAST(N'2021-08-22' AS Date), 1, CAST(N'2021-10-28' AS Date))
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (163419671, 1, CAST(N'2021-08-22' AS Date), 1, CAST(N'2021-10-28' AS Date))
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (168240221, 1, CAST(N'2021-08-22' AS Date), 1, CAST(N'2021-10-28' AS Date))
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (168302169, 1, CAST(N'2021-08-22' AS Date), 1, CAST(N'2021-10-28' AS Date))
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (168556171, 1, CAST(N'2021-08-22' AS Date), 1, CAST(N'2021-10-28' AS Date))
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (172049318, 1, CAST(N'2021-08-22' AS Date), 1, CAST(N'2021-10-28' AS Date))
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (173069876, 1, CAST(N'2021-08-22' AS Date), 1, CAST(N'2021-10-28' AS Date))
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (173340300, 1, CAST(N'2021-08-22' AS Date), 1, CAST(N'2021-08-22' AS Date))
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (173761820, 1, CAST(N'2021-08-22' AS Date), 1, CAST(N'2021-10-28' AS Date))
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (174519324, 1, CAST(N'2021-08-22' AS Date), 1, CAST(N'2021-10-28' AS Date))
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (181021837, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (183207877, 1, CAST(N'2021-07-19' AS Date), 1, CAST(N'2021-09-25' AS Date))
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (183395265, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (186291482, 1, CAST(N'2021-07-19' AS Date), 1, CAST(N'2021-09-25' AS Date))
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (187267515, 1, CAST(N'2021-07-19' AS Date), 1, CAST(N'2021-09-25' AS Date))
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (192482129, 1, CAST(N'2021-07-19' AS Date), 1, CAST(N'2021-09-25' AS Date))
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (198920303, 1, CAST(N'2021-08-06' AS Date), 1, CAST(N'2021-10-08' AS Date))
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (203192389, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (222121342, 1, CAST(N'2021-07-19' AS Date), 1, CAST(N'2021-09-25' AS Date))
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (222131361, 1, CAST(N'2021-07-19' AS Date), 1, CAST(N'2021-09-25' AS Date))
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (241770001, 1, CAST(N'2021-07-19' AS Date), 1, CAST(N'2021-09-25' AS Date))
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (293182043, 1, CAST(N'2021-07-19' AS Date), 1, CAST(N'2021-07-19' AS Date))
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (331400855, 1, CAST(N'2021-07-19' AS Date), 1, CAST(N'2021-09-25' AS Date))
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (332158454, 1, CAST(N'2021-07-19' AS Date), 1, CAST(N'2021-09-25' AS Date))
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (340800054, 1, CAST(N'2021-07-19' AS Date), 1, CAST(N'2021-09-25' AS Date))
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (351810069, 1, CAST(N'2021-07-19' AS Date), 1, CAST(N'2021-09-25' AS Date))
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (362102890, 1, CAST(N'2021-07-19' AS Date), 1, CAST(N'2021-09-25' AS Date))
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (362216871, 1, CAST(N'2021-07-19' AS Date), 1, CAST(N'2021-09-25' AS Date))
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (372016185, 1, CAST(N'2021-07-19' AS Date), 1, CAST(N'2021-09-25' AS Date))
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (382034344, 1, CAST(N'2021-07-19' AS Date), 1, CAST(N'2021-09-25' AS Date))
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (770869011, 1, CAST(N'2021-07-19' AS Date), 1, CAST(N'2021-09-25' AS Date))
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1063015013, 1, CAST(N'2021-07-19' AS Date), 1, CAST(N'2021-09-25' AS Date))
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1076008712, 1, CAST(N'2021-07-19' AS Date), 1, CAST(N'2021-09-25' AS Date))
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1082002636, 1, CAST(N'2021-09-26' AS Date), 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1181011736, 1, CAST(N'2021-09-26' AS Date), 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1291020391, 1, CAST(N'2021-09-10' AS Date), 1, CAST(N'2021-11-01' AS Date))
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1709411021, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1800003364, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1800003429, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1800003921, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1800004278, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1800004562, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1800004593, 1, CAST(N'2021-09-26' AS Date), 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1800005462, 1, CAST(N'2021-09-26' AS Date), 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1800005807, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1800006029, 1, CAST(N'2021-09-26' AS Date), 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1800006186, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1800006464, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1800007128, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1800007862, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1800007979, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1800008648, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1800008843, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1800009081, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1800009122, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1800009484, 1, CAST(N'2021-08-18' AS Date), 1, CAST(N'2021-09-28' AS Date))
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1800009612, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1800010187, 1, CAST(N'2021-10-19' AS Date), 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1800010377, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1800011918, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1800011975, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1800012260, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1800012636, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1800012717, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1800013554, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1800014422, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1900000028, 1, CAST(N'2021-10-18' AS Date), 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1900000123, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1900000422, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1900000780, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1900001081, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1900003442, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1900004204, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1900004248, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1900004797, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1900005593, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1900007102, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1900007261, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1900008115, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1900008626, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1900009059, 1, CAST(N'2021-10-19' AS Date), 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1900009068, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1900011492, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1900011759, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1900011760, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1900012457, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1900012661, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1900013326, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1900013398, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1900013521, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1900013522, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1900013580, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1900016141, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1900016840, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1900018252, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1900018963, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (1900019259, 0, NULL, 0, NULL)
GO
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (2000004187, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (2000005137, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (2000009018, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (2000009573, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (2000010096, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (2000011306, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (2000013369, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (2000013887, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (2000014065, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (2100000626, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (2100000627, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (2100001079, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (2100001197, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (2100001401, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (2100001656, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (2100001738, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (2100001739, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (2100001943, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (2100002007, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (2100002278, 1, CAST(N'2021-10-18' AS Date), 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (2100002343, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (2100002617, 1, CAST(N'2021-10-19' AS Date), 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (2100004281, 1, CAST(N'2021-10-19' AS Date), 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (2100004917, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (2100005566, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (2100009305, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (2100012676, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (2100012677, 0, NULL, 0, NULL)
INSERT [dbo].[Vaccination] ([ID], [1 injection], [1injectionDate], [2 injection], [2injectionDate]) VALUES (2100012848, 0, NULL, 0, NULL)
ALTER TABLE [dbo].[Apartment]  WITH CHECK ADD  CONSTRAINT [FK_Apartment_Building] FOREIGN KEY([BuildID])
REFERENCES [dbo].[Building] ([BuildID])
GO
ALTER TABLE [dbo].[Apartment] CHECK CONSTRAINT [FK_Apartment_Building]
GO
ALTER TABLE [dbo].[F1F2Management]  WITH CHECK ADD  CONSTRAINT [FK_F1F2Management_Resident] FOREIGN KEY([ID])
REFERENCES [dbo].[Resident] ([ID])
GO
ALTER TABLE [dbo].[F1F2Management] CHECK CONSTRAINT [FK_F1F2Management_Resident]
GO
ALTER TABLE [dbo].[GroupAccount]  WITH CHECK ADD  CONSTRAINT [FK_GroupAccount_Account] FOREIGN KEY([username])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[GroupAccount] CHECK CONSTRAINT [FK_GroupAccount_Account]
GO
ALTER TABLE [dbo].[GroupAccount]  WITH CHECK ADD  CONSTRAINT [FK_GroupAccount_Group] FOREIGN KEY([gid])
REFERENCES [dbo].[Group] ([gid])
GO
ALTER TABLE [dbo].[GroupAccount] CHECK CONSTRAINT [FK_GroupAccount_Group]
GO
ALTER TABLE [dbo].[GroupFeature]  WITH CHECK ADD  CONSTRAINT [FK_GroupFeature_Feature] FOREIGN KEY([fid])
REFERENCES [dbo].[Feature] ([fid])
GO
ALTER TABLE [dbo].[GroupFeature] CHECK CONSTRAINT [FK_GroupFeature_Feature]
GO
ALTER TABLE [dbo].[GroupFeature]  WITH CHECK ADD  CONSTRAINT [FK_GroupFeature_Group] FOREIGN KEY([gid])
REFERENCES [dbo].[Group] ([gid])
GO
ALTER TABLE [dbo].[GroupFeature] CHECK CONSTRAINT [FK_GroupFeature_Group]
GO
ALTER TABLE [dbo].[Vaccination]  WITH CHECK ADD  CONSTRAINT [FK_Vaccination_Resident1] FOREIGN KEY([ID])
REFERENCES [dbo].[Resident] ([ID])
GO
ALTER TABLE [dbo].[Vaccination] CHECK CONSTRAINT [FK_Vaccination_Resident1]
GO
USE [master]
GO
ALTER DATABASE [ProjectPRJ] SET  READ_WRITE 
GO
