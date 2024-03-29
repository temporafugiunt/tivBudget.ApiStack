﻿-- =============================================
-- Author:		James Eby
-- Create date: 4-10-2014
-- Description:	Retrieves the current balance for
--              all accounts up to and
--				including the given date.
-- =============================================
CREATE PROCEDURE [freebyTrack].[Accounting_GetCurrentBalanceAllAccounts]
	@OwnerID uniqueidentifier,
	@CurrentValueDate date,
	@AccountTypeId int = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
  
    SELECT a.ID, SUM(freebyTrack.Accounting_GetCategoryBalance(ac.ID, @CurrentValueDate)) as CurrentBalance
    FROM freebyTrack.Accounts a
    INNER JOIN freebyTrack.AccountCategories ac ON a.ID = ac.AccountID
    WHERE a.OwnerID = @OwnerID AND ((@AccountTypeId IS NULL) OR (@AccountTypeID = a.AccountTypeID))
    GROUP BY a.ID
END


