USE [master]
GO
/****** Object:  Database [beautysalon]    Script Date: 21/12/2025 11:20:04 AM ******/
CREATE DATABASE [beautysalon]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'bs_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\bs.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'bs_Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\bs.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [beautysalon] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [beautysalon].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [beautysalon] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [beautysalon] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [beautysalon] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [beautysalon] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [beautysalon] SET ARITHABORT OFF 
GO
ALTER DATABASE [beautysalon] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [beautysalon] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [beautysalon] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [beautysalon] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [beautysalon] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [beautysalon] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [beautysalon] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [beautysalon] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [beautysalon] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [beautysalon] SET  ENABLE_BROKER 
GO
ALTER DATABASE [beautysalon] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [beautysalon] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [beautysalon] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [beautysalon] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [beautysalon] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [beautysalon] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [beautysalon] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [beautysalon] SET RECOVERY FULL 
GO
ALTER DATABASE [beautysalon] SET  MULTI_USER 
GO
ALTER DATABASE [beautysalon] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [beautysalon] SET DB_CHAINING OFF 
GO
ALTER DATABASE [beautysalon] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [beautysalon] SET TARGET_RECOVERY_TIME = 120 SECONDS 
GO
ALTER DATABASE [beautysalon] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [beautysalon] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [beautysalon] SET QUERY_STORE = ON
GO
ALTER DATABASE [beautysalon] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [beautysalon]
GO
/****** Object:  User [beautysalon_user]    Script Date: 21/12/2025 11:20:05 AM ******/
CREATE USER [beautysalon_user] FOR LOGIN [beautysalon_db_user] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Schema [beautysalon]    Script Date: 21/12/2025 11:20:05 AM ******/
CREATE SCHEMA [beautysalon]
GO
/****** Object:  Table [dbo].[atributet_sherbimeve]    Script Date: 21/12/2025 11:20:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[atributet_sherbimeve](
	[id_atributit] [int] IDENTITY(74,1) NOT NULL,
	[ID] [int] NULL,
	[opsioni] [nvarchar](255) NULL,
	[pershkrimi_opsionit] [nvarchar](max) NULL,
	[kohezgjatja] [time](7) NULL,
	[qmimi] [decimal](10, 0) NULL,
	[zbritja] [int] NULL,
 CONSTRAINT [PK_atributet_sherbimeve_id_atributit] PRIMARY KEY CLUSTERED 
(
	[id_atributit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[clients]    Script Date: 21/12/2025 11:20:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clients](
	[ID] [int] IDENTITY(8,1) NOT NULL,
	[emri] [nvarchar](20) NULL,
	[mbiemri] [nvarchar](30) NULL,
	[gjinia] [nvarchar](10) NULL,
	[numri_telefonit] [nvarchar](60) NULL,
	[data_regjistrimit] [datetime] NULL,
	[pershkrimi] [nvarchar](255) NULL,
	[username] [nvarchar](50) NOT NULL,
	[userpassword] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_clients_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employees]    Script Date: 21/12/2025 11:20:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employees](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[emri] [nvarchar](20) NOT NULL,
	[mbiemri] [nvarchar](20) NOT NULL,
	[gjinia] [nvarchar](10) NULL,
	[pershkrimi] [nvarchar](255) NULL,
	[username] [nvarchar](20) NOT NULL,
	[userpassword] [nvarchar](100) NOT NULL,
	[data_regjistrimit] [datetime] NULL,
	[is_active] [bit] NOT NULL,
	[numri_telefonit] [nvarchar](30) NULL,
	[email] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[historiku]    Script Date: 21/12/2025 11:20:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[historiku](
	[id_historikut] [int] IDENTITY(40,1) NOT NULL,
	[ID] [int] NULL,
	[data_sherbimit] [datetime2](0) NULL,
	[pagesa] [decimal](10, 2) NULL,
	[qmimiBazik] [decimal](10, 2) NULL,
	[zbritja] [int] NULL,
	[pershkrimi] [nvarchar](max) NULL,
	[kohezgjatja] [time](7) NULL,
	[emri_sherbimit] [nvarchar](255) NOT NULL,
	[emri_atributit] [nvarchar](255) NULL,
 CONSTRAINT [PK_historiku_id_historikut] PRIMARY KEY CLUSTERED 
(
	[id_historikut] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sherbimet]    Script Date: 21/12/2025 11:20:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sherbimet](
	[ID] [int] IDENTITY(4,1) NOT NULL,
	[emri_sherbimit] [nvarchar](255) NULL,
	[pershkrimi] [nvarchar](max) NULL,
	[qmimi_baze] [decimal](10, 5) NULL,
	[is_active] [smallint] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[zbritja] [int] NULL,
	[kohezgjatja] [time](7) NULL,
 CONSTRAINT [PK_sherbimet_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[te_hyrat]    Script Date: 21/12/2025 11:20:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[te_hyrat](
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_te_hyrat_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[terminet]    Script Date: 21/12/2025 11:20:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[terminet](
	[id_terminit] [int] IDENTITY(235,1) NOT NULL,
	[ID] [int] NULL,
	[ID_sherbimit] [int] NULL,
	[id_atributit] [int] NULL,
	[pershkrimi] [nvarchar](max) NULL,
	[data_caktimit] [datetime2](0) NULL,
	[kohezgjatja] [time](7) NULL,
	[qmimi] [decimal](10, 2) NULL,
	[zbritja] [int] NULL,
	[qmimiFillestar] [decimal](10, 2) NULL,
 CONSTRAINT [PK_terminet_id_terminit] PRIMARY KEY CLUSTERED 
(
	[id_terminit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 21/12/2025 11:20:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[ID] [int] IDENTITY(3,1) NOT NULL,
	[emri] [nvarchar](20) NOT NULL,
	[mbiemri] [nvarchar](20) NOT NULL,
	[username] [nvarchar](255) NULL,
	[userpassword] [nvarchar](255) NULL,
	[isAdmin] [smallint] NOT NULL,
	[dateRegistered] [datetime] NULL,
	[gjinia] [nchar](1) NOT NULL,
	[numri_telefonit] [nvarchar](255) NOT NULL,
	[pershkrimi] [nvarchar](255) NOT NULL,
	[isActive] [smallint] NOT NULL,
 CONSTRAINT [PK_users_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [ID]    Script Date: 21/12/2025 11:20:05 AM ******/
