USE [SGSSODATA]
GO
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN TRANSACTION;

DBCC CHECKIDENT ([base_Person], RESEED, 1);
-- base_Person
INSERT INTO [dbo].[base_Person]([first_name],[last_name],[email],[created_at],[updated_at])
 VALUES ('Igor','Randall','ante@eget.edu','01/13/2020','02/18/2018');
INSERT INTO [dbo].[base_Person]([first_name],[last_name],[email],[created_at],[updated_at])
 VALUES ('Zahir','Kato','ridiculus.mus@metus.co.uk','08/18/2019','07/08/2019');
INSERT INTO [dbo].[base_Person]([first_name],[last_name],[email],[created_at],[updated_at])
 VALUES ('Jakeem','Carl','tempus@nibhdolor.ca','08/21/2019','07/23/2018');
INSERT INTO [dbo].[base_Person]([first_name],[last_name],[email],[created_at],[updated_at])
 VALUES ('Mason','Kamal','dolor@estNuncullamcorper.edu','02/20/2019','10/19/2019');
INSERT INTO [dbo].[base_Person]([first_name],[last_name],[email],[created_at],[updated_at])
 VALUES ('Cole','Peter','ligula@posuere.org','07/06/2018','10/03/2019');
INSERT INTO [dbo].[base_Person]([first_name],[last_name],[email],[created_at],[updated_at])
 VALUES ('Elvis','Castor','dignissim.Maecenas.ornare@sedpede.net','01/27/2019','11/03/2018');
INSERT INTO [dbo].[base_Person]([first_name],[last_name],[email],[created_at],[updated_at])
 VALUES ('Lane','Daquan','vel@volutpatornare.net','12/25/2018','09/18/2019');
INSERT INTO [dbo].[base_Person]([first_name],[last_name],[email],[created_at],[updated_at])
 VALUES ('Barry','James','Donec.est@Phasellus.net','07/30/2018','10/09/2018');
INSERT INTO [dbo].[base_Person]([first_name],[last_name],[email],[created_at],[updated_at])
 VALUES ('Garrett','Palmer','purus.in@interdumSedauctor.org','09/19/2019','08/09/2018');
INSERT INTO [dbo].[base_Person]([first_name],[last_name],[email],[created_at],[updated_at])
 VALUES ('Cadman','Erasmus','mollis.Duis@inmolestietortor.org','11/18/2019','07/31/2018');

DBCC CHECKIDENT ([base_Account], RESEED, 1);

PRINT 'Insert data into the [base_Account] table...';
INSERT INTO [dbo].[base_Account]([person_id], [password], [created_at], [updated_at])
 VALUES (1,'arcu.','07/04/2018','11/26/2019');
INSERT INTO [dbo].[base_Account]([person_id], [password], [created_at], [updated_at])
 VALUES (2,'sagittis.','03/19/2018','06/14/2019');
INSERT INTO [dbo].[base_Account]([person_id], [password], [created_at], [updated_at])
 VALUES (3,'egestas','09/09/2018','06/23/2019');
INSERT INTO [dbo].[base_Account]([person_id], [password], [created_at], [updated_at])
 VALUES (4,'at,','10/10/2019','03/16/2019');
INSERT INTO [dbo].[base_Account]([person_id], [password], [created_at], [updated_at])
 VALUES (5,'ligula','04/06/2019','05/02/2019');
INSERT INTO [dbo].[base_Account]([person_id], [password], [created_at], [updated_at])
 VALUES (6,'Nunc','12/04/2019','01/14/2019');
INSERT INTO [dbo].[base_Account]([person_id], [password], [created_at], [updated_at])
 VALUES (7,'mi','04/16/2019','08/05/2019');
INSERT INTO [dbo].[base_Account]([person_id], [password], [created_at], [updated_at])
 VALUES (8,'luctus','11/18/2018','01/11/2019');
INSERT INTO [dbo].[base_Account]([person_id], [password], [created_at], [updated_at])
 VALUES (9,'Etiam','07/21/2018','12/08/2018');
INSERT INTO [dbo].[base_Account]([person_id], [password], [created_at], [updated_at])
 VALUES (10,'nec','07/03/2018','06/14/2019');

