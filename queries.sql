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


