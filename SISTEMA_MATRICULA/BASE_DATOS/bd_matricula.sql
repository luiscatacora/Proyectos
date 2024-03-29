
CREATE DATABASE [bd_matricula]
GO
USE [bd_matricula]
GO
CREATE TABLE [dbo].[alumno](
	[idalumno] [int] IDENTITY(1,1) NOT NULL,
	[apellido_paterno] [varchar](45) NOT NULL,
	[apellido_materno] [varchar](45) NOT NULL,
	[nombres] [varchar](45) NOT NULL,
	[sexo] [char](1) NULL,
	[dni] [varchar](8) NOT NULL,
	[fecha_nacimiento] [date] NOT NULL,
	[email] [varchar](45) NULL,
	[telefono] [varchar](45) NULL,
	[idcarrera] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idalumno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
CREATE TABLE [dbo].[carrera_profesional](
	[idcarrera] [int] IDENTITY(1,1) NOT NULL,
	[nombre_carrera] [varchar](100) NOT NULL,
	[estado] [char](1) NOT NULL CONSTRAINT [DF_carrera_profesional_estado]  DEFAULT ('A'),
 CONSTRAINT [PK_carrera_profesional] PRIMARY KEY CLUSTERED 
(
	[idcarrera] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cursos](
	[idcursos] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](45) NOT NULL,
	[idcarrera] [int] NOT NULL,
	[semestre] [int] NOT NULL,
	[obs] [varchar](45) NULL,
PRIMARY KEY CLUSTERED 
(
	[idcursos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
CREATE TABLE [dbo].[detalle_matricula](
	[iddetalle_matricula] [int] IDENTITY(1,1) NOT NULL,
	[idmatricula] [int] NOT NULL,
	[idcursos] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[iddetalle_matricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
CREATE TABLE [dbo].[matricula](
	[idmatricula] [int] IDENTITY(1,1) NOT NULL,
	[login] [varchar](45) NOT NULL,
	[idalumno] [int] NOT NULL,
	[semestre] [int] NULL,
	[codigo_pago] [varchar](45) NULL,
	[fecha_matricula] [datetime2](7) NOT NULL,
	[estado] [char](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idmatricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
CREATE TABLE [dbo].[usuario](
	[login] [varchar](45) NOT NULL,
	[clave] [varchar](45) NOT NULL,
	[tipo] [char](3) NULL DEFAULT (NULL),
	[estado] [char](1) NULL CONSTRAINT [DF_usuario_estado]  DEFAULT ('A'),
PRIMARY KEY CLUSTERED 
(
	[login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[alumno] ADD  DEFAULT (NULL) FOR [sexo]
GO
ALTER TABLE [dbo].[alumno] ADD  DEFAULT (NULL) FOR [email]
GO
ALTER TABLE [dbo].[alumno] ADD  DEFAULT (NULL) FOR [telefono]
GO
ALTER TABLE [dbo].[cursos] ADD  DEFAULT (NULL) FOR [obs]
GO
ALTER TABLE [dbo].[matricula] ADD  DEFAULT (NULL) FOR [semestre]
GO
ALTER TABLE [dbo].[matricula] ADD  DEFAULT (NULL) FOR [codigo_pago]
GO
ALTER TABLE [dbo].[matricula] ADD  DEFAULT (getdate()) FOR [fecha_matricula]
GO
ALTER TABLE [dbo].[matricula] ADD  DEFAULT ('A') FOR [estado]
GO
ALTER TABLE [dbo].[alumno]  WITH CHECK ADD  CONSTRAINT [FK_alumno_carrera_profesional] FOREIGN KEY([idcarrera])
REFERENCES [dbo].[carrera_profesional] ([idcarrera])
GO
ALTER TABLE [dbo].[alumno] CHECK CONSTRAINT [FK_alumno_carrera_profesional]
GO
ALTER TABLE [dbo].[cursos]  WITH CHECK ADD FOREIGN KEY([idcarrera])
REFERENCES [dbo].[carrera_profesional] ([idcarrera])
GO
ALTER TABLE [dbo].[detalle_matricula]  WITH CHECK ADD  CONSTRAINT [fk_detalle_matricula_cursos1] FOREIGN KEY([idcursos])
REFERENCES [dbo].[cursos] ([idcursos])
GO
ALTER TABLE [dbo].[detalle_matricula] CHECK CONSTRAINT [fk_detalle_matricula_cursos1]
GO
ALTER TABLE [dbo].[detalle_matricula]  WITH CHECK ADD  CONSTRAINT [fk_detalle_matricula_matricula1] FOREIGN KEY([idmatricula])
REFERENCES [dbo].[matricula] ([idmatricula])
GO
ALTER TABLE [dbo].[detalle_matricula] CHECK CONSTRAINT [fk_detalle_matricula_matricula1]
GO
ALTER TABLE [dbo].[matricula]  WITH CHECK ADD  CONSTRAINT [fk_matricula_alumno1] FOREIGN KEY([idalumno])
REFERENCES [dbo].[alumno] ([idalumno])
GO
ALTER TABLE [dbo].[matricula] CHECK CONSTRAINT [fk_matricula_alumno1]
GO
ALTER TABLE [dbo].[matricula]  WITH CHECK ADD  CONSTRAINT [fk_matricula_usuario1] FOREIGN KEY([login])
REFERENCES [dbo].[usuario] ([login])
GO
ALTER TABLE [dbo].[matricula] CHECK CONSTRAINT [fk_matricula_usuario1]

GO
-- =============================================
CREATE PROCEDURE [dbo].[SP_EDITAR_ALUMNO]
	@apepaterno VARCHAR(45), 
	@apematerno VARCHAR(45), 
	@nombre VARCHAR(45), 
	@sex CHAR(1), 
	@dni VARCHAR(8), 
	@fechnac DATE, 
	@email VARCHAR(45), 
	@tel VARCHAR(45), 
	@idcar INT, 
	@idealu INT
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE [dbo].[alumno] 
	SET
	   [apellido_paterno]=@apepaterno
      ,[apellido_materno]=@apematerno
      ,[nombres]=@nombre
      ,[sexo]=@sex
      ,[dni]=@dni
      ,[fecha_nacimiento]=@fechnac
      ,[email]=@email
      ,[telefono]=@tel
      ,[idcarrera]=@idcar
	WHERE [idalumno]=@idealu
END

GO

CREATE PROCEDURE [dbo].[SP_EDTAR_CURSO]
	@ide int,
	@nom varchar(45),
	@idecar int,
	@semes int,
	@desc varchar(45)
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE [dbo].[cursos] SET nombre=@nom,idcarrera=@idecar,semestre=@semes,obs=@desc
	WHERE idcursos=@ide
END

GO
CREATE PROCEDURE [dbo].[SP_LISTA_CURSO_CARRERA]
	@idecar INT,
	@idsem INT
AS
BEGIN
	IF(@idsem=0) 
		BEGIN
		SELECT 
			*
		FROM [dbo].[cursos] c
		WHERE c.idcarrera = @idecar
	END ELSE BEGIN			
		SELECT 
			c.idcursos,
			c.nombre
		FROM [dbo].[cursos] c
		WHERE 
			c.idcarrera = @idecar
			AND c.semestre=@idsem
	END
END

GO
CREATE PROCEDURE [dbo].[SP_LISTA_MATRICULA]
	@idecar INT,
	@fech_inicio DATE,
	@fech_fin DATE
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		dm.iddetalle_matricula,
		ma.idmatricula,
		al.dni,
		nombres=(al.nombres + ' ' + al.apellido_paterno + ' ' + al.apellido_materno),
		ma.semestre,
		cu.idcursos,
		cu.nombre,
		fecha_matricula=convert(date, ma.fecha_matricula)		
	FROM [dbo].[matricula] ma
	INNER JOIN [dbo].[detalle_matricula] dm
		ON ma.idmatricula=dm.idmatricula
	INNER JOIN [dbo].[alumno] al
		ON ma.idalumno=al.idalumno
	INNER JOIN[dbo].[cursos] cu
		ON dm.idcursos=cu.idcursos
	WHERE
		al.idcarrera = @idecar
		AND convert(date, ma.fecha_matricula) BETWEEN @fech_inicio AND @fech_fin
END

GO
CREATE PROCEDURE [dbo].[SP_LOGIN]
    @USER_LOGIN NVARCHAR(50),
    @USER_PASSWORD NVARCHAR(1000)    
AS    
    SELECT  U.login, U.tipo
    FROM [dbo].[usuario] U
    WHERE U.login=@USER_LOGIN AND U.clave=@USER_PASSWORD
    AND U.estado='A'

GO

CREATE PROCEDURE [dbo].[SP_MATRICULAR_CURSO]
	@idemat INT,
	@idecur INT
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO [dbo].[detalle_matricula] ([idmatricula],[idcursos])
	VALUES(@idemat,@idecur)
END

GO

CREATE PROCEDURE [dbo].[SP_NUEVA_MATRICULA]
      @login VARCHAR(45)
      ,@idalumno INT
      ,@semestre INT
      ,@codigo_pago VARCHAR(45)
      
AS
BEGIN
	DECLARE 
		@ide AS INT

	SET NOCOUNT ON;
	SELECT 
		@ide=a.idalumno
	FROM [dbo].[alumno] a
	WHERE 
		a.dni=@idalumno
	INSERT INTO [dbo].[matricula] ([login],[idalumno],[semestre],[codigo_pago])
	VALUES(@login,@ide,@semestre,@codigo_pago)
	SELECT @@IDENTITY AS ideMat
END

GO
CREATE PROCEDURE [dbo].[SP_NUEVO_ALUMNO]
      @apepaterno VARCHAR(45)
      ,@apematerno  VARCHAR(45)
      ,@nombre  VARCHAR(45)
      ,@sex CHAR(1)
      ,@dni  VARCHAR(8)
      ,@fechnac DATE
      ,@email  VARCHAR(45)
      ,@tel  VARCHAR(45)
      ,@idcar INT
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO [dbo].[alumno] (
	  [apellido_paterno]
      ,[apellido_materno]
      ,[nombres]
      ,[sexo]
      ,[dni]
      ,[fecha_nacimiento]
      ,[email]
      ,[telefono]
      ,[idcarrera])
	VALUES(      
		@apepaterno 
      ,@apematerno  
      ,@nombre 
      ,@sex 
      ,@dni  
      ,@fechnac 
      ,@email  
      ,@tel 
      ,@idcar )
END

GO
CREATE PROCEDURE [dbo].[SP_NUEVO_CURSO]
	@nombrecurso VARCHAR(45),
	@idecarrera INT,
	@semestrecur INT,
	@descripcion VARCHAR(45)
AS
BEGIN
	INSERT INTO [dbo].[cursos] (nombre,idcarrera,semestre, obs)
						 VALUES(@nombrecurso,@idecarrera,@semestrecur,@descripcion);
END

GO

INSERT INTO [carrera_profesional] ([idcarrera], [nombre_carrera], [estado]) VALUES (1, 'Computacion e Informatica', 'A'); 
GO
INSERT INTO [carrera_profesional] ([idcarrera], [nombre_carrera], [estado]) VALUES (2, 'Enfermeria Tectica', 'A'); 
GO
INSERT INTO [carrera_profesional] ([idcarrera], [nombre_carrera], [estado]) VALUES (3, 'Produccion Agropecuaria', 'A'); 
GO
INSERT INTO [carrera_profesional] ([idcarrera], [nombre_carrera], [estado]) VALUES (4, 'Contabilidad Tecnica', 'I'); 

GO
INSERT INTO [usuario] ([login], [clave], [tipo], [estado]) VALUES ('luis', '123', 'adm', 'A'); 
GO