create database  if not exists bloodDB;
use bloodDB;

CREATE TABLE hospitals (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100)
);


CREATE TABLE patients (
    id INT AUTO_INCREMENT PRIMARY KEY,
    hospital_id INT,
    name VARCHAR(100),
    contact_no VARCHAR(15),
    address VARCHAR(255),
    sex ENUM('Male', 'Female', 'Other'),
    age INT,
    blood VARCHAR(5),
    FOREIGN KEY (hospital_id) REFERENCES hospitals(id)
);


INSERT INTO hospitals (name) VALUES ('Hospital 1');
INSERT INTO hospitals (name) VALUES ('Hospital 2');
INSERT INTO hospitals (name) VALUES ('Hospital 3');
INSERT INTO hospitals (name) VALUES ('Hospital 4');
INSERT INTO hospitals (name) VALUES ('Hospital 5');


INSERT INTO patients (hospital_id, name, contact_no, address, sex, age, blood) VALUES (1, 'John Doe', '1234567890', '123 Main St', 'Male', 25, 'A+');
INSERT INTO patients (hospital_id, name, contact_no, address, sex, age, blood) VALUES (1, 'Alice Smith', '0987654321', '456 Oak St', 'Female', 30, 'B+');
INSERT INTO patients (hospital_id, name, contact_no, address, sex, age, blood) VALUES (1, 'Bob Johnson', '1122334455', '789 Pine St', 'Male', 22, 'O+');
INSERT INTO patients (hospital_id, name, contact_no, address, sex, age, blood) VALUES (1, 'Carol White', '2233445566', '101 Maple St', 'Female', 28, 'AB+');
INSERT INTO patients (hospital_id, name, contact_no, address, sex, age, blood) VALUES (1, 'David Brown', '3344556677', '202 Birch St', 'Male', 35, 'A-');
INSERT INTO patients (hospital_id, name, contact_no, address, sex, age, blood) VALUES (1, 'Eva Green', '4455667788', '303 Cedar St', 'Female', 27, 'B-');
INSERT INTO patients (hospital_id, name, contact_no, address, sex, age, blood) VALUES (1, 'Frank Black', '5566778899', '404 Spruce St', 'Male', 24, 'O-');
INSERT INTO patients (hospital_id, name, contact_no, address, sex, age, blood) VALUES (1, 'Gina Blue', '6677889900', '505 Elm St', 'Female', 26, 'AB-');
INSERT INTO patients (hospital_id, name, contact_no, address, sex, age, blood) VALUES (1, 'Harry Gold', '7788990011', '606 Ash St', 'Male', 33, 'A+');
INSERT INTO patients (hospital_id, name, contact_no, address, sex, age, blood) VALUES (1, 'Ivy Silver', '8899001122', '707 Cherry St', 'Female', 29, 'B+');


INSERT INTO patients (hospital_id, name, contact_no, address, sex, age, blood) VALUES (2, 'John Doe', '1234567890', '123 Main St', 'Male', 25, 'A+');
INSERT INTO patients (hospital_id, name, contact_no, address, sex, age, blood) VALUES (2, 'Alice Smith', '0987654321', '456 Oak St', 'Female', 30, 'B+');
INSERT INTO patients (hospital_id, name, contact_no, address, sex, age, blood) VALUES (2, 'Bob Johnson', '1122334455', '789 Pine St', 'Male', 22, 'O+');
INSERT INTO patients (hospital_id, name, contact_no, address, sex, age, blood) VALUES (2, 'Carol White', '2233445566', '101 Maple St', 'Female', 28, 'AB+');
INSERT INTO patients (hospital_id, name, contact_no, address, sex, age, blood) VALUES (2, 'David Brown', '3344556677', '202 Birch St', 'Male', 35, 'A-');
INSERT INTO patients (hospital_id, name, contact_no, address, sex, age, blood) VALUES (2, 'Eva Green', '4455667788', '303 Cedar St', 'Female', 27, 'B-');
INSERT INTO patients (hospital_id, name, contact_no, address, sex, age, blood) VALUES (2, 'Frank Black', '5566778899', '404 Spruce St', 'Male', 24, 'O-');
INSERT INTO patients (hospital_id, name, contact_no, address, sex, age, blood) VALUES (2, 'Gina Blue', '6677889900', '505 Elm St', 'Female', 26, 'AB-');
INSERT INTO patients (hospital_id, name, contact_no, address, sex, age, blood) VALUES (2, 'Harry Gold', '7788990011', '606 Ash St', 'Male', 33, 'A+');
INSERT INTO patients (hospital_id, name, contact_no, address, sex, age, blood) VALUES (2, 'Ivy Silver', '8899001122', '707 Cherry St', 'Female', 29, 'B+');


