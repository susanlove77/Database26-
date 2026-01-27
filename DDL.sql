select @@hostname;

-- 이 창은 메모장처럼 사용됨 
-- 스크립트를 1줄씩 실행하는 것이 기본임(ctrl + enter )
-- 만약 더미네이터를 20개 입력한다!! (블럭설정 ctrl + shift + enter)addresscategory 

use sakila; -- sakila 데이터베이스에 가서 사용할게
select * from actor; -- actor 테이블에 모든 값을 가져와~

use world; -- world 데이터베이스에 가서 사용할께
select * from city; -- city 테이블에 모든 값을 가져와 

CREATE DATABASE DoItSQL;
USE doitsql;

 CREATE TABLE doit_dml(
col_1 INT,
col_2 VARCHAR(50),
col_3 DATETIME
);Insert into doit_dml (col_1,col_2,col_3) values (1,'DoItSQL','2023-01-01');

select* from doit_dml;
insert into doit_dml(col_1) values('문자 입력');
insert into doit_dml values(2, '열 이름생략','2023-01-02');
select * from doit_dml;
insert into doit_dml values (3,'col_3 값 생략');
insert into doit_dml(col_1, col_2) values (3, 'col-3값 생략');
select * from doit_dml;
INSERT INTO doit_dml(col_1, col_3, col_2) VALUES (4,'2023-01-03', '열순서 변경');
select * from doit_dml;
insert into doit_dml (col_1,col_2,col_3)
values (5, '데이터 입력' , '2023-01-03'),(6, '데이터 입력6','2023-01-03'),(7, '데이터 입력7','2023-01-03');
create table doit_notnull(
col_1 int,
col_2 varchar(50) not null
);
insert into doit_notnull (col_1) values (1);
update doit_dml set col_2 = '데이터 수정'
where col_1 = 4;
update doit_dml set col_1 = col_1 + 10;
-- select 1
-- /*
-- select 2 

-- */customer
select first_name from customer;
select * from customer where address_id = 200;
select * from customer order by first_name;
with cte(col_1)as(
select 'a%bc' union all
select 'a_bc' union all
select 'abc'
)
select * from cte;
with cte (col_1) as(
select 'a%bc' union all
select 'a_bc' union all
select 'abc'
)
select * from cte where col_1 like '%';
with cte (col_1) as(
select 'a%bc' union all
select 'a_bc' union all
select 'abc'
)
select *from cte where col_1 like '%#%%' escape '#';

with cte (col_1) as(
select 'a%bc' union all
select 'a_bc' union all
select 'abc'
)
select * from cte where col_1 like '%#%%' escape '!';

select * from cte where col_1 like '%!%%' escape '!';
select * from customer where first_name like 'a_';

-- create 문으로 데이터 베이스 생성
create database doitsql;

-- drop 문으로 데이터베이스 삭제
drop database doitsql;

-- 데이터베이스 생성 후 선택
create database doitsql;
use doitsql;

-- create문으로 테이블 생성
create table doit_create_table(
col_1 int,
col_2 varchar(50),
col_3 datetime
);
insert into doit_dml (col_1,col_2,col_3) values (1, 'doitsql','2023-01-03');

-- 테이블 조회하여 삽입한 데이터 확인
select * from doit_dml

-- 데이터 유형 불일치인한 오류 발생 예
insert into doit_dml(col_1) values ('문자입력');
-- 열 이름 생략하고 데이터 삽입
insert into doit_dml values (2, '열 이름 생략','2023-01-02');
-- 삽입된 데이터 확인
select * from doit_dml;
-- 열 개수 불일치로 인한 오류 발생
insert into doit_dml values (3,'col_3 값 생략');
-- 특정 열에만 데이터 삽입
insert into doit_dml(col_1, col_2) values (3,'col_3 값 생략');
-- 삽입할 데이터의 순서 변경
insert into doit_dml(col_1, col_3, col_2) values(4, '2023-01-03',' 열순서 변경');
-- 여러 데이터 한번에 삽입
-- null을 허용하지 않는 테이블 생성 후 null 삽입 시 오류가 발생한 예
create table doit_notnull(
col_1 int,
col_2 varchar(50) not null
);
insert into doit_notnull (col_1) values (1);

-- update문으로 데이터 수정1
update doit_dml set col_1 = '데이터 수정'
where col_1 = 4;

-- update문으로 데이터 수정2
update doit_dml set col_2 = '데이터 수정'
where col_1 = 4;

-- update문으로 테이블 전체 데이터 수정
update doit_dml set col_1 = col_1 +10;

-- delete 문으로 데이터 수정
delete from doit_dml where col_1 = 14;

-- delete 문으로 테이블 전체 데이터 삭제
delete from doit_dml;





    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
