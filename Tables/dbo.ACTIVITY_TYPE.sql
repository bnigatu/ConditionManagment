CREATE TABLE [dbo].[ACTIVITY_TYPE]
(
[ACTIVITY_TYPE_KEY] [numeric] (19, 0) NOT NULL IDENTITY(1, 1),
[ACTIVITY_TYPE_ID] [numeric] (19, 0) NOT NULL,
[IS_CURRENT] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[IS_DELETED] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[IS_CURRENT_DAY] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[VALID_FROM] [datetime] NOT NULL,
[VALID_TILL] [datetime] NOT NULL,
[LAST_MODIFIED_BY] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[LAST_MODIFIED_ON] [datetime] NOT NULL,
[BATCH_ID] [bigint] NOT NULL,
[CODE] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DESCRIPTION] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ACTIVITY_CATEGORY] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ACTIVITY_TYPE_UUID] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NAMESPACE] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ACTIVITY_TYPE] ADD CONSTRAINT [pk__activity_type] PRIMARY KEY CLUSTERED  ([ACTIVITY_TYPE_KEY]) ON [PRIMARY]
GO