INSERT INTO patients (hospital_id, name, contact_no, address, sex, age, blood) VALUES (3, 'John Doe', '1234567890', '123 Main St', 'Male', 25, 'A+');
INSERT INTO patients (hospital_id, name, contact_no, address, sex, age, blood) VALUES (3, 'Alice Smith', '0987654321', '456 Oak St', 'Female', 30, 'B+');
INSERT INTO patients (hospital_id, name, contact_no, address, sex, age, blood) VALUES (3, 'Bob Johnson', '1122334455', '789 Pine St', 'Male', 22, 'O+');
INSERT INTO patients (hospital_id, name, contact_no, address, sex, age, blood) VALUES (3, 'Carol White', '2233445566', '101 Maple St', 'Female', 28, 'AB+');
INSERT INTO patients (hospital_id, name, contact_no, address, sex, age, blood) VALUES (3, 'David Brown', '3344556677', '202 Birch St', 'Male', 35, 'A-');
INSERT INTO patients (hospital_id, name, contact_no, address, sex, age, blood) VALUES (3, 'Eva Green', '4455667788', '303 Cedar St', 'Female', 27, 'B-');
INSERT INTO patients (hospital_id, name, contact_no, address, sex, age, blood) VALUES (3, 'Frank Black', '5566778899', '404 Spruce St', 'Male', 24, 'O-');
INSERT INTO patients (hospital_id, name, contact_no, address, sex, age, blood) VALUES (3, 'Gina Blue', '6677889900', '505 Elm St', 'Female', 26, 'AB-');
INSERT INTO patients (hospital_id, name, contact_no, address, sex, age, blood) VALUES (3, 'Harry Gold', '7788990011', '606 Ash St', 'Male', 33, 'A+');
INSERT INTO patients (hospital_id, name, contact_no, address, sex, age, blood) VALUES (3, 'Ivy Silver', '8899001122', '707 Cherry St', 'Female', 29, 'B+');


INSERT INTO patients (hospital_id, name, contact_no, address, sex, age, blood) VALUES (4, 'John Doe', '1234567890', '123 Main St', 'Male', 25, 'A+');
INSERT INTO patients (hospital_id, name, contact_no, address, sex, age, blood) VALUES (4, 'Alice Smith', '0987654321', '456 Oak St', 'Female', 30, 'B+');
INSERT INTO patients (hospital_id, name, contact_no, address, sex, age, blood) VALUES (4, 'Bob Johnson', '1122334455', '789 Pine St', 'Male', 22, 'O+');
INSERT INTO patients (hospital_id, name, contact_no, address, sex, age, blood) VALUES (4, 'Carol White', '2233445566', '101 Maple St', 'Female', 28, 'AB+');
INSERT INTO patients (hospital_id, name, contact_no, address, sex, age, blood) VALUES (4, 'David Brown', '3344556677', '202 Birch St', 'Male', 35, 'A-');
INSERT INTO patients (hospital_id, name, contact_no, address, sex, age, blood) VALUES (4, 'Eva Green', '4455667788', '303 Cedar St', 'Female', 27, 'B-');
INSERT INTO patients (hospital_id, name, contact_no, address, sex, age, blood) VALUES (4, 'Frank Black', '5566778899', '404 Spruce St', 'Male', 24, 'O-');
INSERT INTO patients (hospital_id, name, contact_no, address, sex, age, blood) VALUES (4, 'Gina Blue', '6677889900', '505 Elm St', 'Female', 26, 'AB-');
INSERT INTO patients (hospital_id, name, contact_no, address, sex, age, blood) VALUES (4, 'Harry Gold', '7788990011', '606 Ash St', 'Male', 33, 'A+');
INSERT INTO patients (hospital_id, name, contact_no, address, sex, age, blood) VALUES (4, 'Ivy Silver', '8899001122', '707 Cherry St', 'Female', 29, 'B+');


