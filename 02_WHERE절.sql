SELECT * FROM employees;

-- WHERE절 비교 (데이터 값은 대/소문자 구분해야함.)
SELECT first_name, last_name, job_id
FROM employees
WHERE job_id='IT_PROG'; 

SELECT *
FROM employees
WHERE last_name = 'King';

SELECT *
FROM employees
WHERE department_id = 50;

-- 조건 범위 지정
SELECT *
FROM employees
WHERE salary > 15000 and salary < 20000;

SELECT *
FROM employees
WHERE hire_date = '04/01/30';

-- 데이터 범위 지정 BETWEEN
SELECT *
FROM employees
WHERE salary BETWEEN 15000 AND 20000;

SELECT *
FROM employees
WHERE hire_date BETWEEN '03/01/01' AND '03/12/31';

-- IN 연산자의 사용(특정 값들과 비교할때 사용)
SELECT *
FROM employees
WHERE manager_id IN (100, 101, 102);

SELECT *
FROM employees
WHERE job_id IN ('IT_PROG', 'AD_VP');

-- LIKE 연산자 (지정 문자열 포함 여부)
-- %는 어떠한 문자든, _는 데이터의 자리(위치)를 표현할 때 
-- %는 *와 같은 의미, _는 ?와 같은 의미
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

-- NULL 비교
-- (IS NULL: NULL 값을 찾음, IS NOT NULL)
SELECT *
FROM employees
WHERE commission_pct IS NULL;

SELECT *
FROM employees
WHERE commission_pct IS NOT NULL;

-- 비교 연산 우선 순위: AND가 OR보다 연산 우선순위가 높음.
SELECT *
FROM employees
WHERE (job_id = 'IT_PROG' OR job_id = 'FI_MGR') AND salary >= 6000; 

-- ORDER BY, 데이터의 정렬(SELECT 구문의 가장 마지막에 배치된다.)
-- ASC: 오름차순-기본 생략가능, DESC: 내림차순
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