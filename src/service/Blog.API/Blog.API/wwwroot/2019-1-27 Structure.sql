USE [master]
GO
/****** Object:  Database [siegrain.blog]    Script Date: 2019/1/27 17:26:23 ******/
CREATE DATABASE [siegrain.blog]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'siegrain.blog', FILENAME = N'H:\Projects\Database\siegrain.blog.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'siegrain.blog_log', FILENAME = N'H:\Projects\Database\siegrain.blog_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [siegrain.blog] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [siegrain.blog].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [siegrain.blog] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [siegrain.blog] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [siegrain.blog] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [siegrain.blog] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [siegrain.blog] SET ARITHABORT OFF 
GO
ALTER DATABASE [siegrain.blog] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [siegrain.blog] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [siegrain.blog] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [siegrain.blog] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [siegrain.blog] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [siegrain.blog] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [siegrain.blog] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [siegrain.blog] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [siegrain.blog] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [siegrain.blog] SET  DISABLE_BROKER 
GO
ALTER DATABASE [siegrain.blog] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [siegrain.blog] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [siegrain.blog] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [siegrain.blog] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [siegrain.blog] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [siegrain.blog] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [siegrain.blog] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [siegrain.blog] SET RECOVERY FULL 
GO
ALTER DATABASE [siegrain.blog] SET  MULTI_USER 
GO
ALTER DATABASE [siegrain.blog] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [siegrain.blog] SET DB_CHAINING OFF 
GO
ALTER DATABASE [siegrain.blog] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [siegrain.blog] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [siegrain.blog] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'siegrain.blog', N'ON'
GO
ALTER DATABASE [siegrain.blog] SET QUERY_STORE = OFF
GO
USE [siegrain.blog]
GO
/****** Object:  Table [dbo].[Article]    Script Date: 2019/1/27 17:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Article](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Author] [int] NULL,
	[Title] [nvarchar](256) NULL,
	[Category] [nvarchar](max) NULL,
	[Content] [text] NULL,
	[ViewCount] [int] NOT NULL,
	[CommentCount] [int] NOT NULL,
	[UpdatedAt] [datetime] NULL,
	[CreatedAt] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Remark] [nvarchar](200) NULL,
 CONSTRAINT [PK_BlogArticle] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArticleCategories]    Script Date: 2019/1/27 17:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticleCategories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Article] [int] NOT NULL,
	[Category] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdateAt] [datetime] NULL,
 CONSTRAINT [PK_ArticleCategories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 2019/1/27 17:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdateAt] [datetime] NULL,
	[Remark] [nvarchar](200) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Module]    Script Date: 2019/1/27 17:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Module](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ParentId] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[Url] [nvarchar](100) NULL,
	[Area] [nvarchar](max) NULL,
	[Controller] [nvarchar](max) NULL,
	[Action] [nvarchar](max) NULL,
	[Icon] [nvarchar](100) NULL,
	[Code] [nvarchar](10) NULL,
	[OrderSort] [int] NOT NULL,
	[IsMenu] [bit] NOT NULL,
	[IsEnabled] [bit] NOT NULL,
	[IsDeleted] [bit] NULL,
	[Creator] [int] NULL,
	[CreatedAt] [datetime] NOT NULL,
	[Updator] [int] NULL,
	[UpdatedAt] [datetime] NULL,
	[Remark] [nvarchar](200) NULL,
 CONSTRAINT [PK_dbo.Module] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ModulePermission]    Script Date: 2019/1/27 17:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModulePermission](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ModuleId] [int] NOT NULL,
	[PermissionId] [int] NOT NULL,
	[IsDeleted] [bit] NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NULL,
 CONSTRAINT [PK_dbo.ModulePermission] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OperationLog]    Script Date: 2019/1/27 17:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OperationLog](
	[Guid] [uniqueidentifier] NOT NULL,
	[UserId] [int] NOT NULL,
	[LoginName] [nvarchar](200) NULL,
	[Area] [nvarchar](200) NULL,
	[Controller] [nvarchar](200) NULL,
	[Action] [nvarchar](200) NULL,
	[IPAddress] [varchar](50) NULL,
	[LogTime] [datetime] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[Remark] [nvarchar](200) NULL,
 CONSTRAINT [PK_OperationLog] PRIMARY KEY CLUSTERED 
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permission]    Script Date: 2019/1/27 17:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[OrderSort] [int] NOT NULL,
	[Icon] [nvarchar](100) NULL,
	[Enabled] [bit] NOT NULL,
	[Creator] [int] NULL,
	[CreatedAt] [datetime] NOT NULL,
	[Updator] [int] NULL,
	[UpdatedAt] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[Remark] [nvarchar](100) NULL,
 CONSTRAINT [PK_dbo.Permission] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 2019/1/27 17:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Sort] [int] NOT NULL,
	[IsEnabled] [bit] NOT NULL,
	[Creator] [int] NULL,
	[CreatedAt] [datetime] NOT NULL,
	[Updator] [int] NULL,
	[UpdatedAt] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[Remark] [nvarchar](200) NULL,
 CONSTRAINT [PK_dbo.Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleModulePermission]    Script Date: 2019/1/27 17:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleModulePermission](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[ModuleId] [int] NOT NULL,
	[PermissionId] [int] NULL,
	[IsDeleted] [bit] NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NULL,
 CONSTRAINT [PK_dbo.RoleModulePermission] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 2019/1/27 17:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_dbo.UserRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2019/1/27 17:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LoginName] [nvarchar](60) NULL,
	[Password] [nvarchar](60) NULL,
	[RealName] [nvarchar](60) NULL,
	[Status] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NULL,
	[Remark] [nvarchar](200) NULL,
 CONSTRAINT [PK_dbo.sysUserInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Article] ADD  CONSTRAINT [DF_Article_ViewCount]  DEFAULT ((0)) FOR [ViewCount]
GO
ALTER TABLE [dbo].[Article] ADD  CONSTRAINT [DF_Article_CommentCount]  DEFAULT ((0)) FOR [CommentCount]
GO
ALTER TABLE [dbo].[Article] ADD  CONSTRAINT [DF_Article_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Article] ADD  CONSTRAINT [DF_Article_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ArticleCategories] ADD  CONSTRAINT [DF_ArticleCategories_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Module] ADD  CONSTRAINT [DF_Module_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[ModulePermission] ADD  CONSTRAINT [DF_ModulePermission_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[OperationLog] ADD  CONSTRAINT [DF_OperationLog_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Permission] ADD  CONSTRAINT [DF_Permission_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF_Role_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[RoleModulePermission] ADD  CONSTRAINT [DF_RoleModulePermission_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[UserRole] ADD  CONSTRAINT [DF_UserRole_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Article]  WITH CHECK ADD  CONSTRAINT [FK_Article_Users] FOREIGN KEY([Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Article] CHECK CONSTRAINT [FK_Article_Users]
GO
ALTER TABLE [dbo].[ArticleCategories]  WITH CHECK ADD  CONSTRAINT [FK_ArticleCategories_Article] FOREIGN KEY([Id])
REFERENCES [dbo].[Article] ([Id])
GO
ALTER TABLE [dbo].[ArticleCategories] CHECK CONSTRAINT [FK_ArticleCategories_Article]
GO
ALTER TABLE [dbo].[ArticleCategories]  WITH CHECK ADD  CONSTRAINT [FK_ArticleCategories_Category] FOREIGN KEY([Id])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[ArticleCategories] CHECK CONSTRAINT [FK_ArticleCategories_Category]
GO
ALTER TABLE [dbo].[Module]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Module_dbo.Module_ParentId] FOREIGN KEY([ParentId])
REFERENCES [dbo].[Module] ([Id])
GO
ALTER TABLE [dbo].[Module] CHECK CONSTRAINT [FK_dbo.Module_dbo.Module_ParentId]
GO
ALTER TABLE [dbo].[ModulePermission]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ModulePermission_dbo.Module_ModuleId] FOREIGN KEY([ModuleId])
REFERENCES [dbo].[Module] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ModulePermission] CHECK CONSTRAINT [FK_dbo.ModulePermission_dbo.Module_ModuleId]
GO
ALTER TABLE [dbo].[ModulePermission]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ModulePermission_dbo.Permission_PermissionId] FOREIGN KEY([PermissionId])
REFERENCES [dbo].[Permission] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ModulePermission] CHECK CONSTRAINT [FK_dbo.ModulePermission_dbo.Permission_PermissionId]
GO
ALTER TABLE [dbo].[RoleModulePermission]  WITH CHECK ADD  CONSTRAINT [FK_dbo.RoleModulePermission_dbo.Module_ModuleId] FOREIGN KEY([ModuleId])
REFERENCES [dbo].[Module] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RoleModulePermission] CHECK CONSTRAINT [FK_dbo.RoleModulePermission_dbo.Module_ModuleId]
GO
ALTER TABLE [dbo].[RoleModulePermission]  WITH CHECK ADD  CONSTRAINT [FK_dbo.RoleModulePermission_dbo.Permission_PermissionId] FOREIGN KEY([PermissionId])
REFERENCES [dbo].[Permission] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RoleModulePermission] CHECK CONSTRAINT [FK_dbo.RoleModulePermission_dbo.Permission_PermissionId]
GO
ALTER TABLE [dbo].[RoleModulePermission]  WITH CHECK ADD  CONSTRAINT [FK_dbo.RoleModulePermission_dbo.Role_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RoleModulePermission] CHECK CONSTRAINT [FK_dbo.RoleModulePermission_dbo.Role_RoleId]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserRole_dbo.Role_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_dbo.UserRole_dbo.Role_RoleId]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserRole_dbo.sysUserInfo_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_dbo.UserRole_dbo.sysUserInfo_UserId]
GO
USE [master]
GO
ALTER DATABASE [siegrain.blog] SET  READ_WRITE 
GO
