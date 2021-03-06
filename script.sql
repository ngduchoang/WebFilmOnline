USE [master]
GO
/****** Object:  Database [MovieProjectV2]    Script Date: 7/15/2020 9:33:48 PM ******/
CREATE DATABASE [MovieProjectV2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MovieProject', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\MovieProjectV2.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MovieProject_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\MovieProjectV2_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MovieProjectV2] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MovieProjectV2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MovieProjectV2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MovieProjectV2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MovieProjectV2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MovieProjectV2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MovieProjectV2] SET ARITHABORT OFF 
GO
ALTER DATABASE [MovieProjectV2] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [MovieProjectV2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MovieProjectV2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MovieProjectV2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MovieProjectV2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MovieProjectV2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MovieProjectV2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MovieProjectV2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MovieProjectV2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MovieProjectV2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MovieProjectV2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MovieProjectV2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MovieProjectV2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MovieProjectV2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MovieProjectV2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MovieProjectV2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MovieProjectV2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MovieProjectV2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MovieProjectV2] SET  MULTI_USER 
GO
ALTER DATABASE [MovieProjectV2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MovieProjectV2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MovieProjectV2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MovieProjectV2] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [MovieProjectV2] SET DELAYED_DURABILITY = DISABLED 
GO
USE [MovieProjectV2]
GO
/****** Object:  Table [dbo].[About]    Script Date: 7/15/2020 9:33:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[About](
	[AboutID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Image] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL CONSTRAINT [DF_About_CreatedDate]  DEFAULT (getdate()),
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nchar](250) NULL,
	[Status] [bit] NOT NULL CONSTRAINT [DF_About_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_About] PRIMARY KEY CLUSTERED 
(
	[AboutID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ads]    Script Date: 7/15/2020 9:33:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ads](
	[AdsID] [int] IDENTITY(1,1) NOT NULL,
	[NameAds] [nvarchar](50) NULL,
	[ImageAds] [nvarchar](max) NULL,
	[UrlAds] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nchar](250) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_ads] PRIMARY KEY CLUSTERED 
(
	[AdsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/15/2020 9:33:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[NameCategory] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL CONSTRAINT [DF_Category_CreatedDate]  DEFAULT (getdate()),
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nchar](250) NULL,
	[Status] [bit] NOT NULL CONSTRAINT [DF_Category_Status]  DEFAULT ((1)),
	[ParentID] [int] NULL,
	[DisplayOrder] [int] NULL CONSTRAINT [DF_Category_DisplayOrder]  DEFAULT ((0)),
	[SeoTittle] [nvarchar](250) NULL,
 CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 7/15/2020 9:33:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Comments](
	[CommentID] [int] IDENTITY(1,1) NOT NULL,
	[MovieID] [int] NULL,
	[Name] [varchar](100) NULL,
	[Content] [varchar](max) NULL,
	[UserID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nchar](250) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 7/15/2020 9:33:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](max) NULL,
	[Status] [bit] NOT NULL CONSTRAINT [DF_Contact_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Country]    Script Date: 7/15/2020 9:33:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[CountryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](10) NULL,
	[CreatedDate] [datetime] NULL CONSTRAINT [DF_Country_CreatedDate]  DEFAULT (getdate()),
	[Status] [bit] NOT NULL CONSTRAINT [DF_Country_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Credential]    Script Date: 7/15/2020 9:33:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Credential](
	[UserGroupID] [varchar](20) NOT NULL,
	[RoleID] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Credential] PRIMARY KEY CLUSTERED 
(
	[UserGroupID] ASC,
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 7/15/2020 9:33:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Content] [text] NULL,
	[Address] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL CONSTRAINT [DF_Feedback_CreatedDate]  DEFAULT (getdate()),
	[Status] [bit] NULL CONSTRAINT [DF_Feedback_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Movie]    Script Date: 7/15/2020 9:33:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Movie](
	[MovieID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Image] [nvarchar](max) NULL,
	[MoreImages] [xml] NULL,
	[Actor] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
	[Directors] [nvarchar](50) NULL,
	[Time] [text] NULL,
	[Year] [int] NULL,
	[Country] [nvarchar](50) NULL,
	[MovieLink] [nvarchar](max) NULL,
	[TrailerLink] [nvarchar](max) NULL,
	[CategoryID] [int] NULL,
	[Rate] [int] NULL,
	[TrailerID] [int] NULL,
	[Viewed] [int] NOT NULL CONSTRAINT [DF_Movies_Viewed]  DEFAULT ((0)),
	[CreatedDate] [datetime] NULL CONSTRAINT [DF_Movies_CreatedDate]  DEFAULT (getdate()),
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nchar](250) NULL,
	[Status] [bit] NOT NULL CONSTRAINT [DF_Movies_Status]  DEFAULT ((1)),
	[TopHot] [datetime] NULL,
	[CountryID] [int] NULL,
 CONSTRAINT [PK_movie] PRIMARY KEY CLUSTERED 
(
	[MovieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[News]    Script Date: 7/15/2020 9:33:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[News](
	[NewsID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Year] [int] NULL,
	[Country] [nvarchar](50) NULL,
	[MovieLink] [nvarchar](max) NULL,
	[TrailerLink] [nvarchar](max) NULL,
	[CategoryID] [int] NULL,
	[Rate] [int] NULL,
	[TrailerID] [int] NULL,
	[Viewed] [int] NOT NULL CONSTRAINT [DF_News_Viewed]  DEFAULT ((0)),
	[CreatedDate] [datetime] NULL CONSTRAINT [DF_News_CreatedDate_1]  DEFAULT (getdate()),
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nvarchar](max) NULL,
	[Status] [bit] NOT NULL CONSTRAINT [DF_News_Status_1]  DEFAULT ((1)),
	[TopHot] [datetime] NULL,
	[Tags] [nvarchar](500) NULL,
	[ImageNews] [nvarchar](max) NULL,
	[MoreDescription] [nvarchar](max) NULL,
 CONSTRAINT [PK_News_1] PRIMARY KEY CLUSTERED 
(
	[NewsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Permission]    Script Date: 7/15/2020 9:33:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Permission](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_Permissions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Role]    Script Date: 7/15/2020 9:33:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Slide]    Script Date: 7/15/2020 9:33:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Slide](
	[SlideID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
	[Url] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL CONSTRAINT [DF_Slides_CreatedDate]  DEFAULT (getdate()),
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[Status] [bit] NOT NULL CONSTRAINT [DF_Slides_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_slides] PRIMARY KEY CLUSTERED 
(
	[SlideID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Trailer]    Script Date: 7/15/2020 9:33:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Trailer](
	[TrailerID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Image] [nvarchar](max) NULL,
	[Url] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL CONSTRAINT [DF_Trailers_CreatedDate]  DEFAULT (getdate()),
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[Status] [bit] NOT NULL CONSTRAINT [DF_Trailers_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_trailer] PRIMARY KEY CLUSTERED 
(
	[TrailerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 7/15/2020 9:33:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](32) NULL,
	[PermissionID] [int] NULL,
	[CreatedDate] [datetime] NULL CONSTRAINT [DF_Users_CreatedDate]  DEFAULT (getdate()),
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[Status] [bit] NOT NULL CONSTRAINT [DF_Users_Status]  DEFAULT ((1)),
	[Phone] [varchar](150) NULL,
	[Email] [varchar](250) NULL,
	[GroupID] [varchar](20) NULL CONSTRAINT [DF_User_GroupID]  DEFAULT ('MEMBER'),
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserGroup]    Script Date: 7/15/2020 9:33:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserGroup](
	[ID] [varchar](20) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserGroup] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[About] ON 

INSERT [dbo].[About] ([AboutID], [Name], [Image], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (1, N'Giới thiệu OneMovies', N'/Data/files/ironman.jpg', N'<p style="text-align:center"><span style="font-size:18px"><strong>ONEMOVIES - Website Xem Phim miễn ph&iacute;&nbsp; </strong></span></p>

<hr />
<p><strong><em>OneMovie</em></strong> được x&acirc;y dựng nhằm cung cấp những bộ phim miễn ph&iacute; c&oacute; sẵn tr&ecirc;n Internet.</p>

<p>Gi&uacute;p cho bạn dễ d&agrave;ng t&igrave;m kiếm, tải xuống bộ phim m&agrave; bạn y&ecirc;u th&iacute;ch <img alt="cheeky" src="http://localhost:52046/Areas/Admin/ckeditor/plugins/smiley/images/tongue_smile.png" style="height:23px; width:23px" title="cheeky" /></p>

<p>Nếu bạn thấy <strong><em>OneMovies</em></strong> chưa c&oacute; bộ phim bạn mong muốn hoặc c&oacute; điều g&igrave; chưa h&agrave;i l&ograve;ng h&atilde;y Li&ecirc;n&nbsp; hệ cho ch&uacute;ng t&ocirc;i.</p>

<p>Ch&uacute;ng t&ocirc;i sẽ tiếp nhận &yacute; kiến của bạn để ng&agrave;y c&agrave;ng ph&aacute;t triển OneMovies hơn ^^</p>

<hr />
<p>H&atilde;y tiếp th&ecirc;m động lực cho ch&uacute;ng t&ocirc;i bằng c&aacute;ch click v&agrave;o những quảng c&aacute;o xuất hiện tr&ecirc;n website.</p>

<p>N&oacute; sẽ gi&uacute;p <strong><em>OneMovies</em></strong> c&oacute; th&ecirc;m nguồn kinh ph&iacute; để duy tr&igrave; hoạt động <img alt="laugh" src="http://localhost:52046/Areas/Admin/ckeditor/plugins/smiley/images/teeth_smile.png" style="height:23px; width:23px" title="laugh" /></p>

<hr />
<p><span style="font-size:16px"><em><strong>Cảm ơn bạn ! <img alt="heart" src="http://localhost:52046/Areas/Admin/ckeditor/plugins/smiley/images/heart.png" style="height:23px; width:23px" title="heart" /></strong></em></span></p>
', CAST(N'2020-05-18 11:55:04.353' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[About] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [NameCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ParentID], [DisplayOrder], [SeoTittle]) VALUES (1007, N'KINH DỊ', CAST(N'2019-10-31 23:41:06.130' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Category] ([CategoryID], [NameCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ParentID], [DisplayOrder], [SeoTittle]) VALUES (1008, N'VIỄN TƯỞNG', CAST(N'2019-10-31 23:41:27.253' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Category] ([CategoryID], [NameCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ParentID], [DisplayOrder], [SeoTittle]) VALUES (1009, N'HÌNH SỰ', CAST(N'2019-10-31 23:41:40.050' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Category] ([CategoryID], [NameCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ParentID], [DisplayOrder], [SeoTittle]) VALUES (1010, N'TRINH THÁM', CAST(N'2019-10-31 23:41:55.097' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Category] ([CategoryID], [NameCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ParentID], [DisplayOrder], [SeoTittle]) VALUES (1011, N'HÀI HƯỚC', CAST(N'2019-10-31 23:42:05.110' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Category] ([CategoryID], [NameCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ParentID], [DisplayOrder], [SeoTittle]) VALUES (1018, N'PHIÊU LƯU', CAST(N'2019-11-20 10:15:25.393' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Category] ([CategoryID], [NameCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ParentID], [DisplayOrder], [SeoTittle]) VALUES (1019, N'HÀNH ĐỘNG', CAST(N'2019-11-20 10:17:54.550' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Category] ([CategoryID], [NameCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ParentID], [DisplayOrder], [SeoTittle]) VALUES (1020, N'TÌNH CẢM', CAST(N'2019-11-20 10:26:16.893' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Category] ([CategoryID], [NameCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ParentID], [DisplayOrder], [SeoTittle]) VALUES (1021, N'HOẠT HÌNH', CAST(N'2019-11-20 10:51:42.430' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([ID], [Content], [Status]) VALUES (1, N'<p>&nbsp;</p>

<p><em><span style="font-size:18px"><span style="font-family:Times New Roman,Times,serif"><strong>Website Phim Free OneMovies Việt Nam</strong></span></span></em></p>

<p><span style="font-size:18px"><span style="font-family:Times New Roman,Times,serif">Cung cấp phim<em><strong> miễn ph&iacute;</strong></em> cho c&aacute;c bạn :))</span></span></p>

<p><span style="font-size:18px"><span style="font-family:Times New Roman,Times,serif">H&atilde;y ủng hộ m&igrave;nh bằng c&aacute;ch click v&agrave;o quảng c&aacute;o</span></span></p>

<p><strong><span style="font-size:18px"><span style="font-family:Times New Roman,Times,serif">Cảm ơn!</span></span></strong></p>

<p><span style="font-size:18px"><span style="font-family:Times New Roman,Times,serif">Th&ocirc;ng tin li&ecirc;n hệ:</span></span></p>

<p><span style="font-size:18px"><span style="font-family:Times New Roman,Times,serif">Facebook:&nbsp; www.facebook.com/sonkenneth98/</span></span></p>

<p><span style="font-size:18px"><span style="font-family:Times New Roman,Times,serif">Instagram:</span></span><span style="font-size:16px"> www.instagram.com/sontran2110/</span></p>

<p><span style="font-size:16px">Mobile Phone: 039.258.8899</span></p>
', 0)
INSERT [dbo].[Contact] ([ID], [Content], [Status]) VALUES (5, N'<p><span style="font-size:16px"><strong>OneMovies - Website Xem Phim Miễn Ph&iacute; ! </strong></span></p>

<p><span style="font-size:16px"><strong>Facebook:</strong> <em>www.facebook.com/sonkenneth98</em></span></p>
', 1)
SET IDENTITY_INSERT [dbo].[Contact] OFF
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([CountryID], [Name], [CreatedDate], [Status]) VALUES (1, N'Mỹ        ', CAST(N'2019-11-18 09:06:43.960' AS DateTime), 1)
INSERT [dbo].[Country] ([CountryID], [Name], [CreatedDate], [Status]) VALUES (2, N'Anh       ', CAST(N'2019-11-18 09:06:53.303' AS DateTime), 1)
INSERT [dbo].[Country] ([CountryID], [Name], [CreatedDate], [Status]) VALUES (4, N'Việt Nam  ', CAST(N'2019-11-18 09:07:11.613' AS DateTime), 1)
INSERT [dbo].[Country] ([CountryID], [Name], [CreatedDate], [Status]) VALUES (5, N'Hàn Quốc  ', CAST(N'2019-11-18 09:07:19.817' AS DateTime), 1)
INSERT [dbo].[Country] ([CountryID], [Name], [CreatedDate], [Status]) VALUES (6, N'Nhật Bản  ', CAST(N'2019-11-18 09:07:31.287' AS DateTime), 1)
INSERT [dbo].[Country] ([CountryID], [Name], [CreatedDate], [Status]) VALUES (7, N'Thái Lan  ', CAST(N'2019-11-18 09:10:45.913' AS DateTime), 1)
INSERT [dbo].[Country] ([CountryID], [Name], [CreatedDate], [Status]) VALUES (1002, N'Trung Quốc', CAST(N'2019-11-20 10:50:26.650' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Country] OFF
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([ID], [Name], [Phone], [Email], [Content], [Address], [CreatedDate], [Status]) VALUES (17, N'Nguyễn Đức Hoàng', N'0792065655', N'duchoangnguyen1998@gmail.com', N'tét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....téttét....tét', N'Hội An, Quảng Nam', CAST(N'2020-05-20 09:27:03.273' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Feedback] OFF
SET IDENTITY_INSERT [dbo].[Movie] ON 

INSERT [dbo].[Movie] ([MovieID], [Name], [Image], [MoreImages], [Actor], [Description], [Directors], [Time], [Year], [Country], [MovieLink], [TrailerLink], [CategoryID], [Rate], [TrailerID], [Viewed], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [CountryID]) VALUES (1019, N'Xác Sống 9', N'/Data/images/Movies/xacsong9.jpg', N'e', N'Rich Grime', N'<p><strong>X&aacute;c Sống / The Walking Dead phần 9</strong> sẽ lấy bối cảnh sau cuộc Chiến tranh To&agrave;n diện (All Out War). Lần n&agrave;y, Rick Grimes đang đứng đầu một nh&oacute;m người sống s&oacute;t đang kh&aacute; ho&agrave; thuận với nhau, đồng thời đang ph&aacute;t triển mạng lưới thương mại v&agrave; hầu như kh&ocirc;ng c&oacute; bất cứ xung đột vũ trang g&igrave;.<br />
<br />
Tuy nhi&ecirc;n, mọi chuyện kh&ocirc;ng hề đơn giản với<strong> Maggie</strong> v&agrave; <strong>Daryl</strong> khi những hệ quả k&eacute;o theo sau cuộc chiến của Những vị cứu tinh v&agrave; việc <strong>Negan</strong> được tha mạng đ&atilde; l&agrave;m rạn nứt t&igrave;nh cảm giữa 2 người.</p>

<p><img alt="" src="/Data/images/Movies/xs9nd.jpg" style="height:471px; width:800px" /></p>
', N'Frank Darabont, Angela Kang', N'150 phút', 2018, N'Mỹ', N'1ch3G2iWjMIUGDD5zDtjCqv6C2HzvBzQe', N'https://www.youtube.com/embed/Ie_6qO0B8AU', 1007, 10, NULL, 121243251, CAST(N'2020-04-28 19:36:01.407' AS DateTime), NULL, NULL, NULL, N'Xac-Song-9', NULL, 1, NULL, 1)
INSERT [dbo].[Movie] ([MovieID], [Name], [Image], [MoreImages], [Actor], [Description], [Directors], [Time], [Year], [Country], [MovieLink], [TrailerLink], [CategoryID], [Rate], [TrailerID], [Viewed], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [CountryID]) VALUES (1020, N'3 chàng ngốc', N'/Data/images/Movies/3idiots.jpg', N'/Data/images/Movies/3idiots.jpg', N'Mona SinghMona,Sharman JoshiRaju Rastogi', N'<p>p&gt;Bộ phim kể về t&igrave;nh bạn của ba anh ch&agrave;ng Farhan, Raju v&agrave; Rancho từ khi họ c&ograve;n l&agrave; sinh vi&ecirc;n đến khi trưởng th&agrave;nh. Trong thời gian ngồi tr&ecirc;n giảng đường, Rancho đ&atilde; c&oacute; ảnh hưởng rất lớn đến cuộc sống, tương lai của Farhan v&agrave; Raju. Sau khi ra trường, Rancho đột nhi&ecirc;n biến mất. 10 năm sau, khi t&igrave;m được manh mối về nơi sinh sống của cậu bạn th&acirc;n năm xưa, Farhan v&agrave; Raju quyết định l&ecirc;n đường t&igrave;m Rancho...</p>

<p>&nbsp;</p>
', N'Rajkumar Hirani, ', N'170 phút', 2009, N'Ấn độ', N'1X_I-yOerlvXQaT5MFKVXaqqAIEHqdTax', N'https://www.youtube.com/embed/K0eDlFX9GMc', 1011, 9, NULL, 1224275, CAST(N'2020-07-06 20:09:48.697' AS DateTime), NULL, NULL, NULL, N'3-chang-ngoc', NULL, 1, NULL, 2)
INSERT [dbo].[Movie] ([MovieID], [Name], [Image], [MoreImages], [Actor], [Description], [Directors], [Time], [Year], [Country], [MovieLink], [TrailerLink], [CategoryID], [Rate], [TrailerID], [Viewed], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [CountryID]) VALUES (1022, N'12 kỵ binh', N'/Data/images/Movies/12kibinh.jpg', N'/Data/images/Movies/12kibinh.jpg', N'john son baby', N'<p>p&gt;Vương quốc Wakanda, qu&ecirc; hương của Black Panther/ T&#39;Challa hiện ra qua lời kể của một nh&acirc;n chứng sống s&oacute;t trở về. Đ&acirc;y l&agrave; quốc gia kh&aacute; kh&eacute;p k&iacute;n v&agrave; sở hữu lượng Vibranium lớn nhất tr&ecirc;n thế giới. Black Panther - người cầm quyền của Wakanda sở hữu bộ &aacute;o gi&aacute;p chống đạn v&agrave; m&oacute;ng vuốt sắc nhọn, anh được mi&ecirc;u tả l&agrave; &ldquo;người tốt với tr&aacute;i tim nh&acirc;n hậu&rdquo;.<br />
<br />
Nhưng cũng ch&iacute;nh v&igrave; những đức t&iacute;nh tốt n&agrave;y m&agrave; Black Panther gặp kh&oacute; khăn khi kế thừa ngai v&agrave;ng sau khi vua cha băng h&agrave;. Đối mặt với sự phản bội v&agrave; hiểm nguy, vị vua trẻ phải tập hợp c&aacute;c đồng minh v&agrave; ph&aacute;t huy to&agrave;n bộ sức mạnh của Black Panther để đ&aacute;nh bại kẻ th&ugrave;, đem lại an b&igrave;nh cho nh&acirc;n d&acirc;n của m&igrave;nh.</p>

<p>&nbsp;</p>
', N'hehehe', N'130 phút', 2018, N'Mỹ', N'1ch3G2iWjMIUGDD5zDtjCqv6C2HzvBzQe', N'updating', 1008, 7, NULL, 34534544, CAST(N'2019-10-30 14:30:06.940' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2019-10-30 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Movie] ([MovieID], [Name], [Image], [MoreImages], [Actor], [Description], [Directors], [Time], [Year], [Country], [MovieLink], [TrailerLink], [CategoryID], [Rate], [TrailerID], [Viewed], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [CountryID]) VALUES (1025, N'Xác Chết Trở Về', N'/Data/images/Movies/a1(1).jpg', N'/', N'Seol-hee', N'<p>YOON Seol-hee, Chủ tịch của một tập đo&agrave;n lớn, được ph&aacute;t hiện đ&atilde; tử vong. X&aacute;c của c&ocirc; ta đặt trong nh&agrave; x&aacute;c, đang chờ được kh&aacute;m nghiệm bởi Cục Ph&aacute;p Y Quốc Gia, th&igrave; đột nhi&ecirc;n n&oacute; biến mất một c&aacute;ch b&iacute; ẩn kh&ocirc;ng dấu vết. Trong khi người chồng c&ocirc; ta đang bị nghi ngờ l&agrave; thủ phạm, cảnh s&aacute;t Joongsik quyết điều tra cho ra người đ&atilde; đ&aacute;nh cắp c&aacute;i x&aacute;c v&agrave; v&igrave; l&iacute; do g&igrave;.</p>
', N'Lee Chang-Hee', N'140 phút', 2018, N'Hàn Quốc', N'1ch3G2iWjMIUGDD5zDtjCqv6C2HzvBzQe', N'updating', 1007, 9, NULL, 2342, CAST(N'2019-10-30 14:02:21.697' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2019-10-30 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Movie] ([MovieID], [Name], [Image], [MoreImages], [Actor], [Description], [Directors], [Time], [Year], [Country], [MovieLink], [TrailerLink], [CategoryID], [Rate], [TrailerID], [Viewed], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [CountryID]) VALUES (1026, N'Búp Bê Ma Quái', N'/Data/images/Movies/bupbema.jpg', N'/', N'/', N'<p>Third film in the &#39;Annabelle&#39; franchise.</p>
', N'Gary Dauberman, ', N'130 phút', 2019, N'Mỹ', N'1ch3G2iWjMIUGDD5zDtjCqv6C2HzvBzQe', N'updating', 1007, 8, NULL, 5565, CAST(N'2019-10-30 14:07:06.987' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2019-10-29 00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Movie] ([MovieID], [Name], [Image], [MoreImages], [Actor], [Description], [Directors], [Time], [Year], [Country], [MovieLink], [TrailerLink], [CategoryID], [Rate], [TrailerID], [Viewed], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [CountryID]) VALUES (1027, N'Báo Đen', N'/Data/images/Movies/Baod.jpg', N'/', N'Chadwick Boseman,Michael B. JordanErik...', N'<p>Vương quốc Wakanda, qu&ecirc; hương của Black Panther/ T&#39;Challa hiện ra qua lời kể của một nh&acirc;n chứng sống s&oacute;t trở về. Đ&acirc;y l&agrave; quốc gia kh&aacute; kh&eacute;p k&iacute;n v&agrave; sở hữu lượng Vibranium lớn nhất tr&ecirc;n thế giới. Black Panther - người cầm quyền của Wakanda sở hữu bộ &aacute;o gi&aacute;p chống đạn v&agrave; m&oacute;ng vuốt sắc nhọn, anh được mi&ecirc;u tả l&agrave; &ldquo;người tốt với tr&aacute;i tim nh&acirc;n hậu&rdquo;.<br />
<br />
Nhưng cũng ch&iacute;nh v&igrave; những đức t&iacute;nh tốt n&agrave;y m&agrave; Black Panther gặp kh&oacute; khăn khi kế thừa ngai v&agrave;ng sau khi vua cha băng h&agrave;. Đối mặt với sự phản bội v&agrave; hiểm nguy, vị vua trẻ phải tập hợp c&aacute;c đồng minh v&agrave; ph&aacute;t huy to&agrave;n bộ sức mạnh của Black Panther để đ&aacute;nh bại kẻ th&ugrave;, đem lại an b&igrave;nh cho nh&acirc;n d&acirc;n của m&igrave;nh.</p>
', N'Ryan Coogler, ', N'120 phút', 2017, N'Mỹ', N'1ch3G2iWjMIUGDD5zDtjCqv6C2HzvBzQe', N'updating', 1007, 9, NULL, 34645, CAST(N'2019-10-30 14:10:39.460' AS DateTime), NULL, NULL, NULL, NULL, NULL, 0, CAST(N'2019-10-30 00:00:00.000' AS DateTime), 4)
INSERT [dbo].[Movie] ([MovieID], [Name], [Image], [MoreImages], [Actor], [Description], [Directors], [Time], [Year], [Country], [MovieLink], [TrailerLink], [CategoryID], [Rate], [TrailerID], [Viewed], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [CountryID]) VALUES (1028, N'Lưỡi cưa 8', N'/Data/images/Movies/JW8.jpg', N'/', N'Tobin bell, ,mattpassmore', N'<p>Đ&acirc;y c&oacute; thể xem l&agrave; phần thứ 8 của loạt phim Saw, nhưng kh&ocirc;ng c&oacute; nghĩa l&agrave; ch&uacute;ng ta đ&atilde; thấy người cuối c&ugrave;ng đằng sau mọi sự việc. Chắc chắn, một v&agrave;i c&aacute;i chết ch&iacute;nh trong loạt phim c&oacute; thể đ&atilde; cản trở cốt truyện cho một số nh&acirc;n vật tương lai, nhưng c&oacute; rất nhiều chi tiết c&oacute; thể sẽ được sử dụng được để x&acirc;y dựng n&ecirc;n Saw 8. Ai biết di sản hung bạo m&agrave; Jigsaw để lại sẽ đưa ch&uacute;ng ta đến đ&acirc;u?</p>
', N'huskcentber', N'120 phút', 2017, N'Mỹ, Canada', N'1ch3G2iWjMIUGDD5zDtjCqv6C2HzvBzQe', N'updating', 1007, 9, NULL, 44363, CAST(N'2019-10-30 14:15:17.393' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2019-10-30 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Movie] ([MovieID], [Name], [Image], [MoreImages], [Actor], [Description], [Directors], [Time], [Year], [Country], [MovieLink], [TrailerLink], [CategoryID], [Rate], [TrailerID], [Viewed], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [CountryID]) VALUES (1029, N'Ác Nhân', N'/Data/images/Movies/acnhan.jpg', N'/', N'Lee Byung-hun', N'<p>Bộ phim kể về một người đ&agrave;n &ocirc;ng đau đớn khi vị h&ocirc;n th&ecirc; của m&igrave;nh bị s&aacute;t hại bởi một tay giết người h&agrave;ng loạt. Anh l&agrave; một nh&acirc;n vi&ecirc;n đặc vụ của ch&iacute;nh phủ v&agrave; thường ho&agrave;n th&agrave;nh sứ mệnh của m&igrave;nh một c&aacute;ch ho&agrave;n hảo. Tuy nhi&ecirc;n, việc kh&ocirc;ng thể bảo vệ người m&agrave; m&igrave;nh y&ecirc;u nhất khiến anh đau khổ, tức giận v&agrave; n&oacute;ng l&ograve;ng b&aacute;o th&ugrave; kẻ s&aacute;t nh&acirc;n. Bộ phim l&agrave; c&acirc;u chuyện truy đuổi kẻ s&aacute;t nh&acirc;n n&agrave;y.</p>
', N'Kim Jee-Woon, ', N'125 phút', 2018, N'Hàn Quốc', N'1ch3G2iWjMIUGDD5zDtjCqv6C2HzvBzQe', N'updating', 1007, 7, NULL, 34243, CAST(N'2019-10-30 14:27:16.277' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2019-10-29 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Movie] ([MovieID], [Name], [Image], [MoreImages], [Actor], [Description], [Directors], [Time], [Year], [Country], [MovieLink], [TrailerLink], [CategoryID], [Rate], [TrailerID], [Viewed], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [CountryID]) VALUES (1030, N'Aquaman: Đế Vương Atlantis', N'/Data/images/Movies/aquaman.jpg', N'/', N'jason Momoa', N'<p>Sau những sự kiện trong Justice League, Arthur Curry / Aquaman trở về biển cả v&agrave; bắt đầu đảm nhận quyền thừa kế vương quốc Atlantis dưới sự cố vấn của c&ocirc;ng ch&uacute;a Mera. Thế nhưng, đế chế huyền thoại bao năm ẩn m&igrave;nh dưới l&ograve;ng biển s&acirc;u Atlantics sắp phải dậy s&oacute;ng khi Orm quyết t&acirc;m thu phục 7 chủng tộc nơi đ&aacute;y đại dương để ti&ecirc;u diệt to&agrave;n bộ sự sống tr&ecirc;n mặt đất.<br />
Giữa l&uacute;c biển xanh cuộn tr&agrave;o những đợt s&oacute;ng dữ dội nhất Aquaman sẽ đương đầu với mọi việc như thế n&agrave;o để bảo vệ qu&ecirc; hương v&agrave; thế giới?</p>
', N'James Wan,', N'150 phút', 2019, N'Mỹ', N'1ch3G2iWjMIUGDD5zDtjCqv6C2HzvBzQe', N'updating', 1007, 9, NULL, 44544, CAST(N'2019-10-30 14:32:20.510' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2019-10-30 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Movie] ([MovieID], [Name], [Image], [MoreImages], [Actor], [Description], [Directors], [Time], [Year], [Country], [MovieLink], [TrailerLink], [CategoryID], [Rate], [TrailerID], [Viewed], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [CountryID]) VALUES (1031, N'Tội Ác Sau Phòng Kín', N'/Data/images/Movies/Anh6.jpg', N'/', N'mona shapma', N'<p>C&acirc;u chuyện bắt đầu với việc c&ocirc; g&aacute;i Cathy bị một kẻ lạ mặt &ndash; Lewis bắt c&oacute;c ngay giữa ban ng&agrave;y v&agrave; nhốt trong một căn ph&ograve;ng với diện t&iacute;ch vỏn vẹn 100ft2 ( hơn 9m2). Trong kh&ocirc;ng gian được c&aacute;ch &acirc;m ho&agrave;n to&agrave;n đ&oacute;, Lewis đ&atilde; gay gắt tra khảo c&ocirc; g&aacute;i n&agrave;y trong suốt một ng&agrave;y d&agrave;i &ndash; v&agrave; hắn hi vọng c&acirc;u trả lời đầy th&ugrave; hằn của Cathy sẽ h&eacute; lộ những b&iacute; mật m&agrave; m&igrave;nh đang mong đợi.</p>
', N'ezim wing', N'136 phút', 2017, N'Anh', N'1ch3G2iWjMIUGDD5zDtjCqv6C2HzvBzQe', N'updating', 1007, 7, NULL, 45324, CAST(N'2019-10-30 14:34:30.267' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2019-10-30 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Movie] ([MovieID], [Name], [Image], [MoreImages], [Actor], [Description], [Directors], [Time], [Year], [Country], [MovieLink], [TrailerLink], [CategoryID], [Rate], [TrailerID], [Viewed], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [CountryID]) VALUES (1032, N'Bí Mật Chết Chóc', N'/Data/images/Movies/bimatchetchoc.jpg', N'/', N'jason hockern', N'<p>Pandorum l&agrave; một cuốn phim kinh dị lấy bối cảnh tr&ecirc;n một chiếc phi thuyền kh&ocirc;ng gian. Hai thuyền vi&ecirc;n bị mắc kẹt tr&ecirc;n chiếc t&agrave;u v&agrave; họ nhanh ch&oacute;ng kh&aacute;m ph&aacute; ra rằng họ kh&ocirc;ng phải l&agrave; những nạn nh&acirc;n sống s&oacute;t sau c&ugrave;ng. Trong khoang ho&agrave;n to&agrave;n tối như mực, tiếng động duy nhất ph&aacute;t ra l&agrave; những &acirc;m thanh &ugrave; &ugrave; của m&aacute;y v&agrave; tiếng kẽo kẹt của thiết bị động cơ. Hai thuyền vi&ecirc;n kh&ocirc;ng nhớ m&igrave;nh l&agrave; ai cũng như mục đ&iacute;ch của họ l&agrave; g&igrave;. Đại &Uacute;y Payton v&agrave; Binh nh&igrave; Bower phải bắt đầu cuộc h&agrave;nh tr&igrave;nh truy t&igrave;m tung t&iacute;ch của m&igrave;nh v&agrave; to&agrave;n bộ phi h&agrave;nh đo&agrave;n.</p>
', N'robert hoger', N'163 phút', 2016, N'Mỹ, Anh, Đức', N'1ch3G2iWjMIUGDD5zDtjCqv6C2HzvBzQe', N'updating', 1007, 8, NULL, 12424, CAST(N'2019-10-30 14:36:44.923' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2019-10-30 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Movie] ([MovieID], [Name], [Image], [MoreImages], [Actor], [Description], [Directors], [Time], [Year], [Country], [MovieLink], [TrailerLink], [CategoryID], [Rate], [TrailerID], [Viewed], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [CountryID]) VALUES (1033, N'Giải Mã Mê Cung 3: Lối Thoát Tử Thần', N'/Data/images/Movies/Anh4.jpg', N'/', N'meda assjop', N'<p>GIẢI M&Atilde; M&Ecirc; CUNG 3: LỐI THO&Aacute;T TỬ THẦN kể về thời điểm Thomas dẫn nh&oacute;m Gladers tho&aacute;t khỏi nhiệm vụ cuối c&ugrave;ng v&agrave; nguy hiểm nhất của m&igrave;nh. Để cứu bạn của họ, họ phải đột nhập v&agrave;o th&agrave;nh phố huyền thoại cuối c&ugrave;ng, một m&ecirc; cung điều khiển WICKED c&oacute; thể trở th&agrave;nh m&ecirc; cung chết người nhất của tất cả. Bất cứ ai l&agrave;m cho n&oacute; sống ra sẽ nhận được c&acirc;u trả lời cho những c&acirc;u hỏi c&aacute;c Gladers đ&atilde; được y&ecirc;u cầu kể từ khi họ lần đầu ti&ecirc;n đến m&ecirc; cung. Liệu Thomas v&agrave; phi h&agrave;nh đo&agrave;n c&oacute; l&agrave;m cho n&oacute; sống động? Hoặc Ava Paige c&oacute; được theo c&aacute;ch của m&igrave;nh?</p>
', N'Wes Ball, ', N'134 phút', 2018, N'Mỹ', N'1ch3G2iWjMIUGDD5zDtjCqv6C2HzvBzQe', N'updating', 1008, 8, NULL, 12345, CAST(N'2019-10-30 14:39:25.563' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2019-10-29 00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Movie] ([MovieID], [Name], [Image], [MoreImages], [Actor], [Description], [Directors], [Time], [Year], [Country], [MovieLink], [TrailerLink], [CategoryID], [Rate], [TrailerID], [Viewed], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [CountryID]) VALUES (1034, N'Gã Hề', N'/Data/images/Movies/joker.jpg', N'/', N'Joaquin Phoenix,Arthur Fleck', N'<p><strong>JOKER</strong> từ l&acirc;u đ&atilde; l&agrave; si&ecirc;u &aacute;c nh&acirc;n huyền thoại của điện ảnh th&ecirc;́ giới. Nhưng c&oacute; bao giờ bạn tự hỏi, Joker đến từ đ&acirc;u v&agrave; điều g&igrave; đ&atilde; biến Joker trở th&agrave;nh biểu tượng tội lỗi của th&agrave;nh phố Gotham? JOKER sẽ l&agrave; c&aacute;i nh&igrave;n độc đ&aacute;o về t&ecirc;n &aacute;c nh&acirc;n kh&eacute;t tiếng của Vũ trụ DC &ndash; một c&acirc;u chuyện gốc thấm nhuần, nhưng t&aacute;ch biệt r&otilde; r&agrave;ng với những truyền thuyết quen thuộc xoay quanh nh&acirc;n vật mang đầy t&iacute;nh biểu tượng n&agrave;y.</p>
', N'Todd Phillips,', N'122 phút', 2019, N'Mỹ', N'1ch3G2iWjMIUGDD5zDtjCqv6C2HzvBzQe', N'upupdatingdating', 1009, 9, NULL, 50000, CAST(N'2019-10-30 14:43:57.543' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2019-10-30 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Movie] ([MovieID], [Name], [Image], [MoreImages], [Actor], [Description], [Directors], [Time], [Year], [Country], [MovieLink], [TrailerLink], [CategoryID], [Rate], [TrailerID], [Viewed], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [CountryID]) VALUES (1035, N'Những bà mẹ "ngoan"', N'/Data/images/Movies/badmom.jpg', N'/', N'Mina kunis,Kristen Bell,...', N'<p>Nội dung phim xoay quanh cuộc sống hằng ng&agrave;y của c&aacute;c b&agrave; nội trợ kiểu Mỹ v&agrave; những &aacute;p lực từ việc l&agrave;m mẹ của họ. Amy Mitchell (Mila Kunis thủ vai) l&agrave; một phụ nữ th&agrave;nh đạt, ngo&agrave;i một sự nghiệp ổn định, c&ocirc; c&ograve;n c&oacute; một gia đ&igrave;nh hạnh ph&uacute;c c&ugrave;ng những đứa con t&agrave;i giỏi. Tuy nhi&ecirc;n, sự k&igrave; vọng v&agrave; những chuẩn mực h&agrave; khắc trong việc l&agrave;m mẹ từ Hội Phụ huynh &ndash; Gi&aacute;o vi&ecirc;n khiến Amy qu&aacute; mệt mỏi v&agrave; quyết định rũ bỏ mọi nguy&ecirc;n tắc phi l&iacute; đ&oacute;.</p>
', N'.', N'100 phút', 2016, N'Mỹ', N'1ch3G2iWjMIUGDD5zDtjCqv6C2HzvBzQe', N'updating', 1011, 8, NULL, 45966, CAST(N'2019-10-30 14:51:32.077' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2019-10-30 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Movie] ([MovieID], [Name], [Image], [MoreImages], [Actor], [Description], [Directors], [Time], [Year], [Country], [MovieLink], [TrailerLink], [CategoryID], [Rate], [TrailerID], [Viewed], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [CountryID]) VALUES (2025, N'Cớm Tập Sự', N'/Data/images/Movies/ctsc.jpg', N'/', N'Kevil Hart', N'<p>Ride Along 2 phim thuộc thể loại h&agrave;i hước do Mỹ sản xuất c&acirc;u chuyện n&oacute;i về hai anh ch&agrave;ng cảnh s&aacute;t trong đ&oacute; James l&agrave; một người cẩu thả kh&ocirc;ng l&agrave;m việc theo nguy&ecirc;n tắc, trong một lần giao dịch ma tu&yacute; của 2 nh&oacute;m James xuất hiện với một bộ đồ kỳ qu&aacute;i v&agrave; đ&atilde; l&agrave;m rớt c&aacute;i huy chương cảnh s&aacute;t khiến cuộc đấu s&uacute;ng diễn ra, sao đ&oacute; th&igrave; James đ&atilde; l&agrave;m vợ m&igrave;nh mất l&ograve;ng tin th&ecirc;m 1 lần nữa v&agrave; anh đ&atilde; cố gắng lấy lại niềm tin trong chiến dịch bắt bọn bu&ocirc;n ma tu&yacute; để chứng tỏ bản lĩnh của m&igrave;nh.</p>
', N'Tim Story', N'140 phút', 2018, N'Mỹ', N'1ch3G2iWjMIUGDD5zDtjCqv6C2HzvBzQe', N'uupdatingpdating', 1007, 2, NULL, 1, CAST(N'2019-10-31 09:37:15.480' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 3)
INSERT [dbo].[Movie] ([MovieID], [Name], [Image], [MoreImages], [Actor], [Description], [Directors], [Time], [Year], [Country], [MovieLink], [TrailerLink], [CategoryID], [Rate], [TrailerID], [Viewed], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [CountryID]) VALUES (2026, N'Quỷ Dữ Rình Rập', N'/Data/images/Movies/qdu.jpg', N'/', N'    Yvonne Straho', N'<p>Để c&oacute; một k&igrave; nghỉ đ&aacute;ng nhớ, gia đ&igrave;nh nh&agrave; c&ocirc; Laura đ&atilde; chọn một căn nh&agrave; b&ecirc;n hồ l&agrave;m điểm đến. Nhưng đến ph&uacute;t ch&oacute;t, chồng c&ocirc; vướn phải một cuộc họp khẩn cấp, v&agrave; Laura quyết định tự đi c&ugrave;ng với hai đứa con g&aacute;i Maddie v&agrave; Kayla. Thế nhưng chuyến đi chơi ấy lại dường như ho&aacute; th&agrave;nh một cơn &aacute;c mộng khi c&ocirc; v&agrave; hai đứa con bị tấn c&ocirc;ng bởi một g&atilde; t&acirc;m thần - kẻ đ&atilde; rắp t&acirc;m h&atilde;m hại gia đ&igrave;nh c&ocirc; từ rất l&acirc;u.</p>
', N'Quinn Lasher, ', N'89 phút', 2019, N'Mỹ', N'1ch3G2iWjMIUGDD5zDtjCqv6C2HzvBzQe', N'updating', 1007, 2, NULL, 1000, CAST(N'2019-11-01 16:23:07.137' AS DateTime), NULL, NULL, NULL, N'Quy-Du-Rinh-Rap', NULL, 1, NULL, 1)
INSERT [dbo].[Movie] ([MovieID], [Name], [Image], [MoreImages], [Actor], [Description], [Directors], [Time], [Year], [Country], [MovieLink], [TrailerLink], [CategoryID], [Rate], [TrailerID], [Viewed], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [CountryID]) VALUES (2029, N'Hội Con Nhà Siêu Giàu', N'/Data/images/Movies/cnsg.jpg', N'.', N'.', N'<p>..</p>
', N'.', N'140 phút', 2018, N'Mỹ', N'1ch3G2iWjMIUGDD5zDtjCqv6C2HzvBzQe', N'.', 1008, 3, NULL, 3242, CAST(N'2019-11-07 10:20:19.460' AS DateTime), NULL, NULL, NULL, N'Hoi-Con-Nha-Sieu-Giau', NULL, 1, NULL, 4)
INSERT [dbo].[Movie] ([MovieID], [Name], [Image], [MoreImages], [Actor], [Description], [Directors], [Time], [Year], [Country], [MovieLink], [TrailerLink], [CategoryID], [Rate], [TrailerID], [Viewed], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [CountryID]) VALUES (2031, N'Captain America: Civil War ', N'/Data/files/New%20Movie/cvilwar.jpg', N'.', N'Macheal Freed', N'<p><span style="font-size:11pt"><span style="font-family:&quot;Calibri&quot;,sans-serif">Captain America: Civil War l&agrave; c&acirc;u chuyện theo sau sự kiện Avengers: Age Of Ultron, c&aacute;c li&ecirc;n minh ch&iacute;nh phủ tr&ecirc;n to&agrave;n thế giới th&ocirc;ng qua một hiệp ước được thiết lập để điều chỉnh hoạt động của tất cả si&ecirc;u anh h&ugrave;ng. Điều n&agrave;y g&acirc;y ra sự ph&acirc;n cực trong nội bộ nh&oacute;m Avengers, tạo n&ecirc;n hai phe gồm Iron Man v&agrave; Captain America, g&acirc;y ra một trận chiến sử thi giữa những người đồng đội.</span></span></p>

<p><span style="font-size:11pt"><span style="font-family:&quot;Calibri&quot;,sans-serif"><img alt="" src="/Data/images/poster/cvilwarpost.jpg" style="height:332px; width:750px" /></span></span></p>
', N'Award Holdes', N'132 phút', 2018, N'Mỹ', N'1ch3G2iWjMIUGDD5zDtjCqv6C2HzvBzQe', N'https://www.youtube.com/embed/cfVY9wLKltA', 1008, 6, NULL, 20023, CAST(N'2019-11-24 21:19:59.610' AS DateTime), NULL, NULL, NULL, N'captain-america-civil-war', NULL, 1, NULL, 5)
INSERT [dbo].[Movie] ([MovieID], [Name], [Image], [MoreImages], [Actor], [Description], [Directors], [Time], [Year], [Country], [MovieLink], [TrailerLink], [CategoryID], [Rate], [TrailerID], [Viewed], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [CountryID]) VALUES (2032, N'Chú Hề Ma Quái 2', N'/Data/files/New%20Movie/poster_medium_27.jpg', N'/', N'Thomas ralley', N'<p><span style="font-size:11pt"><span style="font-family:&quot;Calibri&quot;,sans-serif">It Chapter Two (G&atilde; Hề Ma Qu&aacute;i 2) vẫn l&agrave; c&acirc;u chuyện về những c&ocirc; cậu b&eacute; của nh&oacute;m The Losers Club, l&uacute;c n&agrave;y đ&atilde; trưởng th&agrave;nh v&agrave; đối mặt với v&ocirc; số vấn đề trong cuộc sống. Chưa dừng lại ở đ&oacute;, &aacute;m ảnh ma hề Pennywise cứ 27 năm lại xuất hiện một lần tại thị trấn Derry buộc 7 c&ocirc; cậu b&eacute; ng&agrave;y n&agrave;o phải tiếp tục cuốn v&agrave;o cuộc chạm tr&aacute;n tiếp theo giữa hai b&ecirc;n thiện v&agrave; &aacute;c.</span></span></p>

<p><span style="font-size:11pt"><span style="font-family:&quot;Calibri&quot;,sans-serif"><img alt="" src="/Data/images/ga-he-ma-quai-1280x700.jpg" style="height:437px; width:700px" /></span></span></p>

<p>&nbsp;</p>

<p><span style="font-size:11pt"><span style="font-family:&quot;Calibri&quot;,sans-serif">Mặc d&ugrave; c&oacute; thể cả nh&oacute;m đ&atilde; trưởng th&agrave;nh v&agrave; kh&ocirc;n ngoan hơn, cuộc chiến của họ với Pennywise vẫn c&ograve;n đ&oacute; những hậu quả bất ngờ, thậm ch&iacute; khiến một số th&agrave;nh vi&ecirc;n phải trải qua đau đớn đến tột c&ugrave;ng.</span></span></p>
', N'Water Whiste', N'120 phút', 2018, NULL, N'1ch3G2iWjMIUGDD5zDtjCqv6C2HzvBzQe', N'updating', 1007, 6, NULL, 1502, CAST(N'2019-11-18 09:34:13.343' AS DateTime), NULL, NULL, NULL, N'Chu-He-Ma-Quai-2', NULL, 1, NULL, 1)
INSERT [dbo].[Movie] ([MovieID], [Name], [Image], [MoreImages], [Actor], [Description], [Directors], [Time], [Year], [Country], [MovieLink], [TrailerLink], [CategoryID], [Rate], [TrailerID], [Viewed], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [CountryID]) VALUES (3032, N'Dora Và Thành Phố Vàng Mất Tích', N'/Data/files/New%20Movie/poster_medium.jpg', N'.', N'Dee Barale', N'<p><span style="font-size:11pt"><span style="font-family:&quot;Calibri&quot;,sans-serif">D&agrave;nh phần lớn cuộc đời để kh&aacute;m ph&aacute; rừng rậm c&ugrave;ng cha mẹ, kh&ocirc;ng g&igrave; c&oacute; thể chuẩn bị Dora cho cuộc phi&ecirc;u lưu nguy hiểm nhất của c&ocirc; từ trước đến nay: trường trung học. L&agrave; một người th&aacute;m hiểm, Dora phải c&ugrave;ng với Boots, Diego c&ugrave;ng những sinh vật nơi rừng rậm b&iacute; ẩn v&agrave; một nh&oacute;m thanh thiếu ni&ecirc;n ragtag trong một cuộc h&agrave;nh tr&igrave;nh giải cứu cha mẹ v&agrave; kh&aacute;m ph&aacute; những b&iacute; ẩn đằng sau nền văn minh Inca đ&atilde; mất.</span></span></p>
', N'RobertChen', N'120 phút', 2019, NULL, N'1ch3G2iWjMIUGDD5zDtjCqv6C2HzvBzQe', N'.', 1018, 6, NULL, 101, CAST(N'2019-11-20 10:15:45.997' AS DateTime), NULL, NULL, NULL, N'Dora-Va-Thanh-Pho-Vang-Mat-Tich', NULL, 1, NULL, 1)
INSERT [dbo].[Movie] ([MovieID], [Name], [Image], [MoreImages], [Actor], [Description], [Directors], [Time], [Year], [Country], [MovieLink], [TrailerLink], [CategoryID], [Rate], [TrailerID], [Viewed], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [CountryID]) VALUES (3033, N'Đội Cứu Hộ Malibu', N'/Data/files/New%20Movie/poster_medium_2.jpg', N'.', N'joseps heren', N'<p><span style="font-size:11pt"><span style="font-family:&quot;Calibri&quot;,sans-serif">Một nh&oacute;m ragtag gồm những nh&acirc;n vi&ecirc;n cứu hộ trẻ đầy tham vọng từ Thung lũng cạnh tranh với những đứa trẻ địa phương hợm hĩnh để gi&agrave;nh quyền khoe khoang v&agrave; ... </span></span></p>
', N'Mchadue kond', N'100 phút', 2018, NULL, N'1ch3G2iWjMIUGDD5zDtjCqv6C2HzvBzQe', N'.', 1011, 1, NULL, 1002, CAST(N'2019-11-20 10:17:31.077' AS DateTime), NULL, NULL, NULL, N'Doi-Cuu-Ho-Malibu', NULL, 1, NULL, 2)
INSERT [dbo].[Movie] ([MovieID], [Name], [Image], [MoreImages], [Actor], [Description], [Directors], [Time], [Year], [Country], [MovieLink], [TrailerLink], [CategoryID], [Rate], [TrailerID], [Viewed], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [CountryID]) VALUES (3034, N'Biển Sương Mù', N'/Data/files/New%20Movie/poster_medium_30.jpg', N'.', N'Philip Horen', N'<p><span style="font-size:11pt"><span style="font-family:&quot;Calibri&quot;,sans-serif">&ldquo;Sea Fog&rdquo; kể về c&acirc;u chuyện của c&aacute;c thủy thủ ra khơi tr&ecirc;n chiếc t&agrave;u đ&aacute;nh c&aacute; cũ kĩ của m&igrave;nh v&agrave; những người nhập cư bất hợp ph&aacute;p từ Triều Ti&ecirc;n. Họ l&agrave; những con người c&oacute; tấm l&ograve;ng nhiệt huyết v&agrave; nh&acirc;n hậu thế rồi v&agrave;o một buổi tối định mệnh khi chiếc chuyền đ&aacute;nh c&aacute; của họ rơi v&agrave;o một v&ugrave;ng biển đầy sương m&ugrave;. V&agrave; từ đ&acirc;y&quot;s&oacute;ng gi&oacute;&quot; bắt đầu đến với họ v&agrave; họ sẽ l&agrave;m g&igrave; để vượt qua kh&oacute; khăn trở ngại tr&ecirc;n để về đất liền an to&agrave;n. </span></span></p>
', N'Helen Finder', N'132 phút', 2018, NULL, N'1ch3G2iWjMIUGDD5zDtjCqv6C2HzvBzQe', N'.', 1007, 6, NULL, 1000, CAST(N'2019-11-20 10:21:13.717' AS DateTime), NULL, NULL, NULL, N'Bien-Suong-Mu', NULL, 1, NULL, 1)
INSERT [dbo].[Movie] ([MovieID], [Name], [Image], [MoreImages], [Actor], [Description], [Directors], [Time], [Year], [Country], [MovieLink], [TrailerLink], [CategoryID], [Rate], [TrailerID], [Viewed], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [CountryID]) VALUES (3035, N'Ngôi Đền Kỳ Quái', N'/Data/files/New%20Movie/poster_medium_4.jpg', N'.', N'Fendam tome', N'<p><span style="font-size:11pt"><span style="font-family:&quot;Calibri&quot;,sans-serif">Ng&ocirc;i Đền Kỳ Qu&aacute;i n&oacute;i về bộ ba ho&agrave;n cảnh v&igrave; lời thề ngớ ngẩn sẽ cạo đầu đi tu nếu tr&uacute;ng số v&agrave; may mắn tr&uacute;ng ngay giải ch&oacute;t. V&agrave; &ldquo;may mắn&rdquo; lại nh&acirc;n đ&ocirc;i khi hội bạn th&acirc;n lại chọn tr&uacute;ng ngay ng&ocirc;i đền bị &aacute;m bởi h&agrave;ng loạt hiện tượng si&ecirc;u nhi&ecirc;n. Từ một lời thề qu&aacute;i gở, hội bạn &ldquo;th&acirc;n ai nấy lo&rdquo; n&agrave;y sẽ phải đối mặt với h&agrave;ng loạt rắc rối đang đ&oacute;n chờ ph&iacute;a trước ra sao?</span></span></p>
', N'andy teld', N'119 phút', 2019, NULL, N'1ch3G2iWjMIUGDD5zDtjCqv6C2HzvBzQe', N'.', 1007, 5, NULL, 1003, CAST(N'2019-11-20 10:24:07.840' AS DateTime), NULL, NULL, NULL, N'Ngoi-Den-Ky-Quai', NULL, 1, NULL, 7)
INSERT [dbo].[Movie] ([MovieID], [Name], [Image], [MoreImages], [Actor], [Description], [Directors], [Time], [Year], [Country], [MovieLink], [TrailerLink], [CategoryID], [Rate], [TrailerID], [Viewed], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [CountryID]) VALUES (3036, N'Hãy Để Tuyết Rơi', N'/Data/files/New%20Movie/poster_medium_26.jpg', N'.', N'Jonden Hiens', N'<p><span style="font-size:11pt"><span style="font-family:&quot;Calibri&quot;,sans-serif">B&atilde;o tuyết ập đến thị trấn nhỏ v&agrave;o Đ&ecirc;m trước Gi&aacute;ng Sinh lạnh gi&aacute;, g&acirc;y n&ecirc;n bao thay đổi đối với t&igrave;nh bạn, t&igrave;nh y&ecirc;u v&agrave; tương lai của c&aacute;c c&ocirc; cậu học sinh cuối cấp. </span></span></p>
', N'anton kinde', N'120 phút', 2017, NULL, N'1ch3G2iWjMIUGDD5zDtjCqv6C2HzvBzQe', N'.', 1020, 1, NULL, 1979, CAST(N'2019-11-20 10:26:32.153' AS DateTime), NULL, NULL, NULL, N'Hay-De-Tuyet-Roi', NULL, 1, NULL, 1)
INSERT [dbo].[Movie] ([MovieID], [Name], [Image], [MoreImages], [Actor], [Description], [Directors], [Time], [Year], [Country], [MovieLink], [TrailerLink], [CategoryID], [Rate], [TrailerID], [Viewed], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [CountryID]) VALUES (3037, N'Người Không Trọng Lực', N'/Data/files/New%20Movie/poster_medium_6.jpg', N'.', N'ante xuye', N'<p><span style="font-size:11pt"><span style="font-family:&quot;Calibri&quot;,sans-serif">Cậu b&eacute; kh&ocirc;ng trọng lực vốn được bố mẹ che giấu nay đ&atilde; trở th&agrave;nh anh ch&agrave;ng phi thường. Nhưng người nổi tiếng khắp nơi ấy lại kh&aacute;t khao được h&ograve;a hợp với mọi người. </span></span></p>
', N'Phily wise', N'118 phút', 2017, NULL, N'1ch3G2iWjMIUGDD5zDtjCqv6C2HzvBzQe', N'.', 1008, 7, NULL, 2080, CAST(N'2019-11-20 10:29:44.900' AS DateTime), NULL, NULL, NULL, N'Nguoi-Khong-Trong-Luc', NULL, 1, NULL, 1)
INSERT [dbo].[Movie] ([MovieID], [Name], [Image], [MoreImages], [Actor], [Description], [Directors], [Time], [Year], [Country], [MovieLink], [TrailerLink], [CategoryID], [Rate], [TrailerID], [Viewed], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [CountryID]) VALUES (3038, N'Kẻ Hủy Diệt: Thời Đại Genisys', N'/Data/files/New%20Movie/poster_medium_7.jpg', N'.', N'Jonathan Kin', N'<p><span style="font-size:11pt"><span style="font-family:&quot;Calibri&quot;,sans-serif">Phần 5 của Kẻ hủy diệt sẽ tập trung v&agrave;o sự kiện trước khi Sarah Connor biến mất v&agrave;o khoảng giữa Terminator 2: Judgment Day v&agrave; Terminator 3: Rise of the Machines. Trong khoảng thời gian n&agrave;y người xem sẽ tiếp x&uacute;c với h&igrave;nh h&agrave;i thật sự của Kẻ hủy diệt T-800 ở dạng con người, v&agrave; đồng nghĩa với việc sau n&agrave;y tại sao h&igrave;nh mẫu của nh&acirc;n vật được Skynet lựa cho c&aacute;c lần đưa về qu&aacute; khứ sau n&agrave;y.</span></span></p>
', N'Micheal Him', N'119 phút', 2018, NULL, N'1ch3G2iWjMIUGDD5zDtjCqv6C2HzvBzQe', N'.', 1007, 1, NULL, 1700, CAST(N'2019-11-20 10:32:54.453' AS DateTime), NULL, NULL, NULL, N'ke-huy-diet-thoi-dai-genisys', NULL, 1, NULL, 1)
INSERT [dbo].[Movie] ([MovieID], [Name], [Image], [MoreImages], [Actor], [Description], [Directors], [Time], [Year], [Country], [MovieLink], [TrailerLink], [CategoryID], [Rate], [TrailerID], [Viewed], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [CountryID]) VALUES (3039, N'Người Nhện: Xa Nhà (Bản Không Cắt)', N'/Data/files/New%20Movie/poster_medium_8.jpg', N'.', N'Kin fipin', N'<p><span style="font-size:11pt"><span style="font-family:&quot;Calibri&quot;,sans-serif">Hậu chiến V&ocirc; Cực, Người Nhện Peter Parker v&agrave; nh&oacute;m bạn th&acirc;n c&ugrave;ng tham gia chuyến du lịch ch&acirc;u &Acirc;u của trường. Tuy nhi&ecirc;n, kế hoạch si&ecirc;u anh h&ugrave;ng nghỉ ph&eacute;p của Peter nhanh ch&oacute;ng bị hủy bỏ sau khi cậu đồng &yacute; gi&uacute;p Nick Fury kh&aacute;m ph&aacute; b&iacute; ẩn về những cuộc tấn c&ocirc;ng của nh&oacute;m kẻ th&ugrave; mang sức mạnh nguy&ecirc;n tố đang t&agrave;n ph&aacute; khắp lục địa.</span></span></p>
', N'.', N'132 phút', 2019, NULL, N'1ch3G2iWjMIUGDD5zDtjCqv6C2HzvBzQe', N'.', 1019, 8, NULL, 1300, CAST(N'2019-11-20 10:34:44.490' AS DateTime), NULL, NULL, NULL, N'nguoi-nhen-xa-nha-ban-khong-cat-', NULL, 1, NULL, 1)
INSERT [dbo].[Movie] ([MovieID], [Name], [Image], [MoreImages], [Actor], [Description], [Directors], [Time], [Year], [Country], [MovieLink], [TrailerLink], [CategoryID], [Rate], [TrailerID], [Viewed], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [CountryID]) VALUES (3040, N'Những Cậu Trai "Ngoan"', N'/Data/files/New%20Movie/poster_medium_9.jpg', N'.', N'.', N'<div class="content" id="film-content" style="max-height:800px">
<p>3 cậu nh&oacute;c 12 tuổi, c&ugrave;ng h&agrave;nh tr&igrave;nh trốn học để tới San Fernando sửa m&oacute;n đồ chơi đ&atilde; hỏng trước khi cha mẹ của ch&uacute;ng trở về nh&agrave;. Sau khi được một người bạn mời tham gia v&agrave;o bữa biệc &ldquo;h&ocirc;n&rdquo;, Max đ&atilde; rất h&aacute;o hức v&agrave; rủ th&ecirc;m 2 người bạn l&agrave; Lucas v&agrave; Thor tham gia. Tuy nhi&ecirc;n, cậu kh&ocirc;ng biết h&ocirc;n v&agrave; quyết định t&igrave;m hiểu về vấn đề n&agrave;y, v&agrave; chiếc flycam của bố Max được d&ugrave;ng để l&agrave;m c&ocirc;ng cụ t&igrave;m hiểu. Chưa thể quay l&eacute;n được g&igrave; th&igrave; chiếc m&aacute;y bay đ&atilde; bị đốn hạ v&agrave; hư hỏng nặng, 3 cậu nh&oacute;c phải sửa được nhanh nhất c&oacute; thể trước khi bị ba mẹ ph&aacute;t hiện.<br />
&nbsp;</p>

<div style="text-align:center"><img src="http://image.phimmoi.net/post/2019/11/05/56679465-373589610152668-935680473932234752-o.jpg" /></div>

<p>&nbsp;</p>
</div>

<div class="block-tags">
<h3>&nbsp;</h3>
</div>
', N'.', N'132 phút', 2019, NULL, N'1ch3G2iWjMIUGDD5zDtjCqv6C2HzvBzQe', N'.', 1011, 5, NULL, 1205, CAST(N'2019-11-20 10:36:59.220' AS DateTime), NULL, NULL, NULL, N'nhung-cau-trai-ngoan-', NULL, 1, NULL, 1)
INSERT [dbo].[Movie] ([MovieID], [Name], [Image], [MoreImages], [Actor], [Description], [Directors], [Time], [Year], [Country], [MovieLink], [TrailerLink], [CategoryID], [Rate], [TrailerID], [Viewed], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [CountryID]) VALUES (3041, N'Tập Làm Người Xấu', N'/Data/files/New%20Movie/poster_medium_10.jpg', N'.', N'.', N'<p><span style="font-size:11pt"><span style="font-family:&quot;Calibri&quot;,sans-serif">V&agrave;o th&aacute;ng hai năm 2009, AMC đ&atilde; thực hiện loạt 5 tập phim mini của Breaking Bad, nằm trong extra của Breaking Bad phần1 để dẫn đến việc ra mắt phần thứ hai: Mở đầu với những &yacute; tưởng đi&ecirc;n rồ của Hank v&agrave; Marie trong ph&ograve;ng ngủ để ăn mừng Ng&agrave;y Valentine, cũng như việc Hank hồi tưởng lại tội lỗi của &ocirc;ng ngay ng&agrave;y cưới, được đi s&acirc;u v&agrave;o một t&agrave;i năng kh&aacute;c của Jeese về &acirc;m nhạc cũng như được nghe về lời th&uacute; tội của Marie v&agrave; được chứng kiến vụ đột nhập của Walter... </span></span></p>
', N'.', N'119 phút', 2010, NULL, N'1ch3G2iWjMIUGDD5zDtjCqv6C2HzvBzQe', N'.', 1018, 9, NULL, 1000, CAST(N'2019-11-20 10:39:06.283' AS DateTime), NULL, NULL, NULL, N'Tap-Lam-Nguoi-Xau', NULL, 1, NULL, 1)
INSERT [dbo].[Movie] ([MovieID], [Name], [Image], [MoreImages], [Actor], [Description], [Directors], [Time], [Year], [Country], [MovieLink], [TrailerLink], [CategoryID], [Rate], [TrailerID], [Viewed], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [CountryID]) VALUES (3042, N'Ngủ Mê', N'/Data/files/New%20Movie/poster_medium_11.jpg', N'.', N'.', N'<p><span style="font-size:11pt"><span style="font-family:&quot;Calibri&quot;,sans-serif">Cesar l&agrave; người g&aacute;c cổng trong một t&ograve;a nh&agrave; tại Barcelona. &Iacute;t ai quan t&acirc;m đến đời tư của anh ta, nhưng anh ta rất ch&uacute; &yacute; tới họ. Anh ta biết tất cả c&aacute;c chi tiết trong cuộc sống của họ, tất cả mọi thứ về họ, đặc biệt l&agrave; một c&ocirc; g&aacute;i trong số họ - Clara, một c&ocirc; g&aacute;i trẻ vui vẻ, lu&ocirc;n tươi cười nh&igrave;n v&agrave;o mặt t&iacute;ch cực của mọi việc. V&agrave; điều đ&oacute; khiến Cesar cảm thấy bực bội khi đối diện. T&acirc;m thần nặng khiến hắn kh&ocirc;ng muốn thấy c&ocirc; v&agrave; bất cứ ai kh&aacute;c được hạnh ph&uacute;c. Cuối c&ugrave;ng hắn đ&atilde; l&ecirc;n 1 kế hoạch m&agrave; kh&ocirc;ng ai ngờ tới...</span></span></p>
', N'.', N'100 phút', 2019, NULL, N'1ch3G2iWjMIUGDD5zDtjCqv6C2HzvBzQe', N'.', 1007, 1, NULL, 1677, CAST(N'2019-11-20 10:41:09.060' AS DateTime), NULL, NULL, NULL, N'Ngu-Me', NULL, 1, NULL, 1)
INSERT [dbo].[Movie] ([MovieID], [Name], [Image], [MoreImages], [Actor], [Description], [Directors], [Time], [Year], [Country], [MovieLink], [TrailerLink], [CategoryID], [Rate], [TrailerID], [Viewed], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [CountryID]) VALUES (3043, N'Cô Gái Nhìn Thấy Mùi Hương', N'/Data/files/New%20Movie/poster_medium_12.jpg', N'.', N'.', N'<p><span style="font-size:11pt"><span style="font-family:&quot;Calibri&quot;,sans-serif">C&ocirc; G&aacute;i Nh&igrave;n Thấy M&ugrave;i Hương kể về c&acirc;u chyện xoay quanh Lục Vi Tầm, một thi&ecirc;n t&agrave;i vị gi&aacute;c c&oacute; địa vị rất cao trong l&agrave;ng ẩm thực, sau khi Lục Vi Tầm gặp H&agrave; Bất T&uacute;y một c&ocirc; g&aacute;i kh&ocirc;ng c&oacute; vị gi&aacute;c, Vi Tầm đ&atilde; gi&uacute;p Bất T&uacute;y vượt qua kh&oacute; khăn. H&agrave; Bất T&uacute;y chấp nhận huấn luyện khắc phục mọi kh&oacute; khăn, c&ocirc; cảm nhận được t&igrave;nh cảm d&agrave;nh cho nghề của Lục Vi Tầm v&agrave; dần dần lấy lại được vị gi&aacute;c. Mặc d&ugrave; H&agrave; Bất T&uacute;y v&agrave; Lục Vi Cầm c&oacute; t&iacute;nh c&aacute;ch kh&aacute;c biệt nhưng sau một thời gian tiếp x&uacute;c họ dần dần thấy được sự đồng cảm. H&agrave; Bất T&uacute;y sau một thời gian ki&ecirc;n tr&igrave; v&agrave; nỗ lực, c&ocirc; dần trở th&agrave;nh một người c&oacute; tố chất cực cao trong thế giới ẩm thực v&agrave; t&igrave;m được t&igrave;nh y&ecirc;u của đời m&igrave;nh. </span></span></p>
', N'.', N'118 phút', 2019, NULL, N'1ch3G2iWjMIUGDD5zDtjCqv6C2HzvBzQe', N'.', 1020, 4, NULL, 1000, CAST(N'2019-11-20 10:42:31.750' AS DateTime), NULL, NULL, NULL, N'Co-Gai-Nhin-Thay-Mui-Huong', NULL, 1, NULL, 5)
INSERT [dbo].[Movie] ([MovieID], [Name], [Image], [MoreImages], [Actor], [Description], [Directors], [Time], [Year], [Country], [MovieLink], [TrailerLink], [CategoryID], [Rate], [TrailerID], [Viewed], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [CountryID]) VALUES (3044, N'Thánh Phồng Tôm ( Tập đặc biệt )', N'/Data/files/New%20Movie/poster_medium_13.jpg', N'.', N'.', N'<p><span style="font-size:11pt"><span style="font-family:&quot;Calibri&quot;,sans-serif">C&acirc;u chuyện diễn ra tại th&agrave;nh phố Z của Nhật Bản tại thời điểm thế giới đầy những qu&aacute;i vật b&iacute; ẩn với sức mạnh gh&ecirc; ghớm đ&atilde; xuất hiện v&agrave; g&acirc;y ra biết bao nhi&ecirc;u thảm họa. Nhưng cũng ch&iacute;nh tại đ&acirc;y xuất hiện 1 si&ecirc;u anh h&ugrave;ng đấm ph&aacute;t chết lu&ocirc;n, c&oacute; thể dễ d&agrave;ng đ&aacute;nh bại v&agrave; ti&ecirc;u diệt những con qu&aacute;i vật n&agrave;y. Cũng ch&iacute;nh v&igrave; t&agrave;i năng hiếm c&oacute; n&agrave;y m&agrave; c&oacute; rất nhiều nghi ngại về khả năng thực sự của vị si&ecirc;u anh h&ugrave;ng, thậm ch&iacute; anh kh&ocirc;ng bao giờ nhận được bất kỳ l&ograve;ng tin n&agrave;o từ d&acirc;n ch&uacute;ng.</span></span></p>
', N'.', N'100 phút', 2019, NULL, N'1ch3G2iWjMIUGDD5zDtjCqv6C2HzvBzQe', N'.', 1011, 4, NULL, 1076, CAST(N'2019-11-20 10:43:53.737' AS DateTime), NULL, NULL, NULL, N'thanh-phong-tom-tap-dac-biet-', NULL, 1, NULL, 6)
INSERT [dbo].[Movie] ([MovieID], [Name], [Image], [MoreImages], [Actor], [Description], [Directors], [Time], [Year], [Country], [MovieLink], [TrailerLink], [CategoryID], [Rate], [TrailerID], [Viewed], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [CountryID]) VALUES (3045, N'Nam Thần Xe Ôm', N'/Data/files/New%20Movie/poster_medium_14.jpg', N'.', N'.', N'<p><span style="font-size:11pt"><span style="font-family:&quot;Calibri&quot;,sans-serif">Mỗi s&aacute;ng khi ra khỏi nh&agrave;, Sakkarin kho&aacute;c l&ecirc;n m&igrave;nh bộ đồ vest &ldquo;sang chảnh&rdquo; của một nh&acirc;n vi&ecirc;n ng&acirc;n h&agrave;ng. B&agrave; Suree, mẹ của Sakkarin l&uacute;c n&agrave;o cũng tự h&agrave;o về cậu con trai của m&igrave;nh. Tuy nhi&ecirc;n, c&oacute; một sự thật kh&ocirc;ng ai biết: c&ocirc;ng việc hằng ng&agrave;y của Sakkarin l&agrave; l&aacute;i xe &ocirc;m đưa rước kh&aacute;ch ở Bangkok. Kh&ocirc;ng chỉ với gia đ&igrave;nh của m&igrave;nh, cậu c&ograve;n phải giữ k&iacute; b&iacute; mật n&agrave;y với Jai, &ldquo;crush&rdquo; thời trung học của cậu, một nh&acirc;n vi&ecirc;n ng&acirc;n h&agrave;ng xinh đẹp v&agrave; c&aacute; t&iacute;nh.</span></span></p>
', N'.', N'119 phút', 2019, NULL, N'1ch3G2iWjMIUGDD5zDtjCqv6C2HzvBzQe', N'.', 1020, 4, NULL, 150, CAST(N'2019-11-20 10:48:32.967' AS DateTime), NULL, NULL, NULL, N'Nam-Than-Xe-Om', NULL, 1, NULL, 7)
INSERT [dbo].[Movie] ([MovieID], [Name], [Image], [MoreImages], [Actor], [Description], [Directors], [Time], [Year], [Country], [MovieLink], [TrailerLink], [CategoryID], [Rate], [TrailerID], [Viewed], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [CountryID]) VALUES (3046, N'Đảo Săn Mồi', N'/Data/files/New%20Movie/poster_medium_16.jpg', N'.', N'.', N'<p><span style="font-size:11pt"><span style="font-family:&quot;Calibri&quot;,sans-serif">Để vượt qua sang chấn t&acirc;m l&yacute;, Toby đ&atilde; đăng k&yacute; một kh&oacute;a học sinh tồn. Chương tr&igrave;nh y&ecirc;u cầu cậu phải tập cắm trại một m&igrave;nh nơi đảo hoang trong 3 ng&agrave;y. Xui xẻo thay, h&ograve;n đảo m&agrave; cậu chọn lại bị &aacute;m bởi một thế lực chết ch&oacute;c kinh ho&agrave;ng. </span></span></p>
', N'.', N'132 phút', 2019, NULL, N'1ch3G2iWjMIUGDD5zDtjCqv6C2HzvBzQe', N'.', 1007, 6, NULL, 1000, CAST(N'2019-11-20 10:49:27.577' AS DateTime), NULL, NULL, NULL, N'Dao-San-Moi', NULL, 1, NULL, 1)
INSERT [dbo].[Movie] ([MovieID], [Name], [Image], [MoreImages], [Actor], [Description], [Directors], [Time], [Year], [Country], [MovieLink], [TrailerLink], [CategoryID], [Rate], [TrailerID], [Viewed], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [CountryID]) VALUES (3047, N'Na Tra: Ma Đồng Giáng Thế', N'/Data/files/New%20Movie/poster_medium_17.jpg', N'.', N'.', N'<p><span style="font-size:11pt"><span style="font-family:&quot;Calibri&quot;,sans-serif">Từ thuở xa xưa, tinh hoa đ&acirc;́t trời h&ocirc;̣i tụ thành m&ocirc;̣t vi&ecirc;n ngọc chứa đựng năng lượng kh&ocirc;̉ng l&ocirc;̀. Nguy&ecirc;n Thủy Thi&ecirc;n T&ocirc;n đã ph&acirc;n tách vi&ecirc;n ngọc này thành 1 vi&ecirc;n Linh Ch&acirc;u và 1 vi&ecirc;n Ma Hoàn. Vi&ecirc;n Linh Ch&acirc;u sẽ đ&acirc;̀u thai thành m&ocirc;̣t anh hùng cứu th&ecirc;́, phò trợ nhà Chu. Trong khi đó, Ma Hoàn sẽ tạo ra m&ocirc;̣t Ma Vương tàn sát thi&ecirc;n hạ. Đ&ecirc;̉ ngăn chặn thảm họa, Nguy&ecirc;n Thủy Thi&ecirc;n T&ocirc;n đã hạ chú đ&ecirc;̉ sau 3 năm Ma Vương sẽ bị Thi&ecirc;n ki&ecirc;́p ti&ecirc;u di&ecirc;̣t. Li&ecirc;̣u Na Tra có đủ sức đ&ecirc;̉ thay đ&ocirc;̉i Thi&ecirc;n m&ecirc;̣nh?</span></span></p>
', N'.', N'119 phút', 2019, NULL, N'1ch3G2iWjMIUGDD5zDtjCqv6C2HzvBzQe', N'.', 1021, 5, NULL, 1065, CAST(N'2019-11-20 10:52:05.773' AS DateTime), NULL, NULL, NULL, N'na-tra-ma-dong-giang-the', NULL, 1, NULL, 1002)
INSERT [dbo].[Movie] ([MovieID], [Name], [Image], [MoreImages], [Actor], [Description], [Directors], [Time], [Year], [Country], [MovieLink], [TrailerLink], [CategoryID], [Rate], [TrailerID], [Viewed], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [CountryID]) VALUES (3048, N'Hung Thần Đại Dương: Thảm Sát', N'/Data/files/New%20Movie/poster_medium_18.jpg', N'.', N'.', N'<p><span style="font-size:11pt"><span style="font-family:&quot;Calibri&quot;,sans-serif">Trong chuyến phi&ecirc;u lưu đến một v&ugrave;ng đảo &iacute;t người biết đến, 4 c&ocirc; g&aacute;i Mia (Sophie N&eacute;lisse), Sasha (Corinne Foxx), Nicole (Sistine Stallone) v&agrave; Alexa (Brianne Tju) quyết định lặn xuống biển để kh&aacute;m ph&aacute; một th&agrave;nh cổ của người Maya dưới đ&aacute;y đại dương. Khi v&agrave;o đến b&ecirc;n trong, cổng th&agrave;nh bỗng sụp đổ khiến họ phải nhanh ch&oacute;ng t&igrave;m c&aacute;ch tho&aacute;t th&acirc;n trong những đường hầm m&ecirc; cung v&agrave; c&aacute;c hang động kỳ qu&aacute;i trước khi cạn sạch dưỡng kh&iacute;.</span></span></p>

<p><span style="font-size:11pt"><span style="font-family:&quot;Calibri&quot;,sans-serif">Cơn &aacute;c mộng lạc lối dưới biển s&acirc;u c&agrave;ng trở n&ecirc;n kinh khủng hơn khi c&aacute;c c&ocirc; g&aacute;i ph&aacute;t hiện ra th&agrave;nh phố dưới biển n&agrave;y ch&iacute;nh l&agrave; nơi cư ngụ của lo&agrave;i c&aacute; mập trắng khổng lồ kh&aacute;t m&aacute;u.</span></span></p>
', N'.', N'119 phút', 2019, NULL, N'1ch3G2iWjMIUGDD5zDtjCqv6C2HzvBzQe', N'.', 1007, 5, NULL, 1204, CAST(N'2019-11-20 10:53:40.897' AS DateTime), NULL, NULL, NULL, N'hung-than-dai-duong-tham-sat', NULL, 1, NULL, 1)
INSERT [dbo].[Movie] ([MovieID], [Name], [Image], [MoreImages], [Actor], [Description], [Directors], [Time], [Year], [Country], [MovieLink], [TrailerLink], [CategoryID], [Rate], [TrailerID], [Viewed], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [CountryID]) VALUES (3050, N'Cuộc Đời Phi Thường Của Chú Chó Enzo', N'/Data/files/New%20Movie/poster_medium_19.jpg', N'.', N'.', N'<p><span style="font-size:11pt"><span style="font-family:&quot;Calibri&quot;,sans-serif">Dựa tr&ecirc;n tiểu thuyết ăn kh&aacute;ch của Garth Stein, bộ phim đặt ch&uacute;ng ta v&agrave;o g&oacute;c nh&igrave;n v&agrave; lời kể của ch&uacute; ch&oacute; Golden Retriever t&ecirc;n Enzo khi sống c&ugrave;ng gia đ&igrave;nh của Denny Swift với người vợ xinh đẹp Eve v&agrave; con g&aacute;i Zoe. Sống c&ugrave;ng một tay đua thể thức một d&agrave;y dạn kinh nghiệm như Denny khiến Enzo cũng y&ecirc;u th&iacute;ch m&ocirc;n thể thao tốc độ n&agrave;y v&agrave; chiếc tay l&aacute;i của chiếc xe đua thể thực một cũng bẻ hướng cuộc đời của Enzo theo một c&aacute;ch phi thường nhất.</span></span></p>
', N'.', N'120 phút', 2019, NULL, N'1ch3G2iWjMIUGDD5zDtjCqv6C2HzvBzQe', N'.', 1018, 5, NULL, 1008, CAST(N'2019-11-20 10:55:18.210' AS DateTime), NULL, NULL, NULL, N'Cuoc-Doi-Phi-Thuong-Cua-Chu-Cho-Enzo', NULL, 1, NULL, 2)
INSERT [dbo].[Movie] ([MovieID], [Name], [Image], [MoreImages], [Actor], [Description], [Directors], [Time], [Year], [Country], [MovieLink], [TrailerLink], [CategoryID], [Rate], [TrailerID], [Viewed], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [CountryID]) VALUES (3051, N'Quá Nhanh Quá Nguy Hiểm 8', N'/Data/files/New%20Movie/poster_medium_21.jpg', N'.', N'.', N'<p><span style="font-size:11pt"><span style="font-family:&quot;Calibri&quot;,sans-serif">Sau 8 phim với phần doanh thu chạm mức 5 tỉ đ&ocirc; la Mỹ to&agrave;n cầu, giờ đ&acirc;y thương hiệu Fast &amp; Furious sẽ trở lại với một phần ngoại truyện ho&agrave;n to&agrave;n độc lập với sự tham gia của Dwayne Johnson trong vai Luke Hobbs v&agrave; Jason Statham trong vai Deckard Shaw trong Hobbs &amp; Shaw.</span></span></p>

<p>&nbsp;</p>

<p><span style="font-size:11pt"><span style="font-family:&quot;Calibri&quot;,sans-serif">C&acirc;u chuyện giữa hai người tưởng như kh&ocirc;ng đội trời chung l&agrave; Đặc vụ An ninh Ngoại giao Mỹ Luke Hobbs v&agrave; t&ecirc;n tội phạm đ&aacute;nh thu&ecirc; kh&eacute;t tiếng Deckard Shaw khi họ bất đắc dĩ phải bắt tay hợp t&aacute;c nhằm ngăn chặn &acirc;m mưu của tr&ugrave;m phản diện cực nguy hiểm trong diện b&iacute; ẩn Brixton.</span></span></p>
', N'.', N'119 phút', 2019, NULL, N'1ch3G2iWjMIUGDD5zDtjCqv6C2HzvBzQe', N'.', 1019, 8, NULL, 1900, CAST(N'2019-11-20 10:56:21.053' AS DateTime), NULL, NULL, NULL, N'Qua-Nhanh-Qua-Nguy-Hiem-8', NULL, 1, NULL, 1)
INSERT [dbo].[Movie] ([MovieID], [Name], [Image], [MoreImages], [Actor], [Description], [Directors], [Time], [Year], [Country], [MovieLink], [TrailerLink], [CategoryID], [Rate], [TrailerID], [Viewed], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [CountryID]) VALUES (3052, N'Siêu Lừa Đảo', N'/Data/files/New%20Movie/poster_medium_22.jpg', N'.', N'Will Smith', N'<p><span style="font-size:11pt"><span style="font-family:&quot;Calibri&quot;,sans-serif">Nicky Spurgeon (Will Smith) l&agrave; một tay lừa đảo chuy&ecirc;n nghiệp tr&ecirc;n thương trường. Một ng&agrave;y nọ, Nicky gặp Jess (Margot Robbie), một c&ocirc; n&agrave;ng n&oacute;ng bỏng mới v&agrave;o nghề c&ograve;n nhiều bỡ ngỡ v&agrave; Jess trở th&agrave;nh &ldquo;đệ tử&rdquo; của anh. C&ugrave;ng nhau chống lại một t&ecirc;n tr&ugrave;m lừa đảo kh&aacute;c, hai &ldquo;thầy tr&ograve;&rdquo; Nicky v&agrave; Jess h&igrave;nh th&agrave;nh một mối t&igrave;nh hết sức l&atilde;ng mạn v&agrave; kh&ocirc;ng ai ngờ tới... </span></span></p>
', N'.', N'119 phút', 2019, NULL, N'1ch3G2iWjMIUGDD5zDtjCqv6C2HzvBzQe', N'.', 1008, 5, NULL, 1201, CAST(N'2019-11-20 10:57:29.033' AS DateTime), NULL, NULL, NULL, N'Sieu-Lua-Dao', NULL, 1, NULL, 1)
INSERT [dbo].[Movie] ([MovieID], [Name], [Image], [MoreImages], [Actor], [Description], [Directors], [Time], [Year], [Country], [MovieLink], [TrailerLink], [CategoryID], [Rate], [TrailerID], [Viewed], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [CountryID]) VALUES (3053, N'Ngày Hôm Qua', N'/Data/files/New%20Movie/poster_medium_23.jpg', N'.', N'.', N'<p><span style="font-size:11pt"><span style="font-family:&quot;Calibri&quot;,sans-serif">Ng&agrave;y H&ocirc;m Qua lấy bối cảnh một thế giới nơi nh&oacute;m The Beatles bỗng nhi&ecirc;n bị &ldquo;tan biến&rdquo; khỏi nền văn h&oacute;a &acirc;m nhạc đương đại, v&agrave; nh&acirc;n vật ch&iacute;nh Jack Malik (Himesh Patel) l&agrave; người duy nhất c&ograve;n nhớ đến họ.</span></span></p>
', N'.', N'100 phút', 2019, NULL, N'1ch3G2iWjMIUGDD5zDtjCqv6C2HzvBzQe', N'.', 1020, 4, NULL, 1300, CAST(N'2019-11-20 10:58:21.950' AS DateTime), NULL, NULL, NULL, N'Ngay-Hom-Qua', NULL, 1, NULL, 1)
INSERT [dbo].[Movie] ([MovieID], [Name], [Image], [MoreImages], [Actor], [Description], [Directors], [Time], [Year], [Country], [MovieLink], [TrailerLink], [CategoryID], [Rate], [TrailerID], [Viewed], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [CountryID]) VALUES (3054, N'Đứa Con Của Thời Tiết', N'/Data/files/New%20Movie/poster_medium_24.jpg', N'.', N'.', N'<p><span style="font-size:11pt"><span style="font-family:&quot;Calibri&quot;,sans-serif">Đứa Con Của Thời Tiết xoay quanh hai nh&acirc;n vật: Hodaka v&agrave; Hina. Hodaka l&agrave; cậu thiếu ni&ecirc;n sống tr&ecirc;n một h&ograve;n đảo nhỏ, đ&atilde; rời khỏi qu&ecirc; hương để đến Tokyo sầm uất. Tại đ&acirc;y, cậu quen biết với Hina - một c&ocirc; g&aacute;i k&igrave; lạ c&oacute; năng lực thanh lọc bầu trời mỗi khi &quot;cầu nguyện&quot;. C&ocirc; c&oacute; khả năng chặn đứng cơn mưa v&agrave; xua tan m&acirc;y đen theo &yacute; muốn.</span></span></p>
', N'.', N'120 phút', 2019, NULL, N'1ch3G2iWjMIUGDD5zDtjCqv6C2HzvBzQe', N'.', 1021, 7, NULL, 2003, CAST(N'2019-11-20 10:59:20.617' AS DateTime), NULL, NULL, NULL, N'Dua-Con-Cua-Thoi-Tiet', NULL, 1, NULL, 6)
INSERT [dbo].[Movie] ([MovieID], [Name], [Image], [MoreImages], [Actor], [Description], [Directors], [Time], [Year], [Country], [MovieLink], [TrailerLink], [CategoryID], [Rate], [TrailerID], [Viewed], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [CountryID]) VALUES (3055, N'Tiên Hắc Ám', N'/Data/files/New%20Movie/poster_medium_25.jpg', N'.', N'.', N'<p><span style="font-size:11pt"><span style="font-family:&quot;Calibri&quot;,sans-serif">MALEFICENT (tựa Việt: TI&Ecirc;N HẮC &Aacute;M) l&agrave; bộ phim hiếm hoi của Walt Disney c&oacute; khắc họa một nh&acirc;n vật phản diện điển h&igrave;nh trong một bộ phim nổi tiếng, mụ ph&ugrave; thủy Maleficent trong t&aacute;c phẩm hoạt h&igrave;nh kinh điển &ldquo;Sleeping Beauty&rdquo; (Người đẹp ngủ trong rừng). Bộ phim sẽ lần đầu tiết lộ sự thật đằng sau số phận bi kịch của người phụ nữ vốn c&oacute; tr&aacute;i tim thuần khiết n&agrave;y cũng như ch&acirc;n tướng của sự phản bội đ&atilde; khiến tr&aacute;i tim của b&agrave; h&oacute;a đ&aacute;.</span></span></p>

<p>&nbsp;</p>

<p><span style="font-size:11pt"><span style="font-family:&quot;Calibri&quot;,sans-serif">Qua c&acirc;u chuyện trong phim, ch&uacute;ng ta sẽ biết được qu&aacute; khứ của Maleficent vốn l&agrave; một c&ocirc; g&aacute;i xinh đẹp v&agrave; trong sang sống cảnh điền vi&ecirc;n trong vương quốc y&ecirc;n b&igrave;nh của ri&ecirc;ng c&ocirc;. Rồi một ng&agrave;y nơi c&ocirc; sống bị &acirc;m mưu x&acirc;m chiếm, Maleficent dũng cảm đứng ra bảo vệ vương quốc nhưng c&ocirc; đ&atilde; bị phản bội, từ đ&oacute; tr&aacute;i tim c&ocirc; nhuốm đầy hận th&ugrave; v&agrave; trở n&ecirc;n t&agrave;n nhẫn. Để trả th&ugrave;, c&ocirc; đ&atilde; đặt lời nguyền l&ecirc;n c&ocirc;ng ch&uacute;a mới sinh của Quốc vương, nhưng khi đứa b&eacute; lớn l&ecirc;n, Maleficent bất ngờ nhận ra c&ocirc; b&eacute; c&oacute; thể nắm giữ ch&igrave;a kh&oacute;a mang đến sự b&igrave;nh y&ecirc;n cho vương quốc, cũng như cho ch&iacute;nh hạnh ph&uacute;c của c&ocirc;. </span></span></p>
', N'.', N'100 phút', 2019, NULL, N'1ch3G2iWjMIUGDD5zDtjCqv6C2HzvBzQe', N'.', 1008, 7, NULL, 3005, CAST(N'2019-11-20 11:00:35.657' AS DateTime), NULL, NULL, NULL, N'Tien-Hac-Am', NULL, 1, NULL, 1)
INSERT [dbo].[Movie] ([MovieID], [Name], [Image], [MoreImages], [Actor], [Description], [Directors], [Time], [Year], [Country], [MovieLink], [TrailerLink], [CategoryID], [Rate], [TrailerID], [Viewed], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [CountryID]) VALUES (3057, N'Quái Vật', N'/Data/files/New%20Movie/poster_medium_15.jpg', N'.', N'.', N'<p><span style="font-size:11pt"><span style="font-family:&quot;Calibri&quot;,sans-serif">Goblin l&agrave; một c&acirc;u chuyện thần thoại kể về Kim Shin (Gong Yoo), trong qu&aacute; khứ anh từng bị đ&acirc;m bởi một thanh kiếm ph&eacute;p thuật, Kim Shin kh&ocirc;ng những kh&ocirc;ng chết m&agrave; c&ograve;n c&oacute; được cuộc sống bất tử. Ở thời hiện đại, anh v&ocirc; t&igrave;nh gặp gỡ Wang Yeo (Lee Dong Wook), một thần chết mắc chứng mất tr&iacute; nhớ. Cả 2 dọn về ở c&ugrave;ng nhau v&agrave; g&acirc;y ra đủ chuyện dở kh&oacute;c dở cười.</span></span></p>

<p>&nbsp;</p>

<p><span style="font-size:11pt"><span style="font-family:&quot;Calibri&quot;,sans-serif">Chưa dừng lại ở đ&oacute;, Ji Eun Tak (Kim Go Eun), một nữ sinh cấp ba c&oacute; khả năng dị biệt nh&igrave;n thấy linh hồn. Cuộc gặp gỡ của hai người sẽ viết n&ecirc;n một c&acirc;u chuyện t&igrave;nh như thế n&agrave;o khi m&agrave; Kim Shin sẽ chết đi như mong muốn của anh nếu t&igrave;m thấy c&ocirc; d&acirc;u lo&agrave;i người, trong khi Eun Tak th&igrave; lu&ocirc;n tự nhận m&igrave;nh l&agrave; c&ocirc; d&acirc;u của anh?</span></span></p>
', N'.', N'132 phút', 2019, NULL, N'1ch3G2iWjMIUGDD5zDtjCqv6C2HzvBzQe', N'.', 1011, 5, NULL, 1003, CAST(N'2019-11-20 11:02:21.147' AS DateTime), NULL, NULL, NULL, N'Quai-Vat', NULL, 1, NULL, 5)
INSERT [dbo].[Movie] ([MovieID], [Name], [Image], [MoreImages], [Actor], [Description], [Directors], [Time], [Year], [Country], [MovieLink], [TrailerLink], [CategoryID], [Rate], [TrailerID], [Viewed], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [CountryID]) VALUES (3058, N'Chú Hề Ma Quái 2', N'/Data/files/New%20Movie/poster_medium(1).jpg', N'.', N'..', N'<div class="content" id="film-content" style="max-height:800px">
<p><strong>t Chapter Two (G&atilde; Hề Ma Qu&aacute;i 2)</strong> vẫn l&agrave; c&acirc;u chuyện về những c&ocirc; cậu b&eacute; của nh&oacute;m The Losers Club, l&uacute;c n&agrave;y đ&atilde; trưởng th&agrave;nh v&agrave; đối mặt với v&ocirc; số vấn đề trong cuộc sống. Chưa dừng lại ở đ&oacute;, &aacute;m ảnh ma hề Pennywise cứ 27 năm lại xuất hiện một lần tại thị trấn Derry buộc 7 c&ocirc; cậu b&eacute; ng&agrave;y n&agrave;o phải tiếp tục cuốn v&agrave;o cuộc chạm tr&aacute;n tiếp theo giữa hai b&ecirc;n thiện v&agrave; &aacute;c.<br />
<br />
Mặc d&ugrave; c&oacute; thể cả nh&oacute;m đ&atilde; trưởng th&agrave;nh v&agrave; kh&ocirc;n ngoan hơn, cuộc chiến của họ với Pennywise vẫn c&ograve;n đ&oacute; những hậu quả bất ngờ, thậm ch&iacute; khiến một số th&agrave;nh vi&ecirc;n phải trải qua đau đớn đến tột c&ugrave;ng.<br />
&nbsp;</p>

<div style="text-align:center"><img src="http://image.phimmoi.net/post/2019/10/09/ga-he-ma-quai-1280x700.jpg" /></div>

<p>&nbsp;</p>
</div>

<div class="block-tags">
<h3>&nbsp;</h3>
</div>
', N'.', N'132 phút', 2019, NULL, N'1ch3G2iWjMIUGDD5zDtjCqv6C2HzvBzQe', N'.', 1007, 8, NULL, 3005, CAST(N'2019-11-20 11:06:24.237' AS DateTime), NULL, NULL, NULL, N'Chu-He-Ma-Quai-2', NULL, 1, NULL, 1)
INSERT [dbo].[Movie] ([MovieID], [Name], [Image], [MoreImages], [Actor], [Description], [Directors], [Time], [Year], [Country], [MovieLink], [TrailerLink], [CategoryID], [Rate], [TrailerID], [Viewed], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [CountryID]) VALUES (3059, N'Test', N'/Data/files/New%20Movie/poster_medium_11.jpg', N'.', N'.', N'<p>dfdf</p>
', N'êr', N'119 phút', 2017, NULL, N'1ch3G2iWjMIUGDD5zDtjCqv6C2HzvBzQe', N'jjj', 1018, 9, NULL, 237, CAST(N'2020-04-28 19:20:06.807' AS DateTime), NULL, NULL, NULL, N'Test', NULL, 0, NULL, 1)
INSERT [dbo].[Movie] ([MovieID], [Name], [Image], [MoreImages], [Actor], [Description], [Directors], [Time], [Year], [Country], [MovieLink], [TrailerLink], [CategoryID], [Rate], [TrailerID], [Viewed], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [CountryID]) VALUES (3060, N'Ngày Hôm Qua', N'/Data/files/New%20Movie/poster_medium_23.jpg', N'c', N'Macheal Freed', N'<p><span style="font-size:11pt"><span style="font-family:&quot;Calibri&quot;,sans-serif">Ng&agrave;y H&ocirc;m Qua lấy bối cảnh một thế giới nơi nh&oacute;m The Beatles bỗng nhi&ecirc;n bị &ldquo;tan biến&rdquo; khỏi nền văn h&oacute;a &acirc;m nhạc đương đại, v&agrave; nh&acirc;n vật ch&iacute;nh Jack Malik (Himesh Patel) l&agrave; người duy nhất c&ograve;n nhớ đến họ.</span></span></p>
', N'Rajkumar Hirani,', N'132 phút', 2019, NULL, N'1ch3G2iWjMIUGDD5zDtjCqv6C2HzvBzQe', N'n', 1020, 7, NULL, 103, CAST(N'2019-12-03 16:59:50.523' AS DateTime), NULL, NULL, NULL, N'Ngay-Hom-Qua', NULL, 1, NULL, 2)
INSERT [dbo].[Movie] ([MovieID], [Name], [Image], [MoreImages], [Actor], [Description], [Directors], [Time], [Year], [Country], [MovieLink], [TrailerLink], [CategoryID], [Rate], [TrailerID], [Viewed], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [CountryID]) VALUES (3061, N'Quỷ Quyệt 3', N'/Data/images/Movies/QQ.jpg', N'n', N'Dee Barale', N'<p>&nbsp;</p>

<blockquote>
<p><span style="font-size:16px">Chưa dừng lại ở đ&oacute;, <strong><em>Ji Eun Tak (Kim Go Eun)</em></strong>, một nữ sinh cấp ba c&oacute; khả năng dị biệt nh&igrave;n thấy linh hồn. Cuộc gặp gỡ của hai người sẽ viết n&ecirc;n một c&acirc;u chuyện t&igrave;nh như thế n&agrave;o khi m&agrave; Kim Shin sẽ chết đi như mong muốn của anh nếu t&igrave;m thấy c&ocirc; d&acirc;u lo&agrave;i người, trong khi Eun Tak th&igrave; lu&ocirc;n tự nhận m&igrave;nh l&agrave; c&ocirc; d&acirc;u của anh?<span style="font-family:&quot;Calibri&quot;,sans-serif"><img alt="crying" src="http://localhost:52046/Areas/Admin/ckeditor/plugins/smiley/images/cry_smile.png" style="height:23px; width:23px" title="crying" /></span></span></p>
</blockquote>
', N'anton kinde', N'120 phút', 2019, NULL, N'1ch3G2iWjMIUGDD5zDtjCqv6C2HzvBzQe', N'n', 1007, 1, NULL, 101, CAST(N'2020-04-28 19:17:50.570' AS DateTime), NULL, NULL, NULL, N'Quy-Quyet-3', NULL, 0, NULL, 1)
INSERT [dbo].[Movie] ([MovieID], [Name], [Image], [MoreImages], [Actor], [Description], [Directors], [Time], [Year], [Country], [MovieLink], [TrailerLink], [CategoryID], [Rate], [TrailerID], [Viewed], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [CountryID]) VALUES (3064, N'Ironman', N'/Data/files/ironman.jpg', N'/Data/files/ironman.jpg', N'Mona SinghMona,Sharman JoshiRaju Rastogi', N'<p>phim mới</p>
', N'Rajkumar Hirani, ', N'170 phút', 2009, NULL, N'1ch3G2iWjMIUGDD5zDtjCqv6C2HzvBzQe', N'https://www.youtube.com/embed/rT22nYLaVbo', 1019, 1, NULL, 1224269, CAST(N'2020-07-10 08:21:13.603' AS DateTime), NULL, NULL, NULL, N'Ironman', NULL, 1, NULL, 1)
SET IDENTITY_INSERT [dbo].[Movie] OFF
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([NewsID], [Name], [Image], [Description], [Year], [Country], [MovieLink], [TrailerLink], [CategoryID], [Rate], [TrailerID], [Viewed], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [Tags], [ImageNews], [MoreDescription]) VALUES (1, N'‘Civil War là tác phẩm quan trọng nhất đối với Marvel’', N'/Data/files/New%20Movie/cvilwar.jpg', N'<h1>&lsquo;Civil War l&agrave; t&aacute;c phẩm quan trọng nhất đối với Marvel&rsquo;</h1>

<p>Phe Captain America mang si&ecirc;u bom tấn &quot;Civil War&quot; tới Singapore với lời hứa hẹn rằng đ&acirc;y l&agrave; t&aacute;c phẩm khiến to&agrave;n bộ c&aacute;c nh&acirc;n vật si&ecirc;u anh h&ugrave;ng thay đổi trong tương lai.</p>

<div class="the-article-body">
<table align="center" class="picture">
	<tbody>
		<tr>
			<td>
			<div class="zad-inimage-wrapper" style="overflow:hidden"><img alt="‘Civil War la tac pham quan trong nhat doi voi Marvel’ hinh anh 1 " src="https://znews-photo.zadn.vn/w1024/Uploaded/xbhunku/2016_04_22/c1_zing.JPG" /></div>
			</td>
		</tr>
		<tr>
			<td>
			<p>Ng&agrave;y 21/4, si&ecirc;u bom tấn <em>Captain America: Civil War </em>tổ chức buổi họp b&aacute;o ra mắt khu vực Đ&ocirc;ng Nam &Aacute; tại khu Marina, Singapore. Tham gia sự kiện l&agrave; ba ng&ocirc;i sao Chris Evans, Sebastian Stan, Anthony Mackie v&agrave; một trong hai đạo diễn của bộ phim, Joe Russo. Ảnh: <strong><em>Tuấn Lương</em></strong></p>
			</td>
		</tr>
	</tbody>
</table>

<table align="center" class="picture">
	<tbody>
		<tr>
			<td><img alt="‘Civil War la tac pham quan trong nhat doi voi Marvel’ hinh anh 2 " src="https://znews-photo.zadn.vn/w1024/Uploaded/xbhunku/2016_04_22/c1a_1.JPG" /></td>
		</tr>
		<tr>
			<td>
			<p>G&acirc;y nhiều sự ch&uacute; &yacute; nhất ch&iacute;nh l&agrave; Chris Evans, nam diễn vi&ecirc;n 34 tuổi sắm vai Captain America từ năm 2011 tới nay. Anh xuất hiện trong bộ trang phục kh&aacute; giản dị v&agrave; lu&ocirc;n t&igrave;m c&aacute;ch khuấy động cả kh&aacute;n ph&ograve;ng. Ảnh: <strong><em>Disney</em></strong></p>
			</td>
		</tr>
	</tbody>
</table>

<table align="center" class="picture">
	<tbody>
		<tr>
			<td><img alt="‘Civil War la tac pham quan trong nhat doi voi Marvel’ hinh anh 3 " src="https://znews-photo.zadn.vn/w1024/Uploaded/xbhunku/2016_04_22/c2_zing.JPG" /></td>
		</tr>
		<tr>
			<td>
			<p>Trong <em>Civil War</em>, đạo luật kiểm so&aacute;t si&ecirc;u anh h&ugrave;ng được 117 quốc gia tr&ecirc;n to&agrave;n thế giới th&ocirc;ng qua, g&acirc;y ra chia rẽ nội bộ nghi&ecirc;m trọng trong nh&oacute;m Avengers v&agrave; dẫn đến cuộc chiến kh&ocirc;ng khoan nhượng giữa hai phe lần lượt do Captain America v&agrave; Iron Man đứng đầu. Chưa kể, Cap c&ograve;n muốn gi&uacute;p đỡ Winter Soldier/Bucky Barnes - người bạn th&acirc;n bị tẩy n&atilde;o, từng g&acirc;y ra nhiều tội &aacute;c v&agrave; nay bị ch&iacute;nh quyền truy đuổi gắt gao. Ảnh: <strong><em>Tuấn Lương</em></strong></p>
			</td>
		</tr>
	</tbody>
</table>

<table align="center" class="picture">
	<tbody>
		<tr>
			<td><img alt="‘Civil War la tac pham quan trong nhat doi voi Marvel’ hinh anh 4 " src="https://znews-photo.zadn.vn/w1024/Uploaded/xbhunku/2016_04_22/c3_zing.JPG" /></td>
		</tr>
		<tr>
			<td>
			<p>Ba diễn vi&ecirc;n c&oacute; mặt tại Singapore đều thuộc phe Cap trong phim n&ecirc;n to&agrave;n bộ sự kiện quảng b&aacute; đều mang t&ocirc;ng m&agrave;u xanh da trời. Điều n&agrave;y tr&aacute;i ngược với c&aacute;c hoạt động diễn ra tại ch&acirc;u &Acirc;u của <em>Civil War</em> với m&agrave;u đỏ bởi sự xuất hiện của phe Iron Man. Ảnh: <strong><em>Tuấn Lương</em></strong></p>
			</td>
		</tr>
	</tbody>
</table>

<table align="center" class="picture">
	<tbody>
		<tr>
			<td><img alt="‘Civil War la tac pham quan trong nhat doi voi Marvel’ hinh anh 5 " src="https://znews-photo.zadn.vn/w1024/Uploaded/xbhunku/2016_04_22/c4_zing.JPG" /></td>
		</tr>
		<tr>
			<td>
			<p>Đạo diễn Joe Russo chia sẻ<em> Civil War </em>l&agrave; t&aacute;c phẩm bản lề v&agrave; quan trọng nhất d&agrave;nh cho thế giới phim <a class="topic company autolink" href="https://news.zing.vn/tieu-diem/marvel.html" title="Tin tức Marvel">Marvel</a> từ trước tới nay. C&aacute;c nh&agrave; sản xuất đ&atilde; mất gần 10 năm để biến c&aacute;c si&ecirc;u anh h&ugrave;ng trở n&ecirc;n quen thuộc với kh&aacute;n giả, đồng thời x&acirc;y dựng n&ecirc;n bộ khung c&acirc;u chuyện vững chắc. Nhưng giờ l&agrave; l&uacute;c để &ldquo;ph&aacute; tan&rdquo; tất cả, thay đổi t&acirc;m l&yacute; to&agrave;n bộ nh&oacute;m nh&acirc;n vật v&agrave; hướng tới <em>Avengers: Infinity War</em>. Ảnh: <strong><em>Tuấn Lương</em></strong></p>
			</td>
		</tr>
	</tbody>
</table>

<table align="center" class="picture">
	<tbody>
		<tr>
			<td><img alt="‘Civil War la tac pham quan trong nhat doi voi Marvel’ hinh anh 6 " src="https://znews-photo.zadn.vn/w1024/Uploaded/xbhunku/2016_04_22/c5_zing.JPG" /></td>
		</tr>
		<tr>
			<td>
			<p>&Ocirc;ng cho biết cảnh quay tốn nhiều c&ocirc;ng sức nhất ch&iacute;nh l&agrave; trường đoạn hai phe si&ecirc;u anh h&ugrave;ng giao chiến &aacute;c liệt tại một s&acirc;n bay nước Đức. Joe Russo c&ugrave;ng người em trai Anthony Russo đ&atilde; phải rất đau đầu trong việc l&agrave;m sao chia đất diễn cho hơn 10 si&ecirc;u anh h&ugrave;ng khi họ c&ugrave;ng nhau xuất hiện. Ảnh: <strong><em>Tuấn Lương</em></strong></p>
			</td>
		</tr>
	</tbody>
</table>

<table align="center" class="picture">
	<tbody>
		<tr>
			<td><img alt="‘Civil War la tac pham quan trong nhat doi voi Marvel’ hinh anh 7 " src="https://znews-photo.zadn.vn/w1024/Uploaded/xbhunku/2016_04_22/c6_zing.JPG" /></td>
		</tr>
		<tr>
			<td>
			<p>Tuy ở thế đối đầu tr&ecirc;n m&agrave;n ảnh, nhưng Chris Evans vẫn d&agrave;nh nhiều lời khen ngợi cho bạn diễn Robert Downey Jr. trong vai Iron Man. &ldquo;Ch&agrave;ng Cap&rdquo; cho biết đ&acirc;y kh&ocirc;ng phải l&agrave; lần đầu ti&ecirc;n hai người hợp t&aacute;c, song, anh vẫn lu&ocirc;n cảm thấy bất ngờ trước t&agrave;i ứng biến của &ldquo;Người Sắt&rdquo; trước ống k&iacute;nh m&aacute;y quay. Ảnh: <strong><em>Tuấn Lương</em></strong></p>
			</td>
		</tr>
	</tbody>
</table>

<table align="center" class="picture">
	<tbody>
		<tr>
			<td><img alt="‘Civil War la tac pham quan trong nhat doi voi Marvel’ hinh anh 8 " src="https://znews-photo.zadn.vn/w1024/Uploaded/xbhunku/2016_04_22/c7_zing_1.JPG" /></td>
		</tr>
		<tr>
			<td>
			<p>Khi được hỏi anh th&iacute;ch l&agrave;m bạn trai nữ si&ecirc;u anh h&ugrave;ng n&agrave;o nhất, Chris Evans ban đầu tỏ ra lưỡng lự, nhưng cuối c&ugrave;ng quyết định chọn Black Widow - một th&agrave;nh vi&ecirc;n của phe Iron Man. Nh&acirc;n vật trong <em>Civil War </em>tiếp tục do minh tinh <a class="topic person autolink" href="https://news.zing.vn/tieu-diem/scarlett-johansson-dien-vien.html" title="Tin tức Scarlett Johansson">Scarlett Johansson</a> thể hiện. Nam diễn vi&ecirc;n cho rằng Cap v&agrave; Black Widow c&oacute; xuất th&acirc;n kh&aacute;c biệt, nhưng rốt cuộc lại trở th&agrave;nh nguồn an ủi cho nhau ở t&igrave;nh thế ngặt ngh&egrave;o. Đ&oacute; l&agrave; mối quan hệ thuần khiết m&agrave; Chris Evans muốn c&aacute;c nh&agrave; bi&ecirc;n kịch tiếp tục khai th&aacute;c. Ảnh: <strong><em>Tuấn Lương</em></strong></p>
			</td>
		</tr>
	</tbody>
</table>

<table align="center" class="picture">
	<tbody>
		<tr>
			<td><img alt="‘Civil War la tac pham quan trong nhat doi voi Marvel’ hinh anh 9 " src="https://znews-photo.zadn.vn/w1024/Uploaded/xbhunku/2016_04_22/c8_zing.JPG" /></td>
		</tr>
		<tr>
			<td>
			<p>Giống như tr&ecirc;n m&agrave;n ảnh, Anthony Mackie - người sắm vai Falcon, bạn th&acirc;n của Captain America, lu&ocirc;n h&agrave;i hước. Anh cho biết khi team Cap đi quảng b&aacute; bộ phim, họ muốn kh&aacute;m ph&aacute; văn h&oacute;a bản địa, như việc mới thử m&oacute;n cua sốt cay Singapore đ&ecirc;m h&ocirc;m trước. Ngược lại, anh mỉa mai phe Iron Man th&igrave; chỉ biết hưởng thụ, phung ph&iacute; tiền v&agrave;o những th&uacute; vui xa xỉ kh&ocirc;ng cần thiết như đi spa. Ảnh: <strong><em>Tuấn Lương</em></strong></p>
			</td>
		</tr>
	</tbody>
</table>

<table align="center" class="picture">
	<tbody>
		<tr>
			<td><img alt="‘Civil War la tac pham quan trong nhat doi voi Marvel’ hinh anh 10 " src="https://znews-photo.zadn.vn/w1024/Uploaded/xbhunku/2016_04_22/c9_zing.JPG" /></td>
		</tr>
		<tr>
			<td>
			<p>T&agrave;i tử da m&agrave;u so s&aacute;nh Iron Man giống như &ldquo;lon Coca ngạo mạn&rdquo;, Vision l&agrave; &ldquo;c&acirc;y b&uacute;t dạ di động&rdquo;, War Machine l&agrave; &ldquo;th&ugrave;ng r&aacute;c&rdquo;, Black Panther l&agrave; &ldquo;chiếc lốp Michelin&rdquo;, v&agrave; khiến to&agrave;n bộ kh&aacute;n ph&ograve;ng cười nắc nẻ. Anthony Mackie n&oacute;i anh sẵn s&agrave;ng ti&ecirc;u diệt to&agrave;n bộ phe Iron Man, v&agrave; chỉ &ldquo;tha mạng&rdquo; cho duy nhất Black Widow bởi c&ocirc; qu&aacute; quyến rũ. Ảnh: <strong><em>Tuấn Lương</em></strong></p>
			</td>
		</tr>
	</tbody>
</table>

<table align="center" class="picture">
	<tbody>
		<tr>
			<td><img alt="‘Civil War la tac pham quan trong nhat doi voi Marvel’ hinh anh 11 " src="https://znews-photo.zadn.vn/w1024/Uploaded/xbhunku/2016_04_22/c10_zing.JPG" /></td>
		</tr>
		<tr>
			<td>
			<p>Sebastian Stan, nam diễn vi&ecirc;n sắm vai Winter Soldier - Chiến binh M&ugrave;a đ&ocirc;ng, kh&aacute; kiệm lời tại buổi họp b&aacute;o. Anh chia sẻ m&igrave;nh rất may mắn khi được nhận một trong những vai diễn phức tạp bậc nhất trong d&ograve;ng phim si&ecirc;u anh h&ugrave;ng n&oacute;i chung khoảng 10 năm qua. Ảnh: <strong><em>Tuấn Lương</em></strong></p>
			</td>
		</tr>
	</tbody>
</table>

<table align="center" class="picture">
	<tbody>
		<tr>
			<td><img alt="‘Civil War la tac pham quan trong nhat doi voi Marvel’ hinh anh 12 " src="https://znews-photo.zadn.vn/w1024/Uploaded/xbhunku/2016_04_22/c11_zing.JPG" /></td>
		</tr>
		<tr>
			<td>
			<p>Stan n&oacute;i nh&acirc;n vật của m&igrave;nh trong <em>Civil War</em> kh&ocirc;ng c&ograve;n l&agrave; Bucky Barnes năm xưa, hay l&agrave; Winter Soldier như ở <em>Captain America 2</em>; m&agrave; thay v&agrave;o đ&oacute;, giống như một điều g&igrave; ở khoảng giữa. Do đ&oacute;, t&agrave;i tử cảm gi&aacute;c m&igrave;nh như phải thể hiện ba nh&acirc;n vật kh&aacute;c nhau ở ba bộ phim Marvel m&agrave; anh từng tham gia. Ảnh: <strong><em>Tuấn Lương</em></strong></p>
			</td>
		</tr>
	</tbody>
</table>

<table align="center" class="picture">
	<tbody>
		<tr>
			<td><img alt="‘Civil War la tac pham quan trong nhat doi voi Marvel’ hinh anh 13 " src="https://znews-photo.zadn.vn/w1024/Uploaded/xbhunku/2016_04_22/c12_zing.JPG" /></td>
		</tr>
		<tr>
			<td>
			<p><em>Captain America: Civil War </em>ch&iacute;nh thức khởi chiếu tại c&aacute;c quốc gia Đ&ocirc;ng Nam &Aacute;, trong đ&oacute; c&oacute; Việt Nam, từ ng&agrave;y 27/4. Ảnh: <strong><em>Tuấn Lương</em></strong></p>
			</td>
		</tr>
	</tbody>
</table>

<div class="formatted video-container"><iframe frameborder="0" height="315" src="https://www.youtube.com/embed/dKrVegVI0Us" width="560"></iframe></div>

<p><strong><a class="autolink" href="https://news.zing.vn/video-trailer-cuoi-cung-bom-tan-captain-america-civil-war-post633009.html" target="_blank">Trailer cuối c&ugrave;ng bom tấn &#39;Captain America: Civil War&#39;</a></strong> Đoạn trailer cuối c&ugrave;ng của si&ecirc;u bom tấn nh&agrave; Marvel h&eacute; lộ h&igrave;nh ảnh Spider-Man do t&agrave;i năng trẻ Tom Holland thể hiện.</p>
</div>

<p>&nbsp;</p>
', 2019, NULL, NULL, NULL, NULL, NULL, NULL, 102, CAST(N'2019-11-19 15:27:38.610' AS DateTime), NULL, NULL, NULL, NULL, N'e Captain America mang siêu bom tấn "Civil War" tới Singapore với lời hứa hẹn rằng đây...                                       ', 1, NULL, NULL, N'/Data/images/News/civiwarnew.JPG', N'e Captain America mang siêu bom tấn "Civil War" tới Singapore với lời hứa hẹn rằng đây...                                       ')
INSERT [dbo].[News] ([NewsID], [Name], [Image], [Description], [Year], [Country], [MovieLink], [TrailerLink], [CategoryID], [Rate], [TrailerID], [Viewed], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [Tags], [ImageNews], [MoreDescription]) VALUES (2, N' IT 2 cập bến rạp Việt, fan của gã hề kinh dị chắp tay hi vọng phim không bị cắt xén', N'/Data/files/New%20Movie/poster_medium_27.jpg', N'<p>Mỗi khi một bộ phim kinh dị tung trailer, c&acirc;u hỏi đầu ti&ecirc;n của kh&aacute;n giả Việt sẽ l&agrave; :&ldquo;Kh&ocirc;ng biết phim c&oacute; cấm chiếu kh&ocirc;ng nhỉ?&rdquo;. Nhiều phim kinh dị nhận được đ&aacute;nh gi&aacute; rất tốt tr&ecirc;n thế giới, nhưng lại kh&ocirc;ng thể vượt qua được v&ograve;ng kiểm duyệt tại Việt Nam. Chưa kể nhiều phim n&agrave;y đều bị &ldquo;khai tử&rdquo; v&igrave; chứa nội dung bạo lực hoặc truyền b&aacute; m&ecirc; t&iacute;n dị đoan, nếu may mắn được chiếu cũng bị mất đi một số cảnh quay nhỏ được chờ đợi.</p>

<div class="GifPhoto VCSortableInPreviewMode active">
<div class="gifPaused media-wrapper">
<div class="media-status">&nbsp;</div>
</div>
</div>

<div class="GifPhoto VCSortableInPreviewMode active">
<div class="PhotoCMS_Caption">
<p>IT đ&atilde; rất kh&oacute; khăn tại ph&ograve;ng kiểm duyệt</p>
</div>
</div>

<p>Trước tin vui IT 2 c&oacute; thể sẽ qua được cấp ph&eacute;p chiếu tại Việt Nam, nhiều người vẫn lo lắng IT sẽ bị ảnh hưởng &iacute;t nhiều v&igrave; c&acirc;y k&eacute;o v&agrave;ng kh&acirc;u kiểm duyệt.</p>

<div class="VCSortableInPreviewMode active">
<div><a class="detail-img-lightbox" href="https://kenh14cdn.com/2019/7/25/3-156404435156689388056.jpg" target="_blank" title="IT là phim có yếu tố kinh dị rất ám ảnh"><img alt="IT 2 cập bến rạp Việt, fan của gã hề kinh dị chắp tay hi vọng phim không bị cắt nát - Ảnh 2." class="lightbox-content" id="img_9ead16f0-aeb8-11e9-85b9-3ba0eb419195" src="https://kenh14cdn.com/thumb_w/620/2019/7/25/3-156404435156689388056.jpg" style="max-width:100%; width:100%" title="IT 2 cập bến rạp Việt, fan của gã hề kinh dị chắp tay hi vọng phim không bị cắt nát - Ảnh 2." /></a></div>

<div class="PhotoCMS_Caption">
<p>IT l&agrave; phim c&oacute; yếu tố kinh dị rất &aacute;m ảnh</p>
</div>
</div>

<p>Vấn đề phim bị cắt kh&ocirc;ng phải một thứ g&igrave; đ&oacute; qu&aacute; mới mẻ với kh&aacute;n giả Việt, việc n&agrave;y diễn ra với mọi d&ograve;ng phim, d&ugrave; l&agrave; phim kinh dị hay phim t&igrave;nh cảm. Yếu tố nhạy cảm trong lối sống của người Phương T&acirc;y kh&aacute;c xa với Phương Đ&ocirc;ng đ&atilde; khiến cho h&agrave;ng loạt bộ phim bị cắt đều ph&ugrave; hợp với yếu tố &ldquo;thuần phong mỹ tục&rdquo;.</p>

<div class="VCSortableInPreviewMode">
<div><a class="detail-img-lightbox" href="https://kenh14cdn.com/2019/7/25/5-15640445476311169171686.jpg" target="_blank" title="Bộ phim 50 Sắc Thái là một trong những phim điển hình bị cắt"><img alt="IT 2 cập bến rạp Việt, fan của gã hề kinh dị chắp tay hi vọng phim không bị cắt nát - Ảnh 3." class="lightbox-content" id="img_109cb900-aeb9-11e9-9baf-71378e3308d1" src="https://kenh14cdn.com/thumb_w/620/2019/7/25/5-15640445476311169171686.jpg" style="max-width:100%; width:100%" title="IT 2 cập bến rạp Việt, fan của gã hề kinh dị chắp tay hi vọng phim không bị cắt nát - Ảnh 3." /></a></div>

<div class="PhotoCMS_Caption">
<p>Bộ phim 50 Sắc Th&aacute;i l&agrave; một trong những phim điển h&igrave;nh bị cắt</p>
</div>
</div>

<div class="VCSortableInPreviewMode active">
<div><a class="detail-img-lightbox" href="https://kenh14cdn.com/2019/7/25/6-1564044547636144350011.jpg" target="_blank" title="Phần 2 của John Wick cũng chịu cảnh tương tự khi bị cắt quá nhiều"><img alt="IT 2 cập bến rạp Việt, fan của gã hề kinh dị chắp tay hi vọng phim không bị cắt nát - Ảnh 4." class="lightbox-content" id="img_10c54fa0-aeb9-11e9-82f1-f3df7fe50106" src="https://kenh14cdn.com/thumb_w/620/2019/7/25/6-1564044547636144350011.jpg" style="max-width:100%; width:100%" title="IT 2 cập bến rạp Việt, fan của gã hề kinh dị chắp tay hi vọng phim không bị cắt nát - Ảnh 4." /></a></div>

<div class="PhotoCMS_Caption">
<p>Phần 2 của John Wick cũng chịu cảnh tương tự khi bị cắt qu&aacute; nhiều</p>
</div>
</div>

<p>Với phim kinh dị, c&aacute;c nh&agrave; l&agrave;m phim lu&ocirc;n sử dụng h&igrave;nh ảnh bạo lực hay yếu tố t&ocirc;n gi&aacute;o để l&agrave;m ch&igrave;a kh&oacute;a tiếp cận đến kh&aacute;n giả.</p>

<div class="VCSortableInPreviewMode">
<div><a class="detail-img-lightbox" href="https://kenh14cdn.com/2019/7/25/pet-sematary-1564044633947880864677.jpg" target="_blank" title="Pet Sematary của Stephen King bị cấm chiếu vì cảnh trẻ em giết người"><img alt="IT 2 cập bến rạp Việt, fan của gã hề kinh dị chắp tay hi vọng phim không bị cắt nát - Ảnh 5." class="lightbox-content" id="img_446f04e0-aeb9-11e9-80df-6d884e488fa2" src="https://kenh14cdn.com/thumb_w/620/2019/7/25/pet-sematary-1564044633947880864677.jpg" style="max-width:100%; width:100%" title="IT 2 cập bến rạp Việt, fan của gã hề kinh dị chắp tay hi vọng phim không bị cắt nát - Ảnh 5." /></a></div>

<div class="PhotoCMS_Caption">
<p>Pet Sematary của Stephen King bị cấm chiếu v&igrave; cảnh trẻ em giết người</p>
</div>
</div>

<div class="VCSortableInPreviewMode">
<div><a class="detail-img-lightbox" href="https://kenh14cdn.com/2019/7/25/brightburn-review-1564044640233455814080.jpg" target="_blank" title="Superman phiên bản tà ác cũng bị cấm vì lý do tương tự"><img alt="IT 2 cập bến rạp Việt, fan của gã hề kinh dị chắp tay hi vọng phim không bị cắt nát - Ảnh 6." class="lightbox-content" id="img_47e34410-aeb9-11e9-9885-fda8c00c0d05" src="https://kenh14cdn.com/thumb_w/620/2019/7/25/brightburn-review-1564044640233455814080.jpg" style="max-width:100%; width:100%" title="IT 2 cập bến rạp Việt, fan của gã hề kinh dị chắp tay hi vọng phim không bị cắt nát - Ảnh 6." /></a></div>

<div class="PhotoCMS_Caption">
<p>Superman phi&ecirc;n bản t&agrave; &aacute;c cũng bị cấm v&igrave; l&yacute; do tương tự</p>
</div>
</div>

<div class="clearfix wp100" id="admzone474524">&nbsp;</div>

<div class="VCSortableInPreviewMode">
<div><a class="detail-img-lightbox" href="https://kenh14cdn.com/2019/7/25/thien-linh-cai-hinh-phim-va-bts38-15529331103792088596530-1555327898423626133087-15640458811751773076733.jpg" target="_blank" title="Thiên linh cái bị cấm vì truyền bá mê tín dị đoan"><img alt="IT 2 cập bến rạp Việt, fan của gã hề kinh dị chắp tay hi vọng phim không bị cắt nát - Ảnh 7." class="lightbox-content" id="img_2ec751d0-aebc-11e9-bccb-2997bd37be72" src="https://kenh14cdn.com/thumb_w/620/2019/7/25/thien-linh-cai-hinh-phim-va-bts38-15529331103792088596530-1555327898423626133087-15640458811751773076733.jpg" style="max-width:100%; width:100%" title="IT 2 cập bến rạp Việt, fan của gã hề kinh dị chắp tay hi vọng phim không bị cắt nát - Ảnh 7." /></a></div>

<div class="PhotoCMS_Caption">
<p>Thi&ecirc;n linh c&aacute;i bị cấm v&igrave; truyền b&aacute; m&ecirc; t&iacute;n dị đoan</p>
</div>
</div>

<p>Kh&ocirc;ng chỉ ri&ecirc;ng c&aacute;c bộ phim nước ngo&agrave;i, c&oacute; rất nhiều bộ phim Việt cũng gặp rắc rối trong qu&aacute; tr&igrave;nh kiểm duyệt, kh&ocirc;ng đến được với kh&aacute;n giả trong nước. Điển h&igrave;nh như bộ phim <a class="link-inline-content" href="http://search.kenh14.vn/?query=Thi%C3%AAn%20Linh%20C%C3%A1i" rel="nofollow" target="_blank" title="Thiên Linh Cái"><strong><em>Thi&ecirc;n Linh C&aacute;i</em></strong></a>, điều n&agrave;y tạo n&ecirc;n sự tiếc nuối kh&ocirc;ng hề nhỏ đến từ người y&ecirc;u th&iacute;ch điện ảnh.</p>

<div class="VCSortableInPreviewMode">
<div><a class="detail-img-lightbox" href="https://kenh14cdn.com/2019/7/25/uni-15640456976291154012756.png" target="_blank" title="Khán giả phản hồi về những bộ phim bị cấm chiếu"><img alt="IT 2 cập bến rạp Việt, fan của gã hề kinh dị chắp tay hi vọng phim không bị cắt nát - Ảnh 8." class="lightbox-content" id="img_be3eb9d0-aebb-11e9-a103-9980c152c359" src="https://kenh14cdn.com/thumb_w/620/2019/7/25/uni-15640456976291154012756.png" style="max-width:100%; width:100%" title="IT 2 cập bến rạp Việt, fan của gã hề kinh dị chắp tay hi vọng phim không bị cắt nát - Ảnh 8." /></a></div>

<div class="PhotoCMS_Caption">
<p>Kh&aacute;n giả phản hồi về những bộ phim bị cấm chiếu</p>
</div>
</div>

<p>D&ugrave; sao th&igrave;, với việc IT Chapter 2 được chiếu tại Việt Nam vẫn l&agrave; một tin vui với những t&iacute;n đồ của phim kinh dị. H&atilde;y c&ugrave;ng hy vọng c&aacute;c ph&acirc;n cảnh quan trọng trong phim vẫn được an to&agrave;n tối đa để ch&uacute;ng ta c&oacute; thể tận hưởng phần phim cuối c&ugrave;ng về g&atilde; hề Pennywise một c&aacute;ch trọn vẹn nhất.</p>

<div class="VCSortableInPreviewMode">
<div class="Kenh14Player Kenh14Player-full-width Kenh14Player-pc default-skin player-user-inactive streamid_514dc1c0a97c11e9bd8b73361bd54b32_fldwv880o-dimensions videoNewsPlayer" id="streamid_514dc1c0a97c11e9bd8b73361bd54b32_fldwv880o" lang="vi">&nbsp;</div>
</div>

<div class="VCSortableInPreviewMode">
<div class="VideoCMS_Caption">
<p>Trailer IT CHAPTER TWO (Ch&uacute; Hề Ma Qu&aacute;i 2)</p>
</div>
</div>

<p>IT Chapter 2 dự kiến c&ocirc;ng chiếu v&agrave;o ng&agrave;y 5/9/2019.</p>

<p>&nbsp;</p>
', 2019, NULL, NULL, NULL, NULL, NULL, NULL, 1002, CAST(N'2019-11-19 15:15:57.067' AS DateTime), NULL, NULL, NULL, NULL, N'Bom tấn kinh dị của nhà văn Stephen King đang là tác phẩm được mong chờ nhất dịp cuối năm...                                    ', 1, NULL, NULL, N'/Data/images/News/3-156404435156689388056.jpg', N'Mỗi khi một bộ phim kinh dị tung trailer, câu hỏi đầu tiên của khán giả Việt sẽ là ...')
INSERT [dbo].[News] ([NewsID], [Name], [Image], [Description], [Year], [Country], [MovieLink], [TrailerLink], [CategoryID], [Rate], [TrailerID], [Viewed], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [Tags], [ImageNews], [MoreDescription]) VALUES (3, N'Breaking bad để lại những gì cho người xem ?', N'/Data/files/New%20Movie/poster_medium_10.jpg', N'<p>Mọi thứ trong bộ phim <em>Breaking bad</em> đều ho&agrave;n hảo một c&aacute;ch đ&aacute;ng kinh ngạc.&nbsp;</p>

<p>Kịch bản th&ocirc;ng minh v&agrave; sắc sảo khi tập sau hay hơn tập trước, m&ugrave;a sau hay hơn m&ugrave;a trước, điều m&agrave; rất &iacute;t phim truyền h&igrave;nh c&oacute; thể l&agrave;m được.&nbsp;</p>

<p>D&agrave;n diễn vi&ecirc;n kh&ocirc;ng nổi tiếng nhưng để lại những ấn tượng tuyệt vời cho vai diễn của m&igrave;nh.</p>

<div class="VCSortableInPreviewMode active">
<div><a class="detail-img-lightbox" href="https://cdn.tuoitre.vn/2018/7/4/photo-1-1530667948681561387382.jpg" target="_blank" title="Hai thầy trò quyết định hợp tác với nhau để thay đổi số phận"><img alt="10 năm ra đời Breaking Bad - phim truyền hình hoàn hảo đến kinh ngạc - Ảnh 2." class="lightbox-content" id="img_18ebca20-7f2a-11e8-ab79-45092b357536" src="https://cdn.tuoitre.vn/thumb_w/586/2018/7/4/photo-1-1530667948681561387382.jpg" style="max-width:100%" title="10 năm ra đời Breaking Bad - phim truyền hình hoàn hảo đến kinh ngạc - Ảnh 2." /></a></div>

<div class="PhotoCMS_Caption caption ck_legend">
<p>Hai thầy tr&ograve; quyết định hợp t&aacute;c với nhau để thay đổi số phận</p>
</div>
</div>

<p>Quay phim của <em>Breaking Bad</em> lu&ocirc;n được đ&aacute;nh gi&aacute; l&agrave; đậm chất điện ảnh với những khung h&igrave;nh mang t&iacute;nh tự sự cao c&ugrave;ng khả năng tự kể chuyện để khiến kh&aacute;n giả l&uacute;c n&agrave;o cũng bị hấp dẫn về mặt thị gi&aacute;c.&nbsp;</p>

<p>Ch&iacute;nh v&igrave; lẽ đ&oacute;, bộ phim đ&atilde; được rất nhiều kh&aacute;n giả, người h&acirc;m mộ, nh&agrave; ph&ecirc; b&igrave;nh đặt v&agrave;o vị tr&iacute; rất trang trọng &quot;bộ phim truyền h&igrave;nh xuất sắc nhất mọi thời đại&quot; v&agrave; &quot;l&agrave; chất g&acirc;y nghiện kh&ocirc;ng thể cai&quot;.&nbsp;</p>

<p>Năm 2013, kỉ lục Guinness thế giới đ&atilde; ghi nhận <em>Breaking Bad</em> l&agrave; bộ phim được đ&aacute;nh gi&aacute; cao nhất mọi thời đại.</p>

<p><em>Breaking Bad</em> giống như bộ phim truyền h&igrave;nh Twin peaks của David Lynch, đ&atilde; xo&aacute; nho&agrave; ranh giới giữa điện ảnh v&agrave; truyền h&igrave;nh.</p>

<div class="VCSortableInPreviewMode">
<div><a class="detail-img-lightbox" href="https://cdn.tuoitre.vn/2018/7/4/photo-1-15306679504391250599445.jpg" target="_blank" title="Breaking Bad đã làm rất nhiều người yêu hoá học hơn"><img alt="10 năm ra đời Breaking Bad - phim truyền hình hoàn hảo đến kinh ngạc - Ảnh 3." class="lightbox-content" id="img_19b20050-7f2a-11e8-ab79-45092b357536" src="https://cdn.tuoitre.vn/thumb_w/586/2018/7/4/photo-1-15306679504391250599445.jpg" style="max-width:100%" title="10 năm ra đời Breaking Bad - phim truyền hình hoàn hảo đến kinh ngạc - Ảnh 3." /></a></div>

<div class="PhotoCMS_Caption caption ck_legend">
<p>Breaking Bad đ&atilde; l&agrave;m rất nhiều người y&ecirc;u ho&aacute; học hơn</p>
</div>
</div>

<p>&Yacute; tưởng về bộ phim đến với Vince Gilligan sau khi &ocirc;ng tham gia viết kịch bản cho phim truyền h&igrave;nh X-files của đ&agrave;i Fox, Gilligan muốn tạo ra một c&acirc;u chuyện trong đ&oacute; nh&acirc;n vật ch&iacute;nh chuyển đổi từ ch&iacute;nh diện sang phản diện.&nbsp;</p>

<p>H&igrave;nh ảnh Walter White ra đời. Một kẻ m&agrave; kh&aacute;n giả sẽ cảm thấy thương hại, th&ocirc;ng cảm v&agrave; qu&yacute; mến l&uacute;c đầu, nhưng qua mỗi m&ugrave;a phim, Walter White chuyển động về hướng ngược lại với &aacute;nh s&aacute;ng, &ocirc;ng ta trở th&agrave;nh một nh&acirc;n vật m&agrave; kh&aacute;n giả đ&atilde; kh&ocirc;ng c&ograve;n c&oacute; thể &quot;tha thứ&quot; được nữa.</p>

<p>Đ&oacute; ch&iacute;nh l&agrave; một trong những l&yacute; do <em>Breaking Bad</em> l&agrave; một phim truyền h&igrave;nh mang t&iacute;nh biểu tượng với những nh&acirc;n vật đi ra từ điện ảnh chứ kh&ocirc;ng phải truyền h&igrave;nh.&nbsp;</p>

<p>V&igrave; phim truyền h&igrave;nh c&oacute; một m&ocirc; t&iacute;p quen thuộc, nh&acirc;n vật ch&iacute;nh thường kh&ocirc;ng thay đổi. Việc cố định h&igrave;nh ảnh nh&acirc;n vật ch&iacute;nh gi&uacute;p những người ph&aacute;t triển phim truyền h&igrave;nh c&oacute; thể k&eacute;o bộ phim d&agrave;i bao l&acirc;u tuỳ th&iacute;ch.&nbsp;</p>

<p>D&ugrave; l&agrave; những nh&acirc;n vật trong c&aacute;c bộ phim truyền h&igrave;nh nổi tiếng như <em>The wire</em> hay <em>The Soprano</em>s th&igrave; nh&acirc;n vật kh&ocirc;ng c&oacute; điểm đầu v&agrave; điểm cuối.&nbsp;</p>

<p>Ngược lại với <em>Breaking Bad</em>, ngay từ đầu ta đ&atilde; biết xuất ph&aacute;t điểm của nh&acirc;n vật ch&iacute;nh.</p>

<div class="VCSortableInPreviewMode">
<div><a class="detail-img-lightbox" href="https://cdn.tuoitre.vn/2018/7/4/photo-2-15306679504421591670459.jpg" target="_blank" title="Dàn diễn viên đã có những màn hoá thân xuất sắc"><img alt="10 năm ra đời Breaking Bad - phim truyền hình hoàn hảo đến kinh ngạc - Ảnh 4." class="lightbox-content" id="img_1c25bf70-7f2a-11e8-b7ec-971af0e12c9c" src="https://cdn.tuoitre.vn/thumb_w/586/2018/7/4/photo-2-15306679504421591670459.jpg" style="max-width:100%" title="10 năm ra đời Breaking Bad - phim truyền hình hoàn hảo đến kinh ngạc - Ảnh 4." /></a></div>

<div class="PhotoCMS_Caption caption ck_legend">
<p>D&agrave;n diễn vi&ecirc;n đ&atilde; c&oacute; những m&agrave;n ho&aacute; th&acirc;n xuất sắc</p>
</div>
</div>

<p>Walter White (Bryan Cranston) l&agrave; một gi&aacute;o vi&ecirc;n ho&aacute; học bất đắc ch&iacute;, d&ugrave; rất giỏi, nhưng v&igrave; kh&ocirc;ng hợp thời, v&igrave; những quyết định sai lầm n&ecirc;n &ocirc;ng kh&ocirc;ng thể n&agrave;o vượt tho&aacute;t để th&agrave;nh c&ocirc;ng trong sự nghiệp.&nbsp;</p>

<p>Trong khi đ&oacute;, con trai lớn của &ocirc;ng bị bệnh n&atilde;o n&ecirc;n kh&ocirc;ng thể di chuyển v&agrave; n&oacute;i chuyện b&igrave;nh thường, vợ &ocirc;ng đang mang thai đứa con thứ 2. Đ&ograve;n đ&aacute;nh cuối c&ugrave;ng m&agrave; cuộc đời d&agrave;nh cho &ocirc;ng l&agrave; th&ocirc;ng b&aacute;o &ocirc;ng bị ung thư.&nbsp;</p>

<p>&Ocirc;ng chỉ c&ograve;n 2 năm để sống. L&agrave;m sao c&oacute; thể rời khỏi cuộc đời bỏ lại vợ v&agrave; hai đứa con với khoản tiền &iacute;t ỏi m&agrave; gia đ&igrave;nh c&oacute;.</p>

<p>Walter White đ&atilde; c&oacute; một quyết định t&aacute;o bạo thay đổi kh&ocirc;ng chỉ cuộc đời &ocirc;ng, m&agrave; c&ograve;n thay đổi ho&agrave;n to&agrave;n bản t&iacute;nh con người trong &ocirc;ng.&nbsp;</p>

<p>Walter White t&igrave;m đến cậu học tr&ograve; b&ecirc; bối Jesse (Aaron Paul) để l&ecirc;n kế hoạch sản xuất Meth - một loại ma tu&yacute; đ&aacute; tổng hợp h&ograve;ng kiếm đủ tiền cho vợ con trước khi &ocirc;ng chết.</p>

<div class="VCSortableInPreviewMode">
<div><a class="detail-img-lightbox" href="https://cdn.tuoitre.vn/2018/7/4/photo-3-15306679504451526024213.jpg" target="_blank" title="Từ một thầy giáo tầm thường trở thành tên tội phạm khét tiếng"><img alt="10 năm ra đời Breaking Bad - phim truyền hình hoàn hảo đến kinh ngạc - Ảnh 5." class="lightbox-content" id="img_1a7f8980-7f2a-11e8-ab79-45092b357536" src="https://cdn.tuoitre.vn/thumb_w/586/2018/7/4/photo-3-15306679504451526024213.jpg" style="max-width:100%" title="10 năm ra đời Breaking Bad - phim truyền hình hoàn hảo đến kinh ngạc - Ảnh 5." /></a></div>

<div class="PhotoCMS_Caption caption ck_legend">
<p>Từ một thầy gi&aacute;o tầm thường trở th&agrave;nh t&ecirc;n tội phạm kh&eacute;t tiếng</p>
</div>
</div>

<p>Năm m&ugrave;a phim <em>Breaking Bad</em> k&eacute;o d&agrave;i từ năm 2008 đến 2013 l&agrave; một h&agrave;nh tr&igrave;nh tuyệt vời khi kh&aacute;n giả c&oacute; thể chứng kiến c&aacute;ch m&agrave; Walter White biến đổi một c&aacute;ch chậm r&atilde;i, từ một nh&agrave; ho&aacute; học tầm thường, th&agrave;nh một t&ecirc;n tội phạm kh&eacute;t tiếng, một kẻ m&agrave; ngay cả những t&ecirc;n tr&ugrave;m ma tu&yacute; cũng phải ki&ecirc;ng d&egrave;.&nbsp;</p>

<p>L&agrave;m sao c&oacute; thể x&acirc;y dựng đế chế như vậy? Vince Gilligan đ&atilde; tận dụng lợi thế của truyền h&igrave;nh về thời lượng để ph&aacute;t triển nh&acirc;n vật một c&aacute;ch hợp l&yacute; v&agrave; hấp dẫn.</p>

<p>Nh&igrave;n v&agrave;o h&agrave;nh tr&igrave;nh của nh&acirc;n vật, cả Walter v&agrave; Jesse, ta c&oacute; thể cảm nhận được điểm cuối của bộ phim.&nbsp;</p>

<p>Đ&oacute; l&agrave; điều kh&aacute;c biệt so với những bộ phim truyền h&igrave;nh kh&aacute;c. Walter White đ&atilde; trở th&agrave;nh kẻ phản diện, Jesse th&igrave; m&atilde;i mắc kẹt trong sự khủng hoảng của trưởng th&agrave;nh.&nbsp;</p>

<p>Nh&acirc;n vật của Breaking Bad kh&ocirc;ng dừng lại, 62 tập phim l&agrave; qu&atilde;ng thời gian Walter White chuyển biến v&agrave; bước dần v&agrave;o con đường tội lỗi.</p>

<div class="VCSortableInPreviewMode">
<div><a class="detail-img-lightbox" href="https://cdn.tuoitre.vn/2018/7/4/photo-4-15306679504471657585882.jpg" target="_blank" title="Breaking Bad đạt kỉ lục về lượng người xem ở mùa cuối cùng"><img alt="10 năm ra đời Breaking Bad - phim truyền hình hoàn hảo đến kinh ngạc - Ảnh 6." class="lightbox-content" id="img_1a835a10-7f2a-11e8-ab79-45092b357536" src="https://cdn.tuoitre.vn/thumb_w/586/2018/7/4/photo-4-15306679504471657585882.jpg" style="max-width:100%" title="10 năm ra đời Breaking Bad - phim truyền hình hoàn hảo đến kinh ngạc - Ảnh 6." /></a></div>

<div class="PhotoCMS_Caption caption ck_legend">
<p>Breaking Bad đạt kỉ lục về lượng người xem ở m&ugrave;a cuối c&ugrave;ng</p>
</div>
</div>

<p><em>Breaking Bad</em> cho thấy mặt tối của sự mong đợi. Walter White khởi đầu bằng một động cơ tốt l&agrave; kiếm đủ tiền cho hai đứa con trai đi học đại học v&agrave; vợ c&oacute; cuộc sống tốt hơn nhưng rồi n&oacute; dần nằm ngo&agrave;i tầm kiểm so&aacute;t của Walter White.&nbsp;</p>

<p>Walter White nh&uacute;ng ch&agrave;m v&agrave; kh&ocirc;ng thể rửa sạch. Mọi con đường &ocirc;ng đi đều dẫn &ocirc;ng trở th&agrave;nh Henseiberg - kẻ m&agrave; ngay cả tội phạm cũng phải khiếp sợ.</p>

<p>Bi kịch trong <em>Breaking Bad </em>l&agrave; bi kịch của x&atilde; hội hiện đại, của tr&aacute;ch nhiệm gia đ&igrave;nh, của những lằn ranh đạo đức m&agrave; khi ta vượt qua, ta sẽ bị biến đổi th&agrave;nh một con người kh&aacute;c với một cuộc đời kh&aacute;c.&nbsp;</p>

<p>Rất &iacute;t khoảnh khắc l&agrave;m ta thấy thoải m&aacute;i trong <em>Breaking Bad</em> thay v&agrave;o đ&oacute;, lu&ocirc;n lu&ocirc;n l&agrave; sự bất an, l&agrave; sự đuổi bắt của c&aacute;i tốt v&agrave; c&aacute;i xấu, của những vụn vỡ dần trong gia đ&igrave;nh, trong c&aacute;c mối quan hệ.&nbsp;</p>

<p>Sự sắc sảo của bi&ecirc;n kịch đ&atilde; khiến <em>Breaking Bad</em> mang một vẻ đẹp bi tr&aacute;ng của cuộc đời, một bi kịch kiểu Hy Lạp. Tiền bạc đ&ocirc;i khi l&agrave; tất cả những g&igrave; ta cần, nhưng đ&ocirc;i khi tiền bạc l&agrave; thứ giết chết những điều đơn giản v&agrave; tốt đẹp nhất.</p>

<div class="VCSortableInPreviewMode">
<div><a class="detail-img-lightbox" href="https://cdn.tuoitre.vn/2018/7/4/photo-5-15306679504491904598931.jpg" target="_blank" title="Đến tội phạm cũng phải sợ ông giáo dạy hoá"><img alt="10 năm ra đời Breaking Bad - phim truyền hình hoàn hảo đến kinh ngạc - Ảnh 7." class="lightbox-content" id="img_1bed7160-7f2a-11e8-b7ec-971af0e12c9c" src="https://cdn.tuoitre.vn/thumb_w/586/2018/7/4/photo-5-15306679504491904598931.jpg" style="max-width:100%" title="10 năm ra đời Breaking Bad - phim truyền hình hoàn hảo đến kinh ngạc - Ảnh 7." /></a></div>

<div class="PhotoCMS_Caption caption ck_legend">
<p>Đến tội phạm cũng phải sợ &ocirc;ng gi&aacute;o dạy ho&aacute;</p>
</div>
</div>

<p>Nếu &ocirc;ng gi&aacute;o Walter White đ&atilde; tạo ra được &quot;kẹo xanh&quot; g&acirc;y nghiện một c&aacute;ch ho&agrave;n hảo khiến mọi t&ecirc;n tội phạm đều th&egrave;m muốn th&igrave; Vince Gilligan đ&atilde; x&acirc;y dựng được một c&acirc;u chuyện g&acirc;y nghiện kh&ocirc;ng k&eacute;m cho bất k&igrave; kh&aacute;n giả n&agrave;o &quot;lỡ&quot; thưởng thức n&oacute;.&nbsp;</p>

<p><em>Breaking Bad</em> kh&ocirc;ng đơn thuần l&agrave; một c&aacute;i t&ecirc;n, n&oacute; c&ograve;n l&agrave; một trong những biểu tượng xuất sắc của truyền h&igrave;nh Mỹ, v&agrave; một kỉ niệm kh&ocirc;ng thể n&agrave;o qu&ecirc;n d&agrave;nh bất k&igrave; ai đ&atilde; xem bộ phim.</p>

<div class="VCSortableInPreviewMode active">
<div><a class="detail-img-lightbox" href="https://cdn.tuoitre.vn/2018/7/4/photo-6-15306679504512041482039.jpg" target="_blank" title="Dàn diễn viên gặp lại nhau sau 10 năm - EW"><img alt="10 năm ra đời Breaking Bad - phim truyền hình hoàn hảo đến kinh ngạc - Ảnh 8." class="lightbox-content" id="img_1ac6cbb0-7f2a-11e8-ab79-45092b357536" src="https://cdn.tuoitre.vn/thumb_w/586/2018/7/4/photo-6-15306679504512041482039.jpg" style="max-width:100%" title="10 năm ra đời Breaking Bad - phim truyền hình hoàn hảo đến kinh ngạc - Ảnh 8." /></a></div>

<div class="PhotoCMS_Caption caption ck_legend">
<p>D&agrave;n diễn vi&ecirc;n gặp lại nhau sau 10 năm - EW</p>
</div>
</div>

<div class="VCSortableInPreviewMode active" id="ObjectBoxContent_1530668121928" style="background-color:#f5f7f9">
<div>
<p><em>Breaking Bad </em>d&agrave;nh được rất nhiều giải thưởng trong đ&oacute; c&oacute; 16 giải Emmy v&agrave; 2 giải Quả Cầu V&agrave;ng.</p>

<p>Sự th&agrave;nh c&ocirc;ng của bộ phim đ&atilde; tạo động lực cho Vince Gilligan thực hiện phần ngoại truyện Better call Saul, kể về c&acirc;u chuyện của luật sư chuy&ecirc;n biện hộ cho tội phạm Saul Goodman trước khi anh ta trở th&agrave;nh luật sư cho Walter White. Hiện Better call Saul sắp chiếu m&ugrave;a phim thứ 4, bộ phim cũng được kh&aacute;n giả v&agrave; giới ph&ecirc; b&igrave;nh đ&aacute;nh gi&aacute; rất cao.</p>

<p>Nam diễn vi&ecirc;n gạo cội Anthony Hopkins sau khi xem liền một mạch to&agrave;n bộ c&aacute;c tập phim trong 2 tuần đ&atilde; viết thư cho nam diễn vi&ecirc;n ch&iacute;nh Bryan Cranston b&agrave;y tỏ l&ograve;ng ngưỡng mộ v&agrave; khen ngợi khả năng diễn xuất t&agrave;i t&igrave;nh của Bryan v&agrave; d&agrave;n diễn vi&ecirc;n.</p>
</div>
</div>

<p>&nbsp;</p>
', 2019, NULL, NULL, NULL, NULL, NULL, NULL, 1308, CAST(N'2019-11-19 15:22:07.960' AS DateTime), NULL, NULL, NULL, NULL, N'Phiên bản trong Far Cry 5 gần như không thể phân biệt được với ngoại thất của ngôi nhà ngoài đời thực trong series huyền..      ', 1, NULL, NULL, N'/Data/images/News/01-1546940073662916771190.png', N'Mọi thứ trong bộ phim Breaking bad đều hoàn hảo một cách đáng kinh ngạc...')
INSERT [dbo].[News] ([NewsID], [Name], [Image], [Description], [Year], [Country], [MovieLink], [TrailerLink], [CategoryID], [Rate], [TrailerID], [Viewed], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [Tags], [ImageNews], [MoreDescription]) VALUES (4, N'Điều chưa kể về đạo diễn bom tấn ''Fast & Furious 9''', N'/Data/files/New%20Movie/poster_medium_21.jpg', N'<p><strong>C&oacute; g&igrave; đặc biệt ở David Leitch, vị đạo diễn của t&aacute;c phẩm điện ảnh &ldquo;ăn theo&rdquo; loạt phim h&agrave;nh động <em>Fast &amp; Furious</em> n&agrave;y?</strong></p>

<div>Tập phim n&agrave;y xoay quanh c&acirc;u chuyện giữa hai người tưởng như kh&ocirc;ng đội trời chung: đặc vụ An ninh Ngoại giao Mỹ Luke Hobbs (Dwayne Johnson) v&agrave; t&ecirc;n tội phạm đ&aacute;nh thu&ecirc; kh&eacute;t tiếng Deckard Shaw. Họ bất đắc dĩ phải bắt tay hợp t&aacute;c nhằm ngăn chặn &acirc;m mưu của Brixton, một &ocirc;ng tr&ugrave;m tội &aacute;c v&ocirc; c&ugrave;ng b&iacute; ẩn v&agrave; nguy hiểm.</div>

<div>
<div><strong>Ph&iacute;a sau những cảnh quay</strong></div>

<div>Đạo diễn Leitch cho biết, trong phim n&agrave;y, Deckard Shaw c&oacute; cảnh đ&aacute;nh nhau thực sự hấp dẫn trong căn hộ của em g&aacute;i với việc hạ gục một loạt đối thủ bằng những c&uacute; đấm v&agrave; c&uacute; đ&aacute; trời gi&aacute;ng, đồng thời sử dụng mọi thứ từ dao tới s&uacute;ng, v&ograve;i tắm v&agrave; l&ograve; nướng b&aacute;nh. Để c&oacute; được cảnh n&agrave;y, &ecirc;-k&iacute;p l&agrave;m phim đ&atilde; phải mất 3 - 4 tuần bi&ecirc;n đạo v&otilde; thuật cộng với thời gian luyện tập.</div>

<div>&ldquo;Cứ mỗi ba bước di chuyển lại c&oacute; một g&oacute;c quay đặc biệt v&agrave; sau đ&oacute; ch&uacute;ng t&ocirc;i cắt. C&aacute;ch quay n&agrave;y tạo n&ecirc;n hiệu ứng đặc biệt nhưng rất mất thời gian&rdquo; - Leitch cho biết.</div>

<div>
<table align="center" border="0" cellpadding="3" cellspacing="0" class="tplCaption" style="max-width:798px !important">
	<tbody>
		<tr>
			<td><img alt="" class="img_table" src="https://media.moitruongvadothi.vn/2019/08/01/9770/1564652454-david-leitchfotor.jpg" style="width:100%" /></td>
		</tr>
		<tr>
			<td>
			<p><span style="color:#0000ff"><em><span style="color:#0000ff">Đạo diễn David Leitch (phải) v&agrave; nh&agrave; sản xuất phim điều h&agrave;nh &ldquo;Qu&aacute; nhanh, qu&aacute; nguy hiểm 9&rdquo; Kelly McCormick</span>.</em></span></p>
			</td>
		</tr>
	</tbody>
</table>

<p>Leitch hiện 49 tuổi v&agrave; c&oacute; sự nghiệp trải d&agrave;i đ&atilde; hơn 20 năm. Với t&igrave;nh y&ecirc;u d&agrave;nh cho điện ảnh ch&acirc;u &Aacute;, năm 1997, anh v&agrave; bạn m&igrave;nh l&agrave; Chad Stahelski, đạo diễn loạt phim<em> John Wick</em>, đ&atilde; s&aacute;ng lập n&ecirc;n 87Eleven, c&ocirc;ng ty sản xuất phim.</p>

<div>&ldquo;T&ocirc;i v&agrave; Chad t&ocirc;n thờ Th&agrave;nh Long v&agrave; L&yacute; Li&ecirc;n Kiệt&rdquo; &ndash; Leitch nhớ lại. &ldquo;Ch&uacute;ng t&ocirc;i đ&atilde; nghi&ecirc;n cứu c&aacute;c bậc thầy như Vi&ecirc;n H&ograve;a B&igrave;nh v&agrave; Nguy&ecirc;n Khu&ecirc; v&agrave; cố gắng noi gương họ&rdquo;.</div>

<div>Theo lời kể, từ những cảnh quay n&agrave;y, Leitch v&agrave; Stahelski đ&atilde; thử tạo n&ecirc;n những cảnh chiến đấu của ri&ecirc;ng họ, ghi h&igrave;nh tr&ecirc;n VHS v&agrave; chỉnh sửa để t&igrave;m ra g&oacute;c m&aacute;y ảnh n&agrave;o hoạt động tốt nhất. Leitch đ&atilde; vận dụng kinh nghiệm đ&oacute; khi trở th&agrave;nh một người đ&oacute;ng thế, v&agrave; sau đ&oacute; l&agrave; ph&oacute; đạo diễn.</div>

<table align="center" border="0" cellpadding="3" cellspacing="0" class="tplCaption" style="max-width:799px !important">
	<tbody>
		<tr>
			<td style="height:495px"><img alt="" class="img_table" src="https://media.moitruongvadothi.vn/2019/08/01/9770/1564652454-fast-furiousfotor.jpg" style="width:100%" /></td>
		</tr>
		<tr>
			<td style="height:42px">
			<p><span style="color:#0000ff"><em><span style="color:#0000ff">Một cảnh trong &ldquo;Qu&aacute; nhanh, qu&aacute; nguy hiểm 9&quot;</span>.</em></span></p>
			</td>
		</tr>
	</tbody>
</table>

<p>Đặc biệt, thời gian cộng t&aacute;c l&agrave;m loạt phim <em>Ma trận (Matrix)</em> với Vi&ecirc;n H&ograve;a B&igrave;nh đ&atilde; g&oacute;p phần tạo n&ecirc;n bước ngoặt trong sự nghiệp của anh. Bộ phim n&agrave;y được cho l&agrave; thực sự đưa những cảnh chiến đấu mang phong c&aacute;ch phim h&agrave;nh động Hong Kong (Trung Quốc) tới điện ảnh phương T&acirc;y.</p>

<div>Thực tế, Leitch đ&atilde; nghi&ecirc;n cứu v&otilde; thuật từ năm 18 tuổi. Anh đ&atilde; học nhiều phong c&aacute;ch kh&aacute;c nhau, từ MMA tới những bộ phim m&agrave; anh xem đ&oacute; l&agrave; &ldquo;trường học&rdquo; của m&igrave;nh. Leitch c&ograve;n từng hợp t&aacute;c l&agrave;m 3 phim với nh&agrave; l&agrave;m phim Hong Kong L&acirc;m Lĩnh Đ&ocirc;ng v&agrave; coi &ocirc;ng l&agrave; một người thầy th&ocirc;ng th&aacute;i.</div>

<div>&ldquo;L&acirc;m Lĩnh Đ&ocirc;ng c&oacute; giả thuyết như thế n&agrave;y: &ldquo;Nếu h&agrave;nh động tốt, bạn c&oacute; thể đặt m&aacute;y quay ở bất cứ đ&acirc;u. Bạn kh&ocirc;ng phải lo lắng về việc buộc phải đặt g&oacute;c hoặc buộc phải phối cảnh. Chỉ cần chắc chắn c&aacute;c pha h&agrave;nh động đủ tốt&rdquo; &ndash; anh kể.</div>

<div>&ldquo;C&aacute;ch tiếp cận n&agrave;y đi ngược với nhiều sản phẩm Hollywood. Ở đấy, những cảnh chiếu đấu thường chỉ quay trong 1 - 2 ng&agrave;y với nhiều camera phủ nhiều g&oacute;c m&agrave; sau đ&oacute; c&aacute;c bi&ecirc;n tập sẽ gh&eacute;p lại với nhau.&rdquo; &ndash; anh giải th&iacute;ch th&ecirc;m.</div>

<table align="center" border="0" cellpadding="3" cellspacing="0" class="tplCaption" style="max-width:798px !important">
	<tbody>
		<tr>
			<td><img alt="" class="img_table" src="https://media.moitruongvadothi.vn/2019/08/01/9770/1564652454-fast-furious1fotor.jpg" style="width:100%" /></td>
		</tr>
		<tr>
		</tr>
	</tbody>
</table>

<p><strong>&ldquo;T&ocirc;i lu&ocirc;n chấp nhận rủi ro&rdquo;</strong></p>

<p>Thực tế, c&aacute;ch quay phim của Leitch đ&atilde; ph&aacute;t huy t&aacute;c dụng một c&aacute;ch kỳ diệu trong phim Atomic Blonde (Điệp vi&ecirc;n b&aacute;o th&ugrave; &ndash; 2017), khi nữ diễn vi&ecirc;n Charlize Theron chiến đấu th&ocirc;ng qua một cảnh trải rộng tr&ecirc;n nhiều căn hộ, h&agrave;nh lang v&agrave; cầu thang, tất cả chỉ trong một c&uacute; bấm m&aacute;y.</p>

<p>Hiện tại, việc l&agrave;m phim Qu&aacute; nhanh, qu&aacute; nguy hiểm 9 dường như l&agrave; một bước chuyển lớn kh&aacute;c đối với Leitch, nhưng đạo diễn cho biết anh đ&atilde; phải đối diện với thử th&aacute;ch tương tự khi l&agrave;m phim Deadpool 2. &ldquo;T&ocirc;i lu&ocirc;n chấp nhận rủi ro&rdquo; &ndash; Leitch n&oacute;i.</p>

<p>Trong Fast &amp; Furious 9, ngo&agrave;i phần h&agrave;nh động, Leitch xem sự tương t&aacute;c giữa Dwayne Johnson (trong vai đặc vụ li&ecirc;n bang Luke Hobbs) v&agrave; Deckard Shaw như một c&aacute;ch l&agrave;m sống lại những tr&ograve; đ&ugrave;a bỡn v&agrave; ứng biến - vốn l&agrave; dấu ấn của những bộ phim &ldquo;buddy-cop&rdquo; (bộ đ&ocirc;i cảnh s&aacute;t) như Lethal Weapon (Vũ kh&iacute; tối thượng).</p>

<div>&ldquo;Một trong những điều m&agrave; t&ocirc;i thực sự y&ecirc;u th&iacute;ch về c&aacute;c nh&acirc;n vật Hobbs v&agrave; Shaw in trong 3 tập phim <em>Qu&aacute; nhanh, Qu&aacute; nguy hiểm</em> trước đ&oacute; l&agrave; c&aacute;ch họ tạo kh&oacute; khăn cho nhau, đối lập với nhau một c&aacute;ch cực đoan như thế n&agrave;o v&agrave; cũng t&igrave;m ra c&aacute;ch để l&agrave;m việc c&ugrave;ng nhau khi cần thiết. Họ giống như những nh&acirc;n vật ch&iacute;nh trong c&aacute;c bộ phim &ldquo;buddy cop&rdquo; kinh điển của thập kỷ 1980&rdquo; &ndash; anh n&oacute;i</div>

<div>4 ng&ocirc;i sao của <em>Qu&aacute; nhanh, qu&aacute; nguy hiểm 9</em>, gồm Johnson, Statham, Idris Elba (trong vai Brixton Lore) v&agrave; Vanessa Kirby (Hattie Shaw, một người l&iacute;nh bị buộc tội phản quốc). Mỗi diễn vi&ecirc;n nền tảng v&agrave; khả năng kh&aacute;c nhau n&ecirc;n Leitch phải t&igrave;m c&aacute;ch để tạo được sự c&acirc;n bằng chung.</div>

<div>&ldquo;Dwayne đ&atilde; tham gia đ&oacute;ng nhiều phim h&agrave;nh động n&ecirc;n anh kh&ocirc;ng cần phải luyện tập nhiều. Trong khi đ&oacute; Idris rất h&aacute;o hứng đ&oacute;ng cảnh h&agrave;nh động. Jason l&agrave;m việc si&ecirc;ng năng kinh khủng. Anh th&agrave;nh thạo trong c&aacute;c pha chiến đấu v&agrave; dồn nhiều t&acirc;m huyết cho nh&acirc;n vật của m&igrave;nh&rdquo; &ndash; Leitch kể.</div>

<div>&ldquo;Đ&ocirc;i khi kh&aacute;n giả sẽ c&oacute; cảm gi&aacute;c như xem phim h&agrave;nh động Hong Kong&rdquo; &ndash; Leitch thẳng thắn n&oacute;i th&ecirc;m về Fast &amp; Furious 9.</div>

<div>
<table style="background-color:#f2ffff">
	<tbody>
		<tr>
			<td>
			<div><strong>Thương hiệu Fast &amp; Furious</strong></div>

			<div>C&acirc;u chuyện của thương hiệu bom tấn <em>Fast &amp; Furious</em> bắt đầu từ năm 2001, khi bộ phim <em>The Fast and the Furious </em>được thực hiện dựa tr&ecirc;n cảm hứng từ b&agrave;i b&aacute;o <em>Racer X</em> xoay quanh những cuộc đua xe hơi tr&ecirc;n đường phố v&agrave;o ban đ&ecirc;m. 8 tập phim trước đ&oacute; trong loạt phim n&agrave;y đ&atilde; thu về được gần 5 tỉ USD từ ph&ograve;ng v&eacute; khắp to&agrave;n cầu.</div>
			</td>
		</tr>
	</tbody>
</table>
</div>
</div>
</div>
', 2019, NULL, NULL, NULL, NULL, NULL, NULL, 1005, CAST(N'2019-11-19 15:12:20.707' AS DateTime), NULL, NULL, NULL, NULL, N'Có gì đặc biệt ở David Leitch, vị đạo diễn của tác phẩm điện ảnh “ăn theo” loạt phim hành động Fast & Furious này?,,            ', 1, NULL, NULL, N'/Data/images/News/1564652454-david-leitchfotor.jpg', N'Có gì đặc biệt ở David Leitch, vị đạo diễn của tác phẩm điện ảnh “ăn theo” loạt phim hành động Fast & Furious...')
INSERT [dbo].[News] ([NewsID], [Name], [Image], [Description], [Year], [Country], [MovieLink], [TrailerLink], [CategoryID], [Rate], [TrailerID], [Viewed], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [Tags], [ImageNews], [MoreDescription]) VALUES (8, N'Long Ấn Cơ Mật phim hành động thần thoại đánh dấu sự trở lại của Thành Long và Arnold Schwazenegger', N'/Data/files/New%20Movie/poster_medium_28.jpg', N'<h5>&nbsp;</h5>

<p><em>Tiếp nối th&agrave;nh c&ocirc;ng của t&aacute;c phẩm h&agrave;nh động thần thoại &ldquo;Viy&rdquo; ra mắt năm 2014, đạo diễn Oleg Stepchenko đ&atilde; bắt tay sản xuất phần phim tiếp theo mang t&ecirc;n &ldquo;Long Ấn Cơ Mật&rdquo; dự kiến khởi chiếu từ 20.09.2019, hứa hẹn tiếp tục mở ra những chuyến phi&ecirc;u lưu mới đến v&ugrave;ng đất Trung Hoa đầy b&iacute; ẩn.</em></p>

<p><a href="https://cdn.pose.com.vn/assets/2019/09/12/1568250921_thanh1.jpg" target="_blank"><img alt="Long Ấn Cơ Mật phim hành động thần thoại đánh dấu sự trở lại của Thành Long và Arnold Schwazenegger" src="https://cdn.pose.com.vn/assets/2019/09/12/1568250921_thanh1.jpg" style="height:433px; width:650px" /></a></p>

<p style="text-align:justify">Long Ấn Cơ Mật&nbsp;vẫn theo ch&acirc;n nh&agrave; th&aacute;m hiểm người Anh Jonathan Green tr&ecirc;n h&agrave;nh tr&igrave;nh vẽ lại&nbsp;bản đồ v&ugrave;ng Viễn Đ&ocirc;ng Nga theo lệnh Peter Đại Đế. Chuyến đi bất ngờ đưa Jonathan đến với đất nước Trung Hoa đang chứa đầy ma thuật v&agrave; những sinh vật huyền b&iacute;.</p>

<p><a href="https://cdn.pose.com.vn/assets/2019/09/12/2-7246.jpg" target="_blank"><img alt="Long Ấn Cơ Mật phim hành động thần thoại đánh dấu sự trở lại của Thành Long và Arnold Schwazenegger" src="https://cdn.pose.com.vn/assets/2019/09/12/2-7246.jpg" style="height:433px; width:650px" /></a></p>

<p style="text-align:center"><em>&ldquo;Vua Kungfu&rdquo; Th&agrave;nh Long đối đầu với nắm đấm của Arnold Schwazenegger.</em></p>

<p style="text-align:justify">Truyền thuyết xa xưa của phương Đ&ocirc;ng kể rằng Long Vương &ndash; vua của c&aacute;c lo&agrave;i rồng ch&igrave;m v&agrave;o giấc ngủ v&agrave; trao lại sức mạnh của m&igrave;nh trong tấm long ấn cho Bạch Ph&aacute;p sư&nbsp;(Th&agrave;nh Long)&nbsp;v&agrave; con g&aacute;i &ocirc;ng l&agrave; c&ocirc;ng ch&uacute;a Th&agrave;nh Lan&nbsp;(Di&ecirc;u Tinh Đồng)&nbsp;g&igrave;n giữ. Nhưng Ph&aacute;p sư Hắc Ma (M&atilde; Lệ) quỷ quyệt đ&atilde; t&igrave;m c&aacute;ch nhốt cha con c&ocirc;ng ch&uacute;a v&agrave;o ngục tối tại một đất nước xa x&ocirc;i. Kể từ đ&oacute;, Ph&aacute;p sư Hắc Ma mặc sức th&acirc;u t&oacute;m quyền lực, b&oacute;c lột v&agrave; &ldquo;&eacute;p buộc&rdquo; người d&acirc;n phải sống dựa v&agrave;o ma thuật từ Long Vương trong cảnh lầm than.</p>

<p style="text-align:justify"><a href="https://cdn.pose.com.vn/assets/2019/09/12/Trailer-1.jpg" target="_blank"><img alt="Long Ấn Cơ Mật phim hành động thần thoại đánh dấu sự trở lại của Thành Long và Arnold Schwazenegger" src="https://cdn.pose.com.vn/assets/2019/09/12/Trailer-1.jpg" style="height:433px; width:650px" /></a></p>

<p style="text-align:justify">Long Ấn Cơ Mật&nbsp;đưa kh&aacute;n giả&nbsp; kh&aacute;m ph&aacute; h&agrave;nh tr&igrave;nh thần thoại với bối cảnh trải d&agrave;i từ nước Anh tới Nga rồi đến với Trung Hoa. Trailer <a href="https://pose.com.vn/tag/bo-phim" target="_blank" title="bộ phim">bộ phim</a> mở ra h&igrave;nh ảnh Long Vương dũng m&atilde;nh- sinh vật mang sức mạnh si&ecirc;u ph&agrave;m trong truyền thuyết được thực hiện với kỹ xảo v&ocirc; c&ugrave;ng c&ocirc;ng phu v&agrave; sắc sảo. Cuộc chiến tranh gi&agrave;nh quyền kiểm so&aacute;t ma thuật của Long Vương đ&atilde; gắn kết số phận của Jonathan Green với Bạch Ph&aacute;p sư khi vợ nh&agrave; th&aacute;m hiểm t&igrave;m đến vị tr&iacute; giả Trung Hoa để nhờ t&igrave;m kiếm chồng m&igrave;nh.</p>

<p><a href="https://cdn.pose.com.vn/assets/2019/09/12/Trailer-2.jpg" target="_blank"><img alt="Long Ấn Cơ Mật phim hành động thần thoại đánh dấu sự trở lại của Thành Long và Arnold Schwazenegger" src="https://cdn.pose.com.vn/assets/2019/09/12/Trailer-2.jpg" style="height:433px; width:650px" /></a></p>

<p style="text-align:justify">C&ugrave;ng l&uacute;c đ&oacute;, nữ Ph&aacute;p sư Hắc Ma đang ph&ocirc; trương quyền lực kiểm so&aacute;t sấm s&eacute;t, &acirc;m thanh v&agrave; đe dọa sẽ thống lĩnh cả thi&ecirc;n hạ bằng sức mạnh của long ấn.&nbsp;Trailer của bộ phim cũng kh&ocirc;ng qu&ecirc;n nhấn mạnh v&agrave;o sự g&oacute;p mặt của hai si&ecirc;u sao h&agrave;nh động h&agrave;ng đầu thế giới &ndash; Th&agrave;nh Long v&agrave; Arnold Schwazenegger. Kh&aacute;n giả được chứng kiến ngay một m&agrave;n quyết đấu nảy lửa giữa một b&ecirc;n l&agrave; Bạch Ph&aacute;p sư (Th&agrave;nh Long) v&agrave; vị quan cai ngục th&agrave;nh London (Arnold Schwazenegger).</p>

<div class="playerholder" style="-webkit-transition:2s; background-color:#333333; border:none; max-width:800px; position:relative; transition:2s; width:100%">
<div class="pose-player" id="posevideo_8636065" style="margin-bottom:0px; margin-left:0px; margin-right:0px; margin-top:0px; width:100%">
<div class="hadarone-video-player" id="hd1_c_1180118">
<div class="hd1_vpl_1180118-dimensions video-js vjs-controls-enabled vjs-default-skin vjs-has-started vjs-paused vjs-user-inactive vjs-v7 vjs-workinghover" id="hd1_vpl_1180118" lang="vi">
<div class="vjs-text-track-display">&nbsp;</div>
</div>
</div>
</div>
</div>

<div class="vjs-control vjs-volume-panel vjs-volume-panel-horizontal">&nbsp;</div>

<div class="vjs-control vjs-progress-control">&nbsp;</div>

<div class="playerholder" style="-webkit-transition:2s; background-color:#333333; border:none; max-width:800px; position:relative; transition:2s; width:100%">
<div class="pose-player" id="posevideo_8636065" style="margin-bottom:0px; margin-left:0px; margin-right:0px; margin-top:0px; width:100%">
<div class="hadarone-video-player" id="hd1_c_1180118">
<div class="hd1_vpl_1180118-dimensions video-js vjs-controls-enabled vjs-default-skin vjs-has-started vjs-paused vjs-user-inactive vjs-v7 vjs-workinghover" id="hd1_vpl_1180118" lang="vi">
<div class="vjs-control-bar" dir="ltr">
<div class="vjs-control vjs-remaining-time vjs-time-control">Remaining Time&nbsp;-2:03</div>

<div class="playerlogo" style="background-image:url(&quot;data:image/png">&nbsp;</div>
</div>
</div>
</div>
</div>
</div>

<p style="text-align:justify">Th&agrave;nh Long thể hiện phong c&aacute;ch v&otilde; thuật uyển chuyển v&agrave; đẹp mắt quen thuộc, tận dụng sợi x&iacute;ch tr&oacute;i tay l&agrave;m m&oacute;n vũ kh&iacute; đầy uy lực. Để đ&aacute;p trả Arnold Schwazenegger ng&agrave;y lập tức tung c&uacute; đấm mạnh mẽ mang t&iacute;nh s&aacute;t thương cao, dự b&aacute;o một trận đối đầu ngang t&agrave;i ngang sức.</p>

<p><a href="https://cdn.pose.com.vn/assets/2019/09/12/Trailer-4.jpg" target="_blank"><img alt="Long Ấn Cơ Mật phim hành động thần thoại đánh dấu sự trở lại của Thành Long và Arnold Schwazenegger" src="https://cdn.pose.com.vn/assets/2019/09/12/Trailer-4.jpg" style="height:433px; width:650px" /></a></p>

<p style="text-align:justify">Để ph&ugrave; hợp với bối cảnh thần thoại, cả Th&agrave;nh Long v&agrave; Arnold Schwazenegger đều mang tạo h&igrave;nh kh&aacute;c biệt hẳn h&igrave;nh tượng đ&atilde; quen thuộc với người h&acirc;m mộ. Th&agrave;nh Long được h&oacute;a trang m&aacute;i t&oacute;c bạc trắng, mang phong th&aacute;i của bậc tr&iacute; giả Trung Hoa, c&ograve;n &ldquo;kẻ hủy diệt&rdquo; Schwazenegger kho&aacute;c l&ecirc;n m&igrave;nh bộ qu&acirc;n phục cổ điển c&ugrave;ng bộ ria m&eacute;p đậm chất qu&yacute; tộc nước Anh.</p>

<p style="text-align:justify">Đ&acirc;y l&agrave; lần thứ hợp t&aacute;c thứ hai của hai huyền thoại phim h&agrave;nh động sau bộ phim Around the World in 80 Days v&agrave;o năm 2004. Về lần t&aacute;i ngộ với Arnold Schwazenegger, Th&agrave;nh Long chia sẻ: &ldquo;<em>T&ocirc;i v&agrave; Arnold đ&atilde; trở th&agrave;nh bạn b&egrave; th&acirc;n thiết sau lần hợp t&aacute;c đầu ti&ecirc;n. Khi nghe tin dự &aacute;n Long Ấn Cơ Mật đang mời Arnold tham gia, t&ocirc;i đ&atilde; kh&ocirc;ng d&aacute;m tin. Kh&ocirc;ng ngờ khi vừa nghe sẽ c&ugrave;ng diễn xuất chung với t&ocirc;i, Arnold lập tức vui vẻ nhận lời. T&ocirc;i rất cảm ơn nh&agrave; sản xuất đ&atilde; cho t&ocirc;i cơ hội hợp t&aacute;c lần nữa với anh ấy</em>&rdquo;.</p>

<ul>
	<li><em><a href="https://pose.vn/hau-truong/vo-ho-thanh-long-hot-hoang-bao-canh-sat-bao-tin-con-gai-mat-tich-nghi-ngo-bi-giet-hai-790698.html">Vợ hờ Th&agrave;nh Long hốt hoảng b&aacute;o cảnh s&aacute;t b&aacute;o tin con g&aacute;i mất t&iacute;ch, nghi ngờ bị giết hại</a></em></li>
	<li><em><a href="https://pose.vn/giai-tri/top-10-bo-phim-truyen-hinh-duoc-tim-kiem-nhieu-nhat-han-quoc-851646.html">Top 10 bộ phim truyền h&igrave;nh được t&igrave;m kiếm nhiều nhất H&agrave;n Quốc</a></em></li>
	<li><em><a href="https://pose.vn/giai-tri/3-phim-thai-ngo-nghinh-hon-ca-chiec-la-bay-co-han-mot-khoa-chuyen-day-hanh-nghe-giat-chong-chuyen-nghiep-849318.html">3 phim Th&aacute;i trớ tr&ecirc;u hơn cả &lsquo;Chiếc L&aacute; Bay&rsquo;: C&oacute; hẳn kho&aacute; dạy h&agrave;nh nghề &lsquo;giật chồng&rsquo; chuy&ecirc;n nghiệp?</a></em></li>
</ul>

<p style="text-align:justify"><a href="https://cdn.pose.com.vn/assets/2019/09/12/Trailer-5.jpg" target="_blank"><img alt="Long Ấn Cơ Mật phim hành động thần thoại đánh dấu sự trở lại của Thành Long và Arnold Schwazenegger" src="https://cdn.pose.com.vn/assets/2019/09/12/Trailer-5.jpg" style="height:433px; width:650px" /></a></p>

<p style="text-align:justify">B&ecirc;n cạnh cặp đ&ocirc;i lừng danh Th&agrave;nh Long v&agrave; Arnold Schwazenegger,&nbsp;Long Ấn Cơ Mật&nbsp;c&ograve;n c&oacute; sự g&oacute;p mặt của nam diễn vi&ecirc;n Jason Flemyng, người đồng h&agrave;nh với vai diễn nh&agrave; th&aacute;m hiểm Jonathan Green từ phần đầu. Thủ vai c&ocirc;ng ch&uacute;a Th&agrave;nh Lan l&agrave; hoa đ&aacute;n Di&ecirc;u Tinh Đồng- &ldquo;n&agrave;ng thơ&rdquo; từng hợp t&aacute;c với Th&agrave;nh Long từ dự &aacute;n 12 con gi&aacute;p. Nữ ho&agrave;ng h&agrave;i Trung Quốc M&atilde; Lệ sẽ c&oacute; m&agrave;n lột x&aacute;c ngoạn mục trong vai Ph&aacute;p sư Hắc Ma.</p>

<p style="text-align:center"><a href="https://cdn.pose.com.vn/assets/2019/09/12/Trailer-6.jpg" target="_blank"><img alt="Long Ấn Cơ Mật phim hành động thần thoại đánh dấu sự trở lại của Thành Long và Arnold Schwazenegger" src="https://cdn.pose.com.vn/assets/2019/09/12/Trailer-6.jpg" style="height:433px; width:650px" /></a><em>Đả nữ Di&ecirc;u Tinh Đồng sắm vai c&ocirc;ng ch&uacute;a Th&agrave;nh Lan- con g&aacute;i của Bạch Ph&aacute;p sư (Th&agrave;nh Long)</em></p>

<p style="text-align:justify">Đặc biệt, đạo diễn Oleg Stepchenko c&ograve;n tiết lộ hai điểm nhấn kh&aacute;c của&nbsp;Long Ấn Cơ Mật&nbsp;ch&iacute;nh l&agrave; kỹ xảo được đầu tư chỉn chu v&agrave; phần h&agrave;nh động v&otilde; thuật kịch t&iacute;nh. &Ocirc;ng cũng cho biết&nbsp;Long Ấn Cơ Mật&nbsp;sở hữu rất nhiều pha h&agrave;nh động mạo hiểm được bảo chứng bởi &ecirc;-k&iacute;p chuy&ecirc;n nghiệp của Th&agrave;nh Long. V&igrave; v&acirc;y, bộ phim chắc chắn sẽ mang đến những gi&acirc;y ph&uacute;t giải tr&iacute; đỉnh cao cho kh&aacute;n giả.</p>

<p style="text-align:justify"><a href="https://cdn.pose.com.vn/assets/2019/09/12/Trailer-7.jpg" target="_blank"><img alt="Long Ấn Cơ Mật phim hành động thần thoại đánh dấu sự trở lại của Thành Long và Arnold Schwazenegger" src="https://cdn.pose.com.vn/assets/2019/09/12/Trailer-7.jpg" style="height:433px; width:650px" /></a></p>

<p><a href="https://cdn.pose.com.vn/assets/2019/09/12/Trailer-8.jpg" target="_blank"><img alt="Long Ấn Cơ Mật phim hành động thần thoại đánh dấu sự trở lại của Thành Long và Arnold Schwazenegger" src="https://cdn.pose.com.vn/assets/2019/09/12/Trailer-8.jpg" style="height:433px; width:650px" /></a></p>

<p style="text-align:justify">So với phần đầu ti&ecirc;n,&nbsp;Long Ấn Cơ Mật&nbsp;được&nbsp;đạo diễn Oleg Stepchenko v&agrave; &ecirc;-k&iacute;p đầu tư kỹ xảo m&atilde;n nh&atilde;n vượt bậc. Được biết, kinh ph&iacute; của&nbsp;Long Ấn Cơ Mật&nbsp;v&agrave;o khoảng 48 triệu USD v&agrave; phần lớn được d&agrave;nh để chăm ch&uacute;t cho phần hậu kỳ n&agrave;y, hứa hẹn sẽ l&agrave; một m&oacute;n ăn tinh thần chất lượng v&agrave; đầy mới lạ m&agrave; kh&aacute;n giả y&ecirc;u điện ảnh v&agrave; d&ograve;ng phim v&otilde; thuật h&agrave;nh động kh&ocirc;ng thể bỏ qua. Bộ phim&nbsp;Long Ấn Cơ Mật&nbsp;được khởi chiếu từ ng&agrave;y 20.09.2019 tại c&aacute;c rạp tr&ecirc;n to&agrave;n quốc.</p>

<p>&nbsp;</p>
', 2019, NULL, NULL, NULL, NULL, NULL, NULL, 1003, CAST(N'2019-11-19 15:58:22.413' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, N'/Data/files/New%20Movie/poster_medium_28.jpg', N'Tiếp nối thành công của tác phẩm hành động thần thoại “Viy” ra mắt năm 2014, đạo diễn Oleg Stepchenko ...')
INSERT [dbo].[News] ([NewsID], [Name], [Image], [Description], [Year], [Country], [MovieLink], [TrailerLink], [CategoryID], [Rate], [TrailerID], [Viewed], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [Tags], [ImageNews], [MoreDescription]) VALUES (9, N'Danh sách những nhân vật sở hữu sức mạnh số má bậc nhất trong One Punch Man (P.2)', N'/Data/files/New%20Movie/poster_medium_13.jpg', N'<h2><strong><span style="font-size:14px">Trong b&agrave;i viết n&agrave;y, ch&uacute;ng ta sẽ c&ugrave;ng điểm t&ecirc;n một số gương mặt ti&ecirc;u biểu sở hữu một sức mạnh đ&aacute;ng kinh ngạc trong truyện One Punch Man.</span></strong></h2>

<ul>
</ul>

<div>&nbsp;</div>

<div class="rightdetail_content">
<p>One Punch Man l&agrave; một trong những bộ truyện tranh nổi tiếng nhất hiện nay. C&acirc;u chuyện xoay quanh nh&acirc;n vật ch&iacute;nh l&agrave; Saitama - một anh h&ugrave;ng c&oacute; sức mạnh b&aacute; đạo &quot;một đấm chết tươi&quot;. Bởi v&igrave; &Aacute;o cho&agrave;ng h&oacute;i mạnh đến mức chưa thấy đối thủ, anh ch&agrave;ng đ&agrave;nh phải đi ti&ecirc;u diệt qu&aacute;i vật cho đỡ ch&aacute;n đời.</p>

<div class="VCSortableInPreviewMode noCaption">
<div><a class="detail-img-lightbox" href="https://genknews.genkcdn.vn/2019/11/16/photo-1-1573892248189413885465.jpg" target="_blank" title=""><img alt="Danh sách những nhân vật sở hữu sức mạnh số má bậc nhất trong One Punch Man (P.2) - Ảnh 1." class="gif-content lightbox-content" id="img_880d0190-0849-11ea-8b16-6be36c02bcf4" src="https://genknews.genkcdn.vn/2019/11/16/photo-1-1573892248189413885465.jpg" style="max-width:100%" title="Danh sách những nhân vật sở hữu sức mạnh số má bậc nhất trong One Punch Man (P.2) - Ảnh 1." /></a></div>

<div class="PhotoCMS_Caption">&nbsp;</div>
</div>

<p>Với chủ đề ch&iacute;nh l&agrave; cuộc chiến đối đầu giữa những người anh h&ugrave;ng v&agrave; lũ qu&aacute;i vật, một trong những điểm trọng t&acirc;m của truyện l&agrave; việc ph&ocirc; b&agrave;y sức mạnh phi ph&agrave;m của c&aacute;c nh&acirc;n vật. V&agrave; đương nhi&ecirc;n, qua những trận đấu, độc giả kh&ocirc;ng khỏi c&oacute; những sự so s&aacute;nh sức mạnh giữa c&aacute;c nh&acirc;n vật. Trong b&agrave;i viết n&agrave;y, ch&uacute;ng ta sẽ c&ugrave;ng điểm t&ecirc;n một số gương mặt ti&ecirc;u biểu sở hữu một sức mạnh đ&aacute;ng kinh ngạc.</p>

<div class="VCSortableInPreviewMode noCaption">
<div><a class="detail-img-lightbox" href="https://genknews.genkcdn.vn/2019/11/16/photo-1-1573892250527944215631.jpg" target="_blank" title=""><img alt="Danh sách những nhân vật sở hữu sức mạnh số má bậc nhất trong One Punch Man (P.2) - Ảnh 2." class="gif-content lightbox-content" id="img_894f6ca0-0849-11ea-9749-f51bf71e3025" src="https://genknews.genkcdn.vn/thumb_w/640/2019/11/16/photo-1-1573892250527944215631.jpg" style="max-width:100%" title="Danh sách những nhân vật sở hữu sức mạnh số má bậc nhất trong One Punch Man (P.2) - Ảnh 2." /></a></div>

<div class="PhotoCMS_Caption">&nbsp;</div>
</div>

<p>Lưu &yacute;: Danh s&aacute;ch b&ecirc;n dưới kh&ocirc;ng được xếp theo thứ tự so s&aacute;nh.</p>

<p><strong>6. Orochi</strong></p>

<p>Orochi l&agrave; con qu&aacute;i vật mạnh nhất, đồng thời cũng l&agrave; l&atilde;nh đạo của hiệp hội qu&aacute;i vật. Trước đ&acirc;y th&igrave; hắn cũng chỉ l&agrave; một người ho&agrave;n to&agrave;n b&igrave;nh thường, nhưng sau đ&oacute; hắn đ&atilde; bị một sinh vật ngoại cảm t&ecirc;n l&agrave; Gyoro Gyoro biến th&agrave;nh qu&aacute;i vật. T&ecirc;n Vua qu&aacute;i vật dễ d&agrave;ng đ&aacute;nh bại Garou ở dạng nửa qu&aacute;i vật, từ đ&oacute; c&oacute; thể chứng minh sức mạnh v&ocirc; song của hắn.</p>

<div class="VCSortableInPreviewMode noCaption">
<div><a class="detail-img-lightbox" href="https://genknews.genkcdn.vn/2019/11/16/photo-2-15738922505301974942522.jpg" target="_blank" title=""><img alt="Danh sách những nhân vật sở hữu sức mạnh số má bậc nhất trong One Punch Man (P.2) - Ảnh 3." class="gif-content lightbox-content" id="img_89567180-0849-11ea-bbad-d14ff1cfd25f" src="https://genknews.genkcdn.vn/2019/11/16/photo-2-15738922505301974942522.jpg" style="max-width:100%" title="Danh sách những nhân vật sở hữu sức mạnh số má bậc nhất trong One Punch Man (P.2) - Ảnh 3." /></a></div>

<div class="PhotoCMS_Caption">&nbsp;</div>
</div>

<p><strong>7. Golden Sperm</strong></p>

<p>Black Sperm l&agrave; một th&agrave;nh vi&ecirc;n cấp cao của hiệp hội qu&aacute;i vật. Tinh tr&ugrave;ng đen kh&ocirc;ng chỉ sở hữu một sức mạnh vật l&yacute; uy lực, điểm nổi trội nhất của con qu&aacute;i vật n&agrave;y l&agrave; tuyệt kỹ ph&acirc;n th&agrave;nh th&agrave;nh v&ocirc; số tế b&agrave;o si&ecirc;u nhỏ, khiến hắn phải bị giết tận 11 ngh&igrave;n tỷ lần th&igrave; mới chết hẳn. Sau n&agrave;y, hắn c&ograve;n t&aacute;i xuất giang hồ với một diện mạo mới ho&agrave;ng kim hơn, v&agrave; được gọi l&agrave; Golden Smurf. Để biết r&otilde; hơn về dạng tiến h&oacute;a n&agrave;y th&igrave; ch&uacute;ng ta h&atilde;y c&ugrave;ng chờ đợi ở c&aacute;c t&igrave;nh tiết truyện tiếp theo.</p>

<div class="VCSortableInPreviewMode noCaption">
<div><a class="detail-img-lightbox" href="https://genknews.genkcdn.vn/2019/11/16/photo-3-15738922505331489137071.jpg" target="_blank" title=""><img alt="Danh sách những nhân vật sở hữu sức mạnh số má bậc nhất trong One Punch Man (P.2) - Ảnh 4." class="gif-content lightbox-content" id="img_89887e00-0849-11ea-8540-c95a0ea3e7c6" src="https://genknews.genkcdn.vn/thumb_w/640/2019/11/16/photo-3-15738922505331489137071.jpg" style="max-width:100%" title="Danh sách những nhân vật sở hữu sức mạnh số má bậc nhất trong One Punch Man (P.2) - Ảnh 4." /></a></div>

<div class="PhotoCMS_Caption">&nbsp;</div>
</div>

<p><strong>8. Overgrown Rover</strong></p>

<p>Overgrown Rover l&agrave; ch&oacute; canh nh&agrave; của hiệp hội qu&aacute;i vật. N&oacute;i th&igrave; n&oacute;i vậy, chứ &quot;cậu đen&quot; cũng chẳng phải dạng vừa đ&acirc;u. Con qu&aacute;i vật n&agrave;y c&oacute; tốc độ, sức mạnh v&agrave; độ chống chịu đều ở mức vượt trội. Điểm ấn tượng nhất về ch&uacute; ch&oacute; qu&aacute; khổ n&agrave;y l&agrave; n&oacute; đ&atilde; ăn trọn một đấm của &Aacute;o cho&agrave;ng h&oacute;i m&agrave; kh&ocirc;ng bị thương qu&aacute; nghi&ecirc;m trọng.</p>

<div class="mt-10 wp100" id="admzone508553">&nbsp;</div>

<div class="VCSortableInPreviewMode noCaption">
<div><a class="detail-img-lightbox" href="https://genknews.genkcdn.vn/2019/11/16/photo-4-15738922505371764722716.jpg" target="_blank" title=""><img alt="Danh sách những nhân vật sở hữu sức mạnh số má bậc nhất trong One Punch Man (P.2) - Ảnh 5." class="gif-content lightbox-content" id="img_8967d6a0-0849-11ea-9749-f51bf71e3025" src="https://genknews.genkcdn.vn/thumb_w/640/2019/11/16/photo-4-15738922505371764722716.jpg" style="max-width:100%" title="Danh sách những nhân vật sở hữu sức mạnh số má bậc nhất trong One Punch Man (P.2) - Ảnh 5." /></a></div>

<div class="PhotoCMS_Caption">&nbsp;</div>
</div>

<p><strong>9. Elder Centipede</strong></p>

<p>Elder Centipede cũng l&agrave; một th&agrave;nh vi&ecirc;n rất được trọng dụng của hiệp hội qu&aacute;i vật. Hai năm trước, con rết tổ đ&atilde; xuất hiện v&agrave; t&agrave;n ph&aacute; cả một th&agrave;nh phố, khiến cho vị anh h&ugrave;ng b&iacute; ẩn Blast phải ra mặt diệt trừ, nhưng con qu&aacute;i vật để may mắn trốn tho&aacute;t được. Hai năm sau, Elder Centipede quay lại v&agrave; lợi hại hơn gấp nhiều lần. Rết tổ hứng nguy&ecirc;n một quả t&ecirc;n lửa của Metal Knight m&agrave; chẳng hề hấn g&igrave;. Hắn chiến đấu với Bang, Bomb (anh trai Bang) v&agrave; Genos c&ugrave;ng l&uacute;c v&agrave; su&yacute;t ch&uacute;t nữa l&agrave; hạ gục được cả ba.</p>

<div class="VCSortableInPreviewMode noCaption">
<div><a class="detail-img-lightbox" href="https://genknews.genkcdn.vn/2019/11/16/photo-5-15738922505391632832974.jpg" target="_blank" title=""><img alt="Danh sách những nhân vật sở hữu sức mạnh số má bậc nhất trong One Punch Man (P.2) - Ảnh 6." class="gif-content lightbox-content" id="img_893295d0-0849-11ea-b501-c74588ee7aa0" src="https://genknews.genkcdn.vn/thumb_w/640/2019/11/16/photo-5-15738922505391632832974.jpg" style="max-width:100%" title="Danh sách những nhân vật sở hữu sức mạnh số má bậc nhất trong One Punch Man (P.2) - Ảnh 6." /></a></div>

<div class="PhotoCMS_Caption">&nbsp;</div>
</div>

<p><strong>10. Gouketsu</strong></p>

<p>Cũng giống như Orochi, ban đầu Gouketsu cũng chỉ l&agrave; một con người, v&agrave; đồng thời cũng l&agrave; v&otilde; sư v&ocirc; địch giải đấu Super Fight lần đầu ti&ecirc;n. Nhưng sau n&agrave;y, hắn đ&atilde; ăn tế b&agrave;o qu&aacute;i nh&acirc;n v&agrave; tham gia hiệp hội qu&aacute;i vật. Từ khi c&ograve;n l&agrave; người, hắn vốn đ&atilde; mạnh &aacute;p đảo nhiều người kh&aacute;c, vậy n&ecirc;n khi trở th&agrave;nh qu&aacute;i vật, sức mạnh của hắn lại c&agrave;ng khủng bố hơn. T&ecirc;n v&otilde; sư h&oacute;a qu&aacute;i dễ d&agrave;ng cho Suiryu, người v&ocirc; địch giải đấu Super Fight tận s&aacute;u lần, ăn h&agrave;nh ngập mồm m&agrave; chẳng cần cố vận sức.</p>

<div class="VCSortableInPreviewMode noCaption">
<div><a class="detail-img-lightbox" href="https://genknews.genkcdn.vn/2019/11/16/photo-6-1573892250540238297372.jpg" target="_blank" title=""><img alt="Danh sách những nhân vật sở hữu sức mạnh số má bậc nhất trong One Punch Man (P.2) - Ảnh 7." class="gif-content lightbox-content" id="img_89252850-0849-11ea-89ac-d5c0e919c4ea" src="https://genknews.genkcdn.vn/2019/11/16/photo-6-1573892250540238297372.jpg" style="max-width:100%" title="Danh sách những nhân vật sở hữu sức mạnh số má bậc nhất trong One Punch Man (P.2) - Ảnh 7." /></a></div>

<div class="PhotoCMS_Caption">&nbsp;</div>
</div>

<p>Ngo&agrave;i những người được kể t&ecirc;n trong danh s&aacute;ch tr&ecirc;n, cũng c&oacute; những nh&acirc;n vật kh&aacute;c c&oacute; sức mạnh g&acirc;y ấn tượng mạnh đến độc giả, c&oacute; thể kể đến như: Bang, Bomb, Marugori,... Bạn cảm thấy c&ograve;n những c&aacute;i t&ecirc;n n&agrave;o cần được bổ sung trong danh s&aacute;ch n&agrave;y nữa kh&ocirc;ng? H&atilde;y để lại b&igrave;nh luận b&ecirc;n dưới nh&eacute;.</p>
</div>
', 2019, NULL, NULL, NULL, NULL, NULL, NULL, 1370, CAST(N'2019-11-19 11:02:29.007' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, N'/Data/files/New%20Movie/poster_medium_13.jpg', N'One Punch Man là một trong những bộ truyện tranh nổi tiếng nhất hiện nay. Câu chuyện xoay quanh nhân vật chính là Saitama - một anh hùng có sức mạnh bá đạo "một đấm chết tươi...')
INSERT [dbo].[News] ([NewsID], [Name], [Image], [Description], [Year], [Country], [MovieLink], [TrailerLink], [CategoryID], [Rate], [TrailerID], [Viewed], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [Tags], [ImageNews], [MoreDescription]) VALUES (10, N'The Joker trở thành phim nhãn R đầu tiên trong lịch sử đạt doanh thu 1 tỷ đô', N'/Data/images/Movies/joker.jpg', N'<h2><em><strong><span style="font-size:14px">Đ&acirc;y được coi l&agrave; 1 ph&eacute;p m&agrave;u, khi The Joker đ&atilde; thực hiện được điều m&agrave; những bộ phim kh&aacute;c của h&atilde;ng n&agrave;y trong năm nay đều kh&ocirc;ng thể l&agrave;m: Chạm mốc 1 tỷ đ&ocirc; la.</span></strong></em></h2>

<ul>
</ul>

<div>&nbsp;</div>

<div class="rightdetail_content">
<p>&quot;C&oacute; l&ograve;ng trồng hoa, hoa chẳng nở; v&ocirc; t&igrave;nh cắm liễu, liễu lại xanh&quot; - đ&acirc;y c&oacute; lẽ l&agrave; c&acirc;u n&oacute;i ph&ugrave; hợp nhất để m&ocirc; tả về bộ phim Joker của nh&agrave; Warner Bros. Đ&oacute; c&oacute; thể coi l&agrave; 1 ph&eacute;p m&agrave;u, khi Joker đ&atilde; thực hiện được điều m&agrave; những bộ phim kh&aacute;c của h&atilde;ng n&agrave;y trong năm nay đều kh&ocirc;ng thể l&agrave;m: Chạm mốc 1 tỷ đ&ocirc; la.</p>

<p>Hồi đầu, The Joker đ&atilde; bị 1 số lượng lớn kh&aacute;n giả cho rằng đ&acirc;y l&agrave; 1 dự &aacute;n chết yểu. Bởi The Joker vốn l&agrave; 1 con c&aacute; đi ngược d&ograve;ng, khi tập trung đi s&acirc;u v&agrave;o vấn đề t&acirc;m l&yacute;, những g&oacute;c nh&igrave;n ti&ecirc;u cực v&agrave; đầy những t&igrave;nh tiết tăm tối, trong khi xu hướng phim si&ecirc;u anh h&ugrave;ng hiện tại lại theo hướng h&agrave;nh động, giải tr&iacute; v&agrave; ch&aacute;y nổ.</p>

<p>Trong qu&aacute; khứ, c&oacute; 1 số bộ phim theo xu hướng n&agrave;y của DC đ&atilde; nhận thất bại v&ocirc; c&ugrave;ng thảm hại. Mặc d&ugrave; c&oacute; thể coi như những tuyệt phẩm, nhưng Watchmen v&agrave; V For Vendetta đ&atilde; kh&ocirc;ng được thế giới đ&oacute;n nhận khi nội dung của n&oacute; kh&ocirc;ng thực sự phổ biến với cảm nhận của những kh&aacute;n giả v&agrave;o thời điểm đ&oacute;.</p>

<div class="VCSortableInPreviewMode active">
<div><a class="detail-img-lightbox" href="https://genknews.genkcdn.vn/2019/11/18/photo-1-15740539671051603760999.jpg" target="_blank" title="Watchmen và V For Vendetta đã không được thế giới đón nhận, mà chỉ được công nhận sau nhiều năm kể từ ngày công chiếu."><img alt="The Joker trở thành phim nhãn R đầu tiên trong lịch sử đạt doanh thu 1 tỷ đô - Ảnh 1." class="gif-content lightbox-content" id="img_0d44a790-09c2-11ea-8b16-6be36c02bcf4" src="https://genknews.genkcdn.vn/thumb_w/640/2019/11/18/photo-1-15740539671051603760999.jpg" style="max-width:100%" title="The Joker trở thành phim nhãn R đầu tiên trong lịch sử đạt doanh thu 1 tỷ đô - Ảnh 1." /></a></div>

<div class="PhotoCMS_Caption">
<p>Watchmen v&agrave; V For Vendetta đ&atilde; kh&ocirc;ng được thế giới đ&oacute;n nhận, m&agrave; chỉ được c&ocirc;ng nhận sau nhiều năm kể từ ng&agrave;y c&ocirc;ng chiếu.</p>
</div>
</div>

<p>Thậm ch&iacute;, Joker đ&atilde; từng c&oacute; thời gian bị &quot;v&ugrave;i dập&quot; bởi nhiều nh&agrave; ph&ecirc; b&igrave;nh v&agrave; sự cẩn trọng tuyệt đối mang t&iacute;nh ch&iacute;nh trị đối với cảnh s&aacute;t, bởi bộ phim đ&atilde; l&agrave;m tăng những lo ngại về việc g&acirc;y ảnh hưởng mạnh đến bạo lực, bạo động, đặc biệt l&agrave; tại Mỹ.</p>

<p>Kh&ocirc;ng chỉ vậy, Joker của Joaquin Phoenix c&ograve;n được cho l&agrave; kh&ocirc;ng đủ khả năng để c&oacute; thể vượt qua người tiền nhiệm của m&igrave;nh l&agrave; h&igrave;nh tượng Joker của&nbsp;Heath Ledger - 1 trong những h&igrave;nh tượng Joker nổi danh nhất lịch sử. Tuy nhi&ecirc;n, anh v&agrave; vị đạo diễn Todd Phillips đ&atilde; chứng minh điều đ&oacute; l&agrave; ho&agrave;n to&agrave;n sai.</p>

<div class="VCSortableInPreviewMode active">
<div><a class="detail-img-lightbox" href="https://genknews.genkcdn.vn/2019/11/18/57221095-3800x1612-15740541936501834071208.jpg" target="_blank" title="Tạo hình của Joker do Heath Ledger thủ vai trong The Dark Knight."><img alt="The Joker trở thành phim nhãn R đầu tiên trong lịch sử đạt doanh thu 1 tỷ đô - Ảnh 2." class="gif-content lightbox-content" id="img_9514b890-09c2-11ea-b024-4329285d6089" src="https://genknews.genkcdn.vn/thumb_w/640/2019/11/18/57221095-3800x1612-15740541936501834071208.jpg" style="max-width:100%" title="The Joker trở thành phim nhãn R đầu tiên trong lịch sử đạt doanh thu 1 tỷ đô - Ảnh 2." /></a></div>

<div class="PhotoCMS_Caption">
<p>Tạo h&igrave;nh của Joker do Heath Ledger thủ vai trong The Dark Knight.</p>
</div>
</div>

<p>Kể từ l&uacute;c bắt đầu buổi chiếu thử, Joker đ&atilde; nhận được lời t&aacute;n dương nhiệt liệt từ ph&iacute;a c&aacute;c nh&agrave; ph&ecirc; b&igrave;nh. Bộ phim đ&atilde; xuất sắc nhận được giải Sư Tử V&agrave;ng tại Li&ecirc;n hoan phim Venice, đồng thời cũng nhận được nhiều giải thưởng tại Li&ecirc;n hoan phim&nbsp;Camerimage tại Ba Lan.&nbsp;</p>

<div class="VCSortableInPreviewMode active">
<div><a href="https://genknews.genkcdn.vn/2019/11/18/photo-1-15740538184431436560479.jpg" title="Joker "><img alt="The Joker trở thành phim nhãn R đầu tiên trong lịch sử đạt doanh thu 1 tỷ đô - Ảnh 3." class="gif-content lightbox-content" id="img_b479ca00-09c1-11ea-9ea3-37e9fb1c7a0a" src="https://genknews.genkcdn.vn/thumb_w/640/2019/11/18/photo-1-15740538184431436560479.jpg" style="max-width:100%" title="The Joker trở thành phim nhãn R đầu tiên trong lịch sử đạt doanh thu 1 tỷ đô - Ảnh 3." /></a></div>

<div class="PhotoCMS_Caption">
<p>Joker &quot;ẵm&quot; giải Sư Tử V&agrave;ng tại Li&ecirc;n hoan phim Venice, &Yacute;.</p>
</div>
</div>

<p>Kh&ocirc;ng dừng lại ở đ&oacute;, DC cũng đ&atilde; thể hiện tham vọng của m&igrave;nh khi&nbsp;đăng k&yacute; tranh giải tại nhiều hạng mục lớn nhỏ, trong đ&oacute; c&oacute; 3 hạng mục quan trọng nhất: Phim xuất sắc nhất, Nam diễn vi&ecirc;n ch&iacute;nh xuất sắc nhất v&agrave; Đạo diễn xuất sắc nhất.</p>

<div class="VCSortableInPreviewMode active noCaption">
<div><a class="detail-img-lightbox" href="https://genknews.genkcdn.vn/2019/11/18/photo-1-1574050776717844351930.jpg" target="_blank" title=""><img alt="The Joker trở thành phim nhãn R đầu tiên trong lịch sử đạt doanh thu 1 tỷ đô - Ảnh 4." class="gif-content lightbox-content" id="img_9eceee30-09ba-11ea-b298-956527c2528b" src="https://genknews.genkcdn.vn/thumb_w/640/2019/11/18/photo-1-1574050776717844351930.jpg" style="max-width:100%" title="The Joker trở thành phim nhãn R đầu tiên trong lịch sử đạt doanh thu 1 tỷ đô - Ảnh 4." /></a></div>

<div class="PhotoCMS_Caption">&nbsp;</div>
</div>

<p>Đ&oacute; l&agrave; tr&ecirc;n phương diện ph&ecirc; b&igrave;nh nghệ thuật, vậy tr&ecirc;n phương diện &quot;kinh tế&quot; th&igrave; sao? Đ&acirc;y mới l&agrave; điều g&acirc;y bất ngờ nhất, khi Joker đ&atilde; ph&aacute; vỡ,&nbsp;thậm ch&iacute; l&agrave; đứng đầu kỷ lục ph&ograve;ng v&eacute; th&aacute;ng 10 ở mọi mặt như doanh thu mở m&agrave;n khu vực nổi địa v&agrave; quốc tế, đồng thời cũng &aacute;p đảo doanh thu ph&ograve;ng v&eacute; th&aacute;ng 11. Bộ phim đ&atilde; xuất sắc trở th&agrave;nh bộ phim nh&atilde;n R c&oacute; doanh thu cao nhất mọi thời đại, vượt qua những c&aacute;i t&ecirc;n đ&aacute;ng gờm như Logan hay Deadpool.</p>

<div class="VCSortableInPreviewMode">
<div><a class="detail-img-lightbox" href="https://genknews.genkcdn.vn/2019/11/18/photo-1-15740512858361901978940.jpg" target="_blank" title="Joker xuất sắc vượt qua thành tựu của Deadpool."><img alt="The Joker trở thành phim nhãn R đầu tiên trong lịch sử đạt doanh thu 1 tỷ đô - Ảnh 5." class="gif-content lightbox-content" id="img_cea8ba40-09bb-11ea-a52a-95975cbd391f" src="https://genknews.genkcdn.vn/thumb_w/640/2019/11/18/photo-1-15740512858361901978940.jpg" style="max-width:100%" title="The Joker trở thành phim nhãn R đầu tiên trong lịch sử đạt doanh thu 1 tỷ đô - Ảnh 5." /></a></div>

<div class="PhotoCMS_Caption">
<p>Joker xuất sắc vượt qua th&agrave;nh tựu của Deadpool.</p>
</div>
</div>

<p>V&agrave; mới đ&acirc;y, Joker đ&atilde; xuất sắc đạt đến kỳ t&iacute;ch kh&oacute; m&agrave; c&oacute; thể ph&aacute; vỡ: Trở th&agrave;nh bộ phim nh&atilde;n R đầu ti&ecirc;n trong lịch sử đạt doanh thu 1 TỶ Đ&Ocirc;. Vượt qua mọi kỳ vọng của Warner Bros, The Joker từ 1 bộ phim t&acirc;m l&yacute; với khoản tiền đầu tư rất thấp: 55 triệu đ&ocirc; lại trở th&agrave;nh bom tấn duy nhất của h&atilde;ng n&agrave;y gia nhập c&acirc;u lạc bộ tỷ đ&ocirc; trong năm nay.</p>

<div class="VCSortableInPreviewMode active noCaption">
<div><a class="detail-img-lightbox" href="https://genknews.genkcdn.vn/2019/11/18/gjtgjtgj-1574051795721914694047.png" target="_blank" title=""><img alt="The Joker trở thành phim nhãn R đầu tiên trong lịch sử đạt doanh thu 1 tỷ đô - Ảnh 6." class="gif-content lightbox-content" id="img_fdcccae0-09bc-11ea-af91-25132ec0aed8" src="https://genknews.genkcdn.vn/thumb_w/640/2019/11/18/gjtgjtgj-1574051795721914694047.png" style="max-width:100%" title="The Joker trở thành phim nhãn R đầu tiên trong lịch sử đạt doanh thu 1 tỷ đô - Ảnh 6." /></a></div>

<div class="PhotoCMS_Caption">&nbsp;</div>
</div>

<p>Để so s&aacute;nh, ch&uacute;ng ta sẽ điểm qua 1 v&agrave;i bộ phim được kỳ vọng nhất của nh&agrave; Warner Bros trong năm 2019. Shazam! đ&atilde; kh&ocirc;ng thực sự tạo n&ecirc;n đột ph&aacute; với doanh thu 365 triệu, so với khoản kinh ph&iacute; 100 triệu. Godzilla: King of the Monsters (kinh ph&iacute; 170 triệu, doanh thu 386 triệu), Detective Pikachu (kinh ph&iacute; 150 triệu, doanh thu 432 triệu), IT Chapter Two (kinh ph&iacute; 91 triệu, doanh thu 466 triệu).&nbsp;</p>

<p>Tất cả những bộ phim n&agrave;y đều kh&ocirc;ng hề đạt được kỳ t&iacute;ch như Joker, d&ugrave; đ&oacute; mới l&agrave; những bộ phim được h&atilde;ng n&agrave;y kỳ vọng nhất về doanh thu ph&ograve;ng v&eacute; trong năm 2019. Kh&ocirc;ng chỉ thế, kinh ph&iacute; của Joker thậm ch&iacute; c&ograve;n thấp hơn rất nhiều.</p>

<div class="VCSortableInPreviewMode active">
<div><a class="detail-img-lightbox" href="https://genknews.genkcdn.vn/2019/11/18/dfbdfbfbf-1574053479351517052333.jpg" target="_blank" title="Shazam!, Godzilla: King of the Monsters, Detective Pikachu và IT Chapter Two đều không đạt được kỳ vọng của Warner Bros"><img alt="The Joker trở thành phim nhãn R đầu tiên trong lịch sử đạt doanh thu 1 tỷ đô - Ảnh 7." class="gif-content lightbox-content" id="img_ebfa6d50-09c0-11ea-bbad-d14ff1cfd25f" src="https://genknews.genkcdn.vn/thumb_w/640/2019/11/18/dfbdfbfbf-1574053479351517052333.jpg" style="max-width:100%" title="The Joker trở thành phim nhãn R đầu tiên trong lịch sử đạt doanh thu 1 tỷ đô - Ảnh 7." /></a></div>

<div class="PhotoCMS_Caption">
<p>Shazam!, Godzilla: King of the Monsters, Detective Pikachu v&agrave; IT Chapter Two đều kh&ocirc;ng đạt được kỳ vọng của Warner Bros</p>
</div>
</div>

<p>Do đ&oacute;, đ&acirc;y c&oacute; lẽ ch&iacute;nh l&agrave; 1 bước ngoặt rất lớn v&agrave; c&oacute; thể sẽ g&acirc;y ảnh hưởng tới hướng đi của 2 nh&agrave; DC - Marvel trong thời gian tới trong việc khai th&aacute;c chủ đề. Chắc hẳn, trong tương lai, những bộ phim với những hướng đi kh&aacute;c nhau sẽ được xuất xưởng v&agrave; đạt tới những th&agrave;nh c&ocirc;ng m&agrave; kh&ocirc;ng ai c&oacute; thể n&oacute;i trước.</p>
</div>
', 2019, NULL, NULL, NULL, NULL, NULL, NULL, 1708, CAST(N'2019-11-19 11:06:11.260' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, N'/Data/images/Movies/joker.jpg', N'Đây được coi là 1 phép màu, khi The Joker đã thực hiện được điều mà những bộ phim khác của hãng này trong năm nay đều không thể làm...')
INSERT [dbo].[News] ([NewsID], [Name], [Image], [Description], [Year], [Country], [MovieLink], [TrailerLink], [CategoryID], [Rate], [TrailerID], [Viewed], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [Tags], [ImageNews], [MoreDescription]) VALUES (11, N'10 địa danh nổi tiếng nước Nhật đã xuất hiện trong "Đứa Con Của Thời Tiết": Xúc động nhất là khi thấy Tiệm Cafe Truyện Tranh!', N'/Data/files/New%20Movie/poster_medium_24.jpg', N'<p><strong><em><a class="seo-suggest-link" href="http://kenh14.vn/weathering-with-you-2019.html" target="_blank" title="Weathering with You (2019) ">Weathering With You</a> (Đứa Con Của Thời Tiết) </em></strong>l&agrave; phim hoạt h&igrave;nh nổi tiếng của Nhật Bản ra mắt trong năm 2019 n&agrave;y. Phim xoay quanh c&acirc;u chuyện của cậu thiếu ni&ecirc;n 16 tuổi Hodaka v&agrave; c&ocirc; bạn Hina - người c&oacute; năng lực điều khiển thời tiết. Ngo&agrave;i lời khen ngợi về nội dung bộ phim cũng như th&ocirc;ng điệp truyền tải, Weathering With You c&ograve;n g&acirc;y ấn tượng với kh&aacute;n giả bằng những khung h&igrave;nh ch&acirc;n thật từng chi tiết. Ch&iacute;nh vị đạo diễn <a class="seo-suggest-link" href="http://kenh14.vn/shinkai-makoto.html" target="_blank" title="Shinkai Makoto ">Shinkai Makoto</a> đ&atilde; chọn ra 10 địa điểm ở Tokyo để mang hơi thở nước Nhật v&agrave;o trong bộ phim.</p>

<p><strong>1. Cửa h&agrave;ng Cafe Truyện Tranh ở Kabukicho</strong></p>

<p>Đoạn đầu phim, trong l&uacute;c nh&acirc;n vật nam ch&iacute;nh Hodaka bắt đầu t&igrave;m việc, cậu ở tạm những qu&aacute;n cafe truyện tranh ở Kabukicho. Đ&acirc;y l&agrave; nơi c&oacute; những căn ph&ograve;ng nhỏ ri&ecirc;ng cho từng vị kh&aacute;ch, trong gian ph&ograve;ng c&oacute; một chiếc m&aacute;y t&iacute;nh để truy cập internet. Ngo&agrave;i ra, kh&aacute;ch h&agrave;ng c&oacute; thể đặt đồ ăn hay đổ uống ở quầy lễ t&acirc;n, cũng như mượn truyện để mang v&agrave;o ph&ograve;ng v&agrave; thưởng thức.</p>

<div class="VCSortableInPreviewMode noCaption">
<div><a class="detail-img-lightbox" href="https://kenh14cdn.com/2019/9/9/photo-1-15680153338891081869432.jpg" target="_blank" title=""><img alt="10 địa danh nổi tiếng nước Nhật đã xuất hiện trong Đứa Con Của Thời Tiết: Xúc động nhất là khi thấy Tiệm Cafe Truyện Tranh! - Ảnh 1." class="lightbox-content" id="img_45d804d0-d2d6-11e9-bcd7-fdba928decad" src="https://kenh14cdn.com/thumb_w/620/2019/9/9/photo-1-15680153338891081869432.jpg" style="max-width:100%; width:100%" title="10 địa danh nổi tiếng nước Nhật đã xuất hiện trong Đứa Con Của Thời Tiết: Xúc động nhất là khi thấy Tiệm Cafe Truyện Tranh! - Ảnh 1." /></a></div>
</div>

<p>Qua hai bức h&igrave;nh (ở tr&ecirc;n l&agrave; trong phim, ở dưới l&agrave; ngo&agrave;i đời thật), ta c&oacute; thể thấy r&otilde; bộ phận mỹ thuật của bộ phim đ&atilde; t&aacute;i hiện lại khung cảnh n&agrave;y xuất sắc đến thế n&agrave;o. Những chi tiết như trần nh&agrave;, c&aacute;c poster đều được vẽ lại giống hệt như thật. Cả biển hiệu v&agrave; t&ecirc;n qu&aacute;n cafe cũng được giữ nguy&ecirc;n.</p>

<p><strong>2. Cửa h&agrave;ng McDonald&rsquo;s ở Shinjuku</strong></p>

<p>1/3 khoảng thời gian đầu bộ phim, bối cảnh đều chỉ xoay quanh khu Shinjuku nổi tiếng nhộn nhịp v&agrave; tập nập nhất Tokyo. Hodaka gặp Hina lần đầu ti&ecirc;n tại cửa h&agrave;ng ăn nhanh, được c&ocirc; tặng một chiếc b&aacute;nh burger thật bự sau 3 ng&agrave;y kh&ocirc;ng c&oacute; g&igrave; để ăn.</p>

<div class="VCSortableInPreviewMode noCaption">
<div><a class="detail-img-lightbox" href="https://kenh14cdn.com/2019/9/9/photo-2-1568015333892709235949.jpg" target="_blank" title=""><img alt="10 địa danh nổi tiếng nước Nhật đã xuất hiện trong Đứa Con Của Thời Tiết: Xúc động nhất là khi thấy Tiệm Cafe Truyện Tranh! - Ảnh 2." class="lightbox-content" id="img_45ba6ab0-d2d6-11e9-807c-bd389255c07e" src="https://kenh14cdn.com/thumb_w/620/2019/9/9/photo-2-1568015333892709235949.jpg" style="max-width:100%; width:100%" title="10 địa danh nổi tiếng nước Nhật đã xuất hiện trong Đứa Con Của Thời Tiết: Xúc động nhất là khi thấy Tiệm Cafe Truyện Tranh! - Ảnh 2." /></a></div>
</div>

<p>Ở đời thực cũng c&oacute; một cửa h&agrave;ng burger lớn ở khu Kabukicho như thế n&agrave;y. Những kh&aacute;n giả đ&atilde; xem Weathering With You hẳn sẽ thấy thật quen mắt.</p>

<p><strong>3. Những con đường quanh khu Kabukicho</strong></p>

<p>Hodaka cứu Hina khỏi những người tới từ c&acirc;u lạc bộ người lớn. Hai c&ocirc; cậu nằm tay nhau chạy qua rất nhiều những con đường c&oacute; thật ở Tokyo.</p>

<div class="VCSortableInPreviewMode noCaption">
<div><a class="detail-img-lightbox" href="https://kenh14cdn.com/2019/9/9/photo-3-15680153338941976062512.jpg" target="_blank" title=""><img alt="10 địa danh nổi tiếng nước Nhật đã xuất hiện trong Đứa Con Của Thời Tiết: Xúc động nhất là khi thấy Tiệm Cafe Truyện Tranh! - Ảnh 3." class="lightbox-content" id="img_45f32df0-d2d6-11e9-aed3-bfd12d14686d" src="https://kenh14cdn.com/thumb_w/620/2019/9/9/photo-3-15680153338941976062512.jpg" style="max-width:100%; width:100%" title="10 địa danh nổi tiếng nước Nhật đã xuất hiện trong Đứa Con Của Thời Tiết: Xúc động nhất là khi thấy Tiệm Cafe Truyện Tranh! - Ảnh 3." /></a></div>
</div>

<div class="VCSortableInPreviewMode noCaption">
<div><a class="detail-img-lightbox" href="https://kenh14cdn.com/2019/9/9/photo-4-1568015333896785000951.jpg" target="_blank" title=""><img alt="10 địa danh nổi tiếng nước Nhật đã xuất hiện trong Đứa Con Của Thời Tiết: Xúc động nhất là khi thấy Tiệm Cafe Truyện Tranh! - Ảnh 4." class="lightbox-content" id="img_45d87a00-d2d6-11e9-aed3-bfd12d14686d" src="https://kenh14cdn.com/thumb_w/620/2019/9/9/photo-4-1568015333896785000951.jpg" style="max-width:100%; width:100%" title="10 địa danh nổi tiếng nước Nhật đã xuất hiện trong Đứa Con Của Thời Tiết: Xúc động nhất là khi thấy Tiệm Cafe Truyện Tranh! - Ảnh 4." /></a></div>
</div>

<p><strong>4. Nơi ở của Hokada tại Tokyo</strong></p>

<p>Sau nhiều ng&agrave;y lang thang vạ vật khắp Shinjuku, cuối c&ugrave;ng Hodaka cũng được nhận v&agrave;o l&agrave;m tại C&ocirc;ng ty K&amp;A của Suga Keisuke. Đ&oacute; l&agrave; một căn nh&agrave; nhỏ, thấp hơn đường đi, mỗi khi mưa th&igrave; nh&agrave; sẽ ngập. Ở gần cổng ra B1 của ga Kagurazaka cũng c&oacute; một căn nh&agrave; giống như vậy.</p>

<div class="VCSortableInPreviewMode noCaption">
<div><a class="detail-img-lightbox" href="https://kenh14cdn.com/2019/9/9/photo-5-15680153338981273898560.jpg" target="_blank" title=""><img alt="10 địa danh nổi tiếng nước Nhật đã xuất hiện trong Đứa Con Của Thời Tiết: Xúc động nhất là khi thấy Tiệm Cafe Truyện Tranh! - Ảnh 5." class="lightbox-content" id="img_460640c0-d2d6-11e9-9e90-7d47d13ef121" src="https://kenh14cdn.com/thumb_w/620/2019/9/9/photo-5-15680153338981273898560.jpg" style="max-width:100%; width:100%" title="10 địa danh nổi tiếng nước Nhật đã xuất hiện trong Đứa Con Của Thời Tiết: Xúc động nhất là khi thấy Tiệm Cafe Truyện Tranh! - Ảnh 5." /></a></div>
</div>

<div class="VCSortableInPreviewMode noCaption">
<div><a class="detail-img-lightbox" href="https://kenh14cdn.com/2019/9/9/photo-6-1568015333900246470643.jpg" target="_blank" title=""><img alt="10 địa danh nổi tiếng nước Nhật đã xuất hiện trong Đứa Con Của Thời Tiết: Xúc động nhất là khi thấy Tiệm Cafe Truyện Tranh! - Ảnh 6." class="lightbox-content" id="img_45f047c0-d2d6-11e9-b5d4-6768738cdfdb" src="https://kenh14cdn.com/thumb_w/620/2019/9/9/photo-6-1568015333900246470643.jpg" style="max-width:100%; width:100%" title="10 địa danh nổi tiếng nước Nhật đã xuất hiện trong Đứa Con Của Thời Tiết: Xúc động nhất là khi thấy Tiệm Cafe Truyện Tranh! - Ảnh 6." /></a></div>
</div>

<p>Mặc d&ugrave; tr&ocirc;ng kh&aacute;c so với trong phim, nhưng con đường quanh ng&ocirc;i nh&agrave; đ&atilde; chứng minh rằng bộ phim lấy cảm hứng từ nơi n&agrave;y.</p>

<p><strong>5. C&ocirc;ng vi&ecirc;n Minatokushiba</strong></p>

<p>Một đoạn ngắn trong phim đ&atilde; diễn ra tại C&ocirc;ng vi&ecirc;n Minatokushiba, nơi c&oacute; h&agrave;ng ghế đỏ v&agrave; những bụi c&acirc;y xanh mướt sau lưng.</p>

<div class="VCSortableInPreviewMode noCaption">
<div><a class="detail-img-lightbox" href="https://kenh14cdn.com/2019/9/9/photo-7-15680153339022090065020.jpg" target="_blank" title=""><img alt="10 địa danh nổi tiếng nước Nhật đã xuất hiện trong Đứa Con Của Thời Tiết: Xúc động nhất là khi thấy Tiệm Cafe Truyện Tranh! - Ảnh 7." class="lightbox-content" id="img_461c87e0-d2d6-11e9-8158-19ad59788475" src="https://kenh14cdn.com/thumb_w/620/2019/9/9/photo-7-15680153339022090065020.jpg" style="max-width:100%; width:100%" title="10 địa danh nổi tiếng nước Nhật đã xuất hiện trong Đứa Con Của Thời Tiết: Xúc động nhất là khi thấy Tiệm Cafe Truyện Tranh! - Ảnh 7." /></a></div>
</div>

<p>Ba nh&acirc;n vật ngồi tr&ecirc;n ghế lần lượt từ tr&aacute;i qua phải l&agrave; Hodaka, Keisuke v&agrave; Hina. C&ocirc;ng vi&ecirc;n n&agrave;y ở khu Shibakuen trong l&agrave;nh với rất nhiều c&acirc;y cối, thuộc Minato, Tokyo.</p>

<p><strong>6. Giao lộ Shibuya</strong></p>

<p>Đ&acirc;y c&oacute; lẽ l&agrave; địa điểm nổi tiếng nhất đất nước Mặt Trời Mọc. Giao lộ Shibuya rộng lớn với nhiều l&agrave;n đường, nhiều biển quảng c&aacute;o treo tr&ecirc;n c&aacute;c to&agrave; nh&agrave; lớn.</p>

<div class="clearfix wp100" id="admzone474524">&nbsp;</div>

<div class="VCSortableInPreviewMode active noCaption">
<div><a class="detail-img-lightbox" href="https://kenh14cdn.com/2019/9/9/photo-8-15680153339051962070071.jpg" target="_blank" title=""><img alt="10 địa danh nổi tiếng nước Nhật đã xuất hiện trong Đứa Con Của Thời Tiết: Xúc động nhất là khi thấy Tiệm Cafe Truyện Tranh! - Ảnh 8." class="lightbox-content" id="img_4645bac0-d2d6-11e9-a398-abcb7924eccc" src="https://kenh14cdn.com/thumb_w/620/2019/9/9/photo-8-15680153339051962070071.jpg" style="max-width:100%; width:100%" title="10 địa danh nổi tiếng nước Nhật đã xuất hiện trong Đứa Con Của Thời Tiết: Xúc động nhất là khi thấy Tiệm Cafe Truyện Tranh! - Ảnh 8." /></a></div>
</div>

<p>Địa điểm n&agrave;y kh&ocirc;ng chỉ xuất hiện trong bộ phim hoạt h&igrave;nh, m&agrave; c&oacute; trong những t&aacute;c phẩm người đ&oacute;ng, l&agrave; một trong những biểu tượng đặc trưng nhất của thủ đ&ocirc; Tokyo.</p>

<p><strong>7. Đ&agrave;i Quan S&aacute;t tr&ecirc;n Roppongi Hills</strong></p>

<p>Đ&agrave;i Quan S&aacute;t nằm tr&ecirc;n tầng cao nhất của to&agrave; nh&agrave; Roppongi Hills l&agrave; nơi Hina đ&atilde; đứng để cầu nguyện &aacute;nh nắng rọi xuống cả th&agrave;nh phố đang ch&igrave;m trong những cơn mưa bất tận.</p>

<div class="VCSortableInPreviewMode active noCaption">
<div><a class="detail-img-lightbox" href="https://kenh14cdn.com/2019/9/9/photo-9-1568015333908609638327.jpg" target="_blank" title=""><img alt="10 địa danh nổi tiếng nước Nhật đã xuất hiện trong Đứa Con Của Thời Tiết: Xúc động nhất là khi thấy Tiệm Cafe Truyện Tranh! - Ảnh 9." class="lightbox-content" id="img_461beba0-d2d6-11e9-bf01-119b9cc86c97" src="https://kenh14cdn.com/thumb_w/620/2019/9/9/photo-9-1568015333908609638327.jpg" style="max-width:100%; width:100%" title="10 địa danh nổi tiếng nước Nhật đã xuất hiện trong Đứa Con Của Thời Tiết: Xúc động nhất là khi thấy Tiệm Cafe Truyện Tranh! - Ảnh 9." /></a></div>
</div>

<div class="VCSortableInPreviewMode active noCaption">
<div><a class="detail-img-lightbox" href="https://kenh14cdn.com/2019/9/9/photo-10-1568015333909841009251.jpg" target="_blank" title=""><img alt="10 địa danh nổi tiếng nước Nhật đã xuất hiện trong Đứa Con Của Thời Tiết: Xúc động nhất là khi thấy Tiệm Cafe Truyện Tranh! - Ảnh 10." class="lightbox-content" id="img_46532840-d2d6-11e9-8158-19ad59788475" src="https://kenh14cdn.com/thumb_w/620/2019/9/9/photo-10-1568015333909841009251.jpg" style="max-width:100%; width:100%" title="10 địa danh nổi tiếng nước Nhật đã xuất hiện trong Đứa Con Của Thời Tiết: Xúc động nhất là khi thấy Tiệm Cafe Truyện Tranh! - Ảnh 10." /></a></div>
</div>

<p>C&aacute;c hoạ sĩ của Weathering With You đ&atilde; xuất sắc t&aacute;i hiện lại khung h&igrave;nh của th&agrave;nh phố Tokyo rộng lớn v&agrave;o bộ phim. Ở một g&oacute;c nh&igrave;n kh&aacute;c, kh&aacute;n giả c&ograve;n c&oacute; thể thấy cả th&aacute;p truyền h&igrave;nh cao nhất Tokyo.</p>

<p><strong>8. Căn nh&agrave; hoang nơi kết nối với bầu trời</strong></p>

<p>Trong bộ phim, Hina đ&atilde; đưa Hodaka tới s&acirc;n thượng của căn nh&agrave; hoang gần ga Yoyogi. Tr&ecirc;n đ&acirc;y c&oacute; c&aacute;nh cổng lớn, bước qua đ&oacute; sẽ tới một thế giới xa lạ. Nhờ c&aacute;nh cổng n&agrave;y, Hina đ&atilde; c&oacute; một sức mạnh kỳ lạ, vừa quyền năng m&agrave; cũng rất nguy hiểm. Cuối phim, cũng tại nơi n&agrave;y, Hodaka đ&atilde; t&igrave;m được Hina sau khi c&ocirc; tự &quot;hiến tế&quot; m&igrave;nh cho bầu trời.</p>

<div class="VCSortableInPreviewMode noCaption">
<div><a class="detail-img-lightbox" href="https://kenh14cdn.com/2019/9/9/photo-11-1568015333911181463700.jpg" target="_blank" title=""><img alt="10 địa danh nổi tiếng nước Nhật đã xuất hiện trong Đứa Con Của Thời Tiết: Xúc động nhất là khi thấy Tiệm Cafe Truyện Tranh! - Ảnh 11." class="lightbox-content" id="img_46659ed0-d2d6-11e9-a773-8921603dae92" src="https://kenh14cdn.com/thumb_w/620/2019/9/9/photo-11-1568015333911181463700.jpg" style="max-width:100%; width:100%" title="10 địa danh nổi tiếng nước Nhật đã xuất hiện trong Đứa Con Của Thời Tiết: Xúc động nhất là khi thấy Tiệm Cafe Truyện Tranh! - Ảnh 11." /></a></div>
</div>

<div class="VCSortableInPreviewMode noCaption">
<div><a class="detail-img-lightbox" href="https://kenh14cdn.com/2019/9/9/photo-12-1568015333914910522892.jpg" target="_blank" title=""><img alt="10 địa danh nổi tiếng nước Nhật đã xuất hiện trong Đứa Con Của Thời Tiết: Xúc động nhất là khi thấy Tiệm Cafe Truyện Tranh! - Ảnh 12." class="lightbox-content" id="img_4635dc40-d2d6-11e9-b1d5-9936ce09ee2b" src="https://kenh14cdn.com/thumb_w/620/2019/9/9/photo-12-1568015333914910522892.jpg" style="max-width:100%; width:100%" title="10 địa danh nổi tiếng nước Nhật đã xuất hiện trong Đứa Con Của Thời Tiết: Xúc động nhất là khi thấy Tiệm Cafe Truyện Tranh! - Ảnh 12." /></a></div>
</div>

<p>Tới thời điểm n&agrave;y, căn nh&agrave; hoang trong phim đ&atilde; bị ph&aacute; dỡ. Thay v&agrave;o đ&oacute;, bạn c&oacute; thể tới địa điểm thứ 9 cũng rất gần ga Yoyogi dưới đ&acirc;y.</p>

<p><strong>9. Con đường với d&atilde;y h&agrave;ng r&agrave;o thật d&agrave;i</strong></p>

<p>Đ&acirc;y c&oacute; thể coi l&agrave; bối cảnh mang tới nhiều cảm x&uacute;c nhất trong bộ phim &ndash; con đường nơi Hodaka định sẽ tỏ t&igrave;nh với Hina nhưng bất th&agrave;nh, cũng l&agrave; nơi đầu ti&ecirc;n hai nh&acirc;n vật ch&iacute;nh gặp lại sau 3 năm xa c&aacute;ch.</p>

<div class="VCSortableInPreviewMode active noCaption">
<div><a class="detail-img-lightbox" href="https://kenh14cdn.com/2019/9/9/photo-13-156801533391644548320.jpg" target="_blank" title=""><img alt="10 địa danh nổi tiếng nước Nhật đã xuất hiện trong Đứa Con Của Thời Tiết: Xúc động nhất là khi thấy Tiệm Cafe Truyện Tranh! - Ảnh 13." class="lightbox-content" id="img_46a232a0-d2d6-11e9-a773-8921603dae92" src="https://kenh14cdn.com/thumb_w/620/2019/9/9/photo-13-156801533391644548320.jpg" style="max-width:100%; width:100%" title="10 địa danh nổi tiếng nước Nhật đã xuất hiện trong Đứa Con Của Thời Tiết: Xúc động nhất là khi thấy Tiệm Cafe Truyện Tranh! - Ảnh 13." /></a></div>
</div>

<div class="VCSortableInPreviewMode active noCaption">
<div><a class="detail-img-lightbox" href="https://kenh14cdn.com/2019/9/9/photo-14-1568015333918485497911.jpg" target="_blank" title=""><img alt="10 địa danh nổi tiếng nước Nhật đã xuất hiện trong Đứa Con Của Thời Tiết: Xúc động nhất là khi thấy Tiệm Cafe Truyện Tranh! - Ảnh 14." class="lightbox-content" id="img_468cd5e0-d2d6-11e9-a115-49686bc75042" src="https://kenh14cdn.com/thumb_w/620/2019/9/9/photo-14-1568015333918485497911.jpg" style="max-width:100%; width:100%" title="10 địa danh nổi tiếng nước Nhật đã xuất hiện trong Đứa Con Của Thời Tiết: Xúc động nhất là khi thấy Tiệm Cafe Truyện Tranh! - Ảnh 14." /></a></div>
</div>

<p>Ở ngo&agrave;i đời, đ&oacute; l&agrave; con đường nằm sau to&agrave; nh&agrave; Yoyogi. Bạn c&oacute; thể bắt t&agrave;u chạy tới ga Tabata, t&igrave;m ra ở Cửa Đ&ocirc;ng v&agrave; đi bộ khoảng 30 gi&acirc;y l&agrave; tới.</p>

<p><strong>10. Con dốc Nozomi</strong></p>

<p>Một địa điếm tho&aacute;ng qua kh&aacute;c trong Weathering With You cũng được kh&aacute;n giả nh&acirc;n ra, đ&oacute; ch&iacute;nh l&agrave; con dốc Nozomi. Mặc d&ugrave; kh&ocirc;ng c&oacute; nh&acirc;n vật n&agrave;o đi ngang qua đ&acirc;y, nhưng địa điểm n&agrave;y cũng được vẽ lại một c&aacute;ch ho&agrave;n hảo. Rất kh&oacute; để nhận ra điểm kh&aacute;c biệt giữa hai tấm h&igrave;nh dưới đ&acirc;y.</p>

<div class="VCSortableInPreviewMode active noCaption">
<div><a class="detail-img-lightbox" href="https://kenh14cdn.com/2019/9/9/photo-15-1568015333922194557998.jpg" target="_blank" title=""><img alt="10 địa danh nổi tiếng nước Nhật đã xuất hiện trong Đứa Con Của Thời Tiết: Xúc động nhất là khi thấy Tiệm Cafe Truyện Tranh! - Ảnh 15." class="lightbox-content" id="img_46a82610-d2d6-11e9-a5e1-adeedd761b31" src="https://kenh14cdn.com/thumb_w/620/2019/9/9/photo-15-1568015333922194557998.jpg" style="max-width:100%; width:100%" title="10 địa danh nổi tiếng nước Nhật đã xuất hiện trong Đứa Con Của Thời Tiết: Xúc động nhất là khi thấy Tiệm Cafe Truyện Tranh! - Ảnh 15." /></a></div>
</div>

<p>Bạn c&oacute; thể đi tới đ&acirc;y từ ga Kishibojimmae hoặc ga Zoshigaya.</p>
', 2019, NULL, NULL, NULL, NULL, NULL, NULL, 107, CAST(N'2019-11-19 11:09:37.737' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, N'/Data/files/New%20Movie/poster_medium_24.jpg', N'Weathering With You (Đứa Con Của Thời Tiết) là phim hoạt hình nổi tiếng của Nhật Bản ra mắt trong năm 2019 này. Phim xoay quanh...')
INSERT [dbo].[News] ([NewsID], [Name], [Image], [Description], [Year], [Country], [MovieLink], [TrailerLink], [CategoryID], [Rate], [TrailerID], [Viewed], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [Tags], [ImageNews], [MoreDescription]) VALUES (12, N'Đúng 10 năm Robert Downey Jr lại nhọ một lần: Tượng vàng Oscar lẽ nào về tay Joker ?', N'/Data/files/ironman.jpg', N'<h2>V&agrave;o năm 2009, Robert Downey Jr từng để vuột tượng v&agrave;ng Oscar về tay Joker phi&ecirc;n bản Heath Ledger.</h2>

<div class="knc-content">
<p><a class="seo-suggest-link" href="http://kenh14.vn/disneyland.html" target="_blank" title="Disneyland ">Disney</a> c&oacute; lẽ sẽ phải nỗ lực rất nhiều để tạo ra một bước &quot;chơi lớn&quot; gi&uacute;p <a class="seo-suggest-link" href="http://kenh14.vn/robert-downey-jr.html" target="_blank" title="robert downey jr.">Robert Downey Jr.</a> c&oacute; thể nhận được đề cử <a class="seo-suggest-link" href="http://kenh14.vn/oscar.html" target="_blank" title="oscar">Oscar</a> cho hạng mục <a class="seo-suggest-link" href="http://kenh14.vn/best-actor.html" target="_blank" title="Best Actor ">Best Actor</a> (Nam diễn vi&ecirc;n xuất sắc nhất) với m&agrave;n tr&igrave;nh diễn trong phim <a class="seo-suggest-link" href="http://kenh14.vn/avengers-endgame.html" target="_blank" title="avengers: endgame">Avengers: Endgame</a> (Avengers: Hồi Kết), bởi lẽ anh đang phải đối đầu với một đối thủ nặng k&yacute; kh&aacute;c l&agrave; nam diễn vi&ecirc;n <a class="seo-suggest-link" href="http://kenh14.vn/joaquin-phoenix.html" target="_blank" title="Joaquin Phoenix ">Joaquin Phoenix</a> của <a class="seo-suggest-link" href="http://kenh14.vn/joker.html" target="_blank" title="Joker ">Joker</a> (G&atilde; Hề). Kết quả c&ocirc;ng bố đề cử giải Oscar đang r&uacute;t ngắn dần thời gian, cả Disney v&agrave; <a class="seo-suggest-link" href="http://kenh14.vn/warner-bros.html" target="_blank" title="Warner Bros. ">Warner Bros</a> c&oacute; lẽ đều đang phải &quot;vắt ch&acirc;n l&ecirc;n cổ&quot; để tung ra chiến dịch nhằm đem lại chiến thắng cho bộ phim truyện tranh của m&igrave;nh.</p>

<div class="VCSortableInPreviewMode">
<div><img alt="Đúng 10 năm Robert Downey Jr lại nhọ một lần: Tượng vàng Oscar lẽ nào về tay Joker ? - Ảnh 1." id="img_f3bdaf10-0872-11ea-8021-ef3a8c1c6b53" src="https://kenh14cdn.com/thumb_w/660/2019/11/16/joker-movie-mcu-1573910036999565815651.jpg" style="max-width:100%" title="Đúng 10 năm Robert Downey Jr lại nhọ một lần: Tượng vàng Oscar lẽ nào về tay Joker ? - Ảnh 1." /></div>

<div class="PhotoCMS_Caption" style="margin-bottom:0px; margin-left:0px; margin-right:0px; margin-top:0px; width:565px">
<p>Đường đua kh&ocirc;ng nể nang giữa nh&agrave; DC v&agrave; <a class="seo-suggest-link" href="http://kenh14.vn/marvel.html" target="_blank" title="marvel">Marvel</a></p>
</div>
</div>

<div class="GifPhoto VCSortableInPreviewMode noCaption">
<div><img alt="Đúng 10 năm Robert Downey Jr lại nhọ một lần: Tượng vàng Oscar lẽ nào về tay Joker ? - Ảnh 2." id="img_2932b900-0874-11ea-9c28-6735c1160aa3" src="https://kenh14cdn.com/2019/11/16/anigifsub-buzz-462-1563899680-1-15739105563191090772191.gif" style="max-width:100%" title="Đúng 10 năm Robert Downey Jr lại nhọ một lần: Tượng vàng Oscar lẽ nào về tay Joker ? - Ảnh 2." /></div>
</div>

<p>Avengers: Endgame l&agrave; sự kiện điện ảnh lớn nhất năm 2019, đ&aacute;nh dấu sự kết th&uacute;c của một số Avengers gốc (như Captain America, Black Widow v&agrave; <a class="seo-suggest-link" href="http://kenh14.vn/iron-man.html" target="_blank" title="Iron Man ">Iron Man</a>) v&agrave; đ&atilde; c&oacute; một trận chiến được cho l&agrave; m&atilde;n nh&atilde;n nhất từ trước đến nay trong c&aacute;c phim si&ecirc;u anh h&ugrave;ng. Mặt kh&aacute;c, Joker 2019 l&agrave; một trong những phi&ecirc;n bản được mong đợi nhất trong năm với Joaquin Phoenix thủ vai ch&iacute;nh g&atilde; hề. Kh&ocirc;ng giống như Avengers: Endgame, Joker kh&ocirc;ng phải l&agrave; một phần của vũ trụ điện ảnh nổi tiếng nhưng bộ phim đ&atilde; chứng tỏ m&igrave;nh vẫn ho&agrave;n to&agrave;n c&oacute; sức h&uacute;t đủ lớn v&agrave; c&oacute; thể dễ d&agrave;ng gi&agrave;nh được một vị tr&iacute; trong c&aacute;c đề cử Oscar năm 2020. Nhiều khả năng Joaquin Phoenix c&oacute; thể gặp Tony Stark v&agrave; lấy giải Oscar khỏi người h&ugrave;ng của Marvel.</p>

<div class="VCSortableInPreviewMode noCaption">
<div><img alt="Đúng 10 năm Robert Downey Jr lại nhọ một lần: Tượng vàng Oscar lẽ nào về tay Joker ? - Ảnh 3." id="img_1232ecd0-0873-11ea-8021-ef3a8c1c6b53" src="https://kenh14cdn.com/thumb_w/660/2019/11/16/joker-and-marvel-avengers-movies-15739100883591927499525.jpg" style="max-width:100%" title="Đúng 10 năm Robert Downey Jr lại nhọ một lần: Tượng vàng Oscar lẽ nào về tay Joker ? - Ảnh 3." /></div>
</div>

<div class="GifPhoto VCSortableInPreviewMode noCaption">
<div><img alt="Đúng 10 năm Robert Downey Jr lại nhọ một lần: Tượng vàng Oscar lẽ nào về tay Joker ? - Ảnh 4." id="img_43a58150-0874-11ea-9ea3-37e9fb1c7a0a" src="https://kenh14cdn.com/2019/11/16/joaquin-phoenix-as-arthur-fleck-joker-in-joker-2019-joker-2019-42984763-540-400-1573910599062812865487.gif" style="max-width:100%" title="Đúng 10 năm Robert Downey Jr lại nhọ một lần: Tượng vàng Oscar lẽ nào về tay Joker ? - Ảnh 4." /></div>
</div>

<p>Chiến dịch Oscar của Disney gần như chắc chắn sẽ bao gồm những h&agrave;nh động nhằm đảm bảo một đề cử cho vai diễn Người sắt của Robert Downey Jr. trong Avengers: Endgame. Mặc d&ugrave; diễn xuất của Downey l&agrave; rất chắc chắn v&agrave; mang lại nhiều cảm x&uacute;c trong phim, Viện H&agrave;n l&acirc;m từ xưa đến nay kh&ocirc;ng ho&agrave;n to&agrave;n th&iacute;ch phim si&ecirc;u anh h&ugrave;ng, tuy nhi&ecirc;n vẫn c&oacute; thể Downey sẽ chỉ dừng lại ở việc được đề cử. Mặt kh&aacute;c, Joker c&oacute; cơ hội tuyệt vời để Joaquin Phoenix được đề cử Oscar cho Nam diễn vi&ecirc;n xuất sắc nhất. Giả sử cả hai l&agrave;m được điều đ&oacute;, Phoenix rất c&oacute; thể sẽ đưa Oscar về nh&agrave;, v&agrave; đ&acirc;y sẽ l&agrave; lần thua thứ hai của Robert Downey Jr. trước một Joker.</p>

<div class="VCSortableInPreviewMode">
<div><img alt="Đúng 10 năm Robert Downey Jr lại nhọ một lần: Tượng vàng Oscar lẽ nào về tay Joker ? - Ảnh 5." id="img_2e108fc0-0873-11ea-bf17-8bebcf0658e8" src="https://kenh14cdn.com/2019/11/16/marvel-joker-bia-1-15739101357181566002574.jpg" style="max-width:100%" title="Đúng 10 năm Robert Downey Jr lại nhọ một lần: Tượng vàng Oscar lẽ nào về tay Joker ? - Ảnh 5." /></div>

<div class="PhotoCMS_Caption" style="margin-bottom:0px; margin-left:0px; margin-right:0px; margin-top:0px; width:500px">
<p>Robert Downey Jr. v&agrave; Joaquin Phoenix</p>
</div>
</div>

<div class="VCSortableInPreviewMode">
<div><img alt="Đúng 10 năm Robert Downey Jr lại nhọ một lần: Tượng vàng Oscar lẽ nào về tay Joker ? - Ảnh 6." id="img_4d6b2470-0873-11ea-9114-3f4eb0b2dbe8" src="https://kenh14cdn.com/thumb_w/660/2019/11/16/tdk-10thannivintro-e1531936198918-15739101846701623867258.jpg" style="max-width:100%" title="Đúng 10 năm Robert Downey Jr lại nhọ một lần: Tượng vàng Oscar lẽ nào về tay Joker ? - Ảnh 6." /></div>

<div class="PhotoCMS_Caption" style="margin-bottom:0px; margin-left:0px; margin-right:0px; margin-top:0px; width:565px">
<p><a class="seo-suggest-link" href="http://kenh14.vn/heath-ledger.html" target="_blank" title="heath ledger ">Heath Ledger</a> v&agrave; Robert Downey Jr.</p>
</div>
</div>

<p>V&agrave;o năm 2009, Downey được đề cử Nam diễn vi&ecirc;n phụ xuất sắc nhất cho vai Kirk Lazarus trong phim Thunder Thunder, v&agrave; thua &quot;cựu&quot; Joker l&agrave; Heath Ledger của <a class="seo-suggest-link" href="http://kenh14.vn/the-dark-knight.html" target="_blank" title="the dark knight">The Dark Knight</a>. Cũng c&ugrave;ng năm n&agrave;y, Downey Jr v&agrave; vai diễn Người Sắt ra mắt MCU. Đề cử Oscar đầu ti&ecirc;n của Downey l&agrave; v&agrave;o năm 1993 khi anh được đề cử Nam diễn vi&ecirc;n ch&iacute;nh xuất sắc nhất cho vai diễn Charlie Chaplin trong Chaplin - anh đ&atilde; thua Al Pacino trong vai Trung t&aacute; Frank Slade của Scent of a Woman. Mặt kh&aacute;c, Joaquin Phoenix đ&atilde; được đề cử ba lần: lần đầu ti&ecirc;n v&agrave;o năm 2001 cho Gladiator, sau đ&oacute; v&agrave;o năm 2006 cho Walk the Line v&agrave; v&agrave;o năm 2013 cho The Master.</p>

<div class="VCSortableInPreviewMode">
<div><img alt="Đúng 10 năm Robert Downey Jr lại nhọ một lần: Tượng vàng Oscar lẽ nào về tay Joker ? - Ảnh 7." id="img_96a3a630-0873-11ea-a766-5ff8a72a797b" src="https://kenh14cdn.com/thumb_w/660/2019/11/16/chaplin-1992-robert-downey-jr-biography-1024x576-15739103049911808384427.jpg" style="max-width:100%" title="Đúng 10 năm Robert Downey Jr lại nhọ một lần: Tượng vàng Oscar lẽ nào về tay Joker ? - Ảnh 7." /></div>

<div class="PhotoCMS_Caption" style="margin-bottom:0px; margin-left:0px; margin-right:0px; margin-top:0px; width:565px">
<p>Vai diễn Charlie Chaplin của Robert Downey Jr. mang lại cho nam diễn vi&ecirc;n đề cử Oscar đầu ti&ecirc;n</p>
</div>
</div>

<div class="VCSortableInPreviewMode">
<div><img alt="Đúng 10 năm Robert Downey Jr lại nhọ một lần: Tượng vàng Oscar lẽ nào về tay Joker ? - Ảnh 8." id="img_de16d140-0873-11ea-89ac-d5c0e919c4ea" src="https://kenh14cdn.com/thumb_w/660/2019/11/16/the-master-joaquin-phoenix-sailor-15739104297351193691442.jpeg" style="max-width:100%" title="Đúng 10 năm Robert Downey Jr lại nhọ một lần: Tượng vàng Oscar lẽ nào về tay Joker ? - Ảnh 8." /></div>

<div class="PhotoCMS_Caption" style="margin-bottom:0px; margin-left:0px; margin-right:0px; margin-top:0px; width:565px">
<p>Bộ phim The Master 2013 gi&uacute;p Joaquin Phoenix nhận được đề cử Oscar lần thứ 3</p>
</div>
</div>

<p>Joaquin Phoenix từng gi&agrave;nh được Giải thưởng H&agrave;n l&acirc;m đầu ti&ecirc;n của m&igrave;nh nhờ Joker. Bộ phim đ&atilde; mang về giải thưởng Sư tử v&agrave;ng cao qu&yacute; của <a class="seo-suggest-link" href="http://kenh14.vn/lien-hoan-phim-venice.html" target="_blank" title="Liên hoan phim Venice ">Li&ecirc;n hoan phim Venice</a> 2019. Mọi thứ c&oacute; vẻ đang bất lợi cho Robert Downey Jr., nếu lịch sử thua một Joker kh&aacute;c được lặp lại th&igrave; c&aacute;c fan của Marvel sẽ rất buồn, tuy nhi&ecirc;n Viện H&agrave;n l&acirc;m cũng đ&atilde; qu&aacute; quen với việc phim si&ecirc;u anh h&ugrave;ng từ xưa đến nay th&igrave; kh&oacute; m&agrave; gi&agrave;nh được giải thưởng h&agrave;n l&acirc;m. Hiện tại, kh&aacute;n giả chỉ c&oacute; thể biết chờ đợi, ki&ecirc;n nhẫn xem hai nam diễn vi&ecirc;n c&oacute; được đề cử kh&ocirc;ng, m&agrave; c&oacute; lẽ l&agrave; hy vọng sẽ được đặt nhiều hơn v&agrave;o Joaquin Phoenix chứ kh&ocirc;ng phải Robert Downey Jr.</p>
</div>
', 2019, NULL, NULL, NULL, NULL, NULL, NULL, 1004, CAST(N'2019-11-19 11:11:36.037' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, N'/Data/files/ironman.jpg', N'Vào năm 2009, Robert Downey Jr từng để vuột tượng vàng Oscar về tay Joker phiên bản Heath Ledger...')
SET IDENTITY_INSERT [dbo].[News] OFF
SET IDENTITY_INSERT [dbo].[Permission] ON 

INSERT [dbo].[Permission] ([ID], [Name]) VALUES (1, N'admin                                             ')
INSERT [dbo].[Permission] ([ID], [Name]) VALUES (4, N'user                                              ')
SET IDENTITY_INSERT [dbo].[Permission] OFF
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'ADD_USER', N'Thêm user')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'DELETE_USER', N'Xoá user')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'EDIT_USER', N'Sửa user')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'VIEW_USER', N'Xem danh sách')
SET IDENTITY_INSERT [dbo].[Slide] ON 

INSERT [dbo].[Slide] ([SlideID], [Name], [Description], [Image], [Url], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1, N'Kỷ Băng Hà 4: Lục Địa Trôi Dạt', N'Đây là phần 4 của loạt phim đuộc đánh giá là một trong loạt phim hoạt hình được yêu thích và thành công nhất mọi thời đại. Trong phần này nhóm bạn Manny (voi ma-mút), Diego (hổ răng kiếm) và Sid (lười tiền sử) sẽ đối mặt với những thử thách mới do các lục địa bị trôi dạt sau trận Đại hồng thủy...', N'/Data/images/slide/6.jpg', N'http://www.phimmoi.net/phim/ky-bang-ha-4-luc-dia-troi-dat-69/', CAST(N'2019-10-31 08:28:50.033' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Slide] ([SlideID], [Name], [Description], [Image], [Url], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2, N'Ám ảnh kinh hoàng 2', N'The Conjuring II: The Enfield Poltergeist tiếp tục dựa trên một trong 10000 hồ sơ điều tra của cặp vợ chồng Warren. Đây là vụ án kỳ bí nhất được ghi nhận trong lịch sử siêu nhiên. Chuyện phim...', N'/Data/images/slide/7.jpg', N'ssssss', CAST(N'2019-10-31 08:29:54.223' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Slide] ([SlideID], [Name], [Description], [Image], [Url], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (3, N'Huyền Thoại Người Rừng', N'Câu chuyện xảy ra nhiều năm kể từ khi người đàn ông từng được biết đến như Tarzan rời khu rừng ở châu Phi, bước vào cuộc sống của một quý tộc với tên gọi John Clayton III, Lãnh chúa Greystoke...', N'/Data/images/slide/5.jpg', N'qq', CAST(N'2019-10-31 08:29:27.007' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Slide] ([SlideID], [Name], [Description], [Image], [Url], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (4, N'Đội vệ binh siêu đẳng', N'Phim Maximum Ride - Đội Vệ Binh Siêu Đẳng là một bộ phim hành động viễn tưởng do Mỹ sản xuất với nội dung xoay quanh câu chuyện về sáu bạn trẻ có khả năng đặc biệt tên Max, Fang, Iggy, Nudge, Gazzy, Angel. Trong phim sáu bạn trẻ phải chiến đâu với những dị nhân khác để trốn chạy khỏi một phòng thí nghiệm...', N'/Data/images/slide/2.jpg', N'/', CAST(N'2019-10-30 08:57:21.593' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Slide] ([SlideID], [Name], [Description], [Image], [Url], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (5, N'Cặp Đôi Gián Điệp', N'Phim Central Intelligence 2016 chuyện xoay quanh Bob - một mật vụ CIA (Dwayne Johnson thủ vai) có võ nghệ cao cường, luôn là mối hiểm nguy với bất cứ tên tội phạm nào dù thời còn đi học, anh từng phải chịu nỗi ác mộng vì vẻ bề ngoài xấu xí và bị bạn bè cùng trường trêu chọc...', N'/Data/images/slide/4.jpg', N'/', CAST(N'2019-10-30 08:58:51.677' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Slide] ([SlideID], [Name], [Description], [Image], [Url], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (6, N'Ngày Độc Lập', N'Người ngoài hành tinh đã đến trái đất và mục tiêu của họ là để chiếm lấy tài nguyên và phá huỷ. Chiến đấu bằng công nghệ cao, sử dụng vũ khí tốt nhất của con người là cách duy nhất để tồn tại. Vũ khí hạt nhân đã được sử dụng...', N'/Data/images/slide/3.jpg', N'/', CAST(N'2019-10-30 09:00:38.537' AS DateTime), NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Slide] OFF
SET IDENTITY_INSERT [dbo].[Trailer] ON 

INSERT [dbo].[Trailer] ([TrailerID], [Name], [Image], [Url], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2, N'Xác Sống 9', N'/Data/images/Movies/xs9nd.jpg', N'http://www.phimmoi.net/phim/chien-binh-bao-den-i2-5815/trailer.html', CAST(N'2019-10-27 15:40:55.783' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Trailer] ([TrailerID], [Name], [Image], [Url], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (3, N'12 kỵ binh', N'/Data/images/Movies/Baoden.png', N'updating...', CAST(N'2019-10-27 15:52:55.467' AS DateTime), NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Trailer] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [Name], [UserName], [Password], [PermissionID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Phone], [Email], [GroupID]) VALUES (80, N'Nguyen Duc Hoang', N'ngduchoang', N'bf170fcd4d84b6b02fdebca58bd242cd', 1, CAST(N'2020-04-02 17:47:41.003' AS DateTime), NULL, NULL, NULL, 1, N'0792065655', N'levananh123ab@gmail.com', N'ADMIN')
SET IDENTITY_INSERT [dbo].[User] OFF
INSERT [dbo].[UserGroup] ([ID], [Name]) VALUES (N'ADMIN', N'Quản trị')
INSERT [dbo].[UserGroup] ([ID], [Name]) VALUES (N'MEMBER', N'Thành viên')
INSERT [dbo].[UserGroup] ([ID], [Name]) VALUES (N'MOD', N'Moderatior')
ALTER TABLE [dbo].[Ads] ADD  CONSTRAINT [DF_Ads_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Ads] ADD  CONSTRAINT [DF_Ads_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Comments] ADD  CONSTRAINT [DF_Comments_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Comments] ADD  CONSTRAINT [DF_Comments_Status]  DEFAULT ((1)) FOR [Status]
GO
USE [master]
GO
ALTER DATABASE [MovieProjectV2] SET  READ_WRITE 
GO
