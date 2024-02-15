CREATE DATABASE db_aa534f_pavlofo95;

USE db_aa534f_pavlofo95;
GO

CREATE TABLE categories (
    [id] INT PRIMARY KEY IDENTITY,
    [name] NVARCHAR(45) NOT NULL,
    [parent_id] INT NULL,
    FOREIGN KEY ([parent_id]) REFERENCES categories([id])
);

CREATE TABLE attributes (
    [id] INT PRIMARY KEY IDENTITY,
    [title] VARCHAR(45) NOT NULL,
    [slug] VARCHAR(45) NOT NULL,
    [type] VARCHAR(45) NOT NULL
);

CREATE TABLE d_values (
    [id] INT PRIMARY KEY IDENTITY,
    [value] VARCHAR(45) NOT NULL,
    [slug] VARCHAR(45) NOT NULL,
    [attribute_id] INT NOT NULL,
    FOREIGN KEY ([attribute_id]) REFERENCES attributes([id])
);

CREATE TABLE products (
    [id] INT PRIMARY KEY IDENTITY,
    [name] VARCHAR(255) NOT NULL,
    [description] TEXT,
    [sku] VARCHAR(45) NOT NULL,
    [price] INT,
    [price_id] INT NOT NULL,
    [category_id] INT NOT NULL,
    FOREIGN KEY ([category_id]) REFERENCES categories([id])
);

CREATE TABLE attribute_category (
    [category_id] INT NOT NULL,
    [attribute_id] INT NOT NULL,
    FOREIGN KEY ([category_id]) REFERENCES categories([id]),
    FOREIGN KEY ([attribute_id]) REFERENCES attributes([id])
);

CREATE TABLE product_d_value (
    [product_id] INT NOT NULL,
    [value_id] INT NOT NULL,
    FOREIGN KEY ([product_id]) REFERENCES products([id]),
    FOREIGN KEY ([value_id]) REFERENCES d_values([id])
);

INSERT INTO categories ([name], [parent_id]) VALUES ('New category', NULL);

INSERT INTO attributes ([title], [slug], [type]) VALUES ('Fat content', 'fat', 'text'); 
INSERT INTO attributes ([title], [slug], [type]) VALUES ('Package', 'packaging', 'text'); 

INSERT INTO d_values ([value], [slug], [attribute_id]) VALUES ('3.2%', '3-2', 1); 
INSERT INTO d_values ([value], [slug], [attribute_id]) VALUES ('2.5%', '2-5', 1);  
INSERT INTO d_values ([value], [slug], [attribute_id]) VALUES ('Plastic', 'plastic', 2); 
INSERT INTO d_values ([value], [slug], [attribute_id]) VALUES ('Cardboard', 'carton', 2); 

INSERT INTO products ([name], [description], [sku], [price], [price_id], [category_id]) 
VALUES ('Milk', 'Fresh cows milk', 'MLK01', 50.00, 1, 1);

INSERT INTO attribute_category ([category_id], [attribute_id]) VALUES (1, 1);  
INSERT INTO attribute_category ([category_id], [attribute_id]) VALUES (1, 2);  

INSERT INTO product_d_value ([product_id], [value_id]) VALUES (1, 2);

--DROP TABLE categories;
SELECT * FROM categories;
SELECT * FROM attributes;
SELECT * FROM d_values;
SELECT * FROM products;
SELECT * FROM attribute_category;
SELECT * FROM product_d_value;

