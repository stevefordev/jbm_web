CREATE table "HOSTS" (
    "NO"         NUMBER(8,0) NOT NULL,
    "ID"         VARCHAR2(20) NOT NULL,
    "PASSWORD"   VARCHAR2(32) NOT NULL,
    "NICKNAME"   VARCHAR2(30) NOT NULL,
    "REGDATE"    TIMESTAMP NOT NULL,
    "PROFILE"    VARCHAR2(400) NOT NULL,
    constraint  "HOSTS_PK" primary key ("NO")
);

create sequence "HOSTS_SEQ"
start with 1
increment by 1
maxvalue 9999999999999999999
minvalue 1
nocache
nocycle
noorder;

CREATE TABLE  "PHONEBOOK" 
   ("NO" NUMBER(9,0) NOT NULL ENABLE, 
	"NAME" VARCHAR2(30) NOT NULL ENABLE, 
	"PHONE" VARCHAR2(11) NOT NULL ENABLE, 
	"GENDER" CHAR(1) NOT NULL ENABLE, 
	"BIRTH_DATE" DATE NOT NULL ENABLE, 
	"HOST_NO"  NUMBER(9,0) NOT NULL,
	"REGDATE"    TIMESTAMP NOT NULL,
	 CONSTRAINT "PHONEBOOK_PK" PRIMARY KEY ("NO") ENABLE
   );

ALTER TABLE "PHONEBOOK" ADD CONSTRAINT "PHONEBOOK_FK" 
FOREIGN KEY ("HOST_NO")
REFERENCES "HOSTS" ("NO");

CREATE SEQUENCE "PHONEBOOK_SEQ" 
start with 1
increment by 1
maxvalue 9999999999999999999
minvalue 1
nocache
nocycle
noorder;

INSERT INTO hosts(no,id,password,nickname,regdate,profile)
VALUES(hosts_seq.nextval,'jung','1111','정우성',systimestamp,'woosung.png');

INSERT INTO hosts(no,id,password,nickname,regdate,profile)
VALUES(hosts_seq.nextval,'shin','1111','신혜선',systimestamp,'shinhaesun.png');
