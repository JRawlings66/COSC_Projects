
DECLARE
  TYPE D_RecordType IS RECORD (ID    L4_Departments.ID%TYPE,
                               DName L4_Departments.name%TYPE);
  v_DeptRec  D_RecordType;v_BCODE L4_Buildings.Code%TYPE := 'MSL';

  CURSOR c_department IS SELECT ID, name
                         FROM L4_Departments
                         WHERE bldg_code = v_BCODE;
BEGIN
  dbms_output.put_line('Departments in the '||v_BCODE||' building.');
  OPEN c_department;

  LOOP
    FETCH c_department INTO v_DeptRec;
    EXIT WHEN c_department%NOTFOUND;
    dbms_output.put_line(c_department%ROWCOUNT || '. ' ||
                         v_DeptRec.ID || ' - ' || v_DeptRec.DName);
  END LOOP;

  CLOSE c_department;
END;