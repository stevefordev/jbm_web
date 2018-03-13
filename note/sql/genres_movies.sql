CREATE TABLE  "GENRES"(
"NO" NUMBER(6,0) NOT NULL ENABLE,
"NAME" VARCHAR2(200) NOT NULL ENABLE,
CONSTRAINT "GENRES_PK" PRIMARY KEY ("NO") ENABLE);

CREATE SEQUENCE "GENRES_SEQ"
start with 10
increment by 1
maxvalue 999999
minvalue 1
nocache
nocycle
noorder;

CREATE TABLE  "MOVIES" (
"NO" NUMBER(7,0) NOT NULL ENABLE, 
"NAME" VARCHAR2(200) NOT NULL ENABLE, 
"RELEASE_DATE" DATE NOT NULL ENABLE, 
"END_DATE" DATE, 
"DIRECTOR" VARCHAR2(4000) NOT NULL ENABLE, 
"AUDIENCE_NUM" NUMBER(9,0) NOT NULL ENABLE, 
"GENRE" NUMBER(6,0) NOT NULL ENABLE, 
CONSTRAINT "MOVIES_PK" PRIMARY KEY ("NO") ENABLE);
ALTER TABLE  "MOVIES" ADD CONSTRAINT "MOVIES_FK" FOREIGN KEY ("GENRE") REFERENCES  "GENRES" ("NO") ENABLE;

CREATE SEQUENCE "MOVIES_SEQ"
start with 1
increment by 1
maxvalue 9999999
minvalue 1
nocache
nocycle
noorder; 
 
INSERT INTO genres(no,name) VALUES(1,'SF');
INSERT INTO genres(no,name) VALUES(2,'드라마');
INSERT INTO genres(no,name) VALUES(3,'애니메이션');
INSERT INTO genres(no,name) VALUES(4,'액션');
INSERT INTO genres(no,name) VALUES(5,'멜로');
INSERT INTO genres(no,name) VALUES(6,'판타지');
INSERT INTO genres(no,name) VALUES(7,'가죽');
INSERT INTO genres(no,name) VALUES(8,'코미디');
INSERT INTO genres(no,name) VALUES(9,'스릴러');

INSERT INTO movies(no,name,release_date,end_date,director,audience_num,genre)
VALUES(movies_seq.nextval,'조선명탐정: 흡혈괴마의 비밀','2018-02-08',null,'김석윤',178774,8);

INSERT INTO movies(no,name,release_date,end_date,director,audience_num,genre)
VALUES(movies_seq.nextval,'염력','2018-01-31',null,'연상호',935541,2);

INSERT INTO movies(no,name,release_date,end_date,director,audience_num,genre)
VALUES(movies_seq.nextval,'그것만이 내 세상','2018-01-17 ',null,'최성현',2956773,8);

INSERT INTO movies(no,name,release_date,end_date,director,audience_num,genre)
VALUES(movies_seq.nextval,'코코','2018-01-11',null,'리 언크리치',3125359,3);

INSERT INTO movies(no,name,release_date,end_date,director,audience_num,genre)
VALUES(movies_seq.nextval,'인시디어스4: 라스트 키','2018-01-31',null,'애덤 로비텔',438035,9);

INSERT INTO movies(no,name,release_date,end_date,director,audience_num,genre)
VALUES(movies_seq.nextval,'신과함께-죄와 벌','2017-12-20',null,'김용화',14250007,2);

INSERT INTO movies(no,name,release_date,end_date,director,audience_num,genre)
VALUES(movies_seq.nextval,'메이즈 러너: 데스 큐어','2018-01-17',null,'웨스 볼',2248171,4);

INSERT INTO movies(no,name,release_date,end_date,director,audience_num,genre)
VALUES(movies_seq.nextval,'12 솔져스','2018-01-31',null,'니콜라이 퓰시',165861,4);

INSERT INTO movies(no,name,release_date,end_date,director,audience_num,genre)
VALUES(movies_seq.nextval,'1987','2017-12-08',null,'장준환',7201371,2);

INSERT INTO movies(no,name,release_date,end_date,director,audience_num,genre)
VALUES(movies_seq.nextval,'올 더 머니','2018-02-01',null,'리들리 스콧',49308,9);

INSERT INTO movies(no,name,release_date,end_date,director,audience_num,genre)
VALUES(movies_seq.nextval,'블레이드 러너','1993-05-08','1993-05-20','리들리 스콧',7222,1);

INSERT INTO movies(no,name,release_date,end_date,director,audience_num,genre)
VALUES(movies_seq.nextval,'명량','2014-07-30','2014-10-31','김한민',17613682,2);

INSERT INTO movies(no,name,release_date,end_date,director,audience_num,genre)
VALUES(movies_seq.nextval,'시카리오:암살자의 도시','2015-12-03','2015-12-12','드니 빌뇌브',153009,2);

INSERT INTO movies(no,name,release_date,end_date,director,audience_num,genre)
VALUES(movies_seq.nextval,'블레이드 러너 2049','2017-10-12','2018-01-24','드니 빌뇌브',321466,1);

INSERT INTO movies(no,name,release_date,end_date,director,audience_num,genre)
VALUES(movies_seq.nextval,'아이언맨','2008-04-14','2008-06-18','존 파브로',4316003,6);

INSERT INTO movies(no,name,release_date,end_date,director,audience_num,genre)
VALUES(movies_seq.nextval,'아이언맨2','2010-04-27','2010-06-11','존 파브로',4498335,6);

INSERT INTO movies(no,name,release_date,end_date,director,audience_num,genre)
VALUES(movies_seq.nextval,'아이언맨3','2013-04-24','2013-06-27','셰인 블랙',9001309,6);

INSERT INTO movies(no,name,release_date,end_date,director,audience_num,genre)
VALUES(movies_seq.nextval,'겨울왕국','2014-01-16','2014-04-06','크리스 벅',10296101,3);

INSERT INTO movies(no,name,release_date,end_date,director,audience_num,genre)
VALUES(movies_seq.nextval,'월-E','2008-07-30','2008-10-01','앤드류 스탠튼',1320830,3);

INSERT INTO movies(no,name,release_date,end_date,director,audience_num,genre)
VALUES(movies_seq.nextval,'인셉션','2010-07-21','2010-10-27','크리스토퍼 놀란',5926948,4);

INSERT INTO movies(no,name,release_date,end_date,director,audience_num,genre)
VALUES(movies_seq.nextval,'다크나이트','2008-08-06','2008-10-01','크리스토퍼 놀란',4087355,6);

INSERT INTO movies(no,name,release_date,end_date,director,audience_num,genre)
VALUES(movies_seq.nextval,'인터스텔라','2014-11-06','2015-02-21','크리스토퍼 놀란',10304503,1);

INSERT INTO movies(no,name,release_date,end_date,director,audience_num,genre)
VALUES(movies_seq.nextval,'위플래쉬','2015-03-12','2015-03-21','다미엔 차젤레',1589048,2);

INSERT INTO movies(no,name,release_date,end_date,director,audience_num,genre)
VALUES(movies_seq.nextval,'라라랜드','2016-12-07','2017-04-19','다미엔 차젤레',3570389,5);
 
