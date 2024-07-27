```
$ liquibase --classpath=./mysql-connector-j-9.0.0.jar \
          --url=jdbc:mysql://0.0.0.0:3306/db \
          --username=user \
          --password=password \
          --changelog-file=example-changelog.xml \
          update-sql

####################################################
##   _     _             _ _                      ##
##  | |   (_)           (_) |                     ##
##  | |    _  __ _ _   _ _| |__   __ _ ___  ___   ##
##  | |   | |/ _` | | | | | '_ \ / _` / __|/ _ \  ##
##  | |___| | (_| | |_| | | |_) | (_| \__ \  __/  ##
##  \_____/_|\__, |\__,_|_|_.__/ \__,_|___/\___|  ##
##              | |                               ##
##              |_|                               ##
##                                                ## 
##  Get documentation at docs.liquibase.com       ##
##  Get certified courses at learn.liquibase.com  ## 
##                                                ##
####################################################
Starting Liquibase at 19:38:22 (version 4.28.0 #2272 built at 2024-05-16 19:00+0000)
Liquibase Version: 4.28.0
Liquibase Open Source 4.28.0 by Liquibase
--  Create Database Lock Table
CREATE TABLE db.DATABASECHANGELOGLOCK (ID INT NOT NULL, `LOCKED` TINYINT NOT NULL, LOCKGRANTED datetime NULL, LOCKEDBY VARCHAR(255) NULL, CONSTRAINT PK_DATABASECHANGELOGLOCK PRIMARY KEY (ID));

--  Initialize Database Lock Table
DELETE FROM db.DATABASECHANGELOGLOCK;

INSERT INTO db.DATABASECHANGELOGLOCK (ID, `LOCKED`) VALUES (1, 0);

--  Lock Database
UPDATE db.DATABASECHANGELOGLOCK SET `LOCKED` = 1, LOCKEDBY = 'tobita-mac-mini.local (fd8c:f1c1:40ab:c1e8:c68:a5a7:4778:1a19%bridge100)', LOCKGRANTED = NOW() WHERE ID = 1 AND `LOCKED` = 0;

--  Create Database Change Log Table
CREATE TABLE db.DATABASECHANGELOG (ID VARCHAR(255) NOT NULL, AUTHOR VARCHAR(255) NOT NULL, FILENAME VARCHAR(255) NOT NULL, DATEEXECUTED datetime NOT NULL, ORDEREXECUTED INT NOT NULL, EXECTYPE VARCHAR(10) NOT NULL, MD5SUM VARCHAR(35) NULL, `DESCRIPTION` VARCHAR(255) NULL, COMMENTS VARCHAR(255) NULL, TAG VARCHAR(255) NULL, LIQUIBASE VARCHAR(20) NULL, CONTEXTS VARCHAR(255) NULL, LABELS VARCHAR(255) NULL, DEPLOYMENT_ID VARCHAR(10) NULL);

--  *********************************************************************
--  Update Database Script
--  *********************************************************************
--  Change Log: example-changelog.xml
--  Ran at: 2024/07/27 19:38
--  Against: user@192.168.65.1@jdbc:mysql://0.0.0.0:3306/db
--  Liquibase version: 4.28.0
--  *********************************************************************

--  Changeset example-changelog.xml::1722076573192-1::tobita (generated)
ALTER TABLE db.user ADD age INT NOT NULL;

INSERT INTO db.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1722076573192-1', 'tobita (generated)', 'example-changelog.xml', NOW(), 1, '9:cd58abd7580a17932c4b4655694a00ed', 'addColumn tableName=user', '', 'EXECUTED', NULL, NULL, '4.28.0', '2076703288');

--  Release Database Lock
UPDATE db.DATABASECHANGELOGLOCK SET `LOCKED` = 0, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;

Liquibase command 'update-sql' was executed successfully.
```