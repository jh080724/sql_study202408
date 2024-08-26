select * from info;
select * from auth;

-- 이너(내부) 조인
SELECT
    *
FROM info i   -- i 별칭
INNER JOIN auth a  -- a 별칭
ON i.auth_id = a.auth_id;

SELECT
    i.title, i.content, a.name, i.auth_id
FROM info i   -- i 별칭
INNER JOIN auth a  -- a 별칭
ON i.auth_id = a.auth_id;

-- 테이블 alias를 붙여주자.
SELECT
    i.title, i.content, a.name, i.auth_id
FROM info i   -- i 별칭
JOIN auth a  -- a 별칭, INNER 생략 가능, Default가 INNER JOIN임.
ON i.auth_id = a.auth_id;

SELECT
    i.title, i.content, a.name, i.auth_id
FROM info i   -- i 별칭
INNER JOIN auth a  -- a 별칭
ON i.auth_id = a.auth_id -- 조인 조건(ON)
WHERE a.name = '이경민';  -- 일반 조건(WHERE) 절은 ON 다음 맨 마지막에 붙여 준다.

-- 아우터(외부) 조인
-- LEFT JOIN, RIGHT JOIN, 기준이 되는 테이블의 레코드는 모두 선택 출력됨.
SELECT
    *
FROM info i LEFT OUTER JOIN auth a -- OUTER 생략 가능
ON i.auth_id = a.auth_id;

-- 좌측 테이블과 우측 테이블 데이터를 모두 읽어 표현하는 외부 조인(풀 아우터 조인)
-- 표현할 수 없는 필드는 NULL로 표시됨.
SELECT
    *
FROM info i FULL JOIN auth a -- OUTER 생략 가능
ON i.auth_id = a.auth_id;

SELECT * FROM info, auth; -- oracle 문법 Cross Join

-- cROSS JOIN은 JOIN 조건을 설정하지 않기 때문에
-- 단순히 모든 컬럼에 대한 JOIN 을 수행합니다.(실행결과: 각 테이블의 행을 곱해주면 됨.)
-- 실제로 거의 사용하지 않습니다.
SELECT * FROM            -- 크로스 조인 모든
info CROSS JOIN auth;

-- 여러개 테이블 조인 -> 키값을 찾아 구문을 연결해서 쓰면 됩니다.
SELECT
    *
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id
LEFT JOIN locations loc
ON d.location_id = loc.location_id;

/*
- 테이블 별칭 a, i를 이용하여 LEFT OUTER JOIN 사용.
- info, auth 테이블 사용
- job 컬럼이 scientist인 사람의 id, title, content, job을 출력.
*/
SELECT i.id, i.title, i.content, a.job
FROM auth a
LEFT JOIN info i
ON i.auth_id= a.auth_id
WHERE a.job = 'scientist';

-- SELF JOIN
-- 동일 테이블 컬럼을 통해 기존의 존재하는 값을 매칭시켜 가져올때 사용한다.
SELECT * FROM employees;

SELECT * FROM employees WHERE first_name = 'Nancy';
SELECT * FROM employees WHERE employee_id = 101;

SELECT 
    ee.employee_id, ee.first_name, ee.manager_id,
    em.first_name, em.employee_id
FROM employees ee
JOIN employees em
ON ee.manager_id = em.employee_id;

-- 각 매니저가 담당하는 사원의 명수
SELECT 
    em.employee_id as mgr_id, 
    em.first_name as mgr_name,
    COUNT(ee.employee_id) AS 사원수
FROM employees ee
JOIN employees em
ON ee.manager_id = em.employee_id
GROUP BY em.employee_id, em.first_name;

-- NAtural Join
-- 동일한 이름을 갖는 컬럼들에 대해 자동으로 조인 조건을 생성하는 기법이다.
-- 즉, 자동으로 2개 이상의 테이블에서 같은 이름을 가진 컬럼을 찾아 INNER JOIN을 수행한다.

-- 조인되는 동일 이름의 컬럼은 타입이 같아야 하며
-- ALIAS나 테이블명을 자동 조인 컬럼(department_id) 앞에 표기하면 안된다.
-- 조회하려는 컬럼에 *을 붙이면, 공통 컬럼은 한번만 표기 된다.
-- 명시적으로 조인 조건을 붙여주는 것을 더 권장한다.

SELECT 
    e.employee_id, e.first_name, department_id,
    d.department_name
FROM employees e
NATURAL JOIN departments d;

-- USING JOIN
-- NATURAL 조인과는 달리 , USING을 사용하면 원하는 컬럼에 대해서만 선택적 조인조건을
-- 부여할 수 있따.
-- USING 절에서도 조인 컬럼에 대해 ALIAS나 테이블명을 표기하면 안된다.
SELECT 
    e.employee_id, e.first_name, department_id,
    d.department_name
FROM employees e
JOIN departments d USING(department_id);