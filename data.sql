DELETE FROM Horaire;
DELETE FROM Station;
DELETE FROM Jour;
DELETE FROM Ligne;

INSERT INTO Jour (id_jour, nom_jour) VALUES
(1, 'Lundi'),
(2, 'Mardi'),
(3, 'Mercredi'),
(4, 'Jeudi'),
(5, 'Vendredi'),
(6, 'Samedi'),
(7, 'Dimanche');

INSERT INTO Ligne (id_ligne, nom_ligne) VALUES
(2, 'Ouest direction Kersec'),
(3, 'Direction P+R Ouest');

INSERT INTO Station (id_station, nom_station, id_ligne) VALUES
(1, 'P+R Ouest', 2),
(2, 'Fourchene 1', 2),
(3, 'Madelaine', 2),
(4, 'Republique', 2),
(5, 'PIBS 2', 2),
(6, 'Petit Tohannic', 2),
(7, 'Delestraint', 2),
(8, 'Kersec', 2);

INSERT INTO Horaire (id_horaire, id_ligne, id_station, horaires) VALUES
(1, 2, 1, '06:32'),
(2, 2, 1, '06:42'),
(3, 2, 1, '06:52'),
(4, 2, 1, '07:00'),
(5, 2, 1, '07:10'),
(6, 2, 2, '06:34'),
(7, 2, 2, '06:44'),
(8, 2, 2, '06:54'),
(9, 2, 2, '07:02'),
(10, 2, 2, '07:12'),
(11, 2, 3, '06:37'),
(12, 2, 3, '06:47'),
(13, 2, 3, '06:57'),
(14, 2, 3, '07:06'),
(15, 2, 3, '07:16'),
(16, 2, 4, '06:42'),
(17, 2, 4, '06:52'),
(18, 2, 4, '07:02'),
(19, 2, 4, '07:12'),
(20, 2, 4, '07:22'),
(21, 2, 5, '06:46'),
(22, 2, 5, '06:56'),
(23, 2, 5, '07:07'),
(24, 2, 5, '07:17'),
(25, 2, 5, '07:27'),
(26, 2, 6, '06:50'),
(27, 2, 6, '07:00'),
(28, 2, 6, '07:11'),
(29, 2, 6, '07:21'),
(30, 2, 6, '07:31'),
(31, 2, 7, '06:51'),
(32, 2, 7, '07:01'),
(33, 2, 7, '07:12'),
(34, 2, 7, '07:22'),
(35, 2, 7, '07:32'),
(36, 2, 8, '06:55'),
(37, 2, 8, '07:05'),
(38, 2, 8, '07:16'),
(39, 2, 8, '07:26'),
(40, 2, 8, '07:36');
