CREATE DATABASE Lab02Protection
ON PRIMARY(  
  NAME = 'Lab02', FILENAME = 'D:\BD', 
  SIZE = 100 Mb, FILEGROWTH = 6 Mb
)
LOG ON ( 
  NAME = 'Lab02.1', FILENAME = 'D:\BD',
  SIZE = 200 Mb, FILEGROWTH = 12 Mb
)
 CREATE TABLE lane
(
  Brand_plane VARCHAR(20) NOT NULL,
  _plane INT NOT NULL,
  Crew_quantity INT NOT NULL,
  PRIMARY KEY (_plane)
);

INSERT INTO lane(Brand_plane,_plane,Crew_quantity)
VALUES
('Boeing',21,32),
('Antonov',113,12)

CREATE TABLE Flight
(
  __flight INT NOT NULL,
  Date DATE NOT NULL,
  Start_time DATETIME(0) NOT NULL,
  finish_time DATETIME(0) NOT NULL,
  departure_point VARCHAR(30) NOT NULL,
  destination_point VARCHAR(30) NOT NULL,
  _plane INT NOT NULL,
  PRIMARY KEY (__flight),
  FOREIGN KEY (_plane) REFERENCES Flight(_plane)
);
INSERT INTO Flight(__flight,Date,Start_time,finish_time,departure_point,destination_point)
VALUES
(1,'22-03-2018','9:17:00','14:30:00','Kiev','Moskva',),
(2,'17-01-2018','14:50:30','16:10:40','Ganover','Kiev',)

  select *
  from Flight