-- base_Employee
DBCC CHECKIDENT ([base_Employee], RESEED, 1);
INSERT INTO [dbo].[base_Employee]([person_id],[ci],[address],[birth_date],[gender],[phone_number],[picture],[created_at],[updated_at])
VALUES (1,10292437,'3939 Sollicitudin Av.','05-15-2010','M', 98910791, CAST ('My first FILESTREAM data' AS VARBINARY(MAX)),'08/12/2018','01/11/2019')
INSERT INTO [dbo].[base_Employee]([person_id],[ci],[address],[birth_date],[gender],[phone_number],[picture],[created_at],[updated_at])
 VALUES (2,36413261,'174 Quisque Avenue','04-24-1991','M',85292680,CAST ('My first FILESTREAM data' AS VARBINARY(MAX)), '03/01/2018','09/19/2019');
INSERT INTO [dbo].[base_Employee]([person_id],[ci],[address],[birth_date],[gender],[phone_number],[picture],[created_at],[updated_at])
 VALUES (3,42850513,'P.O. Box 952, 9587 Vitae, Rd.','04-24-1991','F',34533578,CAST ('My first FILESTREAM data' AS VARBINARY(MAX)),'05/23/2019','05/13/2019');
INSERT INTO [dbo].[base_Employee]([person_id],[ci],[address],[birth_date],[gender],[phone_number],[picture],[created_at],[updated_at])
 VALUES (4,43196892,'Ap #400-5542 Donec Rd.','12-01-1999','F',28142567,CAST ('My first FILESTREAM data' AS VARBINARY(MAX)),'03/08/2019','11/06/2018');
INSERT INTO [dbo].[base_Employee]([person_id],[ci],[address],[birth_date],[gender],[phone_number],[picture],[created_at],[updated_at])
 VALUES (5,30935047,'P.O. Box 941, 2099 Morbi Street','12-03-1992','F',12323655,CAST ('My first FILESTREAM data' AS VARBINARY(MAX)),'02/20/2018','07/02/2018');
INSERT INTO [dbo].[base_Employee]([person_id],[ci],[address],[birth_date],[gender],[phone_number],[picture],[created_at],[updated_at])
 VALUES (6,37413964,'P.O. Box 799, 4357 Erat, Street','04-12-1994','F',59852385,CAST ('My first FILESTREAM data' AS VARBINARY(MAX)),'08/28/2019','06/16/2018');
INSERT INTO [dbo].[base_Employee]([person_id],[ci],[address],[birth_date],[gender],[phone_number],[picture],[created_at],[updated_at])
 VALUES (8,10701791,'P.O. Box 359, 9188 Malesuada Street','01-10-1994','M',98277761,CAST ('My first FILESTREAM data' AS VARBINARY(MAX)),'01/17/2020','03/25/2019');
INSERT INTO [dbo].[base_Employee]([person_id],[ci],[address],[birth_date],[gender],[phone_number],[picture],[created_at],[updated_at])
 VALUES (9,42425108,'635-5395 Elit, Avenue','01-04-1990','M',122104154,Cast('wahid' As varbinary(max)),'09/06/2018','10/10/2019');


-- base_Department
DBCC CHECKIDENT ([base_Department], RESEED, 1);
INSERT INTO [dbo].[base_Department]([name],[description],[created_at],[updated_at])
 VALUES ('Auctor Ullamcorper Institute','quis lectus. Nullam','01/27/2020','09/02/2019');
INSERT INTO [dbo].[base_Department]([name],[description],[created_at],[updated_at])
 VALUES('Vestibulum Industries','odio. Nam interdum','01/25/2020','01/04/2019');
INSERT INTO [dbo].[base_Department]([name],[description],[created_at],[updated_at])
 VALUES('Elementum Purus Accumsan Industries','taciti sociosqu ad','03/10/2019','04/18/2019');
INSERT INTO [dbo].[base_Department]([name],[description],[created_at],[updated_at])
 VALUES('Metus Aliquam Company','nibh enim, gravida','01/09/2019','03/03/2019');
INSERT INTO [dbo].[base_Department]([name],[description],[created_at],[updated_at])
 VALUES('Et Libero Proin PC','hendrerit. Donec porttitor','09/23/2018','08/11/2019');
INSERT INTO [dbo].[base_Department]([name],[description],[created_at],[updated_at])
 VALUES('Ligula Eu LLC','rhoncus. Donec est.','05/07/2019','01/17/2020');
INSERT INTO [dbo].[base_Department]([name],[description],[created_at],[updated_at])
 VALUES('Nisl Incorporated','feugiat nec, diam.','04/22/2019','07/24/2019');
INSERT INTO [dbo].[base_Department]([name],[description],[created_at],[updated_at])
 VALUES('Sit Amet Consectetuer LLP','dui. Suspendisse ac','01/31/2020','06/16/2018');
