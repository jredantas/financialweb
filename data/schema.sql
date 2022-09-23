CREATE DATABASE nobdan
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_unicode_ci;

use nobdan;

/*Primeira versão*/
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
  passwd VARCHAR(128) NOT NULL
);

drop table if exists family;
create table family (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  family_id INT NOT NULL,
  person_id INT NOT NULL,
  family_name VARCHAR(100) NOT NULL,
  /*branch_name VARCHAR(100) NOT NULL,*/
  participation_factor DECIMAL(9,2) NOT NULL
);

drop table if exists account;
create table account (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  description VARCHAR(100) NOT NULL,
  type INT NOT NULL /* 1=bank account/2=credit card */
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

ALTER TABLE expense
ADD INDEX fk_expense_account_idx (account_id ASC);
ALTER TABLE expense
ADD CONSTRAINT fk_expense_account
  FOREIGN KEY (account_id)
  REFERENCES account (id)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

drop table if exists income;
create table income (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  company VARCHAR(100) NOT NULL,
  pay_date TIMESTAMP NOT NULL,
  amount DECIMAL(9,2) NOT NULL,
  description VARCHAR(100) NULL,
  typeof INT NULL,
  account_id INT NULL
);
