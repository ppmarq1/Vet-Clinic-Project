INSERT INTO animals ( id, name, date_of_birth, escape_attempts, neutered, weight_kg) values ( 1, 'Agumon', '2020-02-03', 0, true, 10.23);
INSERT INTO animals ( id, name, date_of_birth, escape_attempts, neutered, weight_kg) values ( 2, 'Gabumon', '2018-11-15', 2, true, 8);
INSERT INTO animals ( id, name, date_of_birth, escape_attempts, neutered, weight_kg) values ( 3, 'Pikachu', '2021-01-07', 1, false, 15.04);
INSERT INTO animals ( id, name, date_of_birth, escape_attempts, neutered, weight_kg) values ( 4, 'Devimon', '2017-05-12', 5, true, 11);

insert into animals ( id, name, date_of_birth, escape_attempts, neutered, weight_kg) values ( 5, 'Charmander', '2020-02-08', 0, false, -11);
insert into animals ( id, name, date_of_birth, escape_attempts, neutered, weight_kg) values ( 6, 'Plantmon', '2021-11-15', 2, true, -5.7);
insert into animals ( id, name, date_of_birth, escape_attempts, neutered, weight_kg) values ( 7, 'Squirtle', '1993-04-02', 3, false, -12.13);
insert into animals ( id, name, date_of_birth, escape_attempts, neutered, weight_kg) values ( 8, 'Angemon', '2005-06-12', 1, true, -45);
insert into animals ( id, name, date_of_birth, escape_attempts, neutered, weight_kg) values ( 9, 'Boarmon', '2005-06-07', 7, true, 20.4);
insert into animals ( id, name, date_of_birth, escape_attempts, neutered, weight_kg) values ( 10, 'Blossom', '1998-10-13', 3, true, 17);
insert into animals ( id, name, date_of_birth, escape_attempts, neutered, weight_kg) values ( 11, 'Ditto', '2022-05-14', 4, true, 22);


begin;
update animals set species = 'unspecified';
select * from animals;
rollback;

begin;
update animals set species = 'digimon' where name like '%mon';

update animals set species = 'pokemon' where species is null;
select * from animals;
commit;

begin;
delete from animals;
select * from animals;
rollback;
select * from animals;

--savepoint transaction
begin;
delete from animals where date_of_birth > '2022-01-01';
savepoint save_point1;
update animals set weight_kg = weight_kg * (-1);
rollback to save_point1;
update animals set weight_kg = weight_kg * (-1) where weight_kg < 0;
commit;
select * from animals;

-- insert into owners table
insert into  owners(full_name, age) values('Sam Smith ', 34), ('Jennifer Orwell', 19 ),('Bob', 45 ),('Melody Pond', 77 ),('Dean Winchester', 14 ),('Jodie Whittaker', 38 );
-- insert into species table
insert into  species(name) values('Pokemon'), ('Digimon');

-- modify your inserted animals so it includes the species_id value
update animals set species_id = (select id from species where name = 'Digimon') where name like '%mon';
update animals set species_id = (select id from species where name = 'Pokemon') where name not like '%mon';

-- modify your inserted animals to include owner information (owner_id)
-- sam smith
update animals set owner_id = (select id from owners where full_name = 'Sam Smith') where name = 'Agumon';
-- jennifer orwell
update animals set owner_id = (select id from owners where full_name = 'Jennifer Orwell') where name = 'Gabumon' or name = 'Pikachu';
-- bob
update animals set owner_id = (select id from owners where full_name = 'Bob') where name = 'Devimon' or name = 'Plantmon';
-- melody pond
update animals set owner_id = (select id from owners where full_name = 'Melody Pond') where name = 'Charmander' or name = 'Blossom' or name = 'Squirtle';
-- dean winchester
update animals set owner_id = (select id from owners where full_name = 'Dean Winchester') where name = 'Angemon' or name = 'Boarmon';

