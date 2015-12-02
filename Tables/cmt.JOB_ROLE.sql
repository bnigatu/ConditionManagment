CREATE TABLE [cmt].[JOB_ROLE]
(
[JOB_ROLE_KEY] [numeric] (19, 0) NOT NULL IDENTITY(1, 1),
[JOB_ROLE_ID] [numeric] (19, 0) NOT NULL,
[BATCH_ID] [bigint] NOT NULL,
[LAST_MODIFIED_ON] [datetime] NOT NULL,
[LAST_MODIFIED_BY] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[IS_CURRENT] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[IS_DELETED] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[NAME] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DESCRIPTION] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[JOB_ROLE_UUID] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NAMESPACE] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [cmt].[JOB_ROLE] ADD CONSTRAINT [pk__job_role__607251e5] PRIMARY KEY CLUSTERED  ([JOB_ROLE_KEY]) ON [PRIMARY]
GO
