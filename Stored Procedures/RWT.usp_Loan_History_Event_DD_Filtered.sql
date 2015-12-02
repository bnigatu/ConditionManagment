SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



--insert @tmp0 -- drop table #tmp0 -- select * from #tmp0
-- drop procedure usp_Loan_History_Event_DD_Filtered

CREATE procedure [RWT].[usp_Loan_History_Event_DD_Filtered]
(
	@typeBucket varchar(5)
)
as

-- 2/14/13
-- Summary of logic, in order of execution
--	Only using statuses = 'Purchase Review','Complete','Client Complete','Approved for Purchase','Purchase Requested','Purchased'
--	If 2 or more "Purchased", use the latest one, remove earlier ones
--	If entries after Purchased, remove them
--	If 2 or more "Approved for Purchase", use the earliest one
--	If entries "Complete" and/or "Client Complete" after "Approved for Purchase", remove them
--	If 2 or more "Purchase Review", use the earliest one
--	If 2 or more "Complete", use the earliest one
--	If 2 or more "Client Complete", use the earliest one
--	If 2 or more "Purchase Requested", use the earliest one
--	For DD Result to Purchase Approved, if no "Complete" then use "Client Complete" (cc_flag)
-- 2/19/13
--	For Purchase Review to DD Results, if no "Purchase Review" then use "Purchase Requested" (prddpr_flag)
--	For Purchase Review to DD Results, if no previous "Complete" then use "Client Complete" (this rule exists as cc_flag, from above)
--	For Purchase Requested to Purchased, if no "Purchase Requested" then use "Purchase Review" (prppr_flag)
-- 04/08/13
--  Add input parameter for additional statuses (note: new statuses must be added manually below)
--  Removed the value_before field, not used in report
-- Create indexes on fields
-- 04/13/13
--  Add PReq option to reduce the number of loans returned, for better performance
-- 04/24/13
--  Added Cancelled status to PR data selection
--
-- Run the above in order, deleting the unnecessary & extra records to create the final dataset to use in the report.
--drop table #tmp0
--declare @typeBucket varchar(5) = 'PRDD'
set nocount on;

create table #tmp0 (rwt_loan_number varchar(32)
	,CHANGE_DATE datetime
	,VALUE_AFTER varchar(40)
	,SELLER varchar(40)
	,DD_PROVIDER varchar(25)
	,cc_flag varchar(1)
	,prddpr_flag varchar(1)
	,prppr_flag varchar(1));

-- Use if construct, not case in filter, because performance issue
if @typeBucket = 'PR'
 insert #tmp0
 select	lh.rwt_loan_number
		,lh.CHANGE_DATE
		,lh.VALUE_AFTER
		,isnull(vo.SELLER,'') as SELLER
		,isnull(vo.DD_PROVIDER,'') as DD_PROVIDER
		,'' as cc_flag,'' as prddpr_flag,'' as prppr_flag
   FROM [rwt].[loan_history_event_v] lh
   left outer join [RWT].[V_ODS] vo
    on lh.rwt_loan_number = vo.RWT_LOAN_NUM
   where 1=1
    and lh.VALUE_AFTER in ('Purchase Review'
							,'Cancelled'
							,'Complete'
							,'Client Complete'
							,'Approved for Purchase'
							,'Purchase Requested'
							,'Purchased'
							,'DD Review'
							,'Full Review'
							,'Pre-close Review'
							,'Registration'
							,'RWT Review'
							,'Seller Review')
    --order by lh.rwt_loan_number, lh.CHANGE_DATE
if @typeBucket = 'PReq'
 insert #tmp0
 select lh.rwt_loan_number
		,lh.CHANGE_DATE
		,lh.VALUE_AFTER
		,isnull(vo.SELLER,'') as SELLER
		,isnull(vo.DD_PROVIDER,'') as DD_PROVIDER
		,'' as cc_flag,'' as prddpr_flag,'' as prppr_flag
   FROM [rwt].[loan_history_event_v] lh
   left outer join [RWT].[V_ODS] vo
    on lh.rwt_loan_number = vo.RWT_LOAN_NUM
   where 1=1
    --and lh.VALUE_AFTER in ('Purchase Review'
				--			,'Complete'
				--			,'Client Complete'
				--			,'Approved for Purchase'
				--			,'Purchase Requested'
				--			,'Purchased')
	and lh.VALUE_AFTER = 'Purchase Requested'
    --order by lh.rwt_loan_number, lh.CHANGE_DATE
