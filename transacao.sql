USE [seubanco]
GO

BEGIN TRY
	BEGIN TRAN  
		--Seu código aqui
		COMMIT;  

	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRAN

			DECLARE @ErrorMessage VARCHAR(MAX) = ERROR_MESSAGE()
			DECLARE @ErrorSeverity INT = ERROR_SEVERITY()
			DECLARE @ErrorState INT = ERROR_STATE()
 
			RAISERROR (
							@ErrorMessage,  
							@ErrorSeverity,  
							@ErrorState  
					   );
END CATCH

