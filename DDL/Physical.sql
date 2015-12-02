/*
 * ER/Studio Data Architect XE4 SQL Code Generation
 * Project :      DATA MODEL
 *
 * Date Created : Wednesday, December 02, 2015 12:57:24
 * Target DBMS : Microsoft SQL Server 2012
 */

USE master
go
CREATE DATABASE ConditionManagment
go
USE ConditionManagment
go
IF OBJECT_ID('ACTIVITY_COMMENT_V') IS NOT NULL
BEGIN
    DROP VIEW ACTIVITY_COMMENT_V
    PRINT '<<< DROPPED VIEW ACTIVITY_COMMENT_V >>>'
END
go
IF OBJECT_ID('ACTIVITY_STATUS_V') IS NOT NULL
BEGIN
    DROP VIEW ACTIVITY_STATUS_V
    PRINT '<<< DROPPED VIEW ACTIVITY_STATUS_V >>>'
END
go
IF OBJECT_ID('ACTIVITY_TYPE_v') IS NOT NULL
BEGIN
    DROP VIEW ACTIVITY_TYPE_v
    PRINT '<<< DROPPED VIEW ACTIVITY_TYPE_v >>>'
END
go
IF OBJECT_ID('ACTIVITY_V') IS NOT NULL
BEGIN
    DROP VIEW ACTIVITY_V
    PRINT '<<< DROPPED VIEW ACTIVITY_V >>>'
END
go
IF OBJECT_ID('COMPANY_V') IS NOT NULL
BEGIN
    DROP VIEW COMPANY_V
    PRINT '<<< DROPPED VIEW COMPANY_V >>>'
END
go
IF OBJECT_ID('CONDITION_v') IS NOT NULL
BEGIN
    DROP VIEW CONDITION_v
    PRINT '<<< DROPPED VIEW CONDITION_v >>>'
END
go
IF OBJECT_ID('DUE_DILG_VENDOR_DATA_v') IS NOT NULL
BEGIN
    DROP VIEW DUE_DILG_VENDOR_DATA_v
    PRINT '<<< DROPPED VIEW DUE_DILG_VENDOR_DATA_v >>>'
END
go
IF OBJECT_ID('DUE_DILG_VENDOR_STATUS_v') IS NOT NULL
BEGIN
    DROP VIEW DUE_DILG_VENDOR_STATUS_v
    PRINT '<<< DROPPED VIEW DUE_DILG_VENDOR_STATUS_v >>>'
END
go
IF OBJECT_ID('END_USER_v') IS NOT NULL
BEGIN
    DROP VIEW END_USER_v
    PRINT '<<< DROPPED VIEW END_USER_v >>>'
END
go
IF OBJECT_ID('HISTORY_EVENT_V') IS NOT NULL
BEGIN
    DROP VIEW HISTORY_EVENT_V
    PRINT '<<< DROPPED VIEW HISTORY_EVENT_V >>>'
END
go
IF OBJECT_ID('INV_CONDITION_STATUS_v') IS NOT NULL
BEGIN
    DROP VIEW INV_CONDITION_STATUS_v
    PRINT '<<< DROPPED VIEW INV_CONDITION_STATUS_v >>>'
END
go
IF OBJECT_ID('INV_DUE_DILG_SAMPLE_TYPE_V') IS NOT NULL
BEGIN
    DROP VIEW INV_DUE_DILG_SAMPLE_TYPE_V
    PRINT '<<< DROPPED VIEW INV_DUE_DILG_SAMPLE_TYPE_V >>>'
END
go
IF OBJECT_ID('INV_DUE_DILIGENCE_STATUS_v') IS NOT NULL
BEGIN
    DROP VIEW INV_DUE_DILIGENCE_STATUS_v
    PRINT '<<< DROPPED VIEW INV_DUE_DILIGENCE_STATUS_v >>>'
END
go
IF OBJECT_ID('INVESTOR_STATUS_v') IS NOT NULL
BEGIN
    DROP VIEW INVESTOR_STATUS_v
    PRINT '<<< DROPPED VIEW INVESTOR_STATUS_v >>>'
END
go
IF OBJECT_ID('JOB_ROLE_v') IS NOT NULL
BEGIN
    DROP VIEW JOB_ROLE_v
    PRINT '<<< DROPPED VIEW JOB_ROLE_v >>>'
END
go
IF OBJECT_ID('LOAN_COMMENT_v') IS NOT NULL
BEGIN
    DROP VIEW LOAN_COMMENT_v
    PRINT '<<< DROPPED VIEW LOAN_COMMENT_v >>>'
END
go
IF OBJECT_ID('LOAN_END_USER_v') IS NOT NULL
BEGIN
    DROP VIEW LOAN_END_USER_v
    PRINT '<<< DROPPED VIEW LOAN_END_USER_v >>>'
END
go
IF OBJECT_ID('LOAN_V') IS NOT NULL
BEGIN
    DROP VIEW LOAN_V
    PRINT '<<< DROPPED VIEW LOAN_V >>>'
END
go
IF OBJECT_ID('PRICING_SCENARIO_RATING_v') IS NOT NULL
BEGIN
    DROP VIEW PRICING_SCENARIO_RATING_v
    PRINT '<<< DROPPED VIEW PRICING_SCENARIO_RATING_v >>>'
END
go
IF OBJECT_ID('PRICING_SCENARIO_V') IS NOT NULL
BEGIN
    DROP VIEW PRICING_SCENARIO_V
    PRINT '<<< DROPPED VIEW PRICING_SCENARIO_V >>>'
END
go
IF OBJECT_ID('SOURCE_ACTIVITY_STATUS_v') IS NOT NULL
BEGIN
    DROP VIEW SOURCE_ACTIVITY_STATUS_v
    PRINT '<<< DROPPED VIEW SOURCE_ACTIVITY_STATUS_v >>>'
END
go
IF OBJECT_ID('SOURCE_ACTIVITY_TYPE_v') IS NOT NULL
BEGIN
    DROP VIEW SOURCE_ACTIVITY_TYPE_v
    PRINT '<<< DROPPED VIEW SOURCE_ACTIVITY_TYPE_v >>>'
END
go
IF OBJECT_ID('ACTIVITY') IS NOT NULL
BEGIN
    DROP TABLE ACTIVITY
    PRINT '<<< DROPPED TABLE ACTIVITY >>>'
END
go
IF OBJECT_ID('ACTIVITY_COMMENT') IS NOT NULL
BEGIN
    DROP TABLE ACTIVITY_COMMENT
    PRINT '<<< DROPPED TABLE ACTIVITY_COMMENT >>>'
END
go
IF OBJECT_ID('ACTIVITY_STATUS') IS NOT NULL
BEGIN
    DROP TABLE ACTIVITY_STATUS
    PRINT '<<< DROPPED TABLE ACTIVITY_STATUS >>>'
END
go
IF OBJECT_ID('ACTIVITY_TYPE') IS NOT NULL
BEGIN
    DROP TABLE ACTIVITY_TYPE
    PRINT '<<< DROPPED TABLE ACTIVITY_TYPE >>>'
END
go
IF OBJECT_ID('COMPANY') IS NOT NULL
BEGIN
    DROP TABLE COMPANY
    PRINT '<<< DROPPED TABLE COMPANY >>>'
END
go
IF OBJECT_ID('CONDITION') IS NOT NULL
BEGIN
    DROP TABLE CONDITION
    PRINT '<<< DROPPED TABLE CONDITION >>>'
END
go
IF OBJECT_ID('DUE_DILG_VENDOR_DATA') IS NOT NULL
BEGIN
    DROP TABLE DUE_DILG_VENDOR_DATA
    PRINT '<<< DROPPED TABLE DUE_DILG_VENDOR_DATA >>>'
END
go
IF OBJECT_ID('DUE_DILG_VENDOR_STATUS') IS NOT NULL
BEGIN
    DROP TABLE DUE_DILG_VENDOR_STATUS
    PRINT '<<< DROPPED TABLE DUE_DILG_VENDOR_STATUS >>>'
END
go
IF OBJECT_ID('END_USER') IS NOT NULL
BEGIN
    DROP TABLE END_USER
    PRINT '<<< DROPPED TABLE END_USER >>>'
END
go
IF OBJECT_ID('ETL_BATCH_CONTROL') IS NOT NULL
BEGIN
    DROP TABLE ETL_BATCH_CONTROL
    PRINT '<<< DROPPED TABLE ETL_BATCH_CONTROL >>>'
END
go
IF OBJECT_ID('HISTORY_EVENT') IS NOT NULL
BEGIN
    DROP TABLE HISTORY_EVENT
    PRINT '<<< DROPPED TABLE HISTORY_EVENT >>>'
END
go
IF OBJECT_ID('INV_DUE_DILG_SAMPLE_TYPE') IS NOT NULL
BEGIN
    DROP TABLE INV_DUE_DILG_SAMPLE_TYPE
    PRINT '<<< DROPPED TABLE INV_DUE_DILG_SAMPLE_TYPE >>>'
END
go
IF OBJECT_ID('INV_DUE_DILIGENCE_STATUS') IS NOT NULL
BEGIN
    DROP TABLE INV_DUE_DILIGENCE_STATUS
    PRINT '<<< DROPPED TABLE INV_DUE_DILIGENCE_STATUS >>>'
END
go
IF OBJECT_ID('INVESTOR_CONDITION_STATUS') IS NOT NULL
BEGIN
    DROP TABLE INVESTOR_CONDITION_STATUS
    PRINT '<<< DROPPED TABLE INVESTOR_CONDITION_STATUS >>>'
END
go
IF OBJECT_ID('INVESTOR_STATUS') IS NOT NULL
BEGIN
    DROP TABLE INVESTOR_STATUS
    PRINT '<<< DROPPED TABLE INVESTOR_STATUS >>>'
END
go
IF OBJECT_ID('JOB_ROLE') IS NOT NULL
BEGIN
    DROP TABLE JOB_ROLE
    PRINT '<<< DROPPED TABLE JOB_ROLE >>>'
END
go
IF OBJECT_ID('LOAN') IS NOT NULL
BEGIN
    DROP TABLE LOAN
    PRINT '<<< DROPPED TABLE LOAN >>>'
END
go
IF OBJECT_ID('LOAN_COMMENT') IS NOT NULL
BEGIN
    DROP TABLE LOAN_COMMENT
    PRINT '<<< DROPPED TABLE LOAN_COMMENT >>>'
END
go
IF OBJECT_ID('LOAN_END_USER') IS NOT NULL
BEGIN
    DROP TABLE LOAN_END_USER
    PRINT '<<< DROPPED TABLE LOAN_END_USER >>>'
END
go
IF OBJECT_ID('PRICING_SCENARIO') IS NOT NULL
BEGIN
    DROP TABLE PRICING_SCENARIO
    PRINT '<<< DROPPED TABLE PRICING_SCENARIO >>>'
END
go
IF OBJECT_ID('PRICING_SCENARIO_RATING') IS NOT NULL
BEGIN
    DROP TABLE PRICING_SCENARIO_RATING
    PRINT '<<< DROPPED TABLE PRICING_SCENARIO_RATING >>>'
END
go
IF OBJECT_ID('SOURCE_ACTIVITY_STATUS') IS NOT NULL
BEGIN
    DROP TABLE SOURCE_ACTIVITY_STATUS
    PRINT '<<< DROPPED TABLE SOURCE_ACTIVITY_STATUS >>>'
END
go
IF OBJECT_ID('SOURCE_ACTIVITY_TYPE') IS NOT NULL
BEGIN
    DROP TABLE SOURCE_ACTIVITY_TYPE
    PRINT '<<< DROPPED TABLE SOURCE_ACTIVITY_TYPE >>>'
END
go
/* 
 * USER: report_user 
 */

exec sp_grantdbaccess 'report_user', 'report_user'
go

/* 
 * SCHEMA: cmt 
 */

CREATE SCHEMA cmt AUTHORIZATION dbo
go

/* 
 * SCHEMA: lms 
 */

CREATE SCHEMA lms AUTHORIZATION dbo
go

/* 
 * SCHEMA: RWT 
 */

CREATE SCHEMA RWT AUTHORIZATION dbo
go

/* 
 * TABLE: ACTIVITY 
 */

CREATE TABLE ACTIVITY(
    ACTIVITY_KEY                  numeric(19, 0)    IDENTITY(1,1),
    ACTIVITY_ID                   numeric(19, 0)    NOT NULL,
    IS_CURRENT                    char(1)           NOT NULL,
    IS_DELETED                    char(1)           NOT NULL,
    IS_CURRENT_DAY                char(1)           NOT NULL,
    VALID_FROM                    datetime          NOT NULL,
    VALID_TILL                    datetime          NOT NULL,
    LAST_MODIFIED_BY              varchar(50)       NOT NULL,
    LAST_MODIFIED_ON              datetime          NOT NULL,
    BATCH_ID                      bigint            NOT NULL,
    ACTIVITY_CLASS                varchar(96)       NULL,
    VERSION_NUMBER                numeric(19, 0)    NULL,
    ACTIVITY_TYPE_ID              numeric(19, 0)    NULL,
    LOAN_ID                       numeric(19, 0)    NULL,
    CONTACT_ID                    numeric(19, 0)    NULL,
    ACTIVITY_STATUS_ID            numeric(19, 0)    NULL,
    ACTIVITY_SOURCE_ID            numeric(19, 0)    NULL,
    SOURCE_ACTIVITY_STATUS_ID     numeric(19, 0)    NULL,
    SOURCE_ACTIVITY_TYPE_ID       numeric(19, 0)    NULL,
    CREATED_DATE                  datetime          NULL,
    UPDATED_DATE                  datetime          NULL,
    CREATED_DATE_AS_LONG          numeric(19, 0)    NULL,
    UPDATED_DATE_AS_LONG          numeric(19, 0)    NULL,
    DESCRIPTION                   varchar(8000)     NULL,
    SOURCE_ACTIVITY_IDENTIFIER    varchar(128)      NULL,
    SOURCE_DESCRIPTION            varchar(8000)     NULL,
    SELLER_VIEWABLE_FLAG          char(1)           NULL,
    ACTIVITY_UUID                 varchar(128)      NULL,
    SOURCE_ACKNOWLEDGED_FLAG      char(1)           NULL,
    EXCLUDED_FLAG                 char(1)           NULL,
    ACTIVITY_BI_UUID              varchar(128)      NULL,
    ACTIVITY_CLOSED_DATE          datetime          NULL,
    ACTIVITY_TYPE_KEY             numeric(19, 0)    NULL,
    LOAN_KEY                      numeric(19, 0)    NULL,
    CONTACT_KEY                   numeric(19, 0)    NULL,
    ACTIVITY_STATUS_KEY           numeric(19, 0)    NULL,
    ACTIVITY_SOURCE_KEY           numeric(19, 0)    NULL,
    SOURCE_ACTIVITY_STATUS_KEY    numeric(19, 0)    NULL,
    SOURCE_ACTIVITY_TYPE_KEY      numeric(19, 0)    NULL,
    NAMESPACE                     varchar(128)      NULL
)
go



IF OBJECT_ID('ACTIVITY') IS NOT NULL
    PRINT '<<< CREATED TABLE ACTIVITY >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ACTIVITY >>>'
go

/* 
 * TABLE: ACTIVITY 
 */

ALTER TABLE ACTIVITY ADD 
    CONSTRAINT pk__activity PRIMARY KEY CLUSTERED (ACTIVITY_KEY)
go

IF OBJECT_ID('ACTIVITY') IS NOT NULL
    PRINT '<<< CREATED TABLE ACTIVITY >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ACTIVITY >>>'
go

/* 
 * TABLE: ACTIVITY_COMMENT 
 */

CREATE TABLE ACTIVITY_COMMENT(
    ACTIVITY_COMMENT_KEY           numeric(19, 0)    IDENTITY(1,1),
    ACTIVITY_COMMENT_ID            numeric(19, 0)    NOT NULL,
    IS_CURRENT                     char(1)           NOT NULL,
    IS_DELETED                     char(1)           NOT NULL,
    IS_CURRENT_DAY                 char(1)           NOT NULL,
    VALID_FROM                     datetime          NOT NULL,
    VALID_TILL                     datetime          NOT NULL,
    LAST_MODIFIED_BY               varchar(50)       NOT NULL,
    LAST_MODIFIED_ON               datetime          NOT NULL,
    BATCH_ID                       bigint            NOT NULL,
    ACTIVITY_ID                    numeric(19, 0)    NULL,
    CONTACT_ID                     numeric(19, 0)    NULL,
    CREATED_DATE                   datetime          NULL,
    UPDATED_DATE                   datetime          NULL,
    SELLER_VIEWABLE_FLAG           char(1)           NULL,
    DUE_DILIGENCE_VIEWABLE_FLAG    char(1)           NULL,
    INTERNAL_VIEWABLE_FLAG         char(1)           NULL,
    COMMENT_TEXT                   varchar(2048)     NULL,
    ACTIVITY_COMMENT_UUID          varchar(64)       NULL,
    ACTIVITY_COMMENT_INDEX         int               NULL,
    ACTIVITY_KEY                   numeric(19, 0)    NULL,
    CONTACT_KEY                    numeric(19, 0)    NULL,
    NAMESPACE                      varchar(128)      NULL
)
go



IF OBJECT_ID('ACTIVITY_COMMENT') IS NOT NULL
    PRINT '<<< CREATED TABLE ACTIVITY_COMMENT >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ACTIVITY_COMMENT >>>'
go

/* 
 * TABLE: ACTIVITY_COMMENT 
 */

ALTER TABLE ACTIVITY_COMMENT ADD 
    CONSTRAINT pk__activity_comment PRIMARY KEY CLUSTERED (ACTIVITY_COMMENT_KEY)
go

IF OBJECT_ID('ACTIVITY_COMMENT') IS NOT NULL
    PRINT '<<< CREATED TABLE ACTIVITY_COMMENT >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ACTIVITY_COMMENT >>>'
go

/* 
 * TABLE: ACTIVITY_STATUS 
 */

CREATE TABLE ACTIVITY_STATUS(
    ACTIVITY_STATUS_KEY     numeric(19, 0)    IDENTITY(1,1),
    ACTIVITY_STATUS_ID      numeric(19, 0)    NOT NULL,
    IS_CURRENT              char(1)           NOT NULL,
    IS_DELETED              char(1)           NOT NULL,
    IS_CURRENT_DAY          char(1)           NOT NULL,
    VALID_FROM              datetime          NOT NULL,
    VALID_TILL              datetime          NOT NULL,
    LAST_MODIFIED_BY        varchar(50)       NOT NULL,
    LAST_MODIFIED_ON        datetime          NOT NULL,
    BATCH_ID                bigint            NOT NULL,
    Action                  nvarchar(15)      NOT NULL,
    ModDate                 datetime          NOT NULL,
    ModBy                   nvarchar(128)     NOT NULL,
    DESCRIPTION             varchar(64)       NULL,
    OPEN_STATUS_FLAG        char(1)           NULL,
    ACTIVITY_STATUS_UUID    varchar(128)      NULL,
    NAMESPACE               varchar(128)      NULL
)
go



IF OBJECT_ID('ACTIVITY_STATUS') IS NOT NULL
    PRINT '<<< CREATED TABLE ACTIVITY_STATUS >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ACTIVITY_STATUS >>>'
