SELECT type_desc, obj.name AS SP_NAME,  sm.definition AS SP_DEFINITION
FROM sys.sql_modules AS sm
INNER JOIN sys.objects AS obj ON sm.object_id = obj.object_id
WHERE sm.definition LIKE '%create%'   
ORDER BY type_desc