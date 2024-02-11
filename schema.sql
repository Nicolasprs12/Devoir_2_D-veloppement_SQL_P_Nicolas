    DROP TABLE IF EXISTS Horaire;
    DROP TABLE IF EXISTS Station;
    DROP TABLE IF EXISTS Jour;
    DROP TABLE IF EXISTS Ligne;

    CREATE TABLE IF NOT EXISTS Jour (
        id_jour INT PRIMARY KEY,
        nom_jour VARCHAR(12)
    );

    CREATE TABLE IF NOT EXISTS Ligne (
        id_ligne INT PRIMARY KEY,
        nom_ligne VARCHAR(45)
    );

    CREATE TABLE IF NOT EXISTS Station (
        id_station INT PRIMARY KEY,
        id_ligne INT,
        nom_station VARCHAR(25),
        FOREIGN KEY (id_ligne) REFERENCES Ligne(id_ligne)
    );

    CREATE TABLE IF NOT EXISTS Horaire (
        id_horaire INT PRIMARY KEY,
        id_ligne INT,
        id_station INT,
        id_jour INT,
        horaires TIME,
        FOREIGN KEY (id_ligne) REFERENCES Ligne(id_ligne),
        FOREIGN KEY (id_station) REFERENCES Station(id_station),
        FOREIGN KEY (id_jour) REFERENCES Jour(id_jour)
    );

    ALTER TABLE Station
    ADD COLUMN non_desservi_temporairement BOOLEAN DEFAULT 0;
    ALTER TABLE Station
    ADD COLUMN rediriger_vers INT,
    ADD FOREIGN KEY (rediriger_vers) REFERENCES Station(id_station);