go

/* 
 * TABLE: ACTIVITY_STATUS 
 */

ALTER TABLE ACTIVITY_STATUS ADD 
    CONSTRAINT pk__activity_status PRIMARY KEY CLUSTERED (ACTIVITY_STATUS_KEY)
go

IF OBJECT_ID('ACTIVITY_STATUS') IS NOT NULL
    PRINT '<<< CREATED TABLE ACTIVITY_STATUS >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ACTIVITY_STATUS >>>'
go

/* 
 * TABLE: ACTIVITY_TYPE 
 */

CREATE TABLE ACTIVITY_TYPE(
    ACTIVITY_TYPE_KEY     numeric(19, 0)    IDENTITY(1,1),
    ACTIVITY_TYPE_ID      numeric(19, 0)    NOT NULL,
    IS_CURRENT            char(1)           NOT NULL,
    IS_DELETED            char(1)           NOT NULL,
    IS_CURRENT_DAY        char(1)           NOT NULL,
    VALID_FROM            datetime          NOT NULL,
    VALID_TILL            datetime          NOT NULL,
    LAST_MODIFIED_BY      varchar(50)       NOT NULL,
    LAST_MODIFIED_ON      datetime          NOT NULL,
    BATCH_ID              bigint            NOT NULL,
    CODE                  varchar(64)       NULL,
    DESCRIPTION           varchar(256)      NULL,
    ACTIVITY_CATEGORY     varchar(256)      NULL,
    ACTIVITY_TYPE_UUID    varchar(64)       NULL,
    NAMESPACE             varchar(128)      NULL
)
go



IF OBJECT_ID('ACTIVITY_TYPE') IS NOT NULL
    PRINT '<<< CREATED TABLE ACTIVITY_TYPE >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ACTIVITY_TYPE >>>'
go

/* 
 * TABLE: ACTIVITY_TYPE 
 */

ALTER TABLE ACTIVITY_TYPE ADD 
    CONSTRAINT pk__activity_type PRIMARY KEY CLUSTERED (ACTIVITY_TYPE_KEY)
go

IF OBJECT_ID('ACTIVITY_TYPE') IS NOT NULL
    PRINT '<<< CREATED TABLE ACTIVITY_TYPE >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ACTIVITY_TYPE >>>'
go

/* 
 * TABLE: COMPANY 
 */

CREATE TABLE COMPANY(
    COMPANY_KEY                  numeric(19, 0)    IDENTITY(1,1),
    COMPANY_ID                   numeric(19, 0)    NOT NULL,
    IS_CURRENT                   char(1)           NOT NULL,
    IS_DELETED                   char(1)           NOT NULL,
    IS_CURRENT_DAY               char(1)           NOT NULL,
    VALID_FROM                   datetime          NOT NULL,
    VALID_TILL                   datetime          NOT NULL,
    LAST_MODIFIED_BY             varchar(50)       NOT NULL,
    LAST_MODIFIED_ON             datetime          NOT NULL,
    BATCH_ID                     bigint            NOT NULL,
    VERSION_NUMBER               numeric(19, 0)    NULL,
    OWNING_COMPANY_ID            numeric(19, 0)    NULL,
    COMPANY_NAME                 varchar(60)       NULL,
    COMPANY_CODE                 varchar(50)       NULL,
    ADMIN_EMAIL_TO_ADDRESS       varchar(128)      NULL,
    OWNING_COMPANY_KEY           numeric(19, 0)    NULL,
    BUSINESS_DAY_CALENDAR_KEY    numeric(19, 0)    NULL,
    NAMESPACE                    varchar(128)      NULL
)
go



IF OBJECT_ID('COMPANY') IS NOT NULL
    PRINT '<<< CREATED TABLE COMPANY >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE COMPANY >>>'
go

/* 
 * TABLE: COMPANY 
 */

ALTER TABLE COMPANY ADD 
    CONSTRAINT pk__company PRIMARY KEY CLUSTERED (COMPANY_KEY)
go

IF OBJECT_ID('COMPANY') IS NOT NULL
    PRINT '<<< CREATED TABLE COMPANY >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE COMPANY >>>'
go

/* 
 * TABLE: CONDITION 
 */

CREATE TABLE CONDITION(
    ACTIVITY_KEY                     numeric(19, 0)    IDENTITY(1,1),
    ACTIVITY_ID                      numeric(19, 0)    NOT NULL,
    IS_CURRENT                       char(1)           NOT NULL,
    IS_DELETED                       char(1)           NOT NULL,
    IS_CURRENT_DAY                   char(1)           NOT NULL,
    VALID_FROM                       datetime          NOT NULL,
    VALID_TILL                       datetime          NOT NULL,
    LAST_MODIFIED_BY                 varchar(50)       NOT NULL,
    LAST_MODIFIED_ON                 datetime          NOT NULL,
    BATCH_ID                         bigint            NOT NULL,
    CONDITION_TYPE_ID                numeric(19, 0)    NULL,
    INVESTOR_CONDITION_STATUS_ID     numeric(19, 0)    NULL,
    DUE_DILG_VEND_COND_STATUS_ID     numeric(19, 0)    NULL,
    CONDITION_STATUS_ID              numeric(19, 0)    NULL,
    CONDITION_TIMING_TYPE_ID         numeric(19, 0)    NULL,
    SOURCE_GRADE                     varchar(64)       NULL,
    SOURCE_COMMENTS                  varchar(8000)     NULL,
    INVESTOR_CONDITION_STATUS_KEY    numeric(19, 0)    NULL,
    DUE_DILG_VEND_COND_STATUS_KEY    numeric(19, 0)    NULL,
    CONDITION_STATUS_KEY             numeric(19, 0)    NULL,
    CONDITION_TIMING_TYPE_KEY        numeric(19, 0)    NULL,
    NAMESPACE                        varchar(128)      NULL
)
go



IF OBJECT_ID('CONDITION') IS NOT NULL
    PRINT '<<< CREATED TABLE CONDITION >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE CONDITION >>>'
go

/* 
 * TABLE: CONDITION 
 */

ALTER TABLE CONDITION ADD 
    CONSTRAINT pk__condition PRIMARY KEY CLUSTERED (ACTIVITY_KEY)
go

IF OBJECT_ID('CONDITION') IS NOT NULL
    PRINT '<<< CREATED TABLE CONDITION >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE CONDITION >>>'
go

/* 
 * TABLE: DUE_DILG_VENDOR_DATA 
 */

CREATE TABLE DUE_DILG_VENDOR_DATA(
    DUE_DILG_VENDOR_DATA_KEY      numeric(19, 0)    IDENTITY(1,1),
    DUE_DILG_VENDOR_DATA_ID       numeric(19, 0)    NOT NULL,
    IS_CURRENT                    char(1)           NOT NULL,
    IS_DELETED                    char(1)           NOT NULL,
    IS_CURRENT_DAY                char(1)           NOT NULL,
    VALID_FROM                    datetime          NOT NULL,
    VALID_TILL                    datetime          NOT NULL,
    LAST_MODIFIED_BY              varchar(50)       NOT NULL,
    LAST_MODIFIED_ON              datetime          NOT NULL,
    BATCH_ID                      bigint            NOT NULL,
    PRICING_SCENARIO_ID           numeric(19, 0)    NULL,
    DUE_DILG_VENDOR_STATUS_ID     numeric(19, 0)    NULL,
    COMPANY_ID                    numeric(19, 0)    NULL,
    VENDOR_LOAN_NUMBER            varchar(32)       NULL,
    VENDOR_STATUS_DATE            datetime          NULL,
    VENDOR_STATUS_DATE_AS_LONG    numeric(19, 0)    NULL,
    DUE_DILG_VENDOR_DATA_UUID     varchar(64)       NULL,
    CREATED_DATE                  datetime          NULL,
    UPDATED_DATE                  datetime          NULL,
    PRICING_SCENARIO_KEY          numeric(19, 0)    NULL,
    DUE_DILG_VENDOR_STATUS_KEY    numeric(19, 0)    NULL,
    COMPANY_KEY                   numeric(19, 0)    NULL,
    NAMESPACE                     varchar(128)      NULL
)
go



IF OBJECT_ID('DUE_DILG_VENDOR_DATA') IS NOT NULL
    PRINT '<<< CREATED TABLE DUE_DILG_VENDOR_DATA >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DUE_DILG_VENDOR_DATA >>>'
go

/* 
 * TABLE: DUE_DILG_VENDOR_DATA 
 */

ALTER TABLE DUE_DILG_VENDOR_DATA ADD 
    CONSTRAINT pk__due_dilg_vendor PRIMARY KEY CLUSTERED (DUE_DILG_VENDOR_DATA_KEY)
go

IF OBJECT_ID('DUE_DILG_VENDOR_DATA') IS NOT NULL
    PRINT '<<< CREATED TABLE DUE_DILG_VENDOR_DATA >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DUE_DILG_VENDOR_DATA >>>'
go

/* 
 * TABLE: DUE_DILG_VENDOR_STATUS 
 */

CREATE TABLE DUE_DILG_VENDOR_STATUS(
    DUE_DILG_VENDOR_STATUS_KEY     numeric(19, 0)    IDENTITY(1,1),
    DUE_DILG_VENDOR_STATUS_ID      numeric(19, 0)    NOT NULL,
    IS_CURRENT                     char(1)           NOT NULL,
    IS_DELETED                     char(1)           NOT NULL,
    IS_CURRENT_DAY                 char(1)           NOT NULL,
    VALID_FROM                     datetime          NOT NULL,
    VALID_TILL                     datetime          NOT NULL,
    LAST_MODIFIED_BY               varchar(50)       NOT NULL,
    LAST_MODIFIED_ON               datetime          NOT NULL,
    BATCH_ID                       bigint            NOT NULL,
    COMPANY_ID                     numeric(19, 0)    NULL,
    DUE_DILG_STATUS_TYPE_ID        numeric(19, 0)    NULL,
    CODE                           varchar(64)       NULL,
    DESCRIPTION                    varchar(64)       NULL,
    DUE_DILG_VENDOR_STATUS_UUID    varchar(64)       NULL,
    COMPANY_KEY                    numeric(19, 0)    NULL,
    DUE_DILG_STATUS_TYPE_KEY       numeric(19, 0)    NULL,
    NAMESPACE                      varchar(128)      NULL
)
go



IF OBJECT_ID('DUE_DILG_VENDOR_STATUS') IS NOT NULL
    PRINT '<<< CREATED TABLE DUE_DILG_VENDOR_STATUS >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DUE_DILG_VENDOR_STATUS >>>'
go

/* 
 * TABLE: DUE_DILG_VENDOR_STATUS 
 */

ALTER TABLE DUE_DILG_VENDOR_STATUS ADD 
    CONSTRAINT pk__due_dilg_vendor___7d439abd PRIMARY KEY CLUSTERED (DUE_DILG_VENDOR_STATUS_KEY)
go

IF OBJECT_ID('DUE_DILG_VENDOR_STATUS') IS NOT NULL
    PRINT '<<< CREATED TABLE DUE_DILG_VENDOR_STATUS >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DUE_DILG_VENDOR_STATUS >>>'
go

/* 
 * TABLE: END_USER 
 */

CREATE TABLE END_USER(
    CONTACT_KEY               numeric(19, 0)    IDENTITY(1,1),
    CONTACT_ID                numeric(19, 0)    NOT NULL,
    IS_CURRENT                char(1)           NOT NULL,
    IS_DELETED                char(1)           NOT NULL,
    IS_CURRENT_DAY            char(1)           NOT NULL,
    VALID_FROM                datetime          NOT NULL,
    VALID_TILL                datetime          NOT NULL,
    LAST_MODIFIED_BY          varchar(50)       NOT NULL,
    LAST_MODIFIED_ON          datetime          NOT NULL,
    BATCH_ID                  bigint            NOT NULL,
    COMPANY_ID                numeric(19, 0)    NULL,
    USER_NAME                 varchar(48)       NULL,
    ACCOUNT_APPROVED_FLAG     char(1)           NULL,
    ACCOUNT_ACTIVATED_FLAG    char(1)           NULL,
    COMPANY_KEY               numeric(19, 0)    NULL,
    NAMESPACE                 varchar(128)      NULL
)
go



IF OBJECT_ID('END_USER') IS NOT NULL
    PRINT '<<< CREATED TABLE END_USER >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE END_USER >>>'
go

/* 
 * TABLE: END_USER 
 */

ALTER TABLE END_USER ADD 
    CONSTRAINT pk__end_user__02fc7413 PRIMARY KEY CLUSTERED (CONTACT_KEY)
go

IF OBJECT_ID('END_USER') IS NOT NULL
    PRINT '<<< CREATED TABLE END_USER >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE END_USER >>>'
go

/* 
 * TABLE: ETL_BATCH_CONTROL 
 */

CREATE TABLE ETL_BATCH_CONTROL(
    BATCH_ID      bigint          IDENTITY(1,1),
    JOB_NAME      varchar(100)    NULL,
    START_TIME    datetime        NULL,
    END_TIME      datetime        NULL
)
go



IF OBJECT_ID('ETL_BATCH_CONTROL') IS NOT NULL
    PRINT '<<< CREATED TABLE ETL_BATCH_CONTROL >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ETL_BATCH_CONTROL >>>'
go

/* 
 * TABLE: HISTORY_EVENT 
 */

CREATE TABLE HISTORY_EVENT(
    HISTORY_EVENT_KEY         numeric(19, 0)    IDENTITY(1,1),
    HISTORY_EVENT_ID          numeric(19, 0)    NOT NULL,
    IS_CURRENT                char(1)           NOT NULL,
    IS_DELETED                char(1)           NOT NULL,
    IS_CURRENT_DAY            char(1)           NOT NULL,
    VALID_FROM                datetime          NOT NULL,
    VALID_TILL                datetime          NOT NULL,
    LAST_MODIFIED_BY          varchar(50)       NOT NULL,
    LAST_MODIFIED_ON          datetime          NOT NULL,
    BATCH_ID                  bigint            NOT NULL,
    LOAN_ID                   numeric(19, 0)    NULL,
    CONTACT_ID                numeric(19, 0)    NULL,
    CHANGE_DATE               datetime          NULL,
    EVENT_NAME                varchar(128)      NULL,
    ID_BEFORE                 numeric(19, 0)    NULL,
    VALUE_BEFORE              varchar(512)      NULL,
    ID_AFTER                  numeric(19, 0)    NULL,
    VALUE_AFTER               varchar(512)      NULL,
    ADDITIONAL_INFORMATION    varchar(1024)     NULL,
    CHANGE_BY_DETAIL          varchar(256)      NULL,
    VERBOSE_HISTORY_FLAG      char(1)           NULL,
    LOAN_KEY                  numeric(19, 0)    NULL,
    CONTACT_KEY               numeric(19, 0)    NULL,
    NAMESPACE                 varchar(128)      NULL
)
go



IF OBJECT_ID('HISTORY_EVENT') IS NOT NULL
    PRINT '<<< CREATED TABLE HISTORY_EVENT >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE HISTORY_EVENT >>>'
go

/* 
 * TABLE: HISTORY_EVENT 
 */

ALTER TABLE HISTORY_EVENT ADD 
    CONSTRAINT pk__history_event__43d61337 PRIMARY KEY CLUSTERED (HISTORY_EVENT_KEY)
go

IF OBJECT_ID('HISTORY_EVENT') IS NOT NULL
    PRINT '<<< CREATED TABLE HISTORY_EVENT >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE HISTORY_EVENT >>>'
go

/* 
 * TABLE: INV_DUE_DILG_SAMPLE_TYPE 
 */

CREATE TABLE INV_DUE_DILG_SAMPLE_TYPE(
    INV_DUE_DILG_SAMPLE_TYPE_KEY     numeric(19, 0)    IDENTITY(1,1),
    INV_DUE_DILG_SAMPLE_TYPE_ID      numeric(19, 0)    NOT NULL,
    IS_CURRENT                       char(1)           NOT NULL,
    IS_DELETED                       char(1)           NOT NULL,
    IS_CURRENT_DAY                   char(1)           NOT NULL,
    VALID_FROM                       datetime          NOT NULL,
    VALID_TILL                       datetime          NOT NULL,
    LAST_MODIFIED_BY                 varchar(50)       NOT NULL,
    LAST_MODIFIED_ON                 datetime          NOT NULL,
    BATCH_ID                         bigint            NOT NULL,
    Action                           nvarchar(15)      NOT NULL,
    ModDate                          datetime          NOT NULL,
    ModBy                            nvarchar(128)     NOT NULL,
    VERSION_NUMBER                   numeric(19, 0)    NOT NULL,
    COMPANY_ID                       numeric(19, 0)    NULL,
    DUE_DILG_SAMPLE_TYPE_ID          numeric(19, 0)    NULL,
    INV_DUE_DILG_SAMPLE_TYPE_UUID    varchar(64)       NULL,
    DESCRIPTION                      varchar(64)       NULL,
    SORT_ORDER                       int               NULL,
    NAMESPACE                        varchar(128)      NULL
)
go



IF OBJECT_ID('INV_DUE_DILG_SAMPLE_TYPE') IS NOT NULL
    PRINT '<<< CREATED TABLE INV_DUE_DILG_SAMPLE_TYPE >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE INV_DUE_DILG_SAMPLE_TYPE >>>'
go

/* 
 * TABLE: INV_DUE_DILG_SAMPLE_TYPE 
 */

ALTER TABLE INV_DUE_DILG_SAMPLE_TYPE ADD 
    CONSTRAINT pk__inv_due_dilg_sample_type PRIMARY KEY CLUSTERED (INV_DUE_DILG_SAMPLE_TYPE_KEY)
go

IF OBJECT_ID('INV_DUE_DILG_SAMPLE_TYPE') IS NOT NULL
    PRINT '<<< CREATED TABLE INV_DUE_DILG_SAMPLE_TYPE >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE INV_DUE_DILG_SAMPLE_TYPE >>>'
go

/* 
 * TABLE: INV_DUE_DILIGENCE_STATUS 
 */

CREATE TABLE INV_DUE_DILIGENCE_STATUS(
    INV_DUE_DILIGENCE_STATUS_KEY    numeric(19, 0)    IDENTITY(1,1),
    INV_DUE_DILIGENCE_STATUS_ID     numeric(19, 0)    NOT NULL,
    IS_CURRENT                      char(1)           NOT NULL,
    IS_DELETED                      char(1)           NOT NULL,
    IS_CURRENT_DAY                  char(1)           NOT NULL,
    VALID_FROM                      datetime          NOT NULL,
    VALID_TILL                      datetime          NOT NULL,
    LAST_MODIFIED_BY                varchar(50)       NOT NULL,
    LAST_MODIFIED_ON                datetime          NOT NULL,
    BATCH_ID                        bigint            NOT NULL,
    VERSION_NUMBER                  numeric(19, 0)    NOT NULL,
    COMPANY_ID                      numeric(19, 0)    NULL,
    INV_DUE_DILG_STATUS_TYPE_ID     numeric(19, 0)    NULL,
    INV_DUE_DILG_STATUS_UUID        varchar(64)       NULL,
    DESCRIPTION                     varchar(64)       NULL,
    SORT_ORDER                      int               NULL,
    COMPANY_KEY                     numeric(19, 0)    NULL,
    INV_DUE_DILG_STATUS_TYPE_KEY    numeric(19, 0)    NULL,
    NAMESPACE                       varchar(128)      NULL
)
go



