CREATE table "IDOLS" (
"NO" NUMBER(7,0) NOT NULL,
"NAME" VARCHAR2(100) NOT NULL,
"HEIGHT" NUMBER(3,0) NOT NULL,
"WEIGHT" NUMBER(3,0) NOT NULL,
"BIRTH_DATE" DATE NOT NULL,
"GROUP_NO" NUMBER(6,0) NOT NULL,
constraint "IDOLS_PK" primary key ("NO")
);

CREATE table "GROUPS" (
"NO" NUMBER(6,0) NOT NULL,
"NAME" VARCHAR2(100) NOT NULL,
"DEBUT_DATE" DATE NOT NULL,
constraint "GROUPS_PK" primary key ("NO")
)

ALTER TABLE "IDOLS" ADD CONSTRAINT "IDOLS_FK"
FOREIGN KEY ("GROUP_NO")
REFERENCES "GROUPS" ("NO");



create sequence "GROUPS_SEQ"
start with 1
increment by 1
maxvalue 999999
minvalue 1
nocache
nocycle
noorder;

create sequence "IDOLS_SEQ"
start with 1
increment by 1
maxvalue 999999
minvalue 1
nocache
nocycle
noorder;

