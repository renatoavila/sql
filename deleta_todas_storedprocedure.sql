DECLARE @nome varchar(100) ='%sp_XXX%' --'sp_XXX'
DECLARE @estaAtento bit = 0 

IF(@estaAtento = 0) 
BEGIN
	SELECT [name]
	FROM sys.objects
	WHERE TYPE = 'p'
	  AND [name] LIKE @nome 

	RAISERROR('Execute com atenção!!!!!!!!!!!',18, 0) 
	RETURN;
END 
ELSE
BEGIN
	
	SELECT [name]
	FROM sys.objects
	WHERE TYPE = 'p'
	  AND [name] LIKE @nome 

	DECLARE @procName varchar(500) 
	DECLARE cur
	CURSOR
	FOR
		SELECT [name]
		FROM sys.objects
		WHERE TYPE = 'p'
		  AND [name] LIKE @nome 

		OPEN cur FETCH NEXT
		  FROM cur INTO @procName WHILE @@fetch_status = 0 
		BEGIN exec('drop procedure [' + @procName + ']') FETCH NEXT
	FROM cur INTO @procName END CLOSE cur DEALLOCATE cur
END 