USE tempdb 
GO
/*
CREATE TABLE dbo.OnePagePerRow (
	IDcol INT IDENTITY PRIMARY KEY CLUSTERED,
	LongString NCHAR(4000)
);

SET NOCOUNT ON
*/
BEGIN TRANSACTION

DECLARE @i INT;
SET @i=0;

WHILE @i < 10000
BEGIN
	INSERT INTO dbo.OnePagePerRow (LongString)
	SELECT REPLICATE(N'a', 2000);

	SET @i=@i+1;
END

--COMMIT TRANSACTION
--ROLLBACK TRANSACTION