IF OBJECT_ID('INV_DUE_DILIGENCE_STATUS') IS NOT NULL
    PRINT '<<< CREATED TABLE INV_DUE_DILIGENCE_STATUS >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE INV_DUE_DILIGENCE_STATUS >>>'
go

/* 
 * TABLE: INV_DUE_DILIGENCE_STATUS 
 */

ALTER TABLE INV_DUE_DILIGENCE_STATUS ADD 
    CONSTRAINT pk__inv_due_diligenc PRIMARY KEY CLUSTERED (INV_DUE_DILIGENCE_STATUS_KEY)
go

IF OBJECT_ID('INV_DUE_DILIGENCE_STATUS') IS NOT NULL
    PRINT '<<< CREATED TABLE INV_DUE_DILIGENCE_STATUS >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE INV_DUE_DILIGENCE_STATUS >>>'
go

/* 
 * TABLE: INVESTOR_CONDITION_STATUS 
 */

CREATE TABLE INVESTOR_CONDITION_STATUS(
    INVESTOR_CONDITION_STATUS_KEY     numeric(19, 0)    IDENTITY(1,1),
    INVESTOR_CONDITION_STATUS_ID      numeric(19, 0)    NOT NULL,
    IS_CURRENT                        char(1)           NOT NULL,
    IS_DELETED                        char(1)           NOT NULL,
    IS_CURRENT_DAY                    char(1)           NOT NULL,
    VALID_FROM                        datetime          NOT NULL,
    VALID_TILL                        datetime          NOT NULL,
    LAST_MODIFIED_BY                  varchar(50)       NOT NULL,
    LAST_MODIFIED_ON                  datetime          NOT NULL,
    BATCH_ID                          bigint            NOT NULL,
    COMPANY_ID                        numeric(19, 0)    NULL,
    CONDITION_STATUS_ID               numeric(19, 0)    NULL,
    DESCRIPTION                       varchar(64)       NULL,
    INVESTOR_CONDITION_STATUS_UUID    varchar(64)       NULL,
    COMPANY_KEY                       numeric(19, 0)    NULL,
    CONDITION_STATUS_KEY              numeric(19, 0)    NULL,
    NAMESPACE                         varchar(128)      NULL
)
go



IF OBJECT_ID('INVESTOR_CONDITION_STATUS') IS NOT NULL
    PRINT '<<< CREATED TABLE INVESTOR_CONDITION_STATUS >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE INVESTOR_CONDITION_STATUS >>>'
go

/* 
 * TABLE: INVESTOR_CONDITION_STATUS 
 */

ALTER TABLE INVESTOR_CONDITION_STATUS ADD 
    CONSTRAINT pk__investor_conditi PRIMARY KEY CLUSTERED (INVESTOR_CONDITION_STATUS_KEY)
go

IF OBJECT_ID('INVESTOR_CONDITION_STATUS') IS NOT NULL
    PRINT '<<< CREATED TABLE INVESTOR_CONDITION_STATUS >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE INVESTOR_CONDITION_STATUS >>>'
go

/* 
 * TABLE: INVESTOR_STATUS 
 */

CREATE TABLE INVESTOR_STATUS(
    INVESTOR_STATUS_KEY       numeric(19, 0)    IDENTITY(1,1),
    INVESTOR_STATUS_ID        numeric(19, 0)    NOT NULL,
    IS_CURRENT                char(1)           NOT NULL,
    IS_DELETED                char(1)           NOT NULL,
    IS_CURRENT_DAY            char(1)           NOT NULL,
    VALID_FROM                datetime          NOT NULL,
    VALID_TILL                datetime          NOT NULL,
    LAST_MODIFIED_BY          varchar(50)       NOT NULL,
    LAST_MODIFIED_ON          datetime          NOT NULL,
    BATCH_ID                  bigint            NOT NULL,
    COMPANY_ID                numeric(19, 0)    NULL,
    DESCRIPTION               varchar(64)       NULL,
    INVESTOR_STATUS_UUID      varchar(64)       NULL,
    FINAL_DISPOSITION_FLAG    char(1)           NULL,
    COMPANY_KEY               numeric(19, 0)    NULL,
    NAMESPACE                 varchar(128)      NULL
)
go



IF OBJECT_ID('INVESTOR_STATUS') IS NOT NULL
    PRINT '<<< CREATED TABLE INVESTOR_STATUS >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE INVESTOR_STATUS >>>'
go

/* 
 * TABLE: INVESTOR_STATUS 
 */

ALTER TABLE INVESTOR_STATUS ADD 
    CONSTRAINT pk__investor_status PRIMARY KEY CLUSTERED (INVESTOR_STATUS_KEY)
go

IF OBJECT_ID('INVESTOR_STATUS') IS NOT NULL
    PRINT '<<< CREATED TABLE INVESTOR_STATUS >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE INVESTOR_STATUS >>>'
go

/* 
 * TABLE: JOB_ROLE 
 */

CREATE TABLE JOB_ROLE(
    JOB_ROLE_KEY        numeric(19, 0)    IDENTITY(1,1),
    JOB_ROLE_ID         numeric(19, 0)    NOT NULL,
    IS_CURRENT          char(1)           NOT NULL,
    IS_DELETED          char(1)           NOT NULL,
    IS_CURRENT_DAY      char(1)           NOT NULL,
    VALID_FROM          datetime          NOT NULL,
    VALID_TILL          datetime          NOT NULL,
    LAST_MODIFIED_BY    varchar(50)       NOT NULL,
    LAST_MODIFIED_ON    datetime          NOT NULL,
    BATCH_ID            bigint            NOT NULL,
    NAME                varchar(64)       NULL,
    DESCRIPTION         varchar(64)       NULL,
    JOB_ROLE_UUID       varchar(64)       NULL,
    NAMESPACE           varchar(128)      NULL
)
go



IF OBJECT_ID('JOB_ROLE') IS NOT NULL
    PRINT '<<< CREATED TABLE JOB_ROLE >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE JOB_ROLE >>>'
go

/* 
 * TABLE: JOB_ROLE 
 */

ALTER TABLE JOB_ROLE ADD 
    CONSTRAINT pk__job_role__607251e5 PRIMARY KEY CLUSTERED (JOB_ROLE_KEY)
go

IF OBJECT_ID('JOB_ROLE') IS NOT NULL
    PRINT '<<< CREATED TABLE JOB_ROLE >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE JOB_ROLE >>>'
go

/* 
 * TABLE: LOAN 
 */

CREATE TABLE LOAN(
    LOAN_KEY                   numeric(19, 0)    IDENTITY(1,1),
    LOAN_ID                    numeric(19, 0)    NOT NULL,
    IS_CURRENT                 char(1)           NOT NULL,
    IS_DELETED                 char(1)           NOT NULL,
    IS_CURRENT_DAY             char(1)           NOT NULL,
    VALID_FROM                 datetime          NOT NULL,
    VALID_TILL                 datetime          NOT NULL,
    LAST_MODIFIED_BY           varchar(50)       NOT NULL,
    LAST_MODIFIED_ON           datetime          NOT NULL,
    BATCH_ID                   bigint            NOT NULL,
    VERSION_NUMBER             numeric(19, 0)    NOT NULL,
    PROPERTY_ID                numeric(19, 0)    NULL,
    LOAN_ORIGINATOR_ID         numeric(19, 0)    NULL,
    ORIGINATING_PARTNER_ID     numeric(19, 0)    NULL,
    DOCUMENTATION_TYPE_ID      numeric(19, 0)    NULL,
    STATUS_ID                  numeric(19, 0)    NULL,
    TITLE_ORDER_DETAILS_ID     numeric(19, 0)    NULL,
    POLICY_ID                  numeric(19, 0)    NULL,
    COMPANY_ID                 numeric(19, 0)    NULL,
    CREATED_BY_ID              numeric(19, 0)    NULL,
    SELLING_COMPANY_ID         numeric(19, 0)    NULL,
    LOAN_PURPOSE_ID            numeric(19, 0)    NULL,
    ESCROW_TYPE_ID             numeric(19, 0)    NULL,
    APPLICATION_DATE           datetime          NULL,
    SIGNING_DATE               datetime          NULL,
    FUNDING_DATE               datetime          NULL,
    LOAN_NUMBER                varchar(32)       NULL,
    TOTAL_LOAN_AMOUNT          numeric(2, 2)     NULL,
    LOAN_UUID                  varchar(255)      NULL,
    ARMS_LENGTH_FLAG           char(1)           NULL,
    NEEDS_POLICY_VERIF_FLAG    char(1)           NULL,
    CREATED_DATE               datetime          NULL,
    UPDATED_DATE               datetime          NULL,
    CREATED_DATE_AS_LONG       numeric(19, 0)    NULL,
    UPDATED_DATE_AS_LONG       numeric(19, 0)    NULL,
    INVALID_FLAG               char(1)           NULL,
    CLEARED_BY_CSTD_FLAG       char(1)           NULL,
    CMT_VISIBLE_FLAG           char(1)           NULL,
    PROPERTY_KEY               numeric(19, 0)    NULL,
    LOAN_ORIGINATOR_KEY        numeric(19, 0)    NULL,
    ORIGINATING_PARTNER_KEY    numeric(19, 0)    NULL,
    DOCUMENTATION_TYPE_KEY     numeric(19, 0)    NULL,
    STATUS_KEY                 numeric(19, 0)    NULL,
    TITLE_ORDER_DETAILS_KEY    numeric(19, 0)    NULL,
    POLICY_KEY                 numeric(19, 0)    NULL,
    COMPANY_KEY                numeric(19, 0)    NULL,
    CREATED_BY_KEY             numeric(19, 0)    NULL,
    SELLING_COMPANY_KEY        numeric(19, 0)    NULL,
    LOAN_PURPOSE_KEY           numeric(19, 0)    NULL,
    ESCROW_TYPE_KEY            numeric(19, 0)    NULL,
    NAMESPACE                  varchar(128)      NULL
)
go



IF OBJECT_ID('LOAN') IS NOT NULL
    PRINT '<<< CREATED TABLE LOAN >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE LOAN >>>'
go

/* 
 * TABLE: LOAN 
 */

ALTER TABLE LOAN ADD 
    CONSTRAINT pk__loan PRIMARY KEY CLUSTERED (LOAN_KEY)
go

IF OBJECT_ID('LOAN') IS NOT NULL
    PRINT '<<< CREATED TABLE LOAN >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE LOAN >>>'
go

/* 
 * TABLE: LOAN_COMMENT 
 */

CREATE TABLE LOAN_COMMENT(
    LOAN_COMMENT_KEY                   numeric(19, 0)    IDENTITY(1,1),
    LOAN_COMMENT_ID                    numeric(19, 0)    NOT NULL,
    IS_CURRENT                         char(1)           NOT NULL,
    IS_DELETED                         char(1)           NOT NULL,
    IS_CURRENT_DAY                     char(1)           NOT NULL,
    VALID_FROM                         datetime          NOT NULL,
    VALID_TILL                         datetime          NOT NULL,
    LAST_MODIFIED_BY                   varchar(50)       NOT NULL,
    LAST_MODIFIED_ON                   datetime          NOT NULL,
    BATCH_ID                           bigint            NOT NULL,
    LOAN_ID                            numeric(19, 0)    NULL,
    CONTACT_ID                         numeric(19, 0)    NULL,
    CREATED_DATE                       datetime          NULL,
    UPDATED_DATE                       datetime          NULL,
    SELLER_VIEWABLE_FLAG               char(1)           NULL,
    DUE_DILIGENCE_VIEWABLE_FLAG        char(1)           NULL,
    INTERNAL_VIEWABLE_FLAG             char(1)           NULL,
    COMMENT_TEXT                       varchar(2048)     NULL,
    LOAN_COMMENT_UUID                  varchar(64)       NULL,
    LOAN_COMMENT_INDEX                 int               NULL,
    LOAN_COMMENT_CLASS                 varchar(128)      NULL,
    SOURCE_IDENTIFIER                  varchar(256)      NULL,
    DUE_DILIGENCE_VENDOR_ID            numeric(19, 0)    NULL,
    SOURCE_GRADE                       varchar(64)       NULL,
    SOURCE_COMMENTS                    varchar(8000)     NULL,
    SOURCE_DESCRIPTION                 varchar(8000)     NULL,
    SOURCE_ACKNOWLEDGED_FLAG           char(1)           NULL,
    SOURCE_DESCRIPTION_UPDATED_DATE    datetime          NULL,
    CODE                               varchar(128)      NULL,
    LOAN_KEY                           numeric(19, 0)    NULL,
    CONTACT_KEY                        numeric(19, 0)    NULL,
    DUE_DILIGENCE_VENDOR_KEY           numeric(19, 0)    NULL,
    NAMESPACE                          varchar(128)      NULL
)
go



IF OBJECT_ID('LOAN_COMMENT') IS NOT NULL
    PRINT '<<< CREATED TABLE LOAN_COMMENT >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE LOAN_COMMENT >>>'
go

/* 
 * TABLE: LOAN_COMMENT 
 */

ALTER TABLE LOAN_COMMENT ADD 
    CONSTRAINT pk__loan_comment PRIMARY KEY CLUSTERED (LOAN_COMMENT_KEY)
go

IF OBJECT_ID('LOAN_COMMENT') IS NOT NULL
    PRINT '<<< CREATED TABLE LOAN_COMMENT >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE LOAN_COMMENT >>>'
go

/* 
 * TABLE: LOAN_END_USER 
 */

CREATE TABLE LOAN_END_USER(
    LOAN_END_USER_KEY       numeric(19, 0)    IDENTITY(1,1),
    LOAN_END_USER_ID        numeric(19, 0)    NOT NULL,
    IS_CURRENT              char(1)           NOT NULL,
    IS_DELETED              char(1)           NOT NULL,
    IS_CURRENT_DAY          char(1)           NOT NULL,
    VALID_FROM              datetime          NOT NULL,
    VALID_TILL              datetime          NOT NULL,
    LAST_MODIFIED_BY        varchar(50)       NOT NULL,
    LAST_MODIFIED_ON        datetime          NOT NULL,
    BATCH_ID                bigint            NOT NULL,
    LOAN_ID                 numeric(19, 0)    NULL,
    CONTACT_ID              numeric(19, 0)    NULL,
    END_USER_CONTACT_ID     numeric(19, 0)    NULL,
    JOB_ROLE_ID             numeric(19, 0)    NULL,
    LOAN_END_USER_UUID      varchar(64)       NULL,
    LOAN_KEY                numeric(19, 0)    NULL,
    CONTACT_KEY             numeric(19, 0)    NULL,
    END_USER_CONTACT_KEY    numeric(19, 0)    NULL,
    JOB_ROLE_KEY            numeric(19, 0)    NULL,
    NAMESPACE               varchar(128)      NULL
)
go



IF OBJECT_ID('LOAN_END_USER') IS NOT NULL
    PRINT '<<< CREATED TABLE LOAN_END_USER >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE LOAN_END_USER >>>'
go

/* 
 * TABLE: LOAN_END_USER 
 */

ALTER TABLE LOAN_END_USER ADD 
    CONSTRAINT pk__loan_end_user PRIMARY KEY CLUSTERED (LOAN_END_USER_KEY)
go

IF OBJECT_ID('LOAN_END_USER') IS NOT NULL
    PRINT '<<< CREATED TABLE LOAN_END_USER >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE LOAN_END_USER >>>'
go

/* 
 * TABLE: PRICING_SCENARIO 
 */

CREATE TABLE PRICING_SCENARIO(
    PRICING_SCENARIO_KEY              numeric(19, 0)    IDENTITY(1,1),
    PRICING_SCENARIO_ID               numeric(19, 0)    NOT NULL,
    IS_CURRENT                        char(1)           NOT NULL,
    IS_DELETED                        char(1)           NOT NULL,
    IS_CURRENT_DAY                    char(1)           NOT NULL,
    VALID_FROM                        datetime          NOT NULL,
    VALID_TILL                        datetime          NOT NULL,
    LAST_MODIFIED_BY                  varchar(50)       NOT NULL,
    LAST_MODIFIED_ON                  datetime          NOT NULL,
    BATCH_ID                          bigint            NOT NULL,
    LOAN_ID                           numeric(19, 0)    NULL,
    PIGGY_BACK_SCENARIO_ID            numeric(19, 0)    NULL,
    PARENT_SCENARIO_ID                numeric(19, 0)    NULL,
    LENDER_LOAN_PROGRAM_ID            numeric(19, 0)    NULL,
    PRICING_GROUP_ID                  numeric(19, 0)    NULL,
    CREDIT_GRADE_ID                   numeric(19, 0)    NULL,
    INVESTOR_COMMITMENT_ID            numeric(19, 0)    NULL,
    INVESTOR_STATUS_ID                numeric(19, 0)    NULL,
    INV_DUE_DILIGENCE_STATUS_ID       numeric(19, 0)    NULL,
    INV_DUE_DILG_SAMPLE_TYPE_ID       numeric(19, 0)    NULL,
    CURRENT_PRICING_FLAG              char(1)           NULL,
    INVESTOR_LOAN_NUMBER              varchar(32)       NULL,
    SELLER_REVIEW_DATE                datetime          NULL,
    PRICING_SCENARIO_UUID             varchar(255)      NULL,
    ASSG_DUE_DILG_VEND_COMPANY_ID     numeric(19, 0)    NULL,
    ASSG_DUE_DILG_DATE                datetime          NULL,
    CONDITION_NOTIFICATION_DATE       datetime          NULL,
    SUSPENSE_EXPIRATION_DATE          datetime          NULL,
    CALC_SUSPENSE_EXPIRATION_DATE     datetime          NULL,
    SUSPENSE_CLEARED_DATE             datetime          NULL,
    APPR_REVIEW_REQUEST_DATE          datetime          NULL,
    PURCH_REVIEW_REQUEST_DATE         datetime          NULL,
    CREDIT_REVIEW_COMPLETE_DATE       datetime          NULL,
    COLLATERAL_REVIEW_CMPLT_DATE      datetime          NULL,
    LEGACY_SUSP_CLEARED_DATE          datetime          NULL,
    LEGACY_SUSP_CLEARED_FLAG          char(1)           NULL,
    LOAN_KEY                          numeric(19, 0)    NULL,
    PIGGY_BACK_SCENARIO_KEY           numeric(19, 0)    NULL,
    PARENT_SCENARIO_KEY               numeric(19, 0)    NULL,
    LENDER_LOAN_PROGRAM_KEY           numeric(19, 0)    NULL,
    PRICING_GROUP_KEY                 numeric(19, 0)    NULL,
    CREDIT_GRADE_KEY                  numeric(19, 0)    NULL,
    INVESTOR_COMMITMENT_KEY           numeric(19, 0)    NULL,
    INVESTOR_STATUS_KEY               numeric(19, 0)    NULL,
    INV_DUE_DILIGENCE_STATUS_KEY      numeric(19, 0)    NULL,
    INV_DUE_DILG_SAMPLE_TYPE_KEY      numeric(19, 0)    NULL,
    ASSG_DUE_DILG_VEND_COMPANY_KEY    numeric(19, 0)    NULL,
    NAMESPACE                         varchar(128)      NULL
)
go



