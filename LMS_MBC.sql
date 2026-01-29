# LMS에 대한 테이블을 생성하고 더미네이터 입력(CRUD) 

SHOW databases; # LMS만 보인다

USE LMS; # LMS 데이터베이스를 사용하겠다 

DROP TABLE members; # 잘못 만들었을 경우 삭제

CREATE TABLE members( # members테이블 생성 
	# 필드명   타입  옵션 
	id       int auto_increment primary key,
    #         정수 자동번호생성기      기본키(다른테이블과 연결용)
    uid      varchar(50) not null unique,
    #        가변문자(50자)  공백비허용 유일한 값
    password varchar(255) not null, 
    name     varchar(50) not null,
    role     enum('admin','manager','user') default 'user',
    #        열거타입(괄호안에 글자만 허용)         기본값은 user
    active   boolean default true,
    #        불린타입            기본값
    created_at datetime default current_timestamp
    # 생성일     날짜시간타입        기본값은 시스템시간 
); 


# 더미데이터 입력
INSERT INTO members (uid, password, name, role, active)
VALUES ('kkw','1234','김기원','admin',true);
INSERT INTO members (uid, password, name, role, active)
VALUES ('lhj','5678','임효정','manager',true);
INSERT INTO members (uid, password, name, role, active)
VALUES ('keg','1111','김도균','user',true);
INSERT INTO members (uid, password, name, role, active)
VALUES ('ksb','2222','김수빈','user',true);
INSERT INTO members (uid, password, name, role, active)
VALUES ('kjy','3333','김기영','user',true); # 여러개 추가시 ctrl +shift+enter

# 더미네이터 출력
SELECT * FROM members; # 전체 출력

# 로그인 할 때 
SELECT * FROM members where uid='kkw' and password= '1234' and active=true;

# 더미네이터 수정
UPDATE members set password = '1111' WHERE uid = 'kkw'

# 회원삭제 
DELETE FROM members WHERE uid = 'kkw';
UPDATE members set active = false WHERE uid = 'kkw'; #회원비활성화 






