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



CREATE TABLE owners (
    id BIGSERIAL NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    age int not null,
    primary key (id)
);



CREATE TABLE species (
    id BIGSERIAL NOT NULL,
    name VARCHAR(100) NOT NULL,
    primary key (id)
);


ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD COLUMN species_id BIGINT;
ALTER TABLE animals ADD COLUMN owner_id BIGINT;
ALTER TABLE animals ADD CONSTRAINT fk_species_id FOREIGN KEY (species_id) REFERENCES species(id);
ALTER TABLE animals ADD CONSTRAINT fk_owner_id FOREIGN KEY (owner_id) REFERENCES owners(id);






CREATE TABLE vets (
    id BIGSERIAL NOT NULL,
    name VARCHAR(100) NOT NULL,
    age int not null,
    date_of_graduation date not null,
    primary key (id)
);



CREATE TABLE specializations (
    vet_id BIGINT NOT NULL,
    species_id BIGINT NOT NULL,
    CONSTRAINT fk_vet_id FOREIGN KEY (vet_id) REFERENCES vets(id),
    CONSTRAINT fk_species_id FOREIGN KEY (species_id) REFERENCES species(id)
);



CREATE TABLE visits (
    vet_id BIGINT NOT NULL,
    animal_id BIGINT NOT NULL,
    date_of_visit date not null,
    CONSTRAINT fk_vet_id FOREIGN KEY (vet_id) REFERENCES vets(id),
    CONSTRAINT fk_animal_id FOREIGN KEY (animal_id) REFERENCES animals(id)
);







