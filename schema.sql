/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
     id BIGSERIAL NOT NULL,
    name VARCHAR(100) NOT NULL,
    date_of_birth Date,
    escape_attempts int not null,
    neutered boolean not null,
    weight_kg  decimal not null,
    primary key (id)

);



ALTER TABLE animals ADD COLUMN species VARCHAR(100);



BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;




BEGIN;
UPDATE animals SET species = 'digimon' WHERE name like '%mon';
UPDATE animals SET species = 'pokemon' WHERE species is null;
COMMIT;
SELECT * FROM animals;




BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;




BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT savepoint1;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO savepoint1;
UPDATE animals SET weight_kg = weight_kg * -1;
COMMIT;