INSERT INTO [dbo].[base_Department]([name],[description],[created_at],[updated_at])
 VALUES('Turpis Foundation','molestie in, tempus','08/01/2019','12/09/2019');
INSERT INTO [dbo].[base_Department]([name],[description],[created_at],[updated_at])
 VALUES('Orci PC','ut nisi a','12/12/2019','11/26/2018');

--base_Project
DBCC CHECKIDENT ([base_Project], RESEED, 1);
INSERT INTO [dbo].[base_Project]([project_id],[name_project],[design_project],[location_project],[budget_project],[start_date_project],[ending_date_project],[created_at],[updated_at])
VALUES(1,'ornare,','metus. In nec orci. Donec nibh. Quisque nonummy ipsum non','Sit Amet Risus Incorporated','100','11/02/2018','06/03/2018','09/27/2019','09/04/2018');
INSERT INTO [dbo].[base_Project]([project_id],[name_project],[design_project],[location_project],[budget_project],[start_date_project],[ending_date_project],[created_at],[updated_at])
VALUES(2,'ornare,','metus. In nec orci. Donec nibh. Quisque nonummy ipsum non','Sit Amet Risus Incorporated','100','11/02/2018','06/03/2018','09/27/2019','09/04/2018');
INSERT INTO [dbo].[base_Project]([project_id],[name_project],[design_project],[location_project],[budget_project],[start_date_project],[ending_date_project],[created_at],[updated_at])
VALUES(3,'urna.','Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi,','Urna Nullam Lobortis Consulting','100','04/26/2018','06/13/2019','03/29/2018','11/09/2018');
INSERT INTO [dbo].[base_Project]([project_id],[name_project],[design_project],[location_project],[budget_project],[start_date_project],[ending_date_project],[created_at],[updated_at])
VALUES(4,'sem','quis diam. Pellentesque habitant morbi tristique senectus et netus et','Hendrerit Company','100','01/08/2020','08/19/2018','05/28/2018','09/09/2018');
INSERT INTO [dbo].[base_Project]([project_id],[name_project],[design_project],[location_project],[budget_project],[start_date_project],[ending_date_project],[created_at],[updated_at])
VALUES(5,'luctus','mi. Aliquam gravida mauris ut mi. Duis risus odio, auctor','Neque Et Incorporated','100','10/24/2019','06/04/2019','04/03/2019','01/26/2019');
INSERT INTO [dbo].[base_Project]([project_id],[name_project],[design_project],[location_project],[budget_project],[start_date_project],[ending_date_project],[created_at],[updated_at])
VALUES(6,'accumsan','dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis','Augue Company','100','07/28/2018','05/24/2018','08/20/2018','01/22/2019');
INSERT INTO [dbo].[base_Project]([project_id],[name_project],[design_project],[location_project],[budget_project],[start_date_project],[ending_date_project],[created_at],[updated_at])
VALUES(7,'a','consectetuer adipiscing elit. Etiam laoreet, libero et tristique pellentesque, tellus','Purus Accumsan Corporation','100','07/21/2019','02/19/2019','03/15/2019','10/05/2018');
INSERT INTO [dbo].[base_Project]([project_id],[name_project],[design_project],[location_project],[budget_project],[start_date_project],[ending_date_project],[created_at],[updated_at])
VALUES(8,'Donec','vestibulum, neque sed dictum eleifend, nunc risus varius orci, in','Malesuada Fames Ac Corp.','100','03/22/2019','10/18/2018','07/23/2019','08/23/2018');
INSERT INTO [dbo].[base_Project]([project_id],[name_project],[design_project],[location_project],[budget_project],[start_date_project],[ending_date_project],[created_at],[updated_at])
VALUES(9,'urna','consequat nec, mollis vitae, posuere at, velit. Cras lorem lorem,','Neque Sed Eget LLP','100','02/28/2019','03/02/2019','11/17/2019','05/05/2018');
INSERT INTO [dbo].[base_Project]([project_id],[name_project],[design_project],[location_project],[budget_project],[start_date_project],[ending_date_project],[created_at],[updated_at])
VALUES(10,'ligula','libero lacus, varius et, euismod et, commodo at, libero. Morbi','Elit Associates','100','02/07/2020','02/14/2018','03/07/2019','10/18/2018');

-- base_Employee_Project
DBCC CHECKIDENT ([base_Employee_Project], RESEED, 1);
INSERT INTO [dbo].[base_Employee_Project]([emp_proj_id],[employee_id],[project_id],[created_at],[updated_at])
 VALUES (1,10,4,'06/03/2018','03/29/2018');
