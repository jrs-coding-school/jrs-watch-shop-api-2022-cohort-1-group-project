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
    (id, `name`, price, brand, color, style)
VALUES
    ('1234-abcd-5678-ef90', 'G-SHOCK 123 abc', 1.99, 'G-SHOCK', 'red', 'wrist');