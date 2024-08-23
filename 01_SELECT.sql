SELECT email, phone_number, hir_date
FROM employees;

�÷��� ��ȸ�ϴ� ��ġ���� ��� ������ �����ϴ�.
SELECT 
    employee_id,
    first_name,
    last_name,
    salary,
    salary + salary*0.1
from
    employees;
   
-- NULL �� Ȯ��(���� 0�̳� ������� �ٸ� �����Դϴ�.)
SELECT
    department_id, commission_pct
FROM 
    employees;
    
-- alias(�÷���, ���̺���� �̸��� �����ؼ� ��ȸ�մϴ�.)
SELECT 
    first_name AS �̸�,
    last_name AS ��,
    salary AS �޿�
FROM
    employees;
/*
����Ŭ�� Ȭ����ǥ�� ���ڸ� ǥ���ϰ�, ���ڿ� �ȿ� Ȭ����ǥ Ư����ȣ��
ǥ���ϰ� �ʹٸ� ''�� �� �� �������� ���ø� �˴ϴ�.
���ڿ� �����ȣ�� || �Դϴ�. ���ڿ��� ���� ������ ������� �ʽ��ϴ�.
*/ 
SELECT first_name || ' ' || last_name || '''s salary is $' || salary AS �ϼ��ȹ���
FROM employees;

-- �ߺ��� ����
SELECT DISTINCT department_id
FROM employees;

-- ������ �÷�(ROWNUM:���ȣ, ROWOID: DB���� ���ּҰ�) ���
SELECT ROWNUM, ROWID, employee_id
FROM employees;
