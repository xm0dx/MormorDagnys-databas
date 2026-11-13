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
