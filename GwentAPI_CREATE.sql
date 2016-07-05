#Creation of the Gwent-api database
CREATE DATABASE IF NOT EXISTS `gwentapi`;
USE `gwentapi`;


# Drop of all tables for quick testing
DROP TABLE IF EXISTS CardsRows;
DROP TABLE IF EXISTS CardsSubTypes;
DROP TABLE IF EXISTS Cards;
DROP TABLE IF EXISTS Illustrators;
DROP TABLE IF EXISTS Types;
DROP TABLE IF EXISTS Rows;
DROP TABLE IF EXISTS Factions;
DROP TABLE IF EXISTS Rarities;
DROP TABLE IF EXISTS Glyphs;
DROP TABLE IF EXISTS Abilities;
DROP TABLE IF EXISTS Patches;



#Table containing the authors for cards artwork
CREATE TABLE IF NOT EXISTS Illustrators (
	idIllustrator INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    id VARCHAR(50) NOT NULL,
    INDEX Illustrators_id_index(id)
)
ENGINE=InnoDB;

ALTER TABLE Illustrators
ADD CONSTRAINT Illustrators_name_UK
UNIQUE (name);

ALTER TABLE Illustrators
ADD CONSTRAINT Illustrators_id_UK
UNIQUE (id);



#Table containing the different card types
CREATE TABLE IF NOT EXISTS Types (
	idType INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(15) NOT NULL,
    id VARCHAR(15) NOT NULL,
    INDEX Types_id_index(id)
)
ENGINE=InnoDB;

ALTER TABLE Types
ADD CONSTRAINT Types_name_UK
UNIQUE (name);

ALTER TABLE Types
ADD CONSTRAINT Types_id_UK
UNIQUE (id);



#Table containing the different combat rows
CREATE TABLE IF NOT EXISTS Rows (
	idRow INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(6) NOT NULL,
    id VARCHAR(6) NOT NULL,
    INDEX Rows_id_index(id)
)
ENGINE=InnoDB;

ALTER TABLE Rows
ADD CONSTRAINT Rows_name_UK
UNIQUE (name);

ALTER TABLE Rows
ADD CONSTRAINT Rows_id_UK
UNIQUE (id);




#Table containing the different factions
CREATE TABLE IF NOT EXISTS Factions (
	idFaction INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL,
    id VARCHAR(20) NOT NULL,
    INDEX Factions_id_index(id)
)
ENGINE=InnoDB;

ALTER TABLE Factions
ADD CONSTRAINT Factions_name_UK
UNIQUE (name);

ALTER TABLE Factions
ADD CONSTRAINT Factions_id_UK
UNIQUE (id);




#Table containing the different card rarities
CREATE TABLE IF NOT EXISTS Rarities (
	idRarity INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(10) NOT NULL,
    id VARCHAR(10) NOT NULL,
    INDEX Rarities_id_index(id)
)
ENGINE=InnoDB;

ALTER TABLE Rarities
ADD CONSTRAINT Rarities_name_UK
UNIQUE (name);

ALTER TABLE Rarities
ADD CONSTRAINT Rarities_id_UK
UNIQUE (id);




#Table containing the different glyphs
CREATE TABLE IF NOT EXISTS Glyphs (
	idGlyph INT PRIMARY KEY AUTO_INCREMENT,
	id VARCHAR(10) NOT NULL,
    name VARCHAR(10) NOT NULL,
    isWeatherGlyph BOOL NOT NULL DEFAULT FALSE,
    text VARCHAR(70) NOT NULL,
    INDEX Glyphs_id_index(id)
)
ENGINE=InnoDB;

ALTER TABLE Glyphs
ADD CONSTRAINT Glyphs_name_UK
UNIQUE (name);

ALTER TABLE Glyphs
ADD CONSTRAINT Glyphs_id_UK
UNIQUE (id);






#Table containing the different card abilities
CREATE TABLE IF NOT EXISTS Abilities (
	idAbility INT PRIMARY KEY AUTO_INCREMENT,
	id VARCHAR(30) NOT NULL,
    name VARCHAR(30) NOT NULL,
    description VARCHAR(100),
    INDEX Abilities_id_index(id)
)
ENGINE=InnoDB;

