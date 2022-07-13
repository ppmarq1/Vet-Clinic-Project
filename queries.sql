select * from animals where  name like '%mon';
select name from animals where date_of_birth between '2016-01-01' and '2019-01-01';
select name from animals where neutered = true and escape_attempts < 3;
select date_of_birth from animals where name in ('Agumon', 'Pikachu');
select name, escape_attempts from animals where weight_kg > 10.5;
select * from animals where neutered = true;
select * from animals where name not in ('Gabumon');
select * from animals where weight_kg >=10.4 and weight_kg <=17.3;

-- update queries
select count(*) from animals;
select count(*) from animals where escape_attempts = 0;
select avg(weight_kg) from animals;
select neutered, max(escape_attempts) from animals group by neutered;
select species, max(weight_kg), min(weight_kg) from animals group by species;
select species, avg(escape_attempts) from animals where date_of_birth between '1990-01-01' and '2000-12-31' group by species;

--join queries
select name, full_name from animals join owners on animals.owner_id = owners.id where full_name = 'Melody Pond';

select animals.name as animals, species.name as species from animals join species on animals.species_id = species.id where species.name = 'Pokemon';

select name as animals, full_name as owners from animals right join owners on animals.owner_id = owners.id;

select count(animals.name) as animals_count,species.name as specie from animals join species on animals.species_id = species.id group by species.name;

select owners,full_name, animals.name as name_of_animals, species.name as name_of_species from animals join owners on owners.id = animals.owner_id join species on species.id = animals.species_id where owners.full_name = 'Jennifer Orwell' and species.name = 'Digimon';

select name, escape_attempts, full_name from animals join owners on owners.id = animals.owner_id where owners.full_name = 'Dean Winchester' and animals.escape_attempts = 0;

select full_name, count(animals.owner_id) as Owns from owners join animals on animals.owner_id = owners.id group by full_name order by Owns desc;
