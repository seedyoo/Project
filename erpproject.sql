CREATE TABLE hrm (
	emp_num	NUMBER		NOT NULL    PRIMARY KEY,
	users_num_authority_hrm	NUMBER		NOT NULL,
	emp_name	varchar(20)		NOT NULL,
	emp_rrnum	varchar(13)		NOT NULL,
	emp_email	varchar(30)		NOT NULL,
	emp_hp	varchar(20)		NOT NULL,
	emp_add	varchar(30)		NULL,
	emp_hiredate	DATE    DEFAULT sysdate NOT NULL,
	emp_regdate	DATE    DEFAULT sysdate NOT NULL,
	emp_dept	varchar(10)		NOT NULL,
	emp_position	varchar(10)		NULL,
	emp_salary	NUMBER		NULL,
	emp_remarks	varchar(30)		NULL
);

CREATE TABLE customer (
	customer_num	NUMBER		NOT NULL    PRIMARY KEY,
	users_num_authority_customer	NUMBER		NOT NULL,
	customer_name	varchar(20)		NOT NULL,
	customer_rrnum	varchar(13)		NOT NULL,
	customer_email	varchar(30)		NOT NULL,
	customer_hp	varchar(20)		NOT NULL,
	customer_add	varchar(3)		NOT NULL,
	customer_remarks	varchar(30)		NULL
);

CREATE TABLE supply_company (
	sc_num	NUMBER		NOT NULL    PRIMARY KEY,
	sc_users_num_authority	NUMBER		NOT NULL,
	sc_name	varchar(20)		NOT NULL,
	sc_materials	varchar(20)		NOT NULL,
	sc_remarks	varchar(30)		NULL
);

CREATE TABLE production (
	pd_num	NUMBER		NOT NULL    PRIMARY KEY,
	pd_emp_num_name	NUMBER		NOT NULL,
	pd_users_num_authority	NUMBER		NOT NULL,
	pd_name	varchar(20)		NOT NULL,
	pd_price	NUMBER		NULL,
	pd_date	DATE    DEFAULT sysdate NOT NULL,
	pd_count	NUMBER		NOT NULL,
	pd_remarks	varchar(30)		NULL
);

CREATE TABLE Materials_receive (
	mr_num	NUMBER		NOT NULL    PRIMARY KEY,
	mr_sc_num_name	NUMBER		NOT NULL,
	mr_users_num_authorit	NUMBER		NOT NULL,
	mr_emp_num_receive_name	NUMBER		NOT NULL,
	mr_date	DATE    DEFAULT sysdate NOT NULL,
	mr_price	NUMBER		NULL,
	mr_name	varchar(20)		NOT NULL,
	mr_count	NUMBER		NULL,
	mr_remarks	varchar(30)		NULL
);

CREATE TABLE Materials_delivery (
	md_num	NUMBER		NOT NULL PRIMARY KEY,
	md_sc_num_name	NUMBER		NOT NULL,
	md_users_num_authority	NUMBER		NOT NULL,
	md_emp_num_receive_name	NUMBER		NOT NULL,
	md_date	DATE    DEFAULT sysdate NOT NULL,
	md_price	NUMBER		NULL,
	md_name	varchar(20)		NOT NULL,
	md_count	NUMBER		NULL,
	md_remarks	varchar(30)		NULL
);

CREATE TABLE materials_stock (
	ms_num	NUMBER		NOT NULL    PRIMARY KEY,
	ms_mr_num_name_price	NUMBER		NOT NULL,
	ms_md_num_name_price	NUMBER		NOT NULL,
	ms_users_num_authority	NUMBER		NOT NULL,
	ms_remarks	varchar(30)		NULL
);

CREATE TABLE erporder (
	order_num	NUMBER		NOT NULL    PRIMARY KEY,
	order_customer_num_name	NUMBER		NOT NULL,
	order_pd_num_name_price	NUMBER		NOT NULL,
	order_emp_num_name	NUMBER		NOT NULL,
	order_users_num_authority	NUMBER		NOT NULL,
	order_deliverydate	DATE    DEFAULT sysdate NOT NULL,
	oreder_remarks	varchar(30)		NULL
);

CREATE TABLE users (
	users_num	NUMBER		NOT NULL    PRIMARY KEY,
	users_id	varchar(20)		NOT NULL,
	users_pw	varchar(20)		NOT NULL,
	users_name	varchar(20)		NOT NULL,
	users_authority	NUMBER(10)		NOT NULL,
	users_rrnum	varchar(13)		NOT NULL,
	users_email	varchar(30)		NOT NULL,
	users_hp	varchar(20)		NOT NULL,
	users_add	varchar(30)		NULL,
	users_position	varchar(10)		NOT NULL,
	users_join	DATE    DEFAULT sysdate NOT NULL,
	users_remarks	varchar(30)		NULL
);


/*
Primary key
*/
ALTER TABLE "hrm" ADD CONSTRAINT "PK_HRM" PRIMARY KEY (
	"emp_num"
);

ALTER TABLE "customer" ADD CONSTRAINT "PK_CUSTOMER" PRIMARY KEY (
	"customer_num"
);

ALTER TABLE "supply_company" ADD CONSTRAINT "PK_SUPPLY_COMPANY" PRIMARY KEY (
	"sc_num"
);

ALTER TABLE "production" ADD CONSTRAINT "PK_PRODUCTION" PRIMARY KEY (
	"pd_num"
);

ALTER TABLE "Materials_receive" ADD CONSTRAINT "PK_MATERIALS_RECEIVE" PRIMARY KEY (
	"mr_num"
);

