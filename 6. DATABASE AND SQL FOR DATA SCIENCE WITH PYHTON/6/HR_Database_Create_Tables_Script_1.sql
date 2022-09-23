------------------------------------------
--DDL statement for table 'HR' database--
--------------------------------------------

-- Drop the tables in case they exist

DROP TABLE EMPLOYEES;
DROP TABLE JOB_HISTORY;
DROP TABLE JOBS;
DROP TABLE DEPARTMENTS;
DROP TABLE LOCATIONS;

-- Create the tables

CREATE TABLE EMPLOYEES (
                          EMP_ID CHAR(9) NOT NULL,
                          F_NAME VARCHAR(15) NOT NULL,
                          L_NAME VARCHAR(15) NOT NULL,
                          SSN CHAR(9),
                          B_DATE DATE,
                          SEX CHAR,
                          ADDRESS VARCHAR(30),
                          JOB_ID CHAR(9),
                          SALARY DECIMAL(10,2),
                          MANAGER_ID CHAR(9),
                          DEP_ID CHAR(9) NOT NULL,
                          PRIMARY KEY (EMP_ID)
                        );

CREATE TABLE JOB_HISTORY (
                            EMPL_ID CHAR(9) NOT NULL,
                            START_DATE DATE,
                            JOBS_ID CHAR(9) NOT NULL,
                            DEPT_ID CHAR(9),
                            PRIMARY KEY (EMPL_ID,JOBS_ID)
                          );

CREATE TABLE JOBS (
                    JOB_IDENT CHAR(9) NOT NULL,
                    JOB_TITLE VARCHAR(30) ,
                    MIN_SALARY DECIMAL(10,2),
                    MAX_SALARY DECIMAL(10,2),
                    PRIMARY KEY (JOB_IDENT)
                  );

CREATE TABLE DEPARTMENTS (
                            DEPT_ID_DEP CHAR(9) NOT NULL,
                            DEP_NAME VARCHAR(15) ,
                            MANAGER_ID CHAR(9),
                            LOC_ID CHAR(9),
                            PRIMARY KEY (DEPT_ID_DEP)
                          );

CREATE TABLE LOCATIONS (
                          LOCT_ID CHAR(9) NOT NULL,
                          DEP_ID_LOC CHAR(9) NOT NULL,
                          PRIMARY KEY (LOCT_ID,DEP_ID_LOC)
                        );
select * from CHICAGOCRIMEDATA;

SELECT CS.NAME_OF_SCHOOL, CS.COMMUNITY_AREA_NAME, CS.AVERAGE_STUDENT_ATTENDANCE as AVERAGE_OF_ATTENDANCE 
    FROM CHICAGOCENSUSDATA CD LEFT OUTER JOIN CHICAGOPUBLICSCHOOLS CS ON 
    CD.COMMUNITY_AREA_NUMBER=CS.COMMUNITY_AREA_NUMBER WHERE CD.HARDSHIP_INDEX='98';
    
SELECT a.CASE_NUMBER, a.PRIMARY_TYPE, a.COMMUNITY_AREA_NUMBER FROM CHICAGOCRIMEDATA a LEFT JOIN 
   CHICAGOCENSUSDATA b ON a.COMMUNITY_AREA_NUMBER = b.COMMUNITY_AREA_NUMBER WHERE a.LOCATION_DESCRIPTION LIKE '%SCHOOL%';