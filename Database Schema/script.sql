USE [master]
GO
/****** Object:  Database [ProductCRUD]    Script Date: 7/3/2024 5:04:16 PM ******/
CREATE DATABASE [ProductCRUD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProductCRUD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ProductCRUD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProductCRUD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ProductCRUD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ProductCRUD] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProductCRUD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProductCRUD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProductCRUD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProductCRUD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProductCRUD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProductCRUD] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProductCRUD] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ProductCRUD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProductCRUD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProductCRUD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProductCRUD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProductCRUD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProductCRUD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProductCRUD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProductCRUD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProductCRUD] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ProductCRUD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProductCRUD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProductCRUD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProductCRUD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProductCRUD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProductCRUD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProductCRUD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProductCRUD] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProductCRUD] SET  MULTI_USER 
GO
ALTER DATABASE [ProductCRUD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProductCRUD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProductCRUD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProductCRUD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProductCRUD] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProductCRUD] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ProductCRUD] SET QUERY_STORE = ON
GO
ALTER DATABASE [ProductCRUD] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ProductCRUD]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 7/3/2024 5:04:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 7/3/2024 5:04:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NOT NULL,
	[Description] [varchar](20) NULL,
	[Price] [decimal](18, 2) NULL,
	[category_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/3/2024 5:04:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [varchar](100) NULL,
	[UserName] [varchar](100) NULL,
	[Password] [varchar](100) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [fk_category] FOREIGN KEY([category_id])
REFERENCES [dbo].[categories] ([id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [fk_category]
GO
/****** Object:  StoredProcedure [dbo].[Categories_GetAll]    Script Date: 7/3/2024 5:04:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Categories_GetAll]
as
begin
	select * from categories;
end
GO
/****** Object:  StoredProcedure [dbo].[Products_DeleteOne]    Script Date: 7/3/2024 5:04:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Products_DeleteOne]
@id int
as
begin
	delete from products where id = @id
end
GO
/****** Object:  StoredProcedure [dbo].[Products_GetAll]    Script Date: 7/3/2024 5:04:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Products_GetAll]
as
begin
	select p.id,p.name,p.description,p.price,c.name from products p
	join categories c on p.category_id = c.id;
end
GO
/****** Object:  StoredProcedure [dbo].[Products_GetOne]    Script Date: 7/3/2024 5:04:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Products_GetOne] (@id int)
as
begin
	select p.id,p.name,p.description,p.price,c.name from products p
	join categories c on p.category_id = c.id where p.id = @id;
end
GO
/****** Object:  StoredProcedure [dbo].[Products_InsertOne]    Script Date: 7/3/2024 5:04:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Products_InsertOne]
@prodName varchar(20),
@description varchar(20),
@price decimal(18,2),
@catid int
as
begin
	insert into products values(@prodName, @description, @price, @catid);
end
GO
/****** Object:  StoredProcedure [dbo].[Products_UpdateOne]    Script Date: 7/3/2024 5:04:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Products_UpdateOne]
@id int,
@prodName varchar(20),
@description varchar(20),
@price decimal(18,2),
@catid int
as
begin
	update Products set Name = @prodName , Description = @description,Price = @price , category_id = @catid 
	where id = @id;
end
GO
/****** Object:  StoredProcedure [dbo].[Users_InsertUser]    Script Date: 7/3/2024 5:04:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Users_InsertUser]
@id varchar(100),
@username varchar(100),
@password varchar(100)
as
begin
	insert into users values (@id,@username , @password);
end
GO
/****** Object:  StoredProcedure [dbo].[Users_IsExists]    Script Date: 7/3/2024 5:04:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Users_IsExists]
@username varchar(100)
as
 begin
 declare @count int
 select @count = count(*) from users where username = @username

 if(@count = 1)
	begin
		select 1 as Rvalue;
	end
 else
	begin
		select -1 as Rvalue;
	end
end
GO
/****** Object:  StoredProcedure [dbo].[Users_login]    Script Date: 7/3/2024 5:04:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Users_login]
@username varchar(100),
@password varchar(100)
as
begin
	Declare @count int
	select @count = count(*) from users where username = @username and password = @password
	if(@count = 1)
		begin
			select 1 as Rvalue;
		end
	else
		begin
			select -1 as Rvalue;
		end

end
GO
USE [master]
GO
ALTER DATABASE [ProductCRUD] SET  READ_WRITE 
GO
