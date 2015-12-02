CREATE TABLE [cmt].[SOURCE_ACTIVITY_STATUS]
(
[SOURCE_ACTIVITY_STATUS_KEY] [numeric] (19, 0) NOT NULL IDENTITY(1, 1),
[SOURCE_ACTIVITY_STATUS_ID] [numeric] (19, 0) NOT NULL,
[BATCH_ID] [bigint] NOT NULL,
[LAST_MODIFIED_ON] [datetime] NOT NULL,
[LAST_MODIFIED_BY] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[IS_CURRENT] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[IS_DELETED] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ACTIVITY_SOURCE_ID] [numeric] (19, 0) NULL,
[ACTIVITY_STATUS_ID] [numeric] (19, 0) NULL,
[DESCRIPTION] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CODE] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SOURCE_ACTIVITY_STATUS_UUID] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ACTIVITY_SOURCE_KEY] [numeric] (19, 0) NULL,
[ACTIVITY_STATUS_KEY] [numeric] (19, 0) NULL,
[NAMESPACE] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [cmt].[SOURCE_ACTIVITY_STATUS] ADD CONSTRAINT [pk__source_activity] PRIMARY KEY CLUSTERED  ([SOURCE_ACTIVITY_STATUS_KEY]) ON [PRIMARY]
GO
