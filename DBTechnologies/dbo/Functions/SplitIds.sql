CREATE FUNCTION SplitIds
(
	 @Ids NVARCHAR(1000)
	,@Separator CHAR(1)
)
RETURNS 
@IdsTable TABLE (Id INT)
AS
BEGIN
	DECLARE @separatorindex INT = 1
	DECLARE @Id NVARCHAR(10)
	 
	WHILE @separatorindex > 0
	BEGIN
		SELECT @separatorindex = CHARINDEX(@Separator,@Ids)

		IF @separatorindex  > 0
			SELECT @Id = LEFT(@Ids,@separatorindex - 1)
		ELSE
			SELECT @Id = @Ids

		INSERT @IdsTable(Id) VALUES (@Id)

		SELECT @Ids = RIGHT(@Ids,LEN(@Ids) - @separatorindex)
	END
	
	RETURN
END