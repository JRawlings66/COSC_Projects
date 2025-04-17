-- error logging
CREATE OR REPLACE PROCEDURE LogError(p_user_id VARCHAR2, p_message VARCHAR2) IS
BEGIN
  INSERT INTO LAB2_ERROR_LOG(user_id, err_time, message)
  VALUES (p_user_id, TO_CHAR(SYSDATE, 'DD/MM/YYYY HH24:MI:SS'), p_message);
  COMMIT;
END;
/

-- get product
CREATE OR REPLACE FUNCTION Lab2_GetProduct(p_product_id NUMBER)
RETURN VARCHAR2
AS
  v_product_model VARCHAR2(20);
  v_user_id VARCHAR2(30);
BEGIN
  SELECT USER INTO v_user_id FROM dual;
  v_product_model := 'NO_PRODUCT_ID_ERROR';
  SELECT model INTO v_product_model
  FROM L4_Products
  WHERE OUR_ID = p_product_id;
  IF v_product_model = 'NO_PRODUCT_ID_ERROR' THEN
    LogError(v_user_id, 'No product has ID = ' || TO_CHAR(p_product_id));
  END IF;
  RETURN v_product_model;
EXCEPTION
  WHEN OTHERS THEN
    RETURN 'NO_PRODUCT_ID_ERROR';
END;