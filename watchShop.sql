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
    FOREIGN KEY (`customer_id`) REFERENCES `user`(`id`)
);

CREATE TABLE `watches`.`purchased_item` (
    `id` VARCHAR(50) NOT NULL UNIQUE,
    `product_id` VARCHAR(50) NOT NULL,
    `quantity` INT NOT NULL,
    `transaction_id` VARCHAR(255) NOT NULL,
    `total` FLOAT NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`product_id`) REFERENCES `product`(`id`),
    FOREIGN KEY (`transaction_id`) REFERENCES `transaction`(`id`)
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
        'Grateful Dead Time Teller',
        165.00,
        'Nixon',
        'silver',
        'analog',
        'Marching Bears, 13-point lightning bolts, roses and skeleton hands adorn the faces while the custom jewelry style bracelets buckle to fit your wrist.',
        'https://cdn.shopify.com/s/files/1/0541/0272/0705/products/A1341-2013-view1_1000x.png?v=1649948541'
    ),
    (
        uuid(),
        'Grateful Dead Sentry Stainless Steel',
        300.00,
        'Nixon',
        'silver',
        'analog',
        'A silver Steal Your Face logo is applied to the watch face and runs with red and blue hour hands plus a custom 13-point lightning bolt seconds hand AND crown.',
        'https://cdn.shopify.com/s/files/1/0541/0272/0705/products/A1339-180-view1_1000x.png?v=1644336144'
    ),
    (
        uuid(),
        'Grateful Dead Light Wave',
        200.00,
        'Nixon',
        'black',
        'analog',
        'Epson solar-powered quartz movement eliminates the need for disposable batteries, while the #tide recycled plastic case and band remove ocean plastic from the environment.',
        'https://cdn.shopify.com/s/files/1/0541/0272/0705/products/A1340-3042-view1_1000x.png?v=1642518570'
    ),
    (
        uuid(),
        'Heat',
        150.00,
        'Nixon',
        'black',
        'smartwatch',
        'The 38mm custom ultra-thin 8mm stainless steel case and pushers with hardened mineral crystal to help protect against the rigors of competitive sport.',
        'https://cdn.shopify.com/s/files/1/0541/0272/0705/products/A1320-001-view1_1000x.png?v=1639584605'
    ),
    (
        uuid(),
        'High Tide',
        220.00,
        'Nixon',
        'green',
        'smartwatch',
        'Customizable home screen, including 550 pre-programmed locations with precise tide, sun, & moon data.',
        'https://cdn.shopify.com/s/files/1/0541/0272/0705/products/A1308-1085-view1_1000x.png?v=1639584592'
    ),
    (
        uuid(),
        'Staple',
        125.00,
        'Nixon',
        'black',
        'digital',
        'Customizable display layout allows you to view any two functions simultaneously. Functions include: Time of day, day/date with auto calendar through 2099, chronograph with 1/100 second resolution, timer, and alarm.',
        'https://cdn.shopify.com/s/files/1/0541/0272/0705/products/A1309-000-view1_1000x.png?v=1640275601'
    ),
    (
        uuid(),
        'Siren',
        125.00,
        'Nixon',
        'black',
        'digital',
        'Basic tide high/low tide functionality, chronograph, and countdown timer. Plus, the patented Locking Looper™ keeps the band secure.',
        'https://cdn.shopify.com/s/files/1/0541/0272/0705/products/A1311-001-view1_1000x.png?v=1652972592'
    ),
    (
        uuid(),
        'Base Tide Pro',
        150.00,
        'Nixon',
        'blue',
        'digital',
        'Pre-programmed tide information for 550 global beaches, including high/low tide time and height, as well as sunrise/sunset. Also features date, chronograph timer, three alarms, backlight, and our patented Locking Looper™.',
        'https://cdn.shopify.com/s/files/1/0541/0272/0705/products/A1307-1543-view1_1000x.png?v=1639584587'
    ),

(
        uuid(),
        'Base Tide Pro',
        150.00,
        'Nixon',
        'red',
        'digital',
        'Pre-programmed tide information for 550 global beaches, including high/low tide time and height, as well as sunrise/sunset. Also features date, chronograph timer, three alarms, backlight, and our patented Locking Looper™.',
        'https://cdn.shopify.com/s/files/1/0541/0272/0705/products/A1307-1543-view1_1000x.png?v=1639584587'
    ),

    (
        uuid(),
        'Siren Stainless Steel',
        150.00,
        'Nixon',
        'white',
        'digital',
        'Toggle between basic tide functionality and date. It also features a chronograph, and countdown timer.',
        'https://cdn.shopify.com/s/files/1/0541/0272/0705/products/A1211-3413-view1_1000x.png?v=1639584532'
    ),
    (
        uuid(),
        'Rival',
        125.00,
        'Nixon',
        'pink',
        'digital',
        'Pre-programmed with tide information for 550 beaches around the world with current, future, and past tide time with height coefficient, as well as sunrise/sunset data. A water-channeling pattern on the inside of the band keeps moisture from getting trapped against your skin.',
        'https://cdn.shopify.com/s/files/1/0541/0272/0705/products/A1310-2531-view1_1000x.png?v=1639584601'
    );

(
    uuid(),
    'Air-King ',
    7400.00,
    'Rolex',
    'white gold',
    'analog',
    'The Oyster Perpetual Air-King pays tribute to the pioneers of flight and the Oyster’s roles in the epic story of aviation.',
    'https://content.rolex.com/dam/2022/upright-bba-with-shadow/m126900-0001.png?imwidth=840'
);

(
    uuid(),
    'GMT Master 2 ',
    10300.00,
    'Rolex',
    'silver',
    'analog',
    'Heir to the original model, the GMT-Master II was unveiled in 1982, with a new movement ensuring ease of use. Its combination of peerless functionality, robustness and instantly recognizable aesthetics has attracted a wider audience of world travellers.',
    'https://content.rolex.com/dam/2022/upright-bba-with-shadow/m126710blnr-0002.png?imwidth=840'
);

(
    uuid(),
    'Yacht Master 42 ',
    29650.00,
    'Rolex',
    'black',
    'analog',
    'As comfortable at sea as aboard a sailboat, the Yacht-Master combines character and performance.',
    'https://content.rolex.com/dam/2022/upright-bba-with-shadow/m226659-0002.png?imwidth=840'
);

(
    uuid(),
    'Day Date 40 ',
    40350.00,
    'Rolex',
    'white gold',
    'analog',
    'The exceptional precision, reliability, legibility and presence of this prestigious model has made it the ultimate status watch.',
    'https://content.rolex.com/dam/2022/upright-bba-with-shadow/m228239-0033.png?imwidth=840'
);

(
    uuid(),
    'Celleni Moon Phase ',
    26750.00,
    'Rolex',
    'brown',
    'analog',
    'The Cellini Moonphase displays the date around the circumference of the dial, via a centre hand with a crescent moon at its tip. This model is driven by a self-winding mechanical movement entirely manufactured by Rolex, whose patented moonphase module is astronomically accurate for 122 years.',
    'https://content.rolex.com/dam/2022/upright-bba-with-shadow/m50535-0002.png?imwidth=840'
);

(
    uuid(),
    
);