-- INSERT
-- 테이블 구조 확인
DESC departments;

-- INERT의 첫번째 방법(모든 컬럼 데이터를 한 번에 지정해서 삽입)
-- 에러, => 컬럼을 지정하지 않고 값만 주는 경우에는 모든 값을 다 줘야 한다.(NULL 허용여부와 상관 없이)
INSERT INTO departments
VALUES(300, '개발부', 100, 1500);

SELECt * from departments;
ROLLBACK;

-- INSERT의 두번째 방법(직접 컬럼을 지정하고 저장, NOT NULL 컬럼 확인)
INSERT INTO departments(department_id, department_name)
VALUES('엉엉', '영업무');

-- 사본 테이블 생성
-- 사본 테이블을 생성할 때 그냥 생성하면 -> 조회된 데이터까지 모두 복사
-- WHERE절에 false값(1 = 2) 지정하면 -> 테이블의 구조만 복사되고 데이터는 복사 x
-- CTAS(CREATE TABLE AS)문은 컬럼의 구조와 데이터를 복사할 뿐, 제약조건(PK, FK...)은 복제되지 않습니다.
CREATE TABLE emps AS  -- 오라클 문법: ChatGPT 활용하면 ANSI로 변경해줌.
(SELECT employee_id, first_name, job_id, hire_date
FROM employees WHERE 1 = 2);

SELECT * FROM emps;
DROP TABLE emps;
DESC emps;

-- INSERT (서브쿼리)
INSERT INTO emps
(SELECT employee_id, first_name, job_id, hire_date
 FROM employees WHERE department_id = 50);

---------------------------------------------------------------
-- UPDATE
-- UPDATE 테이블 이름 SET 컬럼=값, 컬럼=값 ...... WHERE 누구를 수정할지(조건)
CREATE TABLE emps AS
(SELECT * from employees);

-- UPDATE를 진행할 때는 누구를 수정할 지 조건으로 잘 지목해야함.
-- 그렇지 않으면 수정대상이 테이블 전체로 지엊됨.
UPDATE emps 
SET salary = 30000;
ROLLBACK;
SELECT * from emps;

UPDATE emps 
SET salary = 30000
WHERE employee_id=100;

UPDATE emps
SET phone_number = '010-1234-5677',
    manager_id = 102,
    salary = salary + salary * 0.1
WHERE employee_id = 100;

--UPDATE(서브쿼리)
UPDATE emps
SET (job_id, salary, manager_id) = 
    (SELECT job_id, salary, manager_id
     FROM emps
     WHERE employee_id = 100)
WHERE employee_id = 101;
SELECT * FROM emps;

-------------------------------------------------------------------
-- DELETE
-- DELETE도 WHERE 절을 지정하지 않으면 테이블 전체 행이 대상이 됩니다.
-- DELETE는 행을 지우는 역할이라, 컬럼을 지정하지 않는다.

DELETE FROM emps
WHERE employee_id = 103;
SELECT * FROM emps;

-- DELETE (서브쿼리)
DELETE FROM emps
WHERE department_id = (SELECT department_id FROM departments
                        WHERE department_name =  'IT');


