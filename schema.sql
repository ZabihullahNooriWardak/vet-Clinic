/* Database schema to keep the structure of entire database. */
CREATE DATABASE vet_clinic;

CREATE TABLE animals(
    id INTEGER,
    name VARCHAR(100),
    date_of_birth DATE,
    escape_attempts INTEGER,
    neutered BOOLEAN,
    weigth_kg DECIMAL
);

ALTER TABLE
    animals
ADD
    COLUMN species text;

CREATE TABLE owners(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name TEXT,
    age INTEGER
);

CREATE TABLE species (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name TEXT
);

ALTER TABLE
    animals DROP COLUMN id;

ALTER TABLE
    animals
ADD
    COLUMN id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY;

ALTER TABLE
    animals
ADD
    COLUMN species_id INT;

ALTER TABLE
    animals
ADD
    COLUMN owner_id INT;

ALTER TABLE
    animals
ADD
    CONSTRAINT fk_species_id FOREIGN KEY (species_id) REFERENCES species (id);

ALTER TABLE
    animals
ADD
    CONSTRAINT fK_owner_id FOREIGN KEY (owner_id) REFERENCES owners (id);