IF OBJECT_ID('PRICING_SCENARIO') IS NOT NULL
    PRINT '<<< CREATED TABLE PRICING_SCENARIO >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE PRICING_SCENARIO >>>'
go

/* 
 * TABLE: PRICING_SCENARIO 
 */

ALTER TABLE PRICING_SCENARIO ADD 
    CONSTRAINT pk__pricing_scenario PRIMARY KEY CLUSTERED (PRICING_SCENARIO_KEY)
go

IF OBJECT_ID('PRICING_SCENARIO') IS NOT NULL
    PRINT '<<< CREATED TABLE PRICING_SCENARIO >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE PRICING_SCENARIO >>>'
go

/* 
 * TABLE: PRICING_SCENARIO_RATING 
 */

CREATE TABLE PRICING_SCENARIO_RATING(
    PRICING_SCENARIO_RATING_KEY    numeric(19, 0)    IDENTITY(1,1),
    PRICING_SCENARIO_RATING_ID     numeric(19, 0)    NOT NULL,
    IS_CURRENT                     char(1)           NOT NULL,
    IS_DELETED                     char(1)           NOT NULL,
    IS_CURRENT_DAY                 char(1)           NOT NULL,
    VALID_FROM                     datetime          NOT NULL,
    VALID_TILL                     datetime          NOT NULL,
    LAST_MODIFIED_BY               varchar(50)       NOT NULL,
    LAST_MODIFIED_ON               datetime          NOT NULL,
    BATCH_ID                       bigint            NOT NULL,
    PRICING_SCENARIO_ID            numeric(19, 0)    NULL,
    RATING_AGENCY_ID               numeric(19, 0)    NULL,
    OVERALL_GRADE                  varchar(10)       NULL,
    CREDIT_GRADE                   varchar(10)       NULL,
    COMPLIANCE_GRADE               varchar(10)       NULL,
    PROPERTY_GRADE                 varchar(10)       NULL,
    PRICING_SCENARIO_KEY           numeric(19, 0)    NULL,
    RATING_AGENCY_KEY              numeric(19, 0)    NULL,
    NAMESPACE                      varchar(128)      NULL
)
go



IF OBJECT_ID('PRICING_SCENARIO_RATING') IS NOT NULL
    PRINT '<<< CREATED TABLE PRICING_SCENARIO_RATING >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE PRICING_SCENARIO_RATING >>>'
go

/* 
 * TABLE: PRICING_SCENARIO_RATING 
 */

ALTER TABLE PRICING_SCENARIO_RATING ADD 
    CONSTRAINT pk__pricing_scenario__57a801ba PRIMARY KEY CLUSTERED (PRICING_SCENARIO_RATING_KEY)
go

IF OBJECT_ID('PRICING_SCENARIO_RATING') IS NOT NULL
    PRINT '<<< CREATED TABLE PRICING_SCENARIO_RATING >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE PRICING_SCENARIO_RATING >>>'
go

/* 
 * TABLE: SOURCE_ACTIVITY_STATUS 
 */

CREATE TABLE SOURCE_ACTIVITY_STATUS(
    SOURCE_ACTIVITY_STATUS_KEY     numeric(19, 0)    IDENTITY(1,1),
    SOURCE_ACTIVITY_STATUS_ID      numeric(19, 0)    NOT NULL,
    IS_CURRENT                     char(1)           NOT NULL,
    IS_DELETED                     char(1)           NOT NULL,
    IS_CURRENT_DAY                 char(1)           NOT NULL,
    VALID_FROM                     datetime          NOT NULL,
    VALID_TILL                     datetime          NOT NULL,
    LAST_MODIFIED_BY               varchar(50)       NOT NULL,
    LAST_MODIFIED_ON               datetime          NOT NULL,
    BATCH_ID                       bigint            NOT NULL,
    ACTIVITY_SOURCE_ID             numeric(19, 0)    NULL,
    ACTIVITY_STATUS_ID             numeric(19, 0)    NULL,
    DESCRIPTION                    varchar(256)      NULL,
    CODE                           varchar(64)       NULL,
    SOURCE_ACTIVITY_STATUS_UUID    varchar(128)      NULL,
    ACTIVITY_SOURCE_KEY            numeric(19, 0)    NULL,
    ACTIVITY_STATUS_KEY            numeric(19, 0)    NULL,
    NAMESPACE                      varchar(128)      NULL
)
go



IF OBJECT_ID('SOURCE_ACTIVITY_STATUS') IS NOT NULL
    PRINT '<<< CREATED TABLE SOURCE_ACTIVITY_STATUS >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE SOURCE_ACTIVITY_STATUS >>>'
go

/* 
 * TABLE: SOURCE_ACTIVITY_STATUS 
 */

ALTER TABLE SOURCE_ACTIVITY_STATUS ADD 
    CONSTRAINT pk__source_activity PRIMARY KEY CLUSTERED (SOURCE_ACTIVITY_STATUS_KEY)
go

IF OBJECT_ID('SOURCE_ACTIVITY_STATUS') IS NOT NULL
    PRINT '<<< CREATED TABLE SOURCE_ACTIVITY_STATUS >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE SOURCE_ACTIVITY_STATUS >>>'
go

/* 
 * TABLE: SOURCE_ACTIVITY_TYPE 
 */

CREATE TABLE SOURCE_ACTIVITY_TYPE(
    SOURCE_ACTIVITY_TYPE_KEY     numeric(19, 0)    IDENTITY(1,1),
    SOURCE_ACTIVITY_TYPE_ID      numeric(19, 0)    NOT NULL,
    IS_CURRENT                   char(1)           NOT NULL,
    IS_DELETED                   char(1)           NOT NULL,
    IS_CURRENT_DAY               char(1)           NOT NULL,
    VALID_FROM                   datetime          NOT NULL,
    VALID_TILL                   datetime          NOT NULL,
    LAST_MODIFIED_BY             varchar(50)       NOT NULL,
    LAST_MODIFIED_ON             datetime          NOT NULL,
    BATCH_ID                     bigint            NOT NULL,
    ACTIVITY_SOURCE_ID           numeric(19, 0)    NULL,
    ACTIVITY_TYPE_ID             numeric(19, 0)    NULL,
    DESCRIPTION                  varchar(256)      NULL,
    CODE                         varchar(64)       NULL,
    SOURCE_ACTIVITY_TYPE_UUID    varchar(128)      NULL,
    EXCLUDED_FLAG                char(1)           NULL,
    ACTIVITY_SOURCE_KEY          numeric(19, 0)    NULL,
    ACTIVITY_TYPE_KEY            numeric(19, 0)    NULL,
    NAMESPACE                    varchar(128)      NULL
)
go



IF OBJECT_ID('SOURCE_ACTIVITY_TYPE') IS NOT NULL
    PRINT '<<< CREATED TABLE SOURCE_ACTIVITY_TYPE >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE SOURCE_ACTIVITY_TYPE >>>'
go

/* 
 * TABLE: SOURCE_ACTIVITY_TYPE 
 */

ALTER TABLE SOURCE_ACTIVITY_TYPE ADD 
    CONSTRAINT pk__source_activity_type PRIMARY KEY CLUSTERED (SOURCE_ACTIVITY_TYPE_KEY)
go

IF OBJECT_ID('SOURCE_ACTIVITY_TYPE') IS NOT NULL
    PRINT '<<< CREATED TABLE SOURCE_ACTIVITY_TYPE >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE SOURCE_ACTIVITY_TYPE >>>'
go

/* 
 * VIEW: ACTIVITY_COMMENT_V 
 */

CREATE VIEW ACTIVITY_COMMENT_V  AS
SELECT ACTIVITY_COMMENT_KEY
		  ,ACTIVITY_COMMENT_ID
		  ,IS_CURRENT
		  ,IS_DELETED
		  ,IS_CURRENT_DAY
		  ,VALID_FROM
		  ,VALID_TILL
		  ,LAST_MODIFIED_BY
		  ,LAST_MODIFIED_ON
		  ,BATCH_ID
		  ,ACTIVITY_ID
		  ,CONTACT_ID
		  ,CREATED_DATE
		  ,UPDATED_DATE
		  ,SELLER_VIEWABLE_FLAG
		  ,DUE_DILIGENCE_VIEWABLE_FLAG
		  ,INTERNAL_VIEWABLE_FLAG
		  ,COMMENT_TEXT
		  ,ACTIVITY_COMMENT_UUID
		  ,ACTIVITY_COMMENT_INDEX
		  ,ACTIVITY_KEY
		  ,CONTACT_KEY
		  ,[NAMESPACE]
FROM dbo.ACTIVITY_COMMENT
WHERE IS_CURRENT = 'Y' AND IS_DELETED = 'N'
go

IF OBJECT_ID('ACTIVITY_COMMENT_V') IS NOT NULL
    PRINT '<<< CREATED VIEW ACTIVITY_COMMENT_V >>>'
ELSE
    PRINT '<<< FAILED CREATING VIEW ACTIVITY_COMMENT_V >>>'
go

/* 
 * VIEW: ACTIVITY_STATUS_V 
 */

CREATE VIEW [ACTIVITY_STATUS_V]  AS
SELECT ACTIVITY_STATUS_KEY
		  ,ACTIVITY_STATUS_ID
		  ,IS_CURRENT
		  ,IS_DELETED
		  ,IS_CURRENT_DAY
		  ,VALID_FROM
		  ,VALID_TILL
		  ,LAST_MODIFIED_BY
		  ,LAST_MODIFIED_ON
		  ,BATCH_ID
		  ,[Action]
		  ,ModDate
		  ,ModBy
		  ,[DESCRIPTION]
		  ,OPEN_STATUS_FLAG
		  ,ACTIVITY_STATUS_UUID
		  ,[NAMESPACE]
FROM dbo.ACTIVITY_STATUS
WHERE IS_CURRENT = 'Y' AND IS_DELETED = 'N'
go

IF OBJECT_ID('ACTIVITY_STATUS_V') IS NOT NULL
    PRINT '<<< CREATED VIEW ACTIVITY_STATUS_V >>>'
ELSE
    PRINT '<<< FAILED CREATING VIEW ACTIVITY_STATUS_V >>>'
go

/* 
 * VIEW: ACTIVITY_TYPE_v 
 */

CREATE VIEW [ACTIVITY_TYPE_v]  AS
SELECT  ACTIVITY_TYPE_KEY
      ,ACTIVITY_TYPE_ID
      ,IS_CURRENT
      ,IS_DELETED
      ,IS_CURRENT_DAY
      ,VALID_FROM
      ,VALID_TILL
      ,LAST_MODIFIED_BY
      ,LAST_MODIFIED_ON
      ,BATCH_ID
      ,CODE
      ,[DESCRIPTION]
      ,ACTIVITY_CATEGORY
      ,ACTIVITY_TYPE_UUID
      ,[NAMESPACE]
FROM [dbo].[ACTIVITY_TYPE]
WHERE IS_CURRENT = 'Y' AND IS_DELETED = 'N'
go

IF OBJECT_ID('ACTIVITY_TYPE_v') IS NOT NULL
    PRINT '<<< CREATED VIEW ACTIVITY_TYPE_v >>>'
ELSE
    PRINT '<<< FAILED CREATING VIEW ACTIVITY_TYPE_v >>>'
go

/* 
 * VIEW: ACTIVITY_V 
 */

CREATE VIEW [ACTIVITY_V]  AS
SELECT ACTIVITY_KEY
      ,ACTIVITY_ID
      ,IS_CURRENT
      ,IS_DELETED
      ,IS_CURRENT_DAY
      ,VALID_FROM
      ,VALID_TILL
      ,LAST_MODIFIED_BY
      ,LAST_MODIFIED_ON
      ,BATCH_ID
      ,ACTIVITY_CLASS
      ,VERSION_NUMBER
      ,ACTIVITY_TYPE_ID
      ,LOAN_ID
      ,CONTACT_ID
      ,ACTIVITY_STATUS_ID
      ,ACTIVITY_SOURCE_ID
      ,SOURCE_ACTIVITY_STATUS_ID
      ,SOURCE_ACTIVITY_TYPE_ID
      ,CREATED_DATE
      ,UPDATED_DATE
      ,CREATED_DATE_AS_LONG
      ,UPDATED_DATE_AS_LONG
      ,[DESCRIPTION]
      ,SOURCE_ACTIVITY_IDENTIFIER
      ,SOURCE_DESCRIPTION
      ,SELLER_VIEWABLE_FLAG
      ,ACTIVITY_UUID
      ,ACTIVITY_BI_UUID
      ,ACTIVITY_CLOSED_DATE
      ,ACTIVITY_TYPE_KEY
      ,LOAN_KEY
      ,CONTACT_KEY
      ,ACTIVITY_STATUS_KEY
      ,ACTIVITY_SOURCE_KEY
      ,SOURCE_ACTIVITY_STATUS_KEY
      ,SOURCE_ACTIVITY_TYPE_KEY
      ,SOURCE_ACKNOWLEDGED_FLAG
	  ,EXCLUDED_FLAG
      ,[NAMESPACE]
FROM [dbo].[ACTIVITY]
WHERE IS_CURRENT = 'Y' AND IS_DELETED = 'N'
go

IF OBJECT_ID('ACTIVITY_V') IS NOT NULL
    PRINT '<<< CREATED VIEW ACTIVITY_V >>>'
ELSE
    PRINT '<<< FAILED CREATING VIEW ACTIVITY_V >>>'
go

/* 
 * VIEW: COMPANY_V 
 */

CREATE VIEW [COMPANY_V]  AS
SELECT  COMPANY_KEY
      ,COMPANY_ID
      ,IS_CURRENT
      ,IS_DELETED
      ,IS_CURRENT_DAY
      ,VALID_FROM
      ,VALID_TILL
      ,LAST_MODIFIED_BY
      ,LAST_MODIFIED_ON
      ,BATCH_ID
      ,VERSION_NUMBER
      ,OWNING_COMPANY_ID
      ,COMPANY_NAME
      ,COMPANY_CODE
      ,ADMIN_EMAIL_TO_ADDRESS
      ,OWNING_COMPANY_KEY
      ,BUSINESS_DAY_CALENDAR_KEY
      ,[NAMESPACE]
FROM [dbo].[COMPANY]
WHERE IS_CURRENT = 'Y' AND IS_DELETED = 'N'
go

IF OBJECT_ID('COMPANY_V') IS NOT NULL
    PRINT '<<< CREATED VIEW COMPANY_V >>>'
ELSE
    PRINT '<<< FAILED CREATING VIEW COMPANY_V >>>'
go

/* 
 * VIEW: CONDITION_v 
 */

CREATE VIEW [CONDITION_v]  AS
SELECT ACTIVITY_KEY
      ,ACTIVITY_ID
      ,IS_CURRENT
      ,IS_DELETED
      ,IS_CURRENT_DAY
      ,VALID_FROM
      ,VALID_TILL
      ,LAST_MODIFIED_BY
      ,LAST_MODIFIED_ON
      ,BATCH_ID
      ,CONDITION_TYPE_ID
      ,INVESTOR_CONDITION_STATUS_ID
      ,DUE_DILG_VEND_COND_STATUS_ID
      ,CONDITION_STATUS_ID
      ,CONDITION_TIMING_TYPE_ID
      ,SOURCE_GRADE
      ,SOURCE_COMMENTS
      ,INVESTOR_CONDITION_STATUS_KEY
      ,DUE_DILG_VEND_COND_STATUS_KEY
      ,CONDITION_STATUS_KEY
      ,CONDITION_TIMING_TYPE_KEY
      ,[NAMESPACE]
FROM [dbo].[CONDITION]
WHERE IS_CURRENT = 'Y' AND IS_DELETED = 'N'
go

IF OBJECT_ID('CONDITION_v') IS NOT NULL
    PRINT '<<< CREATED VIEW CONDITION_v >>>'
ELSE
    PRINT '<<< FAILED CREATING VIEW CONDITION_v >>>'
go

/* 
 * VIEW: DUE_DILG_VENDOR_DATA_v 
 */

CREATE VIEW [DUE_DILG_VENDOR_DATA_v]  AS
SELECT DUE_DILG_VENDOR_DATA_KEY
      ,DUE_DILG_VENDOR_DATA_ID
      ,IS_CURRENT
      ,IS_DELETED
      ,IS_CURRENT_DAY
      ,VALID_FROM
      ,VALID_TILL
      ,LAST_MODIFIED_BY
      ,LAST_MODIFIED_ON
      ,BATCH_ID
      ,PRICING_SCENARIO_ID
      ,DUE_DILG_VENDOR_STATUS_ID
      ,COMPANY_ID
      ,VENDOR_LOAN_NUMBER
      ,VENDOR_STATUS_DATE
      ,VENDOR_STATUS_DATE_AS_LONG
      ,DUE_DILG_VENDOR_DATA_UUID
      ,CREATED_DATE
      ,UPDATED_DATE
      ,PRICING_SCENARIO_KEY
      ,DUE_DILG_VENDOR_STATUS_KEY
      ,COMPANY_KEY
      ,[NAMESPACE]
FROM [dbo].[DUE_DILG_VENDOR_DATA]
WHERE IS_CURRENT = 'Y' AND IS_DELETED = 'N'
go

IF OBJECT_ID('DUE_DILG_VENDOR_DATA_v') IS NOT NULL
    PRINT '<<< CREATED VIEW DUE_DILG_VENDOR_DATA_v >>>'
ELSE
    PRINT '<<< FAILED CREATING VIEW DUE_DILG_VENDOR_DATA_v >>>'
go

/* 
 * VIEW: DUE_DILG_VENDOR_STATUS_v 
 */

CREATE VIEW [DUE_DILG_VENDOR_STATUS_v]  AS
SELECT DUE_DILG_VENDOR_STATUS_KEY
      ,DUE_DILG_VENDOR_STATUS_ID
      ,IS_CURRENT
      ,IS_DELETED
      ,IS_CURRENT_DAY
      ,VALID_FROM
      ,VALID_TILL
      ,LAST_MODIFIED_BY
      ,LAST_MODIFIED_ON
      ,BATCH_ID
      ,COMPANY_ID
      ,DUE_DILG_STATUS_TYPE_ID
      ,CODE
      ,[DESCRIPTION]
      ,DUE_DILG_VENDOR_STATUS_UUID
      ,COMPANY_KEY
      ,DUE_DILG_STATUS_TYPE_KEY
      ,[NAMESPACE]
FROM [dbo].[DUE_DILG_VENDOR_STATUS]
WHERE IS_CURRENT = 'Y' AND IS_DELETED = 'N'
go

IF OBJECT_ID('DUE_DILG_VENDOR_STATUS_v') IS NOT NULL
    PRINT '<<< CREATED VIEW DUE_DILG_VENDOR_STATUS_v >>>'
ELSE
    PRINT '<<< FAILED CREATING VIEW DUE_DILG_VENDOR_STATUS_v >>>'
go

/* 
 * VIEW: END_USER_v 
 */