INSERT INTO patients (hospital_id, name, contact_no, address, sex, age, blood) VALUES (5, 'John Doe', '1234567890', '123 Main St', 'Male', 25, 'A+');
INSERT INTO patients (hospital_id, name, contact_no, address, sex, age, blood) VALUES (5, 'Alice Smith', '0987654321', '456 Oak St', 'Female', 30, 'B+');
INSERT INTO patients (hospital_id, name, contact_no, address, sex, age, blood) VALUES (5, 'Bob Johnson', '1122334455', '789 Pine St', 'Male', 22, 'O+');
INSERT INTO patients (hospital_id, name, contact_no, address, sex, age, blood) VALUES (5, 'Carol White', '2233445566', '101 Maple St', 'Female', 28, 'AB+');
INSERT INTO patients (hospital_id, name, contact_no, address, sex, age, blood) VALUES (5, 'David Brown', '3344556677', '202 Birch St', 'Male', 35, 'A-');
INSERT INTO patients (hospital_id, name, contact_no, address, sex, age, blood) VALUES (5, 'Eva Green', '4455667788', '303 Cedar St', 'Female', 27, 'B-');
INSERT INTO patients (hospital_id, name, contact_no, address, sex, age, blood) VALUES (5, 'Frank Black', '5566778899', '404 Spruce St', 'Male', 24, 'O-');
INSERT INTO patients (hospital_id, name, contact_no, address, sex, age, blood) VALUES (5, 'Gina Blue', '6677889900', '505 Elm St', 'Female', 26, 'AB-');
INSERT INTO patients (hospital_id, name, contact_no, address, sex, age, blood) VALUES (5, 'Harry Gold', '7788990011', '606 Ash St', 'Male', 33, 'A+');
INSERT INTO patients (hospital_id, name, contact_no, address, sex, age, blood) VALUES (5, 'Ivy Silver', '8899001122', '707 Cherry St', 'Female', 29, 'B+');


SELECT name, age, hospital_id
FROM patients
WHERE age > (
    SELECT AVG(age)
    FROM patients AS sub
    WHERE sub.hospital_id = patients.hospital_id
);


SELECT h.name AS hospital, COUNT(p.id) AS patient_count
FROM hospitals h
JOIN patients p ON h.id = p.hospital_id
WHERE p.age >= 30
GROUP BY h.id
HAVING patient_count > 5;

SELECT name, address
FROM patients
WHERE name LIKE 'J%' OR address LIKE '%St%';

CREATE TABLE patient_audit (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    action VARCHAR(50),
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


DELIMITER //
CREATE TRIGGER after_patient_insert
AFTER INSERT ON patients
FOR EACH ROW
BEGIN
    INSERT INTO patient_audit (patient_id, action)
    VALUES (NEW.id, 'New patient added');
END //
DELIMITER ;

CREATE VIEW a_positive_patients AS
SELECT p.name, p.age, p.blood, h.name AS hospital
FROM patients p
JOIN hospitals h ON p.hospital_id = h.id
WHERE p.blood = 'A+';

SELECT name, age, hospital_id,
       RANK() OVER (PARTITION BY hospital_id ORDER BY age DESC) AS age_rank
FROM patients;

CREATE TABLE donations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    donation_date DATE,
    FOREIGN KEY (patient_id) REFERENCES patients(id)
);



SELECT p.name, d.donation_date, h.name AS hospital
FROM donations d
JOIN patients p ON d.patient_id = p.id
JOIN hospitals h ON p.hospital_id = h.id
WHERE d.donation_date > '2025-01-01';

