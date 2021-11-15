CREATE DATABASE OtaKunnect_Database;

USE OtaKunnect_Database;

CREATE TABLE User{
    user_id INT AUTO_INCREMENT,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone CHAR(11) NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    modified_at TIMESTAMP NOT NULL,
    CONSTRAINT user_id_pk PRIMARY KEY(user_id)

}

CREATE TABLE User_Payment{
    user_payment_id INT AUTO_INCREMENT,
    user_id INT NOT NULL,
    payment_type VARCHAR(255) NOT NULL,
    CONSTRAINT user_payment_user_id_fk FOREIGN KEY (user_id) REFERENCES user (user_id),
    CONSTRAINT user_payment_id_pk PRIMARY KEY(user_payment_id)
}

CREATE TABLE Cart{
    cart_id INT AUTO_INCREMENT,
    user_id INT AUTO_INCREMENT,
    total DECIMAL(19, 4) NOT NULL,
    CONSTRAINT cart_id_pk PRIMARY KEY(cart_id)
}

CREATE TABLE Product_Category

CREATE TABLE Product{
    product_id INT AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    desc VARCHAR(510) NOT NULL,
    category_id INT NOT NULL,
    inventory_id INT NOT NULL,
    price DECIMAL(19, 2) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    modified_at TIMESTAMP NOT NULL,
    delete_at TIMESTAMP NOT NULL,
    CONSTRAINT product_category_id_fk FOREIGN KEY (category_id) REFERENCES Category(category_id),
    CONSTRAINT product_inventory_id_fk FOREIGN KEY (inventory_id) REFERENCES Inventory(inventory_id),
    CONSTRAINT product_id_pk PRIMARY KEY(product_id)
}

CREATE TABLE Cart_item{
    cart_item_id INT AUTO_INCREMENT,

}