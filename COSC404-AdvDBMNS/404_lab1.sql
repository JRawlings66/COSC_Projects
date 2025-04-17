--EXERCISE 1
CREATE OR REPLACE TABLE L1_DEPARTMENTS (
    id NUMBER NOT NULL,
    mgr_ID NUMBER,
    div_ID NUMBER,
    room NUMBER,
    bldg_CODE NUMBER,
    CONSTRAINT LAB1_dep_pk PRIMARY KEY(id),
    CONSTRAINT LAB1_dep_fk1 FOREIGN KEY(mgr_id) REFERENCES L1_EMPLOYEES(id),
    CONSTRAINT LAB1_dep_fk2 FOREIGN KEY(div_id) REFERENCES L1_DIVISIONS(id),
    CONSTRAINT LAB1_dep_fk3 FOREIGN KEY(room, bldg_code) REFERENCES L1_ROOMS(room_no, bldg_code),
    CONSTRAINT LAB1_dep_fk4 FOREIGN KEY(bldg_code) REFERENCES L1_BUILDINGS(code)
);

CREATE OR REPLACE TABLE L1_DIVISIONS (
    id NUMBER NOT NULL,
    div_name VARCHAR2(20),
    bldg_Code NUMBER,
    director_ID NUMBER,
    CONSTRAINT LAB1_DIV_pk PRIMARY KEY(id),
    CONSTRAINT LAB1_div_fk1 FOREIGN KEY(bldg_code) REFERENCES L1_BUILDINGS(code),
    CONSTRAINT LAB1_div_fk2 FOREIGN KEY(director_id) REFERENCES L1_EMPLOYEES(id)
);

CREATE OR REPLACE TABLE L1_ROOMS (
    room_no NUMBER NOT NULL,
    bldg_Code NUMBER NOT NULL,
    status CHAR(1),
    area NUMBER,
    CONSTRAINT LAB1_room_pk PRIMARY KEY(room_no, bldg_code)
);

CREATE OR REPLACE TABLE L1_BUILDINGS (
    code NUMBER NOT NULL,
    bldg_name VARCHAR2(12),
    campus VARCHAR2(20),
    CONSTRAINT LAB1_BUILDINGS_pk PRIMARY KEY(CODE)
);

CREATE OR REPLACE TABLE L1_EMPLOYEES (
    id NUMBER NOT NULL,
    name VARCHAR2(20),
    position VARCHAR2(20),
    dept_id NUMBER,
    CONSTRAINT LAB1_EMP_pk PRIMARY KEY(id),
    CONSTRAINT LAB1_EMP_fk FOREIGN KEY(dept_id) REFERENCES L1_DEPARTMENTS(id)
);

--EXERCISE 2: 

CREATE OR REPLACE VIEW LAB1_A AS
SELECT 
    div.id,
    div.div_name,
    COUNT(b.campus) AS num_of_campuses,
    COUNT(dep.div_id) AS num_of_depts
FROM L1_DIVISIONS div 
JOIN L1_BUILDINGS b ON div.bldg_code 
JOIN L1_DEPARTMENTS dep ON div.id = dep.div_id
GROUP BY div.id, div.div_name;

CREATE OR REPLACE VIEW LAB1_B
SELECT b.bldg_name BUILDING_NAME, b.campus CAMPUS, COUNT(r.room_no) AS ROOMS, 
       SUM(DECODE(r.status, 'U', r.area * 0.09290304, 0)) AS UNOCCUPIED,
       SUM(DECODE(r.status, 'L', r.area * 0.09290304, 'T', r.area * 0.09290304, 0)) AS LAB_AND_TECH,
       SUM(DECODE(r.status, 'U', (SELECT SUM(area) FROM L1_ROOMS WHERE room_no LIKE '2%') * 0.09290304, 0) AS UNOCCUPIED_2ND
FROM L1_BUILDINGS b
JOIN L1_ROOMS r ON b.code = r.bldg_code
GROUP BY b.name;

--EXERCISE 3:

UPDATE L1_ROOMS
SET room_no = 'G'+substring(room_no, 1, 1)
WHERE room_no LIKE '1%' AND
      bldg_code IN (SELECT code FROM L1_BUILDINGS WHERE campus = 'East' OR campus = 'West');