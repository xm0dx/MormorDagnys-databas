# Mormor Dagnys bageri, databas

Inlämningsuppgift 1 i kursen Databashantering (ITHS). En SQLite-databas som håller
ordning på bageriets leverantörer, råvaror, produkter med recept och inköp.

Skripten ligger i `Scripts/` och körs i den här ordningen:

1. `createtables.sql` skapar tabellerna
2. `addtestdata.sql` lägger in testdata
3. `testqueries.sql` frågor som testar databasen
4. `droptables.sql` tar bort allt om man vill börja om
