/*
dual�̶�� ���̺��� sys�� �����ϴ� ����Ŭ�� ǥ�� ���̺�μ�,
���� �� �࿡ �� �÷��� ��� �ִ� dummy ���̺� �Դϴ�.
�Ͻ����� ��� �����̳� ��¥ ���� � �ַ� ����մϴ�.
��� ����ڰ� ������ �� �ֽ��ϴ�.
sys as sysdba�� sqlplus���� connect �ϸ� ��й�ȣ ���� ���� ����.
*/
SELECT * FROM dual;

SELECT
    'abcDEF',
    LOWER('abcDEF'), 
    INITCAP('abcDEF'), 
    UPPER('abcDEF')    
FROM dual;

-- �Ͻ����� ���� ��� Ȯ���ϱ� ���� Dummy table
-- lower(�ҹ���), initCap(�ձ��ڸ� �빮��), upper(�빮��)
SELECT 
  last_name, 
  LOWER(last_name), 
  INITCAP(last_name), 
  UPPER(last_name)
FROM employees;

-- lower(�ҹ���), initCap(�ձ��ڸ� �빮��), upper(�빮��)
-- �÷� Name�� �ٿ��� ��뵵 �����ϴ�.
SELECT
    salary
FROM employees
WHERE LOWER(last_name) = 'austin';

-- length(����), instr(���� ã��, ������ 0�� ��ȯ, ������ �ε��� ��)
SELECT
    'abcdef', LENGTH('abcdef'), INSTR('abcdef', 'b')
FROM dual;

SELECT
    first_name,
    LENGTH(first_name),
    INSTR(first_name, 'a')
FROM employees;

-- substr(�ڸ� ���ڿ�, �����ε���, ����)
-- substr(�ڸ� ���ڿ�, �����ε���) -> ���ڿ� ������.
-- �ε��� 1���� ����
-- concat(���� ����)
-- mySQL�� ||�� ���� ���� ��������. ��� CONCAT(,,,,)�� ������.
-- ����Ŭ�� CONCAT(,,,,) ��������. �� 2���� ����
SELECT
    'abcdef' AS ex,
    SUBSTR('abcdef', 2),
    CONCAT('abc', '123')
FROM dual;

SELECT
    first_name,
    SUBSTR(first_name, 1, 3),
    CONCAT(first_name, last_name)
FROM employees;

-- LTRIM(), RTRIM()
-- TRIM() -> ���� ���� ����
-- LTRIM(param1, param2) -> param2�� ���� param1���� ã�Ƽ� ���� (���ʺ��� ã��)
-- RTRIM(param1, param2) -> param2�� ���� param1���� ã�Ƽ� ���� (�����ʺ��� ã��)
SELECT
    LTRIM('javascript_java', 'java')
FROM dual; 

SELECT
    RTRIM('javascript_java', 'java')
FROM dual;

SELECT TRIM('       java       ') FROM dual;

-- LPAD(), RPAD(): ��. ������ ������ ���ڿ��� ä���
SELECT
    LPAD('abc', 10, '*'),
    RPAD('abc', 10, '#')
FROM dual;

-- REPLACE(str, old, new)
SELECT
    REPLACE('My dream is a president', 'president', 'programmer')
FROM dual;

SELECT
    REPLACE(REPLACE('My dream is a president', 'president', 'programmer'), ' ', '')
FROM dual;

SELECT
    REPLACE(CONCAT('hello', 'world!'), '!', '?')
FROM dual;
-----------------------------------------------------------------------------
