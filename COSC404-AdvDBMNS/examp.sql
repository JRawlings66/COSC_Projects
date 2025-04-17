set SERVEROUTPUT ON
Drop Table sections; Drop Table teachers; Drop TABLE Sections_Log; Drop TABLE Sections_Log2;
CREATE TABLE teachers(ID NUMBER PRIMARY KEY, name VARCHAR2(10),
                      dept VARCHAR2(4));
CREATE TABLE sections(crs_ID VARCHAR2(7), section VARCHAR2(3),
                      tchr_ID NUMBER, stu_count NUMBER, TLU NUMBER);
ALTER TABLE sections ADD CONSTRAINT sections_PK PRIMARY KEY(crs_ID, section);
ALTER TABLE sections ADD CONSTRAINT sections_FK 
FOREIGN KEY(tchr_ID) REFERENCES teachers(ID);
CREATE TABLE Sections_Log(userName VARCHAR2(10), Change_Date DATE);
CREATE TABLE Sections_Log2(userName VARCHAR2(10), Change_Date DATE, tchr_ID NUMBER, 
                           crs_ID VARCHAR2(7),    section VARCHAR2(3));
INSERT INTO teachers VALUES(100, 'Ken', 'COSC');
INSERT INTO teachers VALUES(101, 'Jim', 'COSC');
INSERT INTO teachers VALUES(102, 'Joe', 'MATH');
INSERT INTO teachers VALUES(105, 'Michael', 'CMNS');
INSERT INTO teachers VALUES(103, 'Deb', 'COSC');
INSERT INTO teachers VALUES(104, 'Dan', 'COSC');
INSERT INTO teachers VALUES(106, 'Scott', 'MATH');

INSERT INTO sections VALUES('COSC111', '001', 100, 40, 1.3333);
INSERT INTO sections VALUES('COSC111', '002', 100, 39, 1.3333);
INSERT INTO sections VALUES('COSC111', 'L01', 100, 45, 0.3333);
INSERT INTO sections VALUES('COSC111', 'L02', 100, 27, 0.3333);
INSERT INTO sections VALUES('COSC111', 'L03', 100, 45, 0.3333);
INSERT INTO sections VALUES('COSC111', 'L04', 100, 27, 0.3333);
INSERT INTO sections VALUES('MATH139', '001', 102, 38, 1);
INSERT INTO sections VALUES('MATH139', '002', 106, 34, 1);
INSERT INTO sections VALUES('CMNS113', '001', 105, 36, 1);
INSERT INTO sections VALUES('CMNS113', '002', 105, 33, 1);
INSERT INTO sections VALUES('COSC213', '004', 104, 45, 1);
INSERT INTO sections VALUES('COSC222', '001', 101, 35, 1);
INSERT INTO sections VALUES('COSC222', '002', 101, 44, 1);
INSERT INTO sections VALUES('COSC222', 'L01', 101, 20, 0.3333);
INSERT INTO sections VALUES('COSC222', 'L02', 101, 20, 0.3333);
INSERT INTO sections VALUES('COSC222', 'L03', 101, 20, 0.3333);
INSERT INTO sections VALUES('COSC222', 'L04', 101, 19, 0.3333);
INSERT INTO sections VALUES('COSC236', '001', 104, 45, 1);