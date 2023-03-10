USE [ITDevelopersDB]
GO
/****** Object:  StoredProcedure [dbo].[RR_OrderInsert]    Script Date: 12/19/2022 8:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Alex Aloysius
-- Create date: 12/19/2022
-- Description:	Insert Order data from temp table to Award_Tracking table
-- =============================================
ALTER PROCEDURE [dbo].[RR_OrderInsert]
AS
BEGIN

DECLARE @LastAwardID int;
DECLARE db_cursor CURSOR FOR 
SELECT 
	  -- [Award_ID]
      [upload_date]
      ,[Customer_Name]
      ,[Customer_ID]
      ,[lane_name]
      ,[Brokerage_Asset]
      ,[Opportunity_Name]
      ,[Go_Live_Date]
      ,[Expiration_Date]
      ,[Award_Type]
      ,[Lane_ID_From_Bid]
      ,[orig_city]
      ,[orig_state]
      ,[orig_zip]
      ,[orig_region]
      ,[orig_country]
      ,[orig_loading_type]
      ,[dest_city]
      ,[dest_state]
      ,[dest_zip]
      ,[dest_region]
      ,[dest_country]
      ,[dest_unloading_type]
      ,[Multi_Stop]
      ,[Customer_Provided_Miles]
      ,[Equipment_TYpe]
      ,[Mode_Type]
      ,[Lane_Type]
      ,[hazmat]
      ,[tanker_endorsement]
      ,[Temp_Requirements]
      ,[Volume_provided_by_customer]
      ,[Volume_time_frame_provided_by_customer]
      ,[Truck_cost]
      ,[All_in_Customer]
      ,[Awarded_Linehaul]
      ,[Awarded_LH_RPM]
      --,[Months_in_Award]
      --,[Avg_Monthly_Vol]
  FROM [ITDevelopersDB].[dbo].[Award Tracking_temp]

-- declare variables used in cursor
    DECLARE @Award_ID int  ;
	DECLARE @upload_date datetime  ;
	DECLARE @Customer_Name nvarchar(max)  ;
	DECLARE @Customer_ID nvarchar(50) ;
	DECLARE @lane_name nvarchar(max) ;
	DECLARE @Brokerage_Asset nvarchar(50)  ;
	DECLARE @Opportunity_Name nvarchar(max) ;
	DECLARE @Go_Live_Date date ;
	DECLARE @Expiration_Date date ;
	DECLARE @Award_Type nvarchar(50) ;
	DECLARE @Lane_ID_From_Bid nvarchar(50) ;
	DECLARE @orig_city nvarchar(50) ;
	DECLARE @orig_state nvarchar(50) ;
	DECLARE @orig_zip nvarchar(50) ;
	DECLARE @orig_region nvarchar(50) ;
	DECLARE @orig_country nvarchar(50) ;
	DECLARE @orig_loading_type nvarchar(50) ;
	DECLARE @dest_city nvarchar(50) ;
	DECLARE @dest_state nvarchar(50) ;
	DECLARE @dest_zip nvarchar(50) ;
	DECLARE @dest_region nvarchar(50) ;
	DECLARE @dest_country nvarchar(50) ;
	DECLARE @dest_unloading_type nvarchar(50) ;
	DECLARE @Multi_Stop nvarchar(50) ;
	DECLARE @Customer_Provided_Miles nvarchar(50) ;
	DECLARE @Equipment_TYpe nvarchar(50) ;
	DECLARE @Mode_Type nvarchar(50) ;
	DECLARE @Lane_Type nvarchar(50) ;
	DECLARE @hazmat nvarchar(50) ;
	DECLARE @tanker_endorsement nvarchar(50) ;
	DECLARE @Temp_Requirements nvarchar(50) ;
	DECLARE @Volume_provided_by_customer nvarchar(50) ;
	DECLARE @Volume_time_frame_provided_by_customer nvarchar(50) ;
	DECLARE @Truck_cost nvarchar(50) ;
	DECLARE @All_in_Customer nvarchar(50) ;
	DECLARE @Awarded_Linehaul nvarchar(50);
	DECLARE @Awarded_LH_RPM nvarchar(50);
 	DECLARE @Months_in_Award int;
	DECLARE @Avg_Monthly_Vol int;

-- open cursor
OPEN db_cursor;
 -- loop through a cursor
FETCH NEXT FROM db_cursor INTO
      -- @Award_ID 
	  @upload_date
      ,@Customer_Name
      ,@Customer_ID
      ,@lane_name
      ,@Brokerage_Asset
      ,@Opportunity_Name
      ,@Go_Live_Date
      ,@Expiration_Date
      ,@Award_Type
      ,@Lane_ID_From_Bid
      ,@orig_city
      ,@orig_state
      ,@orig_zip
      ,@orig_region
      ,@orig_country
      ,@orig_loading_type
      ,@dest_city
      ,@dest_state
      ,@dest_zip
      ,@dest_region
      ,@dest_country
      ,@dest_unloading_type
      ,@Multi_Stop
      ,@Customer_Provided_Miles
      ,@Equipment_TYpe
      ,@Mode_Type
      ,@Lane_Type
      ,@hazmat
      ,@tanker_endorsement
      ,@Temp_Requirements
      ,@Volume_provided_by_customer
      ,@Volume_time_frame_provided_by_customer
      ,@Truck_cost
      ,@All_in_Customer
      ,@Awarded_Linehaul
      ,@Awarded_LH_RPM
 	 -- ,@Months_in_Award  
	  --,@Avg_Monthly_Vol  

	  select  @LastAwardID  = max([Award_ID])+1   from  [dbo].[Award Tracking_dev]
WHILE @@FETCH_STATUS = 0
    BEGIN
    
FETCH NEXT FROM db_cursor INTO
     --  @Award_ID 
	  @upload_date
      ,@Customer_Name
      ,@Customer_ID
      ,@lane_name
      ,@Brokerage_Asset
      ,@Opportunity_Name
      ,@Go_Live_Date
      ,@Expiration_Date
      ,@Award_Type
      ,@Lane_ID_From_Bid
      ,@orig_city
      ,@orig_state
      ,@orig_zip
      ,@orig_region
      ,@orig_country
      ,@orig_loading_type
      ,@dest_city
      ,@dest_state
      ,@dest_zip
      ,@dest_region
      ,@dest_country
      ,@dest_unloading_type
      ,@Multi_Stop
      ,@Customer_Provided_Miles
      ,@Equipment_TYpe
      ,@Mode_Type
      ,@Lane_Type
      ,@hazmat
      ,@tanker_endorsement
      ,@Temp_Requirements
      ,@Volume_provided_by_customer
      ,@Volume_time_frame_provided_by_customer
      ,@Truck_cost
      ,@All_in_Customer
      ,@Awarded_Linehaul
      ,@Awarded_LH_RPM
 	 -- ,@Months_in_Award  
	  --,@Avg_Monthly_Vol  

	  insert into [dbo].[Award Tracking_dev] (
		 [Award_ID]
		,[upload_date]
		,[Customer_Name]
		,[Customer_ID]
		,[lane_name]
		,[Brokerage_Asset]
		,[Opportunity_Name]
		,[Go_Live_Date]
		,[Expiration_Date]
		,[Award_Type]
		,[Lane_ID_From_Bid]
		,[orig_city]
		,[orig_state]
		,[orig_zip]
		,[orig_region]
		,[orig_country]
		,[orig_loading_type]
		,[dest_city]
		,[dest_state]
		,[dest_zip]
		,[dest_region]
		,[dest_country]
		,[dest_unloading_type]
		,[Multi_Stop]
		,[Customer_Provided_Miles]
		,[Equipment_TYpe]
		,[Mode_Type]
		,[Lane_Type]
		,[hazmat]
		,[tanker_endorsement]
		,[Temp_Requirements]
		,[Volume_provided_by_customer]
		,[Volume_time_frame_provided_by_customer]
		,[Truck_cost]
		,[All_in_Customer]
		,[Awarded_Linehaul]
		,[Awarded_LH_RPM]
		)
		Values
		(
		 @LastAwardID
		,@upload_date
		,@Customer_Name
		,@Customer_ID
		,@lane_name
		,@Brokerage_Asset
		,@Opportunity_Name
		,@Go_Live_Date
		,@Expiration_Date
		,@Award_Type
		,@Lane_ID_From_Bid
		,@orig_city
		,@orig_state
		,@orig_zip
		,@orig_region
		,@orig_country
		,@orig_loading_type
		,@dest_city
		,@dest_state
		,@dest_zip
		,@dest_region
		,@dest_country
		,@dest_unloading_type
		,@Multi_Stop
		,@Customer_Provided_Miles
		,@Equipment_TYpe
		,@Mode_Type
		,@Lane_Type
		,@hazmat
		,@tanker_endorsement
		,@Temp_Requirements
		,@Volume_provided_by_customer
		,@Volume_time_frame_provided_by_customer
		,@Truck_cost
		,@All_in_Customer
		,@Awarded_Linehaul
		,@Awarded_LH_RPM
		)
	  SET @LastAwardID = @LastAwardID+1;
    END;
END;