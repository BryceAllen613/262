--
-- This SQL script builds a monopoly database, deleting any pre-existing version.
--
-- @author kvlinden
-- @version Summer, 2015
--

-- Drop previous versions of the tables if they they exist, in reverse order of foreign keys.
DROP TABLE IF EXISTS PlayerGame;
DROP TABLE IF EXISTS Game;
DROP TABLE IF EXISTS Player;
DROP TABLE IF EXISTS UnfinishedGame;

-- Create the schema.
CREATE TABLE Game (
	ID integer PRIMARY KEY, 
	time timestamp
	);

CREATE TABLE Player (
	ID integer PRIMARY KEY, 
	emailAddress varchar(50) NOT NULL,
	name varchar(50)
	);

CREATE TABLE PlayerGame (
	gameID integer REFERENCES Game(ID), 
	playerID integer REFERENCES Player(ID),
	score integer
	);
CREATE TABLE UnfinishedGame (
	ugID integer REFERENCES Game(ID), 
	playerID integer REFERENCES Player(ID),
	score integer
	);

-- Allow users to select data from the tables.
GRANT SELECT ON Game TO PUBLIC;
GRANT SELECT ON Player TO PUBLIC;
GRANT SELECT ON PlayerGame TO PUBLIC;

-- Add sample records.
INSERT INTO Game VALUES (1, '2006-06-27 08:00:00');
INSERT INTO Game VALUES (2, '2006-06-28 13:20:00');
INSERT INTO Game VALUES (3, '2006-06-29 18:41:00');

INSERT INTO Player(ID, emailAddress) VALUES (1, 'me@calvin.edu');
INSERT INTO Player VALUES (2, 'king@gmail.edu', 'The King');
INSERT INTO Player VALUES (3, 'dog@gmail.edu', 'Dogbreath');

INSERT INTO PlayerGame VALUES (1, 1, 0.00);
INSERT INTO PlayerGame VALUES (1, 2, 0.00);
INSERT INTO PlayerGame VALUES (1, 3, 2350.00);
INSERT INTO PlayerGame VALUES (2, 1, 1000.00);
INSERT INTO PlayerGame VALUES (2, 2, 0.00);
INSERT INTO PlayerGame VALUES (2, 3, 500.00);
INSERT INTO PlayerGame VALUES (3, 2, 0.00);
INSERT INTO PlayerGame VALUES (3, 3, 5500.00);
INSERT INTO UnfinishedGame VALUES (2,1,0.00);
INSERT INTO UnfinishedGame VALUES (3,2,0.00);

SELECT COUNT(*) FROM UnfinishedGame;
SELECT * FROM UnfinishedGame;

-- -----------Most recent Game first---------------
-- SELECT * FROM Game
-- ORDER BY time DESC
-- LIMIT 1;

-- -----------Games in past 7 days-----------------
-- SELECT * FROM Game
-- ORDER BY time DESC;

-- -----------Non Null Names-----------------------
-- SELECT * FROM Player
-- WHERE Player.name is not NULL;

-- -----------gmail accounts-----------------------
-- SELECT name FROM Player
-- WHERE emailAddress LIKE '%gmail%';

-- -----------Non Null Names-----------------------
-- SELECT playerID FROM PlayerGame;
-- WHERE PlayerGame.score > 2000;