ALTER TABLE Abilities
ADD CONSTRAINT Abilities_name_UK
UNIQUE (name);

ALTER TABLE Abilities
ADD CONSTRAINT Abilities_description_UK
UNIQUE (description);

ALTER TABLE Abilities
ADD CONSTRAINT Abilities_id_UK
UNIQUE (id);





#Table containing the different patchs for the game
CREATE TABLE IF NOT EXISTS Patches(
	idPatch INT PRIMARY KEY AUTO_INCREMENT,
    version VARCHAR(10) NOT NULL,
    releaseDate TIMESTAMP NOT NULL,
    changelog VARCHAR(500),
    id VARCHAR(10) NOT NULL,
    INDEX Patches_id_index(id)
)
ENGINE=InnoDB;

ALTER TABLE Patches
ADD CONSTRAINT Patches_version_UK
UNIQUE (version);

ALTER TABLE Patches
ADD CONSTRAINT Patches_releaseDate_UK
UNIQUE (releaseDate);

ALTER TABLE Patches
ADD CONSTRAINT Patches_id_UK
UNIQUE (id);




#Table containg the different cards for the game
CREATE TABLE IF NOT EXISTS Cards(
	idCard INT PRIMARY KEY AUTO_INCREMENT,
	idRarity INT NOT NULL,
    idFaction INT NOT NULL,
    idIllustrator INT,
    idType INT NOT NULL,
    idAbility INT,
	id VARCHAR(50) NOT NULL,
	name VARCHAR(50) NOT NULL,
    strength INT,
    text VARCHAR(255),
    flavor VARCHAR(255),
    INDEX Cards_id_index(id)
)
ENGINE=InnoDB;

ALTER TABLE Cards
ADD CONSTRAINT Cards_name_UK
UNIQUE (name);

ALTER TABLE Cards
ADD CONSTRAINT Cards_id_UK
UNIQUE (id);

Alter TABLE Cards
ADD CONSTRAINT Cards_Rarities_FK
FOREIGN KEY (idRarity) REFERENCES Rarities (idRarity);

Alter TABLE Cards
ADD CONSTRAINT Cards_Factions_FK
FOREIGN KEY (idFaction) REFERENCES Factions (idFaction);

Alter TABLE Cards
ADD CONSTRAINT Cards_Illustrators_FK
FOREIGN KEY (idIllustrator) REFERENCES Illustrators (idIllustrator);

Alter TABLE Cards
ADD CONSTRAINT Cards_Types_FK
FOREIGN KEY (idType) REFERENCES Types (idType);

Alter TABLE Cards
ADD CONSTRAINT Cards_Abilities_FK
FOREIGN KEY (idAbility) REFERENCES Abilities (idAbility);


#Table containing the loyalties for every cards.
Create TABLE IF NOT EXISTS CardsSubTypes(
	idCardSubType INT  PRIMARY KEY AUTO_INCREMENT,
    idCard INT NOT NULL,
    idType INT NOT NULL
)
ENGINE=InnoDB;

ALTER Table CardsSubTypes
ADD CONSTRAINT CardsSubTypes_Cards_Types_UK
UNIQUE (idCard, idType);

ALTER Table CardsSubTypes
ADD CONSTRAINT CardsSubTypes_Cards_FK
FOREIGN KEY (idCard) REFERENCES Cards (idCard);

ALTER Table CardsSubTypes
ADD CONSTRAINT CardsSubTypes_Types_FK
FOREIGN KEY (idType) REFERENCES Types (idType);



#Table containing the combat row for every cards.
Create TABLE IF NOT EXISTS CardsRows(
	idCardRow INT  PRIMARY KEY AUTO_INCREMENT,
    idCard INT NOT NULL,
    idRow INT NOT NULL
)
ENGINE=InnoDB;

ALTER Table CardsRows
ADD CONSTRAINT CardsRows_Cards_Rows_UK
UNIQUE (idCard, idRow);

ALTER Table CardsRows
ADD CONSTRAINT CardsRows_Cards_FK
FOREIGN KEY (idCard) REFERENCES Cards (idCard);

ALTER Table CardsRows
ADD CONSTRAINT CardsRows_Rows_FK
FOREIGN KEY (idRow) REFERENCES Rows (idRow);