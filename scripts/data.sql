-- Suppression du contenu des tables 
DELETE FROM Station;
DELETE FROM Ligne;
DELETE FROM Jour;
DELETE FROM Horaire;
DELETE FROM Ligne_Station;

-- Insertion des stations
INSERT INTO Station (id_station, nom_station) VALUES
(1, 'P+R OUEST'),
(2, 'Fourchêne 1'),
(3, 'Madeleine'),
(4, 'République'),
(5, 'PIBS 2'),
(6, 'Petit Tohannic'),
(7, 'Delestraint'),
(8, 'Kersec');

-- Insertion des Ligne de bus
INSERT INTO Ligne (id_ligne,nom_ligne, numero_ligne) VALUES
(1,'Ligne 1', 1),
(2,'P+R Ouest direction Kersec', 2),
(3,'Kersec direction P+R Ouest ', 2);

-- Insertion des Jours
INSERT INTO Jour (nom_jour) VALUES
('Lundi'),
('Mardi'),
('Mercredi'),
('Jeudi'),
('Vendredi'),
('Samedi'),
('Dimanche');

-- Insertion des horaires
INSERT INTO Horaire (id_station, id_ligne, heure_depart) VALUES
(1, 2, '06:32:00'),
(1, 2, '06:42:00'),
(1, 2, '06:52:00'),
(1, 2, '07:00:00'),
(1, 2, '07:10:00'),
(2, 2, '06:34:00'),
(2, 2, '06:44:00'),
(2, 2, '06:54:00'),
(2, 2, '07:02:00'),
(2, 2, '07:12:00'),
(3, 2, '06:37:00'),
(3, 2, '06:47:00'),
(3, 2, '06:57:00'),
(3, 2, '07:06:00'),
(3, 2, '07:16:00'),
(4, 2, '06:42:00'),
(4, 2, '06:52:00'),
(4, 2, '07:02:00'),
(4, 2, '07:12:00'),
(4, 2, '07:22:00'),
(5, 2, '06:46:00'),
(5, 2, '06:56:00'),
(5, 2, '07:07:00'),
(5, 2, '07:17:00'),
(5, 2, '07:27:00'),
(6, 2, '06:50:00'),
(6, 2, '07:00:00'),
(6, 2, '07:11:00'),
(6, 2, '07:21:00'),
(6, 2, '07:31:00'),
(7, 2, '06:51:00'),
(7, 2, '07:01:00'),
(7, 2, '07:12:00'),
(7, 2, '07:22:00'),
(7, 2, '07:32:00'),
(8, 2, '06:55:00'),
(8, 2, '07:05:00'),
(8, 2, '07:16:00'),
(8, 2, '07:26:00'),
(8, 2, '07:36:00'),
(8, 3, '06:29:00'),
(7, 3, '06:32:00'),
(6, 3, '06:33:00'),
(5, 3, '06:37:00'),
(4, 3, '06:43:00'),
(3, 3, '06:49:00'),
(2, 3, '06:52:00'),
(1, 3, '06:53:00');

-- Insertion des associations entre les lignes et les stations
INSERT INTO Ligne_Station (id_station, id_ligne, ordre_passage) VALUES
(1, 2, 1),
(2, 2, 2),
(3, 2, 3),
(4, 2, 4),
(5, 2, 5),
(6, 2, 6),
(7, 2, 7),
(8, 2, 8),
(1, 3, 8),
(2, 3, 7),
(3, 3, 6),
(4, 3, 5),
(5, 3, 4),
(6, 3, 3),
(7, 3, 2),
(8, 3, 1);
