select max([Award_ID]) from  [dbo].[Award Tracking_dev]

select * into [dbo].[Award Tracking_dev_T] from [dbo].[Award Tracking_dev]
--insert into [dbo].[Award Tracking_dev] select * from [ITDevelopersDB].[dbo].[Award Tracking_temp] 

Delete  [ITDevelopersDB].[dbo].[Award Tracking_temp] where  Customer_Id is NULL OR Customer_Id = ''
go
update [ITDevelopersDB].[dbo].[Award Tracking_temp]
set lane_name = TRIM(orig_city)+', '+TRIM(orig_state)+' - '+TRIM(dest_city)+', '+TRIM(orig_state)+' - '+TRIM(Equipment_Type)




update [ITDevelopersDB].[dbo].[Award Tracking_temp]
set lane_name = TRIM(orig_city)+', '+TRIM(orig_state)+' - '+TRIM(dest_city)+', '+TRIM(orig_state)+' - '+TRIM(Equipment_Type)
where Customer_Id <> NULL




SELECT  lane_name from [ITDevelopersDB].[dbo].[Award Tracking_temp]
where Customer_Id <> NULL



DELETE T
FROM [ITDevelopersDB].[dbo].[Award Tracking_temp] T
JOIN [ITDevelopersDB].[dbo].[Award Tracking_dev] A
On 
A.Customer_ID = T.Customer_ID and
A.Brokerage_Asset = T.Brokerage_Asset and
A.Go_Live_Date = T.Go_Live_Date and
A.Expiration_Date = T.Expiration_Date and
A.Lane_name = T.Lane_name and
A.Orig_loading_type = T.Orig_loading_type and
A.Dest_unloading_type = T.Dest_unloading_type and
A.Multi_stop = T.Multi_stop and
A.Equipment_type = T.Equipment_type and
A.Mode_type = T.Mode_type and
A.Lane_Type = T.Lane_Type and
A.Hazmat = T.Hazmat and
A.Tanker_endorsement = t.Tanker_endorsement



  select *   FROM [ITDevelopersDB].[dbo].[Award Tracking_dev]
 where [Customer_Name]  like 'Gellert Global Group %' --  319/6197




  SELECT Customer_ID, [Customer_Name]   FROM [ITDevelopersDB].[dbo].[Award Tracking_dev]
  Where customer_id is null
  ORDER BY [Customer_Name]




 select C.id,C.name,A.Customer_Name  FROM [gfra_1710].[dbo].[customer] C 
 JOIN [ITDevelopersDB].[dbo].[Award Tracking_dev] A on A.Customer_Name = C.name


 
   SELECT * FROM (SELECT distinct [name]  Name_In_Customer FROM [gfra_1710].[dbo].[customer]) C
  RIGHT OUTER join (  SELECT distinct [Customer_Name]  Name_In_Award FROM [ITDevelopersDB].[dbo].[Award Tracking_dev]) A
   ON C.Name_In_Customer = A.Name_In_Award 

      SELECT * FROM (SELECT distinct [name]  Name_In_Customer FROM [gfra_1710].[dbo].[customer]) C
  LEFT OUTER join (  SELECT distinct [Customer_Name]  Name_In_Award FROM [ITDevelopersDB].[dbo].[Award Tracking_dev]) A
   ON C.Name_In_Customer = A.Name_In_Award 



  SELECT distinct [Customer_Name],Lane_ID_From_Bid   FROM [ITDevelopersDB].[dbo].[Award Tracking_dev]
  order by [Customer_Name],Lane_ID_From_Bid 



  
   SELECT  [name]  FROM [gfra_1710].[dbo].[customer]
   where name like 'Arlanxeo%'

      SELECT  [name]  FROM [gfra_1710].[dbo].[customer]
   where id like 'ZZYOWEMS%'


   ------

   SELECT      
   	A.customer_ID
,	A.Brokerage_Asset
,	A.Go_Live_Date
,	A.Expiration_Date
,	A.Lane_name
,	A.Orig_loading_type
,	A.Dest_unloading_type
,	A.Multi_stop
,   A.Equipment_type
,	A.Mode_type
,	A.Lane_Type
,	A.Hazmat
,	A.Tanker_endorsement
   FROM [ITDevelopersDB].[dbo].[Award Tracking_dev] A
join
[ITDevelopersDB].[dbo].[Award Tracking_temp] T
  on

     A.lane_name = T.lane_name 
--	 A.Expiration_Date = T.Expiration_Date and
	   --  A.Customer_ID = T.Customer_ID 
WHERE A.Customer_ID IS NOT NULL



SELECT       [Customer_Name]
      ,[Customer_ID]
      ,Expiration_Date
      ,[Lane_ID_From_Bid]
	  ,lane_name
      ,[lane_name] FROM [Award Tracking_dev]
WHERE 
--Customer_ID IN (SELECT CUSTOMER_ID FROM [Award Tracking_temp])and
--  Expiration_Date IN (SELECT  [Expiration_Date] FROM  [Award Tracking_temp])
 -- and
     lane_name IN (SELECT lane_name FROM [Award Tracking_temp])

	 SELECT DISTINCT LANE_NAME FROM [Award Tracking_temp]