-- SQLite
PRAGMA foreign_keys = ON;

INSERT INTO postalcodes(
    postalcode,
    city
)VALUES(
    '41101',
    'Göteborg'
),(
    '50330',
    'Borås'
),(
    '55311',
    'Jönköping'
);

INSERT INTO suppliers(
    suppliername,
    contactperson,
    phone,
    email,
    addressline,
    postalcode_id
)VALUES(
    'Kvarnen i Väst',
    'Anna Berg',
    '031-1111111',
    'anna@kvarnen.se',
    'Kvarnvägen 3',
    1
),(
    'Mejeriet Borås',
    'Erik Lund',
    '033-2222222',
    'erik@mejeriet.se',
    'Mjölkgatan 12',
    2
),(
    'Sockerbolaget',
    'Maria Holm',
    '036-3333333',
    'maria@sockerbolaget.se',
    'Söta vägen 7',
    3
);

INSERT INTO ingredients(
    itemnumber,
    ingredientname,
    priceperkg,
    stock,
    minstock,
    supplier_id
)VALUES(
    'R100',
    'Vetemjöl',
    12.50,
    80,
    25,
    1
),(
    'R101',
    'Rågmjöl',
    14.00,
    15,
    20,
    1
),(
    'R200',
    'Smör',
    95.00,
    30,
    10,
    2
),(
    'R201',
    'Mjölk',
    11.00,
    40,
    20,
    2
),(
    'R202',
    'Ägg',
    48.00,
    12,
    10,
    2
),(
    'R300',
    'Strösocker',
    18.00,
    50,
    15,
    3
),(
    'R301',
    'Kanel',
    210.00,
    2,
    1,
    3
),(
    'R302',
    'Jäst',
    65.00,
    3,
    5,
    3
);

INSERT INTO categories(
    categoryname
)VALUES(
    'Bröd'
),(
    'Bullar'
),(
    'Konditori'
);

INSERT INTO products(
    productname,
    price,
    category_id
)VALUES(
    'Limpa',
    45,
    1
),(
    'Rågbröd',
    52,
    1
),(
    'Kanelbulle',
    28,
    2
),(
    'Prinsesstårta',
    295,
    3
);

-- mängden är i kg
INSERT INTO recipes(
    product_id,
    ingredient_id,
    amount
)VALUES(
    1, 1, 0.6
),(
    1, 4, 0.3
),(
    1, 8, 0.02
),(
    2, 1, 0.2
),(
    2, 2, 0.4
),(
    2, 4, 0.3
),(
    2, 8, 0.02
),(
    3, 1, 0.5
),(
    3, 3, 0.15
),(
    3, 4, 0.3
),(
    3, 6, 0.1
),(
    3, 7, 0.01
),(
    3, 8, 0.03
),(
    4, 1, 0.1
),(
    4, 3, 0.1
),(
    4, 5, 0.2
),(
    4, 6, 0.2
);

INSERT INTO purchases(
    purchasenumber,
    purchasedate,
    supplier_id
)VALUES(
    'I-1001',
    '2026-11-02 09:30:00',
    1
),(
    'I-1002',
    '2026-11-03 10:15:00',
    2
),(
    'I-1003',
    '2026-11-05 08:45:00',
    3
);

INSERT INTO purchaseitems(
    purchase_id,
    ingredient_id,
    quantity,
    priceperkg
)VALUES(
    1, 1, 50, 12.50
),(
    1, 2, 10, 14.00
),(
    2, 3, 20, 95.00
),(
    2, 4, 30, 11.00
),(
    2, 5, 10, 48.00
),(
    3, 6, 25, 18.00
),(
    3, 7, 1, 210.00
);
