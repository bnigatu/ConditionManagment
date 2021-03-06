CREATE TABLE [dbo].[DUE_DILG_VENDOR_STATUS]
(
[DUE_DILG_VENDOR_STATUS_KEY] [numeric] (19, 0) NOT NULL IDENTITY(1, 1),
[DUE_DILG_VENDOR_STATUS_ID] [numeric] (19, 0) NOT NULL,
[IS_CURRENT] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[IS_DELETED] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[IS_CURRENT_DAY] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[VALID_FROM] [datetime] NOT NULL,
[VALID_TILL] [datetime] NOT NULL,
[LAST_MODIFIED_BY] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[LAST_MODIFIED_ON] [datetime] NOT NULL,
[BATCH_ID] [bigint] NOT NULL,
[COMPANY_ID] [numeric] (19, 0) NULL,
[DUE_DILG_STATUS_TYPE_ID] [numeric] (19, 0) NULL,
[CODE] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DESCRIPTION] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DUE_DILG_VENDOR_STATUS_UUID] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[COMPANY_KEY] [numeric] (19, 0) NULL,
[DUE_DILG_STATUS_TYPE_KEY] [numeric] (19, 0) NULL,
[NAMESPACE] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DUE_DILG_VENDOR_STATUS] ADD CONSTRAINT [pk__due_dilg_vendor___7d439abd] PRIMARY KEY CLUSTERED  ([DUE_DILG_VENDOR_STATUS_KEY]) ON [PRIMARY]
GO
