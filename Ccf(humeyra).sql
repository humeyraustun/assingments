CREATE DATABASE Manufacturer;

USE Manufacturer


CREATE TABLE Product
(
Product_id INT,
Product_name VARCHAR(MAX),
Quantity INT
PRIMARY KEY (Product_id)
)


---

CREATE TABLE COMPONENT
(
Component_id INT PRIMARY KEY,
Comp_name VARCHAR(MAX),
[DESCRIPTION] VARCHAR(MAX),
Quantity INT 
);


----


CREATE TABLE SUPPLIER
(
Supp_id INT,
Supp_name VARCHAR(MAX),
act_status BIT,
PRIMARY KEY (Supp_id)
)


---

CREATE TABLE PROD_COMP
(
Product_id INT,
Component_id INT,
PRIMARY KEY (Product_id,Component_id),
FOREIGN KEY (Product_id) REFERENCES PRODUCT (Product_id),
FOREIGN KEY (Component_id) REFERENCES COMPONENT (Component_id)
)

---


CREATE TABLE COMP_SUPP
(
Component_id INT,
Supp_id INT,
Date DATE,
Order_quantity INT,
PRIMARY KEY (Component_id, Supp_id ),
FOREIGN KEY (Supp_id) REFERENCES SUPPLIER (Supp_id ),
FOREIGN KEY (Component_id) REFERENCES COMPONENT (Component_id)
)


© 2021 GitHub, Inc.