USE [master]
GO
/****** Object:  Database [Calendarizacion]    Script Date: 31/10/2020 20:24:03 ******/
CREATE DATABASE [Calendarizacion]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Calendarizacion', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Calendarizacion.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Calendarizacion_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Calendarizacion_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Calendarizacion] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Calendarizacion].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Calendarizacion] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Calendarizacion] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Calendarizacion] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Calendarizacion] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Calendarizacion] SET ARITHABORT OFF 
GO
ALTER DATABASE [Calendarizacion] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Calendarizacion] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Calendarizacion] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Calendarizacion] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Calendarizacion] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Calendarizacion] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Calendarizacion] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Calendarizacion] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Calendarizacion] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Calendarizacion] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Calendarizacion] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Calendarizacion] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Calendarizacion] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Calendarizacion] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Calendarizacion] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Calendarizacion] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Calendarizacion] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Calendarizacion] SET RECOVERY FULL 
GO
ALTER DATABASE [Calendarizacion] SET  MULTI_USER 
GO
ALTER DATABASE [Calendarizacion] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Calendarizacion] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Calendarizacion] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Calendarizacion] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Calendarizacion] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Calendarizacion] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Calendarizacion', N'ON'
GO
ALTER DATABASE [Calendarizacion] SET QUERY_STORE = OFF
GO
USE [Calendarizacion]
GO
/****** Object:  Table [dbo].[BloqueHorario]    Script Date: 31/10/2020 20:24:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BloqueHorario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[ClaseDiaId] [int] NULL,
	[PeriodoId] [int] NULL,
	[Observacion] [varchar](50) NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_BloqueHorario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClaseDia]    Script Date: 31/10/2020 20:24:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClaseDia](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_ClaseDia] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiasSemana]    Script Date: 31/10/2020 20:24:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiasSemana](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClaseDiaId] [int] NULL,
	[DiaSemana] [int] NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_DiasSemana] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feriados]    Script Date: 31/10/2020 20:24:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feriados](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClaseDiaId] [int] NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Fecha] [date] NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_Feriados] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Horario]    Script Date: 31/10/2020 20:24:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Horario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BloqueHorarioId] [int] NULL,
	[HorarioInicio] [date] NOT NULL,
	[HorarioFinal] [date] NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_Horario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Periodo]    Script Date: 31/10/2020 20:24:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Periodo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_Periodo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BloqueHorario] ON 

INSERT [dbo].[BloqueHorario] ([Id], [Nombre], [ClaseDiaId], [PeriodoId], [Observacion], [Estado]) VALUES (2, N'Diurno', 1, 1, N'Ninguna', 1)
INSERT [dbo].[BloqueHorario] ([Id], [Nombre], [ClaseDiaId], [PeriodoId], [Observacion], [Estado]) VALUES (6, N'Nocturno', 1, 1, N'Ninguna', 0)
SET IDENTITY_INSERT [dbo].[BloqueHorario] OFF
GO
SET IDENTITY_INSERT [dbo].[ClaseDia] ON 

INSERT [dbo].[ClaseDia] ([Id], [Nombre], [Estado]) VALUES (1, N'Laborable', 0)
INSERT [dbo].[ClaseDia] ([Id], [Nombre], [Estado]) VALUES (2, N'Sabado', 0)
INSERT [dbo].[ClaseDia] ([Id], [Nombre], [Estado]) VALUES (3, N'Domingo', 1)
SET IDENTITY_INSERT [dbo].[ClaseDia] OFF
GO
SET IDENTITY_INSERT [dbo].[DiasSemana] ON 

INSERT [dbo].[DiasSemana] ([Id], [ClaseDiaId], [DiaSemana], [Estado]) VALUES (2, 1, 1, 0)
INSERT [dbo].[DiasSemana] ([Id], [ClaseDiaId], [DiaSemana], [Estado]) VALUES (3, 2, 2, 1)
INSERT [dbo].[DiasSemana] ([Id], [ClaseDiaId], [DiaSemana], [Estado]) VALUES (4, 3, 3, 0)
SET IDENTITY_INSERT [dbo].[DiasSemana] OFF
GO
SET IDENTITY_INSERT [dbo].[Feriados] ON 

INSERT [dbo].[Feriados] ([Id], [ClaseDiaId], [Nombre], [Fecha], [Estado]) VALUES (1, 1, N'Lunes', CAST(N'2020-10-02' AS Date), 1)
INSERT [dbo].[Feriados] ([Id], [ClaseDiaId], [Nombre], [Fecha], [Estado]) VALUES (2, 2, N'Martes', CAST(N'2020-10-03' AS Date), 0)
SET IDENTITY_INSERT [dbo].[Feriados] OFF
GO
SET IDENTITY_INSERT [dbo].[Horario] ON 

INSERT [dbo].[Horario] ([Id], [BloqueHorarioId], [HorarioInicio], [HorarioFinal], [Estado]) VALUES (4, 2, CAST(N'2020-02-02' AS Date), CAST(N'2020-02-28' AS Date), 1)
INSERT [dbo].[Horario] ([Id], [BloqueHorarioId], [HorarioInicio], [HorarioFinal], [Estado]) VALUES (9, 6, CAST(N'2020-03-02' AS Date), CAST(N'2020-03-28' AS Date), 0)
SET IDENTITY_INSERT [dbo].[Horario] OFF
GO
SET IDENTITY_INSERT [dbo].[Periodo] ON 

INSERT [dbo].[Periodo] ([Id], [Nombre], [Estado]) VALUES (1, N'Periodo de Punta', 0)
INSERT [dbo].[Periodo] ([Id], [Nombre], [Estado]) VALUES (3, N'Periodo Intermedio', 0)
INSERT [dbo].[Periodo] ([Id], [Nombre], [Estado]) VALUES (4, N'Periodo de Valle', 0)
SET IDENTITY_INSERT [dbo].[Periodo] OFF
GO
ALTER TABLE [dbo].[BloqueHorario]  WITH CHECK ADD  CONSTRAINT [FK_BloqueHorario_ClaseDia] FOREIGN KEY([ClaseDiaId])
REFERENCES [dbo].[ClaseDia] ([Id])
GO
ALTER TABLE [dbo].[BloqueHorario] CHECK CONSTRAINT [FK_BloqueHorario_ClaseDia]
GO
ALTER TABLE [dbo].[BloqueHorario]  WITH CHECK ADD  CONSTRAINT [FK_BloqueHorario_Periodo] FOREIGN KEY([PeriodoId])
REFERENCES [dbo].[Periodo] ([Id])
GO
ALTER TABLE [dbo].[BloqueHorario] CHECK CONSTRAINT [FK_BloqueHorario_Periodo]
GO
ALTER TABLE [dbo].[DiasSemana]  WITH CHECK ADD  CONSTRAINT [FK_DiasSemana_ClaseDia] FOREIGN KEY([ClaseDiaId])
REFERENCES [dbo].[ClaseDia] ([Id])
GO
ALTER TABLE [dbo].[DiasSemana] CHECK CONSTRAINT [FK_DiasSemana_ClaseDia]
GO
ALTER TABLE [dbo].[Feriados]  WITH CHECK ADD  CONSTRAINT [FK_Feriados_ClaseDia] FOREIGN KEY([ClaseDiaId])
REFERENCES [dbo].[ClaseDia] ([Id])
GO
ALTER TABLE [dbo].[Feriados] CHECK CONSTRAINT [FK_Feriados_ClaseDia]
GO
ALTER TABLE [dbo].[Horario]  WITH CHECK ADD  CONSTRAINT [FK_Horario_BloqueHorario] FOREIGN KEY([BloqueHorarioId])
REFERENCES [dbo].[BloqueHorario] ([Id])
GO
ALTER TABLE [dbo].[Horario] CHECK CONSTRAINT [FK_Horario_BloqueHorario]
GO
USE [master]
GO
ALTER DATABASE [Calendarizacion] SET  READ_WRITE 
GO
