
DROP DATABASE IF EXISTS sakila_dw;
CREATE DATABASE sakila_dw;

USE sakila_dw;

CREATE TABLE D_Film (
	film_id INT,
	filmid INT,
	title VARCHAR(255),
	category VARCHAR(255),
	PRIMARY KEY (film_id)
);

CREATE TABLE D_Customer (
	customer_id INT,
	customerid INT,
	last_name VARCHAR(255),
	city VARCHAR(255),
	country VARCHAR(255),
	VERSION INT,
	DATE_FROM DATETIME,
	DATE_TO DATETIME,
	PRIMARY KEY (customer_id)
);

CREATE TABLE D_Time (
	time_id DATETIME,
	timeid INT NOT NULL AUTO_INCREMENT,
	day INT,
	month_id INT,
	MONTH_NAME VARCHAR(255),
	year INT,
	PRIMARY KEY (timeid)
);

CREATE TABLE fact_sales (
	rental_id INT,
	rentalid INT,
	measure DOUBLE,
	customer_id INT,
	film_id INT,
	time_id INT,
	PRIMARY KEY (rental_id),
	FOREIGN KEY (customer_id) REFERENCES D_Customer (customer_id),
	FOREIGN KEY (film_id) REFERENCES D_Film (film_id),
	FOREIGN KEY (time_id) REFERENCES D_Time (timeid)
);