INSERT INTO [dbo].[base_Employee_Project]([emp_proj_id],[employee_id],[project_id],[created_at],[updated_at])
 VALUES (2,3,4,'10/02/2018','03/27/2019');
INSERT INTO [dbo].[base_Employee_Project]([emp_proj_id],[employee_id],[project_id],[created_at],[updated_at])
 VALUES (3,2,6,'05/31/2018','10/03/2019');
INSERT INTO [dbo].[base_Employee_Project]([emp_proj_id],[employee_id],[project_id],[created_at],[updated_at])
 VALUES (4,9,3,'02/13/2018','05/11/2018');
INSERT INTO [dbo].[base_Employee_Project]([emp_proj_id],[employee_id],[project_id],[created_at],[updated_at])
 VALUES (5,1,1,'08/11/2018','03/08/2018');
INSERT INTO [dbo].[base_Employee_Project]([emp_proj_id],[employee_id],[project_id],[created_at],[updated_at])
 VALUES (2,1,2,'03/23/2018','04/04/2019');
INSERT INTO [dbo].[base_Employee_Project]([emp_proj_id],[employee_id],[project_id],[created_at],[updated_at])
 VALUES (3,2,3,'09/16/2018','01/21/2019');
INSERT INTO [dbo].[base_Employee_Project]([emp_proj_id],[employee_id],[project_id],[created_at],[updated_at])
  VALUES (4,4,4,'05/18/2019','12/12/2018');
INSERT INTO [dbo].[base_Employee_Project]([emp_proj_id],[employee_id],[project_id],[created_at],[updated_at])
  VALUES (5,7,5,'09/12/2018','12/08/2019');
INSERT INTO [dbo].[base_Employee_Project]([emp_proj_id],[employee_id],[project_id],[created_at],[updated_at])
 VALUES (6,7,4,'04/21/2019','08/02/2019');

-- base_Item_Equipment

DBCC CHECKIDENT ([base_Item_Equipment], RESEED, 1);
INSERT INTO [dbo].[base_Item_Equipment]([item_equipment_id],[name_equipment],[description],[acquisition_date],[created_at],[updated_at])
VALUES (1,'Donec Felis Orci Corp.','Suspendisse eleifend. Cras sed','03/11/2018','10/17/2018','02/12/2019');
INSERT INTO [dbo].[base_Item_Equipment]([item_equipment_id],[name_equipment],[description],[acquisition_date],[created_at],[updated_at])
VALUES (2,'Nisi PC','tempor arcu. Vestibulum ut','09/07/2018','11/15/2019','08/06/2018');
INSERT INTO [dbo].[base_Item_Equipment]([item_equipment_id],[name_equipment],[description],[acquisition_date],[created_at],[updated_at])
VALUES (3,'Vulputate Mauris Sagittis Limited','ante ipsum primis in','08/17/2019','11/17/2019','08/23/2018');
INSERT INTO [dbo].[base_Item_Equipment]([item_equipment_id],[name_equipment],[description],[acquisition_date],[created_at],[updated_at])
VALUES (4,'Donec Dignissim Magna LLP','amet ultricies sem magna','02/24/2019','08/30/2018','02/03/2020');
INSERT INTO [dbo].[base_Item_Equipment]([item_equipment_id],[name_equipment],[description],[acquisition_date],[created_at],[updated_at])
VALUES (5,'Erat Etiam Corporation','Curae; Phasellus ornare. Fusce','08/15/2019','07/16/2018','10/28/2019');
INSERT INTO [dbo].[base_Item_Equipment]([item_equipment_id],[name_equipment],[description],[acquisition_date],[created_at],[updated_at])
VALUES (6,'Magna Tellus Faucibus Incorporated','egestas. Aliquam fringilla cursus','08/24/2018','12/31/2018','04/30/2019');
INSERT INTO [dbo].[base_Item_Equipment]([item_equipment_id],[name_equipment],[description],[acquisition_date],[created_at],[updated_at])
VALUES (7,'Curae; Phasellus Ornare Corp.','nec metus facilisis lorem','01/02/2020','05/11/2019','05/30/2019');
INSERT INTO [dbo].[base_Item_Equipment]([item_equipment_id],[name_equipment],[description],[acquisition_date],[created_at],[updated_at])
VALUES (8,'Enim Suspendisse Associates','fringilla euismod enim. Etiam','04/28/2019','08/19/2018','12/26/2018');
INSERT INTO [dbo].[base_Item_Equipment]([item_equipment_id],[name_equipment],[description],[acquisition_date],[created_at],[updated_at])
VALUES (9,'Ligula Eu Limited','dui. Cum sociis natoque','11/26/2019','10/21/2019','07/05/2018');
INSERT INTO [dbo].[base_Item_Equipment]([item_equipment_id],[name_equipment],[description],[acquisition_date],[created_at],[updated_at])
VALUES (10,'Diam Eu Incorporated','Integer eu lacus. Quisque','10/27/2019','05/08/2019','08/28/2018');
INSERT INTO [dbo].[base_Item_Equipment]([item_equipment_id],[name_equipment],[description],[acquisition_date],[created_at],[updated_at])
VALUES (11,'Quisque Nonummy Ipsum LLC','nulla ante, iaculis nec,','08/14/2018','12/05/2018','07/02/2018');
INSERT INTO [dbo].[base_Item_Equipment]([item_equipment_id],[name_equipment],[description],[acquisition_date],[created_at],[updated_at])
VALUES (12,'Lacus Ltd','eget magna. Suspendisse tristique','04/22/2018','11/26/2018','04/20/2018');
INSERT INTO [dbo].[base_Item_Equipment]([item_equipment_id],[name_equipment],[description],[acquisition_date],[created_at],[updated_at])
VALUES (13,'Sem Incorporated','vestibulum lorem, sit amet','07/02/2019','03/13/2018','04/21/2018');
INSERT INTO [dbo].[base_Item_Equipment]([item_equipment_id],[name_equipment],[description],[acquisition_date],[created_at],[updated_at])
VALUES (14,'Sodales Purus In Consulting','sed consequat auctor, nunc','02/24/2018','02/09/2019','11/18/2018');
INSERT INTO [dbo].[base_Item_Equipment]([item_equipment_id],[name_equipment],[description],[acquisition_date],[created_at],[updated_at])
VALUES (15,'Et Corporation','nec metus facilisis lorem','05/22/2019','03/08/2019','06/12/2018');


