-----------Most recent Game first---------------
SELECT * FROM Game
ORDER BY time DESC
LIMIT 1;

-----------Games in past 7 days-----------------
SELECT * FROM Game
ORDER BY time DESC;

-----------Non Null Names-----------------------
SELECT * FROM Player
WHERE Player.name is not NULL;

-----------gmail accounts-----------------------
SELECT name FROM Player
WHERE emailAddress LIKE '%gmail%';

-----------Non Null Names-----------------------
SELECT playerID FROM PlayerGame;
WHERE score > 2000;

-----------8.2---------------

----------The King's scores in decreasing order-----
SELECT score FROM Player, PlayerGame
WHERE playerID = PlayerGame.playerID
    AND Player.name = 'The King'
ORDER BY score DESC;

---------winner of game played on 2006-06-28 13:20:00.-----
SELECT name FROM Player, PlayerGame, Game
WHERE Player.ID = PlayerGame.playerID
    AND PlayerGame.gameID = Game.ID
    AND Game.time = '2006-06-28 13:20:00'
ORDER BY PlayerGame.score
LIMIT 1;
