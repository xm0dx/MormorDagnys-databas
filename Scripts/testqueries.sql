-- SQLite
PRAGMA foreign_keys = ON;

SELECT * FROM postalcodes;
SELECT * FROM suppliers;
SELECT * FROM ingredients;
SELECT * FROM categories;
SELECT * FROM products;
SELECT * FROM recipes;
SELECT * FROM purchases;
SELECT * FROM purchaseitems;

-- leverantörerna med adress och postort
SELECT
    suppliername,
    contactperson,
    phone,
    email,
    addressline,
    postalcode,
    city
FROM suppliers INNER JOIN postalcodes
    ON suppliers.postalcode_id = postalcodes.id;

-- vilka råvaror köps från vilken leverantör
SELECT
    suppliername,
    itemnumber,
    ingredientname,
    priceperkg
FROM ingredients INNER JOIN suppliers
    ON ingredients.supplier_id = suppliers.id
ORDER BY suppliername, itemnumber;

-- produkterna och vilken kategori de hör till
SELECT
    productname,
    price,
    categoryname
FROM products INNER JOIN categories
    ON products.category_id = categories.id;

-- receptet för kanelbulle, med vad råvarorna kostar
SELECT
    productname,
    ingredientname,
    amount,
    priceperkg,
    amount * priceperkg AS cost
FROM recipes INNER JOIN products
    ON recipes.product_id = products.id INNER JOIN ingredients
    ON recipes.ingredient_id = ingredients.id
WHERE productname = 'Kanelbulle';

-- vad kostar råvarorna för varje produkt
SELECT
    productname,
    price,
    SUM(amount * priceperkg) AS ingredientcost
FROM recipes INNER JOIN products
    ON recipes.product_id = products.id INNER JOIN ingredients
    ON recipes.ingredient_id = ingredients.id
GROUP BY productname, price;

-- inköpen med leverantör och summa per inköp
SELECT
    purchasenumber,
    purchasedate,
    suppliername,
    SUM(quantity * purchaseitems.priceperkg) AS purchasesum
FROM purchases INNER JOIN suppliers
    ON purchases.supplier_id = suppliers.id INNER JOIN purchaseitems
    ON purchases.id = purchaseitems.purchase_id
GROUP BY purchasenumber, purchasedate, suppliername;

-- råvaror som måste beställas, lagret är under miniminivån
SELECT
    itemnumber,
    ingredientname,
    stock,
    minstock,
    suppliername
FROM ingredients INNER JOIN suppliers
    ON ingredients.supplier_id = suppliers.id
WHERE stock < minstock;

-- testar reglerna, de här ska ge fel. markera en rad i taget och kör den

-- leverantör 99 finns inte (FOREIGN KEY constraint failed)
-- INSERT INTO ingredients(itemnumber, ingredientname, priceperkg, supplier_id) VALUES('R999', 'Test', 10, 99);

-- vetemjöl finns redan i receptet för limpa (UNIQUE constraint failed)
-- INSERT INTO recipes(product_id, ingredient_id, amount) VALUES(1, 1, 0.5);

-- går inte att ta bort en leverantör som har råvaror (FOREIGN KEY constraint failed)
-- DELETE FROM suppliers WHERE id = 1;

-- samma artikelnummer två gånger (UNIQUE constraint failed)
-- INSERT INTO ingredients(itemnumber, ingredientname, priceperkg, supplier_id) VALUES('R100', 'Mjöl igen', 10, 1);

-- så här tar man bort leverantör 3 (Sockerbolaget) på rätt sätt, raderna som pekar på den först
-- DELETE FROM purchaseitems WHERE purchase_id = 3;
-- DELETE FROM purchases WHERE id = 3;
-- DELETE FROM recipes WHERE ingredient_id = 6;
-- DELETE FROM recipes WHERE ingredient_id = 7;
-- DELETE FROM recipes WHERE ingredient_id = 8;
-- DELETE FROM ingredients WHERE supplier_id = 3;
-- DELETE FROM suppliers WHERE id = 3;