if @typeBucket not in ('PR', 'PReq')
 insert #tmp0
 select	lh.rwt_loan_number
		,lh.CHANGE_DATE
		,lh.VALUE_AFTER
		,isnull(vo.SELLER,'') as SELLER
		,isnull(vo.DD_PROVIDER,'') as DD_PROVIDER
		,'' as cc_flag,'' as prddpr_flag,'' as prppr_flag
   FROM [rwt].[loan_history_event_v] lh
   left outer join [RWT].[V_ODS] vo
    on lh.rwt_loan_number = vo.RWT_LOAN_NUM
   where 1=1
    and lh.VALUE_AFTER in ('Purchase Review'
							,'Complete'
							,'Client Complete'
							,'Approved for Purchase'
							,'Purchase Requested'
							,'Purchased')
    --order by lh.rwt_loan_number, lh.CHANGE_DATE

-- Create the indexes for performance (already tested, fastest)
create clustered index rln on #tmp0(rwt_loan_number)
create index rln2 on #tmp0(rwt_loan_number) include (change_date, value_after)

-- Exclude the below loan records as exceptions
-- Must use a different @tmp table name for every CTE below
-- Case where there are 2 or more "Purchased", use the latest one, delete the earlier ones
declare @tmp1_p table (rwt_loan_number varchar(32)
					,CHANGE_DATE_min datetime)
  ;with dup (rwt_loan_number_dup, count) as
							 (select rwt_loan_number, count(*) as count
								from #tmp0
								 where value_after = 'Purchased'
								 group by rwt_loan_number
								  having count(*) > 1)
			insert @tmp1_p
			 select rwt_loan_number, max(CHANGE_DATE) as change_date_min
			  from #tmp0
			   where rwt_loan_number in (select rwt_loan_number_dup from dup)
			    and value_after = 'Purchased'
			  group by rwt_loan_number
delete t0
--select *
 from #tmp0 t0
  join @tmp1_p t1
   on t0.rwt_loan_number = t1.rwt_loan_number
  where t0.rwt_loan_number in(select rwt_loan_number from @tmp1_p)
   and t0.CHANGE_DATE < t1.change_date_min
   and value_after = 'Purchased'

-- Case where there are entries after Purchased for a loan, remove them
delete #tmp0
from #tmp0 a
 where a.change_date > (select change_date
						 from #tmp0
						  where value_after = 'Purchased'
						   and rwt_loan_number = a.rwt_loan_number)

-- Case where there are 2 or more "Approved for Purchase", use the earliest one, delete the later ones
declare @tmp1_ap table (rwt_loan_number varchar(32)
					,CHANGE_DATE_min datetime)
  ;with dup (rwt_loan_number_dup, count) as
							 (select rwt_loan_number, count(*) as count
								from #tmp0
								 where value_after = 'Approved for Purchase'
								 group by rwt_loan_number
								  having count(*) > 1)
			insert @tmp1_ap
			 select rwt_loan_number, min(CHANGE_DATE) as change_date_min
			  from #tmp0
			   where rwt_loan_number in (select rwt_loan_number_dup from dup)
			    and value_after = 'Approved for Purchase'
			  group by rwt_loan_number
delete t0
--select *
 from #tmp0 t0
  join @tmp1_ap t1
   on t0.rwt_loan_number = t1.rwt_loan_number
  where t0.rwt_loan_number in(select rwt_loan_number from @tmp1_ap)
   and t0.CHANGE_DATE > t1.change_date_min
   and value_after = 'Approved for Purchase'

-- Case where there is "Complete" and/or "Client Complete" after "Approved for Purchase", remove them
delete #tmp0
 from #tmp0 a
 where a.change_date > (select change_date
						 from #tmp0
						  where value_after = 'Approved for Purchase'
						   and rwt_loan_number = a.rwt_loan_number)
  and a.value_after in ('Complete','Client Complete')

-- Case where there are 2 or more "Purchase Review", use the earliest one, delete the later ones
declare @tmp1_pr table (rwt_loan_number varchar(32)
					,CHANGE_DATE_min datetime)
  ;with dup (rwt_loan_number_dup, count) as
							 (select rwt_loan_number, count(*) as count
								from #tmp0
								 where value_after = 'Purchase Review'
								 group by rwt_loan_number
								  having count(*) > 1)
			insert @tmp1_pr
			 select rwt_loan_number, min(CHANGE_DATE) as change_date_min
			  from #tmp0
			   where rwt_loan_number in (select rwt_loan_number_dup from dup)
			    and value_after = 'Purchase Review'
			  group by rwt_loan_number
