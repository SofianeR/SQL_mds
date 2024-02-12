-- Suppression des tables si elle existe
DROP TABLE IF EXISTS Ligne_Station;
DROP TABLE IF EXISTS Horaire_Jour;
DROP TABLE IF EXISTS Horaire_Ligne;
DROP TABLE IF EXISTS Ligne;
DROP TABLE IF EXISTS Horaire;
DROP TABLE IF EXISTS Jour;
DROP TABLE IF EXISTS Station;

-- Creation table station
CREATE TABLE Station (
    id_station INT AUTO_INCREMENT NOT NULL,
    nom_station VARCHAR(255),
    statut BOOLEAN DEFAULT true,
    PRIMARY KEY (id_station)
) ENGINE=InnoDB;

-- Creation table horaire

CREATE TABLE Horaire (
    id_horaire INT AUTO_INCREMENT NOT NULL,
    id_station INT,
    id_ligne INT,
    heure_depart TIME,
    PRIMARY KEY (id_horaire)
) ENGINE=InnoDB;

-- Creation table ligne

CREATE TABLE Ligne (
    id_ligne INT AUTO_INCREMENT NOT NULL,
    nom_ligne VARCHAR(255),
    numero_ligne INT,
    PRIMARY KEY (id_ligne)
) ENGINE=InnoDB;

-- Creation table jour

CREATE TABLE Jour (
    id_jour INT AUTO_INCREMENT NOT NULL,
    nom_jour VARCHAR(255),
    PRIMARY KEY (id_jour)
) ENGINE=InnoDB;

-- Creation table d'association entre les lignes et les stations


CREATE TABLE Ligne_Station (
    id_station INT NOT NULL,
    id_ligne INT NOT NULL,
    ordre_passage INT NOT NULL,
    PRIMARY KEY (id_station, id_ligne),
    CONSTRAINT FK_Ligne_Station_id_station FOREIGN KEY (id_station) REFERENCES Station (id_station),
    CONSTRAINT FK_Ligne_Station_id_ligne FOREIGN KEY (id_ligne) REFERENCES Ligne (id_ligne)
) ENGINE=InnoDB;

-- Creation table association entre les horaires et les jours


CREATE TABLE Horaire_Jour (
    id_jour INT NOT NULL,
    id_horaire INT NOT NULL,
    PRIMARY KEY (id_jour, id_horaire),
    FOREIGN KEY (id_jour) REFERENCES Jour (id_jour),
    FOREIGN KEY (id_horaire) REFERENCES Horaire (id_horaire)
) ENGINE=InnoDB;
