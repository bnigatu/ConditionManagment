CREATE TABLE [cmt].[INV_DUE_DILG_SAMPLE_TYPE]
(
[INV_DUE_DILG_SAMPLE_TYPE_KEY] [numeric] (19, 0) NOT NULL IDENTITY(1, 1),
[INV_DUE_DILG_SAMPLE_TYPE_ID] [numeric] (19, 0) NOT NULL,
[BATCH_ID] [bigint] NOT NULL,
[LAST_MODIFIED_ON] [datetime] NOT NULL,
[LAST_MODIFIED_BY] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[IS_CURRENT] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[IS_DELETED] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Action] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ModDate] [datetime] NOT NULL,
[ModBy] [nvarchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[VERSION_NUMBER] [numeric] (19, 0) NOT NULL,
[COMPANY_ID] [numeric] (19, 0) NULL,
[DUE_DILG_SAMPLE_TYPE_ID] [numeric] (19, 0) NULL,
[INV_DUE_DILG_SAMPLE_TYPE_UUID] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DESCRIPTION] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SORT_ORDER] [int] NULL,
[NAMESPACE] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [cmt].[INV_DUE_DILG_SAMPLE_TYPE] ADD CONSTRAINT [pk__INV_DUE_DILG_SAMPLE_TYPE] PRIMARY KEY CLUSTERED  ([INV_DUE_DILG_SAMPLE_TYPE_KEY]) ON [PRIMARY]
GO
