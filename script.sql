USE [master]
GO
/****** Object:  Database [API_Covid19_Flight]    Script Date: 03/07/2022 14:16:18 ******/
CREATE DATABASE [API_Covid19_Flight]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'API_Covid19_Flight', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\API_Covid19_Flight.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'API_Covid19_Flight_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\API_Covid19_Flight_log.ldf' , SIZE = 139264KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [API_Covid19_Flight] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [API_Covid19_Flight].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [API_Covid19_Flight] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [API_Covid19_Flight] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [API_Covid19_Flight] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [API_Covid19_Flight] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [API_Covid19_Flight] SET ARITHABORT OFF 
GO
ALTER DATABASE [API_Covid19_Flight] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [API_Covid19_Flight] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [API_Covid19_Flight] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [API_Covid19_Flight] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [API_Covid19_Flight] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [API_Covid19_Flight] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [API_Covid19_Flight] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [API_Covid19_Flight] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [API_Covid19_Flight] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [API_Covid19_Flight] SET  DISABLE_BROKER 
GO
ALTER DATABASE [API_Covid19_Flight] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [API_Covid19_Flight] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [API_Covid19_Flight] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [API_Covid19_Flight] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [API_Covid19_Flight] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [API_Covid19_Flight] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [API_Covid19_Flight] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [API_Covid19_Flight] SET RECOVERY FULL 
GO
ALTER DATABASE [API_Covid19_Flight] SET  MULTI_USER 
GO
ALTER DATABASE [API_Covid19_Flight] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [API_Covid19_Flight] SET DB_CHAINING OFF 
GO
ALTER DATABASE [API_Covid19_Flight] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [API_Covid19_Flight] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [API_Covid19_Flight] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [API_Covid19_Flight] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'API_Covid19_Flight', N'ON'
GO
ALTER DATABASE [API_Covid19_Flight] SET QUERY_STORE = OFF
GO
USE [API_Covid19_Flight]
GO
/****** Object:  Table [dbo].[Aeroport]    Script Date: 03/07/2022 14:16:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aeroport](
	[id] [int] NOT NULL,
	[iata] [varchar](50) NOT NULL,
	[id_aeroport] [varchar](50) NOT NULL,
	[name] [varchar](200) NULL,
	[location] [varchar](500) NULL,
	[city] [varchar](100) NULL,
	[country] [varchar](500) NULL,
	[country_iso] [varchar](50) NULL,
 CONSTRAINT [PK_aeroport] PRIMARY KEY CLUSTERED 
(
	[id_aeroport] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AeroportDetail]    Script Date: 03/07/2022 14:16:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AeroportDetail](
	[id] [int] NOT NULL,
	[street_number] [varchar](50) NULL,
	[street] [varchar](500) NULL,
	[county] [varchar](500) NULL,
	[state] [varchar](500) NULL,
	[postal_code] [varchar](500) NULL,
	[phone] [varchar](500) NULL,
	[latitude] [int] NULL,
	[longitude] [int] NULL,
	[uct] [int] NULL,
	[website] [varchar](500) NULL,
 CONSTRAINT [PK_detail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Arrival]    Script Date: 03/07/2022 14:16:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Arrival](
	[id_Arrival] [int] IDENTITY(1,1) NOT NULL,
	[id_vol] [int] NOT NULL,
	[id_aeroport] [varchar](50) NOT NULL,
	[estArrivalAirport] [varchar](50) NULL,
	[estArrivalAirportHorizDistance] [int] NULL,
	[estArrivalAirportVertDistance] [int] NULL,
	[arrivalAirportCandidatesCount] [int] NULL,
 CONSTRAINT [PK_Arrival] PRIMARY KEY CLUSTERED 
(
	[id_Arrival] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Covid]    Script Date: 03/07/2022 14:16:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Covid](
	[id_covid] [int] IDENTITY(1,1) NOT NULL,
	[Nom_Pays] [varchar](50) NULL,
	[ID_pays] [varchar](50) NULL,
	[Nb_population] [int] NULL,
	[Nb_cas_positive] [int] NULL,
	[Nb_cas_guéris] [int] NULL,
	[Nb_cas_morts] [int] NULL,
	[DateP] [varchar](50) NULL,
 CONSTRAINT [PK_Covid] PRIMARY KEY CLUSTERED 
(
	[id_covid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departure]    Script Date: 03/07/2022 14:16:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departure](
	[id_Departure] [int] IDENTITY(1,1) NOT NULL,
	[id_vol] [int] NOT NULL,
	[id_aeroport] [varchar](50) NOT NULL,
	[estDepartureAirport] [varchar](50) NULL,
	[estDepartureAirportHorizDistance] [int] NULL,
	[estDepartureAirportVertDistance] [int] NULL,
	[departureAirportCandidatesCount] [int] NULL,
 CONSTRAINT [PK_Departure] PRIMARY KEY CLUSTERED 
(
	[id_Departure] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pays]    Script Date: 03/07/2022 14:16:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pays](
	[Nom_Pays] [varchar](50) NULL,
	[ID_pays] [varchar](50) NOT NULL,
	[Capitale] [varchar](50) NULL,
	[Contient] [varchar](50) NULL,
	[Position] [varchar](50) NULL,
	[Espérence_vie] [varchar](50) NULL,
	[Altitude] [varchar](50) NULL,
	[Surface] [varchar](50) NULL,
	[Latitude] [varchar](50) NULL,
	[Longitude] [varchar](50) NULL,
 CONSTRAINT [PK_Pays_Info] PRIMARY KEY CLUSTERED 
(
	[ID_pays] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vol]    Script Date: 03/07/2022 14:16:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vol](
	[id_vol] [int] NOT NULL,
	[id_aeroport] [varchar](50) NOT NULL,
	[icao24] [varchar](50) NULL,
	[firstSeen] [int] NULL,
	[lastSeen] [int] NULL,
	[callsign] [varchar](50) NULL,
 CONSTRAINT [PK_vol] PRIMARY KEY CLUSTERED 
(
	[id_vol] ASC,
	[id_aeroport] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [API_Covid19_Flight] SET  READ_WRITE 
GO
