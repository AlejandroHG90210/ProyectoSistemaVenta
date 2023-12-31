USE [master]
GO
/****** Object:  Database [DBVENTA]    Script Date: 30/09/2023 12:43:59 a. m. ******/
CREATE DATABASE [DBVENTA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBVENTA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\DBVENTA.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBVENTA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\DBVENTA_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DBVENTA] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBVENTA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBVENTA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBVENTA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBVENTA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBVENTA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBVENTA] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBVENTA] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DBVENTA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBVENTA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBVENTA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBVENTA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBVENTA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBVENTA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBVENTA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBVENTA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBVENTA] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DBVENTA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBVENTA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBVENTA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBVENTA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBVENTA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBVENTA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBVENTA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBVENTA] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DBVENTA] SET  MULTI_USER 
GO
ALTER DATABASE [DBVENTA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBVENTA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBVENTA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBVENTA] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBVENTA] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBVENTA] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DBVENTA] SET QUERY_STORE = ON
GO
ALTER DATABASE [DBVENTA] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DBVENTA]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 30/09/2023 12:43:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[idCategoria] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NULL,
	[esActivo] [bit] NULL,
	[fechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Configuracion]    Script Date: 30/09/2023 12:43:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configuracion](
	[recurso] [varchar](50) NULL,
	[propiedad] [varchar](50) NULL,
	[valor] [varchar](60) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleVenta]    Script Date: 30/09/2023 12:43:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleVenta](
	[idDetalleVenta] [int] IDENTITY(1,1) NOT NULL,
	[idVenta] [int] NULL,
	[idProducto] [int] NULL,
	[marcaProducto] [varchar](100) NULL,
	[descripcionProducto] [varchar](100) NULL,
	[categoriaProducto] [varchar](100) NULL,
	[cantidad] [int] NULL,
	[precio] [decimal](10, 2) NULL,
	[total] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[idDetalleVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 30/09/2023 12:43:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[idMenu] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](30) NULL,
	[idMenuPadre] [int] NULL,
	[icono] [varchar](30) NULL,
	[controlador] [varchar](30) NULL,
	[paginaAccion] [varchar](30) NULL,
	[esActivo] [bit] NULL,
	[fechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Negocio]    Script Date: 30/09/2023 12:43:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Negocio](
	[idNegocio] [int] NOT NULL,
	[urlLogo] [varchar](500) NULL,
	[nombreLogo] [varchar](100) NULL,
	[numeroDocumento] [varchar](50) NULL,
	[nombre] [varchar](50) NULL,
	[correo] [varchar](50) NULL,
	[direccion] [varchar](50) NULL,
	[telefono] [varchar](50) NULL,
	[porcentajeImpuesto] [decimal](10, 2) NULL,
	[simboloMoneda] [varchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[idNegocio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NumeroCorrelativo]    Script Date: 30/09/2023 12:43:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NumeroCorrelativo](
	[idNumeroCorrelativo] [int] IDENTITY(1,1) NOT NULL,
	[ultimoNumero] [int] NULL,
	[cantidadDigitos] [int] NULL,
	[gestion] [varchar](100) NULL,
	[fechaActualizacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idNumeroCorrelativo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 30/09/2023 12:43:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[idProducto] [int] IDENTITY(1,1) NOT NULL,
	[codigoBarra] [varchar](50) NULL,
	[marca] [varchar](50) NULL,
	[descripcion] [varchar](100) NULL,
	[idCategoria] [int] NULL,
	[stock] [int] NULL,
	[urlImagen] [varchar](500) NULL,
	[nombreImagen] [varchar](100) NULL,
	[precio] [decimal](10, 2) NULL,
	[esActivo] [bit] NULL,
	[fechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 30/09/2023 12:43:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[idRol] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](30) NULL,
	[esActivo] [bit] NULL,
	[fechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RolMenu]    Script Date: 30/09/2023 12:43:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolMenu](
	[idRolMenu] [int] IDENTITY(1,1) NOT NULL,
	[idRol] [int] NULL,
	[idMenu] [int] NULL,
	[esActivo] [bit] NULL,
	[fechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idRolMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoDocumentoVenta]    Script Date: 30/09/2023 12:43:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoDocumentoVenta](
	[idTipoDocumentoVenta] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NULL,
	[esActivo] [bit] NULL,
	[fechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idTipoDocumentoVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 30/09/2023 12:43:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[correo] [varchar](50) NULL,
	[telefono] [varchar](50) NULL,
	[idRol] [int] NULL,
	[urlFoto] [varchar](500) NULL,
	[nombreFoto] [varchar](100) NULL,
	[clave] [varchar](100) NULL,
	[esActivo] [bit] NULL,
	[fechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 30/09/2023 12:43:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[idVenta] [int] IDENTITY(1,1) NOT NULL,
	[numeroVenta] [varchar](6) NULL,
	[idTipoDocumentoVenta] [int] NULL,
	[idUsuario] [int] NULL,
	[documentoCliente] [varchar](10) NULL,
	[nombreCliente] [varchar](20) NULL,
	[subTotal] [decimal](10, 2) NULL,
	[impuestoTotal] [decimal](10, 2) NULL,
	[Total] [decimal](10, 2) NULL,
	[fechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categoria] ON 

INSERT [dbo].[Categoria] ([idCategoria], [descripcion], [esActivo], [fechaRegistro]) VALUES (1, N'Computadoras', 1, CAST(N'2023-09-24T00:13:14.877' AS DateTime))
INSERT [dbo].[Categoria] ([idCategoria], [descripcion], [esActivo], [fechaRegistro]) VALUES (2, N'Laptops', 1, CAST(N'2023-09-24T00:13:14.877' AS DateTime))
INSERT [dbo].[Categoria] ([idCategoria], [descripcion], [esActivo], [fechaRegistro]) VALUES (3, N'Teclados', 1, CAST(N'2023-09-24T00:13:14.877' AS DateTime))
INSERT [dbo].[Categoria] ([idCategoria], [descripcion], [esActivo], [fechaRegistro]) VALUES (4, N'Monitores', 1, CAST(N'2023-09-24T00:13:14.877' AS DateTime))
INSERT [dbo].[Categoria] ([idCategoria], [descripcion], [esActivo], [fechaRegistro]) VALUES (5, N'Microfonos', 1, CAST(N'2023-09-24T00:13:14.877' AS DateTime))
SET IDENTITY_INSERT [dbo].[Categoria] OFF
GO
INSERT [dbo].[Configuracion] ([recurso], [propiedad], [valor]) VALUES (N'FireBase_Storage', N'email', N'alextrejobrionesxd01@gmail.com')
INSERT [dbo].[Configuracion] ([recurso], [propiedad], [valor]) VALUES (N'FireBase_Storage', N'clave', N'pokemonxd01')
INSERT [dbo].[Configuracion] ([recurso], [propiedad], [valor]) VALUES (N'FireBase_Storage', N'ruta', N'tiendaonline-67be0.appspot.com')
INSERT [dbo].[Configuracion] ([recurso], [propiedad], [valor]) VALUES (N'FireBase_Storage', N'api_key', N'AIzaSyDcDjskrx8H-U8-Mv9e4VeLLWIpuyrqFEA')
INSERT [dbo].[Configuracion] ([recurso], [propiedad], [valor]) VALUES (N'FireBase_Storage', N'carpeta_usuario', N'IMAGENES_USUARIO')
INSERT [dbo].[Configuracion] ([recurso], [propiedad], [valor]) VALUES (N'FireBase_Storage', N'carpeta_producto', N'IMAGENES_PRODUCTO')
INSERT [dbo].[Configuracion] ([recurso], [propiedad], [valor]) VALUES (N'FireBase_Storage', N'carpeta_logo', N'IMAGENES_LOGO')
INSERT [dbo].[Configuracion] ([recurso], [propiedad], [valor]) VALUES (N'Servicio_Correo', N'correo', N'equipoalpha361@gmail.com')
INSERT [dbo].[Configuracion] ([recurso], [propiedad], [valor]) VALUES (N'Servicio_Correo', N'clave', N'zwmvcnujuggapyne')
INSERT [dbo].[Configuracion] ([recurso], [propiedad], [valor]) VALUES (N'Servicio_Correo', N'alias', N'MiTienda.com')
INSERT [dbo].[Configuracion] ([recurso], [propiedad], [valor]) VALUES (N'Servicio_Correo', N'host', N'smtp.gmail.com')
INSERT [dbo].[Configuracion] ([recurso], [propiedad], [valor]) VALUES (N'Servicio_Correo', N'puerto', N'587')
GO
SET IDENTITY_INSERT [dbo].[DetalleVenta] ON 

INSERT [dbo].[DetalleVenta] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (1, 1, 1, N'HP', N'Laptop Hp Amd Ryzen 5 5500u 8gb Ram 256gb Ssd 14-fq1011la', N'Laptops', 1, CAST(7500.00 AS Decimal(10, 2)), CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleVenta] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (2, 1, 2, N'Corsair', N'Teclado gamer Corsair K100 QWERTY Cherry MX Speed Silver inglés US color negro con luz RGB', N'Teclados', 2, CAST(4633.00 AS Decimal(10, 2)), CAST(9266.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[DetalleVenta] OFF
GO
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([idMenu], [descripcion], [idMenuPadre], [icono], [controlador], [paginaAccion], [esActivo], [fechaRegistro]) VALUES (1, N'DashBoard', 1, N'fas fa-fw fa-tachometer-alt', N'DashBoard', N'Index', 1, CAST(N'2023-09-24T00:13:14.880' AS DateTime))
INSERT [dbo].[Menu] ([idMenu], [descripcion], [idMenuPadre], [icono], [controlador], [paginaAccion], [esActivo], [fechaRegistro]) VALUES (2, N'Administración', 2, N'fas fa-fw fa-cog', NULL, NULL, 1, CAST(N'2023-09-24T00:13:14.880' AS DateTime))
INSERT [dbo].[Menu] ([idMenu], [descripcion], [idMenuPadre], [icono], [controlador], [paginaAccion], [esActivo], [fechaRegistro]) VALUES (3, N'Inventario', 3, N'fas fa-fw fa-clipboard-list', NULL, NULL, 1, CAST(N'2023-09-24T00:13:14.880' AS DateTime))
INSERT [dbo].[Menu] ([idMenu], [descripcion], [idMenuPadre], [icono], [controlador], [paginaAccion], [esActivo], [fechaRegistro]) VALUES (4, N'Ventas', 4, N'fas fa-fw fa-tags', NULL, NULL, 1, CAST(N'2023-09-24T00:13:14.880' AS DateTime))
INSERT [dbo].[Menu] ([idMenu], [descripcion], [idMenuPadre], [icono], [controlador], [paginaAccion], [esActivo], [fechaRegistro]) VALUES (5, N'Reportes', 5, N'fas fa-fw fa-chart-area', NULL, NULL, 1, CAST(N'2023-09-24T00:13:14.880' AS DateTime))
INSERT [dbo].[Menu] ([idMenu], [descripcion], [idMenuPadre], [icono], [controlador], [paginaAccion], [esActivo], [fechaRegistro]) VALUES (6, N'Usuarios', 2, NULL, N'Usuario', N'Index', 1, CAST(N'2023-09-24T00:13:14.880' AS DateTime))
INSERT [dbo].[Menu] ([idMenu], [descripcion], [idMenuPadre], [icono], [controlador], [paginaAccion], [esActivo], [fechaRegistro]) VALUES (7, N'Negocio', 2, NULL, N'Negocio', N'Index', 1, CAST(N'2023-09-24T00:13:14.880' AS DateTime))
INSERT [dbo].[Menu] ([idMenu], [descripcion], [idMenuPadre], [icono], [controlador], [paginaAccion], [esActivo], [fechaRegistro]) VALUES (8, N'Categorias', 3, NULL, N'Categoria', N'Index', 1, CAST(N'2023-09-24T00:13:14.880' AS DateTime))
INSERT [dbo].[Menu] ([idMenu], [descripcion], [idMenuPadre], [icono], [controlador], [paginaAccion], [esActivo], [fechaRegistro]) VALUES (9, N'Productos', 3, NULL, N'Producto', N'Index', 1, CAST(N'2023-09-24T00:13:14.880' AS DateTime))
INSERT [dbo].[Menu] ([idMenu], [descripcion], [idMenuPadre], [icono], [controlador], [paginaAccion], [esActivo], [fechaRegistro]) VALUES (10, N'Nueva Venta', 4, NULL, N'Venta', N'NuevaVenta', 1, CAST(N'2023-09-24T00:13:14.883' AS DateTime))
INSERT [dbo].[Menu] ([idMenu], [descripcion], [idMenuPadre], [icono], [controlador], [paginaAccion], [esActivo], [fechaRegistro]) VALUES (11, N'Historial Venta', 4, NULL, N'Venta', N'HistorialVenta', 1, CAST(N'2023-09-24T00:13:14.883' AS DateTime))
INSERT [dbo].[Menu] ([idMenu], [descripcion], [idMenuPadre], [icono], [controlador], [paginaAccion], [esActivo], [fechaRegistro]) VALUES (12, N'Reporte de Ventas', 5, NULL, N'Reporte', N'Index', 1, CAST(N'2023-09-24T00:13:14.883' AS DateTime))
SET IDENTITY_INSERT [dbo].[Menu] OFF
GO
INSERT [dbo].[Negocio] ([idNegocio], [urlLogo], [nombreLogo], [numeroDocumento], [nombre], [correo], [direccion], [telefono], [porcentajeImpuesto], [simboloMoneda]) VALUES (1, N'https://firebasestorage.googleapis.com/v0/b/tiendaonline-67be0.appspot.com/o/IMAGENES_LOGO%2F2f9ffd19b3624956affa2ab32b0b81a7.png?alt=media&token=bfcf45be-e383-4d67-b06c-cd4e614c580a', N'2f9ffd19b3624956affa2ab32b0b81a7.png', N'1', N'Cyberpuerta', N'cyberpuerta@example.com', N'kdnckjscnijsj', N'8123746474', CAST(16.00 AS Decimal(10, 2)), N'$')
GO
SET IDENTITY_INSERT [dbo].[NumeroCorrelativo] ON 

INSERT [dbo].[NumeroCorrelativo] ([idNumeroCorrelativo], [ultimoNumero], [cantidadDigitos], [gestion], [fechaActualizacion]) VALUES (1, 1, 6, N'venta', CAST(N'2023-09-30T00:15:08.017' AS DateTime))
SET IDENTITY_INSERT [dbo].[NumeroCorrelativo] OFF
GO
SET IDENTITY_INSERT [dbo].[Producto] ON 

INSERT [dbo].[Producto] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (1, N'1', N'HP', N'Laptop Hp Amd Ryzen 5 5500u 8gb Ram 256gb Ssd 14-fq1011la', 2, 49, N'https://firebasestorage.googleapis.com/v0/b/tiendaonline-67be0.appspot.com/o/IMAGENES_PRODUCTO%2Ff7bc9afb1f0c4220a018fd35ca33c2ec.jpg?alt=media&token=e6fe93c3-1f3e-4355-8690-322b3d469726', N'f7bc9afb1f0c4220a018fd35ca33c2ec.jpg', CAST(7500.00 AS Decimal(10, 2)), 1, CAST(N'2023-09-30T00:11:07.550' AS DateTime))
INSERT [dbo].[Producto] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (2, N'2', N'Corsair', N'Teclado gamer Corsair K100 QWERTY Cherry MX Speed Silver inglés US color negro con luz RGB', 3, 18, N'https://firebasestorage.googleapis.com/v0/b/tiendaonline-67be0.appspot.com/o/IMAGENES_PRODUCTO%2F02fdb424aba64949877c25273ff3a8cd.jpg?alt=media&token=c556e020-6a99-49d5-9ef8-1990862ddb16', N'02fdb424aba64949877c25273ff3a8cd.jpg', CAST(4633.00 AS Decimal(10, 2)), 1, CAST(N'2023-09-30T00:14:02.877' AS DateTime))
SET IDENTITY_INSERT [dbo].[Producto] OFF
GO
SET IDENTITY_INSERT [dbo].[Rol] ON 

INSERT [dbo].[Rol] ([idRol], [descripcion], [esActivo], [fechaRegistro]) VALUES (1, N'Administrador', 1, CAST(N'2023-09-24T00:13:14.870' AS DateTime))
INSERT [dbo].[Rol] ([idRol], [descripcion], [esActivo], [fechaRegistro]) VALUES (2, N'Empleado', 1, CAST(N'2023-09-24T00:13:14.870' AS DateTime))
INSERT [dbo].[Rol] ([idRol], [descripcion], [esActivo], [fechaRegistro]) VALUES (3, N'Supervisor', 1, CAST(N'2023-09-24T00:13:14.870' AS DateTime))
SET IDENTITY_INSERT [dbo].[Rol] OFF
GO
SET IDENTITY_INSERT [dbo].[RolMenu] ON 

INSERT [dbo].[RolMenu] ([idRolMenu], [idRol], [idMenu], [esActivo], [fechaRegistro]) VALUES (1, 1, 1, 1, CAST(N'2023-09-24T00:13:14.897' AS DateTime))
INSERT [dbo].[RolMenu] ([idRolMenu], [idRol], [idMenu], [esActivo], [fechaRegistro]) VALUES (2, 1, 6, 1, CAST(N'2023-09-24T00:13:14.897' AS DateTime))
INSERT [dbo].[RolMenu] ([idRolMenu], [idRol], [idMenu], [esActivo], [fechaRegistro]) VALUES (3, 1, 7, 1, CAST(N'2023-09-24T00:13:14.897' AS DateTime))
INSERT [dbo].[RolMenu] ([idRolMenu], [idRol], [idMenu], [esActivo], [fechaRegistro]) VALUES (4, 1, 8, 1, CAST(N'2023-09-24T00:13:14.897' AS DateTime))
INSERT [dbo].[RolMenu] ([idRolMenu], [idRol], [idMenu], [esActivo], [fechaRegistro]) VALUES (5, 1, 9, 1, CAST(N'2023-09-24T00:13:14.897' AS DateTime))
INSERT [dbo].[RolMenu] ([idRolMenu], [idRol], [idMenu], [esActivo], [fechaRegistro]) VALUES (6, 1, 10, 1, CAST(N'2023-09-24T00:13:14.897' AS DateTime))
INSERT [dbo].[RolMenu] ([idRolMenu], [idRol], [idMenu], [esActivo], [fechaRegistro]) VALUES (7, 1, 11, 1, CAST(N'2023-09-24T00:13:14.897' AS DateTime))
INSERT [dbo].[RolMenu] ([idRolMenu], [idRol], [idMenu], [esActivo], [fechaRegistro]) VALUES (8, 1, 12, 1, CAST(N'2023-09-24T00:13:14.897' AS DateTime))
INSERT [dbo].[RolMenu] ([idRolMenu], [idRol], [idMenu], [esActivo], [fechaRegistro]) VALUES (9, 2, 10, 1, CAST(N'2023-09-24T00:13:14.897' AS DateTime))
INSERT [dbo].[RolMenu] ([idRolMenu], [idRol], [idMenu], [esActivo], [fechaRegistro]) VALUES (10, 2, 11, 1, CAST(N'2023-09-24T00:13:14.897' AS DateTime))
INSERT [dbo].[RolMenu] ([idRolMenu], [idRol], [idMenu], [esActivo], [fechaRegistro]) VALUES (11, 3, 8, 1, CAST(N'2023-09-24T00:13:14.897' AS DateTime))
INSERT [dbo].[RolMenu] ([idRolMenu], [idRol], [idMenu], [esActivo], [fechaRegistro]) VALUES (12, 3, 9, 1, CAST(N'2023-09-24T00:13:14.897' AS DateTime))
INSERT [dbo].[RolMenu] ([idRolMenu], [idRol], [idMenu], [esActivo], [fechaRegistro]) VALUES (13, 3, 10, 1, CAST(N'2023-09-24T00:13:14.897' AS DateTime))
INSERT [dbo].[RolMenu] ([idRolMenu], [idRol], [idMenu], [esActivo], [fechaRegistro]) VALUES (14, 3, 11, 1, CAST(N'2023-09-24T00:13:14.897' AS DateTime))
SET IDENTITY_INSERT [dbo].[RolMenu] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoDocumentoVenta] ON 

INSERT [dbo].[TipoDocumentoVenta] ([idTipoDocumentoVenta], [descripcion], [esActivo], [fechaRegistro]) VALUES (1, N'Boleta', 1, CAST(N'2023-09-24T00:13:14.877' AS DateTime))
INSERT [dbo].[TipoDocumentoVenta] ([idTipoDocumentoVenta], [descripcion], [esActivo], [fechaRegistro]) VALUES (2, N'Factura', 1, CAST(N'2023-09-24T00:13:14.877' AS DateTime))
SET IDENTITY_INSERT [dbo].[TipoDocumentoVenta] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([idUsuario], [nombre], [correo], [telefono], [idRol], [urlFoto], [nombreFoto], [clave], [esActivo], [fechaRegistro]) VALUES (1, N'Alejandro Trejo', N'alextrejobrionesxd01@gmail.com', N'8123746474', 1, N'https://firebasestorage.googleapis.com/v0/b/tiendaonline-67be0.appspot.com/o/IMAGENES_USUARIO%2F57aa7be7fb0a465eb48bc05e62cd2cf6.png?alt=media&token=bd166b61-9eb5-4a38-84ec-6cd5a7f41678', N'57aa7be7fb0a465eb48bc05e62cd2cf6.png', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 1, CAST(N'2023-09-24T00:13:14.873' AS DateTime))
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
SET IDENTITY_INSERT [dbo].[Venta] ON 

INSERT [dbo].[Venta] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (1, N'000001', 1, 1, N'1212321', N'Alejandro Trejo', CAST(14453.45 AS Decimal(10, 2)), CAST(2312.55 AS Decimal(10, 2)), CAST(16766.00 AS Decimal(10, 2)), CAST(N'2023-09-30T00:15:08.170' AS DateTime))
SET IDENTITY_INSERT [dbo].[Venta] OFF
GO
ALTER TABLE [dbo].[Categoria] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[Menu] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[Producto] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[Rol] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[RolMenu] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[TipoDocumentoVenta] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[Venta] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[DetalleVenta]  WITH CHECK ADD FOREIGN KEY([idVenta])
REFERENCES [dbo].[Venta] ([idVenta])
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD FOREIGN KEY([idMenuPadre])
REFERENCES [dbo].[Menu] ([idMenu])
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD FOREIGN KEY([idCategoria])
REFERENCES [dbo].[Categoria] ([idCategoria])
GO
ALTER TABLE [dbo].[RolMenu]  WITH CHECK ADD FOREIGN KEY([idMenu])
REFERENCES [dbo].[Menu] ([idMenu])
GO
ALTER TABLE [dbo].[RolMenu]  WITH CHECK ADD FOREIGN KEY([idRol])
REFERENCES [dbo].[Rol] ([idRol])
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD FOREIGN KEY([idRol])
REFERENCES [dbo].[Rol] ([idRol])
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD FOREIGN KEY([idTipoDocumentoVenta])
REFERENCES [dbo].[TipoDocumentoVenta] ([idTipoDocumentoVenta])
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
USE [master]
GO
ALTER DATABASE [DBVENTA] SET  READ_WRITE 
GO
