/* Populate database with sample data. */

INSERT INTO animals (
        name,
        date_of_birth,
        weight_kg,
        neutered,
        escape_attempts
    )
VALUES ('Agumon', '2020-02-03', 10.23, TRUE, 0),
    ('Gabumon', '2018-11-15', 8.00, TRUE, 2),
    ('Pikachu', '2021-01-07', 15.04, FALSE, 1),
    ('Devimon', '2017-05-12', 11.00, TRUE, 5),
    ('Charmander', '2020-02-08', -11.00, FALSE, 0),
    ('Plantmon', '2021-11-15', -5.70, TRUE, 2),
    ('Squirtle', '1993-04-02', -12.13, FALSE, 3),
    ('Angemon', '2005-06-12', -45.00, TRUE, 0),
    ('Boarmon', '2005-06-07', 20.40, TRUE, 7),
    ('Blossom', '1998-09-13', 17.00, TRUE, 3),
    ('Ditto', '2022-05-14', 22.00, TRUE, 4);
       

       INSERT INTO owners (full_name, age)
VALUES ('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);



INSERT INTO species (name)
VALUES ('Pokemon'),
('Digimon');


BEGIN
UPDATE animals
SET species_id = 1
WHERE name NOT LIKE '%mon';


UPDATE animals
SET species_id = 2
WHERE name LIKE '%mon';

COMMIT;
END;


BEGIN
UPDATE animals
SET owner_id = 1
WHERE name = 'Agumon';

UPDATE animals
SET owner_id = 2
WHERE name = 'Gabumon' OR name = 'Pikachu';

UPDATE animals
SET owner_id = 3
WHERE name = 'Devimon' OR name = 'Plantmon';

UPDATE animals
SET owner_id = 4
WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';

UPDATE animals
SET owner_id = 5
WHERE name = 'Angemon' OR name = 'Boarmon';

COMMIT;
END;


INSERT INTO vets (name, age, date_of_graduation)
VALUES ('William Tatcher', 45, '2000-04-23'),
('Maisy Smith', 26, '2019-01-17'),
('Stephanie Mendez', 64, '1981-05-04'),
('Jack Harkness', 38, '2008-06-08');



INSERT INTO specializations (vet_id, species_id)
VALUES (1, 1),
(3, 1),
(3, 2),
(4, 2);




INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES (1, 1, '2020-05-24'),
(3, 1, '2020-07-22'),
(4, 2, '2021-02-02'),
(2, 3, '2020-01-05'),
(2, 3, '2020-03-08'),
(2, 3, '2020-05-14'),
(3, 4, '2021-05-04'),
(4, 5, '2021-02-24'),
(2, 6, '2019-12-21'),
(1, 6, '2020-08-10'),
(2, 6, '2021-04-07'),
(3, 7, '2019-09-29'),
(4, 8, '2020-10-03'),
(4, 8, '2020-11-04'),
(2, 9, '2019-01-24'),
(2, 9, '2019-05-15'),
(2, 9, '2020-02-27'),
(2, 9, '2020-08-03'),
(3, 10, '2020-05-24'),
(1, 10, '2021-01-11');
       

    