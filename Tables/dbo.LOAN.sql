CREATE TABLE [dbo].[LOAN]
(
[LOAN_KEY] [numeric] (19, 0) NOT NULL IDENTITY(1, 1),
[LOAN_ID] [numeric] (19, 0) NOT NULL,
[IS_CURRENT] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[IS_DELETED] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[IS_CURRENT_DAY] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[VALID_FROM] [datetime] NOT NULL,
[VALID_TILL] [datetime] NOT NULL,
[LAST_MODIFIED_BY] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[LAST_MODIFIED_ON] [datetime] NOT NULL,
[BATCH_ID] [bigint] NOT NULL,
[VERSION_NUMBER] [numeric] (19, 0) NOT NULL,
[PROPERTY_ID] [numeric] (19, 0) NULL,
[LOAN_ORIGINATOR_ID] [numeric] (19, 0) NULL,
[ORIGINATING_PARTNER_ID] [numeric] (19, 0) NULL,
[DOCUMENTATION_TYPE_ID] [numeric] (19, 0) NULL,
[STATUS_ID] [numeric] (19, 0) NULL,
[TITLE_ORDER_DETAILS_ID] [numeric] (19, 0) NULL,
[POLICY_ID] [numeric] (19, 0) NULL,
[COMPANY_ID] [numeric] (19, 0) NULL,
[CREATED_BY_ID] [numeric] (19, 0) NULL,
[SELLING_COMPANY_ID] [numeric] (19, 0) NULL,
[LOAN_PURPOSE_ID] [numeric] (19, 0) NULL,
[ESCROW_TYPE_ID] [numeric] (19, 0) NULL,
[APPLICATION_DATE] [datetime] NULL,
[SIGNING_DATE] [datetime] NULL,
[FUNDING_DATE] [datetime] NULL,
[LOAN_NUMBER] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TOTAL_LOAN_AMOUNT] [numeric] (2, 2) NULL,
[LOAN_UUID] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ARMS_LENGTH_FLAG] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NEEDS_POLICY_VERIF_FLAG] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CREATED_DATE] [datetime] NULL,
[UPDATED_DATE] [datetime] NULL,
[CREATED_DATE_AS_LONG] [numeric] (19, 0) NULL,
[UPDATED_DATE_AS_LONG] [numeric] (19, 0) NULL,
[INVALID_FLAG] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CLEARED_BY_CSTD_FLAG] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CMT_VISIBLE_FLAG] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PROPERTY_KEY] [numeric] (19, 0) NULL,
[LOAN_ORIGINATOR_KEY] [numeric] (19, 0) NULL,
[ORIGINATING_PARTNER_KEY] [numeric] (19, 0) NULL,
[DOCUMENTATION_TYPE_KEY] [numeric] (19, 0) NULL,
[STATUS_KEY] [numeric] (19, 0) NULL,
[TITLE_ORDER_DETAILS_KEY] [numeric] (19, 0) NULL,
[POLICY_KEY] [numeric] (19, 0) NULL,
[COMPANY_KEY] [numeric] (19, 0) NULL,
[CREATED_BY_KEY] [numeric] (19, 0) NULL,
[SELLING_COMPANY_KEY] [numeric] (19, 0) NULL,
[LOAN_PURPOSE_KEY] [numeric] (19, 0) NULL,
[ESCROW_TYPE_KEY] [numeric] (19, 0) NULL,
[NAMESPACE] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LOAN] ADD CONSTRAINT [pk__loan] PRIMARY KEY CLUSTERED  ([LOAN_KEY]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [loan_idx3] ON [dbo].[LOAN] ([COMPANY_ID], [LOAN_NUMBER]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [loan_idx2] ON [dbo].[LOAN] ([CREATED_DATE]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [loan_idx1] ON [dbo].[LOAN] ([LOAN_NUMBER]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [loan_idx_uuid] ON [dbo].[LOAN] ([LOAN_UUID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LOAN] ADD CONSTRAINT [loan_company_key] FOREIGN KEY ([COMPANY_KEY]) REFERENCES [dbo].[COMPANY] ([COMPANY_KEY])
GO
ALTER TABLE [dbo].[LOAN] ADD CONSTRAINT [loan_selling_company_key] FOREIGN KEY ([SELLING_COMPANY_KEY]) REFERENCES [dbo].[COMPANY] ([COMPANY_KEY])
GO
