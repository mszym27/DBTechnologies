CREATE PROCEDURE dbo.NumberOfAttendees
AS
BEGIN
	SELECT [CourseName]
		,LocationName
		,SUM([PlannedAmount]) AS Planned
		,SUM([Amount]) AS Actual
	FROM [dbo].[CourseSalesView]
	WHERE [IsRecrutationStillOpen] = 1
	GROUP BY [CourseName], LocationName
	ORDER BY Planned DESC
END