CREATE TABLE "hrm" (
	"emp_num"	NUMBER		NOT NULL        PRIMARY KEY,
	"users_num_authority_hrm"	NUMBER		NOT NULL,
	"emp_name"	varchar(20)		NOT NULL,
	"emp_rrnum"	varchar(13)		NOT NULL,
	"emp_email"	varchar(30)		NOT NULL,
	"emp_hp"	varchar(20)		NOT NULL,
	"emp_add"	varchar(30)		NULL,
	"emp_hiredate"	datetime		NOT NULL,
	"emp_regdate"	datetime		NOT NULL,
	"emp_dept"	varchar(10)		NOT NULL,
	"emp_position"	varchar(10)		NULL,
	"emp_salary"	NUMBER		NULL,
	"emp_remarks"	varchar(30)		NULL
);

CREATE TABLE "customer" (
	"customer_num"	NUMBER		NOT NULL,
	"users_num_authority_customer"	NUMBER		NOT NULL,
	"customer_name"	varchar(20)		NOT NULL,
	"customer_rrnum"	varchar(13)		NOT NULL,
	"customer_email"	varchar(30)		NOT NULL,
	"customer_hp"	varchar(20)		NOT NULL,
	"customer_add"	varchar(3)		NOT NULL,
	"customer_remarks"	varchar(30)		NULL
);

CREATE TABLE "supply_company" (
	"sc_num"	NUMBER		NOT NULL,
	"sc_users_num_authority"	NUMBER		NOT NULL,
	"sc_name"	varchar(20)		NOT NULL,
	"sc_materials"	varchar(20)		NOT NULL,
	"sc_remarks"	varchar(30)		NULL
);

CREATE TABLE "production" (
	"pd_num"	NUMBER		NOT NULL,
	"pd_emp_num_name"	NUMBER		NOT NULL,
	"pd_users_num_authority"	NUMBER		NOT NULL,
	"pd_name"	varchar(20)		NOT NULL,
	"pd_price"	NUMBER		NULL,
	"pd_date"	datetime		NOT NULL,
	"pd_count"	NUMBER		NOT NULL,
	"pd_remarks"	varchar(30)		NULL
);

CREATE TABLE "Materials_receive" (
	"mr_num"	NUMBER		NOT NULL,
	"mr_sc_num_name"	NUMBER		NOT NULL,
	"mr_users_num_authority"	NUMBER		NOT NULL,
	"mr_emp_num_receive_name"	NUMBER		NOT NULL,
	"mr_date"	datetime		NOT NULL,
	"mr_price"	NUMBER		NULL,
	"mr_name"	varchar(20)		NOT NULL,
	"mr_count"	NUMBER		NULL,
	"mr_remarks"	varchar(30)		NULL
);

CREATE TABLE "Materials_delivery" (
	"md_num"	NUMBER		NOT NULL,
	"md_sc_num_name"	NUMBER		NOT NULL,
	"md_users_num_authority"	NUMBER		NOT NULL,
	"md_emp_num_receive_name"	NUMBER		NOT NULL,
	"md_date"	datetime		NOT NULL,
	"md_price"	NUMBER		NULL,
	"md_name"	varchar(20)		NOT NULL,
	"md_count"	NUMBER		NULL,
	"md_remarks"	varchar(30)		NULL
);

CREATE TABLE "materials_stock" (
	"ms_num"	NUMBER		NOT NULL,
	"ms_mr_num_name_price"	NUMBER		NOT NULL,
	"ms_md_num_name_price"	NUMBER		NOT NULL,
	"ms_users_num_authority"	NUMBER		NOT NULL,
	"ms_remarks"	varchar(30)		NULL
);

CREATE TABLE "order" (
	"order_num"	NUMBER		NOT NULL,
	"order_customer_num_name"	NUMBER		NOT NULL,
	"order_pd_num_name_price"	NUMBER		NOT NULL,
	"order_emp_num_name"	NUMBER		NOT NULL,
	"order_users_num_authority"	NUMBER		NOT NULL,
	"order_deliverydate"	datetime		NOT NULL,
	"oreder_remarks"	varchar(30)		NULL
);

CREATE TABLE "users" (
	"users_num"	NUMBER		            NOT NULL        PRIMARY KEY,
	"users_id"	varchar(20)		        NOT NULL        UNIQUE,
	"users_pw"	varchar(20)		        NOT NULL,
	"users_name"	varchar(20)		    NOT NULL,
	"users_authority"	NUMBER		    NOT NULL,
	"users_rrnum"	varchar(13)		    NOT NULL,
	"users_email"	varchar(30)		    NOT NULL,
	"users_hp"	varchar(20)		        NOT NULL,
	"users_add"	varchar(30)		        NULL,
	"users_position"	varchar(10)		NOT NULL,
	"users_joindate"	DEFAULT sysdate NOT NULL,
	"users_remarks"	varchar(30)		    NULL
);


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


