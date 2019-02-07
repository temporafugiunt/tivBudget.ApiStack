﻿CREATE TABLE [freebyTrack].[BudgetItemTemplates] (
    [ID]                            UNIQUEIDENTIFIER CONSTRAINT [DF_BudgetItemTemplates_ID] DEFAULT (newsequentialid()) NOT NULL,
    [CategoryTemplateID]            UNIQUEIDENTIFIER NOT NULL,
    [Description]                   NVARCHAR (128)   NOT NULL,
    [OwnerID]                       UNIQUEIDENTIFIER NULL,
    [IsLinkable]                    BIT              NOT NULL,
    [LinkableAccountTypeID]         INT              NULL,
    [LinkableAccountTemplateID]     UNIQUEIDENTIFIER NULL,
    [IsTransferable]                BIT              NOT NULL,
    [TransferableAccountTypeID]     INT              NULL,
    [TransferableAccountTemplateID] UNIQUEIDENTIFIER NULL,
    [IsEnvelopeAllowed]             BIT              NOT NULL,
    [CreatedOn]                     DATETIME         NOT NULL,
    [CreatedBy]                     NVARCHAR (50)    NOT NULL,
    [ModifiedOn]                    DATETIME         NULL,
    [ModifiedBy]                    NVARCHAR (50)    NULL,
    [ts]                            ROWVERSION       NOT NULL,
    CONSTRAINT [PK_BudgetItemTemplates] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_BudgetItemTemplates_AccountTemplates] FOREIGN KEY ([LinkableAccountTemplateID]) REFERENCES [freebyTrack].[AccountTemplates] ([ID]),
    CONSTRAINT [FK_BudgetItemTemplates_AccountTemplates1] FOREIGN KEY ([TransferableAccountTemplateID]) REFERENCES [freebyTrack].[AccountTemplates] ([ID]),
    CONSTRAINT [FK_BudgetItemTemplates_AccountTypes] FOREIGN KEY ([LinkableAccountTypeID]) REFERENCES [freebyTrack].[AccountTypes] ([ID]),
    CONSTRAINT [FK_BudgetItemTemplates_AccountTypes1] FOREIGN KEY ([TransferableAccountTypeID]) REFERENCES [freebyTrack].[AccountTypes] ([ID]),
    CONSTRAINT [FK_BudgetItemTemplates_BudgetCategoryTemplates] FOREIGN KEY ([CategoryTemplateID]) REFERENCES [freebyTrack].[BudgetCategoryTemplates] ([ID]),
    CONSTRAINT [FK_BudgetItemTemplates_Users] FOREIGN KEY ([OwnerID]) REFERENCES [Security].[Users] ([ID]),
    CONSTRAINT [UC_BudgetItemTemplates] UNIQUE NONCLUSTERED ([CategoryTemplateID] ASC, [OwnerID] ASC, [Description] ASC)
);

