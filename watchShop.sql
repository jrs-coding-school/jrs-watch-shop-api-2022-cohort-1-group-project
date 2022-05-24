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
    `customer_id` VARCHAR(50),
    `date` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `total` FLOAT NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`customer_id`) REFERENCES `users`(`id`) ON DELETE SET NULL
);

CREATE TABLE `watches`.`purchased_items` (
    `id` VARCHAR(50) NOT NULL UNIQUE,
    `product_id` VARCHAR(50) NOT NULL,
    `quantity` INT NOT NULL,
    `transaction_id` VARCHAR(255) NOT NULL,
    `total` FLOAT NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`product_id`) REFERENCES `products`(`id`),
    FOREIGN KEY (`transaction_id`) REFERENCES `transactions`(`id`)
);

DROP TABLE IF EXISTS `watches`.`cart_items`;

CREATE TABLE `watches`.`cart_items` (
    `id` INT NOT NULL UNIQUE AUTO_INCREMENT,
    `customer_id` VARCHAR(50) NOT NULL,
    `product_id` VARCHAR(50) NOT NULL,
    `quantity` INT NOT NULL,
    `total` FLOAT NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`product_id`) REFERENCES `products`(`id`),
    FOREIGN KEY (`customer_id`) REFERENCES `users`(`id`) ON DELETE CASCADE
);

INSERT INTO
    `watches`.`users` (`id`, `email`, `password`)
VALUES
    (
        'e9fbc1e7-dae5-4063-85f6-d0768d35b48f',
        'testing@testing.com',
        'pass'
    );

