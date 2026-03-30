USE [Coppel]
GO
/****** Object:  Table [dbo].[CentrodeTrabajo]    Script Date: 28/03/2026 18:54:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CentrodeTrabajo](
	[numCentro] [nchar](6) NOT NULL,
	[nombreCentro] [nchar](50) NULL,
	[ciudad] [nchar](15) NULL,
 CONSTRAINT [PK_CentrodeTrabajo] PRIMARY KEY CLUSTERED 
(
	[numCentro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Directivos]    Script Date: 28/03/2026 18:54:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Directivos](
	[numEmpleado] [int] NOT NULL,
	[numCentroSupervisa] [nchar](6) NULL,
	[prestaciones] [bit] NULL,
 CONSTRAINT [PK_Directivos] PRIMARY KEY CLUSTERED 
(
	[numEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 28/03/2026 18:54:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[numEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nchar](15) NULL,
	[apellidoP] [nchar](15) NULL,
	[apellidoM] [nchar](15) NULL,
	[fechaNacimiento] [date] NULL,
	[RFC] [nchar](13) NULL,
	[numCentro] [nchar](6) NULL,
	[numPuesto] [int] NULL,
	[descripcionPuesto] [nchar](20) NULL,
	[directivos] [bit] NULL,
 CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED 
(
	[numEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Puestos]    Script Date: 28/03/2026 18:54:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Puestos](
	[numPuesto] [int] NOT NULL,
	[puesto] [nchar](15) NULL,
	[descripcion] [nchar](20) NULL,
 CONSTRAINT [PK_Puestos] PRIMARY KEY CLUSTERED 
(
	[numPuesto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Directivos]  WITH CHECK ADD  CONSTRAINT [FK_Directivos_CentrodeTrabajo] FOREIGN KEY([numCentroSupervisa])
REFERENCES [dbo].[CentrodeTrabajo] ([numCentro])
GO
ALTER TABLE [dbo].[Directivos] CHECK CONSTRAINT [FK_Directivos_CentrodeTrabajo]
GO
ALTER TABLE [dbo].[Directivos]  WITH CHECK ADD  CONSTRAINT [FK_Directivos_Empleado] FOREIGN KEY([numEmpleado])
REFERENCES [dbo].[Empleado] ([numEmpleado])
GO
ALTER TABLE [dbo].[Directivos] CHECK CONSTRAINT [FK_Directivos_Empleado]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_CentrodeTrabajo] FOREIGN KEY([numCentro])
REFERENCES [dbo].[CentrodeTrabajo] ([numCentro])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_Empleado_CentrodeTrabajo]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_Puestos] FOREIGN KEY([numPuesto])
REFERENCES [dbo].[Puestos] ([numPuesto])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_Empleado_Puestos]
GO