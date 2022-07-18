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

--join table queries


SELECT animals.name,visits.date_of_visit FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON vets.id = visits.vets_id WHERE vets.name = 'William Tatcher' ORDER BY visits.date_of_visit DESC LIMIT 1;

SELECT COUNT(DISTINCT animals.name) FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON vets.id = visits.vets_id WHERE vets.name = 'Stephanie Mendez' GROUP BY vets.name;

SELECT vets.name, species.name as specialties FROM vets FULL JOIN specializations ON vets.id = specializations.vets_id FULL JOIN species ON species.id = specializations.species_id;

SELECT animals.name, visits.date_of_visit FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON vets.id = visits.vets_id WHERE visits.date_of_visit BETWEEN '2020-04-01' AND '2020-09-30' AND vets.name = 'Stephanie Mendez';

SELECT COUNT(animals.name) AS nb_of_visit, animals.name FROM animals JOIN visits ON animals.id = visits.animals_id GROUP BY animals.name ORDER BY nb_of_visit DESC LIMIT 1;

SELECT animals.name, visits.date_of_visit FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON vets.id = visits.vets_id WHERE vets.name = 'Maisy Smith' ORDER BY visits.date_of_visit ASC LIMIT 1;

SELECT visits.date_of_visit, animals.name AS ANIMALS_NAME, animals.date_of_birth AS ANIMALS_BITH, animals.escape_attempts, animals.weight_kg, species.name AS ANIMALS_SPECIES, owners.full_name AS OWNERS, vets.name AS VET_NAME, vets.age AS VET_age, vets.date_of_graduation AS VET_DATE_OF_GRAD FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON vets.id = visits.vets_id JOIN species ON animals.species_id = species.id JOIN owners ON animals.owner_id = owners.id ORDER BY visits.date_of_visit DESC LIMIT 1;

SELECT COUNT(visits.animals_id) FROM visits JOIN vets ON vets.id = visits.vets_id JOIN animals ON animals.id = visits.animals_id JOIN specializations ON specializations.vets_id = vets.id WHERE specializations.species_id != animals.species_id;

SELECT COUNT(animals.species_id) as count_visit, species.name FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON vets.id = visits.vets_id JOIN species ON animals.species_id = species.id WHERE vets.name = 'Maisy Smith' GROUP BY species.name ORDER BY count_visit DESC LIMIT 1;

SELECT COUNT(*) FROM visits where animal_id = 4;
SELECT * FROM visits where vet_id = 2;
SELECT * FROM owners where email = 'owner_18327@mail.com';

EXPLAIN ANALYZE SELECT * FROM owners where email = 'owner_18327@mail.com';
EXPLAIN ANALYZE SELECT * FROM visits where vets_id = 2;
EXPLAIN ANALYZE SELECT COUNT(*) FROM visits where animals_id = 4;