CREATE VIEW [END_USER_v]  AS
SELECT CONTACT_KEY
      ,CONTACT_ID
      ,IS_CURRENT
      ,IS_DELETED
      ,IS_CURRENT_DAY
      ,VALID_FROM
      ,VALID_TILL
      ,LAST_MODIFIED_BY
      ,LAST_MODIFIED_ON
      ,BATCH_ID
      ,COMPANY_ID
      ,[USER_NAME]
      ,ACCOUNT_APPROVED_FLAG
      ,ACCOUNT_ACTIVATED_FLAG
      ,COMPANY_KEY
      ,[NAMESPACE]
FROM [dbo].[END_USER]
WHERE IS_CURRENT = 'Y' AND IS_DELETED = 'N'
go

IF OBJECT_ID('END_USER_v') IS NOT NULL
    PRINT '<<< CREATED VIEW END_USER_v >>>'
ELSE
    PRINT '<<< FAILED CREATING VIEW END_USER_v >>>'
go

/* 
 * VIEW: HISTORY_EVENT_V 
 */

CREATE VIEW [HISTORY_EVENT_V]  AS
SELECT HISTORY_EVENT_KEY
      ,HISTORY_EVENT_ID
      ,IS_CURRENT
      ,IS_DELETED
      ,IS_CURRENT_DAY
      ,VALID_FROM
      ,VALID_TILL
      ,LAST_MODIFIED_BY
      ,LAST_MODIFIED_ON
      ,BATCH_ID
      ,LOAN_ID
      ,CONTACT_ID
      ,CHANGE_DATE
      ,EVENT_NAME
      ,ID_BEFORE
      ,VALUE_BEFORE
      ,ID_AFTER
      ,VALUE_AFTER
      ,ADDITIONAL_INFORMATION
      ,CHANGE_BY_DETAIL
      ,VERBOSE_HISTORY_FLAG
      ,LOAN_KEY
      ,CONTACT_KEY
      ,[NAMESPACE]
FROM [dbo].[HISTORY_EVENT]
WHERE IS_CURRENT = 'Y' AND IS_DELETED = 'N'
go

IF OBJECT_ID('HISTORY_EVENT_V') IS NOT NULL
    PRINT '<<< CREATED VIEW HISTORY_EVENT_V >>>'
ELSE
    PRINT '<<< FAILED CREATING VIEW HISTORY_EVENT_V >>>'
go

/* 
 * VIEW: INV_CONDITION_STATUS_v 
 */

CREATE VIEW [INV_CONDITION_STATUS_v]  AS
SELECT INVESTOR_CONDITION_STATUS_KEY
      ,INVESTOR_CONDITION_STATUS_ID
      ,IS_CURRENT
      ,IS_DELETED
      ,IS_CURRENT_DAY
      ,VALID_FROM
      ,VALID_TILL
      ,LAST_MODIFIED_BY
      ,LAST_MODIFIED_ON
      ,BATCH_ID
      ,COMPANY_ID
      ,CONDITION_STATUS_ID
      ,[DESCRIPTION]
      ,INVESTOR_CONDITION_STATUS_UUID
      ,COMPANY_KEY
      ,CONDITION_STATUS_KEY
      ,[NAMESPACE]
FROM [dbo].[INVESTOR_CONDITION_STATUS]
WHERE IS_CURRENT = 'Y' AND IS_DELETED = 'N'
go

IF OBJECT_ID('INV_CONDITION_STATUS_v') IS NOT NULL
    PRINT '<<< CREATED VIEW INV_CONDITION_STATUS_v >>>'
ELSE
    PRINT '<<< FAILED CREATING VIEW INV_CONDITION_STATUS_v >>>'
go

/* 
 * VIEW: INV_DUE_DILG_SAMPLE_TYPE_V 
 */

CREATE VIEW INV_DUE_DILG_SAMPLE_TYPE_V  AS
SELECT INV_DUE_DILG_SAMPLE_TYPE_KEY
		  ,INV_DUE_DILG_SAMPLE_TYPE_ID
		  ,IS_CURRENT
		  ,IS_DELETED
		  ,IS_CURRENT_DAY
		  ,VALID_FROM
		  ,VALID_TILL
		  ,LAST_MODIFIED_BY
		  ,LAST_MODIFIED_ON
		  ,BATCH_ID
		  ,[Action]
		  ,ModDate
		  ,ModBy
		  ,VERSION_NUMBER
		  ,COMPANY_ID
		  ,DUE_DILG_SAMPLE_TYPE_ID
		  ,INV_DUE_DILG_SAMPLE_TYPE_UUID
		  ,[DESCRIPTION]
		  ,SORT_ORDER
		  ,[NAMESPACE]
FROM dbo.INV_DUE_DILG_SAMPLE_TYPE
WHERE IS_CURRENT = 'Y' AND IS_DELETED = 'N'
go

IF OBJECT_ID('INV_DUE_DILG_SAMPLE_TYPE_V') IS NOT NULL
    PRINT '<<< CREATED VIEW INV_DUE_DILG_SAMPLE_TYPE_V >>>'
ELSE
    PRINT '<<< FAILED CREATING VIEW INV_DUE_DILG_SAMPLE_TYPE_V >>>'
go

/* 
 * VIEW: INV_DUE_DILIGENCE_STATUS_v 
 */

CREATE VIEW [INV_DUE_DILIGENCE_STATUS_v]  AS
SELECT INV_DUE_DILIGENCE_STATUS_KEY
      ,INV_DUE_DILIGENCE_STATUS_ID
      ,IS_CURRENT
      ,IS_DELETED
      ,IS_CURRENT_DAY
      ,VALID_FROM
      ,VALID_TILL
      ,LAST_MODIFIED_BY
      ,LAST_MODIFIED_ON
      ,BATCH_ID
      ,VERSION_NUMBER
      ,COMPANY_ID
      ,INV_DUE_DILG_STATUS_TYPE_ID
      ,INV_DUE_DILG_STATUS_UUID
      ,[DESCRIPTION]
      ,SORT_ORDER
      ,COMPANY_KEY
      ,INV_DUE_DILG_STATUS_TYPE_KEY
      ,[NAMESPACE]
FROM [dbo].[INV_DUE_DILIGENCE_STATUS]
WHERE IS_CURRENT = 'Y' AND IS_DELETED = 'N'
go

IF OBJECT_ID('INV_DUE_DILIGENCE_STATUS_v') IS NOT NULL
    PRINT '<<< CREATED VIEW INV_DUE_DILIGENCE_STATUS_v >>>'
ELSE
    PRINT '<<< FAILED CREATING VIEW INV_DUE_DILIGENCE_STATUS_v >>>'
go

/* 
 * VIEW: INVESTOR_STATUS_v 
 */

CREATE VIEW [INVESTOR_STATUS_v]  AS
SELECT INVESTOR_STATUS_KEY
      ,INVESTOR_STATUS_ID
      ,IS_CURRENT
      ,IS_DELETED
      ,IS_CURRENT_DAY
      ,VALID_FROM
      ,VALID_TILL
      ,LAST_MODIFIED_BY
      ,LAST_MODIFIED_ON
      ,BATCH_ID
      ,COMPANY_ID
      ,[DESCRIPTION]
      ,INVESTOR_STATUS_UUID
      ,FINAL_DISPOSITION_FLAG
      ,COMPANY_KEY
      ,[NAMESPACE]
FROM [dbo].[INVESTOR_STATUS]
WHERE IS_CURRENT = 'Y' AND IS_DELETED = 'N'
go

IF OBJECT_ID('INVESTOR_STATUS_v') IS NOT NULL
    PRINT '<<< CREATED VIEW INVESTOR_STATUS_v >>>'
ELSE
    PRINT '<<< FAILED CREATING VIEW INVESTOR_STATUS_v >>>'
go

/* 
 * VIEW: JOB_ROLE_v 
 */

CREATE VIEW [JOB_ROLE_v]  AS
SELECT JOB_ROLE_KEY
      ,JOB_ROLE_ID
      ,IS_CURRENT
      ,IS_DELETED
      ,IS_CURRENT_DAY
      ,VALID_FROM
      ,VALID_TILL
      ,LAST_MODIFIED_BY
      ,LAST_MODIFIED_ON
      ,BATCH_ID
      ,NAME
      ,[DESCRIPTION]
      ,JOB_ROLE_UUID
      ,[NAMESPACE]
FROM [dbo].[JOB_ROLE]
WHERE IS_CURRENT = 'Y' AND IS_DELETED = 'N'
go

IF OBJECT_ID('JOB_ROLE_v') IS NOT NULL
    PRINT '<<< CREATED VIEW JOB_ROLE_v >>>'
ELSE
    PRINT '<<< FAILED CREATING VIEW JOB_ROLE_v >>>'
go

/* 
 * VIEW: LOAN_COMMENT_v 
 */

CREATE VIEW [LOAN_COMMENT_v]  AS
SELECT LOAN_COMMENT_KEY
      ,LOAN_COMMENT_ID
      ,IS_CURRENT
      ,IS_DELETED
      ,IS_CURRENT_DAY
      ,VALID_FROM
      ,VALID_TILL
      ,LAST_MODIFIED_BY
      ,LAST_MODIFIED_ON
      ,BATCH_ID
      ,LOAN_ID
      ,CONTACT_ID
      ,CREATED_DATE
      ,UPDATED_DATE
      ,SELLER_VIEWABLE_FLAG
      ,DUE_DILIGENCE_VIEWABLE_FLAG
      ,INTERNAL_VIEWABLE_FLAG
      ,COMMENT_TEXT
      ,LOAN_COMMENT_UUID
      ,LOAN_COMMENT_INDEX
      ,LOAN_COMMENT_CLASS
      ,SOURCE_IDENTIFIER
      ,DUE_DILIGENCE_VENDOR_ID
      ,SOURCE_GRADE
      ,SOURCE_COMMENTS
      ,SOURCE_DESCRIPTION
      ,SOURCE_ACKNOWLEDGED_FLAG
      ,SOURCE_DESCRIPTION_UPDATED_DATE
      ,CODE
      ,LOAN_KEY
      ,CONTACT_KEY
      ,DUE_DILIGENCE_VENDOR_KEY
      ,[NAMESPACE]
FROM [dbo].[LOAN_COMMENT]
WHERE IS_CURRENT = 'Y' AND IS_DELETED = 'N'
go

IF OBJECT_ID('LOAN_COMMENT_v') IS NOT NULL
    PRINT '<<< CREATED VIEW LOAN_COMMENT_v >>>'
ELSE
    PRINT '<<< FAILED CREATING VIEW LOAN_COMMENT_v >>>'
go

/* 
 * VIEW: LOAN_END_USER_v 
 */

CREATE VIEW [LOAN_END_USER_v]  AS
SELECT LOAN_END_USER_KEY
      ,LOAN_END_USER_ID
      ,IS_CURRENT
      ,IS_DELETED
      ,IS_CURRENT_DAY
      ,VALID_FROM
      ,VALID_TILL
      ,LAST_MODIFIED_BY
      ,LAST_MODIFIED_ON
      ,BATCH_ID
      ,LOAN_ID
      ,CONTACT_ID
      ,END_USER_CONTACT_ID
      ,JOB_ROLE_ID
      ,LOAN_END_USER_UUID
      ,LOAN_KEY
      ,CONTACT_KEY
      ,END_USER_CONTACT_KEY
      ,JOB_ROLE_KEY
      ,[NAMESPACE]
FROM [dbo].[LOAN_END_USER]
WHERE IS_CURRENT = 'Y' AND IS_DELETED = 'N'
go

IF OBJECT_ID('LOAN_END_USER_v') IS NOT NULL
    PRINT '<<< CREATED VIEW LOAN_END_USER_v >>>'
ELSE
    PRINT '<<< FAILED CREATING VIEW LOAN_END_USER_v >>>'
go

/* 
 * VIEW: LOAN_V 
 */

CREATE VIEW [LOAN_V]  AS
SELECT LOAN_KEY
      ,LOAN_ID
      ,IS_CURRENT
      ,IS_DELETED
      ,IS_CURRENT_DAY
      ,VALID_FROM
      ,VALID_TILL
      ,LAST_MODIFIED_BY
      ,LAST_MODIFIED_ON
      ,BATCH_ID
      ,VERSION_NUMBER
      ,PROPERTY_ID
      ,LOAN_ORIGINATOR_ID
      ,ORIGINATING_PARTNER_ID
      ,DOCUMENTATION_TYPE_ID
      ,STATUS_ID
      ,TITLE_ORDER_DETAILS_ID
      ,POLICY_ID
      ,COMPANY_ID
      ,CREATED_BY_ID
      ,SELLING_COMPANY_ID
      ,LOAN_PURPOSE_ID
      ,ESCROW_TYPE_ID
      ,APPLICATION_DATE
      ,SIGNING_DATE
      ,FUNDING_DATE
      ,LOAN_NUMBER
      ,TOTAL_LOAN_AMOUNT
      ,LOAN_UUID
      ,ARMS_LENGTH_FLAG
      ,NEEDS_POLICY_VERIF_FLAG
      ,CREATED_DATE
      ,UPDATED_DATE
      ,CREATED_DATE_AS_LONG
      ,UPDATED_DATE_AS_LONG
      ,INVALID_FLAG
      ,CLEARED_BY_CSTD_FLAG
      ,CMT_VISIBLE_FLAG
      ,PROPERTY_KEY
      ,LOAN_ORIGINATOR_KEY
      ,ORIGINATING_PARTNER_KEY
      ,DOCUMENTATION_TYPE_KEY
      ,STATUS_KEY
      ,TITLE_ORDER_DETAILS_KEY
      ,POLICY_KEY
      ,COMPANY_KEY
      ,CREATED_BY_KEY
      ,SELLING_COMPANY_KEY
      ,LOAN_PURPOSE_KEY
      ,ESCROW_TYPE_KEY
      ,[NAMESPACE]
FROM [dbo].[LOAN]
WHERE IS_CURRENT = 'Y' AND IS_DELETED = 'N'
go

IF OBJECT_ID('LOAN_V') IS NOT NULL
    PRINT '<<< CREATED VIEW LOAN_V >>>'
ELSE
    PRINT '<<< FAILED CREATING VIEW LOAN_V >>>'
go

/* 
 * VIEW: PRICING_SCENARIO_RATING_v 
 */

CREATE VIEW [PRICING_SCENARIO_RATING_v]  AS
SELECT PRICING_SCENARIO_RATING_KEY
      ,PRICING_SCENARIO_RATING_ID
      ,IS_CURRENT
      ,IS_DELETED
      ,IS_CURRENT_DAY
      ,VALID_FROM
      ,VALID_TILL
      ,LAST_MODIFIED_BY
      ,LAST_MODIFIED_ON
      ,BATCH_ID
      ,PRICING_SCENARIO_ID
      ,RATING_AGENCY_ID
      ,OVERALL_GRADE
      ,CREDIT_GRADE
      ,COMPLIANCE_GRADE
      ,PROPERTY_GRADE
      ,PRICING_SCENARIO_KEY
      ,RATING_AGENCY_KEY
      ,[NAMESPACE]
FROM [dbo].[PRICING_SCENARIO_RATING]
WHERE IS_CURRENT = 'Y' AND IS_DELETED = 'N'
go

IF OBJECT_ID('PRICING_SCENARIO_RATING_v') IS NOT NULL
    PRINT '<<< CREATED VIEW PRICING_SCENARIO_RATING_v >>>'
ELSE
    PRINT '<<< FAILED CREATING VIEW PRICING_SCENARIO_RATING_v >>>'
go

/* 
 * VIEW: PRICING_SCENARIO_V 
 */

CREATE VIEW [PRICING_SCENARIO_V]  AS
SELECT  PRICING_SCENARIO_KEY
      ,PRICING_SCENARIO_ID
      ,IS_CURRENT
      ,IS_DELETED
      ,IS_CURRENT_DAY
      ,VALID_FROM
      ,VALID_TILL
      ,LAST_MODIFIED_BY
      ,LAST_MODIFIED_ON
      ,BATCH_ID
      ,LOAN_ID
      ,PIGGY_BACK_SCENARIO_ID
      ,PARENT_SCENARIO_ID
      ,LENDER_LOAN_PROGRAM_ID
      ,PRICING_GROUP_ID
      ,CREDIT_GRADE_ID
      ,INVESTOR_COMMITMENT_ID
      ,INVESTOR_STATUS_ID
      ,INV_DUE_DILIGENCE_STATUS_ID
      ,INV_DUE_DILG_SAMPLE_TYPE_ID
      ,CURRENT_PRICING_FLAG
      ,INVESTOR_LOAN_NUMBER
      ,PRICING_SCENARIO_UUID
      ,ASSG_DUE_DILG_VEND_COMPANY_ID
      ,ASSG_DUE_DILG_DATE
      ,CONDITION_NOTIFICATION_DATE
      ,SUSPENSE_EXPIRATION_DATE
      ,CALC_SUSPENSE_EXPIRATION_DATE
      ,SUSPENSE_CLEARED_DATE
      ,APPR_REVIEW_REQUEST_DATE
      ,PURCH_REVIEW_REQUEST_DATE
      ,CREDIT_REVIEW_COMPLETE_DATE
      ,COLLATERAL_REVIEW_CMPLT_DATE
      ,LEGACY_SUSP_CLEARED_DATE
      ,LEGACY_SUSP_CLEARED_FLAG
      ,LOAN_KEY
      ,PIGGY_BACK_SCENARIO_KEY
      ,PARENT_SCENARIO_KEY
      ,LENDER_LOAN_PROGRAM_KEY
      ,PRICING_GROUP_KEY
      ,CREDIT_GRADE_KEY
      ,INVESTOR_COMMITMENT_KEY
      ,INVESTOR_STATUS_KEY
      ,INV_DUE_DILIGENCE_STATUS_KEY
      ,INV_DUE_DILG_SAMPLE_TYPE_KEY
      ,ASSG_DUE_DILG_VEND_COMPANY_KEY
      ,SELLER_REVIEW_DATE
      ,[NAMESPACE]
FROM dbo.PRICING_SCENARIO
WHERE IS_CURRENT = 'Y' AND IS_DELETED = 'N'
go

IF OBJECT_ID('PRICING_SCENARIO_V') IS NOT NULL
    PRINT '<<< CREATED VIEW PRICING_SCENARIO_V >>>'
ELSE
    PRINT '<<< FAILED CREATING VIEW PRICING_SCENARIO_V >>>'
go

/* 
 * VIEW: SOURCE_ACTIVITY_STATUS_v 
 */

CREATE VIEW [SOURCE_ACTIVITY_STATUS_v]  AS
SELECT SOURCE_ACTIVITY_STATUS_KEY
      ,SOURCE_ACTIVITY_STATUS_ID
      ,IS_CURRENT
      ,IS_DELETED
      ,IS_CURRENT_DAY
      ,VALID_FROM
      ,VALID_TILL
      ,LAST_MODIFIED_BY
      ,LAST_MODIFIED_ON
      ,BATCH_ID
      ,ACTIVITY_SOURCE_ID
      ,ACTIVITY_STATUS_ID
      ,[DESCRIPTION]
      ,CODE
      ,SOURCE_ACTIVITY_STATUS_UUID
      ,ACTIVITY_SOURCE_KEY
      ,ACTIVITY_STATUS_KEY
      ,[NAMESPACE]
