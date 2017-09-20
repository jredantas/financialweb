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
  branch_name VARCHAR(100) NOT NULL
  participation_factor NUMERIC NOT NULL
);

drop table if exists account;
create table account (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  description INT NOT NULL,
  type INT NOT NULL, --1=bank account/2=credit card
);

drop table if exists expense;
create table expense (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  company VARCHAR(100) NOT NULL,
  due_date TIMESTAMP NOT NULL,
  amount DECIMAL(5,2) NOT NULL,
  installment_group INT NULL,
  installment INT NULL,
  account_id INT NULL
);

