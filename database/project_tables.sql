--DROP DATABASE IF EXISTS project;
CREATE DATABASE project;
use project;



CREATE TABLE CUSTOMER( 
	CUS_ID varchar(10) primary key,
	RECIEVABLE_AMOUNT int not null,
	FIRST_NAME varchar(10) not null,
	LAST_NAME varchar(10) not null,
	ADDRESS varchar(30) not null,
	CONTACT varchar(20) not null

);

CREATE TABLE ORDERS(
	ORDER_ID varchar(10) primary KEY,
	CUS_ID varchar(10) NOT NULL,
	ORDER_DATE varchar(10) NOT NULL,
	PRICE INT NOT NULL,
	constraint foreign key(CUS_ID) references CUSTOMER(CUS_ID)
);

CREATE TABLE PRODUCTS(
	PROD_ID VARCHAR(10) PRIMARY KEY,
    	NAME VARCHAR(20) NOT NULL,
    	QUANTITY INT NOT NULL,
    	PRICE INT NOT NULL
);

CREATE TABLE OrderDetails(
    	ORDER_ID VARCHAR(10) NOT NULL,
    	PROD_ID VARCHAR(10) NOT NULL,
    	PROD_NAME VARCHAR(20) NOT NULL,
    	LINE_QTY VARCHAR(20) NOT NULL,
	constraint PRIMARY KEY (ORDER_ID,PROD_ID),
    	constraint foreign key(ORDER_ID) references ORDERS(ORDER_ID),
    	constraint foreign key(PROD_ID) references PRODUCTS(PROD_ID)
);


CREATE TABLE SUPPLIER(
    	SUPP_ID VARCHAR(10) PRIMARY KEY,
    	NAME VARCHAR(20) NOT NULL,
    	CONTACT VARCHAR(20) NOT NULL,
    	ADDRESS VARCHAR(30) NOT NULL,
    	PAYABLE_AMOUNT INT NOT NULL,
    	RECIEVABLE_AMOUNT INT NOT NULL
);


CREATE TABLE ItemSupplied(
    	SUPP_ID VARCHAR(10) NOT NULL,
    	PROD_ID VARCHAR(10) NOT NULL,
    	PRICE INT NOT NULL,
    	QUANTITY VARCHAR(30) NOT NULL,
    	constraint PRIMARY KEY (SUPP_ID,PROD_ID),
    	constraint foreign key(PROD_ID) references PRODUCTS(PROD_ID),
    	constraint foreign key(SUPP_ID) references SUPPLIER(SUPP_ID)
);

CREATE TABLE CUS_LOGIN(
	USER_NAME varchar(10) primary key,
	CUS_ID varchar(10) not null, 
	PASS varchar(30) not null,
	constraint foreign key(CUS_ID) references CUSTOMER(CUS_ID)
);

CREATE TABLE EMPLOYEE(
	EMP_ID varchar(10) primary key,
	FIRST_NAME varchar(10) not null,
	LAST_NAME varchar(10) not null,
	ADDRESS varchar(30) not null,
	CONTACT varchar(20) not null,
	TYPE varchar(10) not null
);

CREATE TABLE PICTURE(
	PIC_ID varchar(10) primary key,
	PROD_ID VARCHAR(10) not null,
	constraint foreign key(PROD_ID) references PRODUCTS(PROD_ID)
);
CREATE TABLE EMP_LOGIN(
	USER_NAME varchar(10) primary key,
	EMP_ID varchar(10) not null,
	PASS varchar(30) not null,
	constraint foreign key(EMP_ID) references EMPLOYEE(EMP_ID)
);


