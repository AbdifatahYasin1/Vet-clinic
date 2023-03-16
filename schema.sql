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













