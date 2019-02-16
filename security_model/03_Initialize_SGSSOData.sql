USE [SGSSODATA]
GO
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN TRANSACTION;

PRINT 'Insert data into the base_Role table...';
SET IDENTITY_INSERT dbo.base_Role ON
INSERT INTO dbo.base_Role (role_id, role_name, description)
VALUES (1, 'Administrator', 'Management of System');
INSERT INTO dbo.base_Role (role_id, role_name, description)
VALUES (2, 'RRHH', 'Management of personal of the company');
INSERT INTO dbo.base_Role (role_id, role_name, description)
VALUES (3, 'Department boss', 'Management of Department');
SET IDENTITY_INSERT dbo.base_Role OFF
PRINT 'base_Role table done...';

PRINT 'Insert data into the base_Department table...';
SET IDENTITY_INSERT dbo.base_Department ON
INSERT INTO dbo.base_Department (department_id, name, description)
VALUES (1, 'Management', 'Management of company');
INSERT INTO dbo.base_Department (department_id, name, description)
VALUES (2, 'Administration Department', 'Management of employees');
INSERT INTO dbo.base_Department (department_id, name, description)
VALUES (3, 'Security and Health Department', 'Management of Security of the employees');
INSERT INTO dbo.base_Department (department_id, name, description)
VALUES (4, 'Technical Department', 'Management of projects');
SET IDENTITY_INSERT dbo.base_Department OFF
PRINT 'base_Department table done...';

PRINT 'Insert data into the base_Area table...';
SET IDENTITY_INSERT dbo.base_Area ON
INSERT INTO dbo.base_Area (area_id, department_id, name, description)
VALUES (1, 2, 'Human Resources', 'Management of employees');
INSERT INTO dbo.base_Area (area_id, department_id, name, description)
VALUES (2, 2, 'Accounting and Finance', 'Management of the part accountant');
INSERT INTO dbo.base_Area (area_id, department_id, name, description)
VALUES (3, 2, 'Control of works', 'Management of Works');
INSERT INTO dbo.base_Area (area_id, department_id, name, description)
VALUES (4, 3, 'Prevention', 'Management of accidents');
INSERT INTO dbo.base_Area (area_id, department_id, name, description)
VALUES (5, 3, 'Training', 'Management of training to personnel');
INSERT INTO dbo.base_Area (area_id, department_id, name, description)
VALUES (6, 4, 'Project management', 'Management of differents projects');
SET IDENTITY_INSERT dbo.base_Area OFF
PRINT 'base_Area table done...';


PRINT 'Insert data into the base_Position table...';
SET IDENTITY_INSERT dbo.base_Position ON
INSERT INTO dbo.base_Position (position_id, name, description)
VALUES (1, 'Responsable', 'Boss of Area');
INSERT INTO dbo.base_Position (position_id, name, description)
VALUES (2, 'dbo.base_Employee', 'dbo.base_Employee that work in the company');
INSERT INTO dbo.base_Position (position_id, name, description)
VALUES (3, 'Architect', 'Manager of Works');
SET IDENTITY_INSERT dbo.base_Position OFF
PRINT 'base_Position table done...';

PRINT 'Insert data into the base_Person table...';
SET IDENTITY_INSERT dbo.base_Person ON
INSERT INTO dbo.base_Person (person_id, first_name, last_name, email)
VALUES (1, 'Manuel', 'Salvatierra', 'manuel@gmail.com');
INSERT INTO dbo.base_Person (person_id, first_name, last_name, email)
VALUES (2, 'Cecilia', 'Cortez', 'cecilia@gmail.com');
INSERT INTO dbo.base_Person (person_id, first_name, last_name, email)
VALUES (3, 'Daniel', 'Perez', 'daniel@gmail.com');
INSERT INTO dbo.base_Person (person_id, first_name, last_name, email)
VALUES (4, 'Juan', 'Soliz', 'juan@gmail.com');
SET IDENTITY_INSERT dbo.base_Person OFF
PRINT 'base_Person table done...';

