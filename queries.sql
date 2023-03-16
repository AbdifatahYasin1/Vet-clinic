/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name like '%mon';
SELECT name from animals WHERE date_of_birth between '2016-01-01' and '2019-12-31';
SELECT name from animals WHERE neutered = true;
SELECT name from animals WHERE escape_attempts < 3;
SELECT name, escape_attempts from animals WHERE weight_kg > 10.5;
SELECT * from animals WHERE neutered = true;
SELECT *
FROM animals
WHERE NOT name = 'Gabumon';
SELECT * from animals WHERE weight_kg between 10.4 and 17.3;

-- Vet clinic database: query and update animals table

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT MAX(escape_attempts) FROM animals WHERE neutered = true;
SELECT MAX(escape_attempts) FROM animals WHERE neutered = false;
SELECT MIN(weight_kg), MAX(weight_kg) FROM animals WHERE species = 'digimon';
SELECT MIN(weight_kg), MAX(weight_kg) FROM animals WHERE species = 'pokemon';
SELECT AVG(escape_attempts) FROM animals WHERE date_of_birth between '1990-01-01' and '2000-12-31';