CREATE NONCLUSTERED INDEX [ID] ON [dbo].[atributet_sherbimeve]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ID]    Script Date: 21/12/2025 11:20:05 AM ******/
CREATE NONCLUSTERED INDEX [ID] ON [dbo].[historiku]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ID]    Script Date: 21/12/2025 11:20:05 AM ******/
CREATE NONCLUSTERED INDEX [ID] ON [dbo].[terminet]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [id_atributit]    Script Date: 21/12/2025 11:20:05 AM ******/
CREATE NONCLUSTERED INDEX [id_atributit] ON [dbo].[terminet]
(
	[id_atributit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ID_sherbimit]    Script Date: 21/12/2025 11:20:05 AM ******/
CREATE NONCLUSTERED INDEX [ID_sherbimit] ON [dbo].[terminet]
(
	[ID_sherbimit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[atributet_sherbimeve] ADD  DEFAULT (NULL) FOR [ID]
GO
ALTER TABLE [dbo].[atributet_sherbimeve] ADD  DEFAULT (NULL) FOR [opsioni]
GO
ALTER TABLE [dbo].[atributet_sherbimeve] ADD  DEFAULT (NULL) FOR [kohezgjatja]
GO
ALTER TABLE [dbo].[atributet_sherbimeve] ADD  DEFAULT (NULL) FOR [qmimi]
GO
ALTER TABLE [dbo].[atributet_sherbimeve] ADD  DEFAULT (NULL) FOR [zbritja]
GO
ALTER TABLE [dbo].[clients] ADD  DEFAULT (NULL) FOR [emri]
GO
ALTER TABLE [dbo].[clients] ADD  DEFAULT (NULL) FOR [mbiemri]
GO
ALTER TABLE [dbo].[clients] ADD  DEFAULT (NULL) FOR [numri_telefonit]
GO
ALTER TABLE [dbo].[clients] ADD  CONSTRAINT [DF_clients_data_regjistrimit]  DEFAULT (getdate()) FOR [data_regjistrimit]
GO
ALTER TABLE [dbo].[clients] ADD  DEFAULT (NULL) FOR [pershkrimi]
GO
ALTER TABLE [dbo].[employees] ADD  DEFAULT (getdate()) FOR [data_regjistrimit]
GO
ALTER TABLE [dbo].[employees] ADD  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[historiku] ADD  DEFAULT (NULL) FOR [ID]
GO
ALTER TABLE [dbo].[historiku] ADD  CONSTRAINT [DF_historiku_Data_sherbimit]  DEFAULT (getdate()) FOR [data_sherbimit]
GO
ALTER TABLE [dbo].[historiku] ADD  DEFAULT (NULL) FOR [pagesa]
GO
ALTER TABLE [dbo].[historiku] ADD  DEFAULT (NULL) FOR [qmimiBazik]
GO
ALTER TABLE [dbo].[historiku] ADD  DEFAULT (NULL) FOR [zbritja]
GO
ALTER TABLE [dbo].[historiku] ADD  DEFAULT (NULL) FOR [kohezgjatja]
GO
ALTER TABLE [dbo].[sherbimet] ADD  DEFAULT (NULL) FOR [emri_sherbimit]
GO
ALTER TABLE [dbo].[sherbimet] ADD  DEFAULT (NULL) FOR [qmimi_baze]
GO
ALTER TABLE [dbo].[sherbimet] ADD  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[sherbimet] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[sherbimet] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[sherbimet] ADD  DEFAULT (NULL) FOR [zbritja]
GO
ALTER TABLE [dbo].[sherbimet] ADD  DEFAULT (NULL) FOR [kohezgjatja]
GO
ALTER TABLE [dbo].[terminet] ADD  DEFAULT (NULL) FOR [ID]
GO
ALTER TABLE [dbo].[terminet] ADD  DEFAULT (NULL) FOR [ID_sherbimit]
GO
ALTER TABLE [dbo].[terminet] ADD  DEFAULT (NULL) FOR [id_atributit]
GO
ALTER TABLE [dbo].[terminet] ADD  DEFAULT (NULL) FOR [data_caktimit]
GO
ALTER TABLE [dbo].[terminet] ADD  DEFAULT ('00:00:00') FOR [kohezgjatja]
GO
ALTER TABLE [dbo].[terminet] ADD  DEFAULT (NULL) FOR [qmimi]
GO
ALTER TABLE [dbo].[terminet] ADD  DEFAULT (NULL) FOR [zbritja]
GO
ALTER TABLE [dbo].[terminet] ADD  DEFAULT (NULL) FOR [qmimiFillestar]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (N'') FOR [emri]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (N'') FOR [mbiemri]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [username]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [userpassword]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT ((0)) FOR [isAdmin]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (getdate()) FOR [dateRegistered]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (N'n') FOR [gjinia]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (N'') FOR [numri_telefonit]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (N'') FOR [pershkrimi]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[atributet_sherbimeve]  WITH NOCHECK ADD  CONSTRAINT [atributet_sherbimeve$ID] FOREIGN KEY([ID])
REFERENCES [dbo].[sherbimet] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[atributet_sherbimeve] CHECK CONSTRAINT [atributet_sherbimeve$ID]
GO
ALTER TABLE [dbo].[historiku]  WITH CHECK ADD  CONSTRAINT [fk_ID] FOREIGN KEY([ID])
REFERENCES [dbo].[clients] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[historiku] CHECK CONSTRAINT [fk_ID]
GO
ALTER TABLE [dbo].[terminet]  WITH CHECK ADD  CONSTRAINT [fk_terminet_client_id] FOREIGN KEY([ID])
REFERENCES [dbo].[clients] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[terminet] CHECK CONSTRAINT [fk_terminet_client_id]
GO
ALTER TABLE [dbo].[terminet]  WITH CHECK ADD  CONSTRAINT [fk_terminet_id_atributit] FOREIGN KEY([id_atributit])
REFERENCES [dbo].[atributet_sherbimeve] ([id_atributit])
GO
ALTER TABLE [dbo].[terminet] CHECK CONSTRAINT [fk_terminet_id_atributit]
GO
ALTER TABLE [dbo].[terminet]  WITH CHECK ADD  CONSTRAINT [fk_terminet_id_sherbimit] FOREIGN KEY([ID_sherbimit])
REFERENCES [dbo].[sherbimet] ([ID])
GO
ALTER TABLE [dbo].[terminet] CHECK CONSTRAINT [fk_terminet_id_sherbimit]
GO
/****** Object:  StoredProcedure [dbo].[clientHistory]    Script Date: 21/12/2025 11:20:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[clientHistory] @ClientId BIGINT
as 

 begin 
 SELECT h.ID, h.id_historikut, h.emri_sherbimit, h.emri_atributit, h.Data_sherbimit, 
               h.Pagesa, h.QmimiBazik, h.Zbritja, h.Pershkrimi, h.Kohezgjatja
               FROM historiku h 
            
               WHERE h.ID = @ClientId
end
GO
/****** Object:  StoredProcedure [dbo].[create_appointment]    Script Date: 21/12/2025 11:20:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[create_appointment] 

@ID BIGINT,
@ID_sherbimit BIGINT,
@id_atributit BIGINT = null,
@pershkrimi nvarchar(255),
@data_caktimit DATETIME2,
@kohezgjatja TIME,
@qmimi decimal(10,2) = 0,
@zbritja int = 0,
@qmimiFillestar decimal(10,2) = 0

 as
   begin 

    insert into terminet(ID, ID_sherbimit, id_atributit, pershkrimi, data_caktimit, kohezgjatja, qmimi, zbritja, qmimiFillestar)
    VALUES(@ID, @ID_sherbimit, @id_atributit, @pershkrimi, @data_caktimit, @kohezgjatja, @qmimi, @zbritja,@qmimiFillestar);

    end;
GO
/****** Object:  StoredProcedure [dbo].[register_client_history]    Script Date: 21/12/2025 11:20:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[register_client_history] 

 @ID BIGINT,
 @emri_sherbimit NVARCHAR(255),
 @emri_atributit NVARCHAR(255) = null,
 @pagesa decimal(10,2),
 @qmimiBazik decimal(10,2),
 @zbritja int = 0,
 @pershkrimi nvarchar(255) = null,
 @kohezgjatja time 
 as
   
    begin
       insert into historiku(ID, emri_sherbimit, emri_atributit, pagesa, qmimiBazik, zbritja, pershkrimi, kohezgjatja)
       values(@ID, @emri_sherbimit, @emri_atributit, @pagesa, @qmimiBazik, @zbritja, @pershkrimi,@kohezgjatja);

    end;
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'beautysalon.atributet_sherbimeve' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'atributet_sherbimeve'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'beautysalon.clients' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'clients'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'beautysalon.historiku' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'historiku'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'beautysalon.sherbimet' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sherbimet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'beautysalon.te_hyrat' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'te_hyrat'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'beautysalon.terminet' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'terminet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'beautysalon.users' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'users'
GO
USE [master]
GO
ALTER DATABASE [beautysalon] SET  READ_WRITE 
GO
