# Projet de Base de Données de Transport en Commun

## Table des matières

1. [Utiliser les scripts SQL](#utiliser-les-scripts-sql)
2. [Conception](#conception)
   - [Dictionnaire des données](#dictionnaire-des-données)
   - [Modèle Conceptuel des Données (MCD)](#modèle-conceptuel-des-données-mcd)
3. [Remarques](#remarques)
4. [Références](#références)

## Utiliser les scripts SQL

Pour lancer les scripts SQL, suivez les instructions suivantes :

1. Exécutez le script `schema.sql` pour créer les tables nécessaires à la base de données.

```p
--mysql -h localhost -u root -p < schema.sql
```

2. Ensuite, exécutez le script `data.sql` pour ajoutez les informations.

```p
--mysql -h localhost -u root -p < data.sql
```

3. Enfin, exécutez le script `requetes.sql`

```p
--mysql -h localhost -u root -p < requetes.sql
```

## Conception

### Dictionnaire des données

Voici le dictionnaire des données pour la base de données de transport en commun :

- **Jour** :

  - `id_jour` (int) : Identifiant du jour.
  - `nom_jour` (varchar(12)) : Nom du jour.

- **Ligne** :

  - `id_ligne` (int) : Identifiant de la ligne.
  - `nom_ligne` (varchar(45)) : Nom de la ligne.

- **Station** :

  - `id_station` (int) : Identifiant de la station.
  - `id_ligne` (int) : Identifiant de la ligne à laquelle la station est associée.
  - `nom_station` (varchar(25)) : Nom de la station.
  - `non_desservi_temporairement` (boolean) : Indique si la station n'est pas desservie temporairement.
  - `rediriger_vers` (int) : ID de la station vers laquelle rediriger le trafic.

- **Horaire** :
  - `id_horaire` (int) : Identifiant de l'horaire.
  - `id_ligne` (int) : Identifiant de la ligne.
  - `id_station` (int) : Identifiant de la station.
  - `id_jour` (int) : Identifiant du jour.
  - `horaires` (time) : Heure de départ.

### Modèle Conceptuel des Données (MCD)

![Modèle Conceptuel des Données](![alt text](image.png))

## Remarques

Aucune remarque pour le moment.

## Références

Aucune référence n'a été utilisée pour ce projet jusqu'à présent.
