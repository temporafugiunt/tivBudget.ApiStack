﻿CREATE TABLE [freebyTrack].[Budgets] (
    [ID]                         UNIQUEIDENTIFIER CONSTRAINT [DF_Budgets_ID] DEFAULT (newsequentialid()) NOT NULL,
    [Description]                NVARCHAR (128)   NOT NULL,
    [Year]                       INT              NOT NULL,
    [Month]                      INT              NOT NULL,
    [OwnerID]                    UNIQUEIDENTIFIER NOT NULL,
    [DisplayIndex]               INT              NOT NULL,
    [ActualIncome]               DECIMAL (18, 2)  NOT NULL,
    [EstimatedIncome]            DECIMAL (18, 2)  NOT NULL,
    [ActualMinusEstimatedIncome] DECIMAL (18, 2)  NOT NULL,
    [ActualSpending]             DECIMAL (18, 2)  NOT NULL,
    [EstimatedSpending]          DECIMAL (18, 2)  NOT NULL,
    [ActualRemaining]            DECIMAL (18, 2)  NOT NULL,
    [EstimatedRemaining]         DECIMAL (18, 2)  NOT NULL,
    [CreatedOn]                  DATETIME         NOT NULL,
    [CreatedBy]                  NVARCHAR (50)    NOT NULL,
    [ModifiedOn]                 DATETIME         NULL,
    [ModifiedBy]                 NVARCHAR (50)    NULL,
    [StartDate]                  DATE             NOT NULL,
    [ts]                         ROWVERSION       NOT NULL,
    CONSTRAINT [PK_Budgets] PRIMARY KEY NONCLUSTERED ([ID] ASC),
    CONSTRAINT [UC_BudgetsOwnerIDMonthYearDescription] UNIQUE CLUSTERED ([OwnerID] ASC, [Month] ASC, [Year] ASC, [Description] ASC)
);

