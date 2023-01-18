CREATE SCHEMA "Employee";

CREATE TABLE "Employee"."Account" (
  "ID" int PRIMARY KEY,
  "EUser_ID" int UNIQUE NOT NULL,
  "First_Name" varcharacter(20),
  "Last_Name" varchar(20),
  "EMail" email(30),
  "EAge" int(2),
  "Esalary" int(8),
  "Title" varchar(SelectOption),
  "Edepartment" varchar(SelectOption),
  "BirthDate" datetime,
  "HireDate" datetime,
  "Address" varchar(60),
  "City" varchar(20),
  "Region" varchar(15),
  "Postalcode" int(10),
  "country" varchar(SelectOption),
  "PhonoNumber" int(11),
  "HomePhone" int(11),
  "Photo" image,
  "NidNumber" int(20),
  "ESupervisor" varchar(SelectOption),
  "Notes" text,
  "BankName" varchar(50),
  "BankAccNo" int(24)
);

CREATE TABLE "Employee"."DutyDuration" (
  "ID" int PRIMARY KEY,
  "EDuty_ID" int UNIQUE NOT NULL,
  "DDate" datetime,
  "DFromStartTime" timetz,
  "DToEndTime" timetz,
  "DutyDuration" int(2),
  "DStatus" varchar(20)
);

CREATE TABLE "Employee"."Attendance" (
  "ID" int PRIMARY KEY,
  "EAttendance_ID" int UNIQUE NOT NULL,
  "EUser_ID" int UNIQUE NOT NULL,
  "EDuty_ID" int UNIQUE NOT NULL,
  "ADate" datetime,
  "AStatus" varchar
);

CREATE TABLE "Employee"."LeaveApply" (
  "ID" int PRIMARY KEY,
  "ELeaveApply_ID" int UNIQUE NOT NULL,
  "ELeaveBlance_ID" int UNIQUE NOT NULL,
  "ETypeofLeave_ID" int UNIQUE NOT NULL,
  "L_From_Start_Date" datetime,
  "L_To_End_Date" datetime,
  "L_Total_Day" int,
  "L_Apply_Date" datetime,
  "LStatus" varchar,
  "L_Other_Details" text
);

CREATE TABLE "Employee"."TypesOfLeave" (
  "ID" int PRIMARY KEY,
  "ETypeofLeave_ID" int UNIQUE NOT NULL,
  "L_Category_Type" varchar(SelectOption),
  "Types_of_Leave" varchar(SelectOption),
  "Type_of_LeaveDescription" text
);

CREATE TABLE "Employee"."LeaveBlance" (
  "ID" int PRIMARY KEY,
  "ELeaveBlance_ID" int UNIQUE NOT NULL,
  "EAttendance_ID" int UNIQUE NOT NULL,
  "Total_Attendance" int,
  "Applicable_Leave" int,
  "Approved_Leave" int,
  "Available_Leave" int
);

ALTER TABLE "Employee"."DutyDuration" ADD FOREIGN KEY ("EDuty_ID") REFERENCES "Employee"."Attendance" ("EDuty_ID");

ALTER TABLE "Employee"."Attendance" ADD FOREIGN KEY ("EAttendance_ID") REFERENCES "Employee"."LeaveBlance" ("EAttendance_ID");

ALTER TABLE "Employee"."Attendance" ADD FOREIGN KEY ("EUser_ID") REFERENCES "Employee"."Account" ("EUser_ID");

ALTER TABLE "Employee"."LeaveApply" ADD FOREIGN KEY ("ELeaveBlance_ID") REFERENCES "Employee"."LeaveBlance" ("ELeaveBlance_ID");

ALTER TABLE "Employee"."TypesOfLeave" ADD FOREIGN KEY ("ETypeofLeave_ID") REFERENCES "Employee"."LeaveApply" ("ETypeofLeave_ID");
