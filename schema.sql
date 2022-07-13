CREATE TABLE animals ( id serial NOT NULL, name VARCHAR(100) NOT NULL, date_of_birth DATE NOT NULL, escape_attempts serial NOT NULL, neutered bool NOT NULL, weight_kg decimal NOT NULL, PRIMARY KEY (id));

alter table animals add column species VARCHAR(100);


CREATE TABLE owners ( id serial PRIMARY KEY, full_name VARCHAR(100) NOT NULL, age INT NOT NULL);
CREATE TABLE species ( id serial PRIMARY KEY, name VARCHAR(100) NOT NULL);

alter table animals drop column species;
alter table animals add species_id INT;
alter table animals add owner_id INT;

alter table animals add constraint fk_species_table FOREIGN KEY(species_id) references species(id);
alter table animals add constraint fk_owner_table FOREIGN KEY(owner_id) references owners(id);