FROM [dbo].[SOURCE_ACTIVITY_STATUS]
WHERE IS_CURRENT = 'Y' AND IS_DELETED = 'N'
go

IF OBJECT_ID('SOURCE_ACTIVITY_STATUS_v') IS NOT NULL
    PRINT '<<< CREATED VIEW SOURCE_ACTIVITY_STATUS_v >>>'
ELSE
    PRINT '<<< FAILED CREATING VIEW SOURCE_ACTIVITY_STATUS_v >>>'
go

/* 
 * VIEW: SOURCE_ACTIVITY_TYPE_v 
 */

CREATE VIEW [SOURCE_ACTIVITY_TYPE_v]  AS
SELECT SOURCE_ACTIVITY_TYPE_KEY
      ,SOURCE_ACTIVITY_TYPE_ID
      ,IS_CURRENT
      ,IS_DELETED
      ,IS_CURRENT_DAY
      ,VALID_FROM
      ,VALID_TILL
      ,LAST_MODIFIED_BY
      ,LAST_MODIFIED_ON
      ,BATCH_ID
      ,ACTIVITY_SOURCE_ID
      ,ACTIVITY_TYPE_ID
      ,[DESCRIPTION]
      ,CODE
      ,SOURCE_ACTIVITY_TYPE_UUID
      ,EXCLUDED_FLAG
      ,ACTIVITY_SOURCE_KEY
      ,ACTIVITY_TYPE_KEY
      ,[NAMESPACE]
FROM [dbo].[SOURCE_ACTIVITY_TYPE]
WHERE IS_CURRENT = 'Y' AND IS_DELETED = 'N'
go

IF OBJECT_ID('SOURCE_ACTIVITY_TYPE_v') IS NOT NULL
    PRINT '<<< CREATED VIEW SOURCE_ACTIVITY_TYPE_v >>>'
ELSE
    PRINT '<<< FAILED CREATING VIEW SOURCE_ACTIVITY_TYPE_v >>>'
go

/* 
 * INDEX: activity_idx2 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ACTIVITY') AND name='activity_idx2')
BEGIN
    DROP INDEX ACTIVITY.activity_idx2
    PRINT '<<< DROPPED INDEX ACTIVITY.activity_idx2 >>>'
END
go

/* 
 * INDEX: activity_fk1 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ACTIVITY') AND name='activity_fk1')
BEGIN
    DROP INDEX ACTIVITY.activity_fk1
    PRINT '<<< DROPPED INDEX ACTIVITY.activity_fk1 >>>'
END
go

/* 
 * INDEX: activity_idx_uuid 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ACTIVITY') AND name='activity_idx_uuid')
BEGIN
    DROP INDEX ACTIVITY.activity_idx_uuid
    PRINT '<<< DROPPED INDEX ACTIVITY.activity_idx_uuid >>>'
END
go

/* 
 * INDEX: activity_idx1 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ACTIVITY') AND name='activity_idx1')
BEGIN
    DROP INDEX ACTIVITY.activity_idx1
    PRINT '<<< DROPPED INDEX ACTIVITY.activity_idx1 >>>'
END
go

/* 
 * INDEX: activity_idx2 
 */

CREATE INDEX activity_idx2 ON ACTIVITY(ACTIVITY_CLASS)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ACTIVITY') AND name='activity_idx2')
    PRINT '<<< CREATED INDEX ACTIVITY.activity_idx2 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ACTIVITY.activity_idx2 >>>'
go

/* 
 * INDEX: activity_fk1 
 */

CREATE INDEX activity_fk1 ON ACTIVITY(LOAN_ID)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ACTIVITY') AND name='activity_fk1')
    PRINT '<<< CREATED INDEX ACTIVITY.activity_fk1 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ACTIVITY.activity_fk1 >>>'
go

/* 
 * INDEX: activity_idx_uuid 
 */

CREATE INDEX activity_idx_uuid ON ACTIVITY(ACTIVITY_UUID)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ACTIVITY') AND name='activity_idx_uuid')
    PRINT '<<< CREATED INDEX ACTIVITY.activity_idx_uuid >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ACTIVITY.activity_idx_uuid >>>'
go

/* 
 * INDEX: activity_idx1 
 */

CREATE INDEX activity_idx1 ON ACTIVITY(ACTIVITY_SOURCE_ID, SOURCE_ACTIVITY_IDENTIFIER)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ACTIVITY') AND name='activity_idx1')
    PRINT '<<< CREATED INDEX ACTIVITY.activity_idx1 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ACTIVITY.activity_idx1 >>>'
go

/* 
 * INDEX: activity_comment_fk1 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ACTIVITY_COMMENT') AND name='activity_comment_fk1')
BEGIN
    DROP INDEX ACTIVITY_COMMENT.activity_comment_fk1
    PRINT '<<< DROPPED INDEX ACTIVITY_COMMENT.activity_comment_fk1 >>>'
END
go

/* 
 * INDEX: activity_comment_idx_uuid 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ACTIVITY_COMMENT') AND name='activity_comment_idx_uuid')
BEGIN
    DROP INDEX ACTIVITY_COMMENT.activity_comment_idx_uuid
    PRINT '<<< DROPPED INDEX ACTIVITY_COMMENT.activity_comment_idx_uuid >>>'
END
go

/* 
 * INDEX: activity_comment_fk1 
 */

CREATE INDEX activity_comment_fk1 ON ACTIVITY_COMMENT(ACTIVITY_ID, ACTIVITY_COMMENT_INDEX)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ACTIVITY_COMMENT') AND name='activity_comment_fk1')
    PRINT '<<< CREATED INDEX ACTIVITY_COMMENT.activity_comment_fk1 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ACTIVITY_COMMENT.activity_comment_fk1 >>>'
go

/* 
 * INDEX: activity_comment_idx_uuid 
 */

CREATE INDEX activity_comment_idx_uuid ON ACTIVITY_COMMENT(ACTIVITY_COMMENT_UUID)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ACTIVITY_COMMENT') AND name='activity_comment_idx_uuid')
    PRINT '<<< CREATED INDEX ACTIVITY_COMMENT.activity_comment_idx_uuid >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ACTIVITY_COMMENT.activity_comment_idx_uuid >>>'
go

/* 
 * INDEX: condition_idx1 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('CONDITION') AND name='condition_idx1')
BEGIN
    DROP INDEX CONDITION.condition_idx1
    PRINT '<<< DROPPED INDEX CONDITION.condition_idx1 >>>'
END
go

/* 
 * INDEX: condition_idx2 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('CONDITION') AND name='condition_idx2')
BEGIN
    DROP INDEX CONDITION.condition_idx2
    PRINT '<<< DROPPED INDEX CONDITION.condition_idx2 >>>'
END
go

/* 
 * INDEX: IX_CONDITION_Namespace 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('CONDITION') AND name='IX_CONDITION_Namespace')
BEGIN
    DROP INDEX CONDITION.IX_CONDITION_Namespace
    PRINT '<<< DROPPED INDEX CONDITION.IX_CONDITION_Namespace >>>'
END
go

/* 
 * INDEX: IX_CONDITION_ACTIVITY_ID 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('CONDITION') AND name='IX_CONDITION_ACTIVITY_ID')
BEGIN
    DROP INDEX CONDITION.IX_CONDITION_ACTIVITY_ID
    PRINT '<<< DROPPED INDEX CONDITION.IX_CONDITION_ACTIVITY_ID >>>'
END
go

/* 
 * INDEX: condition_idx1 
 */

CREATE INDEX condition_idx1 ON CONDITION(INVESTOR_CONDITION_STATUS_ID)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('CONDITION') AND name='condition_idx1')
    PRINT '<<< CREATED INDEX CONDITION.condition_idx1 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX CONDITION.condition_idx1 >>>'
go

/* 
 * INDEX: condition_idx2 
 */

CREATE INDEX condition_idx2 ON CONDITION(CONDITION_STATUS_ID)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('CONDITION') AND name='condition_idx2')
    PRINT '<<< CREATED INDEX CONDITION.condition_idx2 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX CONDITION.condition_idx2 >>>'
go

/* 
 * INDEX: IX_CONDITION_Namespace 
 */

CREATE INDEX IX_CONDITION_Namespace ON CONDITION(NAMESPACE)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('CONDITION') AND name='IX_CONDITION_Namespace')
    PRINT '<<< CREATED INDEX CONDITION.IX_CONDITION_Namespace >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX CONDITION.IX_CONDITION_Namespace >>>'
go

/* 
 * INDEX: IX_CONDITION_ACTIVITY_ID 
 */

CREATE INDEX IX_CONDITION_ACTIVITY_ID ON CONDITION(ACTIVITY_ID)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('CONDITION') AND name='IX_CONDITION_ACTIVITY_ID')
    PRINT '<<< CREATED INDEX CONDITION.IX_CONDITION_ACTIVITY_ID >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX CONDITION.IX_CONDITION_ACTIVITY_ID >>>'
go

/* 
 * INDEX: due_dilg_vendor_data_idx1 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('DUE_DILG_VENDOR_DATA') AND name='due_dilg_vendor_data_idx1')
BEGIN
    DROP INDEX DUE_DILG_VENDOR_DATA.due_dilg_vendor_data_idx1
    PRINT '<<< DROPPED INDEX DUE_DILG_VENDOR_DATA.due_dilg_vendor_data_idx1 >>>'
END
go

/* 
 * INDEX: due_dilg_vendor_data_idx2 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('DUE_DILG_VENDOR_DATA') AND name='due_dilg_vendor_data_idx2')
BEGIN
    DROP INDEX DUE_DILG_VENDOR_DATA.due_dilg_vendor_data_idx2
    PRINT '<<< DROPPED INDEX DUE_DILG_VENDOR_DATA.due_dilg_vendor_data_idx2 >>>'
END
go

/* 
 * INDEX: due_dilg_vendor_data_idx3 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('DUE_DILG_VENDOR_DATA') AND name='due_dilg_vendor_data_idx3')
BEGIN
    DROP INDEX DUE_DILG_VENDOR_DATA.due_dilg_vendor_data_idx3
    PRINT '<<< DROPPED INDEX DUE_DILG_VENDOR_DATA.due_dilg_vendor_data_idx3 >>>'
END
go

/* 
 * INDEX: due_dilg_vendor_data_fk1 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('DUE_DILG_VENDOR_DATA') AND name='due_dilg_vendor_data_fk1')
BEGIN
    DROP INDEX DUE_DILG_VENDOR_DATA.due_dilg_vendor_data_fk1
    PRINT '<<< DROPPED INDEX DUE_DILG_VENDOR_DATA.due_dilg_vendor_data_fk1 >>>'
END
go

/* 
 * INDEX: due_dilg_vendor_data_idx_uuid 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('DUE_DILG_VENDOR_DATA') AND name='due_dilg_vendor_data_idx_uuid')
BEGIN
    DROP INDEX DUE_DILG_VENDOR_DATA.due_dilg_vendor_data_idx_uuid
    PRINT '<<< DROPPED INDEX DUE_DILG_VENDOR_DATA.due_dilg_vendor_data_idx_uuid >>>'
END
go

/* 
 * INDEX: due_dilg_vendor_data_idx1 
 */

CREATE INDEX due_dilg_vendor_data_idx1 ON DUE_DILG_VENDOR_DATA(VENDOR_LOAN_NUMBER)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('DUE_DILG_VENDOR_DATA') AND name='due_dilg_vendor_data_idx1')
    PRINT '<<< CREATED INDEX DUE_DILG_VENDOR_DATA.due_dilg_vendor_data_idx1 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX DUE_DILG_VENDOR_DATA.due_dilg_vendor_data_idx1 >>>'
go

/* 
 * INDEX: due_dilg_vendor_data_idx2 
 */

CREATE INDEX due_dilg_vendor_data_idx2 ON DUE_DILG_VENDOR_DATA(VENDOR_STATUS_DATE_AS_LONG)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('DUE_DILG_VENDOR_DATA') AND name='due_dilg_vendor_data_idx2')
    PRINT '<<< CREATED INDEX DUE_DILG_VENDOR_DATA.due_dilg_vendor_data_idx2 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX DUE_DILG_VENDOR_DATA.due_dilg_vendor_data_idx2 >>>'
go

/* 
 * INDEX: due_dilg_vendor_data_idx3 
 */

CREATE INDEX due_dilg_vendor_data_idx3 ON DUE_DILG_VENDOR_DATA(VENDOR_STATUS_DATE)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('DUE_DILG_VENDOR_DATA') AND name='due_dilg_vendor_data_idx3')
    PRINT '<<< CREATED INDEX DUE_DILG_VENDOR_DATA.due_dilg_vendor_data_idx3 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX DUE_DILG_VENDOR_DATA.due_dilg_vendor_data_idx3 >>>'
go

/* 
 * INDEX: due_dilg_vendor_data_fk1 
 */

CREATE INDEX due_dilg_vendor_data_fk1 ON DUE_DILG_VENDOR_DATA(PRICING_SCENARIO_ID)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('DUE_DILG_VENDOR_DATA') AND name='due_dilg_vendor_data_fk1')
    PRINT '<<< CREATED INDEX DUE_DILG_VENDOR_DATA.due_dilg_vendor_data_fk1 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX DUE_DILG_VENDOR_DATA.due_dilg_vendor_data_fk1 >>>'
go

/* 
 * INDEX: due_dilg_vendor_data_idx_uuid 
 */

CREATE INDEX due_dilg_vendor_data_idx_uuid ON DUE_DILG_VENDOR_DATA(DUE_DILG_VENDOR_DATA_UUID)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('DUE_DILG_VENDOR_DATA') AND name='due_dilg_vendor_data_idx_uuid')
    PRINT '<<< CREATED INDEX DUE_DILG_VENDOR_DATA.due_dilg_vendor_data_idx_uuid >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX DUE_DILG_VENDOR_DATA.due_dilg_vendor_data_idx_uuid >>>'
go

/* 
 * INDEX: loan_idx1 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('LOAN') AND name='loan_idx1')
BEGIN
    DROP INDEX LOAN.loan_idx1
    PRINT '<<< DROPPED INDEX LOAN.loan_idx1 >>>'
END
go

/* 
 * INDEX: loan_idx2 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('LOAN') AND name='loan_idx2')
BEGIN
    DROP INDEX LOAN.loan_idx2
    PRINT '<<< DROPPED INDEX LOAN.loan_idx2 >>>'
END
go

/* 
 * INDEX: loan_idx_uuid 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('LOAN') AND name='loan_idx_uuid')
BEGIN
    DROP INDEX LOAN.loan_idx_uuid
    PRINT '<<< DROPPED INDEX LOAN.loan_idx_uuid >>>'
END
go

/* 
 * INDEX: loan_idx3 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('LOAN') AND name='loan_idx3')
BEGIN
    DROP INDEX LOAN.loan_idx3
    PRINT '<<< DROPPED INDEX LOAN.loan_idx3 >>>'
END
go

/* 
 * INDEX: loan_idx1 
 */

CREATE INDEX loan_idx1 ON LOAN(LOAN_NUMBER)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('LOAN') AND name='loan_idx1')
    PRINT '<<< CREATED INDEX LOAN.loan_idx1 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX LOAN.loan_idx1 >>>'
go

/* 
 * INDEX: loan_idx2 
 */

CREATE INDEX loan_idx2 ON LOAN(CREATED_DATE)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('LOAN') AND name='loan_idx2')
    PRINT '<<< CREATED INDEX LOAN.loan_idx2 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX LOAN.loan_idx2 >>>'
go

/* 
 * INDEX: loan_idx_uuid 
 */

CREATE INDEX loan_idx_uuid ON LOAN(LOAN_UUID)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('LOAN') AND name='loan_idx_uuid')
    PRINT '<<< CREATED INDEX LOAN.loan_idx_uuid >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX LOAN.loan_idx_uuid >>>'
go

/* 
 * INDEX: loan_idx3 
 */

CREATE INDEX loan_idx3 ON LOAN(COMPANY_ID, LOAN_NUMBER)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('LOAN') AND name='loan_idx3')
    PRINT '<<< CREATED INDEX LOAN.loan_idx3 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX LOAN.loan_idx3 >>>'
go

/* 
 * INDEX: loan_end_user_idx1 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('LOAN_END_USER') AND name='loan_end_user_idx1')
BEGIN
    DROP INDEX LOAN_END_USER.loan_end_user_idx1
    PRINT '<<< DROPPED INDEX LOAN_END_USER.loan_end_user_idx1 >>>'
END
go

/* 
 * INDEX: loan_end_user_idx1 
 */

CREATE INDEX loan_end_user_idx1 ON LOAN_END_USER(LOAN_ID, JOB_ROLE_ID)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('LOAN_END_USER') AND name='loan_end_user_idx1')
    PRINT '<<< CREATED INDEX LOAN_END_USER.loan_end_user_idx1 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX LOAN_END_USER.loan_end_user_idx1 >>>'
go

/* 
 * INDEX: pricing_scenario_idx1 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('PRICING_SCENARIO') AND name='pricing_scenario_idx1')
BEGIN
    DROP INDEX PRICING_SCENARIO.pricing_scenario_idx1
    PRINT '<<< DROPPED INDEX PRICING_SCENARIO.pricing_scenario_idx1 >>>'
END
go

/* 
 * INDEX: pricing_scenario_fk1 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('PRICING_SCENARIO') AND name='pricing_scenario_fk1')
BEGIN
    DROP INDEX PRICING_SCENARIO.pricing_scenario_fk1
    PRINT '<<< DROPPED INDEX PRICING_SCENARIO.pricing_scenario_fk1 >>>'
END
go

/* 
 * INDEX: pricing_scenario_idx_uuid 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('PRICING_SCENARIO') AND name='pricing_scenario_idx_uuid')
BEGIN
    DROP INDEX PRICING_SCENARIO.pricing_scenario_idx_uuid
    PRINT '<<< DROPPED INDEX PRICING_SCENARIO.pricing_scenario_idx_uuid >>>'
END
go

/* 
 * INDEX: pricing_scenario_idx1 
 */

CREATE INDEX pricing_scenario_idx1 ON PRICING_SCENARIO(INVESTOR_LOAN_NUMBER)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('PRICING_SCENARIO') AND name='pricing_scenario_idx1')
    PRINT '<<< CREATED INDEX PRICING_SCENARIO.pricing_scenario_idx1 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX PRICING_SCENARIO.pricing_scenario_idx1 >>>'
go

/* 
 * INDEX: pricing_scenario_fk1 
 */

CREATE INDEX pricing_scenario_fk1 ON PRICING_SCENARIO(LOAN_ID)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('PRICING_SCENARIO') AND name='pricing_scenario_fk1')
    PRINT '<<< CREATED INDEX PRICING_SCENARIO.pricing_scenario_fk1 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX PRICING_SCENARIO.pricing_scenario_fk1 >>>'
go

/* 
 * INDEX: pricing_scenario_idx_uuid 
 */

CREATE INDEX pricing_scenario_idx_uuid ON PRICING_SCENARIO(PRICING_SCENARIO_UUID)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('PRICING_SCENARIO') AND name='pricing_scenario_idx_uuid')
    PRINT '<<< CREATED INDEX PRICING_SCENARIO.pricing_scenario_idx_uuid >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX PRICING_SCENARIO.pricing_scenario_idx_uuid >>>'
go

