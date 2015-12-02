CREATE TABLE [cmt].[ACTIVITY]
(
[ACTIVITY_KEY] [numeric] (19, 0) NOT NULL IDENTITY(1, 1),
[ACTIVITY_ID] [numeric] (19, 0) NOT NULL,
[BATCH_ID] [bigint] NOT NULL,
[LAST_MODIFIED_ON] [datetime] NOT NULL,
[LAST_MODIFIED_BY] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[IS_CURRENT] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[IS_DELETED] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ACTIVITY_CLASS] [varchar] (96) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[VERSION_NUMBER] [numeric] (19, 0) NULL,
[ACTIVITY_TYPE_ID] [numeric] (19, 0) NULL,
[LOAN_ID] [numeric] (19, 0) NULL,
[CONTACT_ID] [numeric] (19, 0) NULL,
[ACTIVITY_STATUS_ID] [numeric] (19, 0) NULL,
[ACTIVITY_SOURCE_ID] [numeric] (19, 0) NULL,
[SOURCE_ACTIVITY_STATUS_ID] [numeric] (19, 0) NULL,
[SOURCE_ACTIVITY_TYPE_ID] [numeric] (19, 0) NULL,
[CREATED_DATE] [datetime] NULL,
[UPDATED_DATE] [datetime] NULL,
[CREATED_DATE_AS_LONG] [numeric] (19, 0) NULL,
[UPDATED_DATE_AS_LONG] [numeric] (19, 0) NULL,
[NOTES] [varchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DESCRIPTION] [varchar] (8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SOURCE_ACTIVITY_IDENTIFIER] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SOURCE_DESCRIPTION] [varchar] (8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SELLER_VIEWABLE_FLAG] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SOURCE_UPDATED_DATE] [datetime] NULL,
[SOURCE_DESCRIPTION_UPDATED_DATE] [datetime] NULL,
[DESCRIPTION_UPDATED_DATE] [datetime] NULL,
[ACTIVITY_UUID] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SOURCE_ACKNOWLEDGED_FLAG] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OPEN_DATE] [datetime] NULL,
[EXCLUDED_FLAG] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ACTIVITY_BI_UUID] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ACTIVITY_CLOSED_DATE] [datetime] NULL,
[ACTIVITY_TYPE_KEY] [numeric] (19, 0) NULL,
[LOAN_KEY] [numeric] (19, 0) NULL,
[CONTACT_KEY] [numeric] (19, 0) NULL,
[ACTIVITY_STATUS_KEY] [numeric] (19, 0) NULL,
[ACTIVITY_SOURCE_KEY] [numeric] (19, 0) NULL,
[SOURCE_ACTIVITY_STATUS_KEY] [numeric] (19, 0) NULL,
[SOURCE_ACTIVITY_TYPE_KEY] [numeric] (19, 0) NULL,
[NAMESPACE] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [cmt].[ACTIVITY] ADD CONSTRAINT [pk__activity] PRIMARY KEY CLUSTERED  ([ACTIVITY_KEY]) ON [PRIMARY]
GO