--base_Machinery
DBCC CHECKIDENT ([base_Machinery], RESEED, 1);
INSERT INTO [dbo].[base_Machinery]([machinery_id],[name_machinery],[brand_machinery],[model_machinery],[state_machinery],[created_at],[updated_at])
VALUES (1,'Ante Consulting','Eu PC','quis','ac,','08/31/2018','10/01/2018');
INSERT INTO [dbo].[base_Machinery]([machinery_id],[name_machinery],[brand_machinery],[model_machinery],[state_machinery],[created_at],[updated_at])
VALUES (2,'Pellentesque Habitant Morbi Foundation','Rhoncus PC','Curae;','nulla','10/21/2019','12/30/2018');
INSERT INTO [dbo].[base_Machinery]([machinery_id],[name_machinery],[brand_machinery],[model_machinery],[state_machinery],[created_at],[updated_at])
VALUES (3,'Mauris Corporation','Lectus Nullam Corp.','mattis','id,','06/02/2019','04/07/2019');
INSERT INTO [dbo].[base_Machinery]([machinery_id],[name_machinery],[brand_machinery],[model_machinery],[state_machinery],[created_at],[updated_at])
VALUES (4,'Cum Sociis Natoque LLP','Ante Maecenas Mi LLC','at,','Nulla','02/22/2019','08/08/2019');
INSERT INTO [dbo].[base_Machinery]([machinery_id],[name_machinery],[brand_machinery],[model_machinery],[state_machinery],[created_at],[updated_at])
VALUES (5,'Feugiat Corporation','Consectetuer Ipsum Nunc Incorporated','Donec','non,','01/13/2019','11/29/2019');
INSERT INTO [dbo].[base_Machinery]([machinery_id],[name_machinery],[brand_machinery],[model_machinery],[state_machinery],[created_at],[updated_at])
VALUES (6,'A Odio LLP','Montes Nascetur Ltd','Cras','lorem','01/22/2020','06/25/2019');
INSERT INTO [dbo].[base_Machinery]([machinery_id],[name_machinery],[brand_machinery],[model_machinery],[state_machinery],[created_at],[updated_at])
VALUES (7,'Aliquam Company','Molestie Arcu Sed Foundation','nec,','feugiat','07/02/2018','09/24/2019');
INSERT INTO [dbo].[base_Machinery]([machinery_id],[name_machinery],[brand_machinery],[model_machinery],[state_machinery],[created_at],[updated_at])
VALUES (8,'Scelerisque Foundation','Conubia Nostra Per PC','ornare','Aenean','02/12/2019','01/11/2020');
INSERT INTO [dbo].[base_Machinery]([machinery_id],[name_machinery],[brand_machinery],[model_machinery],[state_machinery],[created_at],[updated_at])
VALUES (9,'Cras Inc.','A Corporation','suscipit','ipsum','02/04/2020','03/10/2019');
INSERT INTO [dbo].[base_Machinery]([machinery_id],[name_machinery],[brand_machinery],[model_machinery],[state_machinery],[created_at],[updated_at])
VALUES (10,'Neque PC','Cras Eu Tellus Foundation','orci','Sed','02/06/2020','05/03/2018');
INSERT INTO [dbo].[base_Machinery]([machinery_id],[name_machinery],[brand_machinery],[model_machinery],[state_machinery],[created_at],[updated_at])
VALUES (11,'Ipsum PC','Luctus Lobortis Corp.','sed,','et','03/03/2018','10/30/2019');
INSERT INTO [dbo].[base_Machinery]([machinery_id],[name_machinery],[brand_machinery],[model_machinery],[state_machinery],[created_at],[updated_at])
VALUES (12,'Elit A Feugiat Associates','Elementum At Inc.','augue.','urna,','08/18/2019','12/28/2018');
INSERT INTO [dbo].[base_Machinery]([machinery_id],[name_machinery],[brand_machinery],[model_machinery],[state_machinery],[created_at],[updated_at])
VALUES (13,'Lacus Etiam Limited','Lorem Industries','parturient','mus.','11/09/2019','10/25/2018');
INSERT INTO [dbo].[base_Machinery]([machinery_id],[name_machinery],[brand_machinery],[model_machinery],[state_machinery],[created_at],[updated_at])
VALUES (14,'Sem Nulla Interdum Foundation','Consequat PC','odio.','Mauris','06/17/2018','01/19/2020');
INSERT INTO [dbo].[base_Machinery]([machinery_id],[name_machinery],[brand_machinery],[model_machinery],[state_machinery],[created_at],[updated_at])
VALUES (15,'Aenean Sed Pede LLP','Luctus Aliquet Odio Foundation','egestas','magnis','05/05/2018','03/04/2019');

