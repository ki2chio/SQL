CREATE TABLE �lane
(
  Brand_plane VARCHAR(20) NOT NULL,
  �_plane INT NOT NULL,
  Crew_quantity INT NOT NULL,
  PRIMARY KEY (�_plane)
);

CREATE TABLE Flight
(
  �__flight INT NOT NULL,
  Date DATE NOT NULL,
  Start_time DATETIME(0) NOT NULL,
  finish_time DATETIME(0) NOT NULL,
  departure_point VARCHAR(30) NOT NULL,
  destination_point VARCHAR(30) NOT NULL,
  �_plane INT NOT NULL,
  PRIMARY KEY (�__flight),
  FOREIGN KEY (�_plane) REFERENCES Flight(�_plane)
);