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
    FROM CHICAGOCENSUSDATA CD LEFT OUTER JOIN CHICAGOPUBLICSCHOOLS CS ON CD.COMMUNITY_AREA_NUMBER=CS.COMMUNITY_AREA_NUMBER 
    WHERE CD.HARDSHIP_INDEX='98';
    
    

SELECT a.CASE_NUMBER, a.PRIMARY_TYPE, a.COMMUNITY_AREA_NUMBER FROM CHICAGOCRIMEDATA a LEFT JOIN CHICAGOCENSUSDATA b ON 
   a.COMMUNITY_AREA_NUMBER = b.COMMUNITY_AREA_NUMBER WHERE a.LOCATION_DESCRIPTION LIKE '%SCHOOL%';
   
CREATE VIEW PUBLICSCHOOLS (SCHOOL_NAME, SAFETY_RATING, FAMILY_RATING, ENVIRONMENT_RATING, INSTRUCTION_RATING, LEADERS_RATING, TEACHERS_RATING) AS SELECT 
    NAME_OF_SCHOOL, SAFETY_ICON, FAMILY_INVOLVEMENT_ICON, ENVIRONMENT_ICON, INSTRUCTION_ICON, LEADERS_ICON, TEACHERS_ICON FROM CHICAGOPUBLICSCHOOLS;

SELECT SCHOOL_NAME, LEADERS_RATING FROM PUBLICSCHOOLS;

















--#SET TERMINATOR @ 
CREATE OR REPLACE PROCEDURE UPDATE_LEADERS_SCORE (IN in_School_ID INTEGER, IN in_Leader_Score INTEGER) LANGUAGE SQL BEGIN

END
@



--#SET TERMINATOR @ 
CREATE OR REPLACE PROCEDURE UPDATE_LEADERS_SCORE ( IN in_School_ID INTEGER, IN in_Leader_Score INTEGER )

LANGUAGE SQL
MODIFIES SQL DATA

BEGIN UPDATE CHICAGOPUBLICSCHOOLS SET Leaders_Score = in_Leader_Score WHERE SCHOOL_ID = in_School_ID ;

END
@








CREATE OR REPLACE PROCEDURE UPDATE_LEADERS_SCORE ( IN in_School_ID INTEGER, IN in_Leader_Score INTEGER )

LANGUAGE SQL
MODIFIES SQL DATA

BEGIN

UPDATE CHICAGOPUBLICSCHOOLS 
SET Leaders_Score = in_Leader_Score
	WHERE SCHOOL_ID = in_School_ID ;

IF in_Leader_Score > 0 AND in_Leader_Score < 20 THEN
	UPDATE CHICAGOPUBLICSCHOOLS 
    SET Leaders_Icon = 'Very weak'
    WHERE SCHOOL_ID = in_School_ID ;

ELSEIF in_Leader_Score < 40 THEN
	UPDATE CHICAGOPUBLICSCHOOLS 
    SET Leaders_Icon = 'Weak'
    WHERE SCHOOL_ID = in_School_ID ;

ELSEIF in_Leader_Score < 60 THEN
	UPDATE CHICAGOPUBLICSCHOOLS 
    SET Leaders_Icon = 'Average'
    WHERE SCHOOL_ID = in_School_ID ;

ELSEIF in_Leader_Score < 80 THEN
	UPDATE CHICAGOPUBLICSCHOOLS 
    SET Leaders_Icon = 'Strong'
    WHERE SCHOOL_ID = in_School_ID ;

ELSEIF in_Leader_Score < 100 THEN
	UPDATE CHICAGOPUBLICSCHOOLS 
    SET Leaders_Icon = 'Very strong'
    WHERE SCHOOL_ID = in_School_ID ;

END IF;
END @