delete t0
--select *
 from #tmp0 t0
  join @tmp1_pr t1
   on t0.rwt_loan_number = t1.rwt_loan_number
  where t0.rwt_loan_number in(select rwt_loan_number from @tmp1_pr)
   and t0.CHANGE_DATE > t1.change_date_min
   and value_after = 'Purchase Review'

-- Case where there are 2 or more "Complete", use the earliest one, delete the later ones
declare @tmp1_c table (rwt_loan_number varchar(32)
					,CHANGE_DATE_min datetime)
  ;with dup (rwt_loan_number_dup, count) as
							 (select rwt_loan_number, count(*) as count
								from #tmp0
								 where value_after = 'Complete'
								 group by rwt_loan_number
								  having count(*) > 1)
			insert @tmp1_c
			 select rwt_loan_number, min(CHANGE_DATE) as change_date_min
			  from #tmp0
			   where rwt_loan_number in (select rwt_loan_number_dup from dup)
			    and value_after = 'Complete'
			  group by rwt_loan_number
delete t0
--select *
 from #tmp0 t0
  join @tmp1_c t1
   on t0.rwt_loan_number = t1.rwt_loan_number
  where t0.rwt_loan_number in(select rwt_loan_number from @tmp1_c)
   and t0.CHANGE_DATE > t1.change_date_min
   and value_after = 'Complete'

-- Case where there are 2 or more "Client Complete", use the earliest one, delete the later ones
declare @tmp1_cc table (rwt_loan_number varchar(32)
					,CHANGE_DATE_min datetime)
  ;with dup (rwt_loan_number_dup, count) as
							 (select rwt_loan_number, count(*) as count
								from #tmp0
								 where value_after = 'Client Complete'
								 group by rwt_loan_number
								  having count(*) > 1)
			insert @tmp1_cc
			 select rwt_loan_number, min(CHANGE_DATE) as change_date_min
			  from #tmp0
			   where rwt_loan_number in (select rwt_loan_number_dup from dup)
			    and value_after = 'Client Complete'
			  group by rwt_loan_number
delete t0
--select *
 from #tmp0 t0
  join @tmp1_cc t1
   on t0.rwt_loan_number = t1.rwt_loan_number
  where t0.rwt_loan_number in(select rwt_loan_number from @tmp1_cc)
   and t0.CHANGE_DATE > t1.change_date_min
   and value_after = 'Client Complete'

-- Case where there are 2 or more "Purchase Requested", use the earliest one, delete the later ones
declare @tmp1_prd table (rwt_loan_number varchar(32)
					,CHANGE_DATE_min datetime)
  ;with dup (rwt_loan_number_dup, count) as
							 (select rwt_loan_number, count(*) as count
								from #tmp0
								 where value_after = 'Purchase Requested'
								 group by rwt_loan_number
								  having count(*) > 1)
			insert @tmp1_prd
			 select rwt_loan_number, min(CHANGE_DATE) as change_date_min
			  from #tmp0
			   where rwt_loan_number in (select rwt_loan_number_dup from dup)
			    and value_after = 'Purchase Requested'
			  group by rwt_loan_number
delete t0
--select *
 from #tmp0 t0
  join @tmp1_prd t1
   on t0.rwt_loan_number = t1.rwt_loan_number
  where t0.rwt_loan_number in(select rwt_loan_number from @tmp1_prd)
   and t0.CHANGE_DATE > t1.change_date_min
   and value_after = 'Purchase Requested'

-- Find loans where there is no "Complete" then use "Client Complete" and tag with * (cc_flag). Run the below in order.
-- Tag loans that have normal "Complete" and "Client Complete" records
;with cc(rwt_loan_number, count) as (
			select rwt_loan_number, COUNT(*) as count
			 from #tmp0
			 where VALUE_AFTER in ('Complete','Client Complete')
			  group by rwt_loan_number
			   having COUNT(*) = 2
			   )
	update t0
	 set cc_flag = '*'
	--select t0.*
	 from #tmp0 t0
	  join cc
	   on t0.rwt_loan_number = cc.rwt_loan_number
	 where VALUE_AFTER in ('Complete')

-- Tag *Complete for loans that have only a "Complete" record
;with cc(rwt_loan_number, count) as (
			select rwt_loan_number, COUNT(*) as count
			 from #tmp0
			 where VALUE_AFTER in ('Complete','Client Complete')
			  group by rwt_loan_number
			   having COUNT(*) < 2
			   )
	update t0
	 set cc_flag = '*'
	--select t0.*
	 from #tmp0 t0
	  join cc
	   on t0.rwt_loan_number = cc.rwt_loan_number
	 where VALUE_AFTER in ('Complete')

