DROP DATABASE IF EXISTS pet_database;
CREATE DATABASE pet_database;
USE pet_database;

DROP TABLE IF EXISTS petPet, petEvent;

CREATE TABLE petPet (
  petname VARCHAR(20) PRIMARY KEY,
  owner VARCHAR(45),
  species VARCHAR(45),
  gender ENUM("M", "F"),
  birth date,
  death date
);

CREATE TABLE petEvent (
  petname VARCHAR(20) ,
  eventdate date,
  eventtype VARCHAR(15),
  remark VARCHAR(255),
  Event_ID INT PRIMARY KEY,
  FOREIGN KEY (petname) REFERENCES petPet(petname)
);

    

INSERT INTO petPet VALUES
    ("Fluffy", "Harold", "cat", "F", "1993-02-04", NULL),
    ("Claws", "Gwen", "cat", "M", "1994-03-17", NULL),
    ("Buffy", "Harold", "dog", "F", "1989-05-13", NULL),
    ("Fang", "Benny", "dog", "M", "1990-08-27", NULL),
    ("Bowser", "Diane", "dog", "M", "1979-08-31", "1995-07-29"),
    ("Chirpy", "Gwen", "bird", "F", "1998-09-11", NULL),
    ("Whistler", "Gwen", "bird", NULL, "1997-12-09", NULL),
    ("Slim", "Benny", "snake", "M", "1996-04-29", NULL),
    ('Puffball','Diane','hamster','F','1999-03-30',NULL);
    
INSERT INTO petEvent VALUES
    ("Fluffy", "1995-05-15", "litter", "4 kittens, 3 female, 1 male", "1"),
    ("Buffy", "1993-06-23", "litter", "5 puppies, 2 female, 3 male", "2"),
    ("Buffy", "1994-06-19", "litter", "3 puppies, 3 female", "3"),
    ("Chirpy", "1999-03-21", "vet", "needed beak straightened", "4"),
    ("Slim", "1997-08-03", "vet", "broken rib", "5"),
    ("Slim", "1997-10-04", "vet", "broken tooth", "6"),
    ("Bowser", "1991-10-12", "kennel", NULL, "7"),
    ("Fang", "1991-10-12", "kennel", NULL, "8"),
    ("Fang", "1998-08-28", "birthday", "Gave him a new chew toy", "9"),
    ("Claws", "1998-03-17","birthday", "Gave him a new flea collar", "10"),
    ("Whistler", "1998-12-09", "birthday", "First birthday", "11");




INSERT INTO petPet VALUES
	("Hammy", "Diane", "hamster", "M", "2010-10-30 ", NULL);
    
    
INSERT INTO petEvent VALUES
	("Fluffy", "2020-10-15", "vet", "antibiotics","12"),
    ("Hammy", "2020-10-15", "vet", "antibiotics","13" ),
    ("Claws", "1997-08-03", "vet", "broken rib", "14");

    
    
UPDATE petPet SET death="2020-09-01" WHERE petname="Puffball";
UPDATE petEvent SET remark="5 kittens, 3 female, 2 male" WHERE Event_ID="1";


DELETE FROM petEvent WHERE petname IN (SELECT petname FROM petPet WHERE owner="Harold" AND species="dog");
DELETE FROM petPet WHERE owner="Harold"  AND species=”dog”;
    
 SELECT * FROM  petPet;
 SELECT * FROM  petEvent;
