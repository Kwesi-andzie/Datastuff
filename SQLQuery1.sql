---Create Clinic_DB;
CREATE Database Clinic_DB;

---Patient ---Patient_id, name, DOB, Address, SSN, Phone, Gender
---Physician ---physician_id, name, dob, speciality, address, ssn, phone number, Gender
---Diagnosis ---diag_id,diag_type
---Episode_of_Care---Epi_Id, Date_time_of_epi, Duration_epi, Attn_phys_id, Pat_Id
---Claims---Clm_id, Pat_id,Charge_amount, Copay_Amount, Clm_date, Clm_type

USE Clinic_DB;
---Creating Patient table;
CREATE table Patient 
(Pat_ID NCHAR(4) NOT NULL ,
Name NVARCHAR (60) NOT NULL,
DOB Date NOT NULL,
Address NVARCHAR(100) NOT NULL,
SSN NCHAR(9) NOT NULL,
Phone NCHAR(12) NULL,
Gender CHAR(1) NOT NULL
);




---Modify Table to add primary key constraints;
ALTER table Patient
ADD Constraint PK_Patient_Pat_ID PRIMARY KEY(Pat_ID);

---Create Physician Table;
---phys_id, name, dob, speciality, address, ssn, phone number, Gender;


CREATE table Physician 
(Phys_ID NCHAR(4) NOT NULL,
NAME NVARCHAR(60) NOT NULL,
DOB DATE NOT NULL,
SPECIALITY NVARCHAR(30) NOT NULL,
ADDRESS NVARCHAR(100) NOT NULL,
SSN NCHAR(9) NOT NULL,
Phone NCHAR(12) NULL,
Gender CHAR(1) NOT NULL
);

 ---Modify Table to add primary key constraints;
ALTER table Physician
ADD Constraint PK_Physician_Phys_ID PRIMARY KEY(Phys_ID);

---Diagnosis ---diag_id,diag_type,date_of_diag,Phys_ID
CREATE table Diagnosis
(Diag_Id NCHAR(4) NOT NULL,
diag_type NVARCHAR(60) NOT NULL,
date_of_diag DATE NOT NULL,
Phys_ID NCHAR(4) NOT NULL
);

---Modify Table to add primary key constraints;
ALTER table Diagnosis
ADD Constraint PK_Diagnosis_Diag_ID PRIMARY KEY(Diag_ID);


---Modify Table to add foreign key constraints;
ALTER table Diagnosis
ADD Constraint FK_Diagnosis_Phys_ID FOREIGN KEY(Phys_ID)
REFERENCES Physician(Phys_ID);

---modify table to add check constraint
ALTER table physician
ADD Constraint CHK_physician_ssn check(len(ssn) = 9);

ALTER table physician
ADD Constraint CHK_physician_ssn check(age >= 18);


---modify table to add default constraint
ALTER table physician 
ADD Constraint DF_Physician_phone  DEFAULT 'unknown' FOR Phone;
---delete constraint
Alter table physician
DROP Constraint DF_Physician_Phone

---Clustered index 
---nonclustered index 

CREATE CLUSTERED INDEX indx_diag_type ON Diagnosis(Diag_type);

---delete entire record from a table
TRUNCATE TABLE Diagnosis;

---how to increase the size of a table
---modify data_type and width of a column of a table

ALTER table diagnosis
ALTER column diag_type VARCHAR(50) NOT NULL;

---renaming table
 EXECUTE  sp_rename 'patient','patients';

 ---renaming column
 execute sp_rename 'patient.name','pname','column';

 ---inserting record/populating a table;
 INSERT INTO Diagnosis(diag_id,diag_type,date_of_diag,phys_id)
 VALUES('DI121', 'malaria','2020-11-10', 'py01')
       ('DI121', 'Headache','2019-08-10', 'py04')



INSERT INTO Physician(Phys_ID,Name,DOB,SPECIALITY,address,SSN,phone,gender)
VALUES('PY01', 'Paul Mason','1970-11-10','nuerologist','123 nuero street','123456789','443-344-1234','male'),
       ('PY04','Samantha Johnson','1984-08-10', 'cardiologist','244 cardio street','123456789','565-443-1234','Female');


Select * From Diagnosis
Select * From Physician 




---update 



CREATE table Patient1 
(Pat_ID INT IDENTITY(1000,1) NOT NULL ,
Name NVARCHAR (60) NOT NULL,
DOB Date NOT NULL,
Address NVARCHAR(100) NOT NULL,
SSN NCHAR(9) NOT NULL,
Phone NCHAR(12) NULL,
Gender CHAR(1) NOT NULL
);


CREATE table Physician1 
(Phys_ID INT IDENTITY(1000,1) NOT NULL,
NAME NVARCHAR(60) NOT NULL,
DOB DATE NOT NULL,
SPECIALITY NVARCHAR(30) NOT NULL,
ADDRESS NVARCHAR(100) NOT NULL,
SSN NCHAR(9) NOT NULL,
Phone NCHAR(12) NULL,
Gender CHAR(1) NOT NULL
);

INSERT INTO Physician1(Phys_ID,Name,DOB,SPECIALITY,address,SSN,phone,gender)
VALUES( 'PY01','Paul Mason','1970-11-10','nuerologist','123 nuero street','123456789','443-344-1234','male'),
       ('PY04','Samantha Johnson','1984-08-10', 'cardiologist','244 cardio street','123456789','565-443-1234','female');

	   SELECT * FROM Physician1
----update

---DML COMMNANDS
---INSERT,UPDATE,DELETE,LOCK,CALL
UPDATE Physician1
SET NAME = 'PAUL JOHNSON' 
WHERE Phys_ID = 'py01'




---SELECT ---retrieve the data ---list of column names,derived column names (aggregate or non-aggregate
---FROM ---specifies the table in which the data resides 
---WHERE---Filter or do comparison on the original column or the derived non-aggregate columns
---GROUP BY---used to group the original column, derived non aggregate columns in the select lists whenever there is/are derived aggregate columns in the selects lists
---HAVING ---filter or do comparison on the derived aggregate columns
---ORDER BY ---Sorts the retrieved data in ascending or descending order (default is ASC)



----AGGREGATE FUNCTIONS 
--SUM()
--AVG()
---COUNT()
--MAX()
--MIN()



--F(1) = 2*1 + 1 = 3


