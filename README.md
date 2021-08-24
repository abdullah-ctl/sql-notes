 ### What is Database ?
Database is collectation of inter-related of inter-related data, from which we can easily manipulate data.

In a database have multiple entity & in a entity have multiple attributes.

 ### About SQL (intro).

SQL - Structured query language is used to communicate with a database. According to ANSI (American National Standards Institute), it is the standard language for relational database management systems.

 ### Create Database :

    CREATE DATABASE databasename;
#### Create Database with collation:
    CREATE DATABASE db_name 
    CHARACTER SET utf8
    COLLATE utf8mb4_general_ci;
#### Modify Database char & collation:
    ALTER DATABASE db_name
    [DEFAULT] CHARACTER SET charset_name]
    [DEFAULT] COLLATE collation_name]

 ### Delete Database :
    DROP DATABASE database_name;

 ### Create Table :
Syntax:

    Create table table_name(
        colmn_name datatype constrains
    );
<br>
Example:

    Create table users(
        id int not null auto_increment,
        name varchar(100),
        email varchar(50),
        password varchar(100),
        PRIMARY KEY(id)
    );

* [Constraints](#constraints) 
* [Data Types](#about-sql-intro)
* [Primary Key](#primary-key)

 ### Delete Table:
    DROP TABLE table_name

 ### Alter Table: 
The `ALTER TABLE` statement is used to add, delete, or modify columns in an existing table.
And  also used to add and drop various constraints on an existing table.

#### Rename Table:
    ALTER TABLE authors 
    RENAME author
#### Rename Column:
    ALTER TABLE table_name 
    change existing_column new_column_name datatype;
<!-- example -->
    ALTER TABLE author 
    change mail email varchar(20);

 #### Add Column:
    ALTER TABLE table_name 
    ADD column_name datatype;
<!-- example -->
    ALTER TABLE users 
    ADD password varchar(100);

 #### Drop Column:
    ALTER TABLE table_name
    DROP column_name;
<!-- example -->
    ALTER TABLE users 
    DROP password;

### Constraints:
SQL constraints (বাদ্ধ্যবাধকতা) are used to specify rules for data in a table.

Available constraints in SQL:
 * NOT NULL - Ensures that a column cannot have a NULL value
 * NULL - a column can have a NULL value
 * UNIQUE  - Ensures that all values in a column are different
 * DEFAULT 
 * PRIMARY KEY
 * FOREIGN KEY
 * CHECK
 * CREATE INDEX

#### Default: 
The `DEFAULT` constraint is used to set a default value for a column.

    column_name datatype DEFAULT value;
    
#### Primary key: 
The `PRIMARY KEY` constraint uniquely identifies each record in a table.
Primary keys must contain UNIQUE values, and cannot contain NULL values.
    
    CREATE TABLE Users (
        id int NOT NULL auto_increment,
        age int,
        PRIMARY KEY (id)
    );
#### Foregin  key: 
A `FOREIGN KEY` is a field (or collection of fields) in one table, that refers to the `PRIMARY KEY` in another table. 

    CREATE TABLE Users (
        id int NOT NULL auto_increment,
        age int,
        role_id int,
        PRIMARY KEY (id),
        FOREGIN KEY (role_id) REFERENCES roles(role_id)
    );

Add Foregin key on existing column of a table :

    ALTER TABLE Orders

    ADD FOREIGN KEY (PersonID)
    REFERENCES Persons(PersonID); 

Drop Foregin key form a table :

    ALTER TABLE Orders
    DROP FOREIGN KEY PersonID;

#### Check: 
The `CHECK` constraint is used to limit the value range that can be placed in a column.

    CREATE TABLE Users (
        ID int NOT NULL,
        LastName varchar(255) NOT NULL,
        FirstName varchar(255),
        Age int,
        CHECK (Age>=18)
    );
<!-- add-check -->
    ALTER TABLE users
    ADD CHECK (Age>=18);
<!-- drop check -->
    ALTER TABLE Persons
    DROP CHECK CHK_PersonAge;
    
#### Create Index:
The `CREATE INDEX` statement is used to create indexes in tables.
`Indexes` are used to retrieve data from the database more quickly than otherwise. The users cannot see the indexes, they are just used to speed up searches/queries.

    CREATE INDEX index_name
    ON table_name (col1,col2,...);
<!-- drop index -->
    ALTER TABLE table_name
    DROP INDEX index_name

[more explaination on index...](https://www.youtube.com/watch?v=E--yzX05_k8)

### Learning Resources:

* W3Schools
* Guru99
* [DBMS By Gate Smashers --tutorial_hindi](https://www.youtube.com/playlist?list=PLxCzCOWd7aiFAN6I8CuViBuCdJgiOkT2Y)
* geekforgeeks
* [Sololearn](https://www.sololearn.com/learning/1060)