-- base_Area
DBCC CHECKIDENT ([base_Area], RESEED, 1);
INSERT INTO [dbo].[base_Area]([department_id] ,[name],[description],[created_at],[updated_at])
 VALUES(9,'sit','pede, ultrices a, auctor','11/16/2018','02/02/2020');
INSERT INTO [dbo].[base_Area]([department_id] ,[name],[description],[created_at],[updated_at])
 VALUES(9,'eu','adipiscing fringilla, porttitor vulputate,','07/20/2018','04/14/2018');
INSERT INTO [dbo].[base_Area]([department_id] ,[name],[description],[created_at],[updated_at])
 VALUES(3,'commodo','Donec at arcu. Vestibulum','12/09/2019','02/12/2019');
INSERT INTO [dbo].[base_Area]([department_id] ,[name],[description],[created_at],[updated_at])
 VALUES(5,'dapibus','in faucibus orci luctus','03/07/2018','08/29/2018');
INSERT INTO [dbo].[base_Area]([department_id] ,[name],[description],[created_at],[updated_at])
 VALUES(9,'et','convallis est, vitae sodales','10/15/2019','03/14/2018');
INSERT INTO [dbo].[base_Area]([department_id] ,[name],[description],[created_at],[updated_at])
 VALUES(3,'enim,','Morbi metus. Vivamus euismod','01/28/2020','10/16/2019');
INSERT INTO [dbo].[base_Area]([department_id] ,[name],[description],[created_at],[updated_at])
 VALUES(2,'imperdiet','enim non nisi. Aenean','01/15/2019','04/28/2018');
INSERT INTO [dbo].[base_Area]([department_id] ,[name],[description],[created_at],[updated_at])
 VALUES(8,'ullamcorper','pellentesque, tellus sem mollis','11/21/2019','01/13/2019');
INSERT INTO [dbo].[base_Area]([department_id] ,[name],[description],[created_at],[updated_at])
 VALUES(5,'sed','tellus. Nunc lectus pede,','08/05/2019','01/31/2019');
INSERT INTO [dbo].[base_Area]([department_id] ,[name],[description],[created_at],[updated_at])
 VALUES(2,'tristique','pharetra nibh. Aliquam ornare,','09/09/2018','11/07/2018');