INSERT INTO
    `watches`.`products` (
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
        '7b16e394-daaf-11ec-bc93-f7f5e59d600a',
        'G7900A-4',
        99.00,
        'Casio',
        'red',
        'digital',
        'G-SHOCK 7900 SERIES',
        'https://www.casio.com/content/dam/casio/product-info/locales/us/en/timepiece/product/watch/G/G7/G79/G-7900A-4/assets/G-7900A-4_Seq1.png.transform/main-visual-pc/image.png'
    ),
    (
        uuid(),
        'GA110ALIFE21-8A',
        180.00,
        'Casio',
        'white',
        'analog',
        'G-SHOCK LIMITED',
        'https://www.casio.com/content/dam/casio/product-info/locales/us/en/timepiece/product/watch/G/GA/GA1/ga110alife21-8a/assets/ALifeSoldier.png.transform/main-visual-pc/image.png'
    ),
    (
        uuid(),
        'MTGB3000BD12',
        1050.00,
        'Casio',
        'black',
        'analog',
        'G-SHOCK MTGB3000 Series',
        'https://www.casio.com/content/dam/casio/product-info/locales/us/en/timepiece/product/watch/M/MT/MTG/mtg-b3000bd-1a2/assets/MTG-B3000BD-1A2_JF.png.transform/main-visual-pc/image.png'
    ),
    (
        uuid(),
        'GRB200-1B',
        350.00,
        'Casio',
        'black',
        'analog',
        'G-SHOCK GRAVITYMASTER',
        'https://www.casio.com/content/dam/casio/product-info/locales/us/en/timepiece/product/watch/G/GR/GRB/gr-b200-1b/assets/GR-B200-1B.png.transform/main-visual-pc/image.png'
    ),
    (
        uuid(),
        'GA2100-1A3',
        99.00,
        'Casio',
        'black',
        'analog',
        'G-SHOCK Neon Accent Series',
        'https://www.casio.com/content/dam/casio/product-info/locales/us/en/timepiece/product/watch/G/GA/GA2/ga-2100-1a3/assets/GA-2100-1A3.png.transform/main-visual-pc/image.png'
    ),
    (
        uuid(),
        'GA700CA-5A',
        99.00,
        'Casio',
        'brown',
        'analog',
        'G-SHOCK GA-700 SERIES',
        'https://www.casio.com/content/dam/casio/product-info/locales/us/en/timepiece/product/watch/G/GA/GA7/ga-700ca-5a/assets/GA-700CA-5A.png.transform/main-visual-pc/image.png'
    ),
    (
        uuid(),
        'GM110G-1A9',
        230.00,
        'Casio',
        'white',
        'analog',
        'G-SHOCK GM-110 SERIES',
        'https://www.casio.com/content/dam/casio/product-info/locales/us/en/timepiece/product/watch/G/GM/GM1/GM-110G-1A9/assets/GM-110G-1A9_Seq04.jpg.transform/main-visual-pc/image.jpg'
    ),
    (
        uuid(),
        'GA2200M-1A',
        130.00,
        'Casio',
        'black',
        'analog',
        'G-SHOCK GA-2200 Series',
        'https://www.casio.com/content/dam/casio/product-info/locales/us/en/timepiece/product/watch/G/GA/GA2/ga-2200m-1a/assets/GA-2200M-1A.png.transform/main-visual-pc/image.png'
    ),
    (
        uuid(),
        'GA2200GC-7A',
        150.00,
        'Casio',
        'white',
        'analog',
        'G-SHOCK GA-2200 Series',
        'https://www.casio.com/content/dam/casio/product-info/locales/us/en/timepiece/product/watch/G/GA/GA2/ga-2200gc-7a/assets/GA-2200GC-7A.png.transform/main-visual-pc/image.png'
    ),
    (
        uuid(),
        'GA-700DC-1A',
        88.00,
        'Casio',
        'black',
        'analog',
        'G-SHOCK GA-700 SERIES',
        'https://www.casio.com/content/dam/casio/product-info/locales/us/en/timepiece/product/watch/G/GA/GA7/GA-700DC-1A/assets/GA-700DC-1A_Seq1.png.transform/main-visual-pc/image.png'
    ),
    (
        uuid(),
        'Dayliner Three-Hand Teak Leather Watch',
        140.00,
        'Fossil',
        'green',
        'analog',
        'DAYLINER',
        'https://fossil.scene7.com/is/image/FossilPartners/FS5925_main?$sfcc_fos_large$'
    ),
    (
        uuid(),
        'Bronson Chronograph Black Stainless Steel Watch',
        140.00,
        'Fossil',
        'black',
        'analog',
        '44MM BRONSON',
        'https://fossil.scene7.com/is/image/FossilPartners/FS5851_main?$sfcc_fos_large$'
    ),
    (
        uuid(),
        'Gen 6 Smartwatch Black Stainless Steel Mesh',
        319.00,
        'Fossil',
        'black',
        'smartwatch',
        'GEN 6 SMARTWATCH',
        'https://fossil.scene7.com/is/image/FossilPartners/FTW4066_main?$sfcc_fos_large$'
    ),
    (
        uuid(),
        'Hybrid Smartwatch HR Neutra Black Stainless Steel',
        219.00,
        'Fossil',
        'black',
        'analog',
        'EUTRA HYBRID HR SMARTWATCH',
        'https://fossil.scene7.com/is/image/FossilPartners/FTW7027_main?$sfcc_fos_large$'
    ),
    (
        uuid(),
        'Everett Automatic Black Eco Leather Watch',
        168.00,
        'Fossil',
        'gold',
        'mechanical',
        'EVERETT',
        'https://fossil.scene7.com/is/image/FossilPartners/ME3208_main?$sfcc_fos_large$'
    ),
    (
        uuid(),
        'Inscription Automatic Smoke Stainless Steel Watch',
        130.00,
        'Fossil',
        'black',
        'mechanical',
        'INSCRIPTION',
        'https://fossil.scene7.com/is/image/FossilPartners/BQ2574_main?$sfcc_fos_large$'
    ),
    (
        uuid(),
        'Bronson Automatic Brown Eco Leather Watch',
        260.00,
        'Fossil',
        'brown',
        'mechanical',
        'BRONSON',
        'https://fossil.scene7.com/is/image/FossilPartners/ME3219_main?$sfcc_fos_large$'
    ),
    (
        uuid(),
        'Minimalist Three-Hand Brown Leather Watch',
        130.00,
        'Fossil',
        'brown',
        'analog',
        'THE MINIMALIST 3H',
        'https://fossil.scene7.com/is/image/FossilPartners/FS5551_main?$sfcc_fos_large$'
    ),
    (
        uuid(),
        'Sonic the Hedgehog Quartz Casual Watch',
        15.00,
        'Sonic the Hedgehog',
        'blue',
        'digital',
        'Model: SNC4016',
        'https://m.media-amazon.com/images/I/91+QI4Pu5TL._AC_UX679_.jpg'
    ),
    (
        uuid(),
        'Accutime Kids Batman Digital Quartz Watch',
        12.23,
        'Accutime',
        'blue',
        'digital',
        'BAT4405SR',
        'https://m.media-amazon.com/images/I/91ymOw5SDSL._AC_UY879_.jpg'
    ),
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
        'Pre-programmed with tide information for 550 beaches around the world with current, future, and past tide time with height coefficient, as well as sunrise/sunset data.',
        'https://cdn.shopify.com/s/files/1/0541/0272/0705/products/A1310-2531-view1_1000x.png?v=1639584601'
    ),
    (
        uuid(),
        'Air-King ',
        7400.00,
        'Rolex',
        'white gold',
        'analog',
        'The Oyster Perpetual Air-King pays tribute to the pioneers of flight and the Oyster’s roles in the epic story of aviation.',
        'https://content.rolex.com/dam/2022/upright-bba-with-shadow/m126900-0001.png?imwidth=840'
    ),
    (
        uuid(),
        'GMT Master 2 ',
        10300.00,
        'Rolex',
        'silver',
        'analog',
        'Heir to the original model, the GMT-Master II was unveiled in 1982, with a new movement ensuring ease of use. Its combination of peerless functionality, robustness and instantly recognizable aesthetics has attracted a wider audience of world travellers.',
        'https://content.rolex.com/dam/2022/upright-bba-with-shadow/m126710blnr-0002.png?imwidth=840'
    ),
    (
        uuid(),
        'Yacht Master 42 ',
        29650.00,
        'Rolex',
        'black',
        'analog',
        'As comfortable at sea as aboard a sailboat, the Yacht-Master combines character and performance.',
        'https://content.rolex.com/dam/2022/upright-bba-with-shadow/m226659-0002.png?imwidth=840'
    ),
    (
        uuid(),
        'Day Date 40 ',
        40350.00,
        'Rolex',
        'white gold',
        'analog',
        'The exceptional precision, reliability, legibility and presence of this prestigious model has made it the ultimate status watch.',
        'https://content.rolex.com/dam/2022/upright-bba-with-shadow/m228239-0033.png?imwidth=840'
    ),
    (
        uuid(),
        'Celleni Moon Phase ',
        26750.00,
        'Rolex',
        'brown',
        'analog',
        'The Cellini Moonphase displays the date around the circumference of the dial, via a centre hand with a crescent moon at its tip.',
        'https://content.rolex.com/dam/2022/upright-bba-with-shadow/m50535-0002.png?imwidth=840'
    ),
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
        4150.00,
        'Omega',
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

INSERT INTO
    `watches`.`cart_items` (`customer_id`, `product_id`, `quantity`, `total`)
VALUES
    (
        'e9fbc1e7-dae5-4063-85f6-d0768d35b48f',
        '7b16e394-daaf-11ec-bc93-f7f5e59d600a',
        '1',
        '1'
    );

INSERT INTO
    `watches`.`cart_items` (`customer_id`, `product_id`, `quantity`, `total`)
VALUES
    (
        'e9fbc1e7-dae5-4063-85f6-d0768d35b48f',
        '7b16e394-daaf-11ec-bc93-f7f5e59d600a',
        '2',
        '1'
    );

INSERT INTO
    `watches`.`cart_items` (`customer_id`, `product_id`, `quantity`, `total`)
VALUES
    (
        'e9fbc1e7-dae5-4063-85f6-d0768d35b48f',
        '7b16e394-daaf-11ec-bc93-f7f5e59d600a',
        '1',
        '1'
    );




