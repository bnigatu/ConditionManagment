CREATE TABLE [cmt].[COMPANY]
(
[COMPANY_KEY] [numeric] (19, 0) NOT NULL IDENTITY(1, 1),
[COMPANY_ID] [numeric] (19, 0) NOT NULL,
[BATCH_ID] [bigint] NOT NULL,
[LAST_MODIFIED_ON] [datetime] NOT NULL,
[LAST_MODIFIED_BY] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[IS_CURRENT] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[IS_DELETED] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[VERSION_NUMBER] [numeric] (19, 0) NULL,
[OWNING_COMPANY_ID] [numeric] (19, 0) NULL,
[COMPANY_NAME] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[COMPANY_CODE] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EMAIL_PATTERN] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ADMIN_EMAIL_TO_ADDRESS] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LOAN_SELLER_FLAG] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[REPOSITORY_BASE_DIRECTORY] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[REPOSITORY_SUB_DIRECTORY] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[COMPANY_UUID] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BUSINESS_DAY_CALENDAR_ID] [numeric] (19, 0) NULL,
[OWNING_COMPANY_KEY] [numeric] (19, 0) NULL,
[BUSINESS_DAY_CALENDAR_KEY] [numeric] (19, 0) NULL,
[NAMESPACE] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [cmt].[COMPANY] ADD CONSTRAINT [pk__company] PRIMARY KEY CLUSTERED  ([COMPANY_KEY]) ON [PRIMARY]
GO