PRINT 'Insert data into the base_Person_Role table...';
INSERT INTO dbo.base_Person_Role (person_id, role_id)
VALUES (1, 1);
INSERT INTO dbo.base_Person_Role (person_id, role_id)
VALUES (2, 2);
INSERT INTO dbo.base_Person_Role (person_id, role_id)
VALUES (3, 3);
PRINT 'base_Person_Role table done...';

PRINT 'Insert data into the dbo.base_Account table...';
SET IDENTITY_INSERT dbo.base_Account ON
INSERT INTO dbo.base_Account (account_id, person_id, password)
VALUES (1, 1, ENCRYPTBYPASSPHRASE('password','12345'));
INSERT INTO dbo.base_Account (account_id, person_id, password)
VALUES (2, 2, ENCRYPTBYPASSPHRASE('password','67890'));
INSERT INTO dbo.base_Account (account_id, person_id, password)
VALUES (3, 3, ENCRYPTBYPASSPHRASE('password','34567'));
SET IDENTITY_INSERT dbo.base_Account OFF
PRINT 'dbo.base_Account table done...';

PRINT 'Insert data into the dbo.base_Employee table...';
SET IDENTITY_INSERT dbo.base_Employee ON
INSERT INTO dbo.base_Employee (employee_id, person_id, ci, address, birth_date, gender, phone_number, picture)
VALUES (1, 2, 4456656, 'Av. Panamericana', 01-03-1985, 'Female', 72234334, null);
INSERT INTO dbo.base_Employee (employee_id, person_id, ci, address, birth_date, gender, phone_number, picture)
VALUES (2, 3, 667878, 'Av. Siles', 01-03-1990, 'Male', 74444555, null);
INSERT INTO dbo.base_Employee (employee_id, person_id, ci, address, birth_date, gender, phone_number, picture)
VALUES (3, 4, 4456656, 'Av. Aroma', 01-03-1980, 'Male', 7554456, null);
SET IDENTITY_INSERT dbo.base_Employee OFF
PRINT 'dbo.base_Employee table done...';

PRINT 'Insert data into the base_Area_Position table...';
SET IDENTITY_INSERT dbo.base_Area_Position ON
INSERT INTO dbo.base_Area_Position (area_position_id, area_id, position_id)
VALUES (1, 1, 1);
INSERT INTO dbo.base_Area_Position (area_position_id, area_id, position_id)
VALUES (2, 6, 3);
INSERT INTO dbo.base_Area_Position (area_position_id, area_id, position_id)
VALUES (3, 6, 2);
SET IDENTITY_INSERT dbo.base_Area_Position OFF
PRINT 'base_Area_Position table done...';

PRINT 'Insert data into the base_Contract table...';
SET IDENTITY_INSERT dbo.base_Contract ON
INSERT INTO dbo.base_Contract (contract_id, employee_id, area_position_id, salary, init_date, end_date, employee_type)
VALUES (1, 1, 1, 5000, 01-03-2017, null, 'Complete');
INSERT INTO dbo.base_Contract (contract_id, employee_id, area_position_id, salary, init_date, end_date, employee_type)
VALUES (2, 2, 2, 6000, 01-03-2015, null, 'Complete');
INSERT INTO dbo.base_Contract (contract_id, employee_id, area_position_id, salary, init_date, end_date, employee_type)
VALUES (3, 3, 3, 2500, 01-03-2018, null, 'Parcial');
SET IDENTITY_INSERT dbo.base_Contract OFF
PRINT 'base_Contract table done...';

PRINT 'Insert data into the base_Accident_Type table...';
SET IDENTITY_INSERT dbo.base_Accident_Type ON
INSERT INTO dbo.base_Accident_Type (accident_type_id, description)
VALUES (1, 'Mild');
INSERT INTO dbo.base_Accident_Type (accident_type_id, description)
VALUES (2, 'Serious');
INSERT INTO dbo.base_Accident_Type (accident_type_id, description)
VALUES (3, 'Very Serious');
SET IDENTITY_INSERT dbo.base_Accident_Type OFF
PRINT 'base_Accident_Type table done...';

