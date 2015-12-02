IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'report_user')
CREATE LOGIN [report_user] WITH PASSWORD = 'p@ssw0rd'
GO
CREATE USER [report_user] FOR LOGIN [report_user]
GO
