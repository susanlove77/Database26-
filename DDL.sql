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

-- 데이터 유형 불일치로 인한 오류 발생 예
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

CREATE DATABASE IF NOT EXISTS doitsql;

USE doitsql;

CREATE TABLE doit_increment( 
col_1 INT AUTO_INCREMENT PRIMARY KEY,
col_2 VARCHAR(50),
col_3 INT
);

INSERT INTO doit_increment(col_2, col_3) VALUES ('1 자동입력',1);
INSERT INTO doit_increment(col_2, col_3) VALUES ('2,자동입력',2);

SELECT * FROM doit_increment;

INSERT INTO doit_increment (col_1, col_2, col_3) VALUES (3,'3 자동입력',3);
 
SELECT * FROM doit_increment;
 
INSERT INTO doit_increment (col_1, col_2, col_3) VALUES (5, '4건너뛰고 5 자동입력',5);

SELECT * FROM doit_increment;

INSERT INTO doit_increment (col_1, col_2, col_3) VALUES ('어디까지 입력되었을까?',0);
SELECT * FROM doit_increment;

SELECT LAST_INSERT_ID();
    
ALTER TABLE doit_increment AUTO_INCREMENT = 100;
INSERT INTO doit_increment (col_2,col_3) VALUES ('시작값이 변경되었을까?',0);
SELECT * FROM doit_incremnet;
    
SET @@AUTO_INCREMENT_INCREMENT = 5;
INSERT INTO doit_increment (col_2, col_3) VALUES ('5씩 증가할까? (1)',0);
INSERT INTO doit_increment (col_2, col_3) VALUES ('5씩 증가할까? (2)',0);

SELECT * FROM doit_increment;
    
-- CREATE TABLE doit_select_new AS (SELECT * FROM doit_insert_select_from);
SELECT * FROM doit_select_new;

SHOW TABLES FROM world;
SELECT first_name FROM customer;
SELECT first_name, last_name FROM customer;
SELECT * FROM customer;
SELECT * FROM customer WHERE address_id = 200;
SELECT * FROM customer WHERE first_name <'MARIA';

SELECT * FROM payment
WHERE payment_date < '2005-07-09';

SELECT * FROM payment
WHERE payment_date =  '2005-07-09 13:24:07';

SELECT * FROM customer WHERE address_id BETWEEN 5 AND 10;

SELECT * FROM payment WHERE payment_date BETWEEN '2005-06-17' AND '2005-07-19';

SELECT * FROM payment WHERE payment_date = '2005-07-08 07:33:56';

SELECT * FROM customer
WHERE first_name BETWEEN 'M' AND 'O';
SELECT * FROM customer
WHERE first_name NOT BETWEEN 'M' AND 'O';

SELECT * FROM city WHERE city = 'Sunnyvale' AND country_id = 103;
SELECT * FROM payment
WHERE payment_date >= '2005-06-01' AND payment_date <= '2005-07-05';

SELECT * FROM customer
WHERE first_name = 'MARIA' OR first_name = 'LINDA';

SELECT * FROM customer
WHERE first_name = 'MARIA' OR first_name = 'LINDA' OR first_name = 'NANCY';

SELECT * FROM customer
WHERE first_name IN ('MARIA','LINDA','NANCY');

SELECT * FROM city
WHERE (country_id = 86 OR country_id = 103)
	AND city IN ('Cheju','Sunnyvale','Dallas');
    
SELECT * FROM city
WHERE country_id = 103 OR country_id = 86
	 AND city  IN ('Cheju','Sunnyvale','Dallas');
     
SELECT * FROM city
WHERE country_id = 86 OR country_id = 103
	 AND city IN ('Cheju' ,'Sunnyvale','Dallas');

SELECT * FROM city
WHERE (country_id = 103 OR country_id = 86)
	AND city IN ('Cheju','Sunnyvale','Dallas');
    
SELECT * FROM city
WHERE country_id IN (103,86)
	AND city IN ('Cheju','Sunnyvale','Dallas');
    
SELECT * FROM address;
SELECT * FROM address WHERE address2 = NULL;
SELECT * FROM address WHERE address2 IS NULL;
SELECT * FROM address WHERE address2 IS NOT NULL;
SELECT * FROM address WHERE address2 = '';
SELECT * FROM customer ORDER BY first_name;
SELECT * FROM customer ORDER BY last_name;
SELECT * FROM customer ORDER BY store_id, first_name;
SELECT * FROM customer ORDER BY first_name, store_id;
SELECT * FROM customer ORDER BY first_name ASC;
SELECT * FROM customer ORDER BY first_name DESC;
SELECT * FROM customer ORDER BY store_id DESC, first_name ASC;
SELECT * FROM customer ORDER BY store_id DESC, first_name ASC LIMIT 10;
SELECT * FROM customer ORDER BY customer_id ASC LIMIT 100,10;
SELECT * FROM customer ORDER BY customer_id ASC LIMIT 10 OFFSET 100;
SELECT * FROM customer WHERE first_name LIKE 'A%';
SELECT * FROM customer WHERE first_name LIKE 'AA%';
SELECT * FROM customer WHERE first_name LIKE '%A';
SELECT * FROM customer WHERE first_name LIKE '%RA';
SELECT * FROM customer WHERE first_name LIKE 'A%A';
SELECT * FROM customer WHERE first_name LIKE '%A%';
SELECT * FROM customer WHERE first_name NOT LIKE 'A%';
WITH CTE (col_1) AS (
SELECT 'A%BC' UNION ALL
SELECT 'A_BC' UNION ALL
SELECT 'ABC'
)
SELECT * FROM CTE;