PRINT 'Insert data into the base_Machinery table...';
SET IDENTITY_INSERT dbo.base_Machinery ON
INSERT INTO dbo.base_Machinery (machinery_id, name_machinery, brand_machinery, model_machinery, state_machinery)
VALUES (1, 'Mixer', 'Volvo', 'Model 2000', 'New');
INSERT INTO dbo.base_Machinery (machinery_id, name_machinery, brand_machinery, model_machinery, state_machinery)
VALUES (2, 'Tractor', 'Volvo', 'Model 1994', 'Ancient');
INSERT INTO dbo.base_Machinery (machinery_id, name_machinery, brand_machinery, model_machinery, state_machinery)
VALUES (3, 'Excavator', 'Volvo', 'Model 1998', 'Ancient');
INSERT INTO dbo.base_Machinery (machinery_id, name_machinery, brand_machinery, model_machinery, state_machinery)
VALUES (4, 'Backhoe', 'Volvo', 'Model 2018', 'New');
INSERT INTO dbo.base_Machinery (machinery_id, name_machinery, brand_machinery, model_machinery, state_machinery)
VALUES (5, 'Compactor', 'Volvo', 'Model 2000', 'Semi New');
INSERT INTO dbo.base_Machinery (machinery_id, name_machinery, brand_machinery, model_machinery, state_machinery)
VALUES (6, 'Dump trucks', 'Volvo', 'Model 2008', 'Semi New');
SET IDENTITY_INSERT dbo.base_Machinery OFF
PRINT 'base_Machinery table done...';

PRINT 'Insert data into the base_Item_Equipment table...';
SET IDENTITY_INSERT dbo.base_Item_Equipment ON
INSERT INTO dbo.base_Item_Equipment (item_equipment_id, name_equipment, description, acquisition_date)
VALUES (1, 'Gloves', 'Gloves', 01-03-2017);
INSERT INTO dbo.base_Item_Equipment (item_equipment_id, name_equipment, description, acquisition_date)
VALUES (2, 'Helmet', 'Helmet', 01-03-2017);
INSERT INTO dbo.base_Item_Equipment (item_equipment_id, name_equipment, description, acquisition_date)
VALUES (3, 'Overalls', 'Overalls', 01-03-2017);
INSERT INTO dbo.base_Item_Equipment (item_equipment_id, name_equipment, description, acquisition_date)
VALUES (4, 'Boots', 'Boots', 01-03-2017);
INSERT INTO dbo.base_Item_Equipment (item_equipment_id, name_equipment, description, acquisition_date)
VALUES (5, 'Safety glasses', 'Safety glasses', 01-03-2017);
INSERT INTO dbo.base_Item_Equipment (item_equipment_id, name_equipment, description, acquisition_date)
VALUES (6, 'safety harness', 'safety harness', 01-03-2017);
INSERT INTO dbo.base_Item_Equipment (item_equipment_id, name_equipment, description, acquisition_date)
VALUES (7, 'shovel', 'shovel', 01-03-2017);
INSERT INTO dbo.base_Item_Equipment (item_equipment_id, name_equipment, description, acquisition_date)
VALUES (8, 'pillory', 'pillory', 01-03-2017);
INSERT INTO dbo.base_Item_Equipment (item_equipment_id, name_equipment, description, acquisition_date)
VALUES (9, 'hammer', 'hammer', 01-03-2017);
INSERT INTO dbo.base_Item_Equipment (item_equipment_id, name_equipment, description, acquisition_date)
VALUES (10, 'screwdriver', 'screwdriver', 01-03-2017);
INSERT INTO dbo.base_Item_Equipment (item_equipment_id, name_equipment, description, acquisition_date)
VALUES (11, 'measuring tape', 'measuring tape', 01-03-2017);
SET IDENTITY_INSERT dbo.base_Item_Equipment OFF
PRINT 'base_Item_Equipment table done...';

COMMIT TRANSACTION;