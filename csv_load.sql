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