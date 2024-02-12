SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

SELECT horaire.heure_depart AS "Horaires à l'arret Madeleine"
FROM Horaire
INNER JOIN Station ON horaire.id_station = Station.id_station
WHERE Station.nom_station = "Madeleine" ORDER BY horaire.heure_depart;;


SELECT horaire.heure_depart AS "Horaires à l'arret Madeleine"
FROM Horaire
INNER JOIN Station ON horaire.id_station = Station.id_station
WHERE Station.nom_station = "Republique" ORDER BY horaire.heure_depart;;

SELECT Station.nom_station AS "Parcours de la ligne 2 Direction Kersec" FROM Ligne_station INNER JOIN Station on Ligne_station.id_station = Station.id_station INNER JOIN Ligne ON Ligne_station.id_ligne = Ligne.id_ligne WHERE Ligne.numero_ligne = 2;

SELECT 
    CASE 
        WHEN station.statut = TRUE THEN 
            (SELECT heure_depart FROM Horaire WHERE id_station = station.id_station ORDER BY heure_depart ASC) 
        ELSE 'Arrêt temporairement non desservi.' 
    END AS horaires
FROM Station station
WHERE station.nom_station = 'Petit Tohannic';

UPDATE Station
SET statut = FALSE
WHERE nom_station = 'Petit Tohannic';

SELECT 
    CASE 
        WHEN station.statut = TRUE THEN (SELECT heure_depart FROM Horaire WHERE id_station = station.id_station ORDER BY heure_depart ASC) 

        ELSE    CONCAT(
                "L\'arrêt n\'est pas desservi. Veuillez vous reporter à l\'arrêt ",
                (SELECT nom_station FROM Station WHERE id_station > (SELECT id_station FROM Station WHERE nom_station = 'Petit Tohannic') ORDER BY id_station ASC LIMIT 1)
            )
    END AS "Horaires à l'arrêt Petit Tohannic" 
FROM station
WHERE nom_station = 'Petit Tohannic';


SELECT 
    Ligne.nom_ligne AS "Parcours complet",
    GROUP_CONCAT(
        CASE 
            WHEN Station.statut = TRUE THEN Station.nom_station
            ELSE CONCAT(Station.nom_station, ' (Arrêt temporairement non desservi)')
        END
        ORDER BY Ligne_Station.ordre_passage
        SEPARATOR ' -> '
    ) AS "Liste des arrêts"
FROM 
    Ligne
INNER JOIN Ligne_Station ON Ligne.id_ligne = Ligne_Station.id_ligne
INNER JOIN Station ON Ligne_Station.id_station = Station.id_station
GROUP BY Ligne.nom_ligne;
