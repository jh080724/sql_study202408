-- SEQUENCE (순차적으로 증가, 감소하는 값을 만들어 주는 기능)
CREATE SEQUENCE dept2_deq
    START WITH 1  -- 시작값(기본값은 증가할때 최소값, 감소할때 최대값) 
    INCREMENT BY 1 -- 증가값(양수면 증가, 음수면 감소, 기본값 1)
    MAXVALUE 10 -- 최대값(기본값은 증가일때 1027, 감소일때 -1)
    MINVALUE 1 -- 최소값(기본값은 증가일때 1, 감소일때 -1028)
    NOCACHE -- 캐시 메모리 사용여부(CACHE)
    NOCYCLE; -- 순환여부(NOCYCLE이 기본, 순환시킬거면 CYCLE)
    
CREATE TABLE test_tbl(
    test_no NUMBER(2) PRIMARY KEY,
    test_msg VARCHAR(100)
);

desc test_tbl;

-- 시퀀스 사용하기(NEXTVAL, CURRVAL)
INSERT INTO test_tbl
VALUES(dept2_deq.NEXTVAL, 'test'); -- INSERT 실행 시 시퀀스의 다음 값 활용.

SELECT * from test_tbl;

SELECT dept2_deq.CURRVAL FROM dual; -- 현재 시퀀스의 값 확인

-- 시퀀스 속성 수정 (직접 수정 가능)
-- START WITH은 수정이 불가능하다.
ALTER SEQUENCE dept2_deq MAXVALUE  9999;
ALTER SEQUENCE dept2_deq INCREMENT BY 10;
ALTER SEQUENCE test_deq INCREMENT BY 0;

-- 시퀀스 값을 다시 처음으로 돌리는 방법
ALTER SEQUENCE l