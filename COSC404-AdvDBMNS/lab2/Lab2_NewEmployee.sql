CREATE OR REPLACE PROCEDURE Lab2_NewEmployee (
  p_HourlyWage NUMBER,
  p_HoursPerWeek NUMBER,
  p_WarID NUMBER
) IS
  v_next_employee_id NUMBER;
  v_yearly_salary NUMBER;
BEGIN
  -- Determine the next available employee ID
  SELECT NVL(MIN(ID) + 1, 101) INTO v_next_employee_id
  FROM L4_Employees
  WHERE ID NOT IN (102, 103, 104, 105, 106, 107, 108, 109, 110, 120);

  -- Check if the warehouse ID is valid
  BEGIN
    SELECT ID INTO v_next_employee_id
    FROM L4_Warehouses
    WHERE ID = p_WarID;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RAISE_APPLICATION_ERROR(-20001, 'Invalid warehouse ID provided.');
  END;

  -- Calculate yearly salary
  v_yearly_salary := p_HourlyWage * p_HoursPerWeek * 52;

  -- Check if salary is within range
  IF v_yearly_salary > 70000 THEN
    RAISE_APPLICATION_ERROR(-20002, 'Employee is making too much.');
  ELSIF v_yearly_salary < 20000 THEN
    RAISE_APPLICATION_ERROR(-20003, 'Employee is making too little.');
  END IF;

  -- Insert new record
  INSERT INTO L4_Employees (ID, Salary, War_ID)
  VALUES (v_next_employee_id, v_yearly_salary, p_WarID);

  COMMIT;
  
  DBMS_OUTPUT.PUT_LINE('New employee with ID ' || v_next_employee_id || 'and Salary ' || v_yearly_salary || 'inserted successfully.');
EXCEPTION
  WHEN OTHERS THEN
    IF SQLCODE = -20001 THEN
      DBMS_OUTPUT.PUT_LINE('No INSERT occurred - Warehouse id does not exist');
    ELSIF SQLCODE = -20002 THEN
      DBMS_OUTPUT.PUT_LINE('No INSERT occurred - Salary (' || v_yearly_salary || ') is too high');
    ELSIF SQLCODE = -20003 THEN
      DBMS_OUTPUT.PUT_LINE('No INSERT occurred - Salary (' || v_yearly_salary || ') is too low');
    ELSE
      DBMS_OUTPUT.PUT_LINE('Unexpected error: ' || SQLERRM);
    END IF;
END;