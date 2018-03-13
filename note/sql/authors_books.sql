CREATE table "AUTHORS" (
"NO" NUMBER(8,0) NOT NULL,
"NAME" VARCHAR2(100) NOT NULL,
"NATIONALITY" VARCHAR2(100) NOT NULL,
"BIRTH_DATE" DATE NOT NULL,
constraint "AUTHORS_PK" primary key ("NO")
)

CREATE table "BOOKS" (
"NO" NUMBER(9,0) NOT NULL,
"TITLE" VARCHAR2(200) NOT NULL,
"PUBLISHER" VARCHAR2(100) NULL,
"PUBLICATION_DATE" DATE NOT NULL,
"AUTHOR_NO" NUMBER(8,0) NOT NULL,
constraint "BOOKS_PK" primary key ("NO")
);


ALTER TABLE "BOOKS" ADD CONSTRAINT "BOOKS_FK"
FOREIGN KEY ("AUTHOR_NO")
REFERENCES "AUTHORS" ("NO");

create sequence "BOOKS_SEQ"
start with 1
increment by 1
maxvalue 999999999
minvalue 1
nocache
nocycle
noorder;
create sequence "AUTHORS_SEQ"
start with 1
increment by 1
maxvalue 99999999
minvalue 1
nocache
nocycle
noorder;


INSERT INTO authors(no,name,nationality,birth_date)
VALUES(1,'유발 하라리','이스라엘','1976-02-24');

INSERT INTO authors
VALUES(2, '베르나르 베르베르', '프랑스' ,'1961-09-18');

INSERT INTO authors(no,name,nationality,birth_date)
VALUES(3,'앤드루 카네기','영국','1835-11-25');

INSERT INTO authors(no, name, nationality, birth_date)
VALUES(4, '히가시노 게이고', '일본', '1958-02-04');

insert into authors(no,name,nationality,birth_date)
values(5,'이영도','대한민국','1972-04-27');

INSERT INTO authors(no, name, nationality, birth_date)
values(6, '조앤 K. 롤링', '영국', '1965-07-31');

insert into authors(no,name,NATIONALITY,BIRTH_DATE)
values (7, '미하엘 엔데','독일','1929-11-29');

INSERT INTO authors(no,name,nationality,birth_date)
VALUES (8,'정유정','한국','1966-08-15');

INSERT INTO authors(no, name, nationality, birth_date)
VALUES (9,'오토타케 히로타다', '일본', '1976-04-06');

insert into authors(no,name,nationality,birth_date)
values(10,'데일 카네기','미국','1888-11-14');

INSERT INTO authors(no, name, nationality, birth_date)
VALUES(11, '요네자와 호노부', '일본', '1978-05-12');

INSERT INTO authors(no,name,nationality,birth_date)
VALUES(12, '존 로널드 로얼 톨킨', '영국', '1892-01-03');

INSERT INTO authors(no,name,nationality,birth_date)
VALUES(13,'마이클 샌델','미국','1953-03-05');

INSERT INTO authors(no,name,nationality,birth_date)
VALUES(14,'J. M. 데 바스콘셀로스','브라질','1920-02-26');

INSERT INTO authors(no,name,nationality,birth_date)
VALUES(15,'심훈','한국','1901-09-12');

INSERT INTO authors(no, name, nationality, birth_date)
VALUES(16, '오다 에이치로', '일본', '1975-01-01');

insert into authors(no,name,nationality,birth_date)
values(17,'기욤 뮈소','프랑스','1974-06-06');

insert into authors(no,name,nationality,birth_date)
values(18,'스펜서 존슨','미국','1938-11-24');

INSERT INTO authors(no,name,nationality,birth_date)
VALUES(19,'제임스 홀리스','미국','1940-08-05');

INSERT INTO authors(no,name,nationality,birth_date)
VALUES(20,'이기주','대한민국','1980-01-01');

insert into books values (books_seq.nextval, '모모','비룡소','1999-02-09',7);

INSERT INTO books(no, title, publisher, publication_date, author_no)
VALUES(books_seq.nextval, '회랑정 살인사건', '알에이치코리아', '2016-10-18',4);

INSERT INTO books(no, title, publisher, publication_date, author_no)
values(books_seq.nextval, '신비한 동물사전', '문학수첩리틀북', '2018-01-25', 6);

insert into books(no,title,publisher,publication_date,author_no)
values(books_seq.nextval,'원피스','대원씨아이','1999-01-31',16);

INSERT INTO books(no,title,publisher,publication_date,author_no)
VALUES(books_seq.nextval,'나의 라임오렌지나무','청목사','2001-04-03',7);

INSERT INTO books(no,title,publisher,publication_date,author_no)
VALUES(books_seq.nextval, '나무','열린책들','2013-05-30',2);

INSERT INTO books(no, title, publisher, publication_date, author_no)
VALUES(books_seq.nextval, '파리의 아파트', '밝은세상', '2017-12-05', 17);

INSERT INTO books(no,title,publisher,publication_date,author_no)
VALUES(books_seq.nextval,'철강왕카네기','일신서적출판사','1993-07-11',3);

INSERT INTO books(no,title,publisher,publication_date,author_no)
VALUES(books_seq.nextval,'28','은행나무','2013-06-27',8);

INSERT INTO books(no,title,publisher,publication_date,author_no)
VALUES(books_seq.nextval, '내가 누군지도 모른 채 마흔이 되었다'
, '더퀘스트','2018-01-20',19);

INSERT INTO books(no,title,publisher,publication_date,author_no)
VALUES(books_seq.nextval,'상록수','문학과지성사','2005-06-25',15);

INSERT INTO books(no,title,publisher,publication_date,author_no)
VALUES(books_seq.nextval,'제3인류','열린책들','2012-10-02',2);

INSERT INTO books (no,title,publisher, publication_date,author_no)
VALUES (books_seq.nextval, '반지의 제왕', '앨런 앤드 언윈', '1954-07-29',6);

insert into books(no,title,publisher,publication_date,author_no)
values(books_seq.nextval,'누가 내 치즈를 옮겼을까','G. P. Putnams Sons','1998-09-08',18);

INSERT INTO books(no,title,publisher,publication_date,author_no)
VALUES(books_seq.nextval,'오체불만족','창해(새우와 고래)','2001-03-31',9);

INSERT INTO books(no,title,publisher,publication_date,author_no)
VALUES(books_seq.nextval,'정의는 무엇인가','와이즈베리','2010-05-26',13);

insert into books(no,title,publisher,publication_date,author_no)
values(books_seq.nextval,'눈물을 마시는 새','황금가지','2003-01-18',5);

INSERT INTO books( NO,TITLE,PUBLISHER,PUBLICATION_DATE,AUTHOR_NO)
VALUES(books_seq.nextval, '부러진 용골', '북홀릭', '2012-05-25', 11 );

INSERT INTO books(no, title, publisher, publication_date, author_no)
VALUES(books_seq.nextval, '인간관계론', '씨앗을뿌리는사람', '2006-12-21', 10);
