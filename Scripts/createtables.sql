-- SQLite
-- i SQLite är foreign keys avstängda tills man slår på dem, därför först i varje skript
PRAGMA foreign_keys = ON;

-- postnummer för sig så att postorten bara skrivs en gång
CREATE TABLE postalcodes(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    postalcode CHAR(5) NOT NULL UNIQUE,
    city VARCHAR(40) NOT NULL
);

CREATE TABLE suppliers(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    suppliername VARCHAR(80) NOT NULL UNIQUE,
    contactperson VARCHAR(60) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    email VARCHAR(128) NOT NULL UNIQUE,
    addressline VARCHAR(60) NOT NULL,
    postalcode_id INTEGER NOT NULL,
    CONSTRAINT fk_postalcode FOREIGN KEY(postalcode_id) REFERENCES postalcodes(id)
);

-- råvaror, varje råvara köps från en leverantör
CREATE TABLE ingredients(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    itemnumber VARCHAR(15) NOT NULL UNIQUE,
    ingredientname VARCHAR(80) NOT NULL,
    priceperkg FLOAT NOT NULL,
    -- stock är hur många kg som finns kvar, minstock är när det är dags att beställa
    stock FLOAT NOT NULL DEFAULT 0,
    minstock FLOAT NOT NULL DEFAULT 0,
    supplier_id INTEGER NOT NULL,
    CONSTRAINT fk_supplier FOREIGN KEY(supplier_id) REFERENCES suppliers(id)
);

-- bröd, bullar och konditori
CREATE TABLE categories(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    categoryname VARCHAR(40) NOT NULL UNIQUE
);

CREATE TABLE products(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    productname VARCHAR(80) NOT NULL UNIQUE,
    price FLOAT NOT NULL,
    category_id INTEGER NOT NULL,
    CONSTRAINT fk_category FOREIGN KEY(category_id) REFERENCES categories(id)
);

-- receptet för en produkt, en rad per råvara
-- primärnyckeln är produkt + råvara så samma råvara kan bara finnas en gång i ett recept
CREATE TABLE recipes(
    product_id INTEGER NOT NULL,
    ingredient_id INTEGER NOT NULL,
    amount FLOAT NOT NULL,
    CONSTRAINT pk_recipes PRIMARY KEY(product_id, ingredient_id),
    CONSTRAINT fk_product FOREIGN KEY(product_id) REFERENCES products(id),
    CONSTRAINT fk_ingredient FOREIGN KEY(ingredient_id) REFERENCES ingredients(id)
);
