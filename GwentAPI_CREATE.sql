#Creation of the Gwent-api database
CREATE DATABASE IF NOT EXISTS `gwentapi`
	DEFAULT CHARACTER SET utf8
    DEFAULT COLLATE utf8_general_ci;
USE `gwentapi`;


# Drop of all tables for quick testing
DROP TABLE IF EXISTS Artworks;
DROP TABLE IF EXISTS Categories;
DROP TABLE IF EXISTS CardsRows;
DROP TABLE IF EXISTS CardsSubTypes;
DROP TABLE IF EXISTS Cards;
DROP TABLE IF EXISTS Artists;
DROP TABLE IF EXISTS Types;
DROP TABLE IF EXISTS Rows;
DROP TABLE IF EXISTS Factions;
DROP TABLE IF EXISTS Rarities;
DROP TABLE IF EXISTS Abilities;
DROP TABLE IF EXISTS Patches;



#Table containing the authors for cards artwork
CREATE TABLE IF NOT EXISTS Artists (
	idArtist INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    id VARCHAR(50) BINARY NOT NULL,
    INDEX Artists_id_index(id)
)
ENGINE=InnoDB;

ALTER TABLE Artists
ADD CONSTRAINT Artists_name_UK
UNIQUE (name);

ALTER TABLE Artists
ADD CONSTRAINT Artists_id_UK
UNIQUE (id);


#Table containing the different card types
CREATE TABLE IF NOT EXISTS Types (
	idType INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(15) NOT NULL,
    id VARCHAR(15) BINARY NOT NULL,
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
    id VARCHAR(6) BINARY NOT NULL,
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
    id VARCHAR(20) BINARY NOT NULL,
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
    id VARCHAR(10) BINARY NOT NULL,
    INDEX Rarities_id_index(id)
)
ENGINE=InnoDB;

ALTER TABLE Rarities
ADD CONSTRAINT Rarities_name_UK
UNIQUE (name);

ALTER TABLE Rarities
ADD CONSTRAINT Rarities_id_UK
UNIQUE (id);



#Table containing the different card abilities
CREATE TABLE IF NOT EXISTS Abilities (
	idAbility INT PRIMARY KEY AUTO_INCREMENT,
	id VARCHAR(30) BINARY NOT NULL,
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
    id VARCHAR(10) BINARY NOT NULL,
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
    idType INT NOT NULL,
    idAbility INT,
	id VARCHAR(50) BINARY NOT NULL,
	name VARCHAR(50) NOT NULL,
    strength INT,
    text VARCHAR(255),
    flavor VARCHAR(255),
    INDEX Cards_id_index(id)
)
ENGINE=InnoDB;

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


#Table containing Categories giving additional information on Artworks
CREATE TABLE IF NOT EXISTS Categories (
	idCategory INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL
)
ENGINE=InnoDB;

Alter Table Categories
ADD CONSTRAINT Categories_name_UK
UNIQUE (name);


#Table containing the Artworks for every cards
CREATE TABLE IF NOT EXISTS Artworks (
	idArtwork INT PRIMARY KEY AUTO_INCREMENT,
	idCard INT NOT NULL,
    idCategory INT NOT NULL,
	idArtist INT,
    isAlternative BOOL NOT NULL DEFAULT FALSE,
    filename VARCHAR(255) NOT NULL
)
ENGINE=InnoDB;

ALTER Table Artworks
ADD CONSTRAINT Artworks_filename_UK
UNIQUE (filename);

ALTER Table Artworks
ADD CONSTRAINT Artworks_Cards_FK
FOREIGN KEY (idCard) REFERENCES Cards (idCard);

ALTER Table Artworks
ADD CONSTRAINT Artworks_Artists_FK
FOREIGN KEY (idArtist) REFERENCES Artists (idArtist);

ALTER Table Artworks
ADD CONSTRAINT Artworks_Categories_FK
FOREIGN KEY (idCategory) REFERENCES Categories (idCategory);