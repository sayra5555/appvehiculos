USE [master]
GO
/****** Object:  Database [db_AgenciaCarros]    Script Date: 1/03/2025 22:10:25 ******/
CREATE DATABASE [db_AgenciaCarros]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db_AgenciaCarros', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\db_AgenciaCarros.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'db_AgenciaCarros_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\db_AgenciaCarros_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [db_AgenciaCarros] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_AgenciaCarros].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_AgenciaCarros] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_AgenciaCarros] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_AgenciaCarros] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_AgenciaCarros] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_AgenciaCarros] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_AgenciaCarros] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [db_AgenciaCarros] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_AgenciaCarros] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_AgenciaCarros] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_AgenciaCarros] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_AgenciaCarros] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_AgenciaCarros] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_AgenciaCarros] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_AgenciaCarros] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_AgenciaCarros] SET  ENABLE_BROKER 
GO
ALTER DATABASE [db_AgenciaCarros] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_AgenciaCarros] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_AgenciaCarros] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_AgenciaCarros] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_AgenciaCarros] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_AgenciaCarros] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_AgenciaCarros] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_AgenciaCarros] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [db_AgenciaCarros] SET  MULTI_USER 
GO
ALTER DATABASE [db_AgenciaCarros] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_AgenciaCarros] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db_AgenciaCarros] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db_AgenciaCarros] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [db_AgenciaCarros] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [db_AgenciaCarros] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [db_AgenciaCarros] SET QUERY_STORE = ON
GO
ALTER DATABASE [db_AgenciaCarros] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [db_AgenciaCarros]
GO
/****** Object:  Table [dbo].[tblClientes]    Script Date: 1/03/2025 22:10:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblClientes](
	[ClienteID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Apellido] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Telefono] [nvarchar](20) NULL,
	[Estado] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ClienteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblVehiculos]    Script Date: 1/03/2025 22:10:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblVehiculos](
	[VehiculoID] [int] IDENTITY(1,1) NOT NULL,
	[Marca] [nvarchar](50) NOT NULL,
	[Modelo] [nvarchar](50) NOT NULL,
	[Año] [int] NOT NULL,
	[Precio] [decimal](18, 2) NOT NULL,
	[Estado] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[VehiculoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblVentas]    Script Date: 1/03/2025 22:10:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblVentas](
	[VentaID] [int] IDENTITY(1,1) NOT NULL,
	[VehiculoID] [int] NULL,
	[ClienteID] [int] NULL,
	[FechaVenta] [date] NOT NULL,
	[Monto] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[VentaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VistaejercicioA]    Script Date: 1/03/2025 22:10:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[VistaejercicioA]
as
select cli.Nombre, cli.Apellido, vehi.Precio
from tblVentas ven
inner join 
tblVehiculos vehi
on vehi.VehiculoID = ven.VehiculoID
inner join 
tblClientes cli
on cli.ClienteID = ven.ClienteID
where vehi.Precio > 20000;

GO
/****** Object:  View [dbo].[vistaejercicioD]    Script Date: 1/03/2025 22:10:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vistaejercicioD]
as
select  count ( ve.ClienteID)as Compras, 
cli.Nombre, cli.Apellido,  ve.VentaID, cli.ClienteID,
ve.Monto
from  tblClientes cli
inner join 
tblVentas ve
on  cli.ClienteID= ve.ClienteID
group by cli.Nombre, cli.Apellido,  ve.VentaID, cli.ClienteID,
ve.Monto
having count (ve.ClienteID) >1; -- mas de una venta como no hay mas de una venta, no aparace resultado.  
GO
/****** Object:  View [dbo].[vistaejercicioE]    Script Date: 1/03/2025 22:10:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vistaejercicioE]
as
select * 
from tblVehiculos
where Estado like 'Disponible';
GO
/****** Object:  View [dbo].[vistaejercicioB]    Script Date: 1/03/2025 22:10:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vistaejercicioB]
as
select  sum (ven.Monto) as MontoGastado, cli.Nombre, cli.Apellido
from tblClientes cli
left join  
tblVentas ven 
on ven.ClienteID= cli.ClienteID
group by cli.Apellido, cli.Nombre, cli.ClienteID;
GO
/****** Object:  View [dbo].[vistaejercicioC]    Script Date: 1/03/2025 22:10:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vistaejercicioC]
as
select 
cli.ClienteID, cli.Nombre, cli.Apellido,
ven.VentaID, ven.FechaVenta, ven.Monto
from tblVentas ven
inner  join 
tblClientes cli
on cli.ClienteID= ven.ClienteID
inner join tblVehiculos vehi
on vehi.VehiculoID=ven.VehiculoID;
GO
ALTER TABLE [dbo].[tblVentas]  WITH CHECK ADD FOREIGN KEY([ClienteID])
REFERENCES [dbo].[tblClientes] ([ClienteID])
GO
ALTER TABLE [dbo].[tblVentas]  WITH CHECK ADD FOREIGN KEY([VehiculoID])
REFERENCES [dbo].[tblVehiculos] ([VehiculoID])
GO
/****** Object:  StoredProcedure [dbo].[usp_VEHICULOS_eliminar]    Script Date: 1/03/2025 22:10:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sayra Vasquez
-- Create date: 25/02/2025
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_VEHICULOS_eliminar]
	-- Add the parameters for the stored procedure here
	(
@Vehiculo int
	)
AS
BEGIN
	
	SET NOCOUNT ON;
Delete tblVehiculos

where VehiculoID= @Vehiculo
	
	 Select @@ROWCOUNT;
END
GO
/****** Object:  StoredProcedure [dbo].[usp_vehiculos_inserT_Guardar]    Script Date: 1/03/2025 22:10:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		SAYRA VASQUEZ
-- Create date:  25/02/2025
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE  [dbo].[usp_vehiculos_inserT_Guardar]

-- Parametros de entrada

	(
    @Marca varchar (50),
	@Modelo varchar(50),
	@Año int,
	@Precio  decimal (18,2),
	@Estado  varchar (50)
	)
AS
BEGIN

	SET NOCOUNT ON;
	insert into tblVehiculos
	(
	
	Marca,
	Modelo,
	Año,
	Precio,
	Estado
	)
	  values
	(
   
	@Marca,
	@Modelo,
	@Año,
	@Precio,
	@Estado


	)
END
GO
/****** Object:  StoredProcedure [dbo].[usp_vehiculos_select_mostras]    Script Date: 1/03/2025 22:10:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		SAYRA VASQUEZ
-- Create date:  25/02/2025
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE  [dbo].[usp_vehiculos_select_mostras]


AS
BEGIN

	SET NOCOUNT ON;
	
	select * from tblVehiculos;
  
END
GO
/****** Object:  StoredProcedure [dbo].[usp_vehiculos_update_Editar]    Script Date: 1/03/2025 22:10:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		SAYRA VASQUEZ
-- Create date:  25/02/2025
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE  [dbo].[usp_vehiculos_update_Editar]

-- Parametros de entrada

	(@Vehiculo int,
    @Marca varchar (50),
	@Modelo varchar(50),
	@Año int,
	@Precio  decimal (18,2),
	@Estado  varchar (50)
	)
AS
BEGIN

	SET NOCOUNT ON;
	update tblVehiculos set
	Marca=@Marca,
	Modelo=@Modelo,
	Año=@Año,
	Precio=@Precio,
	Estado=@Estado
	WHERE VehiculoID=@Vehiculo
	
END
GO
USE [master]
GO
ALTER DATABASE [db_AgenciaCarros] SET  READ_WRITE 
GO
