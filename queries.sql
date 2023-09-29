/*Queries that provide answers to the questions from all projects.*/
SELECT
    *
FROM
    animals
WHERE
    name LIKE '%mon';

SELECT
    name
FROM
    animals
WHERE
    date_of_birth BETWEEN '2016-01-01'
    AND '2019-12-31';

SELECT
    name
FROM
    animals
WHERE
    (neutered = true)
    AND (escape_attempts < 3);

SELECT
    date_of_birth
FROM
    animals
WHERE
    (name = 'Augmon')
    OR (name = 'Pikachu');

SELECT
    name,
    escape_attempts
FROM
    animals
WHERE
    (weigth_kg > 10.5);

SELECT
    *
FROM
    animals
WHERE
    (neutered = true);

SELECT
    *
FROM
    animals
WHERE
    name <> 'Gabumon';

SELECT
    *
FROM
    animals
WHERE
    (weigth_kg >= 10.4)
    AND (weigth_kg <= 17.3);

begin;

UPDATE
    animals
SET
    species = 'unspecified';

select
    *
from
    animals;

rollback;

select
    *
from
    animals;

begin;

UPDATE
    animals
SET
    species = 'digimon'
WHERE
    name LIKE '%mon';

select
    *
from
    animals;

UPDATE
    animals
SET
    species = 'pokemon'
WHERE
    species IS NULL
    OR species = '';

select
    *
from
    animals;

commit;

select
    *
from
    animals;

SELECT
    COUNT(*)
FROM
    animals;

SELECT
    COUNT(*)
FROM
    animals
WHERE
    (escape_attempts = 0);

SELECT
    AVG(weigth_kg)
from
    animals;

SELECT
    neutered,
    MAX(escape_attempts)
FROM
    animals
GROUP BY
    neutered;

SELECT
    species,
    MIN(weight_kg),
    MAX(weight_kg)
FROM
    animals
WHERE
    (neutered = true)
GROUP BY
    species;

SELECT
    species,
    MIN(weight_kg),
    MAX(weight_kg)
FROM
    animals
WHERE
    (neutered = false)
GROUP BY
    species;

SELECT
    neutered,
    AVG(escape_attempts) as avg_attempts
FROM
    animals
WHERE
    date_of_birth BETWEEN '1990-01-01'
    AND '2000-12-31'
GROUP BY
    neutered;

/* Now, take a deep breath and... Inside a transaction delete all
 records in the animals table, then roll back the transaction. */
begin;

DELETE FROM
    animals;

rollback;

select
    *
from
    animals;

/* Inside a transaction:
 Delete all animals born after Jan 1st, 2022. */
begin;

Delete FROM
    animals
WHERE
    (date_of_birth > '2022-01-01');

SAVEPOINT deleteNewAnimals;

UPDATE
    animals
SET
    weigth_kg = weigth_kg *(-1);

ROLLBACK deleteNewAnimals;

UPDATE
    animals
SET
    weigth_kg = weigth_kg *(-1);

commit;

SELECT
    a.name
FROM
    animals a
    JOIN vets v ON a.owner_id = v.id
WHERE
    v.full_name = 'Melody';

SELECT
    a.name
FROM
    animals a
    JOIN species s ON a.species_id = s.id
WHERE
    s.name = 'Pokemon';

SELECT
    v.full_name,
    a.name
FROM
    vets v
    LEFT JOIN animals a ON v.id = a.owner_id;

SELECT
    s.name AS species_name,
    COUNT(*) AS animal_count
FROM
    animals a
    JOIN species s ON a.species_id = s.id
GROUP BY
    s.name;

SELECT
    a.name
FROM
    animals a
    JOIN vets v ON a.owner_id = v.id
    JOIN species s ON a.species_id = s.id
WHERE
    v.full_name = 'Jennifer Orwell'
    AND s.name = 'Digimon';

SELECT
    a.name
FROM
    animals a
    JOIN vets v ON a.owner_id = v.id
WHERE
    v.full_name = 'Dean Winchester'
    AND a.escape_attempts = 0;

SELECT
    v.full_name AS owner_name,
    COUNT(*) AS animal_count
FROM
    animals a
    JOIN vets v ON a.owner_id = v.id
GROUP BY
    v.full_name
ORDER BY
    COUNT(*) DESC
LIMIT
    1;