-- base_Position
DBCC CHECKIDENT ([base_Position], RESEED, 1);
INSERT INTO [dbo].[base_Position]([name],[description],[created_at],[updated_at])
VALUES('elit.','Pellentesque habitant morbi','9','9');
INSERT INTO [dbo].[base_Position]([name],[description],[created_at],[updated_at])
VALUES('sagittis','magna. Cras convallis','1','8');
INSERT INTO [dbo].[base_Position]([name],[description],[created_at],[updated_at])
VALUES('consectetuer','lacus. Nulla tincidunt,','8','9');
INSERT INTO [dbo].[base_Position]([name],[description],[created_at],[updated_at])
VALUES('vulputate,','Nam ligula elit,','9','9');
INSERT INTO [dbo].[base_Position]([name],[description],[created_at],[updated_at])
VALUES('massa','id, mollis nec,','8','9');
INSERT INTO [dbo].[base_Position]([name],[description],[created_at],[updated_at])
VALUES('in','fermentum fermentum arcu.','7','9');
INSERT INTO [dbo].[base_Position]([name],[description],[created_at],[updated_at])
VALUES('magna.','interdum. Nunc sollicitudin','6','0');
INSERT INTO [dbo].[base_Position]([name],[description],[created_at],[updated_at])
VALUES('viverra.','nisl arcu iaculis','8','8');
INSERT INTO [dbo].[base_Position]([name],[description],[created_at],[updated_at])
VALUES('eget,','ac, feugiat non,','1','9');

-- base_Area_Position
DBCC CHECKIDENT ([base_Area_Position], RESEED, 1);
INSERT INTO [dbo].[base_Area_Position]([area_id],[position_id],[created_at],[updated_at])
 VALUES(1,3,'mauris','12/26/2019','03/08/2018');
INSERT INTO [dbo].[base_Area_Position]([area_id],[position_id],[created_at],[updated_at])
 VALUES(2,2,'mauris','03/24/2019','06/20/2018');
INSERT INTO [dbo].[base_Area_Position]([area_id],[position_id],[created_at],[updated_at])
 VALUES(3,5,'erat','07/11/2018','02/06/2020');
INSERT INTO [dbo].[base_Area_Position]([area_id],[position_id],[created_at],[updated_at])
 VALUES(4,3,'pede,','02/24/2018','05/12/2018');
INSERT INTO [dbo].[base_Area_Position]([area_id],[position_id],[created_at],[updated_at])
 VALUES(5,7,'ac','02/20/2018','05/02/2019');
INSERT INTO [dbo].[base_Area_Position]([area_id],[position_id],[created_at],[updated_at])
 VALUES(6,2,'mauris','04/15/2018','04/24/2019');
INSERT INTO [dbo].[base_Area_Position]([area_id],[position_id],[created_at],[updated_at])
 VALUES(7,9,'ante','05/18/2019','11/12/2019');
INSERT INTO [dbo].[base_Area_Position]([area_id],[position_id],[created_at],[updated_at])
 VALUES(8,8,'augue,','02/23/2019','12/28/2019');
INSERT INTO [dbo].[base_Area_Position]([area_id],[position_id],[created_at],[updated_at])
 VALUES(9,2,'enim.','03/15/2018','02/11/2019');
INSERT INTO [dbo].[base_Area_Position]([area_id],[position_id],[created_at],[updated_at])
 VALUES(10,4,'lectus','12/20/2018','01/06/2020');


--- Role
DBCC CHECKIDENT ([base_Role], RESEED, 1);
INSERT INTO [dbo].[base_Role]([role_name],[description],[created_at],[updated_at])
VALUES('Proin','accumsan convallis, ante lectus convallis est, vitae sodales nisi magna','01/26/2020','07/24/2018');
INSERT INTO [dbo].[base_Role]([role_name],[description],[created_at],[updated_at])
VALUES('Nullam','nunc. In at pede. Cras vulputate velit eu sem. Pellentesque','10/31/2019','04/27/2018');
INSERT INTO [dbo].[base_Role]([role_name],[description],[created_at],[updated_at])
VALUES('dis','elit, pellentesque a, facilisis non, bibendum sed, est. Nunc laoreet','01/31/2019','03/10/2019');
INSERT INTO [dbo].[base_Role]([role_name],[description],[created_at],[updated_at])
VALUES('dolor','Etiam vestibulum massa rutrum magna. Cras convallis convallis dolor. Quisque','10/16/2019','08/16/2019');
INSERT INTO [dbo].[base_Role]([role_name],[description],[created_at],[updated_at])
VALUES('aliquam','nunc. Quisque ornare tortor at risus. Nunc ac sem ut','11/09/2018','02/12/2018');
INSERT INTO [dbo].[base_Role]([role_name],[description],[created_at],[updated_at])
VALUES('mauris','Curae; Phasellus ornare. Fusce mollis. Duis sit amet diam eu','01/11/2019','12/06/2018');
INSERT INTO [dbo].[base_Role]([role_name],[description],[created_at],[updated_at])
VALUES('Proin','magna sed dui. Fusce aliquam, enim nec tempus scelerisque, lorem','09/26/2018','07/08/2018');
INSERT INTO [dbo].[base_Role]([role_name],[description],[created_at],[updated_at])
VALUES('consectetuer','Morbi quis urna. Nunc quis arcu vel quam dignissim pharetra.','07/01/2018','09/25/2019');


