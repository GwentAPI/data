DROP TABLE IF EXISTS Tmp;
DROP FUNCTION IF EXISTS SPLIT_STR;
DROP TRIGGER IF EXISTS CARDS_ROWS_POP;

USE `gwentapi`;

LOAD DATA LOCAL INFILE "E:\\Users\\Tristan\\Documents\\Go\\src\\github.com\\tri125\\gwentapi\\data\\factions.csv"
INTO TABLE Factions
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(id,name);


LOAD DATA LOCAL INFILE "E:\\Users\\Tristan\\Documents\\Go\\src\\github.com\\tri125\\gwentapi\\data\\rarities.csv"
INTO TABLE Rarities
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(id,name);


LOAD DATA LOCAL INFILE "E:\\Users\\Tristan\\Documents\\Go\\src\\github.com\\tri125\\gwentapi\\data\\rows.csv"
INTO TABLE Rows
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(id,name);


LOAD DATA LOCAL INFILE "E:\\Users\\Tristan\\Documents\\Go\\src\\github.com\\tri125\\gwentapi\\data\\types.csv"
INTO TABLE Types
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(id,name);


LOAD DATA LOCAL INFILE "E:\\Users\\Tristan\\Documents\\Go\\src\\github.com\\tri125\\gwentapi\\data\\categories.csv"
INTO TABLE Categories
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(name);


LOAD DATA LOCAL INFILE "E:\\Users\\Tristan\\Documents\\Go\\src\\github.com\\tri125\\gwentapi\\data\\cards.csv"
INTO TABLE Cards
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(id,name,@type,@faction,strength,@rarity,text,flavor)
SET 
idType = (SELECT idType FROM Types WHERE name = @type),
idFaction = (SELECT idFaction FROM Factions WHERE name = @faction),
idRarity = (SELECT idRarity FROM Rarities WHERE name = @rarity);



DELIMITER $$

CREATE FUNCTION SPLIT_STR(
  x VARCHAR(255),
  delim VARCHAR(12),
  pos INT
)
RETURNS VARCHAR(255) DETERMINISTIC
BEGIN
    RETURN REPLACE(SUBSTRING(SUBSTRING_INDEX(x, delim, pos),
       LENGTH(SUBSTRING_INDEX(x, delim, pos -1)) + 1),
       delim, '');
END$$

DELIMITER ;


CREATE TABLE IF NOT EXISTS Tmp (
	idTmp INT PRIMARY KEY AUTO_INCREMENT,
    idCard VARCHAR(50) NOT NULL,
    rows VARCHAR(50) NOT NULL
)
ENGINE=InnoDB;

ALTER TABLE Tmp
ADD CONSTRAINT Tmp_idCard_UK
UNIQUE (idCard);

DELIMITER //

CREATE TRIGGER CARDS_ROWS_POP
AFTER INSERT
	ON Tmp FOR EACH ROW
BEGIN

    DECLARE vRow1 varchar(6);
    DECLARE vRow2 varchar(6);
    DECLARE vRow3 varchar(6);

	SELECT SPLIT_STR(NEW.rows,',', 1) INTO vRow1;
    SELECT SPLIT_STR(NEW.rows,',', 2) INTO vRow2;
    SELECT SPLIT_STR(NEW.rows,',', 3) INTO vRow3;

    IF vRow1 != '' THEN
		INSERT INTO CardsRows (idCard, idRow)
        VALUES (NEW.idCard, (SELECT idRow FROM Rows WHERE id = vRow1));
	END IF;

    IF vRow2 != '' THEN
		INSERT INTO CardsRows (idCard, idRow)
        VALUES (NEW.idCard, (SELECT idRow FROM Rows WHERE id = vRow2));
	END IF;

    IF vRow3 != '' THEN
		INSERT INTO CardsRows (idCard, idRow)
        VALUES (NEW.idCard, (SELECT idRow FROM Rows WHERE id = vRow3));
	END IF;

END; //
DELIMITER ;

LOAD DATA LOCAL INFILE "E:\\Users\\Tristan\\Documents\\Go\\src\\github.com\\tri125\\gwentapi\\data\\cardsrows.csv"
INTO TABLE Tmp
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@id,rows)
SET
idCard = (SELECT idCard FROM Cards WHERE id = @id);



DROP TABLE IF EXISTS Tmp;
DROP FUNCTION IF EXISTS SPLIT_STR;
DROP TRIGGER IF EXISTS CARDS_ROWS_POP;