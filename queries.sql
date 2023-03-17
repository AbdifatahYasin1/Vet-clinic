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
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0; 
COMMIT;

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, AVG(escape_attempts) FROM animals
   GROUP BY neutered;
SELECT MIN(weight_kg), MAX(weight_kg) FROM animals WHERE species = 'digimon';
SELECT MIN(weight_kg), MAX(weight_kg) FROM animals WHERE species = 'pokemon';
SELECT AVG(escape_attempts) FROM animals WHERE date_of_birth between '1990-01-01' and '2000-12-31';



SELECT * FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Melody Pond';
-- List of all animals that are pokemon (their type is Pokemon).
SELECT * FROM animals
JOIN species ON animals.species_id = species.id
WHERE species.name = 'Pokemon';
-- List all owners and their animals, remember to include those that don't own any animal.
SELECT owners.full_name, animals.name FROM owners
LEFT JOIN animals ON owners.id = animals.owner_id;
-- How many animals are there per species?
SELECT species.name, COUNT(animals.species_id) FROM species
JOIN animals ON species.id = animals.species_id
GROUP BY species.name;
-- List all Digimon owned by Jennifer Orwell.
SELECT * FROM animals
JOIN species ON animals.species_id = species.id
JOIN owners ON animals.owner_id = owners.id
WHERE species.name = 'Digimon' AND owners.full_name = 'Jennifer Orwell';
-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT * FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;
-- Who owns the most animals?
SELECT owners.full_name, COUNT(animals.owner_id) FROM owners
JOIN animals ON owners.id = animals.owner_id
GROUP BY owners.full_name
ORDER BY COUNT(animals.owner_id) DESC
LIMIT 1;



-- Who was the last animal seen by William Tatcher?
SELECT name FROM animals
WHERE id = (SELECT animal_id FROM visits
WHERE vet_id = (SELECT id FROM vets
WHERE name = 'William Tatcher')
ORDER BY date_of_visit DESC
LIMIT 1);

-- How many different animals did Stephanie Mendez see?
SELECT COUNT(DISTINCT animal_id) FROM visits
WHERE vet_id = (SELECT id FROM vets
WHERE name = 'Stephanie Mendez');

-- List all vets and their specialties, including vets with no specialties.
SELECT v.name, s.name FROM vets v
LEFT JOIN specializations s ON v.id = s.vet_id
LEFT JOIN species sp ON s.species_id = sp.id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT a.name FROM animals a
INNER JOIN visits v ON a.id = v.animal_id
INNER JOIN vets ve ON v.vet_id = ve.id
WHERE ve.name = 'Stephanie Mendez' AND v.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';

-- What animal has the most visits to vets?
SELECT a.name, COUNT(v.animal_id) FROM animals a
INNER JOIN visits v ON a.id = v.animal_id
GROUP BY v.animal_id
ORDER BY COUNT(v.animal_id) DESC
LIMIT 1;

-- Who was Maisy Smith's first visit?
SELECT a.name FROM animals a
INNER JOIN visits v ON a.id = v.animal_id
INNER JOIN vets ve ON v.vet_id = ve.id
WHERE ve.name = 'Maisy Smith'
ORDER BY v.date_of_visit
LIMIT 1;

-- Details for most recent visit: animal information, vet information, and date of visit.

SELECT a.name, ve.name, v.date_of_visit FROM animals a
INNER JOIN visits v ON a.id = v.animal_id
INNER JOIN vets ve ON v.vet_id = ve.id
ORDER BY v.date_of_visit DESC
LIMIT 1;

-- How many visits were with a vet that did not specialize in that animal's species?
SELECT COUNT(v.animal_id) FROM visits v
INNER JOIN vets ve ON v.vet_id = ve.id
INNER JOIN animals a ON v.animal_id = a.id
INNER JOIN species s ON a.species_id = s.id
WHERE ve.id != s.id;

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT s.name FROM species s
INNER JOIN animals a ON s.id = a.species_id
INNER JOIN visits v ON a.id = v.animal_id
INNER JOIN vets ve ON v.vet_id = ve.id
WHERE ve.name = 'Maisy Smith'
GROUP BY s.name
ORDER BY COUNT(s.name) DESC
LIMIT 1;




















