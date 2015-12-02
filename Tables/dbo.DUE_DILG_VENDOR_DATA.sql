CREATE TABLE [dbo].[DUE_DILG_VENDOR_DATA]
(
[DUE_DILG_VENDOR_DATA_KEY] [numeric] (19, 0) NOT NULL IDENTITY(1, 1),
[DUE_DILG_VENDOR_DATA_ID] [numeric] (19, 0) NOT NULL,
[IS_CURRENT] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[IS_DELETED] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[IS_CURRENT_DAY] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[VALID_FROM] [datetime] NOT NULL,
[VALID_TILL] [datetime] NOT NULL,
[LAST_MODIFIED_BY] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[LAST_MODIFIED_ON] [datetime] NOT NULL,
[BATCH_ID] [bigint] NOT NULL,
[PRICING_SCENARIO_ID] [numeric] (19, 0) NULL,
[DUE_DILG_VENDOR_STATUS_ID] [numeric] (19, 0) NULL,
[COMPANY_ID] [numeric] (19, 0) NULL,
[VENDOR_LOAN_NUMBER] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[VENDOR_STATUS_DATE] [datetime] NULL,
[VENDOR_STATUS_DATE_AS_LONG] [numeric] (19, 0) NULL,
[DUE_DILG_VENDOR_DATA_UUID] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CREATED_DATE] [datetime] NULL,
[UPDATED_DATE] [datetime] NULL,
[PRICING_SCENARIO_KEY] [numeric] (19, 0) NULL,
[DUE_DILG_VENDOR_STATUS_KEY] [numeric] (19, 0) NULL,
[COMPANY_KEY] [numeric] (19, 0) NULL,
[NAMESPACE] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DUE_DILG_VENDOR_DATA] ADD CONSTRAINT [pk__due_dilg_vendor] PRIMARY KEY CLUSTERED  ([DUE_DILG_VENDOR_DATA_KEY]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [due_dilg_vendor_data_idx_uuid] ON [dbo].[DUE_DILG_VENDOR_DATA] ([DUE_DILG_VENDOR_DATA_UUID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [due_dilg_vendor_data_fk1] ON [dbo].[DUE_DILG_VENDOR_DATA] ([PRICING_SCENARIO_ID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [due_dilg_vendor_data_idx1] ON [dbo].[DUE_DILG_VENDOR_DATA] ([VENDOR_LOAN_NUMBER]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [due_dilg_vendor_data_idx3] ON [dbo].[DUE_DILG_VENDOR_DATA] ([VENDOR_STATUS_DATE]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [due_dilg_vendor_data_idx2] ON [dbo].[DUE_DILG_VENDOR_DATA] ([VENDOR_STATUS_DATE_AS_LONG]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DUE_DILG_VENDOR_DATA] ADD CONSTRAINT [due_dilg_vendor_data_due_dilg_vendor_status] FOREIGN KEY ([DUE_DILG_VENDOR_STATUS_KEY]) REFERENCES [dbo].[DUE_DILG_VENDOR_STATUS] ([DUE_DILG_VENDOR_STATUS_KEY])
GO
ALTER TABLE [dbo].[DUE_DILG_VENDOR_DATA] ADD CONSTRAINT [due_dilg_vendor_data_pricing_scenario] FOREIGN KEY ([PRICING_SCENARIO_KEY]) REFERENCES [dbo].[PRICING_SCENARIO] ([PRICING_SCENARIO_KEY])
GO