-- vets
insert into vets (name, age, date_of_graduation) values ('William Tatcher', 45, '2000-04-23'),('Maisy Smith', 26, '2019-01-17'),('Stephanie Mendez', 64, '1981-05-04'),('Jack Harkness', 38, '2008-06-08');

-- specialties

insert into specializations (species_id, vets_id) values ((SELECT id FROM species WHERE name = 'Pokemon'),( SELECT id FROM vets WHERE name = 'William Tatcher'  )),(( SELECT id FROM species WHERE name = 'Pokemon' ),( SELECT id FROM vets WHERE name = 'Stephanie Mendez')),(( SELECT id FROM species WHERE name = 'Digimon' ),( SELECT id FROM vets WHERE name = 'Stephanie Mendez' ) ), ((SELECT id FROM species WHERE name = 'Digimon' ),(  SELECT id FROM vets WHERE name = 'Jack Harkness' ));

-- visits

insert into visits (animals_id, vets_id, date_of_visit) values ((SELECT id FROM animals WHERE name = 'Agumon'), (SELECT id FROM vets WHERE name = 'William Tatcher'), '2020-06-24' ),(( SELECT id FROM animals WHERE name = 'Agumon'),(  SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2020-07-22'),(( SELECT id FROM animals WHERE name = 'Pikachu'), ( SELECT id FROM vets WHERE name = 'Maisy Smith'),'2020-01-05' ),(( SELECT id FROM animals WHERE name = 'Gabumon'),( SELECT id FROM vets WHERE name = 'Jack Harkness' ),'2021-02-02'), ((SELECT id FROM animals WHERE name = 'Pikachu' ),( SELECT id FROM vets WHERE name = 'Maisy Smith' ),'2020-03-08'),(( SELECT id FROM animals WHERE name = 'Pikachu' ), ( SELECT id FROM vets WHERE name = 'Maisy Smith' ),'2020-06-14'),(( SELECT id FROM animals WHERE name = 'Devimon' ), ( SELECT id FROM vets WHERE name = 'Stephanie Mendez' ),'2021-06-04'),((SELECT id FROM animals WHERE name = 'Charmander'), ( SELECT id FROM vets WHERE name = 'Jack Harkness'),'2021-02-24'),(( SELECT id FROM animals WHERE name = 'Plantmon' ),( SELECT id FROM vets WHERE name = 'Maisy Smith'), '2019-12-21'),(( SELECT id FROM animals WHERE name = 'Plantmon'),( SELECT id FROM vets WHERE name = 'William Tatcher'),'2020-09-10'),(( SELECT id FROM animals WHERE name = 'Plantmon'),( SELECT id FROM vets WHERE name = 'Maisy Smith'),'2021-04-17' ),(( SELECT id FROM animals WHERE name = 'Squirtle'),( SELECT id FROM vets WHERE name = 'Stephanie Mendez'),'2019-09-29'),(( SELECT id FROM animals WHERE name = 'Angemon' ), ( SELECT id FROM vets WHERE name = 'Jack Harkness'),'2020-10-03'),(( SELECT id FROM animals WHERE name = 'Angemon' ),( SELECT id FROM vets WHERE name = 'Jack Harkness'),'2020-11-04'),(( SELECT id FROM animals WHERE name = 'Boarmon' ),( SELECT id FROM vets WHERE name = 'Maisy Smith' ),'2019-01-24'),(( SELECT id FROM animals WHERE name = 'Boarmon'),( SELECT id FROM vets WHERE name = 'Maisy Smith'),'2019-06-15'),(( SELECT id FROM animals WHERE name = 'Boarmon'),( SELECT id FROM vets WHERE name = 'Maisy Smith'),'2020-02-27'),((SELECT id FROM animals WHERE name = 'Boarmon' ),( SELECT id FROM vets WHERE name = 'Maisy Smith'),'2020-09-03'),(( SELECT id FROM animals WHERE name = 'Blossom'),( SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2020-06-24'),(( SELECT id FROM animals WHERE name = 'Blossom' ),(SELECT id FROM vets WHERE name = 'William Tatcher' ),'2021-01-11');