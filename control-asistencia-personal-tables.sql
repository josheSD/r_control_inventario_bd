CREATE TABLE [personal].[menu] (
  [men__id] int IDENTITY NOT NULL,
  [men__nombre] varchar(255) NOT NULL,
  [men__icon] varchar(255) NULL,
  [men__link] varchar(255) NULL,
  PRIMARY KEY CLUSTERED ([men__id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

CREATE TABLE [personal].[rol] (
  [rol__id] int IDENTITY NOT NULL,
  [rol__nombre] varchar(255) NOT NULL,
  PRIMARY KEY CLUSTERED ([rol__id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

CREATE TABLE [personal].[rol_menu] (
  [rol_men__id] int IDENTITY NOT NULL,
  [rol_men__rol_id] int NULL,
  [rol_men__men_id] int NULL,
  PRIMARY KEY CLUSTERED ([rol_men__id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

CREATE TABLE [personal].[usuario] (
  [usu__id] int IDENTITY NOT NULL,
  [usu__nombre] varchar(255) NOT NULL,
  [usu__direccion] varchar(255) NOT NULL,
  [usu__usuario] varchar(255) NOT NULL,
  [usu__contrasenia] varchar(255) NOT NULL,
  [usu__estado] int NOT NULL,
  [usu__rol_id] int NOT NULL,
  PRIMARY KEY CLUSTERED ([usu__id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

ALTER TABLE [personal].[rol_menu] ADD CONSTRAINT [fk_rol_men__rol_id] FOREIGN KEY ([rol_men__rol_id]) REFERENCES [personal].[rol] ([rol__id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [personal].[rol_menu] ADD CONSTRAINT [fk_rol_men__men_id] FOREIGN KEY ([rol_men__men_id]) REFERENCES [personal].[menu] ([men__id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [personal].[usuario] ADD CONSTRAINT [fk_usu__rol_id] FOREIGN KEY ([usu__rol_id]) REFERENCES [personal].[rol] ([rol__id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

