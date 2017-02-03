USE `gwentapi`;

#User that customers will use
DROP USER 'client'@'localhost';
DROP USER 'client'@'127.0.0.1';

DROP USER 'dump'@'127.0.0.1';
DROP USER 'dump'@'localhost';

CREATE USER 'client'@'localhost' IDENTIFIED BY 'thereisonlyonekinginthenorth';
CREATE USER 'client'@'127.0.0.1' IDENTIFIED BY 'thereisonlyonekinginthenorth';

#User for backup purposes
CREATE USER 'dump'@'localhost' IDENTIFIED BY 'thenightisdarkandfullofterror';
CREATE USER 'dump'@'127.0.0.1' IDENTIFIED BY 'thenightisdarkandfullofterror';

GRANT SELECT
ON gwentapi.abilities
TO 'client'@'localhost';

GRANT SELECT
ON gwentapi.factions
TO 'client'@'localhost';

GRANT SELECT
ON gwentapi.glyphs
TO 'client'@'localhost';

GRANT SELECT
ON gwentapi.artists
TO 'client'@'localhost';

GRANT SELECT
ON gwentapi.artworks
TO 'client'@'localhost';

GRANT SELECT
ON gwentapi.categories
TO 'client'@'localhost';

GRANT SELECT
ON gwentapi.patches
TO 'client'@'localhost';

GRANT SELECT
ON gwentapi.rarities
TO 'client'@'localhost';

GRANT SELECT
ON gwentapi.rows
TO 'client'@'localhost';

GRANT SELECT
ON gwentapi.types
TO 'client'@'localhost';

GRANT SELECT
ON gwentapi.cardsrows
TO 'client'@'localhost';

GRANT SELECT
ON gwentapi.cardssubtypes
TO 'client'@'localhost';

GRANT SELECT
ON gwentapi.cards
TO 'client'@'localhost';

GRANT SELECT
ON gwentapi.abilities
TO 'client'@'127.0.0.1';

GRANT SELECT
ON gwentapi.factions
TO 'client'@'127.0.0.1';

GRANT SELECT
ON gwentapi.glyphs
TO 'client'@'127.0.0.1';

GRANT SELECT
ON gwentapi.artists
TO 'client'@'127.0.0.1';

GRANT SELECT
ON gwentapi.artworks
TO 'client'@'127.0.0.1';

GRANT SELECT
ON gwentapi.categories
TO 'client'@'127.0.0.1';

GRANT SELECT
ON gwentapi.patches
TO 'client'@'127.0.0.1';

GRANT SELECT
ON gwentapi.rarities
TO 'client'@'127.0.0.1';

GRANT SELECT
ON gwentapi.rows
TO 'client'@'127.0.0.1';

GRANT SELECT
ON gwentapi.types
TO 'client'@'127.0.0.1';

GRANT SELECT
ON gwentapi.cardsrows
TO 'client'@'127.0.0.1';

GRANT SELECT
ON gwentapi.cardssubtypes
TO 'client'@'127.0.0.1';

GRANT SELECT
ON gwentapi.cards
TO 'client'@'127.0.0.1';



GRANT SELECT, LOCK TABLES, TRIGGER, SHOW VIEW
ON `gwentapi`.*
TO 'dump'@'localhost';

GRANT SELECT, LOCK TABLES, TRIGGER, SHOW VIEW
ON `gwentapi`.*
TO 'dump'@'127.0.0.1';


FLUSH PRIVILEGES;