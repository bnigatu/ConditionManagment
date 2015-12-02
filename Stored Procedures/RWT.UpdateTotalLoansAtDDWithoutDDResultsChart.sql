SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROC [RWT].[UpdateTotalLoansAtDDWithoutDDResultsChart]
AS 
  /*strSetNoCountOnSQL */ 
  SET nocount ON; 
  /*strDropTempTablesSQL */ 
  IF Object_id('tempdb.sys.#tmp0') IS NOT NULL 
  DROP TABLE ##tmp0; 
   
  IF Object_id('tempdb.sys.#tmp') IS NOT NULL 
  DROP TABLE ##tmp; 
   
  IF Object_id('tempdb.sys.#tmp1') IS NOT NULL 
  DROP TABLE ##tmp1; 
   
  IF Object_id('tempdb.sys.#tmp2') IS NOT NULL 
  DROP TABLE ##tmp2; 
   
  IF Object_id('tempdb.sys.#ageBucketRange') IS NOT NULL 
  DROP TABLE ##agebucketrange; 
   
  /*strDeclareAndSetVariables */ 
  DECLARE @TimePeriod NVARCHAR(255) ; 
  SET @TimePeriod = 'daily' ; 
  DECLARE @typeBucket    VARCHAR(4) ; 
  DECLARE @date_beg      VARCHAR(15) ; 
  DECLARE @date_end      VARCHAR(15) ; 
  DECLARE @Correspondent VARCHAR(15) ; 
  DECLARE @DDFirm        VARCHAR(15); 
  SET @typeBucket = 'PR' ; 
  /*strCreateTempTables */ 
  CREATE TABLE #tmp0 
               ( 
                            rwt_loan_number VARCHAR(32), 
                            change_date     DATETIME, 
                            value_after     VARCHAR(40), 
                            seller          VARCHAR(40), 
                            dd_provider     VARCHAR(25), 
                            cc_flag         VARCHAR(1), 
                            prddpr_flag     VARCHAR(1), 
                            prppr_flag      VARCHAR(1) 
               ); 
   
  INSERT #tmp0 
  EXEC rwt.usp_loan_history_event_dd_filtered 
    @typeBucket 
  CREATE CLUSTERED INDEX rln 
  ON #tmp0 
                         ( 
                                                rwt_loan_number 
                         ) 
  CREATE INDEX va 
  ON #tmp0 
               ( 
                            value_after 
               ) 
  CREATE INDEX cd 
  ON #tmp0 
               ( 
                            change_date 
               ) 
  SET datefirst 7 
  DECLARE @cutoff          DATE 
  DECLARE @change_date_max DATETIME 
  SELECT @change_date_max = Max(change_date) 
  FROM   #tmp0 
  IF @timePeriod = 'daily' 
  SET @cutoff = @change_date_max - 14 
  CREATE TABLE #tmp1 
               ( 
                            lh1_timeperiod_interval INT, 
                            day_diff                INT 
               ); 
   
  CREATE TABLE #tmp2 
               ( 
                            lh1_timeperiod_interval INT, 
                            agebucket_1_count       INT, 
                            agebucket_2_count       INT, 
                            agebucket_3_count       INT, 
                            agebucket_4_count       INT, 
                            time_interval_avg FLOAT 
               ); 
   
  IF @typeBucket = 'PR' 
  CREATE TABLE #tmp3 
               ( 
                            date_end                DATETIME , 
                            lh1_timeperiod_interval INT, 
                            rwt_loan_number         VARCHAR(32) , 
                            change_date             DATETIME , 
                            day_diff                INT 
               ); 
   
  CREATE TABLE #agebucketrange 
               ( 
                            typebucket      VARCHAR(5), 
                            agebucket_1_min INT , 
                            agebucket_1_max INT , 
                            agebucket_2_min INT , 
                            agebucket_2_max INT, 
                            agebucket_3_min INT, 
                            agebucket_3_max INT, 
                            agebucket_4_min INT , 
                            agebucket_4_max INT 
               ); 
   
  INSERT INTO #agebucketrange VALUES 
              ( 
                          'PR', 
                          0,2, 
                          3,3, 
                          4,4, 
                          5,2000 
              ) 
  CREATE TABLE #tmp 
               ( 
                            date_beg          DATE, 
                            date_end          DATE , 
                            time_interval     INT , 
                            typebucket        VARCHAR(5), 
                            agebucket_1_count INT , 
                            agebucket_2_count INT, 
                            agebucket_3_count INT , 
                            agebucket_4_count INT, 
                            time_interval_avg FLOAT 
               ); 
   
  CREATE INDEX abr 
  ON #tmp 
               ( 
                            time_interval 
               ) 
  EXEC rwt.usp_23_create_tmp_table_used_by_chart 
    @typeBucket, 
    @cutoff, 
    @timePeriod, 
    @change_date_max 
    /*strUpdateAgeBucketsSQL */ 
  IF @typeBucket = 'PR' 
  BEGIN 
    INSERT #tmp3 
    SELECT a.date_end, 
           a.time_interval, 
           b.rwt_loan_number, 
           b.change_date                                          AS change_date, 
           rwt.Fn_datediff_no_weekends(b.change_date, a.date_end) AS day_diff 
    FROM   #tmp a 
    JOIN   #tmp0 b 
    ON     b.change_date <= Dateadd(s,86399,Cast(a.date_end AS DATETIME)) 
    AND    b.value_after = 'Purchase Review' ; 
     
    WITH morethanone 
         ( 
              date_end, 
              rwt_loan_number 
         ) 
         AS 
         ( 
                SELECT date_end, 
                       a.rwt_loan_number 
                FROM   #tmp3 a 
                WHERE  ( 
                                SELECT   Count(rwt_loan_number) 
                                FROM     #tmp0 
                                WHERE    change_date >= a.change_date 
                                AND      change_date <= Dateadd(s,86399,Cast(a.date_end AS DATETIME))
                                AND      rwt_loan_number = a.rwt_loan_number 
                                GROUP BY rwt_loan_number) > 1 
         ) 
  DELETE a 
  FROM   #tmp3 a 
  JOIN   morethanone b 
  ON     a.rwt_loan_number = b.rwt_loan_number 
  AND    a.date_end = b.date_end 
  EXEC usp_23_agebucketing 
    @typeBucket 
  EXEC usp_23_sat_sun_to_monday 
    @timePeriod, 
    @typeBucket 
  TRUNCATE TABLE #tmp1 
  TRUNCATE TABLE #tmp2 
END 
/*strSelectSQL */ 
SELECT 
         CASE Datepart(weekday,date_end) 
                  WHEN 1 THEN 'SUN' 
                  WHEN 2 THEN 'MON' 
                  WHEN 3 THEN 'TUE' 
                  WHEN 4 THEN 'WED' 
                  WHEN 5 THEN 'THU' 
                  WHEN 6 THEN 'FRI' 
                  WHEN 7 THEN 'SAT' 
         END + ' ' + Cast(Month(date_end) AS VARCHAR(2)) + '/' + Cast(Day(date_end) AS VARCHAR(2)) AS date,
         agebucket_1_count , 
         agebucket_2_count , 
         agebucket_3_count , 
         agebucket_4_count, 
         agebucket_1_count + agebucket_2_count + agebucket_3_count + agebucket_4_count AS total,
         time_interval_avg 
FROM     #tmp 
ORDER BY date_end

GO