-- Tag *Client Complete for loans that have only a "Client Complete" record
;with cc(rwt_loan_number, count) as (
			select rwt_loan_number, COUNT(*) as count
			 from #tmp0
			 where VALUE_AFTER in ('Complete','Client Complete')
			  group by rwt_loan_number
			   having COUNT(*) < 2
			   )
	update t0
	 set cc_flag = '*'
	--select t0.*
	 from #tmp0 t0
	  join cc
	   on t0.rwt_loan_number = cc.rwt_loan_number
	 where VALUE_AFTER in ('Client Complete')


-- Find loans where there is no "Purchase Review" then use "Purchase Requested" (prddpr_flag). Run the below in order.
-- Tag loans that have normal "Purchase Review" records
;with cc(rwt_loan_number, count) as (
			select rwt_loan_number, COUNT(*) as count
			 from #tmp0
			 where VALUE_AFTER in ('Purchase Review','Purchase Requested')
			  group by rwt_loan_number
			   having COUNT(*) = 2
			   )
	update t0
	 set prddpr_flag = '*'
	--select t0.*
	 from #tmp0 t0
	  join cc
	   on t0.rwt_loan_number = cc.rwt_loan_number
	 where VALUE_AFTER in ('Purchase Review')

-- Tag loans that have only a "Purchase Review" record
;with cc(rwt_loan_number, count) as (
			select rwt_loan_number, COUNT(*) as count
			 from #tmp0
			 where VALUE_AFTER in ('Purchase Review','Purchase Requested')
			  group by rwt_loan_number
			   having COUNT(*) < 2
			   )
	update t0
	 set prddpr_flag = '*'
	--select t0.*
	 from #tmp0 t0
	  join cc
	   on t0.rwt_loan_number = cc.rwt_loan_number
	 where VALUE_AFTER in ('Purchase Review')

-- Tag loans that have only a "Purchase Requested" record
;with cc(rwt_loan_number, count) as (
			select rwt_loan_number, COUNT(*) as count
			 from #tmp0
			 where VALUE_AFTER in ('Purchase Review','Purchase Requested')
			  group by rwt_loan_number
			   having COUNT(*) < 2
			   )
	update t0
	 set prddpr_flag = '*'
	--select t0.*
	 from #tmp0 t0
	  join cc
	   on t0.rwt_loan_number = cc.rwt_loan_number
	 where VALUE_AFTER in ('Purchase Requested')


-- Find loans where there is no "Purchase Requested" then use "Purchase Review" (prppr_flag). Run the below in order.
-- Tag loans that have normal "Purchase Requested" records
;with cc(rwt_loan_number, count) as (
			select rwt_loan_number, COUNT(*) as count
			 from #tmp0
			 where VALUE_AFTER in ('Purchase Requested','Purchase Review')
			  group by rwt_loan_number
			   having COUNT(*) = 2
			   )
	update t0
	 set prppr_flag = '*'
	--select t0.*
	 from #tmp0 t0
	  join cc
	   on t0.rwt_loan_number = cc.rwt_loan_number
	 where VALUE_AFTER in ('Purchase Requested')

-- Tag loans that have only a "Purchase Requested" record
;with cc(rwt_loan_number, count) as (
			select rwt_loan_number, COUNT(*) as count
			 from #tmp0
			 where VALUE_AFTER in ('Purchase Requested','Purchase Review')
			  group by rwt_loan_number
			   having COUNT(*) < 2
			   )
	update t0
	 set prppr_flag = '*'
	--select t0.*
	 from #tmp0 t0
	  join cc
	   on t0.rwt_loan_number = cc.rwt_loan_number
	 where VALUE_AFTER in ('Purchase Requested')

-- Tag loans that have only a "Purchase Review" record
;with cc(rwt_loan_number, count) as (
			select rwt_loan_number, COUNT(*) as count
			 from #tmp0
			 where VALUE_AFTER in ('Purchase Requested','Purchase Review')
			  group by rwt_loan_number
			   having COUNT(*) < 2
			   )
	update t0
	 set prppr_flag = '*'
	--select t0.*
	 from #tmp0 t0
	  join cc
	   on t0.rwt_loan_number = cc.rwt_loan_number
	 where VALUE_AFTER in ('Purchase Review')


select * from #tmp0



GO
