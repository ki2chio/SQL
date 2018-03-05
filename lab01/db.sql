CREATE TABLE Ðlane
(
  Brand_plane VARCHAR(20) NOT NULL,
  ¹_plane INT NOT NULL,
  Crew_quantity INT NOT NULL,
  PRIMARY KEY (¹_plane)
);

CREATE TABLE Flight
(
  ¹__flight INT NOT NULL,
  Date DATE NOT NULL,
  Start_time DATETIME(0) NOT NULL,
  finish_time DATETIME(0) NOT NULL,
  departure_point VARCHAR(30) NOT NULL,
  destination_point VARCHAR(30) NOT NULL,
  ¹_plane INT NOT NULL,
  PRIMARY KEY (¹__flight),
  FOREIGN KEY (¹_plane) REFERENCES Flight(¹_plane)
);