/* 
 * INDEX: pricing_scenario_rating_idx1 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('PRICING_SCENARIO_RATING') AND name='pricing_scenario_rating_idx1')
BEGIN
    DROP INDEX PRICING_SCENARIO_RATING.pricing_scenario_rating_idx1
    PRINT '<<< DROPPED INDEX PRICING_SCENARIO_RATING.pricing_scenario_rating_idx1 >>>'
END
go

/* 
 * INDEX: pricing_scenario_rating_idx1 
 */

CREATE INDEX pricing_scenario_rating_idx1 ON PRICING_SCENARIO_RATING(PRICING_SCENARIO_ID)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('PRICING_SCENARIO_RATING') AND name='pricing_scenario_rating_idx1')
    PRINT '<<< CREATED INDEX PRICING_SCENARIO_RATING.pricing_scenario_rating_idx1 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX PRICING_SCENARIO_RATING.pricing_scenario_rating_idx1 >>>'
go

/* 
 * TABLE: ACTIVITY 
 */

ALTER TABLE ACTIVITY ADD CONSTRAINT activity_activity_type 
    FOREIGN KEY (ACTIVITY_TYPE_KEY)
    REFERENCES ACTIVITY_TYPE(ACTIVITY_TYPE_KEY)
go

ALTER TABLE ACTIVITY ADD CONSTRAINT activity_loan 
    FOREIGN KEY (LOAN_KEY)
    REFERENCES LOAN(LOAN_KEY)
go

ALTER TABLE ACTIVITY ADD CONSTRAINT activity_source_activity_status 
    FOREIGN KEY (SOURCE_ACTIVITY_STATUS_KEY)
    REFERENCES SOURCE_ACTIVITY_STATUS(SOURCE_ACTIVITY_STATUS_KEY)
go

ALTER TABLE ACTIVITY ADD CONSTRAINT activity_source_activity_type 
    FOREIGN KEY (SOURCE_ACTIVITY_TYPE_KEY)
    REFERENCES SOURCE_ACTIVITY_TYPE(SOURCE_ACTIVITY_TYPE_KEY)
go


/* 
 * TABLE: ACTIVITY_COMMENT 
 */

ALTER TABLE ACTIVITY_COMMENT ADD CONSTRAINT activity_comment_activity 
    FOREIGN KEY (ACTIVITY_KEY)
    REFERENCES ACTIVITY(ACTIVITY_KEY)
go

ALTER TABLE ACTIVITY_COMMENT ADD CONSTRAINT activity_comment_condition 
    FOREIGN KEY (ACTIVITY_KEY)
    REFERENCES CONDITION(ACTIVITY_KEY)
go


/* 
 * TABLE: COMPANY 
 */

ALTER TABLE COMPANY ADD CONSTRAINT company_company 
    FOREIGN KEY (OWNING_COMPANY_KEY)
    REFERENCES COMPANY(COMPANY_KEY)
go


/* 
 * TABLE: CONDITION 
 */

ALTER TABLE CONDITION ADD CONSTRAINT condition_investor_condition_status 
    FOREIGN KEY (INVESTOR_CONDITION_STATUS_KEY)
    REFERENCES INVESTOR_CONDITION_STATUS(INVESTOR_CONDITION_STATUS_KEY)
go


/* 
 * TABLE: DUE_DILG_VENDOR_DATA 
 */

ALTER TABLE DUE_DILG_VENDOR_DATA ADD CONSTRAINT due_dilg_vendor_data_due_dilg_vendor_status 
    FOREIGN KEY (DUE_DILG_VENDOR_STATUS_KEY)
    REFERENCES DUE_DILG_VENDOR_STATUS(DUE_DILG_VENDOR_STATUS_KEY)
go

ALTER TABLE DUE_DILG_VENDOR_DATA ADD CONSTRAINT due_dilg_vendor_data_pricing_scenario 
    FOREIGN KEY (PRICING_SCENARIO_KEY)
    REFERENCES PRICING_SCENARIO(PRICING_SCENARIO_KEY)
go


/* 
 * TABLE: END_USER 
 */

ALTER TABLE END_USER ADD CONSTRAINT end_user_company 
    FOREIGN KEY (COMPANY_KEY)
    REFERENCES COMPANY(COMPANY_KEY)
go


/* 
 * TABLE: HISTORY_EVENT 
 */

ALTER TABLE HISTORY_EVENT ADD CONSTRAINT history_event_loan 
    FOREIGN KEY (LOAN_KEY)
    REFERENCES LOAN(LOAN_KEY)
go


/* 
 * TABLE: LOAN 
 */

ALTER TABLE LOAN ADD CONSTRAINT loan_company_key 
    FOREIGN KEY (COMPANY_KEY)
    REFERENCES COMPANY(COMPANY_KEY)
go

ALTER TABLE LOAN ADD CONSTRAINT loan_selling_company_key 
    FOREIGN KEY (SELLING_COMPANY_KEY)
    REFERENCES COMPANY(COMPANY_KEY)
go


/* 
 * TABLE: LOAN_COMMENT 
 */

ALTER TABLE LOAN_COMMENT ADD CONSTRAINT loan_comment_loan 
    FOREIGN KEY (LOAN_KEY)
    REFERENCES LOAN(LOAN_KEY)
go


/* 
 * TABLE: LOAN_END_USER 
 */

ALTER TABLE LOAN_END_USER ADD CONSTRAINT loan_end_user_job_role 
    FOREIGN KEY (JOB_ROLE_KEY)
    REFERENCES JOB_ROLE(JOB_ROLE_KEY)
go

ALTER TABLE LOAN_END_USER ADD CONSTRAINT loan_end_user_loan 
    FOREIGN KEY (LOAN_KEY)
    REFERENCES LOAN(LOAN_KEY)
go


/* 
 * TABLE: PRICING_SCENARIO 
 */

ALTER TABLE PRICING_SCENARIO ADD CONSTRAINT pricing_scenario_inv_due_diligence_status 
    FOREIGN KEY (INV_DUE_DILIGENCE_STATUS_KEY)
    REFERENCES INV_DUE_DILIGENCE_STATUS(INV_DUE_DILIGENCE_STATUS_KEY)
go

ALTER TABLE PRICING_SCENARIO ADD CONSTRAINT pricing_scenario_investor_status 
    FOREIGN KEY (INVESTOR_STATUS_KEY)
    REFERENCES INVESTOR_STATUS(INVESTOR_STATUS_KEY)
go

ALTER TABLE PRICING_SCENARIO ADD CONSTRAINT pricing_scenario_loan 
    FOREIGN KEY (LOAN_KEY)
    REFERENCES LOAN(LOAN_KEY)
go

ALTER TABLE PRICING_SCENARIO ADD CONSTRAINT pricing_scenario_parent_scenario_key 
    FOREIGN KEY (PARENT_SCENARIO_KEY)
    REFERENCES PRICING_SCENARIO(PRICING_SCENARIO_KEY)
go

ALTER TABLE PRICING_SCENARIO ADD CONSTRAINT pricing_scenario_piggy_back_scenario_key 
    FOREIGN KEY (PIGGY_BACK_SCENARIO_KEY)
    REFERENCES PRICING_SCENARIO(PRICING_SCENARIO_KEY)
go


/* 
 * TABLE: PRICING_SCENARIO_RATING 
 */

ALTER TABLE PRICING_SCENARIO_RATING ADD CONSTRAINT pricing_scenario_rating_pricing_scenario 
    FOREIGN KEY (PRICING_SCENARIO_KEY)
    REFERENCES PRICING_SCENARIO(PRICING_SCENARIO_KEY)
go


/* 
 * TABLE: SOURCE_ACTIVITY_TYPE 
 */

ALTER TABLE SOURCE_ACTIVITY_TYPE ADD CONSTRAINT source_activity_type_activity_type 
    FOREIGN KEY (ACTIVITY_TYPE_KEY)
    REFERENCES ACTIVITY_TYPE(ACTIVITY_TYPE_KEY)
go


/* 
 * PROCEDURE: sp_executeSQL 
 */

IF OBJECT_ID('sp_executeSQL') IS NOT NULL
BEGIN
    DROP PROCEDURE sp_executeSQL
    PRINT '<<< DROPPED PROCEDURE sp_executeSQL >>>'
END
go

(server internal)


go
IF OBJECT_ID('sp_executeSQL') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE sp_executeSQL >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE sp_executeSQL >>>'
go


/* 
 * PROCEDURE: sp_scd_merge 
 */

IF OBJECT_ID('sp_scd_merge') IS NOT NULL
BEGIN
    DROP PROCEDURE sp_scd_merge
    PRINT '<<< DROPPED PROCEDURE sp_scd_merge >>>'
END
go


CREATE PROCEDURE sp_scd_merge
(
	 @SourceSchema			sysname
	,@SourceName			sysname
	,@TableKEY				sysname	
	,@BusinessKey			sysname
)
AS
	-- ==================================================================
	-- Slowly Changing Dimension script 
	-- Author: Nigatu, Biz
	-- Version: 1.0.0.0		
	-- Sample use: EXEC sp_scd_merge 
	--					'dbo','COMPANY', 'COMPANY_KEY', 'COMPANY_NAME';
	-- ==================================================================
/*
	History:
	Initials		Date		Description
	===========		==========	=======================================
	Nigatu, Biz		9/21/2015	This is a dynamic stored procedure that 
								can be used to manage scd type2 changes 
								for all tables in the data mart.
*/
	-- ==================================================================
	-- USER VARIABLES
	-- ==================================================================
	DECLARE @MinDateTime datetime;
	DECLARE @MaxDateTime datetime;
	DECLARE @StringYes char(3);
	DECLARE @StringNo char(2);
	DECLARE @scdTSQL nvarchar(max);

	SELECT
		@MinDateTime = cast('1900-01-01' as datetime),
		@MaxDateTime = cast('9999-12-31' as datetime),
		@StringYes = 'Y',
		@StringNo = 'N';

	-- ==================================================
	-- Source for the Merge
	-- ==================================================
	IF OBJECT_ID('tempdb..#SOURCE') IS NOT NULL
		DROP TABLE #SOURCE;
	SET @scdTSQL =
	';WITH SRC AS (
		SELECT			
			'+ @TableKEY +',
			[BATCH_ID],			
			[' + @BusinessKey + '],
			[VALID_FROM],
			[VALID_TILL],
			ROW_NUMBER() OVER (PARTITION BY [' + @BusinessKey + '] ORDER BY VALID_FROM) AS SORT_ORDER
		FROM '+ @SourceSchema +'.'+ @SourceName +' 	
	)
	SELECT			
		CURNT.'+ @TableKEY +',
		CURNT.[BATCH_ID],			
		CURNT.[' + @BusinessKey + '],
		CURNT.[VALID_FROM],
		COALESCE(NXT.[VALID_FROM],CURNT.[VALID_TILL]) AS [VALID_TILL],
		CASE WHEN NXT.[VALID_FROM] IS NULL
			 THEN ''Y'' 
			 ELSE ''N'' 
		END AS [IS_CURRENT],
		CASE WHEN CAST(NXT.[VALID_FROM] AS DATE) <> CAST(CURNT.[VALID_FROM] AS DATE)  OR 
				  NXT.[VALID_FROM] IS NULL
			 THEN ''Y'' 
			 ELSE ''N'' 
		END AS	[IS_CURRENT_DAY] INTO #SOURCE	
	FROM SRC AS CURNT
	LEFT JOIN SRC AS NXT ON CURNT.[' + @BusinessKey + '] = NXT.[' + @BusinessKey + '] AND 
							CURNT.SORT_ORDER + 1 = NXT.SORT_ORDER 
	ORDER BY 2;
	
	-- ==================================================
	-- SCD2
	-- ==================================================
	MERGE '+ @SourceSchema +'.'+ @SourceName +' as [target]
		USING
		(
			SELECT			
				'+ @TableKEY +',
				[BATCH_ID],			
				[' + @BusinessKey + '],
				[VALID_FROM],
				[VALID_TILL],
				[IS_CURRENT],
				[IS_CURRENT_DAY]  	
			FROM #SOURCE
			/*WHERE [IS_CURRENT] = ''Y''*/

		) as [source]
		ON
		(
			[source].['+ @TableKEY +'] = [target].['+ @TableKEY +'] AND
			[source].[' + @BusinessKey + '] = [target].[' + @BusinessKey + '] AND
			[source].[VALID_FROM] = [target].[VALID_FROM] 
		)	
		WHEN MATCHED 
		THEN 
		UPDATE	
		SET	[target].[IS_CURRENT] = [source].[IS_CURRENT],
			[target].[IS_CURRENT_DAY] = [source].[IS_CURRENT_DAY],	
			[target].[VALID_TILL] = [source].[VALID_TILL];';
		EXECUTE sp_executeSQL @scdTSQL;
		--OUTPUT
		--	$Action as [MERGE_ACTION],		
		--	[source].[IS_CURRENT],
		--	[source].[IS_CURRENT_DAY],		
		--	[source].[VALID_FROM],
		--	[source].[VALID_TILL];


go
IF OBJECT_ID('sp_scd_merge') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE sp_scd_merge >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE sp_scd_merge >>>'
go


/* 
 * PROCEDURE: sp_scd_relationship 
 */

IF OBJECT_ID('sp_scd_relationship') IS NOT NULL
BEGIN
    DROP PROCEDURE sp_scd_relationship
    PRINT '<<< DROPPED PROCEDURE sp_scd_relationship >>>'
END
go



CREATE PROCEDURE sp_scd_relationship 
(
	@BatchID int = 0
)

AS
SET NOCOUNT ON;
	-- ==================================================================
	-- Slowly Changing Dimension Relationship script 
	-- Author: Nigatu, Biz
	-- Version: 1.0.0.0		
	-- Sample use: EXEC sp_scd_relationship 4;
	-- ==================================================================
/*
	History:
	Initials		Date		Description
	===========		==========	=======================================
	Nigatu, Biz		9/21/2015	This is stored procedure helps the ELT 
								process to create relationship among 
								related warehouse after the are loaded.
*/
	

-- ACTIVITY 
-- ACTIVITY_STATUS_KEY
UPDATE dst SET dst.ACTIVITY_STATUS_KEY = src.ACTIVITY_STATUS_KEY
FROM dbo.ACTIVITY dst
CROSS APPLY(
	SELECT ACTIVITY_STATUS_KEY
	FROM dbo.ACTIVITY_STATUS src 
	WHERE src.VALID_FROM <= dst.VALID_FROM AND
		  src.VALID_TILL > dst.VALID_FROM AND
		  src.[NAMESPACE] = dst.[NAMESPACE] AND
		  src.IS_CURRENT = 'Y' AND
		  src.ACTIVITY_STATUS_ID = dst.ACTIVITY_STATUS_ID
 ) AS src
 WHERE dst.[NAMESPACE] = 'CMT'
 --AND dst.ACTIVITY_STATUS_KEY IS NULL
 --AND dst.BATCH_ID = @BatchID ;

-- ACTIVITY 
-- ACTIVITY_TYPE_KEY
UPDATE dst SET dst.ACTIVITY_TYPE_KEY = src.ACTIVITY_TYPE_KEY
FROM dbo.ACTIVITY dst
CROSS APPLY(
	SELECT ACTIVITY_TYPE_KEY
	FROM dbo.ACTIVITY_TYPE src 
	WHERE src.VALID_FROM <= dst.VALID_FROM AND
		  src.VALID_TILL > dst.VALID_FROM AND
		  src.[NAMESPACE] = dst.[NAMESPACE] AND
		  src.IS_CURRENT = 'Y' AND
		  src.ACTIVITY_TYPE_ID= dst.ACTIVITY_TYPE_ID
 ) AS src
 WHERE dst.[NAMESPACE] = 'CMT'
 --AND dst.ACTIVITY_TYPE_KEY IS NULL
 --AND dst.BATCH_ID = @BatchID ;

-- ACTIVITY 
-- LOAN_KEY
UPDATE dst SET dst.LOAN_KEY = src.LOAN_KEY
FROM dbo.ACTIVITY dst 
CROSS APPLY(
	SELECT LOAN_KEY
	FROM dbo.LOAN src 
	WHERE src.VALID_FROM <= dst.VALID_FROM AND
		  src.VALID_TILL > dst.VALID_FROM AND
		  src.[NAMESPACE] = dst.[NAMESPACE] AND
		  src.IS_CURRENT = 'Y' AND
		  src.LOAN_ID= dst.LOAN_ID
 ) AS src
 WHERE dst.[NAMESPACE] = 'CMT'
 --AND dst.LOAN_KEY IS NULL
 --AND dst.BATCH_ID = @BatchID ;

-- ACTIVITY 
-- SOURCE_ACTIVITY_STATUS_KEY
UPDATE dst SET dst.SOURCE_ACTIVITY_STATUS_KEY = src.SOURCE_ACTIVITY_STATUS_KEY
FROM dbo.ACTIVITY dst 
CROSS APPLY(
	SELECT SOURCE_ACTIVITY_STATUS_KEY
	FROM dbo.SOURCE_ACTIVITY_STATUS src 
	WHERE src.VALID_FROM <= dst.VALID_FROM AND
		  src.VALID_TILL > dst.VALID_FROM AND
		  src.[NAMESPACE] = dst.[NAMESPACE] AND
		  src.IS_CURRENT = 'Y' AND
		  src.SOURCE_ACTIVITY_STATUS_ID= dst.SOURCE_ACTIVITY_STATUS_ID
 ) AS src
 WHERE dst.[NAMESPACE] = 'CMT'
 --AND dst.SOURCE_ACTIVITY_STATUS_KEY IS NULL
 --AND dst.BATCH_ID = @BatchID ;

-- ACTIVITY 
-- SOURCE_ACTIVITY_TYPE_KEY
UPDATE dst SET dst.SOURCE_ACTIVITY_TYPE_KEY = src.SOURCE_ACTIVITY_TYPE_KEY
FROM dbo.ACTIVITY dst  
CROSS APPLY(
	SELECT SOURCE_ACTIVITY_TYPE_KEY
	FROM dbo.SOURCE_ACTIVITY_TYPE src 
	WHERE src.VALID_FROM <= dst.VALID_FROM AND
		  src.VALID_TILL > dst.VALID_FROM AND
		  src.[NAMESPACE] = dst.[NAMESPACE] AND
		  src.IS_CURRENT = 'Y' AND
		  src.SOURCE_ACTIVITY_TYPE_ID= dst.SOURCE_ACTIVITY_TYPE_ID
 ) AS src
 WHERE dst.[NAMESPACE] = 'CMT'
 --AND dst.SOURCE_ACTIVITY_TYPE_KEY IS NULL
 --AND dst.BATCH_ID = @BatchID ;

-- ACTIVITY_COMMENT 
-- ACTIVITY_KEY
UPDATE dst SET dst.ACTIVITY_KEY = src.ACTIVITY_KEY
FROM dbo.ACTIVITY_COMMENT dst 
CROSS APPLY(
	SELECT ACTIVITY_KEY
	FROM dbo.ACTIVITY src 
	WHERE src.VALID_FROM <= dst.VALID_FROM AND
		  src.VALID_TILL > dst.VALID_FROM AND
		  src.[NAMESPACE] = dst.[NAMESPACE] AND
		  src.IS_CURRENT = 'Y' AND
		  src.ACTIVITY_ID = dst.ACTIVITY_ID
 ) AS src
 WHERE dst.[NAMESPACE] = 'CMT'
 --AND dst.ACTIVITY_KEY IS NULL
 --AND dst.BATCH_ID = @BatchID ;


