/*
# 조인이란?
- 서로 다른 테이블 간에 설정된 관계가 결합하여
 1개 이상의 테이블에서 데이터를 조회하기 위해서 사용합니다.
- SELECT 컬럼리스트 FROM 조인대상이 되는 테이블 (1개 이상)
  WHERE 조인 조건 (오라클 조인 문법)
*/

-- employees 테이블의 부서 id와 일치하는 departments 테이블의 부서 ID를 찾아서
-- 부서 이름을 조회하자
SELECT e.first_name, e.department_id, d.department_name
FROM employees e, departments d -- 오라클 조인은 조인 대상을 ,로 명시
WHERE e.department_id = d.department_id; -- 오라클 조인 조건은 WHERE절에 명시

SELECT e.first_name, e.department_id, d.department_name
FROM employees e 
INNER JOIN departments d 
ON e.department_id = d.department_id; -- ANSI 표준 조인 조인 조건 ON

/*
각각의 테이블에 독립적으로 존재하는 컬럼의 경우에는
테이블 이름을 생략해도 무방합니다. 그러나, 해석의 명확성을 위해
테이블 이름을 작성하셔서 소속을 표현해 주는 것이 바람직합니다.
테이블 이름이 너무 길 시에는 ALIAS를 작성하여 칭합니다.
두 테이블 모두 가지고 있는 컬럼의 경우 반드시 명시해 주셔야 합니다.
*/
-- 3개의 테이블을 이용한 내부 조인(INNER_JOIN)
-- 내부조인: 조인 조건에 일치하는 행만 반환하는 
-- 
SELECT
    e.first_name, e.department_id, e.job_id,
    d.department_name,
    j.job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id
AND e.job_id = j.job_id;

SELECT
    e.first_name, e.department_id, e.job_id,
    d.department_name,
    j.job_title,
    loc.city
FROM employees e, departments d, jobs j, locations loc
WHERE e.department_id = d.department_id
AND e.job_id = j.job_id
AND d.location_id = loc.location_id
AND loc.state_province = 'California'; -- 오라클 조인의 일반 조건은 조인 조건 이후에 작성해야함.

/*
상호 테이블간에 일치되는 값으로 연결되는 내부 조인과는 다르게
어느 한 테이블에 공통 값이 없더라도 해당 row들이 조회 결과에
모두 포함되는 조인을 말합니다.
*/
SELECT
    e.first_name,
    d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+); -- 아우터조인: (+)가 붙지 않은 쪽이 모두 나온다.
                                        -- (+) 붙은 애가 가서 들러 붙는다.
                                        -- (+) 가 안붙은 테이블이 기준이 된다.
-- 외부 조인 진행 시 모든 조건에 (+)를 붙여야 하며
-- 일반 조건에도 (+)를 붙이지 않으면 데이터가 누락되는 현상이 발생.
SELECT
    e.employee_id, e.first_name,
    jh.start_date, jh.end_date, jh.job_id
FROM employees e, job_history jh
WHERE e.employee_id = jh.employee_id(+)
AND jh.department_id(+) = 80; -- 외부 조인을 유지할려면 일반 조건에도 (+)를 붙여야 한다.
                              -- 안붙이면 내부 조인으로 바뀐는 퐝당한 일이 일어남.

SELECT
    e.first_name,
    d.department_name
FROM employees e RIGHT OUTER JOIN departments d
ON e.department_id = d.department_id; -- ANSI 아우터조인: 기준을 LEFT, RIGHT로 표시


