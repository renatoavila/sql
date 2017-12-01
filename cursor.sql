USE [seubanco]
GO

DECLARE 
			@variavelInt INT,
			@variavelVarchar VARCHAR(30)
 
DECLARE cursorNome CURSOR FOR
SELECT variavelInt, variavelVarchar FROM tabela
 
OPEN cursorNome
 
FETCH NEXT FROM cursorNome INTO @variavelInt, @variavelVarchar
 
WHILE @@FETCH_STATUS = 0
BEGIN

	-- Seu código 
	-- select @variavelInt, @variavelVarchar 

FETCH NEXT FROM cursorNome INTO @variavelInt, @variavelVarchar
END
  
CLOSE cursorNome
  
DEALLOCATE cursorNome