WITH CTE (col_1) AS(
SELECT 'A%BC' UNION ALL
SELECT 'A_BC' UNION ALL
SELECT 'ABC'
)
SELECT * FROM CTE WHERE col_1 LIKE '%';

WITH CTE(col_1) AS(
SELECT 'A%BC' UNION ALL
SELECT 'A_BC' UNION ALL
SELECT 'ABC'
)
SELECT * FROM CTE WHERE col_1 LIKE '%#%%' ESCAPE '#';

WITH CTE (col_1) AS (
SELECT 'A%BC' UNION ALL
SELECT 'A_BC' UNION ALL
SELECT 'ABC'
)
SELECT * FROM CTE WHERE col_1 LIKE '%!%%' ESCAPE '!';

SELECT * FROM customer WHERE first_name LIKE 'A_';
SELECT * FROM customer WHERE first_name LIKE 'A__';
SELECT * FROM customer WHERE first_name LIKE '__A';
SELECT * FROM customer WHERE first_name LIKE 'A__A';
SELECT * FROM customer WHERE first_name LIKE '_____';
SELECT * FROM customer WHERE first_name LIKE 'A_R%';
SELECT * FROM customer WHERE first_name LIKE '__R%';
SELECT * FROM customer WHERE first_name LIKE 'A%R_';
SELECT * FROM customer WHERE first_name REGEXP '^K|N$';
SELECT * FROM customer WHERE first_name REGEXP 'K[L-N]';
SELECT * FROM customer WHERE first_name REGEXP 'K[^L-N]';
SELECT * FROM customer WHERE first_name LIKE 'S%' AND first_name REGEXP 'A[L-N]';
SELECT * FROM customer WHERE first_name LIKE '_______'
	AND first_name REGEXP 'A[L-N]'
    AND first_name REGEXP 'O$';
SELECT special_features FROM film GROUP BY special_features;
SELECT rating FROM film GROUP BY rating;
SELECT special_features, rating FROM film GROUP BY special_features,rating;
SELECT rating, special_features FROM film GROUP BY special_features,rating;
SELECT special_features, COUNT(*) AS cnt FROM film GROUP BY special_features;
SELECT special_features, rating, COUNT(*) AS cnt FROM film
GROUP BY special_features, rating ORDER BY special_features, rating, cnt DESC;

SELECT special_features, COUNT(*) AS cnt FROM film
GROUP BY special_features
HAVING cnt > 70;

SELECT special_features, rating FROM film
group by special_features, rating
HAVING rating = 'G';

SELECT special_features, COUNT(*) AS cnt FROM film
GROUP BY special_features
HAVING cnt > 70;

SELECT special_featrues, rating, COUNT(*) AS cnt FROM film
GROUP BY special_features, rating
HAVING rating = 'R' AND cnt > 8;

SELECT DISTINCT special_features, rating FROM film;

SELECT special_features, rating FROM film
GROUP BY special_features, rating;

CREATE DATABASE IF NOT EXISTS doitsql;

USE doitsql;
CREATE TABLE doit_increment(
col_1 INT AUTO_INCREMENT PRIMARY KEY,
col_2 VARCHAR(50),
col_3 INT
);
INSERT INTO doit_increment (col_2,col_3) VALUES ('1자동입력',1);
INSERT INTO doit_increment (col_2,col_3) VALUES ('2자동입력',2);

SELECT * FROM doit_increment;

INSERT INTO doit_increment(col_1,col_2,col_3) VALUES (3,'3자동입력',3);
SELECT * FROM doit_increment;

SET @@AUTO_INCREMENT_INCREMENT = 5;
INSERT INTO doit_increment (col_2,col_3) VALUES ('5씩 증가할까?(1)',0);
INSERT INTO doit_increment (col_2,col_3) VALUES ('5씩 증가할까?(2)',0);

SHOW TABLES;
CREATE TABLE doit_insert_select_from(
col_1 INT,
col_2 VARCHAR(10)
);

CREATE TABLE doit_insert_select_to(
col_1 INT,
col_2 VARCHAR(10)
);

INSERT INTO doit_insert_select_from VALUES (1,'Do');
INSERT INTO doit_insert_select_from VALUES(2, 'It');
INSERT INTO doit_insert_select_from VALUES(3, 'MySQL');

INSERT INTO doit_insert_select_to
SELECT * FROM doit_insert_select_from;

SELECT * FROM doit_insert_select_to;

CREATE TABLE doit_parent(col_1 INT PRIMARY KEY);
CREATE TABLE doit_child(col_2 INT);

ALTER TABLE doit_child
ADD FOREIGN KEY (col_1) REFERENCE doit_parent(col_1);