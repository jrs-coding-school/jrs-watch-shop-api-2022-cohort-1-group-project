DROP SCHEMA IF EXISTS `watches`;
CREATE SCHEMA `watches`;

CREATE TABLE `watches`.`products` (
    `id` VARCHAR(50) NOT NULL UNIQUE,
    `name` VARCHAR(255) NOT NULL,
    `price` FLOAT NOT NULL,
    `brand` VARCHAR(255) NOT NULL,
    `color` VARCHAR(255) NOT NULL,
    `style` VARCHAR(255) NOT NULL,
    `description` VARCHAR(255) DEFAULT NULL,
    `image` BLOB NULL,
    `rating` FLOAT DEFAULT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `watches`.`users` (
    `id` VARCHAR(50) NOT NULL UNIQUE,
    `email` VARCHAR(255) NOT NULL UNIQUE,
    `password` VARCHAR(255) NOT NULL,
    `first_name` VARCHAR(255),
    `last_name` VARCHAR(255),
    `birthday` DATE,
    `address1` VARCHAR(255),
    `address2` VARCHAR(255),
    `city` VARCHAR(255),
    `state` VARCHAR(255),
    `zip_code` INT,

    PRIMARY KEY (`id`)
);

CREATE TABLE `watches`.`transactions` (
    `id` VARCHAR(50) NOT NULL UNIQUE,
    `customer_id` VARCHAR(50) NOT NULL,
    `date` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `total` FLOAT NOT NULL,

    PRIMARY KEY (`id`),
    FOREIGN KEY (`customer_id`) 
        REFERENCES `users`(`id`)
);

CREATE TABLE `watches`.`purchased_items` (
    `id` VARCHAR(50) NOT NULL UNIQUE,
    `product_id` VARCHAR(50) NOT NULL,
    `quantity` INT NOT NULL,
    `transaction_id` VARCHAR(255) NOT NULL,
    `total` FLOAT NOT NULL,

    PRIMARY KEY (`id`),
    FOREIGN KEY (`product_id`) 
        REFERENCES `products`(`id`),
    FOREIGN KEY (`transaction_id`) 
        REFERENCES `transactions`(`id`)
);

INSERT INTO `watches`.`products` 
    (id, `name`, price, brand, color, style, description, image)
VALUES
    (uuid(), 'G7900A-4', 99.00, 'Casio', 'red', 'digital', 'G-SHOCK 7900 SERIES', 'https://www.casio.com/content/dam/casio/product-info/locales/us/en/timepiece/product/watch/G/G7/G79/G-7900A-4/assets/G-7900A-4_Seq1.png.transform/main-visual-pc/image.png'),
    (uuid(), 'GA110ALIFE21-8A', 180.00, 'Casio', 'white', 'analog', 'G-SHOCK LIMITED', 'https://www.casio.com/content/dam/casio/product-info/locales/us/en/timepiece/product/watch/G/GA/GA1/ga110alife21-8a/assets/ALifeSoldier.png.transform/main-visual-pc/image.png'),
    (uuid(), 'MTGB3000BD12', 1050.00, 'Casio', 'black', 'analog', 'G-SHOCK MTGB3000 Series', 'https://www.casio.com/content/dam/casio/product-info/locales/us/en/timepiece/product/watch/M/MT/MTG/mtg-b3000bd-1a2/assets/MTG-B3000BD-1A2_JF.png.transform/main-visual-pc/image.png'),
    (uuid(), 'GRB200-1B', 350.00, 'Casio', 'black', 'analog', 'G-SHOCK GRAVITYMASTER', 'https://www.casio.com/content/dam/casio/product-info/locales/us/en/timepiece/product/watch/G/GR/GRB/gr-b200-1b/assets/GR-B200-1B.png.transform/main-visual-pc/image.png'),
    (uuid(), 'GA2100-1A3', 99.00, 'Casio', 'black', 'analog', 'G-SHOCK Neon Accent Series', 'https://www.casio.com/content/dam/casio/product-info/locales/us/en/timepiece/product/watch/G/GA/GA2/ga-2100-1a3/assets/GA-2100-1A3.png.transform/main-visual-pc/image.png'),
    (uuid(), 'GA700CA-5A', 99.00, 'Casio', 'brown', 'analog', 'G-SHOCK GA-700 SERIES', 'https://www.casio.com/content/dam/casio/product-info/locales/us/en/timepiece/product/watch/G/GA/GA7/ga-700ca-5a/assets/GA-700CA-5A.png.transform/main-visual-pc/image.png'),
    (uuid(), 'GM110G-1A9', 230.00, 'Casio', 'white', 'analog', 'G-SHOCK GM-110 SERIES', 'https://www.casio.com/content/dam/casio/product-info/locales/us/en/timepiece/product/watch/G/GM/GM1/GM-110G-1A9/assets/GM-110G-1A9_Seq04.jpg.transform/main-visual-pc/image.jpg'),
    (uuid(), 'GA2200M-1A', 130.00, 'Casio', 'black', 'analog', 'G-SHOCK GA-2200 Series', 'https://www.casio.com/content/dam/casio/product-info/locales/us/en/timepiece/product/watch/G/GA/GA2/ga-2200m-1a/assets/GA-2200M-1A.png.transform/main-visual-pc/image.png'),
    (uuid(), 'GA2200GC-7A', 150.00, 'Casio', 'white', 'analog', 'G-SHOCK GA-2200 Series', 'https://www.casio.com/content/dam/casio/product-info/locales/us/en/timepiece/product/watch/G/GA/GA2/ga-2200gc-7a/assets/GA-2200GC-7A.png.transform/main-visual-pc/image.png'),
    (uuid(), 'GA-700DC-1A', 88.00, 'Casio', 'black', 'analog', 'G-SHOCK GA-700 SERIES', 'https://www.casio.com/content/dam/casio/product-info/locales/us/en/timepiece/product/watch/G/GA/GA7/GA-700DC-1A/assets/GA-700DC-1A_Seq1.png.transform/main-visual-pc/image.png'),
    (uuid(), 'Dayliner Three-Hand Teak Leather Watch', 140.00, 'Fossil', 'green', 'analog', 'DAYLINER', 'https://fossil.scene7.com/is/image/FossilPartners/FS5925_main?$sfcc_fos_large$'),
    (uuid(), 'Bronson Chronograph Black Stainless Steel Watch', 140.00, 'Fossil', 'black', 'analog', '44MM BRONSON', 'https://fossil.scene7.com/is/image/FossilPartners/FS5851_main?$sfcc_fos_large$'),
    (uuid(), 'Gen 6 Smartwatch Black Stainless Steel Mesh', 319.00, 'Fossil', 'black', 'smartwatch', 'GEN 6 SMARTWATCH', 'https://fossil.scene7.com/is/image/FossilPartners/FTW4066_main?$sfcc_fos_large$'),
    (uuid(), 'Hybrid Smartwatch HR Neutra Black Stainless Steel', 219.00, 'Fossil', 'black', 'analog', 'EUTRA HYBRID HR SMARTWATCH', 'https://fossil.scene7.com/is/image/FossilPartners/FTW7027_main?$sfcc_fos_large$'),
    (uuid(), 'Everett Automatic Black Eco Leather Watch', 168.00, 'Fossil', 'gold', 'mechanical', 'EVERETT', 'https://fossil.scene7.com/is/image/FossilPartners/ME3208_main?$sfcc_fos_large$'),
    (uuid(), 'Inscription Automatic Smoke Stainless Steel Watch', 130.00, 'Fossil', 'black', 'mechanical', 'INSCRIPTION', 'https://fossil.scene7.com/is/image/FossilPartners/BQ2574_main?$sfcc_fos_large$'),
    (uuid(), 'Bronson Automatic Brown Eco Leather Watch', 260.00, 'Fossil', 'brown', 'mechanical', 'BRONSON', 'https://fossil.scene7.com/is/image/FossilPartners/ME3219_main?$sfcc_fos_large$'),
    (uuid(), 'Minimalist Three-Hand Brown Leather Watch', 130.00, 'Fossil', 'brown', 'analog', 'THE MINIMALIST 3H', 'https://fossil.scene7.com/is/image/FossilPartners/FS5551_main?$sfcc_fos_large$'),
    (uuid(), 'Sonic the Hedgehog Quartz Casual Watch', 15.00, 'Sonic the Hedgehog', 'blue', 'digital', 'Model: SNC4016', 'https://m.media-amazon.com/images/I/91+QI4Pu5TL._AC_UX679_.jpg'),
    (uuid(), 'Accutime Kids Batman Digital Quartz Watch', 12.23, 'Accutime', 'blue', 'digital', 'BAT4405SR', 'https://m.media-amazon.com/images/I/91ymOw5SDSL._AC_UY879_.jpg');
