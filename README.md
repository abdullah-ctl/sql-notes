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

 ### Add Column:
    ALTER TABLE table_name 
    ADD column_name datatype;
<!-- example -->
    ALTER TABLE users 
    ADD password varchar(100);

 ### Drop Column:
    ALTER TABLE table_name
    DROP column_name;
<!-- example -->
    ALTER TABLE users 
    DROP password;