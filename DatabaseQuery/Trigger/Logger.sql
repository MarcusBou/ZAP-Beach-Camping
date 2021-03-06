USE [ZAP_Beach_Camping]
GO
/****** Object:  Trigger [dbo].[Logger]    Script Date: 16-06-2021 09:51:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Daniel Vuust
-- Create date: 16-06-21
-- Description:	Logs evrey change to the database
-- =============================================
CREATE OR ALTER   TRIGGER [dbo].[LoggerSpot]
   ON  [dbo].Spot
   FOR  INSERT, UPDATE,  DELETE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	--- Gets the tableName and saves it in the variable @tableName.
	DECLARE @tableName sysname;
	SELECT @tableName = OBJECT_NAME(parent_object_id) 
             FROM sys.objects 
             WHERE sys.objects.name = OBJECT_NAME(@@PROCID);
	
	INSERT INTO log (username, tableName, actionTime) VALUES (ORIGINAL_LOGIN(), @tableName, GETDATE());
END
