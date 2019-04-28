CREATE SCHEMA CONFIG;
CREATE SCHEMA BUSINESS;
CREATE SCHEMA MENU;
CREATE SCHEMA SLA;
CREATE SCHEMA PROMO;
CREATE SCHEMA DELIVERY;
CREATE SCHEMA ORDERING;
CREATE SCHEMA SHOPPING;

CREATE TABLE BUSINESS.ORGANIZATION (
    ID INTEGER,
    NAME VARCHAR(30)
);

CREATE TABLE BUSINESS.UNITY (
    ID INTEGER,
    ORGANIZATION_ID INTEGER,
    NAME VARCHAR(30),
);

CREATE TABLE ORDERING.REQUESTS (
    ID INTEGER,
    CUSTOMER_ID INTEGER,
    CREATION DATETIME,
    STATUS VARCHAR(10)
);

CREATE TABLE ORDERING.ORDERS (
    ID INTEGER,
    UNITY_ID INTEGER,
    QUEUE_ID INTEGER,
    CUSTOMER_ID INTEGER,
    ADRRESS_ID INTEGER,
    REQUEST_ID INTEGER,
    CREATION DATETIME,
    COOKCOMPLETE DATETIME
);

CREATE TABLE ORDERING.CUSTOMERS (
    ID INTEGER,
    NAME VARCHAR(80),
    MIDDLE_NAME VARCHAR(80),
    LAST_NAME VARCHAR(60),
    BIRTHDATE DATETIME
);

CREATE TABLE ORDERING.ADDRESS (
    ID INTEGER,
    CUSTOMER_ID INTEGER,
    CEP INTEGER(8),
    COUNTRY VARCHAR(30),
    STREET VARCHAR(50),
    NUMBER VARCHAR(15),
    NEIGHBORHOOD VARCHAR(50),
    COMPLEMENT VARCHAR(50),
    LATITUDE FLOAT(10,6),
    LONGITUDE FLOAT(10,6)
);

CREATE TABLE ORDERING.QUEUES (
    ID INTEGER,
    NAME VARCHAR(25),
    DESCRIPTION (50)
);

CREATE TABLE MENU.CART (
    ID INTEGER,
    CUSTOMER_ID INTEGER,
);

CREATE TABLE MENU.OPTIONS (
    ID INTEGER,
    SLA_ID INTEGER,
    NAME VARCHAR(50),
    PRICE FLOAT(10,6),
    CLASS_ID INTEGER,
    EXPIRATION DATETIME
);

CREATE TABLE MENU.CLASSES (
    ID INTEGER,
    NAME VARCHAR(12)
);

CREATE TABLE PROMO.PROMOTION (
    ID INTEGER,
    NAME VARCHAR(80),
    EXPIRATION DATETIME
);

CREATE TABLE PROMO.CUPOMS (
    ID INTEGER,
    CUPOM VARCHAR(8),
    EXPIRATION DATETIME,
    DISCOUNT FLOAT(10,6),
    ALLOWENCE FLOAT(10,6)
);

CREATE TABLE SHOPING.STUFFS (
    ID INTEGER,
    NAME VARCHAR (30),
    QUANTITY INTEGER
);

CREATE TABLE DELIVERY.TRAVELS (
    ID INTEGER,
    ORDER_ID INTEGER,
    TRAVELER_ID INTEGER,
    CREATIONDATE DATETIME,
    FINISHDATE DATETIME,
    DISTANCE FLOAT(16,2)
);

ALTER TABLE ORDERING.ORDERS ADD PRIMARY KEY (ID);
ALTER TABLE ORDERING.CUSTOMERS ADD PRIMARY KEY (ID);
ALTER TABLE ORDERING.CART ADD PRIMARY KEY (ID);
ALTER TABLE ORDERING.QUEUE ADD PRIMARY KEY (ID);
ALTER TABLE ORDERING.ADDRESS ADD PRIMARY KEY (ID);

ALTER TABLE MENU.OPTIONS ADD PRIMARY KEY (ID);
ALTER TABLE MENU.CLASSES ADD PRIMARY KEY (ID);

ALTER TABLE PROMO.CUPONS ADD PRIMARY KEY (ID);

ALTER TABLE ORDERING.ORDERS ADD FOREIGN KEY (QUEUE_ID) REFERENCES ORDERING.QUEUES(ID);
ALTER TABLE ORDERING.ORDERS ADD FOREIGN KEY (CUSTOMER_ID) REFERENCES ORDERING.CUSTOMERS(ID);
ALTER TABLE ORDERING.ORDERS ADD FOREIGN KEY (ADDRESS_ID) REFERENCES ORDERING.ADDRESS(ID);
