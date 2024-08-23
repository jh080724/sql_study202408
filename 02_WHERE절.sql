SELECT * FROM employees;

-- WHERE�� �� (������ ���� ��/�ҹ��� �����ؾ���.)
SELECT first_name, last_name, job_id
FROM employees
WHERE job_id='IT_PROG'; 

SELECT *
FROM employees
WHERE last_name = 'King';

SELECT *
FROM employees
WHERE department_id = 50;

-- ���� ���� ����
SELECT *
FROM employees
WHERE salary > 15000 and salary < 20000;

SELECT *
FROM employees
WHERE hire_date = '04/01/30';

-- ������ ���� ���� BETWEEN
SELECT *
FROM employees
WHERE salary BETWEEN 15000 AND 20000;

SELECT *
FROM employees
WHERE hire_date BETWEEN '03/01/01' AND '03/12/31';

-- IN �������� ���(Ư�� ����� ���Ҷ� ���)
SELECT *
FROM employees
WHERE manager_id IN (100, 101, 102);

SELECT *
FROM employees
WHERE job_id IN ('IT_PROG', 'AD_VP');

-- LIKE ������ (���� ���ڿ� ���� ����)
-- %�� ��� ���ڵ�, _�� �������� �ڸ�(��ġ)�� ǥ���� �� 
-- %�� *�� ���� �ǹ�, _�� ?�� ���� �ǹ�
SELECT *
FROM employees
WHERE hire_date LIKE '03';

SELECT *
FROM employees
WHERE hire_date LIKE '01%';

SELECT *
FROM employees
WHERE hire_date LIKE '%05%';

SELECT *
FROM employees
WHERE hire_date LIKE '___05%';

-- NULL ��
-- (IS NULL: NULL ���� ã��, IS NOT NULL)
SELECT *
FROM employees
WHERE commission_pct IS NULL;

SELECT *
FROM employees
WHERE commission_pct IS NOT NULL;

-- �� ���� �켱 ����: AND�� OR���� ���� �켱������ ����.
SELECT *
FROM employees
WHERE (job_id = 'IT_PROG' OR job_id = 'FI_MGR') AND salary >= 6000; 

-- ORDER BY, �������� ����(SELECT ������ ���� �������� ��ġ�ȴ�.)
-- ASC: ��������-�⺻ ��������, DESC: ��������
SELECT *
FROM employees
ORDER BY hire_date DESC;

SELECT *
FROM employees
WHERE job_id = 'IT_PROG' 
ORDER BY first_name;

SELECT first_name,
       salary * 12 AS pay
FROM employees
ORDER BY pay DESC;