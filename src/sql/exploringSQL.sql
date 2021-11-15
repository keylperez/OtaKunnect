CREATE DATABASE ExploringSQL;

USE ExploringSQL;

CREATE TABLE MEMBER(
    id INT AUTO_INCREMENT,
    member_id INT NOT NULL,
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL,
    email VARCHAR(300) NOT NULL,
    gender ENUM("Male", "Female") NOT NULL,
    nationality VARCHAR(30) NOT NULL,
    CONSTRAINT id_pk PRIMARY KEY(id)
);



CREATE TABLE HOTEL_TYPE(
    ht_code CHAR(3) NOT NULL,
    ht_desc VARCHAR(30) NOT NULL,
    CONSTRAINT ht_code_pk PRIMARY KEY(ht_code)
);

CREATE TABLE HOTEL(
    hotel_id INT AUTO_INCREMENT,
    hotel_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    `state` VARCHAR(50) NOT NULL,
    phone CHAR(11) NOT NULL,
    type VARCHAR(5) NOT NULL,
    CONSTRAINT hotel_id_pk PRIMARY KEY(hotel_id),
    CONSTRAINT hotel_type_fk FOREIGN KEY(type) REFERENCES HOTEL_TYPE(ht_code)
);

CREATE TABLE RATING(
    rate INT(1) NOT NULL,
    star VARCHAR(20) NOT NULL,
    points INT(1) NOT NULL,
    CONSTRAINT rate_pk PRIMARY KEY(rate)
);



CREATE TABLE BOOKING(
	booking_id INT AUTO_INCREMENT,
    booking_date CHAR(10) NOT NULL,
    booking_amount DECIMAL(10, 2) NOT NULL,
    state CHAR(9) NOT NULL,
    payment CHAR(4) NOT NULL,
    member_id INT NOT NULL,
    hotel_id INT NOT NULL,
    rating INT(2) NOT NULL,
    CONSTRAINT booking_id_pk PRIMARY KEY(booking_id),
    CONSTRAINT booking_member_id_fk FOREIGN KEY(member_id) REFERENCES MEMBER(id),
    CONSTRAINT booking_hotel_id_fk FOREIGN KEY(hotel_id) REFERENCES HOTEL(hotel_id),
    CONSTRAINT booking_rate_fk FOREIGN KEY(rating) REFERENCES RATING(rate)
);




ALTER TABLE MEMBER
    CHANGE COLUMN gender sex ENUM("Male", "Female");



SELECT HOTEL.hotel_name, COUNT(member_id), COUNT(BOOKING.state) 
FROM HOTEL INNER JOIN BOOKING
ON BOOKING.hotel_id = HOTEL.hotel_id
WHERE BOOKING.state = 'confirmed'
GROUP BY BOOKING.hotel_id
ORDER BY BOOKING.hotel_id;


SELECT MEMBER.first_name, MEMBER.last_name, MEMBER.email, COUNT(BOOKING.member_id)
FROM MEMBER INNER JOIN BOOKING
ON MEMBER.member_id = BOOKING.member_id
GROUP BY MEMBER.member_id;


SELECT HOTEL.hotel_name, HOTEL.city, HOTEL.state, HOTEL.type
FROM HOTEL INNER JOIN BOOKING
ON HOTEL.hotel_id = BOOKING.hotel_id
WHERE BOOKING.state = 'cancelled' OR HOTEL.hotel_id NOT IN (SELECT hotel_id FROM BOOKING)
ORDER BY hotel_name ASC;


INSERT INTO MEMBER (first_name, last_name, email, sex, nationality)
VALUES ('Rendale', 'Pasco', '188975@usc.edu.ph', 'male', 'Filipino');

INSERT INTO BOOKING (booking_date, booking_amount, state, payment, member_id, hotel_id, rating)
VALUES ('2020-03-10', '5000.00', 'confirmed', 'cash', '51', '13', '5');


DELETE FROM HOTEL
WHERE hotel_id = 15;


SELECT HOTEL.state, HOTEL.hotel_name, COUNT(BOOKING.hotel_id)
FROM HOTEL INNER JOIN BOOKING
ON HOTEL.hotel_id = BOOKING.hotel_id
GROUP BY HOTEL.state
ORDER BY COUNT(BOOKING.hotel_id) DESC;
SELECT HOTEL.state, HOTEL.hotel_name, COUNT(BOOKING.hotel_id)
FROM HOTEL INNER JOIN BOOKING
ON HOTEL.hotel_id = BOOKING.hotel_id
GROUP BY HOTEL.state
ORDER BY COUNT(BOOKING.hotel_id) DESC








INSERT INTO HOTEL_TYPE (ht_code, ht_desc)
VALUES ('lsh', 'local small hotel' ), ('lbh', 'local big hotel' ), ('ih', 'international hotel');



SELECT HOTEL.hotel_name, AVG(BOOKING.hotel_rating)
FROM HOTEL INNER JOIN BOOKING
ON HOTEL.hotel_id = BOOKING.hotel_id
HAVING BOOKING.hotel_rating > 2.5
ORDER BY BOOKING.hotel_rating DESC;



SELECT nationality, COUNT (member_id)
FROM MEMBER
GROUP BY nationality
ORDER by nationality;



CREATE USER 'WPerez'@'localhost' IDENTIFIED BY 'pword'
GRANT ALL PRIVELAGES ON *.* TO 'WPerez'@'localhost';



CREATE USER 'user1'@'localhost' IDENTIFIED BY 'pword'
GRANT SELECT ON 'MHBM'.'HOTEL' TO 'user1'@'localhost';