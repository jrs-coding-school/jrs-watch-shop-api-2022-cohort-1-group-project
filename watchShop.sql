DROP SCHEMA IF EXISTS `watches`;
CREATE SCHEMA `watches`;

CREATE TABLE `watches`.`product` (
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

CREATE TABLE `watches`.`user` (
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

CREATE TABLE `watches`.`transaction` (
    `id` VARCHAR(50) NOT NULL UNIQUE,
    `customer_id` VARCHAR(50) NOT NULL,
    `date` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `total` FLOAT NOT NULL,

    PRIMARY KEY (`id`),
    FOREIGN KEY (`customer_id`) 
        REFERENCES `user`(`id`)
);

CREATE TABLE `watches`.`purchased_item` (
    `id` VARCHAR(50) NOT NULL UNIQUE,
    `product_id` VARCHAR(50) NOT NULL,
    `quantity` INT NOT NULL,
    `transaction_id` VARCHAR(255) NOT NULL,
    `total` FLOAT NOT NULL,

    PRIMARY KEY (`id`),
    FOREIGN KEY (`product_id`) 
        REFERENCES `product`(`id`),
    FOREIGN KEY (`transaction_id`) 
        REFERENCES `transaction`(`id`)
);

INSERT INTO
    `watches`.`product` (
        id,
        `name`,
        price,
        brand,
        color,
        style,
        description,
        image
    )
VALUES
    (
        uuid(),
        'Astron-SSH079',
        2200.00,
        'Omega',
        'black/green bezel/dark grey band',
        'analog',
        'dive/300 meters/automatic ',
        'https://cdn2.jomashop.com/media/catalog/product/cache/fde19e4197824625333be074956e7640/o/m/omega-seamaster-aqua-terra-automatic-mens-watch-22010412103002-22010412103002.jpg?width=546&height=546'
    ),
    (
        uuid(),
        'Astron-SSH105',
        2900.00,
        'Seiko',
        'blue face/silver bezxel/silver band',
        'analog',
        'gps solar',
        'https://storage.seikowatches.com/image/2021/07/08171519673318/0/SSH105_1.png'
    ),
    (
        uuid(),
        'Astron-SSH107',
        2500.00,
        'Seiko',
        'silver face/black bezel/silver band',
        'analog',
        'gps solar',
        'https://storage.seikowatches.com/image/2022/04/11172934960796/0/SSH107_1.png'
    ),
    (
        uuid(),
        'Astron-SSH109',
        2500.00,
        'Seiko',
        'blue face/blue bezel/silver band',
        'analog',
        'gps solar',
        'https://storage.seikowatches.com/image/2022/04/11173515510457/0/SSH109_1.png'
    ),
    (
        uuid(),
        'Astron-SSH111',
        2500.00,
        'Seiko',
        'black face/black bezel/silver band',
        'analog',
        'gps solar',
        'https://storage.seikowatches.com/image/2022/04/11173714203913/0/SSH111_1.png'
    ),
    (
        uuid(),
        'Astron-SSH113',
        2500.00,
        'Seiko',
        'light gray face/black bezel/silver band',
        'analog',
        'gps solar',
        'https://storage.seikowatches.com/image/2022/04/11173905048401/0/SSH113_1.png'
    ),
    (
        uuid(),
        'Astron-SSJ003',
        1600.00,
        'Seiko',
        'dark blue face/blue bezel/silver band',
        'analog',
        'gps solar',
        'https://storage.seikowatches.com/image/2021/09/01152310110824/0/SSJ003_1.png'
    ),
    (
        uuid(),
        'Astron-SSJ005',
        1600.00,
        'Seiko',
        'balck face/black bezel/silver band',
        'analog',
        'gps solar',
        'https://storage.seikowatches.com/image/2021/09/01152805491844/0/SSJ005_1.png'
    ),
    (
        uuid(),
        'Astron-SSH101',
        2700.00,
        'Seiko',
        'red face/black bezel/silver band',
        'analog',
        'gps solar',
        'https://storage.seikowatches.com/image/2021/07/08170718391748/0/SSH101_1.png'
    ),
    (
        uuid(),
        'Astron-SSH103',
        2500.00,
        'Seiko',
        'black face/black bezel/silver band',
        'analog',
        'gps solar',
        'https://storage.seikowatches.com/image/2021/07/08171106278143/400/SSH103_1_INT.png'
    ),
    (
        uuid(),
        'Astron-SSH104',
        2500.00,
        'Seiko',
        'white face/light gold bezel/silver band',
        'analog',
        'gps solar',
        'https://storage.seikowatches.com/image/2021/07/08171352560034/400/SSH104_1_INT.png'
    ),
    (
        uuid(),
        'Astron-SSH077',
        2200.00,
        'Seiko',
        'blue face/dark grey bezel/daqrk gray band',
        'analog',
        'gps solar',
        'https://storage.seikowatches.com/image/2020/10/23194540823303/400/SSH077_1_INT.png'
    ),
    (
        uuid(),
        'Seamaster-210',
        4500.00,
        'Omega',
        'black face/black bezel/silver band',
        'analog',
        'dive/300 meters/automatic ',
        'https://cdn2.jomashop.com/media/catalog/product/cache/fde19e4197824625333be074956e7640/o/m/omega-seamaster-automatic-black-dial-men_s-steel-watch-210.30.42.20.01.001.jpg?width=546&height=546'
    ),
    (
        uuid(),
        'Seamaster-211',
        4150.00 'Omega',
        'white face/black bezel/black band',
        'analog',
        'dive/300 meters/automatic',
        'https://cdn2.jomashop.com/media/catalog/product/cache/76ca28a553ae7feaf63d5d8d3b95ff3e/o/m/omega-seamaster-automatic-white-dial-mens-watch-21032422004001-21032422004001.jpg?width=546&height=546'
    ),
    (
        uuid(),
        'Seamaster-209',
        4995.00,
        'Omega',
        'blue face/blue bezel/silver band',
        'analog',
        'dive/300 meters/automatic ',
        'https://cdn2.jomashop.com/media/catalog/product/cache/fde19e4197824625333be074956e7640/o/m/omega-seamaster-automatic-blue-dial-men_s-steel-watch-210.30.42.20.03.001.jpg?width=546&height=546'
    ),
    (
        uuid(),
        'Seamaster-212',
        4050.00,
        'Omega',
        'black/orange face face/silver bezel/silver band',
        'analog',
        'dive/150 meters/automatic ',
        'https://cdn2.jomashop.com/media/catalog/product/o/m/omega-seamaster-railmaster-automatic-mens-watch-22010402001001-22010402001001.jpg'
    ),
    (
        uuid(),
        'Seamaster-213',
        6150.00,
        'Omega',
        'black face face/orange bezel/grey-orange-white band',
        'analog',
        'dive/600 meters/automatic ',
        'https://cdn2.jomashop.com/media/catalog/product/cache/fde19e4197824625333be074956e7640/o/m/omega-seamaster-planet-ocean-chronograph-automatic-grey-dial-mens-watch-21532465199001-21532465199001.jpg?width=546&height=546'
    ),
    (
        uuid(),
        'Seamaster-214',
        4150.00,
        'Omega',
        'black face face/black bezel/black band',
        'analog',
        'dive/300 meters/automatic ',
        'https://cdn2.jomashop.com/media/catalog/product/cache/fde19e4197824625333be074956e7640/o/m/omega-seamaster-automatic-black-dial-men_s-watch-210.32.42.20.01.001.jpg?width=546&height=546'
    ),
    (
        uuid(),
        'Seamaster-215',
        4350.00,
        'Omega',
        'blue face/silver bezel/silver band',
        'analog',
        'dive/300 meters/automatic ',
        'https://cdn2.jomashop.com/media/catalog/product/cache/fde19e4197824625333be074956e7640/o/m/omega-seamaster-aqua-terra-automatic-mens-watch-22010412103002-22010412103002.jpg?width=546&height=546'
    ),
    (
        uuid(),
        'Seamaster-217',
        7800.00,
        'Omega',
        'blue face/silver bezel/silver band',
        'analog',
        'dive/300 meters/automatic ',
        'https://cdn2.jomashop.com/media/catalog/product/o/m/omega-diver-300m-automatic-chronometer-42-mm-blue-dial-mens-watch-21020422003002-21020422003002.jpg'
    );