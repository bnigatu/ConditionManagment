CREATE TABLE [cmt].[INVESTOR_STATUS]
(
[INVESTOR_STATUS_KEY] [numeric] (19, 0) NOT NULL IDENTITY(1, 1),
[INVESTOR_STATUS_ID] [numeric] (19, 0) NOT NULL,
[BATCH_ID] [bigint] NOT NULL,
[LAST_MODIFIED_ON] [datetime] NOT NULL,
[LAST_MODIFIED_BY] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[IS_CURRENT] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[IS_DELETED] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[COMPANY_ID] [numeric] (19, 0) NULL,
[DESCRIPTION] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[INVESTOR_STATUS_UUID] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FINAL_DISPOSITION_FLAG] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[COMPANY_KEY] [numeric] (19, 0) NULL,
[NAMESPACE] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [cmt].[INVESTOR_STATUS] ADD CONSTRAINT [pk__investor_status] PRIMARY KEY CLUSTERED  ([INVESTOR_STATUS_KEY]) ON [PRIMARY]
GO
