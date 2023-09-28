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
    SUM(escape_attempts)
FROM
    animals
WHERE
    (neutered = true);

SELECT
    SUM(escape_attempts)
FROM
    animals
WHERE
    (neutered = false);

SELECT
    MIN(weigth)
FROM
    animals
WHERE
    (neutered = true);

SELECT
    MAX(weigth_kg)
FROM
    animals
WHERE
    (neutered = true);

SELECT
    MAX(weigth_kg)
FROM
    animals
WHERE
    (neutered = FALSE);

SELECT
    MIN(weigth_kg)
FROM
    animals
WHERE
    (neutered = FALSE);

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