--base_Person_Role
DBCC CHECKIDENT ([base_Person_Role], RESEED, 1);
INSERT INTO [dbo].[base_Person_Role]([person_id],[role_id],[created_at],[updated_at])
 VALUES(1,1,'2','2');
INSERT INTO [dbo].[base_Person_Role]([person_id],[role_id],[created_at],[updated_at])
 VALUES(2,5,'2','9');
INSERT INTO [dbo].[base_Person_Role]([person_id],[role_id],[created_at],[updated_at])
 VALUES(3,6,'2','9');
INSERT INTO [dbo].[base_Person_Role]([person_id],[role_id],[created_at],[updated_at])
 VALUES(4,6,'2','9');
INSERT INTO [dbo].[base_Person_Role]([person_id],[role_id],[created_at],[updated_at])
 VALUES(5,10,'2','8');
INSERT INTO [dbo].[base_Person_Role]([person_id],[role_id],[created_at],[updated_at])
 VALUES(6,2,'9','0');
INSERT INTO [dbo].[base_Person_Role]([person_id],[role_id],[created_at],[updated_at])
 VALUES(7,10,'8','0');
INSERT INTO [dbo].[base_Person_Role]([person_id],[role_id],[created_at],[updated_at])
 VALUES(8,5,'2','9');
INSERT INTO [dbo].[base_Person_Role]([person_id],[role_id],[created_at],[updated_at])
 VALUES(9,10,'9','8');
INSERT INTO [dbo].[base_Person_Role]([person_id],[role_id],[created_at],[updated_at])
 VALUES(10,7,'9','9');

-- base_Accident_type

DBCC CHECKIDENT ([base_Accident_type], RESEED, 1);
INSERT INTO [dbo].[base_Accident_type]([description],[created_at],[updated_at])
VALUES('Nam interdum enim non','03/04/2019','08/26/2019');
INSERT INTO [dbo].[base_Accident_type]([description],[created_at],[updated_at])
VALUES('feugiat. Lorem ipsum dolor','12/13/2019','07/07/2019');
INSERT INTO [dbo].[base_Accident_type]([description],[created_at],[updated_at])
VALUES('libero nec ligula consectetuer','11/25/2018','11/03/2018');
INSERT INTO [dbo].[base_Accident_type]([description],[created_at],[updated_at])
VALUES('eget, venenatis a, magna.','11/16/2019','04/27/2019');
INSERT INTO [dbo].[base_Accident_type]([description],[created_at],[updated_at])
VALUES('tellus. Nunc lectus pede,','01/13/2019','02/20/2018');
INSERT INTO [dbo].[base_Accident_type]([description],[created_at],[updated_at])
VALUES('eu, odio. Phasellus at','07/02/2018','08/05/2018');
INSERT INTO [dbo].[base_Accident_type]([description],[created_at],[updated_at])
VALUES('pharetra ut, pharetra sed,','11/30/2019','02/26/2018');
INSERT INTO [dbo].[base_Accident_type]([description],[created_at],[updated_at])
VALUES('turpis non enim. Mauris','07/12/2018','07/12/2019');
INSERT INTO [dbo].[base_Accident_type]([description],[created_at],[updated_at])
VALUES('et malesuada fames ac','06/12/2019','02/01/2020');
INSERT INTO [dbo].[base_Accident_type]([description],[created_at],[updated_at])
VALUES('Cras sed leo. Cras','03/02/2018','11/27/2019');

-- base_Accident
DBCC CHECKIDENT ([base_Accident], RESEED, 1);
INSERT INTO [dbo].[base_Accident]([employee_id],[accident_type_id],[cause],[date_init],[start_lost_time],[end_lost_time],[day_lost],[severity],[turn],[created_at],[updated_at])
VALUES (1,4,'libero','10/04/2019','12/19/2018','12/17/2018',1,'vulputate, lacus.','sapien, cursus','09/29/2019','02/19/2019');