-- ACTIVITY_COMMENT 
-- CONTACT_KEY
UPDATE dst SET dst.CONTACT_KEY = src.CONTACT_KEY
FROM dbo.ACTIVITY_COMMENT dst 
CROSS APPLY(
	SELECT CONTACT_KEY
	FROM dbo.END_USER src 
	WHERE src.VALID_FROM <= dst.VALID_FROM AND
		  src.VALID_TILL > dst.VALID_FROM AND
		  src.[NAMESPACE] = dst.[NAMESPACE] AND
		  src.IS_CURRENT = 'Y' AND
		  src.CONTACT_ID = dst.CONTACT_ID
 ) AS src
 WHERE dst.[NAMESPACE] = 'CMT'
 --AND dst.CONTACT_KEY IS NULL
 --AND dst.BATCH_ID = @BatchID ;

-- COMPANY 
-- OWNING_COMPANY_KEY
UPDATE dst SET dst.OWNING_COMPANY_KEY = src.COMPANY_KEY
FROM dbo.COMPANY dst 
CROSS APPLY(
	SELECT COMPANY_KEY
	FROM dbo.COMPANY src 
	WHERE src.VALID_FROM <= dst.VALID_FROM AND
		  src.VALID_TILL > dst.VALID_FROM AND
		  src.[NAMESPACE] = dst.[NAMESPACE] AND
		  src.IS_CURRENT = 'Y' AND
		  src.OWNING_COMPANY_ID = dst.COMPANY_ID
 ) AS src
 WHERE dst.[NAMESPACE] = 'CMT'
 --AND dst.COMPANY_KEY IS NULL
--AND dst.BATCH_ID = @BatchID  ;


-- CONDITION 
-- INVESTOR_CONDITION_STATUS_KEY
UPDATE dst SET dst.INVESTOR_CONDITION_STATUS_KEY = src.INVESTOR_CONDITION_STATUS_KEY
FROM dbo.CONDITION dst 
CROSS APPLY(
	SELECT INVESTOR_CONDITION_STATUS_KEY
	FROM dbo.INVESTOR_CONDITION_STATUS src 
	WHERE src.VALID_FROM <= dst.VALID_FROM AND
		  src.VALID_TILL > dst.VALID_FROM AND
		  src.[NAMESPACE] = dst.[NAMESPACE] AND
		  src.IS_CURRENT = 'Y' AND
		  src.INVESTOR_CONDITION_STATUS_ID = dst.INVESTOR_CONDITION_STATUS_ID
 ) AS src
 WHERE dst.[NAMESPACE] = 'CMT'
 --AND dst.INVESTOR_CONDITION_STATUS_KEY IS NULL
 --AND dst.BATCH_ID = @BatchID ;

-- PRICING_SCENARIO 
-- PRICING_SCENARIO_KEY
UPDATE dst SET dst.INV_DUE_DILG_SAMPLE_TYPE_KEY = src.INV_DUE_DILG_SAMPLE_TYPE_KEY
FROM dbo.PRICING_SCENARIO dst 
CROSS APPLY(
	SELECT INV_DUE_DILG_SAMPLE_TYPE_KEY
	FROM dbo.INV_DUE_DILG_SAMPLE_TYPE src 
	WHERE src.VALID_FROM <= dst.VALID_FROM AND
		  src.VALID_TILL > dst.VALID_FROM AND
		  src.[NAMESPACE] = dst.[NAMESPACE] AND
		  src.IS_CURRENT = 'Y' AND
		  src.INV_DUE_DILG_SAMPLE_TYPE_ID = dst.INV_DUE_DILG_SAMPLE_TYPE_ID
 ) AS src
 WHERE dst.[NAMESPACE] = 'CMT'
 --AND dst.INV_DUE_DILG_SAMPLE_TYPE_KEY IS NULL
 --AND dst.BATCH_ID = @BatchID ;

-- DUE_DILG_VENDOR_DATA 
-- PRICING_SCENARIO_KEY
UPDATE dst SET dst.PRICING_SCENARIO_KEY = src.PRICING_SCENARIO_KEY
FROM dbo.DUE_DILG_VENDOR_DATA dst 
CROSS APPLY(
	SELECT PRICING_SCENARIO_KEY
	FROM dbo.PRICING_SCENARIO src 
	WHERE src.VALID_FROM <= dst.VALID_FROM AND
		  src.VALID_TILL > dst.VALID_FROM AND
		  src.[NAMESPACE] = dst.[NAMESPACE] AND
		  src.IS_CURRENT = 'Y' AND
		  src.PRICING_SCENARIO_ID = dst.PRICING_SCENARIO_ID
 ) AS src
 WHERE dst.[NAMESPACE] = 'CMT'
 --AND dst.PRICING_SCENARIO_KEY IS NULL
 --AND dst.BATCH_ID = @BatchID ;

-- DUE_DILG_VENDOR_DATA 
-- DUE_DILG_VENDOR_STATUS_KEY
UPDATE dst SET dst.DUE_DILG_VENDOR_STATUS_KEY = src.DUE_DILG_VENDOR_STATUS_KEY
FROM dbo.DUE_DILG_VENDOR_DATA dst 
CROSS APPLY(
	SELECT DUE_DILG_VENDOR_STATUS_KEY
	FROM dbo.DUE_DILG_VENDOR_STATUS src 
	WHERE src.VALID_FROM <= dst.VALID_FROM AND
		  src.VALID_TILL > dst.VALID_FROM AND
		  src.[NAMESPACE] = dst.[NAMESPACE] AND
		  src.IS_CURRENT = 'Y' AND
		  src.DUE_DILG_VENDOR_STATUS_ID = dst.DUE_DILG_VENDOR_STATUS_ID
 ) AS src
 WHERE dst.[NAMESPACE] = 'CMT'
 --AND dst.DUE_DILG_VENDOR_STATUS_KEY IS NULL
 --AND dst.BATCH_ID = @BatchID ;


-- DUE_DILG_VENDOR_DATA 
-- COMPANY_KEY
UPDATE dst SET dst.COMPANY_KEY = src.COMPANY_KEY
FROM dbo.DUE_DILG_VENDOR_DATA dst 
CROSS APPLY(
	SELECT COMPANY_KEY
	FROM dbo.COMPANY src 
	WHERE src.VALID_FROM <= dst.VALID_FROM AND
		  src.VALID_TILL > dst.VALID_FROM AND
		  src.[NAMESPACE] = dst.[NAMESPACE] AND
		  src.IS_CURRENT = 'Y' AND
		  src.COMPANY_ID = dst.COMPANY_ID
 ) AS src
 WHERE dst.[NAMESPACE] = 'CMT'
 --AND dst.DUE_DILG_VENDOR_STATUS_KEY IS NULL
 --AND dst.BATCH_ID = @BatchID ;

-- END_USER 
-- COMPANY_KEY
UPDATE dst SET dst.COMPANY_KEY = src.COMPANY_KEY
FROM dbo.END_USER dst 
CROSS APPLY(
	SELECT COMPANY_KEY
	FROM dbo.COMPANY src 
	WHERE src.VALID_FROM <= dst.VALID_FROM AND
		  src.VALID_TILL > dst.VALID_FROM AND
		  src.[NAMESPACE] = dst.[NAMESPACE] AND
		  src.IS_CURRENT = 'Y' AND
		  src.COMPANY_ID = dst.COMPANY_ID
 ) AS src
 WHERE dst.[NAMESPACE] = 'CMT'
 --AND dst.COMPANY_KEY IS NULL
 --AND dst.BATCH_ID = @BatchID ;


-- HISTORY_EVENT 
-- LOAN_KEY
UPDATE dst SET dst.LOAN_KEY = src.LOAN_KEY
FROM dbo.HISTORY_EVENT dst
CROSS APPLY(
	SELECT LOAN_KEY
	FROM dbo.LOAN src 
	WHERE src.VALID_FROM <= dst.VALID_FROM AND
		  src.VALID_TILL > dst.VALID_FROM AND
		  src.[NAMESPACE] = dst.[NAMESPACE] AND
		  src.IS_CURRENT = 'Y' AND
		  src.LOAN_ID = dst.LOAN_ID
 ) AS src
 WHERE dst.[NAMESPACE] = 'CMT'
 --AND dst.LOAN_KEY IS NULL
 --AND dst.BATCH_ID = @BatchID ;

-- LOAN 
-- COMPANY_KEY
UPDATE dst SET dst.COMPANY_KEY = src.COMPANY_KEY
FROM dbo.LOAN dst 
CROSS APPLY(
	SELECT COMPANY_KEY
	FROM dbo.COMPANY src 
	WHERE src.VALID_FROM <= dst.VALID_FROM AND
		  src.VALID_TILL > dst.VALID_FROM AND
		  src.[NAMESPACE] = dst.[NAMESPACE] AND
		  src.IS_CURRENT = 'Y' AND
		  src.COMPANY_ID = dst.COMPANY_ID
 ) AS src
 WHERE dst.[NAMESPACE] = 'CMT'
 --AND dst.COMPANY_KEY IS NULL
 --AND dst.BATCH_ID = @BatchID ;

-- LOAN 
-- SELLING_COMPANY_KEY
UPDATE dst SET dst.SELLING_COMPANY_KEY = src.COMPANY_KEY
FROM dbo.LOAN dst 
CROSS APPLY(
	SELECT COMPANY_KEY
	FROM dbo.COMPANY src 
	WHERE src.VALID_FROM <= dst.VALID_FROM AND
		  src.VALID_TILL > dst.VALID_FROM AND
		  src.[NAMESPACE] = dst.[NAMESPACE] AND
		  src.IS_CURRENT = 'Y' AND
		  src.COMPANY_ID = dst.SELLING_COMPANY_ID
 ) AS src
 WHERE dst.[NAMESPACE] = 'CMT'
 --AND dst.SELLING_COMPANY_KEY IS NULL
 --AND dst.BATCH_ID = @BatchID ;

-- LOAN_COMMENT 
-- LOAN_KEY
UPDATE dst SET dst.LOAN_KEY = src.LOAN_KEY
FROM dbo.LOAN_COMMENT dst 
CROSS APPLY(
	SELECT LOAN_KEY
	FROM dbo.LOAN src 
	WHERE src.VALID_FROM <= dst.VALID_FROM AND
		  src.VALID_TILL > dst.VALID_FROM AND
		  src.[NAMESPACE] = dst.[NAMESPACE] AND
		  src.IS_CURRENT = 'Y' AND
		  src.LOAN_ID = dst.LOAN_ID
 ) AS src
 WHERE dst.[NAMESPACE] = 'CMT'
 --AND dst.LOAN_KEY IS NULL
 --AND dst.BATCH_ID = @BatchID ;


-- LOAN_END_USER 
-- LOAN_KEY
UPDATE dst SET dst.LOAN_KEY = src.LOAN_KEY
FROM dbo.LOAN_END_USER dst 
CROSS APPLY(
	SELECT LOAN_KEY
	FROM dbo.LOAN src 
	WHERE src.VALID_FROM <= dst.VALID_FROM AND
		  src.VALID_TILL > dst.VALID_FROM AND
		  src.[NAMESPACE] = dst.[NAMESPACE] AND
		  src.IS_CURRENT = 'Y' AND
		  src.LOAN_ID = dst.LOAN_ID
 ) AS src
 WHERE dst.[NAMESPACE] = 'CMT'
 --AND dst.LOAN_KEY IS NULL
 --AND dst.BATCH_ID = @BatchID ;

-- LOAN_END_USER 
-- JOB_ROLE_KEY
UPDATE dst SET dst.JOB_ROLE_KEY = src.JOB_ROLE_KEY
FROM dbo.LOAN_END_USER dst 
CROSS APPLY(
	SELECT JOB_ROLE_KEY
	FROM dbo.JOB_ROLE src 
	WHERE src.VALID_FROM <= dst.VALID_FROM AND
		  src.VALID_TILL > dst.VALID_FROM AND
		  src.[NAMESPACE] = dst.[NAMESPACE] AND
		  src.IS_CURRENT = 'Y' AND
		  src.JOB_ROLE_ID = dst.JOB_ROLE_ID
 ) AS src
 WHERE dst.[NAMESPACE] = 'CMT'
 --AND dst.JOB_ROLE_KEY IS NULL
 --AND dst.BATCH_ID = @BatchID ;


-- PRICING_SCENARIO 
-- LOAN_KEY
UPDATE dst SET dst.LOAN_KEY = src.LOAN_KEY
FROM dbo.PRICING_SCENARIO dst 
CROSS APPLY(
	SELECT LOAN_KEY
	FROM dbo.LOAN src 
	WHERE src.VALID_FROM <= dst.VALID_FROM AND
		  src.VALID_TILL > dst.VALID_FROM AND
		  src.[NAMESPACE] = dst.[NAMESPACE] AND
		  src.IS_CURRENT = 'Y' AND
		  src.LOAN_ID = dst.LOAN_ID
 ) AS src
 WHERE dst.[NAMESPACE] = 'CMT'
 --AND dst.LOAN_KEY IS NULL
 --AND dst.BATCH_ID = @BatchID ;

-- PRICING_SCENARIO 
-- PIGGY_BACK_SCENARIO_KEY
UPDATE dst SET dst.PIGGY_BACK_SCENARIO_KEY = src.PRICING_SCENARIO_KEY
FROM dbo.PRICING_SCENARIO dst 
CROSS APPLY(
	SELECT PRICING_SCENARIO_KEY
	FROM dbo.PRICING_SCENARIO src 
	WHERE src.VALID_FROM <= dst.VALID_FROM AND
		  src.VALID_TILL > dst.VALID_FROM AND
		  src.[NAMESPACE] = dst.[NAMESPACE] AND
		  src.IS_CURRENT = 'Y' AND
		  src.PRICING_SCENARIO_ID = dst.PIGGY_BACK_SCENARIO_ID
 ) AS src
 WHERE dst.[NAMESPACE] = 'CMT'
 --AND dst.PIGGY_BACK_SCENARIO_KEY IS NULL
 --AND dst.BATCH_ID = @BatchID ;

-- PRICING_SCENARIO 
-- PARENT_SCENARIO_KEY
UPDATE dst SET dst.PARENT_SCENARIO_KEY = src.PRICING_SCENARIO_KEY
FROM dbo.PRICING_SCENARIO dst 
CROSS APPLY(
	SELECT PRICING_SCENARIO_KEY
	FROM dbo.PRICING_SCENARIO src 
	WHERE src.VALID_FROM <= dst.VALID_FROM AND
		  src.VALID_TILL > dst.VALID_FROM AND
		  src.[NAMESPACE] = dst.[NAMESPACE] AND
		  src.IS_CURRENT = 'Y' AND
		  src.PRICING_SCENARIO_ID = dst.PARENT_SCENARIO_ID
 ) AS src
 WHERE dst.[NAMESPACE] = 'CMT'
 --AND dst.PARENT_SCENARIO_KEY IS NULL
 --AND dst.BATCH_ID = @BatchID ;


-- PRICING_SCENARIO 
-- INVESTOR_STATUS_KEY
UPDATE dst SET dst.INVESTOR_STATUS_KEY = src.INVESTOR_STATUS_KEY
FROM dbo.PRICING_SCENARIO dst 
CROSS APPLY(
	SELECT INVESTOR_STATUS_KEY
	FROM dbo.INVESTOR_STATUS src 
	WHERE src.VALID_FROM <= dst.VALID_FROM AND
		  src.VALID_TILL > dst.VALID_FROM AND
		  src.[NAMESPACE] = dst.[NAMESPACE] AND
		  src.IS_CURRENT = 'Y' AND
		  src.INVESTOR_STATUS_ID = dst.INVESTOR_STATUS_ID
 ) AS src
 WHERE dst.[NAMESPACE] = 'CMT'
 --AND dst.INVESTOR_STATUS_KEY IS NULL
 --AND dst.BATCH_ID = @BatchID ;

-- PRICING_SCENARIO 
-- INV_DUE_DILIGENCE_STATUS_KEY
UPDATE dst SET dst.INV_DUE_DILIGENCE_STATUS_KEY = src.INV_DUE_DILIGENCE_STATUS_KEY
FROM dbo.PRICING_SCENARIO dst 
CROSS APPLY(
	SELECT INV_DUE_DILIGENCE_STATUS_KEY
	FROM dbo.INV_DUE_DILIGENCE_STATUS src 
	WHERE src.VALID_FROM <= dst.VALID_FROM AND
		  src.VALID_TILL > dst.VALID_FROM AND
		  src.[NAMESPACE] = dst.[NAMESPACE] AND
		  src.IS_CURRENT = 'Y' AND
		  src.INV_DUE_DILIGENCE_STATUS_ID = dst.INV_DUE_DILIGENCE_STATUS_ID
 ) AS src
 WHERE dst.[NAMESPACE] = 'CMT'
 --AND dst.INV_DUE_DILIGENCE_STATUS_KEY IS NULL
 --AND dst.BATCH_ID = @BatchID ;


-- PRICING_SCENARIO_RATING 
-- PARENT_SCENARIO_KEY
UPDATE dst SET dst.PRICING_SCENARIO_KEY = src.PRICING_SCENARIO_KEY
FROM dbo.PRICING_SCENARIO_RATING dst 
CROSS APPLY(
	SELECT PRICING_SCENARIO_KEY
	FROM dbo.PRICING_SCENARIO src 
	WHERE src.VALID_FROM <= dst.VALID_FROM AND
		  src.VALID_TILL > dst.VALID_FROM AND
		  src.[NAMESPACE] = dst.[NAMESPACE] AND
		  src.IS_CURRENT = 'Y' AND
		  src.PRICING_SCENARIO_ID = dst.PRICING_SCENARIO_ID
 ) AS src
 WHERE dst.[NAMESPACE] = 'CMT'
 --AND dst.PRICING_SCENARIO_KEY IS NULL
 --AND dst.BATCH_ID = @BatchID ;


-- SOURCE_ACTIVITY_TYPE 
-- ACTIVITY_TYPE_KEY
UPDATE dst SET dst.ACTIVITY_TYPE_KEY = src.ACTIVITY_TYPE_KEY
FROM dbo.SOURCE_ACTIVITY_TYPE dst 
CROSS APPLY(
	SELECT ACTIVITY_TYPE_KEY
	FROM dbo.ACTIVITY_TYPE src 
	WHERE src.VALID_FROM <= dst.VALID_FROM AND
		  src.VALID_TILL > dst.VALID_FROM AND
		  src.[NAMESPACE] = dst.[NAMESPACE] AND
		  src.IS_CURRENT = 'Y' AND
		  src.ACTIVITY_TYPE_ID = dst.ACTIVITY_TYPE_ID
 ) AS src
 WHERE dst.[NAMESPACE] = 'CMT'
 --AND dst.ACTIVITY_TYPE_KEY IS NULL
 --AND dst.BATCH_ID = @BatchID ;


go
IF OBJECT_ID('sp_scd_relationship') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE sp_scd_relationship >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE sp_scd_relationship >>>'
go