ALTER TABLE "Materials_delivery" ADD CONSTRAINT "PK_MATERIALS_DELIVERY" PRIMARY KEY (
	"md_num"
);

ALTER TABLE "materials_stock" ADD CONSTRAINT "PK_MATERIALS_STOCK" PRIMARY KEY (
	"ms_num"
);

ALTER TABLE "order" ADD CONSTRAINT "PK_ORDER" PRIMARY KEY (
	"order_num"
);

ALTER TABLE "users" ADD CONSTRAINT "PK_USERS" PRIMARY KEY (
	"users_num"
);

/*
foreign key
외래키
*/
ALTER TABLE hrm ADD CONSTRAINT FK_users_TO_hrm_1 FOREIGN KEY (
	users_num_authority_hrm
)
REFERENCES users (
	users_num
);

ALTER TABLE customer ADD CONSTRAINT FK_users_TO_customer_1 FOREIGN KEY (
	users_num_authority_customer
)
REFERENCES users (
	users_num
);

ALTER TABLE supply_company ADD CONSTRAINT FK_users_TO_supply_company_1 FOREIGN KEY (
	sc_users_num_authority
)
REFERENCES users (
	users_num
);

ALTER TABLE production ADD CONSTRAINT FK_hrm_TO_production_1 FOREIGN KEY (
	pd_emp_num_name
)
REFERENCES hrm (
	emp_num
);

ALTER TABLE production ADD CONSTRAINT FK_users_TO_production_1 FOREIGN KEY (
	pd_users_num_authority
)
REFERENCES users (
	users_num
);

ALTER TABLE Materials_receive ADD CONSTRAINT FK_supply_company_TO_Materials_receive_1 FOREIGN KEY (
	mr_sc_num_name
)
REFERENCES supply_company (
	sc_num
);

ALTER TABLE Materials_receive ADD CONSTRAINT FK_users_TO_Materials_receive_1 FOREIGN KEY (
	mr_users_num_authority
)
REFERENCES users (
	users_num
);

ALTER TABLE Materials_receive ADD CONSTRAINT FK_hrm_TO_Materials_receive_1 FOREIGN KEY (
	mr_emp_num_receive_name
)
REFERENCES hrm (
	emp_num
);

ALTER TABLE Materials_delivery ADD CONSTRAINT FK_supply_company_TO_Materials_delivery_1 FOREIGN KEY (
	md_sc_num_name
)
REFERENCES supply_company (
	sc_num
);

ALTER TABLE Materials_delivery ADD CONSTRAINT FK_users_TO_Materials_delivery_1 FOREIGN KEY (
	md_users_num_authority
)
REFERENCES users (
	users_num
);

ALTER TABLE Materials_delivery ADD CONSTRAINT FK_hrm_TO_Materials_delivery_1 FOREIGN KEY (
	md_emp_num_receive_name
)
REFERENCES hrm (
	emp_num
);

ALTER TABLE materials_stock ADD CONSTRAINT FK_Materials_receive_TO_materials_stock_1 FOREIGN KEY (
	ms_mr_num_name_price
)
REFERENCES Materials_receive (
	mr_num
);

ALTER TABLE materials_stock ADD CONSTRAINT FK_Materials_delivery_TO_materials_stock_1 FOREIGN KEY (
	ms_md_num_name_price
)
REFERENCES Materials_delivery (
	md_num
);

ALTER TABLE materials_stock ADD CONSTRAINT FK_users_TO_materials_stock_1 FOREIGN KEY (
	ms_users_num_authority
)
REFERENCES users (
	users_num
);

ALTER TABLE erporder ADD CONSTRAINT FK_customer_TO_erporder_1 FOREIGN KEY (
	order_customer_num_name
)
REFERENCES customer (
	customer_num
);

ALTER TABLE erporder ADD CONSTRAINT FK_production_TO_erporder_1 FOREIGN KEY (
	order_pd_num_name_price
)
REFERENCES production (
	pd_num
);

ALTER TABLE erporder ADD CONSTRAINT FK_hrm_TO_erporder_1 FOREIGN KEY (
	order_emp_num_name
)
REFERENCES hrm (
	emp_num
);

ALTER TABLE erporder ADD CONSTRAINT FK_users_TO_erporder_1 FOREIGN KEY (
	order_users_num_authority
)
REFERENCES users (
	users_num
);

-- 시퀀스 생성
CREATE SEQUENCE materials_stock_sequence
        INCREMENT BY 1
        START WITH 1
        MINVALUE 1
        MAXVALUE 10000;
-- 현재 순번
SELECT users_sequence.currval FROM dual;

-- 다음 순번
SELECT users_sequence.nextval FROM dual;




-- users_sequence 를 이용하여, users 의 users_num 가
-- 시퀀스 번호로 적용될 수 있도록 데이터를 추가해보시오.
TRUNCATE TABLE users;

INSERT INTO users 
( users_num, users_id, users_pw, users_name, users_authority, users_rrnum, 
users_email, users_hp, users_add, users_position, users_join, users_remarks)
VALUES (
      users_sequence.nextval, 'human', '123456', '김휴먼',
      '2', '32131', '32@naver.com', '010-1234-5667', 
      null,'대리', sysdate, null);

-- 덤프파일 import (CMD)
cd 덤프파일 경로
imp note/123456 file=expall.dmp log=expall.log ignore=y grants=y rows=y indexes=y full=y

/*  
테이블 삭제
*/
DROP TABLE users;






