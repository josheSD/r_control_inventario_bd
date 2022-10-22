CREATE TABLE [inventario].[almacen] (
  [alm__id] int IDENTITY NOT NULL,
  [alm__nombre] varchar(255) NULL,
  [alm__direccion] varchar(255) NULL,
  [alm__estado] int NULL,
  [alm__fecha_creacion] datetime NULL,
  [alm__fecha_actualizacion] datetime NULL,
  PRIMARY KEY CLUSTERED ([alm__id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

CREATE TABLE [inventario].[articulo] (
  [art__id] int IDENTITY NOT NULL,
  [art__nombre] varchar(255) NULL,
  [art__url] varchar(255) NULL,
  [art__precio] varchar(255) NULL,
  [art__estado] int NULL,
  [art__fecha_creacion] datetime NULL,
  [art__fecha_actualizacion] datetime NULL,
  [art__cat_id] int NOT NULL,
  PRIMARY KEY CLUSTERED ([art__id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

CREATE TABLE [inventario].[articulo_almacen] (
  [art_alm__id] int IDENTITY NOT NULL,
  [art_alm__cantidad] int NULL,
  [art_alm__estado] int NULL,
  [art_alm__art_id] int NULL,
  [art_alm__alm_id] int NULL,
  PRIMARY KEY CLUSTERED ([art_alm__id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

CREATE TABLE [inventario].[categoria] (
  [cat__id] int IDENTITY NOT NULL,
  [cat__nombre] varchar(255) NULL,
  PRIMARY KEY CLUSTERED ([cat__id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

CREATE TABLE [inventario].[proyecto] (
  [pro__id] int  IDENTITY NOT NULL,
  [pro__nombre] varchar(255) NULL,
  [pro__cliente] varchar(255) NULL,
  [pro__fecha_inicio] datetime NULL,
  [pro__fecha_fin] datetime NULL,
  [pro__estado] int NULL,
  [pro__fecha_creacion] datetime NULL,
  [pro__fecha_actualizacion] datetime NULL,
  PRIMARY KEY CLUSTERED ([pro__id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

CREATE TABLE [inventario].[proyecto_almacen] (
  [pro_alm__id] int IDENTITY NOT NULL,
  [pro_alm__cantidad] int NULL,
  [pro_alm__estado] int NULL,
  [pro_alm__pro_id] int NULL,
  [pro_alm__alm_id] int NULL,
  [pro_alm__art_id] int NULL,
  PRIMARY KEY CLUSTERED ([pro_alm__id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

ALTER TABLE [inventario].[articulo] ADD CONSTRAINT [fk_art__cat_id] FOREIGN KEY ([art__cat_id]) REFERENCES [inventario].[categoria] ([cat__id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [inventario].[articulo_almacen] ADD CONSTRAINT [fk_art_alm__art_id] FOREIGN KEY ([art_alm__art_id]) REFERENCES [inventario].[articulo] ([art__id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [inventario].[articulo_almacen] ADD CONSTRAINT [fk_art_alm__alm_id] FOREIGN KEY ([art_alm__alm_id]) REFERENCES [inventario].[almacen] ([alm__id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [inventario].[proyecto_almacen] ADD CONSTRAINT [fk_art_pro__pro_id] FOREIGN KEY ([art_pro__pro_id]) REFERENCES [inventario].[proyecto] ([pro__id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [inventario].[proyecto_almacen] ADD CONSTRAINT [fk_art_pro__alm_id] FOREIGN KEY ([art_pro__alm_id]) REFERENCES [inventario].[almacen] ([alm__id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

