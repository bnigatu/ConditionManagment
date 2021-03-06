CREATE TABLE [cmt].[ACTIVITY_STATUS]
(
[ACTIVITY_STATUS_KEY] [numeric] (19, 0) NOT NULL IDENTITY(1, 1),
[ACTIVITY_STATUS_ID] [numeric] (19, 0) NOT NULL,
[BATCH_ID] [bigint] NOT NULL,
[LAST_MODIFIED_ON] [datetime] NOT NULL,
[LAST_MODIFIED_BY] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[IS_CURRENT] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[IS_DELETED] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Action] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ModDate] [datetime] NOT NULL,
[ModBy] [nvarchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DESCRIPTION] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OPEN_STATUS_FLAG] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ACTIVITY_STATUS_UUID] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NAMESPACE] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [cmt].[ACTIVITY_STATUS] ADD CONSTRAINT [pk__ACTIVITY_STATUS] PRIMARY KEY CLUSTERED  ([ACTIVITY_STATUS_KEY]) ON [PRIMARY]
GO
