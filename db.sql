CREATE DATABASE IF NOT EXISTS Parking_System;
USE Parking_System;

CREATE TABLE IF NOT EXISTS login (
    username VARCHAR(50) PRIMARY KEY,
    password VARCHAR(255) NOT NULL,
    user_type VARCHAR(20) NOT NULL, -- 'admin' or 'customer'
    last_login DATETIME
);

CREATE TABLE IF NOT EXISTS customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    name VARCHAR(100),
    phone VARCHAR(20),
    email VARCHAR(100),
    address TEXT,
    FOREIGN KEY (username) REFERENCES login(username) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS parking_slot (
    slot_id INT AUTO_INCREMENT PRIMARY KEY,
    slot_location VARCHAR(100) NOT NULL,
    slot_type VARCHAR(50), -- 'Compact', 'SUV', 'Bike'
    status VARCHAR(20) DEFAULT 'Available' -- 'Available', 'Booked', 'Maintenance'
);

CREATE TABLE IF NOT EXISTS booking (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    slot_id INT,
    booking_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    start_time DATETIME NOT NULL,
    end_time DATETIME NOT NULL,
    total_bill DECIMAL(10, 2),
    status VARCHAR(20) DEFAULT 'Pending', -- 'Confirmed', 'Pending', 'Cancelled', 'Completed'
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (slot_id) REFERENCES parking_slot(slot_id)
);

CREATE TABLE IF NOT EXISTS payment (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT,
    amount DECIMAL(10, 2),
    payment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    payment_status VARCHAR(20) DEFAULT 'Success',
    FOREIGN KEY (booking_id) REFERENCES booking(booking_id)
);

CREATE TABLE IF NOT EXISTS feedback (
    feedback_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    rating INT,
    comment TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

-- Seed Admin User
INSERT INTO login (username, password, user_type) 
SELECT 'admin', 'admin123', 'admin' 
WHERE NOT EXISTS (SELECT * FROM login WHERE username='admin');

-- Seed Some Parking Slots
INSERT INTO parking_slot (slot_location, slot_type, status)
SELECT 'A-1', 'Compact', 'Available' WHERE NOT EXISTS (SELECT * FROM parking_slot WHERE slot_location='A-1') UNION
SELECT 'A-2', 'SUV', 'Available' WHERE NOT EXISTS (SELECT * FROM parking_slot WHERE slot_location='A-2') UNION
SELECT 'B-1', 'Bike', 'Available' WHERE NOT EXISTS (SELECT * FROM parking_slot WHERE slot_location='B-1');
