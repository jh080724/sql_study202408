-- ROW_NUMBER(): 각 그룹내에서 각 행에 고유한 순번을 부여
-- 중복된 값이 있어도 순번은 중복되지 않습니다.

-- PARTITION BY department_id: 부서별로 데이터를 그룹화
-- ORDER BY salary DESC: 급여로 내림차순 정렬
SELECT
    employee_id,
    first_name,
    department_id,
    salary,
    ROW_NUMBER() OVER (PARTITION BY department_id ORDER BY salary DESC) AS row_number
FROM employees;

-- RANK(): 각 그룹별 순위 부여
-- 값이 동일하면 같은 순위 부여, ex) 1등 2명 -> 다음은 3등
SELECT
    employee_id,
    first_name,
    department_id,
    salary,
    RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS RANK
FROM employees;

-- DENSE_RANK(): RANK()와 유사하지만, 순위가 건너 뛰어지지 않음.
-- ex) 1등 두명 ? -> 다음은 2등
SELECT
    employee_id,
    first_name,
    department_id,
    salary,
    DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS RANK
FROM employees;

-- LEAD(컬럼, 가져올 다음 행수): 현재 행 이후의 값을 가져옴.
-- 링크드 리스트와 유사하게 해당 필드의 다음 행에 있는 값을 가져옴.
-- 그룹의 끝의 다음은 없으니까 null이 들어감
SELECT
    employee_id,
    first_name,
    department_id,
    salary,
    LEAD(salary, 1) OVER (PARTITION BY department_id ORDER BY salary DESC) AS NEXT_SALARY
FROM employees;


SELECT
    employee_id,
    first_name,
    department_id,
    salary,
    LEAD(salary, 1) OVER (ORDER BY salary) AS NEXT_SALARY,
    LEAD(salary, 1) OVER (ORDER BY salary)-salary AS SALARY_DIFF
FROM employees;

-- LAG(컬럼, 가져올 다음 행의 수)
SELECT
    employee_id,
    first_name,
    department_id,
    salary,
    LAG(salary, 1) OVER (ORDER BY salary) AS PREV_SALARY
FROM employees;

-- FIRST_VALUE(컬럼): 컬럼별 첫번째 행의 값을 반환.
SELECT
    employee_id,
    first_name,
    department_id,
    salary,
    FIRST_VALUE(salary) OVER (PARTITION BY department_id ORDER BY salary DESC) AS 부서별최고연봉
FROM employees;

-- LAST_VALUE(컬럼: 예: salary): 각 부서별 가장 낮은 급여를 가져오기.
-- LAST_VALUE는 기본적으로 현재 행에서 윈도우 범위 내 마지막 값을 가져오므로
-- 전체 범위로 확장해 주기 위해서 ROWS BETWEEN을 사용합니다.
-- 현재 행의 마지막 값이 아닌 내가 지정한 그룹으로 윈도우 범위를 확장하기 위해 추가.
SELECT
    employee_id,
    first_name,
    department_id,
    salary,
    LAST_VALUE(salary) OVER 
    (PARTITION BY department_id 
    ORDER BY salary DESC
    ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS 부서별최저연봉  -- 경계가 없는 이전과 경게가 없는 따라오는 값.(시작과 끝)
FROM employees;

-- NTILE(N): 데이터를 N개의 그룹으로 나누는데 사용하는 함수.
-- 그룹에 6개 행이 선택되면, 선택한 N개의 그룹으로 나눈다. N이 2이면 3개씩 2개로 나뉜다.
-- 나누고 남은 행은 위에서 부터 1개씩 배치 된다.
-- EX) 전체행이 10이고, NTILE(4) -> 4개의 그룹으로 찢어준다.
-- 11 22 33 44 -> 나머지는 작은 숫자 쪽으로 한개씩 -> 111 222 33 44
SELECT
    employee_id,
    first_name,
    department_id,
    salary,
    NTILE(2) OVER (PARTITION BY department_id ORDER BY salary DESC) AS NTILE_2
FROM employees;