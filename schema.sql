create database nobdan;

use nobdan;

drop table if exists contact;
create table contact (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  message VARCHAR(500) NOT NULL
);

drop table if exists person;
create table person (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  company VARCHAR(100) NULL,
  email VARCHAR(100) NOT NULL,
  passwd VARCHAR(8) NOT NULL
);

drop table if exists enterprise;
create table enterprise (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  enterprise_id INT NOT NULL,
  branch_id INT NOT NULL, 
  enterprise_name VARCHAR(100) NOT NULL,
  branch_name VARCHAR(100) NOT NULL,
  participation_factor DECIMAL(9,2) NOT NULL
);

drop table if exists account;
create table account (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  description INT NOT NULL,
  type INT NOT NULL --1=bank account/2=credit card
);

drop table if exists expense;
create table expense (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  company VARCHAR(100) NOT NULL,
  due_date TIMESTAMP NOT NULL,
  amount DECIMAL(9,2) NOT NULL,
  installment_group INT NULL,
  installment INT NULL,
  account_id INT NULL
);

drop table if exists income;
create table income (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  company VARCHAR(100) NOT NULL,
  pay_date TIMESTAMP NOT NULL,
  amount DECIMAL(9,2) NOT NULL,
  description VARCHAR(100) NULL,
  type INT NULL,
  account_id INT NULL
);

INSERT INTO expense(company, due_date, amount, installment_group, installment, account_id) 
VALUES ('Coelce','20171005',212.35,0,1,1);
INSERT INTO expense(company, due_date, amount, installment_group, installment, account_id) 
VALUES ('Cagece','20171001',78.56,0,1,1);
INSERT INTO expense(company, due_date, amount, installment_group, installment, account_id) 
VALUES ('Vivo','20171017',98.00,0,1,2);

INSERT INTO income(company, pay_date, amount, account_id) 
VALUES ('SERPRO','20170930',8200.00,1);
INSERT INTO income(company, pay_date, amount, account_id) 
VALUES ('DAG','20171001',7500.00,2);

