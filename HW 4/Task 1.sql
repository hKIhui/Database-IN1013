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
