/*Segunda versão*/
ALTER DATABASE nobdan CHARACTER SET utf8 COLLATE utf8_unicode_ci;
ALTER TABLE contact CONVERT TO CHARACTER SET utf8 COLLATE utf8_unicode_ci;
ALTER TABLE person CONVERT TO CHARACTER SET utf8 COLLATE utf8_unicode_ci;
ALTER TABLE family CONVERT TO CHARACTER SET utf8 COLLATE utf8_unicode_ci;
ALTER TABLE account CONVERT TO CHARACTER SET utf8 COLLATE utf8_unicode_ci;
ALTER TABLE expense CONVERT TO CHARACTER SET utf8 COLLATE utf8_unicode_ci;
ALTER TABLE income CONVERT TO CHARACTER SET utf8 COLLATE utf8_unicode_ci;

ALTER TABLE expense ADD COLUMN group1 VARCHAR(50) NULL;
ALTER TABLE expense ADD COLUMN group2 VARCHAR(50) NULL;
ALTER TABLE expense ADD COLUMN username VARCHAR(100) NULL;
ALTER TABLE expense ADD COLUMN private BOOLEAN NULL;

drop table if exists expense_group;
create table expense_group (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  description VARCHAR(100) NOT NULL,
  due_date TIMESTAMP NOT NULL,
  username VARCHAR(100) NOT NULL,
  private BOOLEAN NOT NULL
);

ALTER TABLE expense ADD COLUMN expense_group_id INT NULL;

ALTER TABLE expense
ADD INDEX fk_expense_group_idx (expense_group_id ASC);
ALTER TABLE expense
ADD CONSTRAINT fk_expense_group
  FOREIGN KEY (expense_group_id)
  REFERENCES expense_group (id)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
