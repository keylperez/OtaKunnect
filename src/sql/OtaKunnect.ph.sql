CREATE DATABASE OtaKunnect;

USE OtaKunnect;

CREATE TABLE User(
    user_id INT AUTO_INCREMENT,
    user_first_name VARCHAR(40) NOT NULL,
    user_last_name VARCHAR(30) NOT NULL,
    user_email VARCHAR(300) NOT NULL,
    user_phone CHAR(11) NOT NULL,
    auth_level ENUM("Admin", "Store", "User") NOT NULL,
    categoryList_id INT NOT NULL, /*Foreign Key*/
    animeList_id INT NOT NULL, /*Foreign Key*/
    storeList_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY(user_id)
);

CREATE TABLE Store(
    store_id INT AUTO_INCREMENT,
    store_name VARCHAR(100) NOT NULL,
    store_description VARCHAR(500),
    inventoryList_id INT NOT NULL, /*Foreign Key*/
    categoryList_id INT NOT NULL, /*Foreign Key*/
    animeList_id INT NOT NULL, /*Foreign Key*/
    CONSTRAINT PRIMARY KEY(store_id)
);

CREATE TABLE StoreList(
    storeList_id INT AUTO_INCREMENT,
    store_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY(storeList_id)
);

CREATE TABLE Product(
    product_id INT AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    product_price DECIMAL(10, 2) NOT NULL, /*max decimal value: 99,999,999.99*/
    product_description VARCHAR(300),
    categoryList_id INT NOT NULL,
    animeList_id INT NOT NULL,
    storeList_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY(product_id)
);

CREATE TABLE InventoryList(
    inventoryList_id INT AUTO_INCREMENT,
    product_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY(inventoryList_id)
);

CREATE TABLE Category(
    category_id INT AUTO_INCREMENT,
    category_name VARCHAR(50) NOT NULL,
    category_description VARCHAR(500),
    CONSTRAINT PRIMARY KEY(category_id)
);

CREATE TABLE CategoryList(
    categoryList_id INT AUTO_INCREMENT,
    category_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY(categoryList_id)
);

CREATE TABLE Purchase(
    purchase_id INT AUTO_INCREMENT,
    purchase_date DATETIME NOT NULL,
    purchase_price DECIMAL(10,2) NOT NULL,
    user_id INT NOT NULL,
    purchaseList_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY(purchase_id)
);

CREATE TABLE PurchaseList(
    purchaseList_id INT AUTO_INCREMENT,
    product_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY(purchaseList_id)
);

CREATE TABLE Anime(
    anime_id INT AUTO_INCREMENT,
    anime_name VARCHAR(50) NOT NULL,
    anime_description VARCHAR(500),
    genreGroup_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY(anime_id)
);

CREATE TABLE AnimeList(
    animeList_id INT AUTO_INCREMENT,
    anime_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY(animeList_id)
);

CREATE TABLE Genre(
    genre_id INT AUTO_INCREMENT,
    genre_name VARCHAR(50) NOT NULL,
    genre_description VARCHAR(500) NOT NULL,
    animeList_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY(genre_id)
);

CREATE TABLE GenreGroup(
    genreGroup_id INT AUTO_INCREMENT,
    genre_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY(genreGroup_id)
);

ALTER TABLE User
    ADD CONSTRAINT user_categoryList_id_fk FOREIGN KEY(categoryList_id) REFERENCES CategoryList(categoryList_id),
    ADD CONSTRAINT user_animeList_id_fk FOREIGN KEY(animeList_id) REFERENCES AnimeList(animeList_id),
    ADD CONSTRAINT user_storeList_id_fk FOREIGN KEY(storeList_id) REFERENCES StoreList(storeList_id);

ALTER TABLE Store
    ADD CONSTRAINT store_inventoryList_id_fk FOREIGN KEY(inventoryList_id) REFERENCES InventoryList(inventoryList_id),
    ADD CONSTRAINT store_categoryList_id_fk FOREIGN KEY(categoryList_id) REFERENCES CategoryList(categoryList_id),
    ADD CONSTRAINT store_animeList_id_fk FOREIGN KEY(animeList_id) REFERENCES AnimeList(animeList_id);

ALTER TABLE InventoryList
    ADD CONSTRAINT inventoryList_product_id_fk FOREIGN KEY(product_id) REFERENCES Product(product_id);

ALTER TABLE StoreList
    ADD CONSTRAINT storeList_store_id_fk FOREIGN KEY(store_id) REFERENCES Store(store_id);

ALTER TABLE CategoryList
    ADD CONSTRAINT categoryList_category_id_fk FOREIGN KEY(category_id) REFERENCES Category(category_id);

ALTER TABLE Product
    ADD CONSTRAINT product_categoryList_id_fk FOREIGN KEY(categoryList_id) REFERENCES CategoryList(categoryList_id),
    ADD CONSTRAINT product_animeList_id_fk FOREIGN KEY(animeList_id) REFERENCES AnimeList(animeList_id),
    ADD CONSTRAINT product_storeList_id_fk FOREIGN KEY(storeList_id) REFERENCES StoreList(storeList_id);

ALTER TABLE Purchase
    ADD CONSTRAINT purchase_user_id_fk FOREIGN KEY(user_id) REFERENCES User(user_id),
    ADD CONSTRAINT purchase_purchaseList_id_fk FOREIGN KEY(purchaseList_id) REFERENCES PurchaseList(purchaseList_id);

ALTER TABLE PurchaseList
    ADD CONSTRAINT purchaseList_product_id_fk FOREIGN KEY(product_id) REFERENCES Product(product_id);

ALTER TABLE Anime
    ADD CONSTRAINT anime_genreGroup_id_fk FOREIGN KEY(genreGroup_id) REFERENCES GenreGroup(genreGroup_id);

ALTER TABLE AnimeList
    ADD CONSTRAINT animeList_anime_id_fk FOREIGN KEY(anime_id) REFERENCES Anime(anime_id);

ALTER TABLE Genre
    ADD CONSTRAINT genreList_animeList_id_fk FOREIGN KEY(animeList_id) REFERENCES AnimeList(animeList_id);

ALTER TABLE GenreGroup
    ADD CONSTRAINT genreGroup_genre_id_fk FOREIGN KEY(genre_id) REFERENCES Genre(genre_id);