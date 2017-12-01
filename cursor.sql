use seubanco

DECLARE 
			@variavelInt int,
			@variavelVarchar VARCHAR(30)
 
DECLARE cursorNome CURSOR FOR
select variavelInt, variavelVarchar from tabela
 
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