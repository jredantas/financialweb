create database nobdan;

use nobdan;

drop table if exists contact;

create table contact (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  message VARCHAR(500) NOT NULL
);

GRANT INSERT ON contact TO 'admin'@'localhost';
