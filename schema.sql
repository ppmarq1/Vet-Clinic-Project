CREATE TABLE animals ( id serial NOT NULL, name VARCHAR(100) NOT NULL, date_of_birth DATE NOT NULL, escape_attempts serial NOT NULL, neutered bool NOT NULL, weight_kg decimal NOT NULL, PRIMARY KEY (id));

alter table animals add column species VARCHAR(100);
