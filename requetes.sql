-- 1. Horaires à l'arrêt Madelaine et République
SELECT horaires
FROM Horaire
JOIN Station ON Horaire.id_station = Station.id_station
WHERE nom_station = 'Madelaine'
ORDER BY horaires;

-- République
SELECT horaires
FROM Horaire
JOIN Station ON Horaire.id_station = Station.id_station
WHERE nom_station = 'Republique'
ORDER BY horaires;

-- 2 Afficher le parcours complet de la ligne 2 Direction Kersec
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
SELECT nom_station AS "Parcours de la ligne 2 Direction Kersec"
FROM Station
WHERE id_ligne = 2
ORDER BY id_station;


-- 3
UPDATE Station 
SET non_desservi_temporairement = 1,
    rediriger_vers = (SELECT id_station FROM (SELECT * FROM Station) AS s WHERE nom_station = 'Delestraint')
WHERE nom_station = 'Petit Tohannic';

-- 4
SELECT
    CASE
        WHEN non_desservi_temporairement = 1 THEN 'Arrêt temporairement non desservi'
        ELSE horaires
    END AS horaires
FROM Horaire
JOIN Station ON Horaire.id_station = Station.id_station
WHERE nom_station = 'Petit Tohannic';

-- 5
SELECT
CASE
    WHEN EXISTS (SELECT * FROM Station WHERE nom_station = 'Petit Tohannic') THEN
        (SELECT CONCAT('L\'arrêt n\'est pas desservi. Veuillez vous reporter à l\'arrêt ', (SELECT nom_station FROM Station WHERE nom_station = 'Delestraint'), '.'))
    ELSE 'Arrêt temporairement non desservi.'
END AS 'Horaires à l\'arrêt Petit Tohannic (Lundi)';

-- 6
INSERT INTO Ligne (id_ligne, nom_ligne) VALUES
(3, 'Direction P+R Ouest')
ON DUPLICATE KEY UPDATE nom_ligne = 'Direction P+R Ouest';

INSERT INTO Station (id_station, nom_station, id_ligne) VALUES
(9, 'Kersec', 3),
(10, 'Delestraint', 3),
(11, 'PIBS 2', 3),
(12, 'Republique', 3),
(13, 'Madelaine', 3),
(14, 'Fourchene 1', 3),
(15, 'P+R Ouest', 3);


INSERT INTO Horaire (id_horaire, id_ligne, id_station, horaires)
SELECT id_horaire, 3, id_station, horaires
FROM Horaire
WHERE id_ligne = 2
AND id_jour = 1; 

SELECT * FROM Horaire WHERE id_ligne = 3 AND id_jour = 1;

--7
SELECT 
    L.nom_ligne AS Ligne,
    GROUP_CONCAT(
        IF(EXISTS(SELECT * FROM Station WHERE nom_station = S.nom_station), S.nom_station, CONCAT(S.nom_station, ' (Arrêt temporairement non desservi)'))
        ORDER BY S.id_station
    ) AS "Arrêts desservis"
FROM Ligne L
LEFT JOIN Station S ON L.id_ligne = S.id_ligne
GROUP BY L.id_ligne;

/*
Un index sur la colonne id_station dans la table Station pourrait être mis pour la recherches sur des stations spécifiques.
On peut aussi imaginer de créer un index composite sur les colonnes id_ligne et id_station dans la table Horaire afin de
récupérer les horaires pour une ligne et une station spécifiques.
*/