USE CUIDATEYA;
GO

-- =============================================
-- Author:      José Toro Alcarraz.
-- Create date: 01/04/2018
-- Description: Procedimiento para buscar registros de enfermedad
-- =============================================
ALTER PROCEDURE USP_BUSCAR_ENFERMEDAD
@CADENA VARCHAR(100)
AS
SELECT  C.id_cont, C.titulo_cont, 
	CASE
		WHEN U.sex_usu = 'F' THEN 'Dra. ' + U.nom_usu + ' ' + U.ape_usu
		WHEN U.sex_usu = 'M' THEN 'Dr. ' + U.nom_usu + ' ' + U.ape_usu
	END AS medico 
FROM CONTENIDO C INNER JOIN MEDICO M
ON C.id_med = M.id_med INNER JOIN USUARIO U
ON M.id_usu = U.id_usu
WHERE C.titulo_cont LIKE '%' + @CADENA + '%' 
OR C.desc_general_cont LIKE '%' + @CADENA + '%'
OR C.sintomas_cont LIKE '%' + @CADENA + '%'
OR C.pruebas_cont LIKE '%' + @CADENA + '%'
OR C.info_adi_cont LIKE '%' + @CADENA + '%'
OR C.ls_sintomas_cont LIKE '%' + @CADENA + '%' 
GO

-- =============================================
-- Author:      José Toro Alcarraz.
-- Create date: 01/04/2018
-- Description: Procedimiento para obtener detalle de una enfermedad seleccionada
-- =============================================

-- OBTENER DETALLE ENFERMEDAD
ALTER PROCEDURE USP_OBTENER_ENFERMEDAD
@ID INT
AS
	SELECT C.titulo_cont,C.resumen_cont,C.desc_general_cont,C.causas_cont,C.
	sintomas_cont,C.pruebas_cont,C.tratamientos_cont,C.info_adi_cont,
	C.refe_biblio_cont,C.ls_epidemiologia_cont,ls_sintomas_cont,
	C.ls_factores_desc_cont,C.ls_especialidades_cont,
	CASE
		WHEN U.sex_usu = 'F' THEN 'Dra. ' + U.nom_usu + ' ' + U.ape_usu
		WHEN U.sex_usu = 'M' THEN 'Dr. ' + U.nom_usu + ' ' + U.ape_usu
	END AS medico,C.fec_cre_cont,C.fec_mod_cont
	FROM CONTENIDO C INNER JOIN MEDICO M 
	ON C.id_med = M.id_med INNER JOIN USUARIO U
	ON M.id_usu = U.id_usu
	WHERE C.id_cont = @ID
GO

-- =============================================
-- Author:      José Toro Alcarraz.
-- Create date: 01/04/2018
-- Description: Procedimiento para insertar registros de médicos con transacción y control de errores.
-- =============================================
ALTER PROCEDURE USP_REGISTRAR_MEDICO
	-- param tb padre
	@NOM_USU VARCHAR(50),
	@APE_USU VARCHAR(50),
	@EDAD_USU INT,
	@FEC_NAC_USU DATE,
	@SEX_USU CHAR(1),
	@DIR_USU TEXT,
	@TELE_USU CHAR(15),
	@EMAIL_USU VARCHAR(50),
	@CONTRASEÑA_USU CHAR(20),
	@ID_NACIO INT,
	@ID_TIPO_USUARIO INT,
	-- param tb hijo
	@COM_MED TEXT,
	@BIBLIO_MED TEXT,
	@ID_ESPE INT,
	@ID_PAIS_RES INT
	-- retona mensaje
    --@MSG VARCHAR(100) OUTPUT
AS    
BEGIN
    SET NOCOUNT OFF; -- Si esta en On no devuelve el msg

    Begin Tran Tadd
	Begin Try
		-- registra tabla padre
		INSERT INTO USUARIO (nom_usu,ape_usu,edad_usu,fec_nac_usu,sex_usu,dir_usu,tele_usu,email_usu,contraseña_usu,id_nacio,id_tipo_usuario)
		VALUES (@NOM_USU,@APE_USU,@EDAD_USU,@FEC_NAC_USU,@SEX_USU,@DIR_USU,@TELE_USU,@EMAIL_USU,@CONTRASEÑA_USU,@ID_NACIO,@ID_TIPO_USUARIO)
		-- registra taba hijo
		INSERT INTO MEDICO (com_med,biblio_med,id_espe,id_pais_res,id_usu)
		VALUES (@COM_MED,@BIBLIO_MED,@ID_ESPE,@ID_PAIS_RES,@@IDENTITY)
		-- carga mensaje
		-- SET @msg = 'El Usuario se registro correctamente.'
		-- confirma tx
		COMMIT TRAN Tadd
	End try
	Begin Catch
		-- carga mensaje
		-- SET @msg = 'Ocurrio un Error: ' + ERROR_MESSAGE() + ' en la línea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'
		-- deshace tx
		Rollback TRAN Tadd
	End Catch
END
GO

-- TEST USP
DECLARE @msg AS VARCHAR(100);
EXEC USP_REGISTRAR_MEDICO 'jOSE','TORO',NULL,NULL,NULL,NULL,'99999999','jose@gmail.com',NULL,1,'COMENTARIO','BIBLIO',1,1,@msg OUTPUT
SELECT @msg AS msg
GO

-- =============================================
-- Author:      José Toro Alcarraz.
-- Create date: 01/04/2018
-- Description: Procedimiento para validar el inicio de sesión de usuario.
-- =============================================
ALTER PROCEDURE USP_USUARIO_LOGIN
@USER_LOGIN VARCHAR(50),
@USER_PASSWORD CHAR(20)
AS
SELECT COUNT(*) FROM USUARIO WHERE email_usu = @USER_LOGIN AND contraseña_usu = @USER_PASSWORD
GO

- TEST USP
EXEC USP_USUARIO_LOGIN 'jtoro@gmail.com','admin'
GO


-- =============================================
-- Author:      José Toro Alcarraz.
-- Create date: 01/04/2018
-- Description: Procedimiento para gestionar los permisos del usuario.
-- =============================================
ALTER PROCEDURE USP_USERS_PERMISOS
@USER_LOGIN NVARCHAR(50)
AS
	SELECT U.nom_usu,P.administrador,P.medico,P.paciente
	FROM USUARIO U JOIN TIPO_USUARIO TU 
	ON U.id_tipo_usuario = TU.id_tipo_usuario JOIN PERMISO P
	ON TU.id_tipo_usuario = P.id_tipo_usuario
	WHERE U.email_usu = @USER_LOGIN
GO

-- TEST USP
USP_USERS_PERMISOS 'jtoro@gmail.com'
GO
