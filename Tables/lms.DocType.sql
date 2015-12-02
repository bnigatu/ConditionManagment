CREATE TABLE [lms].[DocType]
(
[DocType_Key] [bigint] NOT NULL IDENTITY(1, 1),
[DocType_ID] [numeric] (10, 0) NOT NULL,
[BATCH_ID] [bigint] NOT NULL,
[LAST_MODIFIED_ON] [datetime] NOT NULL,
[LAST_MODIFIED_BY] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[IS_CURRENT] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[IS_DELETED] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Username] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Timestamp] [datetime] NULL,
[NAME] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Code] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Class] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RequiredForFundingFlag] [int] NULL,
[TrailingFlag] [int] NULL,
[CustodialFlag] [int] NULL,
[DiligenceFlag] [int] NULL,
[ShowOnPortalFlag] [int] NULL,
[MasterID] [numeric] (10, 0) NULL,
[NAMESPACE] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [lms].[DocType] ADD CONSTRAINT [pk_doctype] PRIMARY KEY CLUSTERED  ([DocType_Key]) ON [PRIMARY]
GO
