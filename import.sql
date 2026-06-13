-- Historical import for Compás & Copas
BEGIN;

WITH s1 AS (
  INSERT INTO cyc_sessions (session_num, host, date, attendees, input_mode, sets_count, songs_count, complete)
  VALUES (1, 'Temporada 1', '2023-03-01', ARRAY["Carlos", "Daniel", "Francisco", "Freddy", "Gino", "Giusse", "Hernan", "Jorge A.", "Jose J", "Lucho", "Mario", "Mauricio O.", "Mauricio R."]::text[], 'host', 11, 20, true)
  RETURNING id
)
, set_1_0 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 0, 'Set Carlos' FROM s1
  RETURNING id
)
, song_1_0_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'Alaska', 'Perlas ensangrentadas' FROM set_1_0
  RETURNING id
)
, votes_1_0_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_0_0.id, v.voter_name, v.score
  FROM song_1_0_0,
  (VALUES ('Jose J', 5.0), ('Francisco', 7.0), ('Hernan', 8.0), ('Mario', 9.0), ('Daniel', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_0_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'And One', 'Sometimes' FROM set_1_0
  RETURNING id
)
, votes_1_0_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_0_1.id, v.voter_name, v.score
  FROM song_1_0_1,
  (VALUES ('Jose J', 7.0), ('Francisco', 6.0), ('Hernan', 9.0), ('Mario', 7.0), ('Daniel', 5.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_0_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'Billy Idol', 'Eyes Without A Face' FROM set_1_0
  RETURNING id
)
, votes_1_0_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_0_2.id, v.voter_name, v.score
  FROM song_1_0_2,
  (VALUES ('Jose J', 8.5), ('Francisco', 8.0), ('Hernan', 8.0), ('Mario', 9.0), ('Daniel', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_0_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Bruce Springsteen', 'Streets Of Philadelphia' FROM set_1_0
  RETURNING id
)
, votes_1_0_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_0_3.id, v.voter_name, v.score
  FROM song_1_0_3,
  (VALUES ('Jose J', 8.0), ('Francisco', 5.0), ('Hernan', 8.0), ('Mario', 8.0), ('Daniel', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_0_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'Depeche Mode', 'John The Revelator' FROM set_1_0
  RETURNING id
)
, votes_1_0_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_0_4.id, v.voter_name, v.score
  FROM song_1_0_4,
  (VALUES ('Jose J', 6.0), ('Francisco', 7.0), ('Hernan', 8.0), ('Mario', 7.0), ('Daniel', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_0_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'Depeche Mode', 'But not tonight (Extended Remi' FROM set_1_0
  RETURNING id
)
, votes_1_0_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_0_5.id, v.voter_name, v.score
  FROM song_1_0_5,
  (VALUES ('Jose J', 5.0), ('Francisco', 7.0), ('Hernan', 7.0), ('Mario', 8.0), ('Daniel', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_0_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'Edith Piaf', 'Non, Je Ne Regrette Rien' FROM set_1_0
  RETURNING id
)
, votes_1_0_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_0_6.id, v.voter_name, v.score
  FROM song_1_0_6,
  (VALUES ('Jose J', 5.0), ('Francisco', 8.0), ('Hernan', 7.0), ('Mario', 8.0), ('Daniel', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_0_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'Elvis Presley', 'Suspicious Minds' FROM set_1_0
  RETURNING id
)
, votes_1_0_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_0_7.id, v.voter_name, v.score
  FROM song_1_0_7,
  (VALUES ('Jose J', 8.0), ('Francisco', 7.0), ('Hernan', 7.0), ('Mario', 8.0), ('Daniel', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_0_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'Erasure', 'River Deep Mountain High [7" version]' FROM set_1_0
  RETURNING id
)
, votes_1_0_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_0_8.id, v.voter_name, v.score
  FROM song_1_0_8,
  (VALUES ('Jose J', 6.0), ('Francisco', 6.0), ('Hernan', 5.0), ('Mario', 5.0), ('Daniel', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_0_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'Héroes Del Silencio', 'Deshacer El Mundo' FROM set_1_0
  RETURNING id
)
, votes_1_0_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_0_9.id, v.voter_name, v.score
  FROM song_1_0_9,
  (VALUES ('Jose J', 6.0), ('Francisco', 7.0), ('Hernan', 6.0), ('Mario', 9.0), ('Daniel', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_0_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'Led Zeppelin', 'Whole Lotta Love' FROM set_1_0
  RETURNING id
)
, votes_1_0_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_0_10.id, v.voter_name, v.score
  FROM song_1_0_10,
  (VALUES ('Jose J', 8.0), ('Francisco', 7.0), ('Hernan', 7.0), ('Mario', 8.0), ('Daniel', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_0_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'Lighthouse Family', 'High' FROM set_1_0
  RETURNING id
)
, votes_1_0_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_0_11.id, v.voter_name, v.score
  FROM song_1_0_11,
  (VALUES ('Jose J', 7.0), ('Francisco', 8.0), ('Hernan', 8.0), ('Mario', 9.0), ('Daniel', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_0_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'Martin Solveig', '1. martin solveig feat lee fields - i want you' FROM set_1_0
  RETURNING id
)
, votes_1_0_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_0_12.id, v.voter_name, v.score
  FROM song_1_0_12,
  (VALUES ('Jose J', 3.0), ('Francisco', 7.0), ('Hernan', 4.0), ('Mario', 6.0), ('Daniel', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_0_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'MGMT', 'Time To Pretend' FROM set_1_0
  RETURNING id
)
, votes_1_0_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_0_13.id, v.voter_name, v.score
  FROM song_1_0_13,
  (VALUES ('Jose J', 7.0), ('Francisco', 9.0), ('Hernan', 6.0), ('Mario', 7.0), ('Daniel', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_0_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'OBK', 'Yo No Me Escondo' FROM set_1_0
  RETURNING id
)
, votes_1_0_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_0_14.id, v.voter_name, v.score
  FROM song_1_0_14,
  (VALUES ('Jose J', 5.0), ('Francisco', 9.0), ('Hernan', 9.0), ('Mario', 8.0), ('Daniel', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_0_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'Prezioso Feat. Marvin', 'Voglio Vederti Danzare' FROM set_1_0
  RETURNING id
)
, votes_1_0_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_0_15.id, v.voter_name, v.score
  FROM song_1_0_15,
  (VALUES ('Jose J', 2.0), ('Francisco', 7.0), ('Hernan', 3.0), ('Mario', 4.0), ('Daniel', 4.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_0_16 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 16, 'Scissor Sisters', 'Filthy/Gorgeous [original version]' FROM set_1_0
  RETURNING id
)
, votes_1_0_16 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_0_16.id, v.voter_name, v.score
  FROM song_1_0_16,
  (VALUES ('Jose J', 6.0), ('Francisco', 7.0), ('Hernan', 6.0), ('Mario', 6.0), ('Daniel', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_0_17 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 17, 'Steppenwolf', 'Born To Be Wild' FROM set_1_0
  RETURNING id
)
, votes_1_0_17 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_0_17.id, v.voter_name, v.score
  FROM song_1_0_17,
  (VALUES ('Jose J', 8.0), ('Francisco', 8.0), ('Hernan', 6.0), ('Mario', 8.0), ('Daniel', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_0_18 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 18, 'The Cure', 'Why Can''t I Be You?' FROM set_1_0
  RETURNING id
)
, votes_1_0_18 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_0_18.id, v.voter_name, v.score
  FROM song_1_0_18,
  (VALUES ('Jose J', 5.0), ('Francisco', 6.0), ('Hernan', 8.0), ('Mario', 4.0), ('Daniel', 5.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_0_19 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 19, 'The Pretenders', 'Back On The Chain Gang' FROM set_1_0
  RETURNING id
)
, votes_1_0_19 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_0_19.id, v.voter_name, v.score
  FROM song_1_0_19,
  (VALUES ('Jose J', 7.0), ('Francisco', 7.0), ('Hernan', 8.0), ('Mario', 8.0), ('Daniel', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, set_1_1 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 1, 'Set Daniel' FROM s1
  RETURNING id
)
, song_1_1_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'Aerosmith', 'Dream on' FROM set_1_1
  RETURNING id
)
, votes_1_1_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_1_0.id, v.voter_name, v.score
  FROM song_1_1_0,
  (VALUES ('Jose J', 8.0), ('Francisco', 7.0), ('Hernan', 6.5), ('Mario', 7.5), ('Jorge A.', 7.5), ('Carlos', 8.0), ('Giusse', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_1_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'Billy Idol', 'Rebel yell' FROM set_1_1
  RETURNING id
)
, votes_1_1_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_1_1.id, v.voter_name, v.score
  FROM song_1_1_1,
  (VALUES ('Jose J', 7.0), ('Francisco', 8.0), ('Hernan', 8.5), ('Mario', 9.0), ('Jorge A.', 8.0), ('Carlos', 9.0), ('Giusse', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_1_1_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'Bon Jovi', 'Born to be my baby' FROM set_1_1
  RETURNING id
)
, votes_1_1_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_1_2.id, v.voter_name, v.score
  FROM song_1_1_2,
  (VALUES ('Jose J', 6.5), ('Francisco', 7.0), ('Hernan', 7.5), ('Mario', 6.5), ('Jorge A.', 8.0), ('Carlos', 6.0), ('Giusse', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_1_1_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Collective Soul', 'Shine' FROM set_1_1
  RETURNING id
)
, votes_1_1_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_1_3.id, v.voter_name, v.score
  FROM song_1_1_3,
  (VALUES ('Jose J', 9.0), ('Francisco', 8.0), ('Hernan', 7.0), ('Mario', 8.0), ('Jorge A.', 8.0), ('Carlos', 7.0), ('Giusse', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_1_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'Green Day', '21 guns (Grammys)' FROM set_1_1
  RETURNING id
)
, votes_1_1_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_1_4.id, v.voter_name, v.score
  FROM song_1_1_4,
  (VALUES ('Jose J', 8.0), ('Francisco', 8.5), ('Hernan', 8.0), ('Mario', 7.0), ('Jorge A.', 8.0), ('Carlos', 9.0), ('Giusse', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_1_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'Greg Khin Band', 'Break up Song' FROM set_1_1
  RETURNING id
)
, votes_1_1_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_1_5.id, v.voter_name, v.score
  FROM song_1_1_5,
  (VALUES ('Jose J', 9.0), ('Francisco', 7.0), ('Hernan', 9.0), ('Mario', 8.0), ('Jorge A.', 7.5), ('Carlos', 8.5), ('Giusse', 7.8)) AS v(voter_name, score)
  RETURNING id
)
, song_1_1_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'Guns N'' Roses', 'knocking on heaven doors' FROM set_1_1
  RETURNING id
)
, votes_1_1_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_1_6.id, v.voter_name, v.score
  FROM song_1_1_6,
  (VALUES ('Jose J', 9.0), ('Francisco', 8.0), ('Hernan', 9.0), ('Mario', 8.0), ('Jorge A.', 9.0), ('Carlos', 9.0), ('Giusse', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_1_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'Kiss', 'I was made for loving you' FROM set_1_1
  RETURNING id
)
, votes_1_1_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_1_7.id, v.voter_name, v.score
  FROM song_1_1_7,
  (VALUES ('Jose J', 7.0), ('Francisco', 7.0), ('Hernan', 7.0), ('Mario', 6.0), ('Jorge A.', 7.0), ('Carlos', 8.0), ('Giusse', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_1_1_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'Lady Gaga', 'Poker face' FROM set_1_1
  RETURNING id
)
, votes_1_1_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_1_8.id, v.voter_name, v.score
  FROM song_1_1_8,
  (VALUES ('Jose J', 6.5), ('Francisco', 7.5), ('Hernan', 6.5), ('Mario', 7.0), ('Jorge A.', 6.0), ('Carlos', 8.0), ('Giusse', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_1_1_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'Linking park-jayZ', 'In the end' FROM set_1_1
  RETURNING id
)
, votes_1_1_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_1_9.id, v.voter_name, v.score
  FROM song_1_1_9,
  (VALUES ('Jose J', 6.5), ('Francisco', 6.0), ('Hernan', 8.0), ('Mario', 6.0), ('Jorge A.', 8.5), ('Carlos', 4.0), ('Giusse', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_1_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'Pet shop boys', 'West end girls' FROM set_1_1
  RETURNING id
)
, votes_1_1_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_1_10.id, v.voter_name, v.score
  FROM song_1_1_10,
  (VALUES ('Jose J', 7.5), ('Francisco', 8.0), ('Hernan', 8.0), ('Mario', 8.5), ('Jorge A.', 8.0), ('Carlos', 8.0), ('Giusse', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_1_1_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'Pínk floyd', 'another brick on the wall' FROM set_1_1
  RETURNING id
)
, votes_1_1_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_1_11.id, v.voter_name, v.score
  FROM song_1_1_11,
  (VALUES ('Jose J', 10.0), ('Francisco', 8.5), ('Hernan', 9.5), ('Mario', 9.5), ('Jorge A.', 9.0), ('Carlos', 9.0), ('Giusse', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_1_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'Poison', 'I wont forget you' FROM set_1_1
  RETURNING id
)
, votes_1_1_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_1_12.id, v.voter_name, v.score
  FROM song_1_1_12,
  (VALUES ('Jose J', 8.0), ('Francisco', 8.0), ('Hernan', 8.5), ('Mario', 8.5), ('Jorge A.', 8.0), ('Carlos', 8.0), ('Giusse', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_1_1_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'Queen', 'we are the champions' FROM set_1_1
  RETURNING id
)
, votes_1_1_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_1_13.id, v.voter_name, v.score
  FROM song_1_1_13,
  (VALUES ('Jose J', 8.5), ('Francisco', 9.0), ('Hernan', 9.5), ('Mario', 9.0), ('Jorge A.', 8.5), ('Carlos', 9.0), ('Giusse', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_1_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'Republica', 'Ready to go' FROM set_1_1
  RETURNING id
)
, votes_1_1_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_1_14.id, v.voter_name, v.score
  FROM song_1_1_14,
  (VALUES ('Jose J', 7.5), ('Francisco', 8.5), ('Hernan', 8.5), ('Mario', 8.0), ('Jorge A.', 8.0), ('Carlos', 9.0), ('Giusse', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_1_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'Ritchie Sambora', 'I`ll be there for you' FROM set_1_1
  RETURNING id
)
, votes_1_1_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_1_15.id, v.voter_name, v.score
  FROM song_1_1_15,
  (VALUES ('Jose J', 7.5), ('Francisco', 8.0), ('Hernan', 8.0), ('Mario', 8.0), ('Jorge A.', 7.0), ('Carlos', 7.0), ('Giusse', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_1_16 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 16, 'Robbie Williams', 'Rock DJ' FROM set_1_1
  RETURNING id
)
, votes_1_1_16 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_1_16.id, v.voter_name, v.score
  FROM song_1_1_16,
  (VALUES ('Jose J', 6.0), ('Francisco', 6.0), ('Hernan', 6.0), ('Mario', 6.0), ('Jorge A.', 7.0), ('Carlos', 6.0), ('Giusse', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_1_17 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 17, 'The Cranberries', 'Dreams' FROM set_1_1
  RETURNING id
)
, votes_1_1_17 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_1_17.id, v.voter_name, v.score
  FROM song_1_1_17,
  (VALUES ('Jose J', 7.5), ('Francisco', 8.5), ('Hernan', 8.5), ('Mario', 9.0), ('Jorge A.', 7.5), ('Carlos', 8.5), ('Giusse', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_1_1_18 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 18, 'The Killers', 'space man' FROM set_1_1
  RETURNING id
)
, votes_1_1_18 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_1_18.id, v.voter_name, v.score
  FROM song_1_1_18,
  (VALUES ('Jose J', 8.0), ('Francisco', 8.5), ('Hernan', 8.0), ('Mario', 9.0), ('Jorge A.', 7.0), ('Carlos', 9.0), ('Giusse', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_1_19 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 19, 'The Verve y coldplay', 'Bitter sweet symphony' FROM set_1_1
  RETURNING id
)
, votes_1_1_19 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_1_19.id, v.voter_name, v.score
  FROM song_1_1_19,
  (VALUES ('Jose J', 9.0), ('Francisco', 9.0), ('Hernan', 7.5), ('Mario', 8.5), ('Jorge A.', 8.0), ('Carlos', 8.0), ('Giusse', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, set_1_2 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 2, 'Set Francisco' FROM s1
  RETURNING id
)
, song_1_2_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'AC/DC', 'Highway to Hell' FROM set_1_2
  RETURNING id
)
, votes_1_2_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_2_0.id, v.voter_name, v.score
  FROM song_1_2_0,
  (VALUES ('Jose J', 7.5), ('Daniel', 7.0), ('Jorge A.', 7.0), ('Carlos', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_2_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'Amy Winehouse', 'Rehab' FROM set_1_2
  RETURNING id
)
, votes_1_2_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_2_1.id, v.voter_name, v.score
  FROM song_1_2_1,
  (VALUES ('Jose J', 7.0), ('Daniel', 7.0), ('Jorge A.', 7.0), ('Carlos', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_2_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'Billy Idol', 'Dancing with myself' FROM set_1_2
  RETURNING id
)
, votes_1_2_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_2_2.id, v.voter_name, v.score
  FROM song_1_2_2,
  (VALUES ('Jose J', 7.5), ('Daniel', 9.0), ('Jorge A.', 8.0), ('Carlos', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_2_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Blink 182', 'All the small things' FROM set_1_2
  RETURNING id
)
, votes_1_2_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_2_3.id, v.voter_name, v.score
  FROM song_1_2_3,
  (VALUES ('Jose J', 8.0), ('Daniel', 7.0), ('Jorge A.', 9.0), ('Carlos', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_2_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'Depeche Mode', 'Enjoy the silence' FROM set_1_2
  RETURNING id
)
, votes_1_2_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_2_4.id, v.voter_name, v.score
  FROM song_1_2_4,
  (VALUES ('Jose J', 8.5), ('Daniel', 8.0), ('Jorge A.', 10.0), ('Carlos', 10.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_2_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'Erasure', 'A little respect' FROM set_1_2
  RETURNING id
)
, votes_1_2_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_2_5.id, v.voter_name, v.score
  FROM song_1_2_5,
  (VALUES ('Jose J', 9.0), ('Daniel', 9.0), ('Jorge A.', 9.0), ('Carlos', 10.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_2_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'Green Day', 'American Idiot' FROM set_1_2
  RETURNING id
)
, votes_1_2_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_2_6.id, v.voter_name, v.score
  FROM song_1_2_6,
  (VALUES ('Jose J', 8.0), ('Daniel', 8.0), ('Jorge A.', 7.0), ('Carlos', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_2_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'Guns N'' Roses', 'Sweet child of mine' FROM set_1_2
  RETURNING id
)
, votes_1_2_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_2_7.id, v.voter_name, v.score
  FROM song_1_2_7,
  (VALUES ('Jose J', 9.5), ('Daniel', 7.0), ('Jorge A.', 9.0), ('Carlos', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_2_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'Limp Bizkit', 'Faith' FROM set_1_2
  RETURNING id
)
, votes_1_2_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_2_8.id, v.voter_name, v.score
  FROM song_1_2_8,
  (VALUES ('Jose J', 6.5), ('Daniel', 5.0), ('Jorge A.', 8.0), ('Carlos', 4.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_2_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'Martin Solveig', 'Hello' FROM set_1_2
  RETURNING id
)
, votes_1_2_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_2_9.id, v.voter_name, v.score
  FROM song_1_2_9,
  (VALUES ('Jose J', 6.5), ('Daniel', 5.0), ('Jorge A.', 5.0), ('Carlos', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_2_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'Oasis', 'Wonderwall' FROM set_1_2
  RETURNING id
)
, votes_1_2_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_2_10.id, v.voter_name, v.score
  FROM song_1_2_10,
  (VALUES ('Jose J', 8.0), ('Daniel', 7.0), ('Jorge A.', 8.0), ('Carlos', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_2_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'R.E.M', 'It''s the end of the world as we know it' FROM set_1_2
  RETURNING id
)
, votes_1_2_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_2_11.id, v.voter_name, v.score
  FROM song_1_2_11,
  (VALUES ('Jose J', 7.0), ('Daniel', 7.0), ('Jorge A.', 6.0), ('Carlos', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_2_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'Red hot chili peppers', 'Californication' FROM set_1_2
  RETURNING id
)
, votes_1_2_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_2_12.id, v.voter_name, v.score
  FROM song_1_2_12,
  (VALUES ('Jose J', 7.0), ('Daniel', 8.0), ('Jorge A.', 9.0), ('Carlos', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_2_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'Sublime', 'Santeria' FROM set_1_2
  RETURNING id
)
, votes_1_2_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_2_13.id, v.voter_name, v.score
  FROM song_1_2_13,
  (VALUES ('Jose J', 6.0), ('Daniel', 6.0), ('Jorge A.', 7.0), ('Carlos', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_2_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'The Beach Boys', 'Surfing USA' FROM set_1_2
  RETURNING id
)
, votes_1_2_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_2_14.id, v.voter_name, v.score
  FROM song_1_2_14,
  (VALUES ('Jose J', 7.0), ('Daniel', 7.0), ('Jorge A.', 7.0), ('Carlos', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_2_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'The Beatles', 'Revolution' FROM set_1_2
  RETURNING id
)
, votes_1_2_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_2_15.id, v.voter_name, v.score
  FROM song_1_2_15,
  (VALUES ('Jose J', 5.0), ('Daniel', 5.0), ('Jorge A.', 7.0), ('Carlos', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_2_16 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 16, 'The Clash', 'Should I stay or go now' FROM set_1_2
  RETURNING id
)
, votes_1_2_16 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_2_16.id, v.voter_name, v.score
  FROM song_1_2_16,
  (VALUES ('Jose J', 7.5), ('Daniel', 8.0), ('Jorge A.', 8.0), ('Carlos', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_2_17 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 17, 'The Cure', 'Friday I''m in love' FROM set_1_2
  RETURNING id
)
, votes_1_2_17 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_2_17.id, v.voter_name, v.score
  FROM song_1_2_17,
  (VALUES ('Jose J', 8.0), ('Daniel', 8.0), ('Jorge A.', 8.0), ('Carlos', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_2_18 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 18, 'The Rolling Stones', 'Start me Up' FROM set_1_2
  RETURNING id
)
, votes_1_2_18 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_2_18.id, v.voter_name, v.score
  FROM song_1_2_18,
  (VALUES ('Jose J', 8.0), ('Daniel', 9.0), ('Jorge A.', 8.0), ('Carlos', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_2_19 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 19, 'U2', 'Beautiful Day' FROM set_1_2
  RETURNING id
)
, votes_1_2_19 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_2_19.id, v.voter_name, v.score
  FROM song_1_2_19,
  (VALUES ('Jose J', 8.0), ('Daniel', 8.0), ('Jorge A.', 8.0), ('Carlos', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, set_1_3 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 3, 'Set Freddy' FROM s1
  RETURNING id
)
, song_1_3_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'Eric Carmen', 'All by myself.' FROM set_1_3
  RETURNING id
)
, votes_1_3_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_3_0.id, v.voter_name, v.score
  FROM song_1_3_0,
  (VALUES ('Mario', 8.5), ('Carlos', 9.0), ('Giusse', 7.0), ('Mauricio O.', 9.0), ('Mauricio R.', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_3_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'Bee gees', 'i started a joke' FROM set_1_3
  RETURNING id
)
, votes_1_3_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_3_1.id, v.voter_name, v.score
  FROM song_1_3_1,
  (VALUES ('Mario', 7.0), ('Daniel', 7.5), ('Carlos', 8.5), ('Giusse', 8.5), ('Mauricio O.', 6.5), ('Mauricio R.', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_1_3_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'Bob Seager(detroit rock hitters)', 'main street' FROM set_1_3
  RETURNING id
)
, votes_1_3_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_3_2.id, v.voter_name, v.score
  FROM song_1_3_2,
  (VALUES ('Mario', 8.0), ('Daniel', 6.0), ('Carlos', 7.0), ('Giusse', 5.0), ('Mauricio O.', 6.0), ('Mauricio R.', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_1_3_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Cat Stevens', 'father and son' FROM set_1_3
  RETURNING id
)
, votes_1_3_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_3_3.id, v.voter_name, v.score
  FROM song_1_3_3,
  (VALUES ('Mario', 7.5), ('Daniel', 7.5), ('Carlos', 6.5), ('Giusse', 9.0), ('Mauricio O.', 7.0), ('Mauricio R.', 10.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_3_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'Coldplay', 'a sky full of stars' FROM set_1_3
  RETURNING id
)
, votes_1_3_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_3_4.id, v.voter_name, v.score
  FROM song_1_3_4,
  (VALUES ('Mario', 8.0), ('Carlos', 7.5), ('Giusse', 8.0), ('Mauricio O.', 8.5), ('Mauricio R.', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_3_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'David Bowie', 'modern love' FROM set_1_3
  RETURNING id
)
, votes_1_3_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_3_5.id, v.voter_name, v.score
  FROM song_1_3_5,
  (VALUES ('Mario', 9.0), ('Carlos', 9.0), ('Giusse', 8.5), ('Mauricio O.', 9.5), ('Mauricio R.', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_3_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'David guetta + Sia', 'titanium' FROM set_1_3
  RETURNING id
)
, votes_1_3_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_3_6.id, v.voter_name, v.score
  FROM song_1_3_6,
  (VALUES ('Mario', 8.0), ('Carlos', 6.5), ('Giusse', 7.0), ('Mauricio O.', 6.5), ('Mauricio R.', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_3_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'ELO', 'Livin thingl' FROM set_1_3
  RETURNING id
)
, votes_1_3_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_3_7.id, v.voter_name, v.score
  FROM song_1_3_7,
  (VALUES ('Mario', 8.0), ('Daniel', 7.5), ('Carlos', 9.0), ('Giusse', 8.5), ('Mauricio O.', 6.5), ('Mauricio R.', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_3_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'Elton Jhon', 'Don´t go breaking my heart' FROM set_1_3
  RETURNING id
)
, votes_1_3_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_3_8.id, v.voter_name, v.score
  FROM song_1_3_8,
  (VALUES ('Mario', 7.0), ('Daniel', 9.0), ('Carlos', 6.0), ('Giusse', 7.0), ('Mauricio O.', 6.0), ('Mauricio R.', 5.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_3_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'Esther philips', 'What a difference a day makes' FROM set_1_3
  RETURNING id
)
, votes_1_3_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_3_9.id, v.voter_name, v.score
  FROM song_1_3_9,
  (VALUES ('Mario', 6.0), ('Daniel', 7.0), ('Carlos', 6.5), ('Giusse', 7.0), ('Mauricio O.', 7.0), ('Mauricio R.', 3.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_3_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'George Benson', 'this masquerade' FROM set_1_3
  RETURNING id
)
, votes_1_3_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_3_10.id, v.voter_name, v.score
  FROM song_1_3_10,
  (VALUES ('Mario', 8.0), ('Carlos', 5.0), ('Giusse', 8.0), ('Mauricio O.', 5.5), ('Mauricio R.', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_3_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'Gypsy Kings', 'volare (NEL BLU DI PINTO)' FROM set_1_3
  RETURNING id
)
, votes_1_3_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_3_11.id, v.voter_name, v.score
  FROM song_1_3_11,
  (VALUES ('Mario', 6.0), ('Daniel', 9.0), ('Carlos', 5.0), ('Giusse', 5.0), ('Mauricio O.', 6.0), ('Mauricio R.', 3.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_3_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'Lou Rals', 'you´ll never find another love like mine' FROM set_1_3
  RETURNING id
)
, votes_1_3_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_3_12.id, v.voter_name, v.score
  FROM song_1_3_12,
  (VALUES ('Mario', 9.0), ('Daniel', 8.5), ('Carlos', 8.5), ('Giusse', 9.5), ('Mauricio O.', 7.0), ('Mauricio R.', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_3_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'Neil Diamond', 'girl,you´ll be a woman soon' FROM set_1_3
  RETURNING id
)
, votes_1_3_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_3_13.id, v.voter_name, v.score
  FROM song_1_3_13,
  (VALUES ('Mario', 8.5), ('Daniel', 8.0), ('Carlos', 8.0), ('Giusse', 8.0), ('Mauricio O.', 9.0), ('Mauricio R.', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_3_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'Phil Collins', 'two hearts' FROM set_1_3
  RETURNING id
)
, votes_1_3_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_3_14.id, v.voter_name, v.score
  FROM song_1_3_14,
  (VALUES ('Mario', 6.0), ('Daniel', 7.5), ('Carlos', 7.0), ('Giusse', 6.5), ('Mauricio O.', 7.0), ('Mauricio R.', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_3_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'Rick Astley', 'never going to give you up' FROM set_1_3
  RETURNING id
)
, votes_1_3_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_3_15.id, v.voter_name, v.score
  FROM song_1_3_15,
  (VALUES ('Mario', 6.5), ('Daniel', 7.5), ('Carlos', 7.0), ('Giusse', 7.5), ('Mauricio O.', 6.0), ('Mauricio R.', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_1_3_16 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 16, 'Roy Orbinson', 'you got it' FROM set_1_3
  RETURNING id
)
, votes_1_3_16 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_3_16.id, v.voter_name, v.score
  FROM song_1_3_16,
  (VALUES ('Mario', 9.0), ('Daniel', 8.5), ('Carlos', 8.5), ('Giusse', 8.5), ('Mauricio O.', 9.0), ('Mauricio R.', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_1_3_17 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 17, 'Simple Red', 'stars' FROM set_1_3
  RETURNING id
)
, votes_1_3_17 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_3_17.id, v.voter_name, v.score
  FROM song_1_3_17,
  (VALUES ('Mario', 7.0), ('Daniel', 6.0), ('Carlos', 7.5), ('Giusse', 7.5), ('Mauricio O.', 8.5), ('Mauricio R.', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_3_18 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 18, 'The Doors', 'Light my fire' FROM set_1_3
  RETURNING id
)
, votes_1_3_18 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_3_18.id, v.voter_name, v.score
  FROM song_1_3_18,
  (VALUES ('Mario', 9.0), ('Daniel', 8.5), ('Carlos', 9.0), ('Giusse', 9.5), ('Mauricio O.', 8.0), ('Mauricio R.', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_3_19 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 19, 'Van Mccoy', 'the hustle' FROM set_1_3
  RETURNING id
)
, votes_1_3_19 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_3_19.id, v.voter_name, v.score
  FROM song_1_3_19,
  (VALUES ('Mario', 6.0), ('Daniel', 6.5), ('Carlos', 7.0), ('Giusse', 7.0), ('Mauricio O.', 5.0), ('Mauricio R.', 4.0)) AS v(voter_name, score)
  RETURNING id
)
, set_1_4 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 4, 'Set Gino' FROM s1
  RETURNING id
)
, song_1_4_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'Alabama Shakes', 'Hold On' FROM set_1_4
  RETURNING id
)
, votes_1_4_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_4_0.id, v.voter_name, v.score
  FROM song_1_4_0,
  (VALUES ('Mario', 8.0), ('Jorge A.', 7.0), ('Carlos', 9.0), ('Mauricio O.', 7.5), ('Mauricio R.', 8.5), ('Lucho', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_4_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'Alarma !!!', 'Preparado para el rock and roll' FROM set_1_4
  RETURNING id
)
, votes_1_4_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_4_1.id, v.voter_name, v.score
  FROM song_1_4_1,
  (VALUES ('Mario', 7.0), ('Jorge A.', 7.0), ('Carlos', 7.0), ('Mauricio O.', 8.0), ('Mauricio R.', 7.5), ('Lucho', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_4_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'Basement Jaxx', 'Rendez Vu' FROM set_1_4
  RETURNING id
)
, votes_1_4_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_4_2.id, v.voter_name, v.score
  FROM song_1_4_2,
  (VALUES ('Mario', 7.0), ('Jorge A.', 7.5), ('Carlos', 7.0), ('Mauricio O.', 8.5), ('Mauricio R.', 7.0), ('Lucho', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_1_4_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Berlin Express', 'Die Russien Comen' FROM set_1_4
  RETURNING id
)
, votes_1_4_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_4_3.id, v.voter_name, v.score
  FROM song_1_4_3,
  (VALUES ('Mario', 6.0), ('Jorge A.', 6.0), ('Carlos', 6.0), ('Mauricio O.', 7.0), ('Mauricio R.', 7.5), ('Lucho', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_4_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'Colder', 'To the music' FROM set_1_4
  RETURNING id
)
, votes_1_4_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_4_4.id, v.voter_name, v.score
  FROM song_1_4_4,
  (VALUES ('Mario', 7.5), ('Jorge A.', 7.5), ('Carlos', 8.0), ('Mauricio O.', 7.0), ('Mauricio R.', 8.5), ('Lucho', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_4_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'Fischer Z', 'So Long' FROM set_1_4
  RETURNING id
)
, votes_1_4_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_4_5.id, v.voter_name, v.score
  FROM song_1_4_5,
  (VALUES ('Mario', 7.5), ('Jorge A.', 6.5), ('Carlos', 8.5), ('Mauricio O.', 6.5), ('Mauricio R.', 7.5), ('Lucho', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_4_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'Grouplove', 'Tongue Tied' FROM set_1_4
  RETURNING id
)
, votes_1_4_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_4_6.id, v.voter_name, v.score
  FROM song_1_4_6,
  (VALUES ('Mario', 8.5), ('Jorge A.', 8.0), ('Carlos', 9.0), ('Mauricio O.', 9.0), ('Mauricio R.', 9.0), ('Lucho', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_1_4_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'Iggy Pop', 'Sunday' FROM set_1_4
  RETURNING id
)
, votes_1_4_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_4_7.id, v.voter_name, v.score
  FROM song_1_4_7,
  (VALUES ('Mario', 8.5), ('Jorge A.', 7.5), ('Carlos', 8.0), ('Mauricio O.', 8.0), ('Mauricio R.', 7.5), ('Lucho', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_1_4_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'OMD', 'Forever Live and Die' FROM set_1_4
  RETURNING id
)
, votes_1_4_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_4_8.id, v.voter_name, v.score
  FROM song_1_4_8,
  (VALUES ('Mario', 9.0), ('Jorge A.', 7.0), ('Carlos', 9.0), ('Mauricio O.', 7.0), ('Mauricio R.', 8.5), ('Lucho', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_4_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'Parquet Courts', 'Stone and Starving' FROM set_1_4
  RETURNING id
)
, votes_1_4_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_4_9.id, v.voter_name, v.score
  FROM song_1_4_9,
  (VALUES ('Mario', 8.5), ('Jorge A.', 7.0), ('Carlos', 8.0), ('Mauricio O.', 7.5), ('Mauricio R.', 8.5), ('Lucho', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_1_4_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'Romeo Void', 'Never Say Never' FROM set_1_4
  RETURNING id
)
, votes_1_4_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_4_10.id, v.voter_name, v.score
  FROM song_1_4_10,
  (VALUES ('Mario', 7.0), ('Jorge A.', 6.0), ('Carlos', 8.0), ('Mauricio O.', 8.0), ('Mauricio R.', 6.0), ('Lucho', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_1_4_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'She Wants Revenge', 'Tear you apart' FROM set_1_4
  RETURNING id
)
, votes_1_4_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_4_11.id, v.voter_name, v.score
  FROM song_1_4_11,
  (VALUES ('Mario', 8.0), ('Jorge A.', 7.5), ('Carlos', 8.5), ('Mauricio O.', 8.5), ('Mauricio R.', 8.0), ('Lucho', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_4_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'Tanlines', 'Slipping Away' FROM set_1_4
  RETURNING id
)
, votes_1_4_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_4_12.id, v.voter_name, v.score
  FROM song_1_4_12,
  (VALUES ('Mario', 9.0), ('Jorge A.', 7.5), ('Carlos', 9.0), ('Mauricio O.', 7.0), ('Mauricio R.', 7.5), ('Lucho', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_4_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'The B52s', '52 Girls' FROM set_1_4
  RETURNING id
)
, votes_1_4_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_4_13.id, v.voter_name, v.score
  FROM song_1_4_13,
  (VALUES ('Mario', 7.0), ('Jorge A.', 7.0), ('Carlos', 6.5), ('Mauricio O.', 7.0), ('Mauricio R.', 6.5), ('Lucho', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_4_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'The Smiths', 'This Charming Man' FROM set_1_4
  RETURNING id
)
, votes_1_4_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_4_14.id, v.voter_name, v.score
  FROM song_1_4_14,
  (VALUES ('Mario', 7.5), ('Jorge A.', 7.5), ('Carlos', 7.5), ('Mauricio O.', 7.0), ('Mauricio R.', 7.0), ('Lucho', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_4_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'The Strokes', 'Heart in a cage' FROM set_1_4
  RETURNING id
)
, votes_1_4_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_4_15.id, v.voter_name, v.score
  FROM song_1_4_15,
  (VALUES ('Mario', 9.0), ('Jorge A.', 7.5), ('Carlos', 9.0), ('Mauricio O.', 7.5), ('Mauricio R.', 9.0), ('Lucho', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_1_4_16 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 16, 'The Talking Heads', 'This Must Be The Place' FROM set_1_4
  RETURNING id
)
, votes_1_4_16 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_4_16.id, v.voter_name, v.score
  FROM song_1_4_16,
  (VALUES ('Mario', 7.5), ('Jorge A.', 6.5), ('Carlos', 6.5), ('Mauricio O.', 7.0), ('Mauricio R.', 6.0), ('Lucho', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_1_4_17 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 17, 'The Waterboys', 'The Whole Of The Moon' FROM set_1_4
  RETURNING id
)
, votes_1_4_17 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_4_17.id, v.voter_name, v.score
  FROM song_1_4_17,
  (VALUES ('Mario', 8.5), ('Jorge A.', 7.0), ('Carlos', 7.0), ('Mauricio O.', 7.0), ('Mauricio R.', 7.5), ('Lucho', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_1_4_18 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 18, 'Thompson Twins', 'Roll Over' FROM set_1_4
  RETURNING id
)
, votes_1_4_18 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_4_18.id, v.voter_name, v.score
  FROM song_1_4_18,
  (VALUES ('Mario', 8.5), ('Jorge A.', 7.0), ('Carlos', 6.5), ('Mauricio O.', 6.0), ('Mauricio R.', 8.0), ('Lucho', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_1_4_19 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 19, 'XTC', 'The Ballad of Peter Pumpkinhead' FROM set_1_4
  RETURNING id
)
, votes_1_4_19 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_4_19.id, v.voter_name, v.score
  FROM song_1_4_19,
  (VALUES ('Mario', 7.0), ('Jorge A.', 7.0), ('Carlos', 7.5), ('Mauricio O.', 9.0), ('Mauricio R.', 8.0), ('Lucho', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, set_1_5 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 5, 'Set Giuse' FROM s1
  RETURNING id
)
, song_1_5_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'Barry White', 'Just the way you are' FROM set_1_5
  RETURNING id
)
, votes_1_5_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_5_0.id, v.voter_name, v.score
  FROM song_1_5_0,
  (VALUES ('Jose J', 7.0), ('Hernan', 8.5), ('Mario', 8.0), ('Daniel', 8.0), ('Jorge A.', 7.0), ('Carlos', 9.0), ('Freddy', 10.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_5_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'Barry White', 'Forever in love' FROM set_1_5
  RETURNING id
)
, votes_1_5_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_5_1.id, v.voter_name, v.score
  FROM song_1_5_1,
  (VALUES ('Jose J', 7.0), ('Hernan', 8.0), ('Mario', 8.0), ('Jorge A.', 7.0), ('Carlos', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_1_5_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'Caetano Veloso', 'Cucurrucucu paloma' FROM set_1_5
  RETURNING id
)
, votes_1_5_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_5_2.id, v.voter_name, v.score
  FROM song_1_5_2,
  (VALUES ('Jose J', 4.5), ('Hernan', 7.0), ('Mario', 9.5), ('Daniel', 5.0), ('Jorge A.', 5.5), ('Carlos', 6.0), ('Freddy', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_5_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Coldplay', 'Fix you' FROM set_1_5
  RETURNING id
)
, votes_1_5_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_5_3.id, v.voter_name, v.score
  FROM song_1_5_3,
  (VALUES ('Jose J', 8.5), ('Hernan', 8.0), ('Mario', 8.5), ('Daniel', 8.0), ('Jorge A.', 7.5), ('Carlos', 8.0), ('Freddy', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_5_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'Erasure', 'Blue Savannah' FROM set_1_5
  RETURNING id
)
, votes_1_5_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_5_4.id, v.voter_name, v.score
  FROM song_1_5_4,
  (VALUES ('Jose J', 7.5), ('Hernan', 8.5), ('Mario', 7.5), ('Daniel', 9.0), ('Jorge A.', 8.5), ('Carlos', 9.0), ('Freddy', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_5_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'Eric Clapton', 'My father''s eyes' FROM set_1_5
  RETURNING id
)
, votes_1_5_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_5_5.id, v.voter_name, v.score
  FROM song_1_5_5,
  (VALUES ('Jose J', 6.0), ('Hernan', 6.5), ('Mario', 9.0), ('Daniel', 8.0), ('Jorge A.', 7.0), ('Carlos', 7.5), ('Freddy', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_5_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'Genesis', 'It''s gonna get better' FROM set_1_5
  RETURNING id
)
, votes_1_5_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_5_6.id, v.voter_name, v.score
  FROM song_1_5_6,
  (VALUES ('Jose J', 7.0), ('Hernan', 8.0), ('Mario', 7.0), ('Daniel', 7.5), ('Jorge A.', 8.0), ('Carlos', 7.0), ('Freddy', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_5_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'Gypsy Kings', 'Inspiration' FROM set_1_5
  RETURNING id
)
, votes_1_5_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_5_7.id, v.voter_name, v.score
  FROM song_1_5_7,
  (VALUES ('Jose J', 7.5), ('Hernan', 8.0), ('Mario', 8.5), ('Daniel', 7.5), ('Jorge A.', 9.0), ('Carlos', 8.0), ('Freddy', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_5_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'Jean Luc Ponty', 'Watching Birds' FROM set_1_5
  RETURNING id
)
, votes_1_5_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_5_8.id, v.voter_name, v.score
  FROM song_1_5_8,
  (VALUES ('Jose J', 3.0), ('Hernan', 7.0), ('Mario', 5.0), ('Daniel', 5.0), ('Jorge A.', 5.0), ('Carlos', 4.0), ('Freddy', 4.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_5_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'Pat Metheny Grou', 'The first circle' FROM set_1_5
  RETURNING id
)
, votes_1_5_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_5_9.id, v.voter_name, v.score
  FROM song_1_5_9,
  (VALUES ('Jose J', 6.0), ('Mario', 7.0), ('Daniel', 6.0), ('Jorge A.', 6.5), ('Carlos', 5.0), ('Freddy', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_5_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'Rush', 'The Spirit of the Radio' FROM set_1_5
  RETURNING id
)
, votes_1_5_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_5_10.id, v.voter_name, v.score
  FROM song_1_5_10,
  (VALUES ('Jose J', 8.5), ('Hernan', 7.5), ('Mario', 6.0), ('Jorge A.', 6.5), ('Carlos', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_5_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'Simpleminds', 'Alive and kicking' FROM set_1_5
  RETURNING id
)
, votes_1_5_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_5_11.id, v.voter_name, v.score
  FROM song_1_5_11,
  (VALUES ('Jose J', 8.5), ('Hernan', 9.0), ('Mario', 8.0), ('Daniel', 7.5), ('Jorge A.', 7.5), ('Carlos', 8.5), ('Freddy', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_5_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'Steely Dan', 'Time out of mind' FROM set_1_5
  RETURNING id
)
, votes_1_5_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_5_12.id, v.voter_name, v.score
  FROM song_1_5_12,
  (VALUES ('Jose J', 6.5), ('Hernan', 6.0), ('Mario', 7.0), ('Jorge A.', 6.5), ('Carlos', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_5_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'Sting', 'It''s probably me' FROM set_1_5
  RETURNING id
)
, votes_1_5_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_5_13.id, v.voter_name, v.score
  FROM song_1_5_13,
  (VALUES ('Jose J', 7.5), ('Hernan', 9.0), ('Mario', 9.0), ('Daniel', 8.0), ('Jorge A.', 7.5), ('Carlos', 7.0), ('Freddy', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_5_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'Supertramp', 'C''est le bon' FROM set_1_5
  RETURNING id
)
, votes_1_5_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_5_14.id, v.voter_name, v.score
  FROM song_1_5_14,
  (VALUES ('Jose J', 7.5), ('Hernan', 7.5), ('Mario', 9.0), ('Daniel', 7.0), ('Jorge A.', 7.0), ('Carlos', 7.0), ('Freddy', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_5_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'Supertramp', 'Take the long way home' FROM set_1_5
  RETURNING id
)
, votes_1_5_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_5_15.id, v.voter_name, v.score
  FROM song_1_5_15,
  (VALUES ('Jose J', 7.5), ('Hernan', 7.5), ('Mario', 6.0), ('Daniel', 8.0), ('Jorge A.', 6.5), ('Carlos', 7.5), ('Freddy', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_5_16 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 16, 'The Clash', 'Train in Vain' FROM set_1_5
  RETURNING id
)
, votes_1_5_16 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_5_16.id, v.voter_name, v.score
  FROM song_1_5_16,
  (VALUES ('Jose J', 6.0), ('Hernan', 6.0), ('Mario', 6.0), ('Daniel', 6.5), ('Jorge A.', 6.5), ('Carlos', 8.0), ('Freddy', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_5_17 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 17, 'U2', 'Stay (Faraway, So close!)' FROM set_1_5
  RETURNING id
)
, votes_1_5_17 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_5_17.id, v.voter_name, v.score
  FROM song_1_5_17,
  (VALUES ('Jose J', 8.5), ('Hernan', 9.0), ('Mario', 9.0), ('Daniel', 8.5), ('Jorge A.', 8.0), ('Carlos', 7.5), ('Freddy', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_1_5_18 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 18, 'U2', 'Crumbs from your table' FROM set_1_5
  RETURNING id
)
, votes_1_5_18 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_5_18.id, v.voter_name, v.score
  FROM song_1_5_18,
  (VALUES ('Jose J', 8.5), ('Hernan', 8.0), ('Mario', 8.0), ('Jorge A.', 7.0), ('Carlos', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_5_19 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 19, 'Yes', 'Love will find a way' FROM set_1_5
  RETURNING id
)
, votes_1_5_19 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_5_19.id, v.voter_name, v.score
  FROM song_1_5_19,
  (VALUES ('Jose J', 7.0), ('Hernan', 7.0), ('Mario', 7.5), ('Daniel', 7.5), ('Jorge A.', 8.0), ('Carlos', 8.5), ('Freddy', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, set_1_6 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 6, 'Set Hernan' FROM s1
  RETURNING id
)
, song_1_6_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'Alphaville', 'The jet set' FROM set_1_6
  RETURNING id
)
, votes_1_6_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_6_0.id, v.voter_name, v.score
  FROM song_1_6_0,
  (VALUES ('Jose J', 8.0), ('Mario', 7.0), ('Daniel', 7.0), ('Jorge A.', 7.0), ('Carlos', 8.0), ('Giusse', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_6_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'Barry White', 'Love''s Theme' FROM set_1_6
  RETURNING id
)
, votes_1_6_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_6_1.id, v.voter_name, v.score
  FROM song_1_6_1,
  (VALUES ('Mario', 7.0), ('Daniel', 6.5), ('Jorge A.', 8.0), ('Carlos', 8.0), ('Giusse', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_1_6_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'Bebu Silveti', 'Lluvia de Primavera' FROM set_1_6
  RETURNING id
)
, votes_1_6_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_6_2.id, v.voter_name, v.score
  FROM song_1_6_2,
  (VALUES ('Jose J', 7.5), ('Daniel', 6.0), ('Jorge A.', 6.0), ('Carlos', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_6_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Blue October', 'Schizophrenia' FROM set_1_6
  RETURNING id
)
, votes_1_6_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_6_3.id, v.voter_name, v.score
  FROM song_1_6_3,
  (VALUES ('Jose J', 8.5), ('Mario', 8.0), ('Daniel', 7.0), ('Jorge A.', 7.0), ('Carlos', 7.5), ('Giusse', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_6_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'BURT BACHARACH / HAL DAVIS / BJ THOMAS', 'Rain drops keep falling on my head' FROM set_1_6
  RETURNING id
)
, votes_1_6_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_6_4.id, v.voter_name, v.score
  FROM song_1_6_4,
  (VALUES ('Jose J', 8.0), ('Mario', 8.5), ('Daniel', 8.0), ('Jorge A.', 8.5), ('Carlos', 8.0), ('Giusse', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_6_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'David Gilmour', 'Murder' FROM set_1_6
  RETURNING id
)
, votes_1_6_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_6_5.id, v.voter_name, v.score
  FROM song_1_6_5,
  (VALUES ('Jose J', 7.0), ('Mario', 8.0), ('Daniel', 7.0), ('Jorge A.', 6.0), ('Carlos', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_6_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'Depeche Mode', 'Fragile Tension' FROM set_1_6
  RETURNING id
)
, votes_1_6_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_6_6.id, v.voter_name, v.score
  FROM song_1_6_6,
  (VALUES ('Jose J', 6.5), ('Daniel', 7.0), ('Jorge A.', 7.0), ('Carlos', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_6_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'Faithless', 'No roots' FROM set_1_6
  RETURNING id
)
, votes_1_6_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_6_7.id, v.voter_name, v.score
  FROM song_1_6_7,
  (VALUES ('Jose J', 7.5), ('Daniel', 7.0), ('Jorge A.', 7.0), ('Carlos', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_1_6_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'Genesis', 'ABACAB' FROM set_1_6
  RETURNING id
)
, votes_1_6_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_6_8.id, v.voter_name, v.score
  FROM song_1_6_8,
  (VALUES ('Jose J', 6.0), ('Daniel', 7.0), ('Jorge A.', 6.5), ('Carlos', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_6_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'Jamiroquai', 'Virtual Insanity' FROM set_1_6
  RETURNING id
)
, votes_1_6_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_6_9.id, v.voter_name, v.score
  FROM song_1_6_9,
  (VALUES ('Jose J', 2.0), ('Mario', 7.0), ('Daniel', 7.0), ('Jorge A.', 8.5), ('Carlos', 8.0), ('Giusse', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_6_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'Joe Satriani', 'Surfing with the aliens' FROM set_1_6
  RETURNING id
)
, votes_1_6_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_6_10.id, v.voter_name, v.score
  FROM song_1_6_10,
  (VALUES ('Jose J', 7.0), ('Mario', 6.0), ('Daniel', 6.5), ('Jorge A.', 7.0), ('Carlos', 6.0), ('Giusse', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_6_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'Marillion', 'Forgoten Sons' FROM set_1_6
  RETURNING id
)
, votes_1_6_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_6_11.id, v.voter_name, v.score
  FROM song_1_6_11,
  (VALUES ('Jose J', 7.5), ('Mario', 7.0), ('Daniel', 5.5), ('Jorge A.', 6.5), ('Carlos', 7.0), ('Giusse', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_6_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'Massive Attack', 'Safe from Harm' FROM set_1_6
  RETURNING id
)
, votes_1_6_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_6_12.id, v.voter_name, v.score
  FROM song_1_6_12,
  (VALUES ('Jose J', 6.5), ('Daniel', 5.5), ('Jorge A.', 6.0), ('Carlos', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_6_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'Mike Oldfield', 'The source of secrets' FROM set_1_6
  RETURNING id
)
, votes_1_6_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_6_13.id, v.voter_name, v.score
  FROM song_1_6_13,
  (VALUES ('Jose J', 8.0), ('Mario', 9.0), ('Daniel', 7.5), ('Jorge A.', 8.0), ('Carlos', 6.0), ('Giusse', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_6_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'Moby', 'One of these mornings' FROM set_1_6
  RETURNING id
)
, votes_1_6_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_6_14.id, v.voter_name, v.score
  FROM song_1_6_14,
  (VALUES ('Jose J', 7.5), ('Mario', 7.0), ('Daniel', 6.0), ('Jorge A.', 6.5), ('Carlos', 6.5), ('Giusse', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_1_6_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'OMD', 'Light of speed' FROM set_1_6
  RETURNING id
)
, votes_1_6_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_6_15.id, v.voter_name, v.score
  FROM song_1_6_15,
  (VALUES ('Jose J', 7.0), ('Mario', 7.0), ('Daniel', 6.5), ('Jorge A.', 7.0), ('Carlos', 8.0), ('Giusse', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_1_6_16 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 16, 'Pínk floyd', 'Hey you' FROM set_1_6
  RETURNING id
)
, votes_1_6_16 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_6_16.id, v.voter_name, v.score
  FROM song_1_6_16,
  (VALUES ('Jose J', 9.5), ('Daniel', 7.5), ('Jorge A.', 7.0), ('Carlos', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_6_17 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 17, 'Queen', 'The Show must go on' FROM set_1_6
  RETURNING id
)
, votes_1_6_17 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_6_17.id, v.voter_name, v.score
  FROM song_1_6_17,
  (VALUES ('Jose J', 9.0), ('Mario', 9.0), ('Daniel', 8.5), ('Jorge A.', 7.5), ('Carlos', 9.0), ('Giusse', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_6_18 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 18, 'Schiller', 'I feel you' FROM set_1_6
  RETURNING id
)
, votes_1_6_18 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_6_18.id, v.voter_name, v.score
  FROM song_1_6_18,
  (VALUES ('Jose J', 8.5), ('Mario', 9.0), ('Daniel', 7.5), ('Jorge A.', 7.5), ('Carlos', 8.5), ('Giusse', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_1_6_19 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 19, 'Snow Patrol', 'You are all I have' FROM set_1_6
  RETURNING id
)
, votes_1_6_19 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_6_19.id, v.voter_name, v.score
  FROM song_1_6_19,
  (VALUES ('Jose J', 7.5), ('Mario', 6.0), ('Daniel', 7.5), ('Jorge A.', 7.5), ('Carlos', 6.0), ('Giusse', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, set_1_7 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 7, 'Set Jorge' FROM s1
  RETURNING id
)
, song_1_7_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'Aerosmith', 'Jaded' FROM set_1_7
  RETURNING id
)
, votes_1_7_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_7_0.id, v.voter_name, v.score
  FROM song_1_7_0,
  (VALUES ('Jose J', 7.0), ('Francisco', 7.0), ('Hernan', 7.0), ('Mario', 8.0), ('Daniel', 8.0), ('Carlos', 7.0), ('Giusse', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_7_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'Al Stewart', 'Year of the cat' FROM set_1_7
  RETURNING id
)
, votes_1_7_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_7_1.id, v.voter_name, v.score
  FROM song_1_7_1,
  (VALUES ('Jose J', 7.0), ('Francisco', 8.0), ('Hernan', 9.0), ('Mario', 9.0), ('Daniel', 7.0), ('Carlos', 10.0), ('Giusse', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_7_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'Creed', 'One last Breath' FROM set_1_7
  RETURNING id
)
, votes_1_7_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_7_2.id, v.voter_name, v.score
  FROM song_1_7_2,
  (VALUES ('Jose J', 7.0), ('Francisco', 8.0), ('Hernan', 7.0), ('Mario', 7.0), ('Daniel', 8.0), ('Carlos', 8.0), ('Giusse', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_7_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Daft Punk', 'Harder, better, faster, stronger' FROM set_1_7
  RETURNING id
)
, votes_1_7_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_7_3.id, v.voter_name, v.score
  FROM song_1_7_3,
  (VALUES ('Jose J', 6.5), ('Francisco', 8.0), ('Hernan', 7.0), ('Mario', 8.0), ('Daniel', 7.0), ('Carlos', 8.0), ('Giusse', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_1_7_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'Deepest Blue', 'Give it away' FROM set_1_7
  RETURNING id
)
, votes_1_7_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_7_4.id, v.voter_name, v.score
  FROM song_1_7_4,
  (VALUES ('Jose J', 7.0), ('Francisco', 7.0), ('Hernan', 8.5), ('Mario', 9.0), ('Daniel', 6.0), ('Carlos', 7.0), ('Giusse', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_1_7_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'Depeche Mode', 'Precious' FROM set_1_7
  RETURNING id
)
, votes_1_7_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_7_5.id, v.voter_name, v.score
  FROM song_1_7_5,
  (VALUES ('Jose J', 8.0), ('Francisco', 8.0), ('Hernan', 10.0), ('Mario', 10.0), ('Daniel', 8.0), ('Carlos', 10.0), ('Giusse', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_7_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'Gavin Rossdale', 'Adrenaline' FROM set_1_7
  RETURNING id
)
, votes_1_7_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_7_6.id, v.voter_name, v.score
  FROM song_1_7_6,
  (VALUES ('Jose J', 8.5), ('Francisco', 6.0), ('Hernan', 8.0), ('Mario', 7.0), ('Daniel', 7.0), ('Carlos', 5.0), ('Giusse', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_7_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'Gorillaz', 'Feel good inc' FROM set_1_7
  RETURNING id
)
, votes_1_7_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_7_7.id, v.voter_name, v.score
  FROM song_1_7_7,
  (VALUES ('Jose J', 7.0), ('Francisco', 7.0), ('Hernan', 7.0), ('Mario', 8.0), ('Daniel', 5.0), ('Carlos', 6.0), ('Giusse', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_7_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'Indochina', 'Cannary' FROM set_1_7
  RETURNING id
)
, votes_1_7_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_7_8.id, v.voter_name, v.score
  FROM song_1_7_8,
  (VALUES ('Jose J', 6.5), ('Francisco', 7.0), ('Hernan', 7.0), ('Mario', 6.0), ('Daniel', 7.0), ('Carlos', 7.0), ('Giusse', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_1_7_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'Jamiroquai', 'Virtual Insanity' FROM set_1_7
  RETURNING id
)
, votes_1_7_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_7_9.id, v.voter_name, v.score
  FROM song_1_7_9,
  (VALUES ('Jose J', 3.5), ('Francisco', 8.0), ('Hernan', 6.0), ('Mario', 7.0), ('Daniel', 6.0), ('Carlos', 7.0), ('Giusse', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_7_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'Kiss', 'Sure know something' FROM set_1_7
  RETURNING id
)
, votes_1_7_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_7_10.id, v.voter_name, v.score
  FROM song_1_7_10,
  (VALUES ('Jose J', 8.0), ('Francisco', 7.0), ('Hernan', 8.0), ('Mario', 6.0), ('Daniel', 9.0), ('Carlos', 8.0), ('Giusse', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_7_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'Lindsey Buckingham', 'Trouble' FROM set_1_7
  RETURNING id
)
, votes_1_7_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_7_11.id, v.voter_name, v.score
  FROM song_1_7_11,
  (VALUES ('Jose J', 9.0), ('Francisco', 8.0), ('Hernan', 9.0), ('Mario', 10.0), ('Daniel', 7.0), ('Carlos', 8.0), ('Giusse', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_7_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'Pet Shop Boys', 'Did you see me coming' FROM set_1_7
  RETURNING id
)
, votes_1_7_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_7_12.id, v.voter_name, v.score
  FROM song_1_7_12,
  (VALUES ('Jose J', 8.0), ('Francisco', 9.0), ('Hernan', 8.0), ('Mario', 8.0), ('Daniel', 8.0), ('Carlos', 8.0), ('Giusse', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_7_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'Simple Red', 'Sunrise' FROM set_1_7
  RETURNING id
)
, votes_1_7_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_7_13.id, v.voter_name, v.score
  FROM song_1_7_13,
  (VALUES ('Jose J', 7.5), ('Francisco', 8.0), ('Hernan', 8.5), ('Mario', 10.0), ('Daniel', 8.0), ('Carlos', 10.0), ('Giusse', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_7_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'Soda Stereo', 'Paseando por Roma' FROM set_1_7
  RETURNING id
)
, votes_1_7_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_7_14.id, v.voter_name, v.score
  FROM song_1_7_14,
  (VALUES ('Jose J', 7.0), ('Francisco', 8.0), ('Hernan', 8.0), ('Mario', 7.0), ('Daniel', 7.0), ('Carlos', 7.0), ('Giusse', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_1_7_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'The cars', 'You might think' FROM set_1_7
  RETURNING id
)
, votes_1_7_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_7_15.id, v.voter_name, v.score
  FROM song_1_7_15,
  (VALUES ('Jose J', 8.5), ('Francisco', 9.0), ('Hernan', 9.5), ('Mario', 9.0), ('Daniel', 9.0), ('Carlos', 9.0), ('Giusse', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_7_16 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 16, 'The Clash', 'Rock the Casbah' FROM set_1_7
  RETURNING id
)
, votes_1_7_16 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_7_16.id, v.voter_name, v.score
  FROM song_1_7_16,
  (VALUES ('Jose J', 7.5), ('Francisco', 7.0), ('Hernan', 9.5), ('Mario', 8.0), ('Daniel', 9.0), ('Carlos', 8.0), ('Giusse', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_7_17 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 17, 'The Cure', 'Just like heaven' FROM set_1_7
  RETURNING id
)
, votes_1_7_17 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_7_17.id, v.voter_name, v.score
  FROM song_1_7_17,
  (VALUES ('Jose J', 7.5), ('Francisco', 9.0), ('Hernan', 9.0), ('Mario', 8.0), ('Daniel', 7.0), ('Carlos', 9.0), ('Giusse', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_7_18 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 18, 'Velvet Revolver', 'Slither' FROM set_1_7
  RETURNING id
)
, votes_1_7_18 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_7_18.id, v.voter_name, v.score
  FROM song_1_7_18,
  (VALUES ('Jose J', 8.0), ('Francisco', 8.0), ('Hernan', 7.0), ('Mario', 7.0), ('Daniel', 6.0), ('Carlos', 6.0), ('Giusse', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_7_19 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 19, 'Will Smith', 'Miami' FROM set_1_7
  RETURNING id
)
, votes_1_7_19 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_7_19.id, v.voter_name, v.score
  FROM song_1_7_19,
  (VALUES ('Jose J', 3.0), ('Francisco', 5.0), ('Hernan', 4.0), ('Mario', 5.0), ('Daniel', 3.0), ('Carlos', 4.0), ('Giusse', 4.0)) AS v(voter_name, score)
  RETURNING id
)
, set_1_8 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 8, 'Set Jose Jaime' FROM s1
  RETURNING id
)
, song_1_8_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, '30 Seconds To Mars', 'Kings and Queens' FROM set_1_8
  RETURNING id
)
, votes_1_8_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_8_0.id, v.voter_name, v.score
  FROM song_1_8_0,
  (VALUES ('Jose J', 7.0), ('Francisco', 7.0), ('Hernan', 6.0), ('Mario', 7.0), ('Daniel', 7.0), ('Jorge A.', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_8_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'AC/DC', 'You Shook Me All Night Long' FROM set_1_8
  RETURNING id
)
, votes_1_8_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_8_1.id, v.voter_name, v.score
  FROM song_1_8_1,
  (VALUES ('Jose J', 10.0), ('Francisco', 9.0), ('Hernan', 9.0), ('Mario', 8.0), ('Daniel', 9.0), ('Jorge A.', 10.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_8_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'Alanis Morissette', 'Thank You' FROM set_1_8
  RETURNING id
)
, votes_1_8_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_8_2.id, v.voter_name, v.score
  FROM song_1_8_2,
  (VALUES ('Francisco', 8.0), ('Hernan', 8.0), ('Mario', 7.0), ('Daniel', 8.0), ('Jorge A.', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_8_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Alphaville', 'Forever Young' FROM set_1_8
  RETURNING id
)
, votes_1_8_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_8_3.id, v.voter_name, v.score
  FROM song_1_8_3,
  (VALUES ('Jose J', 9.0), ('Francisco', 8.0), ('Hernan', 9.0), ('Mario', 9.0), ('Daniel', 8.0), ('Jorge A.', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_8_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'Annie Lennox', 'A Whiter Shade Of Pale' FROM set_1_8
  RETURNING id
)
, votes_1_8_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_8_4.id, v.voter_name, v.score
  FROM song_1_8_4,
  (VALUES ('Jose J', 9.0), ('Francisco', 9.0), ('Hernan', 9.5), ('Mario', 8.0), ('Daniel', 9.0), ('Jorge A.', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_8_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'Coldplay', 'Clocks' FROM set_1_8
  RETURNING id
)
, votes_1_8_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_8_5.id, v.voter_name, v.score
  FROM song_1_8_5,
  (VALUES ('Jose J', 9.0), ('Francisco', 8.0), ('Hernan', 7.0), ('Mario', 10.0), ('Daniel', 8.0), ('Jorge A.', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_8_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'Foreigner', 'Urgent' FROM set_1_8
  RETURNING id
)
, votes_1_8_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_8_6.id, v.voter_name, v.score
  FROM song_1_8_6,
  (VALUES ('Jose J', 8.0), ('Francisco', 7.0), ('Hernan', 8.0), ('Mario', 8.0), ('Daniel', 7.0), ('Jorge A.', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_8_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'Gavin Rossdale', 'Love Remains' FROM set_1_8
  RETURNING id
)
, votes_1_8_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_8_7.id, v.voter_name, v.score
  FROM song_1_8_7,
  (VALUES ('Jose J', 7.0), ('Francisco', 7.0), ('Hernan', 6.0), ('Mario', 7.0), ('Daniel', 7.0), ('Jorge A.', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_8_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'Grand Funk', 'I Can Feel Him In The Morning' FROM set_1_8
  RETURNING id
)
, votes_1_8_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_8_8.id, v.voter_name, v.score
  FROM song_1_8_8,
  (VALUES ('Jose J', 10.0), ('Francisco', 9.0), ('Hernan', 7.0), ('Mario', 8.0), ('Daniel', 9.0), ('Jorge A.', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_8_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'Green Day', 'Wake Me Up When September Ends' FROM set_1_8
  RETURNING id
)
, votes_1_8_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_8_9.id, v.voter_name, v.score
  FROM song_1_8_9,
  (VALUES ('Jose J', 9.0), ('Francisco', 9.0), ('Hernan', 9.0), ('Mario', 8.0), ('Daniel', 8.0), ('Jorge A.', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_8_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'Héroes del Silencio', 'Héroe de Leyenda' FROM set_1_8
  RETURNING id
)
, votes_1_8_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_8_10.id, v.voter_name, v.score
  FROM song_1_8_10,
  (VALUES ('Jose J', 8.0), ('Francisco', 8.0), ('Hernan', 8.0), ('Mario', 9.0), ('Daniel', 8.0), ('Jorge A.', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_8_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'INXS', 'Afterglow' FROM set_1_8
  RETURNING id
)
, votes_1_8_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_8_11.id, v.voter_name, v.score
  FROM song_1_8_11,
  (VALUES ('Jose J', 7.0), ('Francisco', 7.0), ('Hernan', 7.0), ('Mario', 7.0), ('Daniel', 9.0), ('Jorge A.', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_8_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'Jean Michel Jarre', 'Equinoxe Part 5' FROM set_1_8
  RETURNING id
)
, votes_1_8_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_8_12.id, v.voter_name, v.score
  FROM song_1_8_12,
  (VALUES ('Jose J', 10.0), ('Francisco', 10.0), ('Hernan', 8.0), ('Mario', 7.0), ('Daniel', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_8_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'Keane', 'Everybody''s Changing' FROM set_1_8
  RETURNING id
)
, votes_1_8_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_8_13.id, v.voter_name, v.score
  FROM song_1_8_13,
  (VALUES ('Francisco', 8.0), ('Hernan', 9.0), ('Mario', 9.0), ('Daniel', 8.0), ('Jorge A.', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_8_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'Linkin Park', 'What I''ve Done' FROM set_1_8
  RETURNING id
)
, votes_1_8_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_8_14.id, v.voter_name, v.score
  FROM song_1_8_14,
  (VALUES ('Jose J', 9.0), ('Francisco', 8.0), ('Hernan', 6.0), ('Mario', 8.0), ('Daniel', 7.0), ('Jorge A.', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_8_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'Lobo', 'I''d Love You To Want Me' FROM set_1_8
  RETURNING id
)
, votes_1_8_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_8_15.id, v.voter_name, v.score
  FROM song_1_8_15,
  (VALUES ('Jose J', 8.0), ('Francisco', 7.0), ('Hernan', 6.0), ('Mario', 7.0), ('Daniel', 6.0), ('Jorge A.', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_8_16 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 16, 'Moby', 'Escapar' FROM set_1_8
  RETURNING id
)
, votes_1_8_16 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_8_16.id, v.voter_name, v.score
  FROM song_1_8_16,
  (VALUES ('Jose J', 8.0), ('Francisco', 8.0), ('Hernan', 6.0), ('Mario', 6.0), ('Daniel', 7.0), ('Jorge A.', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_8_17 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 17, 'Pínk floyd', 'Wish You Were Here' FROM set_1_8
  RETURNING id
)
, votes_1_8_17 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_8_17.id, v.voter_name, v.score
  FROM song_1_8_17,
  (VALUES ('Jose J', 10.0), ('Francisco', 8.0), ('Hernan', 9.0), ('Mario', 8.0), ('Daniel', 8.0), ('Jorge A.', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_8_18 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 18, 'Seal', 'Crazy' FROM set_1_8
  RETURNING id
)
, votes_1_8_18 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_8_18.id, v.voter_name, v.score
  FROM song_1_8_18,
  (VALUES ('Francisco', 7.0), ('Hernan', 7.0), ('Mario', 7.0), ('Daniel', 7.0), ('Jorge A.', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_8_19 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 19, 'Supertramp', 'The Logical Song' FROM set_1_8
  RETURNING id
)
, votes_1_8_19 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_8_19.id, v.voter_name, v.score
  FROM song_1_8_19,
  (VALUES ('Jose J', 10.0), ('Francisco', 8.0), ('Hernan', 10.0), ('Mario', 9.0), ('Daniel', 9.0), ('Jorge A.', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, set_1_9 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 9, 'Set Mauricio' FROM s1
  RETURNING id
)
, song_1_9_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'AC/DC', 'Who made who' FROM set_1_9
  RETURNING id
)
, votes_1_9_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_9_0.id, v.voter_name, v.score
  FROM song_1_9_0,
  (VALUES ('Jose J', 8.5), ('Hernan', 8.0), ('Mario', 9.5), ('Daniel', 7.5), ('Jorge A.', 7.0), ('Carlos', 8.5), ('Lucho', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_9_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'Andrés Calamaro', 'Alta Suciedad' FROM set_1_9
  RETURNING id
)
, votes_1_9_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_9_1.id, v.voter_name, v.score
  FROM song_1_9_1,
  (VALUES ('Jose J', 4.0), ('Hernan', 7.5), ('Mario', 6.5), ('Daniel', 6.0), ('Jorge A.', 7.5), ('Carlos', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_9_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'Campo de Almas', 'El silencio' FROM set_1_9
  RETURNING id
)
, votes_1_9_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_9_2.id, v.voter_name, v.score
  FROM song_1_9_2,
  (VALUES ('Jose J', 5.5), ('Hernan', 7.0), ('Mario', 6.0), ('Daniel', 5.5), ('Jorge A.', 6.5), ('Carlos', 6.5), ('Lucho', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_9_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Collective Soul', 'December' FROM set_1_9
  RETURNING id
)
, votes_1_9_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_9_3.id, v.voter_name, v.score
  FROM song_1_9_3,
  (VALUES ('Jose J', 7.5), ('Hernan', 6.5), ('Mario', 7.5), ('Daniel', 7.5), ('Jorge A.', 7.0), ('Carlos', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_9_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'Deep Purple', 'Highway star' FROM set_1_9
  RETURNING id
)
, votes_1_9_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_9_4.id, v.voter_name, v.score
  FROM song_1_9_4,
  (VALUES ('Jose J', 9.0), ('Hernan', 10.0), ('Mario', 9.5), ('Daniel', 8.5), ('Jorge A.', 9.0), ('Carlos', 10.0), ('Lucho', 10.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_9_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'Depeche Mode', 'Never let me down again' FROM set_1_9
  RETURNING id
)
, votes_1_9_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_9_5.id, v.voter_name, v.score
  FROM song_1_9_5,
  (VALUES ('Jose J', 7.0), ('Hernan', 8.5), ('Mario', 8.0), ('Daniel', 7.5), ('Jorge A.', 9.5), ('Carlos', 9.0), ('Lucho', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_9_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'Green Day', 'Warning' FROM set_1_9
  RETURNING id
)
, votes_1_9_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_9_6.id, v.voter_name, v.score
  FROM song_1_9_6,
  (VALUES ('Jose J', 6.0), ('Hernan', 6.5), ('Mario', 7.0), ('Daniel', 7.0), ('Jorge A.', 7.5), ('Carlos', 6.0), ('Lucho', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_9_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'Icona Pop', 'All night' FROM set_1_9
  RETURNING id
)
, votes_1_9_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_9_7.id, v.voter_name, v.score
  FROM song_1_9_7,
  (VALUES ('Jose J', 5.0), ('Hernan', 6.0), ('Mario', 4.0), ('Daniel', 3.0), ('Jorge A.', 6.0), ('Carlos', 5.0), ('Lucho', 5.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_9_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'Imagine Dragons', 'Radioactive' FROM set_1_9
  RETURNING id
)
, votes_1_9_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_9_8.id, v.voter_name, v.score
  FROM song_1_9_8,
  (VALUES ('Jose J', 8.0), ('Hernan', 8.5), ('Mario', 8.0), ('Daniel', 7.0), ('Jorge A.', 9.0), ('Carlos', 8.0), ('Lucho', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_1_9_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'Líbido', 'En esta habitación' FROM set_1_9
  RETURNING id
)
, votes_1_9_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_9_9.id, v.voter_name, v.score
  FROM song_1_9_9,
  (VALUES ('Jose J', 7.0), ('Hernan', 7.0), ('Mario', 7.0), ('Daniel', 7.0), ('Jorge A.', 7.5), ('Carlos', 9.0), ('Lucho', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_1_9_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'Neil Young', 'Philadelphia' FROM set_1_9
  RETURNING id
)
, votes_1_9_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_9_10.id, v.voter_name, v.score
  FROM song_1_9_10,
  (VALUES ('Jose J', 7.0), ('Hernan', 8.0), ('Mario', 9.0), ('Daniel', 6.5), ('Jorge A.', 8.0), ('Carlos', 9.0), ('Lucho', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_9_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'Placebo', 'Pure morning' FROM set_1_9
  RETURNING id
)
, votes_1_9_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_9_11.id, v.voter_name, v.score
  FROM song_1_9_11,
  (VALUES ('Jose J', 7.5), ('Hernan', 7.0), ('Mario', 7.0), ('Daniel', 6.5), ('Jorge A.', 7.0), ('Carlos', 7.5), ('Lucho', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_9_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'Smashing Pumpkins', 'Ava Adore' FROM set_1_9
  RETURNING id
)
, votes_1_9_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_9_12.id, v.voter_name, v.score
  FROM song_1_9_12,
  (VALUES ('Jose J', 7.5), ('Hernan', 9.0), ('Mario', 7.5), ('Daniel', 7.5), ('Jorge A.', 6.0), ('Carlos', 9.0), ('Lucho', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_9_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'Soda Stereo', 'Ella uso mi cabeza…' FROM set_1_9
  RETURNING id
)
, votes_1_9_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_9_13.id, v.voter_name, v.score
  FROM song_1_9_13,
  (VALUES ('Jose J', 6.0), ('Hernan', 7.0), ('Mario', 7.0), ('Daniel', 6.0), ('Jorge A.', 9.0), ('Carlos', 7.0), ('Lucho', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_9_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'Stone Temple Pilots', 'Interstate love' FROM set_1_9
  RETURNING id
)
, votes_1_9_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_9_14.id, v.voter_name, v.score
  FROM song_1_9_14,
  (VALUES ('Jose J', 8.0), ('Hernan', 6.5), ('Mario', 8.5), ('Daniel', 7.5), ('Jorge A.', 7.5), ('Carlos', 7.5), ('Lucho', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_9_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'The Bravery', 'Honest mistake' FROM set_1_9
  RETURNING id
)
, votes_1_9_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_9_15.id, v.voter_name, v.score
  FROM song_1_9_15,
  (VALUES ('Jose J', 8.0), ('Hernan', 9.0), ('Mario', 8.0), ('Daniel', 7.0), ('Jorge A.', 8.5), ('Carlos', 9.0), ('Lucho', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_9_16 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 16, 'The Cure', 'Pictures of you' FROM set_1_9
  RETURNING id
)
, votes_1_9_16 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_9_16.id, v.voter_name, v.score
  FROM song_1_9_16,
  (VALUES ('Jose J', 8.5), ('Hernan', 9.0), ('Mario', 8.5), ('Daniel', 7.5), ('Jorge A.', 7.0), ('Carlos', 7.5), ('Lucho', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_9_17 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 17, 'The Sonics', 'Have love will travel' FROM set_1_9
  RETURNING id
)
, votes_1_9_17 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_9_17.id, v.voter_name, v.score
  FROM song_1_9_17,
  (VALUES ('Jose J', 6.5), ('Hernan', 7.0), ('Mario', 6.5), ('Daniel', 6.5), ('Jorge A.', 7.0), ('Carlos', 8.0), ('Lucho', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_1_9_18 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 18, 'The Vaccines', 'Wrecking bar (ra, ra, ra)' FROM set_1_9
  RETURNING id
)
, votes_1_9_18 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_9_18.id, v.voter_name, v.score
  FROM song_1_9_18,
  (VALUES ('Jose J', 6.0), ('Hernan', 7.0), ('Mario', 7.0), ('Daniel', 6.0), ('Jorge A.', 5.0), ('Carlos', 6.0), ('Lucho', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_9_19 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 19, 'Underworld', 'Born slippy' FROM set_1_9
  RETURNING id
)
, votes_1_9_19 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_9_19.id, v.voter_name, v.score
  FROM song_1_9_19,
  (VALUES ('Jose J', 7.0), ('Hernan', 8.5), ('Mario', 7.5), ('Daniel', 7.5), ('Jorge A.', 8.0), ('Carlos', 8.5), ('Lucho', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, set_1_10 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 10, 'Set Rafael' FROM s1
  RETURNING id
)
, song_1_10_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'Bee Gees', 'Inmortality' FROM set_1_10
  RETURNING id
)
, votes_1_10_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_10_0.id, v.voter_name, v.score
  FROM song_1_10_0,
  (VALUES ('Carlos', 8.5), ('Freddy', 10.0), ('Giusse', 6.5), ('Mauricio O.', 6.5), ('Mauricio R.', 6.5), ('Lucho', 6.0), ('Gino', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_10_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'Fito Paez', 'Al Lado del Camino' FROM set_1_10
  RETURNING id
)
, votes_1_10_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_10_1.id, v.voter_name, v.score
  FROM song_1_10_1,
  (VALUES ('Carlos', 5.5), ('Freddy', 8.0), ('Giusse', 7.0), ('Mauricio O.', 7.0), ('Mauricio R.', 7.0), ('Lucho', 6.5), ('Gino', 5.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_10_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'Grover Washington Jr.', 'Just the Two of Us' FROM set_1_10
  RETURNING id
)
, votes_1_10_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_10_2.id, v.voter_name, v.score
  FROM song_1_10_2,
  (VALUES ('Carlos', 7.5), ('Freddy', 8.0), ('Giusse', 8.5), ('Mauricio O.', 7.0), ('Mauricio R.', 9.0), ('Lucho', 9.0), ('Gino', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_10_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Hank Levy', 'Whiplash (Original Motion)' FROM set_1_10
  RETURNING id
)
, votes_1_10_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_10_3.id, v.voter_name, v.score
  FROM song_1_10_3,
  (VALUES ('Carlos', 6.5), ('Freddy', 6.0), ('Giusse', 6.0), ('Mauricio O.', 6.5), ('Mauricio R.', 5.0), ('Lucho', 7.5), ('Gino', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_10_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'Joaquin Sabina', 'Y Sin Embargo' FROM set_1_10
  RETURNING id
)
, votes_1_10_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_10_4.id, v.voter_name, v.score
  FROM song_1_10_4,
  (VALUES ('Carlos', 5.0), ('Freddy', 7.0), ('Giusse', 9.0), ('Mauricio O.', 6.5), ('Mauricio R.', 3.0), ('Lucho', 8.0), ('Gino', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_10_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'La Pegatina', 'Y se fue' FROM set_1_10
  RETURNING id
)
, votes_1_10_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_10_5.id, v.voter_name, v.score
  FROM song_1_10_5,
  (VALUES ('Carlos', 6.5), ('Freddy', 7.0), ('Giusse', 5.0), ('Mauricio O.', 4.5), ('Mauricio R.', 5.0), ('Lucho', 7.0), ('Gino', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_10_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'London Symphony Orchestra - Josef Krips (Beethoven)', 'Symphony Nro9 D Minor Op 125 "Choral": Molto Vivace' FROM set_1_10
  RETURNING id
)
, votes_1_10_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_10_6.id, v.voter_name, v.score
  FROM song_1_10_6,
  (VALUES ('Carlos', 8.0), ('Freddy', 10.0), ('Giusse', 8.5), ('Mauricio O.', 9.0), ('Mauricio R.', 9.5), ('Lucho', 9.0), ('Gino', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_1_10_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'Nito Rota & Carlos Savina', 'Love Theme' FROM set_1_10
  RETURNING id
)
, votes_1_10_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_10_7.id, v.voter_name, v.score
  FROM song_1_10_7,
  (VALUES ('Carlos', 8.0), ('Freddy', 9.0), ('Giusse', 9.0), ('Mauricio O.', 8.5), ('Mauricio R.', 8.5), ('Lucho', 9.0), ('Gino', 10.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_10_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'Pet Shop Boys', 'Go West' FROM set_1_10
  RETURNING id
)
, votes_1_10_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_10_8.id, v.voter_name, v.score
  FROM song_1_10_8,
  (VALUES ('Carlos', 8.0), ('Freddy', 8.0), ('Giusse', 7.5), ('Mauricio O.', 8.5), ('Mauricio R.', 9.0), ('Lucho', 8.0), ('Gino', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_1_10_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'Piero', 'Tengo la Piel Cansada de la Tarde' FROM set_1_10
  RETURNING id
)
, votes_1_10_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_10_9.id, v.voter_name, v.score
  FROM song_1_10_9,
  (VALUES ('Carlos', 7.5), ('Freddy', 7.0), ('Giusse', 9.0), ('Mauricio O.', 6.5), ('Mauricio R.', 8.0), ('Lucho', 8.5), ('Gino', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_10_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'Silvio Rodriguez', 'Historia de Las Sillas' FROM set_1_10
  RETURNING id
)
, votes_1_10_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_10_10.id, v.voter_name, v.score
  FROM song_1_10_10,
  (VALUES ('Carlos', 6.0), ('Freddy', 6.0), ('Giusse', 7.0), ('Mauricio O.', 7.5), ('Mauricio R.', 5.5), ('Lucho', 6.0), ('Gino', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_10_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'Tame Impala', 'Let it Happen' FROM set_1_10
  RETURNING id
)
, votes_1_10_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_10_11.id, v.voter_name, v.score
  FROM song_1_10_11,
  (VALUES ('Carlos', 7.0), ('Freddy', 7.0), ('Giusse', 8.0), ('Mauricio O.', 9.0), ('Mauricio R.', 7.5), ('Lucho', 8.0), ('Gino', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_1_10_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'The Chemical Brothers', 'Wide Open' FROM set_1_10
  RETURNING id
)
, votes_1_10_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_10_12.id, v.voter_name, v.score
  FROM song_1_10_12,
  (VALUES ('Carlos', 9.0), ('Freddy', 9.0), ('Giusse', 7.0), ('Mauricio O.', 7.5), ('Mauricio R.', 9.0), ('Lucho', 8.0), ('Gino', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_10_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'The Doors', 'Love me Two Times' FROM set_1_10
  RETURNING id
)
, votes_1_10_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_10_13.id, v.voter_name, v.score
  FROM song_1_10_13,
  (VALUES ('Carlos', 8.5), ('Freddy', 10.0), ('Giusse', 8.5), ('Mauricio O.', 7.0), ('Mauricio R.', 10.0), ('Lucho', 8.5), ('Gino', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_10_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'The Rolling Stones', 'Emotional Rescue' FROM set_1_10
  RETURNING id
)
, votes_1_10_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_10_14.id, v.voter_name, v.score
  FROM song_1_10_14,
  (VALUES ('Carlos', 7.5), ('Freddy', 9.0), ('Giusse', 7.0), ('Mauricio O.', 7.0), ('Mauricio R.', 8.0), ('Lucho', 9.5), ('Gino', 10.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_10_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'The Shift', 'Dreams' FROM set_1_10
  RETURNING id
)
, votes_1_10_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_10_15.id, v.voter_name, v.score
  FROM song_1_10_15,
  (VALUES ('Carlos', 7.0), ('Freddy', 8.0), ('Giusse', 7.0), ('Mauricio O.', 6.5), ('Mauricio R.', 8.5), ('Lucho', 8.5), ('Gino', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_1_10_16 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 16, 'The War on Drugs', 'Under the Pressure' FROM set_1_10
  RETURNING id
)
, votes_1_10_16 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_10_16.id, v.voter_name, v.score
  FROM song_1_10_16,
  (VALUES ('Carlos', 7.5), ('Freddy', 7.0), ('Giusse', 8.5), ('Mauricio O.', 9.0), ('Mauricio R.', 7.0), ('Lucho', 8.0), ('Gino', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_1_10_17 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 17, 'Twenty one pilots', 'Stressed Out' FROM set_1_10
  RETURNING id
)
, votes_1_10_17 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_10_17.id, v.voter_name, v.score
  FROM song_1_10_17,
  (VALUES ('Carlos', 7.0), ('Freddy', 9.0), ('Giusse', 7.5), ('Mauricio O.', 6.5), ('Mauricio R.', 4.0), ('Lucho', 8.5), ('Gino', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_1_10_18 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 18, 'U2', 'Desire' FROM set_1_10
  RETURNING id
)
, votes_1_10_18 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_10_18.id, v.voter_name, v.score
  FROM song_1_10_18,
  (VALUES ('Carlos', 7.0), ('Freddy', 8.0), ('Giusse', 8.0), ('Mauricio O.', 7.0), ('Mauricio R.', 7.5), ('Lucho', 7.5), ('Gino', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_1_10_19 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 19, 'Zanfir', 'The Lonely Shepherd' FROM set_1_10
  RETURNING id
)
, votes_1_10_19 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_1_10_19.id, v.voter_name, v.score
  FROM song_1_10_19,
  (VALUES ('Carlos', 10.0), ('Freddy', 8.0), ('Giusse', 8.0), ('Mauricio O.', 6.5), ('Mauricio R.', 9.5), ('Lucho', 9.5), ('Gino', 8.0)) AS v(voter_name, score)
  RETURNING id
)
SELECT id FROM s1;

WITH s2 AS (
  INSERT INTO cyc_sessions (session_num, host, date, attendees, input_mode, sets_count, songs_count, complete)
  VALUES (2, 'Temporada 2', '2023-06-01', ARRAY["Carlos", "Daniel", "Freddy", "Giusse", "Hernan", "Jorge A.", "Jose J", "Lucho", "Mario", "Mauricio O.", "Mauricio R.", "Tono"]::text[], 'host', 8, 20, true)
  RETURNING id
)
, set_2_0 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 0, 'Set Carlos' FROM s2
  RETURNING id
)
, song_2_0_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'A Flock Of Seagulls', 'I Ran (So Far Away)' FROM set_2_0
  RETURNING id
)
, votes_2_0_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_0_0.id, v.voter_name, v.score
  FROM song_2_0_0,
  (VALUES ('Jose J', 8.0), ('Hernan', 9.0), ('Mario', 9.0), ('Daniel', 9.0), ('Jorge A.', 9.5), ('Freddy', 8.0), ('Giusse', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_2_0_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'And One', 'back home (club mix)' FROM set_2_0
  RETURNING id
)
, votes_2_0_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_0_1.id, v.voter_name, v.score
  FROM song_2_0_1,
  (VALUES ('Jose J', 7.5), ('Hernan', 8.5), ('Mario', 9.0), ('Daniel', 7.5), ('Jorge A.', 8.0), ('Freddy', 7.0), ('Giusse', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_0_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'Bachman Turner Overdrive', 'Four Wheel Drive' FROM set_2_0
  RETURNING id
)
, votes_2_0_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_0_2.id, v.voter_name, v.score
  FROM song_2_0_2,
  (VALUES ('Jose J', 7.0), ('Hernan', 7.5), ('Mario', 8.5), ('Daniel', 7.5), ('Jorge A.', 7.5), ('Freddy', 8.0), ('Giusse', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_0_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Bobby Vinton', 'Blue Velvet' FROM set_2_0
  RETURNING id
)
, votes_2_0_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_0_3.id, v.voter_name, v.score
  FROM song_2_0_3,
  (VALUES ('Jose J', 6.0), ('Hernan', 8.0), ('Mario', 8.5), ('Daniel', 7.0), ('Jorge A.', 7.5), ('Freddy', 8.5), ('Giusse', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_0_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'David Bowie', 'Space Oddity' FROM set_2_0
  RETURNING id
)
, votes_2_0_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_0_4.id, v.voter_name, v.score
  FROM song_2_0_4,
  (VALUES ('Jose J', 7.0), ('Hernan', 8.5), ('Mario', 8.0), ('Daniel', 7.0), ('Jorge A.', 7.0), ('Freddy', 8.0), ('Giusse', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_2_0_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'Del Pueblo Y Del Barrio', 'Escalera Al Infierno' FROM set_2_0
  RETURNING id
)
, votes_2_0_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_0_5.id, v.voter_name, v.score
  FROM song_2_0_5,
  (VALUES ('Jose J', 7.0), ('Hernan', 8.0), ('Mario', 7.5), ('Daniel', 6.5), ('Jorge A.', 7.5), ('Freddy', 6.0), ('Giusse', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_0_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'Electric Light Orchestra', 'Last Train To London' FROM set_2_0
  RETURNING id
)
, votes_2_0_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_0_6.id, v.voter_name, v.score
  FROM song_2_0_6,
  (VALUES ('Jose J', 7.5), ('Hernan', 9.0), ('Mario', 9.5), ('Daniel', 8.0), ('Jorge A.', 9.0), ('Freddy', 10.0), ('Giusse', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_0_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'Foster the people', 'Pumped Up Kicks' FROM set_2_0
  RETURNING id
)
, votes_2_0_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_0_7.id, v.voter_name, v.score
  FROM song_2_0_7,
  (VALUES ('Jose J', 8.5), ('Hernan', 7.5), ('Mario', 8.5), ('Daniel', 8.5), ('Jorge A.', 10.0), ('Freddy', 8.5), ('Giusse', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_0_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'Luis Miguelez & Glitter Klinik', 'Gritando Amor' FROM set_2_0
  RETURNING id
)
, votes_2_0_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_0_8.id, v.voter_name, v.score
  FROM song_2_0_8,
  (VALUES ('Jose J', 4.0), ('Hernan', 7.0), ('Mario', 7.0), ('Daniel', 7.5), ('Jorge A.', 8.0), ('Freddy', 6.5), ('Giusse', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_0_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'Mœnia', 'Beber De Tu Sangre' FROM set_2_0
  RETURNING id
)
, votes_2_0_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_0_9.id, v.voter_name, v.score
  FROM song_2_0_9,
  (VALUES ('Jose J', 7.0), ('Hernan', 8.7), ('Mario', 7.5), ('Daniel', 7.5), ('Jorge A.', 8.0), ('Freddy', 7.0), ('Giusse', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_0_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'New Order', 'Age Of Consent' FROM set_2_0
  RETURNING id
)
, votes_2_0_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_0_10.id, v.voter_name, v.score
  FROM song_2_0_10,
  (VALUES ('Jose J', 6.5), ('Hernan', 8.5), ('Mario', 7.5), ('Daniel', 6.5), ('Jorge A.', 7.0), ('Freddy', 8.0), ('Giusse', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_2_0_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'Orchestral Manoeuvres In The Dark', 'Secret (Extended Mix)' FROM set_2_0
  RETURNING id
)
, votes_2_0_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_0_11.id, v.voter_name, v.score
  FROM song_2_0_11,
  (VALUES ('Jose J', 7.0), ('Hernan', 8.0), ('Mario', 8.0), ('Daniel', 7.0), ('Jorge A.', 8.5), ('Freddy', 7.0), ('Giusse', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_0_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'Pet Shop Boys', 'I started a joke' FROM set_2_0
  RETURNING id
)
, votes_2_0_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_0_12.id, v.voter_name, v.score
  FROM song_2_0_12,
  (VALUES ('Jose J', 7.0), ('Hernan', 8.0), ('Mario', 8.0), ('Daniel', 7.0), ('Jorge A.', 6.0), ('Freddy', 9.0), ('Giusse', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_0_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'Psyche', 'Goodbye Horses' FROM set_2_0
  RETURNING id
)
, votes_2_0_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_0_13.id, v.voter_name, v.score
  FROM song_2_0_13,
  (VALUES ('Jose J', 7.5), ('Hernan', 8.5), ('Mario', 7.0), ('Daniel', 7.0), ('Jorge A.', 7.5), ('Freddy', 6.5), ('Giusse', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_0_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'Pulp', 'Disco 2000' FROM set_2_0
  RETURNING id
)
, votes_2_0_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_0_14.id, v.voter_name, v.score
  FROM song_2_0_14,
  (VALUES ('Jose J', 6.5), ('Hernan', 8.0), ('Mario', 7.0), ('Daniel', 8.0), ('Jorge A.', 6.5), ('Freddy', 6.0), ('Giusse', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_0_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'Scott McKenzie', 'San Francisco' FROM set_2_0
  RETURNING id
)
, votes_2_0_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_0_15.id, v.voter_name, v.score
  FROM song_2_0_15,
  (VALUES ('Jose J', 10.0), ('Hernan', 9.0), ('Mario', 9.0), ('Daniel', 7.5), ('Jorge A.', 8.5), ('Freddy', 10.0), ('Giusse', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_2_0_16 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 16, 'The Lightning Seeds', 'Pure [Album Version]' FROM set_2_0
  RETURNING id
)
, votes_2_0_16 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_0_16.id, v.voter_name, v.score
  FROM song_2_0_16,
  (VALUES ('Jose J', 8.0), ('Hernan', 9.0), ('Mario', 9.0), ('Daniel', 8.0), ('Jorge A.', 8.0), ('Freddy', 8.5), ('Giusse', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_2_0_17 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 17, 'U2', 'Dancing Barefoot' FROM set_2_0
  RETURNING id
)
, votes_2_0_17 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_0_17.id, v.voter_name, v.score
  FROM song_2_0_17,
  (VALUES ('Jose J', 7.0), ('Hernan', 7.5), ('Mario', 9.0), ('Daniel', 7.0), ('Jorge A.', 7.5), ('Freddy', 8.0), ('Giusse', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_2_0_18 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 18, 'Uriah Heep', 'July Morning' FROM set_2_0
  RETURNING id
)
, votes_2_0_18 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_0_18.id, v.voter_name, v.score
  FROM song_2_0_18,
  (VALUES ('Jose J', 9.5), ('Hernan', 9.0), ('Mario', 9.5), ('Daniel', 8.0), ('Jorge A.', 7.5), ('Freddy', 9.0), ('Giusse', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_0_19 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 19, 'Yazoo', 'Situation [12" Remix]' FROM set_2_0
  RETURNING id
)
, votes_2_0_19 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_0_19.id, v.voter_name, v.score
  FROM song_2_0_19,
  (VALUES ('Jose J', 8.0), ('Hernan', 8.5), ('Mario', 7.0), ('Daniel', 9.0), ('Jorge A.', 7.0), ('Freddy', 8.0), ('Giusse', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, set_2_1 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 1, 'Set Daniel' FROM s2
  RETURNING id
)
, song_2_1_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'Aerosmith', 'Amazing' FROM set_2_1
  RETURNING id
)
, votes_2_1_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_1_0.id, v.voter_name, v.score
  FROM song_2_1_0,
  (VALUES ('Jose J', 8.0), ('Hernan', 8.5), ('Mario', 9.0), ('Jorge A.', 7.0), ('Carlos', 7.5), ('Giusse', 9.5)) AS v(voter_name, score)
  RETURNING id
)
, song_2_1_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'Billy Idol', 'White weding' FROM set_2_1
  RETURNING id
)
, votes_2_1_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_1_1.id, v.voter_name, v.score
  FROM song_2_1_1,
  (VALUES ('Jose J', 7.0), ('Hernan', 8.0), ('Mario', 9.0), ('Jorge A.', 9.0), ('Carlos', 9.0), ('Giusse', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_1_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'Billy Idol', 'Speed' FROM set_2_1
  RETURNING id
)
, votes_2_1_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_1_2.id, v.voter_name, v.score
  FROM song_2_1_2,
  (VALUES ('Jose J', 6.5), ('Hernan', 8.0), ('Mario', 7.0), ('Jorge A.', 7.5), ('Carlos', 7.5), ('Giusse', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_2_1_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Bon Jovi', 'Always' FROM set_2_1
  RETURNING id
)
, votes_2_1_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_1_3.id, v.voter_name, v.score
  FROM song_2_1_3,
  (VALUES ('Jose J', 8.0), ('Hernan', 6.5), ('Mario', 9.0), ('Jorge A.', 7.0), ('Carlos', 7.0), ('Giusse', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_2_1_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'Deff lepard', 'Poor sugar on me' FROM set_2_1
  RETURNING id
)
, votes_2_1_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_1_4.id, v.voter_name, v.score
  FROM song_2_1_4,
  (VALUES ('Jose J', 7.0), ('Hernan', 7.5), ('Mario', 7.0), ('Jorge A.', 6.0), ('Carlos', 6.0), ('Giusse', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_2_1_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'Duran duran', 'Ordinary world' FROM set_2_1
  RETURNING id
)
, votes_2_1_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_1_5.id, v.voter_name, v.score
  FROM song_2_1_5,
  (VALUES ('Jose J', 9.0), ('Hernan', 8.5), ('Mario', 8.5), ('Jorge A.', 8.0), ('Carlos', 8.5), ('Giusse', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_1_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'Guns N'' Roses', 'Welcome to jungle' FROM set_2_1
  RETURNING id
)
, votes_2_1_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_1_6.id, v.voter_name, v.score
  FROM song_2_1_6,
  (VALUES ('Jose J', 8.0), ('Hernan', 8.5), ('Mario', 9.5), ('Jorge A.', 8.5), ('Carlos', 8.5), ('Giusse', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_1_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'Journey', 'Dont stop beliving' FROM set_2_1
  RETURNING id
)
, votes_2_1_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_1_7.id, v.voter_name, v.score
  FROM song_2_1_7,
  (VALUES ('Jose J', 8.0), ('Hernan', 9.0), ('Mario', 8.5), ('Jorge A.', 8.0), ('Carlos', 8.0), ('Giusse', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_2_1_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'Katy Perry', 'Wide Awake' FROM set_2_1
  RETURNING id
)
, votes_2_1_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_1_8.id, v.voter_name, v.score
  FROM song_2_1_8,
  (VALUES ('Jose J', 7.0), ('Hernan', 7.5), ('Mario', 8.0), ('Jorge A.', 6.0), ('Carlos', 6.5), ('Giusse', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_2_1_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'Katy Perry', 'I kissed a girl' FROM set_2_1
  RETURNING id
)
, votes_2_1_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_1_9.id, v.voter_name, v.score
  FROM song_2_1_9,
  (VALUES ('Jose J', 6.0), ('Hernan', 7.0), ('Mario', 7.0), ('Jorge A.', 7.0), ('Carlos', 7.0), ('Giusse', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_2_1_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'Kim Carnes', 'Bette davis Eyes' FROM set_2_1
  RETURNING id
)
, votes_2_1_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_1_10.id, v.voter_name, v.score
  FROM song_2_1_10,
  (VALUES ('Jose J', 8.5), ('Hernan', 8.5), ('Mario', 8.0), ('Jorge A.', 8.0), ('Carlos', 8.5), ('Giusse', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_1_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'Metallica', 'Enter sandman (concierto)' FROM set_2_1
  RETURNING id
)
, votes_2_1_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_1_11.id, v.voter_name, v.score
  FROM song_2_1_11,
  (VALUES ('Jose J', 7.0), ('Hernan', 7.0), ('Mario', 6.0), ('Jorge A.', 8.5), ('Carlos', 8.0), ('Giusse', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_1_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'Metallica y la filarmonica', 'Nothing else matters' FROM set_2_1
  RETURNING id
)
, votes_2_1_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_1_12.id, v.voter_name, v.score
  FROM song_2_1_12,
  (VALUES ('Jose J', 8.5), ('Hernan', 8.5), ('Mario', 9.0), ('Jorge A.', 9.5), ('Carlos', 8.0), ('Giusse', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_1_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'Pet shop boys', 'always on my mind' FROM set_2_1
  RETURNING id
)
, votes_2_1_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_1_13.id, v.voter_name, v.score
  FROM song_2_1_13,
  (VALUES ('Jose J', 7.5), ('Hernan', 8.5), ('Mario', 9.0), ('Jorge A.', 8.0), ('Carlos', 10.0), ('Giusse', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_2_1_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'Poison', 'Ride the wind' FROM set_2_1
  RETURNING id
)
, votes_2_1_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_1_14.id, v.voter_name, v.score
  FROM song_2_1_14,
  (VALUES ('Jose J', 4.0), ('Hernan', 5.0), ('Mario', 5.5), ('Jorge A.', 6.0), ('Carlos', 5.0), ('Giusse', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_1_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'Starship', 'We built this city of rock and roll' FROM set_2_1
  RETURNING id
)
, votes_2_1_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_1_15.id, v.voter_name, v.score
  FROM song_2_1_15,
  (VALUES ('Jose J', 6.0), ('Hernan', 7.0), ('Mario', 7.5), ('Jorge A.', 7.5), ('Carlos', 8.5), ('Giusse', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_2_1_16 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 16, 'The Killers', 'All Things that i have done (concierto)' FROM set_2_1
  RETURNING id
)
, votes_2_1_16 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_1_16.id, v.voter_name, v.score
  FROM song_2_1_16,
  (VALUES ('Jose J', 8.5), ('Hernan', 8.5), ('Mario', 8.0), ('Jorge A.', 7.0), ('Carlos', 8.5), ('Giusse', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_1_17 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 17, 'The Killers', 'Somebody told me (concierto)' FROM set_2_1
  RETURNING id
)
, votes_2_1_17 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_1_17.id, v.voter_name, v.score
  FROM song_2_1_17,
  (VALUES ('Jose J', 6.0), ('Hernan', 9.0), ('Mario', 7.0), ('Jorge A.', 6.0), ('Carlos', 7.0), ('Giusse', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_2_1_18 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 18, 'The Offspring', 'Million Miles Away' FROM set_2_1
  RETURNING id
)
, votes_2_1_18 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_1_18.id, v.voter_name, v.score
  FROM song_2_1_18,
  (VALUES ('Jose J', 7.5), ('Hernan', 7.5), ('Mario', 6.5), ('Jorge A.', 7.5), ('Carlos', 5.0), ('Giusse', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_1_19 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 19, 'U2', 'Sunday bloody Sunday' FROM set_2_1
  RETURNING id
)
, votes_2_1_19 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_1_19.id, v.voter_name, v.score
  FROM song_2_1_19,
  (VALUES ('Jose J', 7.0), ('Hernan', 9.0), ('Mario', 8.5), ('Jorge A.', 7.5), ('Carlos', 8.5), ('Giusse', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, set_2_2 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 2, 'Set Giuse' FROM s2
  RETURNING id
)
, song_2_2_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'Annie Lennox', 'Why' FROM set_2_2
  RETURNING id
)
, votes_2_2_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_2_0.id, v.voter_name, v.score
  FROM song_2_2_0,
  (VALUES ('Jose J', 8.5), ('Hernan', 8.5), ('Mario', 9.0), ('Daniel', 7.0), ('Jorge A.', 6.5), ('Carlos', 7.0), ('Tono', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_2_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'Barbara Streisand', 'All I ask of you' FROM set_2_2
  RETURNING id
)
, votes_2_2_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_2_1.id, v.voter_name, v.score
  FROM song_2_2_1,
  (VALUES ('Jose J', 6.5), ('Hernan', 6.0), ('Mario', 7.0), ('Daniel', 6.5), ('Jorge A.', 6.0), ('Carlos', 6.0), ('Tono', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_2_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'Charly Garcia', 'Los Dinosaurios' FROM set_2_2
  RETURNING id
)
, votes_2_2_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_2_2.id, v.voter_name, v.score
  FROM song_2_2_2,
  (VALUES ('Jose J', 8.0), ('Hernan', 9.0), ('Mario', 8.0), ('Daniel', 6.0), ('Jorge A.', 8.5), ('Carlos', 8.0), ('Tono', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_2_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Dire Straits', 'Sultans of Swing' FROM set_2_2
  RETURNING id
)
, votes_2_2_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_2_3.id, v.voter_name, v.score
  FROM song_2_2_3,
  (VALUES ('Jose J', 7.5), ('Hernan', 8.5), ('Mario', 8.0), ('Daniel', 8.5), ('Jorge A.', 8.0), ('Carlos', 8.0), ('Tono', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_2_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'Dire Straits', 'Lady writer' FROM set_2_2
  RETURNING id
)
, votes_2_2_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_2_4.id, v.voter_name, v.score
  FROM song_2_2_4,
  (VALUES ('Jose J', 7.5), ('Hernan', 9.0), ('Mario', 8.5), ('Daniel', 7.0), ('Jorge A.', 8.0), ('Carlos', 8.5), ('Tono', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_2_2_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'Eagles', 'One of these nights' FROM set_2_2
  RETURNING id
)
, votes_2_2_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_2_5.id, v.voter_name, v.score
  FROM song_2_2_5,
  (VALUES ('Jose J', 7.0), ('Hernan', 7.5), ('Mario', 8.5), ('Daniel', 7.0), ('Jorge A.', 8.5), ('Carlos', 7.0), ('Tono', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_2_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'Fleetwood  Mac', 'Gypsy' FROM set_2_2
  RETURNING id
)
, votes_2_2_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_2_6.id, v.voter_name, v.score
  FROM song_2_2_6,
  (VALUES ('Jose J', 8.0), ('Hernan', 8.0), ('Mario', 7.5), ('Daniel', 8.0), ('Jorge A.', 8.0), ('Carlos', 8.5), ('Tono', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_2_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'James Taylor', 'Only a dream in Rio' FROM set_2_2
  RETURNING id
)
, votes_2_2_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_2_7.id, v.voter_name, v.score
  FROM song_2_2_7,
  (VALUES ('Jose J', 6.0), ('Hernan', 8.0), ('Mario', 7.0), ('Daniel', 6.0), ('Jorge A.', 6.0), ('Carlos', 6.0), ('Tono', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_2_2_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'JLG', 'Señales de humo' FROM set_2_2
  RETURNING id
)
, votes_2_2_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_2_8.id, v.voter_name, v.score
  FROM song_2_2_8,
  (VALUES ('Jose J', 3.0), ('Hernan', 7.5), ('Mario', 8.5), ('Daniel', 5.0), ('Jorge A.', 5.0), ('Carlos', 4.0), ('Tono', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_2_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'Led Zeppelin', 'Stairway to heaven' FROM set_2_2
  RETURNING id
)
, votes_2_2_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_2_9.id, v.voter_name, v.score
  FROM song_2_2_9,
  (VALUES ('Jose J', 9.0), ('Hernan', 8.0), ('Mario', 9.0), ('Daniel', 8.5), ('Jorge A.', 9.5), ('Carlos', 9.0), ('Tono', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_2_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'Led Zeppelin', 'Dy’er Ma’ker' FROM set_2_2
  RETURNING id
)
, votes_2_2_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_2_10.id, v.voter_name, v.score
  FROM song_2_2_10,
  (VALUES ('Jose J', 7.0), ('Hernan', 7.0), ('Mario', 8.0), ('Daniel', 7.0), ('Jorge A.', 8.0), ('Carlos', 8.0), ('Tono', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_2_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'Marvin Gaye', 'Sexual Healing' FROM set_2_2
  RETURNING id
)
, votes_2_2_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_2_11.id, v.voter_name, v.score
  FROM song_2_2_11,
  (VALUES ('Jose J', 6.5), ('Hernan', 8.5), ('Mario', 9.0), ('Daniel', 7.5), ('Jorge A.', 6.5), ('Carlos', 7.0), ('Tono', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_2_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'Owl City', 'Fireflies' FROM set_2_2
  RETURNING id
)
, votes_2_2_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_2_12.id, v.voter_name, v.score
  FROM song_2_2_12,
  (VALUES ('Jose J', 6.5), ('Hernan', 7.0), ('Mario', 7.0), ('Daniel', 6.5), ('Jorge A.', 5.5), ('Carlos', 6.0), ('Tono', 5.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_2_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'Peter Gabriel', 'Sladehammer' FROM set_2_2
  RETURNING id
)
, votes_2_2_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_2_13.id, v.voter_name, v.score
  FROM song_2_2_13,
  (VALUES ('Jose J', 7.5), ('Hernan', 8.5), ('Mario', 7.5), ('Daniel', 8.0), ('Jorge A.', 8.0), ('Carlos', 7.5), ('Tono', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_2_2_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'Rush', 'Limelight' FROM set_2_2
  RETURNING id
)
, votes_2_2_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_2_14.id, v.voter_name, v.score
  FROM song_2_2_14,
  (VALUES ('Jose J', 8.0), ('Hernan', 8.0), ('Mario', 7.5), ('Daniel', 7.5), ('Jorge A.', 8.0), ('Carlos', 6.0), ('Tono', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_2_2_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'Rush', 'The Spirit of the Radio' FROM set_2_2
  RETURNING id
)
, votes_2_2_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_2_15.id, v.voter_name, v.score
  FROM song_2_2_15,
  (VALUES ('Jose J', 8.0), ('Hernan', 7.5), ('Mario', 6.0), ('Daniel', 7.0), ('Jorge A.', 6.5), ('Carlos', 7.0), ('Tono', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_2_16 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 16, 'Santana', 'All I ever wanted' FROM set_2_2
  RETURNING id
)
, votes_2_2_16 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_2_16.id, v.voter_name, v.score
  FROM song_2_2_16,
  (VALUES ('Jose J', 7.5), ('Hernan', 8.0), ('Mario', 7.5), ('Daniel', 7.5), ('Jorge A.', 7.5), ('Carlos', 8.5), ('Tono', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_2_2_17 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 17, 'Santana', 'Flor de Luna' FROM set_2_2
  RETURNING id
)
, votes_2_2_17 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_2_17.id, v.voter_name, v.score
  FROM song_2_2_17,
  (VALUES ('Jose J', 7.0), ('Hernan', 8.5), ('Mario', 8.0), ('Daniel', 7.5), ('Jorge A.', 7.0), ('Carlos', 7.5), ('Tono', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_2_2_18 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 18, 'Styx', 'Fooling yourself' FROM set_2_2
  RETURNING id
)
, votes_2_2_18 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_2_18.id, v.voter_name, v.score
  FROM song_2_2_18,
  (VALUES ('Jose J', 6.5), ('Hernan', 8.5), ('Mario', 8.0), ('Daniel', 7.0), ('Jorge A.', 7.0), ('Carlos', 7.0), ('Tono', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_2_2_19 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 19, 'The Who', 'Eminence front' FROM set_2_2
  RETURNING id
)
, votes_2_2_19 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_2_19.id, v.voter_name, v.score
  FROM song_2_2_19,
  (VALUES ('Jose J', 8.5), ('Hernan', 8.5), ('Mario', 9.0), ('Daniel', 8.0), ('Jorge A.', 8.5), ('Carlos', 8.0), ('Tono', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, set_2_3 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 3, 'Set Hernan' FROM s2
  RETURNING id
)
, song_2_3_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'A ha', 'Life lines' FROM set_2_3
  RETURNING id
)
, votes_2_3_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_3_0.id, v.voter_name, v.score
  FROM song_2_3_0,
  (VALUES ('Jose J', 8.0), ('Mario', 8.0), ('Daniel', 7.5), ('Carlos', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_2_3_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'Alphaville', 'Sounds like a melody' FROM set_2_3
  RETURNING id
)
, votes_2_3_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_3_1.id, v.voter_name, v.score
  FROM song_2_3_1,
  (VALUES ('Jose J', 8.5), ('Mario', 9.0), ('Daniel', 7.0), ('Carlos', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_3_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'Björk', 'Hyper Ballad' FROM set_2_3
  RETURNING id
)
, votes_2_3_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_3_2.id, v.voter_name, v.score
  FROM song_2_3_2,
  (VALUES ('Jose J', 4.5), ('Mario', 6.5), ('Daniel', 6.0), ('Carlos', 4.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_3_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Depeche Mode', 'Welcome to my world' FROM set_2_3
  RETURNING id
)
, votes_2_3_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_3_3.id, v.voter_name, v.score
  FROM song_2_3_3,
  (VALUES ('Jose J', 5.0), ('Mario', 6.0), ('Daniel', 7.0), ('Carlos', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_3_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'Evanescence', 'Lithium' FROM set_2_3
  RETURNING id
)
, votes_2_3_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_3_4.id, v.voter_name, v.score
  FROM song_2_3_4,
  (VALUES ('Jose J', 6.5), ('Mario', 7.5), ('Daniel', 6.5), ('Carlos', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_2_3_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'Faithless', 'Tarantula' FROM set_2_3
  RETURNING id
)
, votes_2_3_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_3_5.id, v.voter_name, v.score
  FROM song_2_3_5,
  (VALUES ('Jose J', 7.0), ('Mario', 9.0), ('Daniel', 6.5), ('Carlos', 4.5)) AS v(voter_name, score)
  RETURNING id
)
, song_2_3_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'Gaelle', 'Give it back' FROM set_2_3
  RETURNING id
)
, votes_2_3_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_3_6.id, v.voter_name, v.score
  FROM song_2_3_6,
  (VALUES ('Jose J', 6.0), ('Mario', 6.5), ('Daniel', 7.0), ('Carlos', 5.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_3_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'Huey Lewis & The News', 'I want a new drug' FROM set_2_3
  RETURNING id
)
, votes_2_3_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_3_7.id, v.voter_name, v.score
  FROM song_2_3_7,
  (VALUES ('Jose J', 7.0), ('Mario', 6.5), ('Daniel', 7.5), ('Carlos', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_2_3_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'Iggy Pop', 'Lust For Life' FROM set_2_3
  RETURNING id
)
, votes_2_3_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_3_8.id, v.voter_name, v.score
  FROM song_2_3_8,
  (VALUES ('Jose J', 6.5), ('Mario', 6.0), ('Daniel', 7.0), ('Carlos', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_2_3_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'Jan Hammer', 'Crockett''s Theme' FROM set_2_3
  RETURNING id
)
, votes_2_3_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_3_9.id, v.voter_name, v.score
  FROM song_2_3_9,
  (VALUES ('Jose J', 8.0), ('Mario', 7.0), ('Daniel', 7.5), ('Carlos', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_3_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'Jean Michel Jarre', 'Je me souviens' FROM set_2_3
  RETURNING id
)
, votes_2_3_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_3_10.id, v.voter_name, v.score
  FROM song_2_3_10,
  (VALUES ('Jose J', 7.5), ('Mario', 7.0), ('Daniel', 7.0), ('Carlos', 5.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_3_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'Marillion', 'Sugar mice in the rain' FROM set_2_3
  RETURNING id
)
, votes_2_3_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_3_11.id, v.voter_name, v.score
  FROM song_2_3_11,
  (VALUES ('Jose J', 8.0), ('Mario', 6.5), ('Daniel', 6.5), ('Carlos', 5.5)) AS v(voter_name, score)
  RETURNING id
)
, song_2_3_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'Pet Shop Boys', 'Invisible' FROM set_2_3
  RETURNING id
)
, votes_2_3_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_3_12.id, v.voter_name, v.score
  FROM song_2_3_12,
  (VALUES ('Jose J', 7.0), ('Mario', 8.0), ('Daniel', 6.5), ('Carlos', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_2_3_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'Pínk floyd', 'One of these days' FROM set_2_3
  RETURNING id
)
, votes_2_3_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_3_13.id, v.voter_name, v.score
  FROM song_2_3_13,
  (VALUES ('Jose J', 8.5), ('Mario', 8.0), ('Daniel', 7.5), ('Carlos', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_3_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'Pínk floyd', 'Lost for words' FROM set_2_3
  RETURNING id
)
, votes_2_3_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_3_14.id, v.voter_name, v.score
  FROM song_2_3_14,
  (VALUES ('Jose J', 7.5), ('Mario', 7.0), ('Daniel', 7.0), ('Carlos', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_2_3_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'Queen', 'This could be heaven' FROM set_2_3
  RETURNING id
)
, votes_2_3_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_3_15.id, v.voter_name, v.score
  FROM song_2_3_15,
  (VALUES ('Jose J', 7.0), ('Mario', 8.5), ('Daniel', 7.0), ('Carlos', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_3_16 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 16, 'Roger Waters', 'Radio waves' FROM set_2_3
  RETURNING id
)
, votes_2_3_16 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_3_16.id, v.voter_name, v.score
  FROM song_2_3_16,
  (VALUES ('Jose J', 7.0), ('Mario', 6.0), ('Daniel', 6.5), ('Carlos', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_3_17 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 17, 'Schiller', 'Liebesparade' FROM set_2_3
  RETURNING id
)
, votes_2_3_17 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_3_17.id, v.voter_name, v.score
  FROM song_2_3_17,
  (VALUES ('Jose J', 8.0), ('Mario', 7.5), ('Daniel', 6.5), ('Carlos', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_2_3_18 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 18, 'The Alan Parsons Project', 'Prime Time' FROM set_2_3
  RETURNING id
)
, votes_2_3_18 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_3_18.id, v.voter_name, v.score
  FROM song_2_3_18,
  (VALUES ('Jose J', 7.0), ('Mario', 8.5), ('Daniel', 7.5), ('Carlos', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_2_3_19 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 19, 'Underworld', 'Boy, Boy, Boy' FROM set_2_3
  RETURNING id
)
, votes_2_3_19 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_3_19.id, v.voter_name, v.score
  FROM song_2_3_19,
  (VALUES ('Jose J', 6.5), ('Mario', 7.5), ('Daniel', 6.5), ('Carlos', 5.0)) AS v(voter_name, score)
  RETURNING id
)
, set_2_4 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 4, 'Set Jorge' FROM s2
  RETURNING id
)
, song_2_4_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'A perfect circle', 'Passive' FROM set_2_4
  RETURNING id
)
, votes_2_4_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_4_0.id, v.voter_name, v.score
  FROM song_2_4_0,
  (VALUES ('Jose J', 8.0), ('Hernan', 8.0), ('Mario', 6.0), ('Daniel', 5.0), ('Carlos', 5.5)) AS v(voter_name, score)
  RETURNING id
)
, song_2_4_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'Christopher Cross', 'Ride like the wind' FROM set_2_4
  RETURNING id
)
, votes_2_4_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_4_1.id, v.voter_name, v.score
  FROM song_2_4_1,
  (VALUES ('Jose J', 6.5), ('Hernan', 7.5), ('Mario', 7.5), ('Daniel', 7.0), ('Carlos', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_4_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'Coldplay', 'Violet Hill' FROM set_2_4
  RETURNING id
)
, votes_2_4_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_4_2.id, v.voter_name, v.score
  FROM song_2_4_2,
  (VALUES ('Jose J', 8.0), ('Hernan', 8.5), ('Mario', 7.5), ('Daniel', 8.0), ('Carlos', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_2_4_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Corey Taylor', 'Bother' FROM set_2_4
  RETURNING id
)
, votes_2_4_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_4_3.id, v.voter_name, v.score
  FROM song_2_4_3,
  (VALUES ('Jose J', 6.0), ('Hernan', 6.0), ('Mario', 7.0), ('Daniel', 7.0), ('Carlos', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_4_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'Depeche Mode', 'Dream on' FROM set_2_4
  RETURNING id
)
, votes_2_4_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_4_4.id, v.voter_name, v.score
  FROM song_2_4_4,
  (VALUES ('Jose J', 7.0), ('Hernan', 9.0), ('Mario', 8.5), ('Daniel', 7.5), ('Carlos', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_4_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'El último de la fila', 'Como un burro amarrado' FROM set_2_4
  RETURNING id
)
, votes_2_4_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_4_5.id, v.voter_name, v.score
  FROM song_2_4_5,
  (VALUES ('Jose J', 6.5), ('Hernan', 7.0), ('Mario', 7.0), ('Daniel', 6.5), ('Carlos', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_4_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'Foster the people', 'Houdini' FROM set_2_4
  RETURNING id
)
, votes_2_4_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_4_6.id, v.voter_name, v.score
  FROM song_2_4_6,
  (VALUES ('Jose J', 6.0), ('Hernan', 5.0), ('Mario', 6.0), ('Daniel', 6.0), ('Carlos', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_4_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'Jamiroquai', 'Don´t you give hate a chance' FROM set_2_4
  RETURNING id
)
, votes_2_4_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_4_7.id, v.voter_name, v.score
  FROM song_2_4_7,
  (VALUES ('Jose J', 3.0), ('Hernan', 7.5), ('Mario', 7.0), ('Daniel', 3.5), ('Carlos', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_2_4_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'Jarabe de Palo', 'El lado Oscuro' FROM set_2_4
  RETURNING id
)
, votes_2_4_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_4_8.id, v.voter_name, v.score
  FROM song_2_4_8,
  (VALUES ('Jose J', 6.0), ('Hernan', 8.5), ('Mario', 8.0), ('Daniel', 6.0), ('Carlos', 5.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_4_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'Moby', 'Extreme ways' FROM set_2_4
  RETURNING id
)
, votes_2_4_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_4_9.id, v.voter_name, v.score
  FROM song_2_4_9,
  (VALUES ('Jose J', 8.5), ('Hernan', 9.0), ('Mario', 8.5), ('Daniel', 7.5), ('Carlos', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_4_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'Monaco', 'What do you want from me' FROM set_2_4
  RETURNING id
)
, votes_2_4_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_4_10.id, v.voter_name, v.score
  FROM song_2_4_10,
  (VALUES ('Jose J', 7.5), ('Hernan', 8.0), ('Mario', 8.5), ('Daniel', 7.5), ('Carlos', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_4_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'New Order', 'True Faith' FROM set_2_4
  RETURNING id
)
, votes_2_4_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_4_11.id, v.voter_name, v.score
  FROM song_2_4_11,
  (VALUES ('Jose J', 7.0), ('Hernan', 9.0), ('Mario', 7.0), ('Daniel', 7.5), ('Carlos', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_2_4_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'Pearl Jam', 'Do the evolution' FROM set_2_4
  RETURNING id
)
, votes_2_4_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_4_12.id, v.voter_name, v.score
  FROM song_2_4_12,
  (VALUES ('Jose J', 7.0), ('Hernan', 7.5), ('Mario', 7.5), ('Daniel', 8.5), ('Carlos', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_4_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'Robert Tepper', 'No easy way out' FROM set_2_4
  RETURNING id
)
, votes_2_4_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_4_13.id, v.voter_name, v.score
  FROM song_2_4_13,
  (VALUES ('Jose J', 6.0), ('Hernan', 7.0), ('Mario', 6.5), ('Daniel', 6.5), ('Carlos', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_4_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'Soda Stereo', 'Languis' FROM set_2_4
  RETURNING id
)
, votes_2_4_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_4_14.id, v.voter_name, v.score
  FROM song_2_4_14,
  (VALUES ('Jose J', 4.0), ('Hernan', 3.0), ('Mario', 5.0), ('Daniel', 5.5), ('Carlos', 5.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_4_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'Sophis Ellis Bexter', 'Murder on the dance floor' FROM set_2_4
  RETURNING id
)
, votes_2_4_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_4_15.id, v.voter_name, v.score
  FROM song_2_4_15,
  (VALUES ('Jose J', 6.5), ('Hernan', 8.0), ('Mario', 8.0), ('Daniel', 7.0), ('Carlos', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_4_16 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 16, 'The lightning seeds', 'Sense' FROM set_2_4
  RETURNING id
)
, votes_2_4_16 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_4_16.id, v.voter_name, v.score
  FROM song_2_4_16,
  (VALUES ('Jose J', 8.0), ('Hernan', 8.5), ('Mario', 8.0), ('Daniel', 8.0), ('Carlos', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_4_17 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 17, 'Virus', 'Cuando es con vos' FROM set_2_4
  RETURNING id
)
, votes_2_4_17 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_4_17.id, v.voter_name, v.score
  FROM song_2_4_17,
  (VALUES ('Jose J', 5.0), ('Hernan', 8.0), ('Mario', 7.0), ('Daniel', 7.0), ('Carlos', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_2_4_18 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 18, 'Weezer', 'Island in the sun' FROM set_2_4
  RETURNING id
)
, votes_2_4_18 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_4_18.id, v.voter_name, v.score
  FROM song_2_4_18,
  (VALUES ('Jose J', 6.5), ('Hernan', 6.0), ('Mario', 6.0), ('Daniel', 7.0), ('Carlos', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, set_2_5 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 5, 'Set Jose Jaime' FROM s2
  RETURNING id
)
, song_2_5_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'Bee Gees', 'Melody Fair' FROM set_2_5
  RETURNING id
)
, votes_2_5_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_5_0.id, v.voter_name, v.score
  FROM song_2_5_0,
  (VALUES ('Hernan', 9.0), ('Daniel', 6.0), ('Jorge A.', 6.5), ('Carlos', 9.5)) AS v(voter_name, score)
  RETURNING id
)
, song_2_5_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'Biffy Clyro', 'Bubbles' FROM set_2_5
  RETURNING id
)
, votes_2_5_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_5_1.id, v.voter_name, v.score
  FROM song_2_5_1,
  (VALUES ('Hernan', 7.5), ('Daniel', 7.5), ('Jorge A.', 7.0), ('Carlos', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_2_5_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'Biffy Clyro', 'Many Of Horror' FROM set_2_5
  RETURNING id
)
, votes_2_5_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_5_2.id, v.voter_name, v.score
  FROM song_2_5_2,
  (VALUES ('Hernan', 8.5), ('Daniel', 7.0), ('Jorge A.', 7.0), ('Carlos', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_5_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'David Lee Roth', 'Yankee Rose' FROM set_2_5
  RETURNING id
)
, votes_2_5_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_5_3.id, v.voter_name, v.score
  FROM song_2_5_3,
  (VALUES ('Hernan', 7.0), ('Daniel', 7.5), ('Jorge A.', 8.0), ('Carlos', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_5_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'Don Johnson', 'Tell It Like It Is' FROM set_2_5
  RETURNING id
)
, votes_2_5_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_5_4.id, v.voter_name, v.score
  FROM song_2_5_4,
  (VALUES ('Hernan', 7.0), ('Daniel', 7.0), ('Jorge A.', 7.0), ('Carlos', 5.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_5_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'Donna Summer', 'McArthur Park' FROM set_2_5
  RETURNING id
)
, votes_2_5_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_5_5.id, v.voter_name, v.score
  FROM song_2_5_5,
  (VALUES ('Hernan', 8.5), ('Daniel', 7.5), ('Jorge A.', 7.0), ('Carlos', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_5_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'George Harrison', 'My Sweet Lord' FROM set_2_5
  RETURNING id
)
, votes_2_5_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_5_6.id, v.voter_name, v.score
  FROM song_2_5_6,
  (VALUES ('Hernan', 9.0), ('Daniel', 7.0), ('Jorge A.', 8.0), ('Carlos', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_5_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'Guess Who', 'These Eyes' FROM set_2_5
  RETURNING id
)
, votes_2_5_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_5_7.id, v.voter_name, v.score
  FROM song_2_5_7,
  (VALUES ('Hernan', 7.5), ('Daniel', 7.0), ('Jorge A.', 7.0), ('Carlos', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_5_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'Jean Michel Jarre', 'September' FROM set_2_5
  RETURNING id
)
, votes_2_5_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_5_8.id, v.voter_name, v.score
  FROM song_2_5_8,
  (VALUES ('Hernan', 8.0), ('Daniel', 7.0), ('Jorge A.', 5.0), ('Carlos', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_5_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'John Lennon', 'Imagine' FROM set_2_5
  RETURNING id
)
, votes_2_5_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_5_9.id, v.voter_name, v.score
  FROM song_2_5_9,
  (VALUES ('Hernan', 8.5), ('Daniel', 7.0), ('Jorge A.', 9.0), ('Carlos', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_2_5_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'Muse', 'Madness' FROM set_2_5
  RETURNING id
)
, votes_2_5_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_5_10.id, v.voter_name, v.score
  FROM song_2_5_10,
  (VALUES ('Hernan', 8.0), ('Daniel', 7.0), ('Jorge A.', 7.0), ('Carlos', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_5_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'Paul McCartney', 'With A Little Luck' FROM set_2_5
  RETURNING id
)
, votes_2_5_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_5_11.id, v.voter_name, v.score
  FROM song_2_5_11,
  (VALUES ('Hernan', 7.5), ('Daniel', 7.0), ('Jorge A.', 7.0), ('Carlos', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_5_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'Radiohead', 'Creep' FROM set_2_5
  RETURNING id
)
, votes_2_5_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_5_12.id, v.voter_name, v.score
  FROM song_2_5_12,
  (VALUES ('Hernan', 9.0), ('Daniel', 9.5), ('Jorge A.', 9.0), ('Carlos', 10.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_5_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'Sting & Cheb Mami', 'Desert Rose' FROM set_2_5
  RETURNING id
)
, votes_2_5_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_5_13.id, v.voter_name, v.score
  FROM song_2_5_13,
  (VALUES ('Hernan', 8.5), ('Daniel', 7.5), ('Jorge A.', 6.5), ('Carlos', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_5_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'The Beatles', 'Hey Jude' FROM set_2_5
  RETURNING id
)
, votes_2_5_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_5_14.id, v.voter_name, v.score
  FROM song_2_5_14,
  (VALUES ('Hernan', 9.0), ('Daniel', 8.0), ('Jorge A.', 8.0), ('Carlos', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_5_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'The East Village Opera Company', 'Le Nozze di Figaro -> Mozart' FROM set_2_5
  RETURNING id
)
, votes_2_5_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_5_15.id, v.voter_name, v.score
  FROM song_2_5_15,
  (VALUES ('Hernan', 6.5), ('Daniel', 7.5), ('Jorge A.', 7.5), ('Carlos', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_5_16 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 16, 'The Killers', 'Miss Atomic Bomb' FROM set_2_5
  RETURNING id
)
, votes_2_5_16 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_5_16.id, v.voter_name, v.score
  FROM song_2_5_16,
  (VALUES ('Hernan', 8.5), ('Daniel', 8.0), ('Jorge A.', 7.0), ('Carlos', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_2_5_17 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 17, 'The Rolling Stones', 'Anybody Seen My Baby?' FROM set_2_5
  RETURNING id
)
, votes_2_5_17 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_5_17.id, v.voter_name, v.score
  FROM song_2_5_17,
  (VALUES ('Hernan', 7.5), ('Daniel', 8.0), ('Jorge A.', 8.0), ('Carlos', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_5_18 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 18, 'Tiesto', 'Adagio For Strings' FROM set_2_5
  RETURNING id
)
, votes_2_5_18 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_5_18.id, v.voter_name, v.score
  FROM song_2_5_18,
  (VALUES ('Hernan', 7.5), ('Daniel', 6.0), ('Jorge A.', 8.0), ('Carlos', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_2_5_19 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 19, 'Tom Jones', 'Green, Green Grass of Home' FROM set_2_5
  RETURNING id
)
, votes_2_5_19 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_5_19.id, v.voter_name, v.score
  FROM song_2_5_19,
  (VALUES ('Hernan', 8.0), ('Daniel', 7.0), ('Jorge A.', 6.5), ('Carlos', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, set_2_6 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 6, 'Set Mauricio' FROM s2
  RETURNING id
)
, song_2_6_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'Black Rebel Motorcycle Club', 'Love burns' FROM set_2_6
  RETURNING id
)
, votes_2_6_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_6_0.id, v.voter_name, v.score
  FROM song_2_6_0,
  (VALUES ('Hernan', 6.5), ('Mario', 7.0), ('Carlos', 7.5), ('Giusse', 8.0), ('Mauricio R.', 9.0), ('Lucho', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_6_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'Campo de Almas', 'Cuando pienso y estoy solo' FROM set_2_6
  RETURNING id
)
, votes_2_6_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_6_1.id, v.voter_name, v.score
  FROM song_2_6_1,
  (VALUES ('Hernan', 6.0), ('Mario', 7.5), ('Carlos', 6.0), ('Giusse', 7.0), ('Mauricio R.', 5.0), ('Lucho', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_2_6_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'Disclosure feat|', 'Latch' FROM set_2_6
  RETURNING id
)
, votes_2_6_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_6_2.id, v.voter_name, v.score
  FROM song_2_6_2,
  (VALUES ('Hernan', 8.5), ('Mario', 9.0), ('Carlos', 9.0), ('Giusse', 8.5), ('Mauricio R.', 8.5), ('Lucho', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_6_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Goo Goo Dolls', 'Iris' FROM set_2_6
  RETURNING id
)
, votes_2_6_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_6_3.id, v.voter_name, v.score
  FROM song_2_6_3,
  (VALUES ('Hernan', 7.5), ('Mario', 8.0), ('Carlos', 7.5), ('Giusse', 8.0), ('Mauricio R.', 7.0), ('Lucho', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_6_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'Good Charlotte', 'Lifestyle of the rich and the famous' FROM set_2_6
  RETURNING id
)
, votes_2_6_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_6_4.id, v.voter_name, v.score
  FROM song_2_6_4,
  (VALUES ('Hernan', 7.5), ('Mario', 7.0), ('Carlos', 7.0), ('Giusse', 7.0), ('Mauricio R.', 6.5), ('Lucho', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_2_6_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'Green Day', 'Scattered' FROM set_2_6
  RETURNING id
)
, votes_2_6_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_6_5.id, v.voter_name, v.score
  FROM song_2_6_5,
  (VALUES ('Hernan', 8.0), ('Mario', 8.0), ('Carlos', 8.0), ('Giusse', 7.5), ('Mauricio R.', 8.5), ('Lucho', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_6_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'Madeon', 'Finale' FROM set_2_6
  RETURNING id
)
, votes_2_6_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_6_6.id, v.voter_name, v.score
  FROM song_2_6_6,
  (VALUES ('Hernan', 8.5), ('Mario', 8.0), ('Carlos', 7.5), ('Giusse', 8.0), ('Mauricio R.', 8.0), ('Lucho', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_6_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'Primal Scream', 'Some velvet morning' FROM set_2_6
  RETURNING id
)
, votes_2_6_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_6_7.id, v.voter_name, v.score
  FROM song_2_6_7,
  (VALUES ('Hernan', 8.5), ('Mario', 7.5), ('Carlos', 9.0), ('Giusse', 7.5), ('Mauricio R.', 7.5), ('Lucho', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_2_6_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'Red hot chili peppers', 'Love rollercoaster' FROM set_2_6
  RETURNING id
)
, votes_2_6_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_6_8.id, v.voter_name, v.score
  FROM song_2_6_8,
  (VALUES ('Hernan', 7.0), ('Mario', 7.0), ('Carlos', 6.5), ('Giusse', 7.5), ('Mauricio R.', 7.5), ('Lucho', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_6_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'Robbie Williams', 'Supreme' FROM set_2_6
  RETURNING id
)
, votes_2_6_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_6_9.id, v.voter_name, v.score
  FROM song_2_6_9,
  (VALUES ('Hernan', 6.0), ('Mario', 7.5), ('Carlos', 9.0), ('Giusse', 7.0), ('Mauricio R.', 5.0), ('Lucho', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_6_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'Soda Stereo', 'Sobredosis de TV' FROM set_2_6
  RETURNING id
)
, votes_2_6_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_6_10.id, v.voter_name, v.score
  FROM song_2_6_10,
  (VALUES ('Hernan', 8.0), ('Mario', 8.0), ('Carlos', 7.5), ('Giusse', 7.5), ('Mauricio R.', 8.5), ('Lucho', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_6_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'Stillwater', 'You had to be there' FROM set_2_6
  RETURNING id
)
, votes_2_6_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_6_11.id, v.voter_name, v.score
  FROM song_2_6_11,
  (VALUES ('Hernan', 8.0), ('Mario', 7.5), ('Carlos', 7.0), ('Giusse', 7.0), ('Mauricio R.', 8.0), ('Lucho', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_6_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'The Drums', 'How it ended' FROM set_2_6
  RETURNING id
)
, votes_2_6_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_6_12.id, v.voter_name, v.score
  FROM song_2_6_12,
  (VALUES ('Hernan', 8.0), ('Mario', 7.0), ('Carlos', 8.0), ('Giusse', 8.5), ('Mauricio R.', 8.5), ('Lucho', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_2_6_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'The Jam', 'Town called malice' FROM set_2_6
  RETURNING id
)
, votes_2_6_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_6_13.id, v.voter_name, v.score
  FROM song_2_6_13,
  (VALUES ('Hernan', 7.5), ('Mario', 5.0), ('Carlos', 7.5), ('Giusse', 8.0), ('Mauricio R.', 6.0), ('Lucho', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_6_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'The Offspring', 'Hit that' FROM set_2_6
  RETURNING id
)
, votes_2_6_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_6_14.id, v.voter_name, v.score
  FROM song_2_6_14,
  (VALUES ('Hernan', 8.0), ('Mario', 7.0), ('Carlos', 7.0), ('Giusse', 6.5), ('Mauricio R.', 8.5), ('Lucho', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_2_6_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'The Proclaimers', 'I´m gonna be (500 miles)' FROM set_2_6
  RETURNING id
)
, votes_2_6_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_6_15.id, v.voter_name, v.score
  FROM song_2_6_15,
  (VALUES ('Hernan', 7.0), ('Mario', 8.0), ('Carlos', 8.0), ('Giusse', 8.0), ('Mauricio R.', 8.0), ('Lucho', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_6_16 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 16, 'The Strokes', '' FROM set_2_6
  RETURNING id
)
, votes_2_6_16 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_6_16.id, v.voter_name, v.score
  FROM song_2_6_16,
  (VALUES ('Hernan', 8.0), ('Mario', 7.0), ('Carlos', 7.0), ('Giusse', 7.5), ('Mauricio R.', 7.5), ('Lucho', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_6_17 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 17, 'The Vaccines', 'Melody calling' FROM set_2_6
  RETURNING id
)
, votes_2_6_17 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_6_17.id, v.voter_name, v.score
  FROM song_2_6_17,
  (VALUES ('Hernan', 8.5), ('Mario', 7.5), ('Carlos', 7.5), ('Giusse', 8.5), ('Mauricio R.', 7.0), ('Lucho', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_6_18 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 18, 'Weezer', 'Buddy holly' FROM set_2_6
  RETURNING id
)
, votes_2_6_18 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_6_18.id, v.voter_name, v.score
  FROM song_2_6_18,
  (VALUES ('Hernan', 6.0), ('Mario', 6.0), ('Carlos', 6.5), ('Giusse', 6.0), ('Mauricio R.', 8.0), ('Lucho', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_6_19 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 19, 'White Stripes', 'Seven nation army' FROM set_2_6
  RETURNING id
)
, votes_2_6_19 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_6_19.id, v.voter_name, v.score
  FROM song_2_6_19,
  (VALUES ('Hernan', 7.5), ('Mario', 8.5), ('Carlos', 8.0), ('Giusse', 7.5), ('Mauricio R.', 8.0), ('Lucho', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, set_2_7 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 7, 'Set Rafael' FROM s2
  RETURNING id
)
, song_2_7_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'Bose', 'Gulliver' FROM set_2_7
  RETURNING id
)
, votes_2_7_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_7_0.id, v.voter_name, v.score
  FROM song_2_7_0,
  (VALUES ('Jose J', 6.5), ('Hernan', 8.0), ('Daniel', 7.5), ('Carlos', 9.5), ('Mauricio O.', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_7_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'Bryan Ferry', 'Avalon' FROM set_2_7
  RETURNING id
)
, votes_2_7_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_7_1.id, v.voter_name, v.score
  FROM song_2_7_1,
  (VALUES ('Jose J', 7.0), ('Hernan', 7.0), ('Daniel', 7.0), ('Carlos', 7.0), ('Mauricio O.', 5.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_7_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'Coldplay', 'Lovers in Japan' FROM set_2_7
  RETURNING id
)
, votes_2_7_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_7_2.id, v.voter_name, v.score
  FROM song_2_7_2,
  (VALUES ('Jose J', 8.0), ('Hernan', 8.5), ('Daniel', 7.5), ('Carlos', 8.5), ('Mauricio O.', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_7_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Deep Purple', 'Child in time' FROM set_2_7
  RETURNING id
)
, votes_2_7_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_7_3.id, v.voter_name, v.score
  FROM song_2_7_3,
  (VALUES ('Jose J', 8.5), ('Hernan', 8.0), ('Daniel', 7.5), ('Carlos', 9.0), ('Mauricio O.', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_7_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'Dire Straits', 'Money for nothing' FROM set_2_7
  RETURNING id
)
, votes_2_7_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_7_4.id, v.voter_name, v.score
  FROM song_2_7_4,
  (VALUES ('Jose J', 7.5), ('Hernan', 8.5), ('Daniel', 7.5), ('Carlos', 7.5), ('Mauricio O.', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_7_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'Eric Clapton', 'Pilgrim' FROM set_2_7
  RETURNING id
)
, votes_2_7_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_7_5.id, v.voter_name, v.score
  FROM song_2_7_5,
  (VALUES ('Jose J', 5.0), ('Hernan', 8.0), ('Daniel', 6.5), ('Carlos', 5.0), ('Mauricio O.', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_7_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'Manolo Garcia', 'Pajaros de Barro' FROM set_2_7
  RETURNING id
)
, votes_2_7_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_7_6.id, v.voter_name, v.score
  FROM song_2_7_6,
  (VALUES ('Jose J', 7.0), ('Hernan', 8.0), ('Daniel', 7.0), ('Carlos', 6.5), ('Mauricio O.', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_7_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'OBK', 'Nada es para siempre' FROM set_2_7
  RETURNING id
)
, votes_2_7_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_7_7.id, v.voter_name, v.score
  FROM song_2_7_7,
  (VALUES ('Jose J', 6.5), ('Hernan', 8.0), ('Daniel', 7.0), ('Carlos', 8.0), ('Mauricio O.', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_7_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'Path Methiny', 'The sound of silence' FROM set_2_7
  RETURNING id
)
, votes_2_7_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_7_8.id, v.voter_name, v.score
  FROM song_2_7_8,
  (VALUES ('Jose J', 6.5), ('Hernan', 7.0), ('Daniel', 6.0), ('Carlos', 7.0), ('Mauricio O.', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_7_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'Pet Shop Boys', '(Behaviour) My October Symphony' FROM set_2_7
  RETURNING id
)
, votes_2_7_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_7_9.id, v.voter_name, v.score
  FROM song_2_7_9,
  (VALUES ('Jose J', 7.5), ('Hernan', 8.0), ('Daniel', 8.0), ('Carlos', 8.0), ('Mauricio O.', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_7_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'R.E.M', 'Living well is the best runge' FROM set_2_7
  RETURNING id
)
, votes_2_7_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_7_10.id, v.voter_name, v.score
  FROM song_2_7_10,
  (VALUES ('Jose J', 7.5), ('Hernan', 8.5), ('Daniel', 8.0), ('Carlos', 9.0), ('Mauricio O.', 9.5)) AS v(voter_name, score)
  RETURNING id
)
, song_2_7_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'Sabina y Serrat', 'Mas de 100 mentiras' FROM set_2_7
  RETURNING id
)
, votes_2_7_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_7_11.id, v.voter_name, v.score
  FROM song_2_7_11,
  (VALUES ('Jose J', 5.0), ('Hernan', 9.0), ('Daniel', 7.5), ('Carlos', 9.0), ('Mauricio O.', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_7_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'Serrat', 'Meditarreneo' FROM set_2_7
  RETURNING id
)
, votes_2_7_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_7_12.id, v.voter_name, v.score
  FROM song_2_7_12,
  (VALUES ('Jose J', 4.5), ('Hernan', 7.5), ('Daniel', 6.0), ('Carlos', 7.0), ('Mauricio O.', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_7_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'Simpleminds', 'Waterfront' FROM set_2_7
  RETURNING id
)
, votes_2_7_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_7_13.id, v.voter_name, v.score
  FROM song_2_7_13,
  (VALUES ('Jose J', 6.5), ('Hernan', 7.5), ('Daniel', 7.0), ('Carlos', 7.0), ('Mauricio O.', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_7_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'Tears for Fears', 'Woman in change' FROM set_2_7
  RETURNING id
)
, votes_2_7_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_7_14.id, v.voter_name, v.score
  FROM song_2_7_14,
  (VALUES ('Jose J', 7.5), ('Hernan', 9.0), ('Daniel', 7.0), ('Carlos', 7.0), ('Mauricio O.', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_7_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'The Alan Parsons Project', 'Eye in the Sky' FROM set_2_7
  RETURNING id
)
, votes_2_7_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_7_15.id, v.voter_name, v.score
  FROM song_2_7_15,
  (VALUES ('Jose J', 8.0), ('Hernan', 9.5), ('Daniel', 7.5), ('Carlos', 9.5), ('Mauricio O.', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_7_16 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 16, 'The Cranberries', 'Salvation' FROM set_2_7
  RETURNING id
)
, votes_2_7_16 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_7_16.id, v.voter_name, v.score
  FROM song_2_7_16,
  (VALUES ('Jose J', 4.0), ('Hernan', 8.0), ('Daniel', 6.5), ('Carlos', 6.0), ('Mauricio O.', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_7_17 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 17, 'The Rolling Stones', 'Wild Horses' FROM set_2_7
  RETURNING id
)
, votes_2_7_17 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_7_17.id, v.voter_name, v.score
  FROM song_2_7_17,
  (VALUES ('Jose J', 8.5), ('Hernan', 8.5), ('Daniel', 7.5), ('Carlos', 9.0), ('Mauricio O.', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_7_18 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 18, 'U2', 'No line on the horizon' FROM set_2_7
  RETURNING id
)
, votes_2_7_18 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_7_18.id, v.voter_name, v.score
  FROM song_2_7_18,
  (VALUES ('Jose J', 8.0), ('Hernan', 8.0), ('Daniel', 6.5), ('Carlos', 8.0), ('Mauricio O.', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_2_7_19 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 19, 'Yes', 'Roundabout' FROM set_2_7
  RETURNING id
)
, votes_2_7_19 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_2_7_19.id, v.voter_name, v.score
  FROM song_2_7_19,
  (VALUES ('Jose J', 6.0), ('Hernan', 8.0), ('Daniel', 6.5), ('Carlos', 6.0), ('Mauricio O.', 6.0)) AS v(voter_name, score)
  RETURNING id
)
SELECT id FROM s2;

WITH s3 AS (
  INSERT INTO cyc_sessions (session_num, host, date, attendees, input_mode, sets_count, songs_count, complete)
  VALUES (3, 'Temporada 3', '2023-09-01', ARRAY["Carlos", "Daniel", "Francisco", "Freddy", "Gino", "Giusse", "Hernan", "Jorge A.", "Jose J", "Lucho", "Mario", "Mauricio O."]::text[], 'host', 8, 20, true)
  RETURNING id
)
, set_3_0 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 0, 'Set Carlos' FROM s3
  RETURNING id
)
, song_3_0_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'Black', 'Wonderful Life' FROM set_3_0
  RETURNING id
)
, votes_3_0_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_0_0.id, v.voter_name, v.score
  FROM song_3_0_0,
  (VALUES ('Francisco', 7.0), ('Mario', 9.0), ('Daniel', 8.0), ('Jorge A.', 7.5), ('Giusse', 5.0), ('Mauricio O.', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_0_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'Blondie', 'Call Me (Original 12" Mix) [Remastered 1999]' FROM set_3_0
  RETURNING id
)
, votes_3_0_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_0_1.id, v.voter_name, v.score
  FROM song_3_0_1,
  (VALUES ('Francisco', 7.0), ('Mario', 7.5), ('Daniel', 8.0), ('Jorge A.', 8.0), ('Giusse', 9.0), ('Mauricio O.', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_3_0_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'Cetu Javu', 'Adonde' FROM set_3_0
  RETURNING id
)
, votes_3_0_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_0_2.id, v.voter_name, v.score
  FROM song_3_0_2,
  (VALUES ('Francisco', 5.5), ('Mario', 8.0), ('Daniel', 6.5), ('Jorge A.', 8.5), ('Giusse', 7.0), ('Mauricio O.', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_0_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Citizens!', 'True Romance' FROM set_3_0
  RETURNING id
)
, votes_3_0_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_0_3.id, v.voter_name, v.score
  FROM song_3_0_3,
  (VALUES ('Francisco', 7.0), ('Mario', 7.5), ('Daniel', 6.5), ('Jorge A.', 7.0), ('Giusse', 6.0), ('Mauricio O.', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_0_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'David Bowie', 'Starman' FROM set_3_0
  RETURNING id
)
, votes_3_0_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_0_4.id, v.voter_name, v.score
  FROM song_3_0_4,
  (VALUES ('Francisco', 7.0), ('Mario', 7.5), ('Daniel', 6.0), ('Jorge A.', 7.0), ('Giusse', 7.0), ('Mauricio O.', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_0_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'Electric Light Orchestra', 'Ticket To The Moon' FROM set_3_0
  RETURNING id
)
, votes_3_0_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_0_5.id, v.voter_name, v.score
  FROM song_3_0_5,
  (VALUES ('Francisco', 5.5), ('Mario', 8.5), ('Daniel', 8.5), ('Jorge A.', 6.5), ('Giusse', 7.0), ('Mauricio O.', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_3_0_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'Faded Paper Figures', 'San Narciso' FROM set_3_0
  RETURNING id
)
, votes_3_0_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_0_6.id, v.voter_name, v.score
  FROM song_3_0_6,
  (VALUES ('Francisco', 7.0), ('Mario', 6.5), ('Daniel', 5.5), ('Jorge A.', 7.0), ('Giusse', 5.0), ('Mauricio O.', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_3_0_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'Fiction Factory', '(Feels Like) Heaven' FROM set_3_0
  RETURNING id
)
, votes_3_0_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_0_7.id, v.voter_name, v.score
  FROM song_3_0_7,
  (VALUES ('Francisco', 8.5), ('Mario', 8.5), ('Daniel', 8.5), ('Jorge A.', 7.5), ('Giusse', 7.0), ('Mauricio O.', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_0_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'Golden Earring', 'Radar Love' FROM set_3_0
  RETURNING id
)
, votes_3_0_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_0_8.id, v.voter_name, v.score
  FROM song_3_0_8,
  (VALUES ('Francisco', 8.5), ('Mario', 8.0), ('Daniel', 8.5), ('Jorge A.', 8.5), ('Giusse', 9.0), ('Mauricio O.', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_3_0_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'Holy Ghost!', 'Okay' FROM set_3_0
  RETURNING id
)
, votes_3_0_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_0_9.id, v.voter_name, v.score
  FROM song_3_0_9,
  (VALUES ('Francisco', 7.5), ('Mario', 8.0), ('Daniel', 7.5), ('Jorge A.', 7.0), ('Giusse', 7.5), ('Mauricio O.', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_3_0_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'Koudlam', 'See You All' FROM set_3_0
  RETURNING id
)
, votes_3_0_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_0_10.id, v.voter_name, v.score
  FROM song_3_0_10,
  (VALUES ('Francisco', 5.0), ('Mario', 7.5), ('Daniel', 6.5), ('Jorge A.', 6.5), ('Giusse', 7.0), ('Mauricio O.', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_3_0_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'Mike Doughty', 'The Idiot Kings' FROM set_3_0
  RETURNING id
)
, votes_3_0_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_0_11.id, v.voter_name, v.score
  FROM song_3_0_11,
  (VALUES ('Francisco', 6.0), ('Mario', 7.5), ('Daniel', 6.5), ('Jorge A.', 7.0), ('Giusse', 6.5), ('Mauricio O.', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_3_0_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'Modern English', 'I Melt With You (7" Mix)' FROM set_3_0
  RETURNING id
)
, votes_3_0_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_0_12.id, v.voter_name, v.score
  FROM song_3_0_12,
  (VALUES ('Francisco', 6.5), ('Mario', 8.0), ('Daniel', 7.5), ('Jorge A.', 8.0), ('Giusse', 7.0), ('Mauricio O.', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_3_0_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'Placebo', 'Loud Like Love' FROM set_3_0
  RETURNING id
)
, votes_3_0_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_0_13.id, v.voter_name, v.score
  FROM song_3_0_13,
  (VALUES ('Francisco', 9.0), ('Mario', 9.0), ('Daniel', 8.0), ('Jorge A.', 7.0), ('Giusse', 8.0), ('Mauricio O.', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_0_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'Roy Orbison', 'Crying' FROM set_3_0
  RETURNING id
)
, votes_3_0_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_0_14.id, v.voter_name, v.score
  FROM song_3_0_14,
  (VALUES ('Francisco', 7.0), ('Mario', 7.5), ('Daniel', 9.0), ('Jorge A.', 6.0), ('Giusse', 8.5), ('Mauricio O.', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_3_0_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'Spandau Ballet', 'Gold (12'''' Mix)' FROM set_3_0
  RETURNING id
)
, votes_3_0_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_0_15.id, v.voter_name, v.score
  FROM song_3_0_15,
  (VALUES ('Francisco', 6.5), ('Mario', 8.5), ('Daniel', 9.0), ('Jorge A.', 7.5), ('Giusse', 9.0), ('Mauricio O.', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_0_16 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 16, 'Sui Generis', 'Tribulaciones, Lamento Y Ocaso De Un Tonto Rey Imaginario O No' FROM set_3_0
  RETURNING id
)
, votes_3_0_16 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_0_16.id, v.voter_name, v.score
  FROM song_3_0_16,
  (VALUES ('Mario', 9.0), ('Daniel', 6.5), ('Jorge A.', 7.0), ('Giusse', 5.0), ('Mauricio O.', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_0_17 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 17, 'The Kinks', '(Don''t) Forget To Dance' FROM set_3_0
  RETURNING id
)
, votes_3_0_17 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_0_17.id, v.voter_name, v.score
  FROM song_3_0_17,
  (VALUES ('Francisco', 8.5), ('Mario', 8.5), ('Daniel', 7.0), ('Jorge A.', 7.0), ('Giusse', 9.5), ('Mauricio O.', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_3_0_18 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 18, 'The Moody Blues', 'Nights In White Satin' FROM set_3_0
  RETURNING id
)
, votes_3_0_18 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_0_18.id, v.voter_name, v.score
  FROM song_3_0_18,
  (VALUES ('Francisco', 9.5), ('Mario', 8.0), ('Daniel', 8.5), ('Jorge A.', 7.5), ('Giusse', 10.0), ('Mauricio O.', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_0_19 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 19, 'The Who', 'Behind Blue Eyes' FROM set_3_0
  RETURNING id
)
, votes_3_0_19 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_0_19.id, v.voter_name, v.score
  FROM song_3_0_19,
  (VALUES ('Francisco', 7.5), ('Mario', 8.0), ('Daniel', 9.0), ('Jorge A.', 8.0), ('Giusse', 6.0), ('Mauricio O.', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, set_3_1 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 1, 'Set Daniel' FROM s3
  RETURNING id
)
, song_3_1_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'Aerosmith', 'Janies got a gun' FROM set_3_1
  RETURNING id
)
, votes_3_1_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_1_0.id, v.voter_name, v.score
  FROM song_3_1_0,
  (VALUES ('Jose J', 8.0), ('Mario', 8.5), ('Carlos', 7.5), ('Giusse', 8.0), ('Mauricio O.', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_1_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'Aerosmith', 'What it takes' FROM set_3_1
  RETURNING id
)
, votes_3_1_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_1_1.id, v.voter_name, v.score
  FROM song_3_1_1,
  (VALUES ('Jose J', 8.0), ('Mario', 8.5), ('Carlos', 6.0), ('Giusse', 8.5), ('Mauricio O.', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_1_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'Bon Jovi', 'Runaway' FROM set_3_1
  RETURNING id
)
, votes_3_1_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_1_2.id, v.voter_name, v.score
  FROM song_3_1_2,
  (VALUES ('Jose J', 7.0), ('Mario', 8.5), ('Carlos', 6.5), ('Giusse', 6.5), ('Mauricio O.', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_1_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Bryan adams', 'Somebody' FROM set_3_1
  RETURNING id
)
, votes_3_1_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_1_3.id, v.voter_name, v.score
  FROM song_3_1_3,
  (VALUES ('Jose J', 6.0), ('Mario', 6.0), ('Carlos', 7.0), ('Giusse', 7.0), ('Mauricio O.', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_3_1_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'Foo fighters', 'Learn to fly' FROM set_3_1
  RETURNING id
)
, votes_3_1_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_1_4.id, v.voter_name, v.score
  FROM song_3_1_4,
  (VALUES ('Jose J', 9.0), ('Mario', 7.0), ('Carlos', 6.0), ('Giusse', 8.0), ('Mauricio O.', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_1_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'Guns N'' Roses', 'November rain' FROM set_3_1
  RETURNING id
)
, votes_3_1_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_1_5.id, v.voter_name, v.score
  FROM song_3_1_5,
  (VALUES ('Jose J', 9.5), ('Mario', 9.5), ('Carlos', 8.5), ('Giusse', 8.0), ('Mauricio O.', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_1_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'Guns N'' Roses', 'Patience' FROM set_3_1
  RETURNING id
)
, votes_3_1_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_1_6.id, v.voter_name, v.score
  FROM song_3_1_6,
  (VALUES ('Jose J', 8.0), ('Mario', 8.0), ('Carlos', 7.0), ('Giusse', 7.5), ('Mauricio O.', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_1_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'Katy Perry', 'hot and cold' FROM set_3_1
  RETURNING id
)
, votes_3_1_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_1_7.id, v.voter_name, v.score
  FROM song_3_1_7,
  (VALUES ('Jose J', 7.5), ('Mario', 7.5), ('Carlos', 9.0), ('Giusse', 7.0), ('Mauricio O.', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_1_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'Lady gaga', 'Telephone' FROM set_3_1
  RETURNING id
)
, votes_3_1_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_1_8.id, v.voter_name, v.score
  FROM song_3_1_8,
  (VALUES ('Jose J', 4.5), ('Mario', 6.0), ('Carlos', 7.5), ('Giusse', 6.0), ('Mauricio O.', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_1_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'LMFO', 'Im sexi and i know it' FROM set_3_1
  RETURNING id
)
, votes_3_1_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_1_9.id, v.voter_name, v.score
  FROM song_3_1_9,
  (VALUES ('Jose J', 7.5), ('Mario', 7.0), ('Carlos', 8.0), ('Giusse', 8.0), ('Mauricio O.', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_1_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'Meatloaf', 'I ´do anything for love (but i wont do that)' FROM set_3_1
  RETURNING id
)
, votes_3_1_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_1_10.id, v.voter_name, v.score
  FROM song_3_1_10,
  (VALUES ('Jose J', 6.0), ('Mario', 8.0), ('Carlos', 7.0), ('Giusse', 8.0), ('Mauricio O.', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_1_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'Ray Parker Jr', 'Ghostbusters' FROM set_3_1
  RETURNING id
)
, votes_3_1_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_1_11.id, v.voter_name, v.score
  FROM song_3_1_11,
  (VALUES ('Jose J', 3.0), ('Mario', 6.0), ('Carlos', 7.5), ('Giusse', 6.0), ('Mauricio O.', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_1_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'Red hot chili peppers', 'Snow' FROM set_3_1
  RETURNING id
)
, votes_3_1_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_1_12.id, v.voter_name, v.score
  FROM song_3_1_12,
  (VALUES ('Jose J', 7.5), ('Mario', 8.5), ('Carlos', 8.5), ('Giusse', 8.0), ('Mauricio O.', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_1_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'Robin Thicke', 'Blurred lines' FROM set_3_1
  RETURNING id
)
, votes_3_1_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_1_13.id, v.voter_name, v.score
  FROM song_3_1_13,
  (VALUES ('Jose J', 6.5), ('Mario', 8.0), ('Carlos', 8.0), ('Giusse', 9.0), ('Mauricio O.', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_1_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'Roxette', 'Dangerous' FROM set_3_1
  RETURNING id
)
, votes_3_1_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_1_14.id, v.voter_name, v.score
  FROM song_3_1_14,
  (VALUES ('Jose J', 6.5), ('Mario', 6.0), ('Carlos', 7.0), ('Giusse', 6.5), ('Mauricio O.', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_1_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'The Killers', 'Mr brigthside' FROM set_3_1
  RETURNING id
)
, votes_3_1_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_1_15.id, v.voter_name, v.score
  FROM song_3_1_15,
  (VALUES ('Jose J', 8.0), ('Mario', 8.0), ('Carlos', 9.0), ('Giusse', 8.0), ('Mauricio O.', 10.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_1_16 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 16, 'The Offspring', 'The kids arent right' FROM set_3_1
  RETURNING id
)
, votes_3_1_16 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_1_16.id, v.voter_name, v.score
  FROM song_3_1_16,
  (VALUES ('Jose J', 8.0), ('Mario', 6.0), ('Carlos', 8.0), ('Giusse', 7.0), ('Mauricio O.', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_1_17 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 17, 'The Offspring', 'Pretty fly' FROM set_3_1
  RETURNING id
)
, votes_3_1_17 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_1_17.id, v.voter_name, v.score
  FROM song_3_1_17,
  (VALUES ('Jose J', 6.5), ('Mario', 7.0), ('Carlos', 7.0), ('Giusse', 7.5), ('Mauricio O.', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_1_18 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 18, 'Toto', 'hold the line' FROM set_3_1
  RETURNING id
)
, votes_3_1_18 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_1_18.id, v.voter_name, v.score
  FROM song_3_1_18,
  (VALUES ('Jose J', 6.5), ('Mario', 7.0), ('Carlos', 8.0), ('Giusse', 7.0), ('Mauricio O.', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_1_19 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 19, 'Whitesnake', 'Here i go again' FROM set_3_1
  RETURNING id
)
, votes_3_1_19 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_1_19.id, v.voter_name, v.score
  FROM song_3_1_19,
  (VALUES ('Jose J', 9.0), ('Mario', 7.0), ('Carlos', 8.0), ('Giusse', 7.5), ('Mauricio O.', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, set_3_2 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 2, 'Set Giusse' FROM s3
  RETURNING id
)
, song_3_2_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'Almendra', 'Muchacha (ojos de papel)' FROM set_3_2
  RETURNING id
)
, votes_3_2_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_2_0.id, v.voter_name, v.score
  FROM song_3_2_0,
  (VALUES ('Jose J', 6.5), ('Hernan', 8.0), ('Mario', 8.0), ('Daniel', 6.0), ('Carlos', 7.5), ('Mauricio O.', 9.5), ('Lucho', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_2_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'Andres Cepeda', 'Besos Usados' FROM set_3_2
  RETURNING id
)
, votes_3_2_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_2_1.id, v.voter_name, v.score
  FROM song_3_2_1,
  (VALUES ('Jose J', 3.5), ('Hernan', 5.5), ('Mario', 6.0), ('Daniel', 6.0), ('Carlos', 6.0), ('Mauricio O.', 6.5), ('Lucho', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_2_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'Boston', 'Foreplay/Long Time' FROM set_3_2
  RETURNING id
)
, votes_3_2_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_2_2.id, v.voter_name, v.score
  FROM song_3_2_2,
  (VALUES ('Jose J', 8.0), ('Hernan', 8.5), ('Mario', 6.5), ('Daniel', 7.0), ('Carlos', 7.0), ('Mauricio O.', 7.0), ('Lucho', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_2_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Boz Scaggs', 'Lowdown' FROM set_3_2
  RETURNING id
)
, votes_3_2_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_2_3.id, v.voter_name, v.score
  FROM song_3_2_3,
  (VALUES ('Jose J', 7.0), ('Hernan', 8.0), ('Mario', 8.5), ('Daniel', 7.0), ('Carlos', 7.5), ('Mauricio O.', 7.0), ('Lucho', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_3_2_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'Café Tacuba', 'Quiero Ver' FROM set_3_2
  RETURNING id
)
, votes_3_2_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_2_4.id, v.voter_name, v.score
  FROM song_3_2_4,
  (VALUES ('Jose J', 6.5), ('Hernan', 8.5), ('Mario', 7.0), ('Daniel', 6.5), ('Carlos', 7.5), ('Mauricio O.', 8.0), ('Lucho', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_2_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'Charly Garcia', 'Promesas sobre el bidet' FROM set_3_2
  RETURNING id
)
, votes_3_2_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_2_5.id, v.voter_name, v.score
  FROM song_3_2_5,
  (VALUES ('Jose J', 6.0), ('Hernan', 8.0), ('Mario', 7.0), ('Daniel', 7.0), ('Carlos', 7.0), ('Mauricio O.', 8.0), ('Lucho', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_2_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'Donald Fagen', 'The goodbye look' FROM set_3_2
  RETURNING id
)
, votes_3_2_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_2_6.id, v.voter_name, v.score
  FROM song_3_2_6,
  (VALUES ('Jose J', 5.0), ('Hernan', 7.0), ('Mario', 7.0), ('Daniel', 6.5), ('Carlos', 6.0), ('Mauricio O.', 6.5), ('Lucho', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_2_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'George Michael', 'Fast Love' FROM set_3_2
  RETURNING id
)
, votes_3_2_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_2_7.id, v.voter_name, v.score
  FROM song_3_2_7,
  (VALUES ('Jose J', 7.0), ('Mario', 8.0), ('Daniel', 6.5), ('Carlos', 7.5), ('Mauricio O.', 8.0), ('Lucho', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_2_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'Les Petits Chanteurs de Saint Marc.', 'Vois Sur Tun Chemin' FROM set_3_2
  RETURNING id
)
, votes_3_2_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_2_8.id, v.voter_name, v.score
  FROM song_3_2_8,
  (VALUES ('Jose J', 7.0), ('Hernan', 7.0), ('Mario', 8.0), ('Daniel', 6.0), ('Carlos', 8.5), ('Mauricio O.', 5.0), ('Lucho', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_2_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'madonna', 'Don´t tell me' FROM set_3_2
  RETURNING id
)
, votes_3_2_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_2_9.id, v.voter_name, v.score
  FROM song_3_2_9,
  (VALUES ('Jose J', 6.5), ('Hernan', 7.0), ('Mario', 7.0), ('Daniel', 7.0), ('Carlos', 7.5), ('Mauricio O.', 8.0), ('Lucho', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_2_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'Prefab Sprout', 'Bonny' FROM set_3_2
  RETURNING id
)
, votes_3_2_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_2_10.id, v.voter_name, v.score
  FROM song_3_2_10,
  (VALUES ('Jose J', 7.5), ('Hernan', 8.5), ('Mario', 8.5), ('Daniel', 7.0), ('Carlos', 7.5), ('Mauricio O.', 7.0), ('Lucho', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_2_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'REM', 'Orange Crush' FROM set_3_2
  RETURNING id
)
, votes_3_2_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_2_11.id, v.voter_name, v.score
  FROM song_3_2_11,
  (VALUES ('Jose J', 7.5), ('Hernan', 7.5), ('Mario', 8.5), ('Daniel', 8.0), ('Carlos', 8.0), ('Mauricio O.', 8.0), ('Lucho', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_2_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'Soda Stereo - Cerati', 'Un misil en mi plackard - Unpluged' FROM set_3_2
  RETURNING id
)
, votes_3_2_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_2_12.id, v.voter_name, v.score
  FROM song_3_2_12,
  (VALUES ('Jose J', 7.0), ('Hernan', 8.0), ('Mario', 7.5), ('Daniel', 7.0), ('Carlos', 6.5), ('Mauricio O.', 10.0), ('Lucho', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_2_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'Sonora Poncena - Cheo Feliciano', 'Franqueza cruel' FROM set_3_2
  RETURNING id
)
, votes_3_2_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_2_13.id, v.voter_name, v.score
  FROM song_3_2_13,
  (VALUES ('Jose J', 2.0), ('Hernan', 7.0), ('Mario', 6.5), ('Daniel', 7.0), ('Carlos', 4.0), ('Mauricio O.', 6.5), ('Lucho', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_2_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'The Church', 'Under de Milky Way' FROM set_3_2
  RETURNING id
)
, votes_3_2_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_2_14.id, v.voter_name, v.score
  FROM song_3_2_14,
  (VALUES ('Jose J', 8.5), ('Hernan', 9.0), ('Mario', 8.5), ('Daniel', 7.0), ('Carlos', 9.0), ('Mauricio O.', 8.0), ('Lucho', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_2_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'The Communards', 'Never can say goodbye' FROM set_3_2
  RETURNING id
)
, votes_3_2_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_2_15.id, v.voter_name, v.score
  FROM song_3_2_15,
  (VALUES ('Jose J', 8.0), ('Hernan', 8.5), ('Mario', 8.0), ('Daniel', 8.0), ('Carlos', 9.0), ('Mauricio O.', 8.5), ('Lucho', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_2_16 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 16, 'The Coors', 'Radio' FROM set_3_2
  RETURNING id
)
, votes_3_2_16 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_2_16.id, v.voter_name, v.score
  FROM song_3_2_16,
  (VALUES ('Jose J', 6.0), ('Hernan', 6.5), ('Mario', 7.5), ('Daniel', 7.0), ('Carlos', 6.0), ('Mauricio O.', 6.5), ('Lucho', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_3_2_17 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 17, 'The Righteous Brothers', 'You have lost that lovin’ feelin’' FROM set_3_2
  RETURNING id
)
, votes_3_2_17 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_2_17.id, v.voter_name, v.score
  FROM song_3_2_17,
  (VALUES ('Jose J', 8.0), ('Hernan', 8.5), ('Mario', 7.0), ('Daniel', 7.5), ('Carlos', 8.5), ('Mauricio O.', 7.0), ('Lucho', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_3_2_18 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 18, 'The Rolling Stones', 'She''s so cold' FROM set_3_2
  RETURNING id
)
, votes_3_2_18 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_2_18.id, v.voter_name, v.score
  FROM song_3_2_18,
  (VALUES ('Jose J', 7.5), ('Hernan', 8.0), ('Mario', 9.0), ('Daniel', 8.5), ('Carlos', 9.0), ('Mauricio O.', 8.0), ('Lucho', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_2_19 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 19, 'Yousson n''dour', 'Seven seconds away' FROM set_3_2
  RETURNING id
)
, votes_3_2_19 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_2_19.id, v.voter_name, v.score
  FROM song_3_2_19,
  (VALUES ('Jose J', 7.0), ('Hernan', 8.0), ('Mario', 8.5), ('Daniel', 7.5), ('Carlos', 8.0), ('Mauricio O.', 8.0), ('Lucho', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, set_3_3 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 3, 'Set Hernan' FROM s3
  RETURNING id
)
, song_3_3_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'Chvrches', 'We sink' FROM set_3_3
  RETURNING id
)
, votes_3_3_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_3_0.id, v.voter_name, v.score
  FROM song_3_3_0,
  (VALUES ('Jose J', 6.5), ('Mario', 7.0), ('Carlos', 6.0), ('Mauricio O.', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_3_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'Daft Punk', 'Get Lucky' FROM set_3_3
  RETURNING id
)
, votes_3_3_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_3_1.id, v.voter_name, v.score
  FROM song_3_3_1,
  (VALUES ('Jose J', 6.5), ('Mario', 7.0), ('Carlos', 8.0), ('Mauricio O.', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_3_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'De/Vision', 'Superhuman' FROM set_3_3
  RETURNING id
)
, votes_3_3_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_3_2.id, v.voter_name, v.score
  FROM song_3_3_2,
  (VALUES ('Jose J', 7.0), ('Mario', 7.0), ('Carlos', 7.5), ('Mauricio O.', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_3_3_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Death', 'White Lies' FROM set_3_3
  RETURNING id
)
, votes_3_3_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_3_3.id, v.voter_name, v.score
  FROM song_3_3_3,
  (VALUES ('Jose J', 7.5), ('Mario', 7.5), ('Carlos', 8.5), ('Mauricio O.', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_3_3_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'ELO', 'Secret Messages' FROM set_3_3
  RETURNING id
)
, votes_3_3_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_3_4.id, v.voter_name, v.score
  FROM song_3_3_4,
  (VALUES ('Jose J', 6.0), ('Mario', 6.5), ('Carlos', 7.0), ('Mauricio O.', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_3_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'Frank Sinatra', 'Fly me to the moon' FROM set_3_3
  RETURNING id
)
, votes_3_3_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_3_5.id, v.voter_name, v.score
  FROM song_3_3_5,
  (VALUES ('Jose J', 6.0), ('Mario', 7.0), ('Carlos', 7.0), ('Mauricio O.', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_3_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'Gemini Club', 'Sparklers' FROM set_3_3
  RETURNING id
)
, votes_3_3_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_3_6.id, v.voter_name, v.score
  FROM song_3_3_6,
  (VALUES ('Jose J', 7.0), ('Mario', 6.5), ('Carlos', 8.0), ('Mauricio O.', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_3_3_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'Goldfrapp', 'Strict machine - single mix' FROM set_3_3
  RETURNING id
)
, votes_3_3_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_3_7.id, v.voter_name, v.score
  FROM song_3_3_7,
  (VALUES ('Jose J', 7.5), ('Mario', 7.0), ('Carlos', 8.5), ('Mauricio O.', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_3_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'Jarabe de Palo', 'El lado oscuro' FROM set_3_3
  RETURNING id
)
, votes_3_3_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_3_8.id, v.voter_name, v.score
  FROM song_3_3_8,
  (VALUES ('Jose J', 6.5), ('Mario', 9.0), ('Carlos', 7.5), ('Mauricio O.', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_3_3_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'Jimi Hendrix', 'Voodoo Child' FROM set_3_3
  RETURNING id
)
, votes_3_3_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_3_9.id, v.voter_name, v.score
  FROM song_3_3_9,
  (VALUES ('Jose J', 6.5), ('Mario', 6.0), ('Carlos', 6.0), ('Mauricio O.', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_3_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'Jon & Vangelis', 'State of independence' FROM set_3_3
  RETURNING id
)
, votes_3_3_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_3_10.id, v.voter_name, v.score
  FROM song_3_3_10,
  (VALUES ('Jose J', 8.0), ('Mario', 9.0), ('Carlos', 9.0), ('Mauricio O.', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_3_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'Judas Priest', 'Riding on the wind' FROM set_3_3
  RETURNING id
)
, votes_3_3_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_3_11.id, v.voter_name, v.score
  FROM song_3_3_11,
  (VALUES ('Jose J', 6.0), ('Mario', 7.0), ('Carlos', 5.0), ('Mauricio O.', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_3_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'Lana del Rey', 'Summer Sadness' FROM set_3_3
  RETURNING id
)
, votes_3_3_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_3_12.id, v.voter_name, v.score
  FROM song_3_3_12,
  (VALUES ('Jose J', 7.5), ('Mario', 6.5), ('Carlos', 7.0), ('Mauricio O.', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_3_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'Mecano', 'Boda en Londres' FROM set_3_3
  RETURNING id
)
, votes_3_3_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_3_13.id, v.voter_name, v.score
  FROM song_3_3_13,
  (VALUES ('Jose J', 7.0), ('Mario', 8.0), ('Carlos', 7.0), ('Mauricio O.', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_3_3_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'Roger Hodgson', 'Had a dream' FROM set_3_3
  RETURNING id
)
, votes_3_3_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_3_14.id, v.voter_name, v.score
  FROM song_3_3_14,
  (VALUES ('Jose J', 8.0), ('Mario', 6.5), ('Carlos', 8.0), ('Mauricio O.', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_3_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'The human league', 'Human' FROM set_3_3
  RETURNING id
)
, votes_3_3_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_3_15.id, v.voter_name, v.score
  FROM song_3_3_15,
  (VALUES ('Jose J', 6.0), ('Mario', 6.5), ('Carlos', 6.0), ('Mauricio O.', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_3_16 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 16, 'Two door cinema', 'Next year (RAC remix)' FROM set_3_3
  RETURNING id
)
, votes_3_3_16 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_3_16.id, v.voter_name, v.score
  FROM song_3_3_16,
  (VALUES ('Jose J', 8.0), ('Mario', 8.5), ('Carlos', 9.0), ('Mauricio O.', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_3_17 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 17, 'U2', 'Invisible' FROM set_3_3
  RETURNING id
)
, votes_3_3_17 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_3_17.id, v.voter_name, v.score
  FROM song_3_3_17,
  (VALUES ('Jose J', 8.5), ('Mario', 8.0), ('Carlos', 7.5), ('Mauricio O.', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_3_18 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 18, 'Van McCoy', 'The hustle' FROM set_3_3
  RETURNING id
)
, votes_3_3_18 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_3_18.id, v.voter_name, v.score
  FROM song_3_3_18,
  (VALUES ('Jose J', 7.5), ('Mario', 7.0), ('Carlos', 7.0), ('Mauricio O.', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_3_19 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 19, 'ZZ Top', 'Bad Girl' FROM set_3_3
  RETURNING id
)
, votes_3_3_19 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_3_19.id, v.voter_name, v.score
  FROM song_3_3_19,
  (VALUES ('Jose J', 8.0), ('Mario', 7.0), ('Carlos', 8.0), ('Mauricio O.', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, set_3_4 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 4, 'Set Jorge' FROM s3
  RETURNING id
)
, song_3_4_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, '10 CC', 'Im not in love' FROM set_3_4
  RETURNING id
)
, votes_3_4_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_4_0.id, v.voter_name, v.score
  FROM song_3_4_0,
  (VALUES ('Jose J', 7.5), ('Hernan', 9.0), ('Daniel', 6.0), ('Carlos', 9.0), ('Mauricio O.', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_3_4_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'Bread', 'Guitar man' FROM set_3_4
  RETURNING id
)
, votes_3_4_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_4_1.id, v.voter_name, v.score
  FROM song_3_4_1,
  (VALUES ('Jose J', 8.0), ('Hernan', 8.0), ('Daniel', 6.0), ('Carlos', 8.0), ('Mauricio O.', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_3_4_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'Capital Cities', 'Kangaroo court' FROM set_3_4
  RETURNING id
)
, votes_3_4_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_4_2.id, v.voter_name, v.score
  FROM song_3_4_2,
  (VALUES ('Jose J', 7.0), ('Hernan', 8.0), ('Daniel', 6.5), ('Carlos', 7.0), ('Mauricio O.', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_3_4_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Coldplay', 'Hurts like heaven' FROM set_3_4
  RETURNING id
)
, votes_3_4_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_4_3.id, v.voter_name, v.score
  FROM song_3_4_3,
  (VALUES ('Jose J', 8.0), ('Hernan', 8.5), ('Daniel', 7.0), ('Carlos', 8.0), ('Mauricio O.', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_4_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'Dishwalla', 'Angels or Devils' FROM set_3_4
  RETURNING id
)
, votes_3_4_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_4_4.id, v.voter_name, v.score
  FROM song_3_4_4,
  (VALUES ('Jose J', 8.5), ('Hernan', 8.5), ('Daniel', 6.0), ('Carlos', 8.0), ('Mauricio O.', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_3_4_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'Empire of the sun', 'Walking on a dream' FROM set_3_4
  RETURNING id
)
, votes_3_4_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_4_5.id, v.voter_name, v.score
  FROM song_3_4_5,
  (VALUES ('Jose J', 7.5), ('Hernan', 8.0), ('Daniel', 6.5), ('Carlos', 8.0), ('Mauricio O.', 9.5)) AS v(voter_name, score)
  RETURNING id
)
, song_3_4_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'Garbage', 'Push it' FROM set_3_4
  RETURNING id
)
, votes_3_4_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_4_6.id, v.voter_name, v.score
  FROM song_3_4_6,
  (VALUES ('Jose J', 6.5), ('Hernan', 8.0), ('Daniel', 7.0), ('Carlos', 6.5), ('Mauricio O.', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_4_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'Javiera Mena', 'Luz de Piedra de Luna' FROM set_3_4
  RETURNING id
)
, votes_3_4_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_4_7.id, v.voter_name, v.score
  FROM song_3_4_7,
  (VALUES ('Jose J', 4.0), ('Hernan', 7.5), ('Daniel', 4.5), ('Carlos', 6.5), ('Mauricio O.', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_4_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'Korn', 'Make me bad' FROM set_3_4
  RETURNING id
)
, votes_3_4_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_4_8.id, v.voter_name, v.score
  FROM song_3_4_8,
  (VALUES ('Jose J', 6.5), ('Hernan', 7.5), ('Daniel', 7.0), ('Carlos', 5.0), ('Mauricio O.', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_4_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'Korn', 'Freak on a leash' FROM set_3_4
  RETURNING id
)
, votes_3_4_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_4_9.id, v.voter_name, v.score
  FROM song_3_4_9,
  (VALUES ('Jose J', 5.5), ('Hernan', 7.0), ('Daniel', 4.0), ('Carlos', 6.0), ('Mauricio O.', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_3_4_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'MGMT', 'Electric feel' FROM set_3_4
  RETURNING id
)
, votes_3_4_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_4_10.id, v.voter_name, v.score
  FROM song_3_4_10,
  (VALUES ('Jose J', 5.5), ('Hernan', 6.0), ('Daniel', 7.0), ('Carlos', 7.0), ('Mauricio O.', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_4_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'Neon trees', 'Sleeping with a friend' FROM set_3_4
  RETURNING id
)
, votes_3_4_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_4_11.id, v.voter_name, v.score
  FROM song_3_4_11,
  (VALUES ('Jose J', 7.5), ('Hernan', 6.5), ('Daniel', 6.5), ('Carlos', 7.5), ('Mauricio O.', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_4_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'New Order', 'Vanishing Point' FROM set_3_4
  RETURNING id
)
, votes_3_4_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_4_12.id, v.voter_name, v.score
  FROM song_3_4_12,
  (VALUES ('Jose J', 6.5), ('Hernan', 9.0), ('Daniel', 6.5), ('Carlos', 9.0), ('Mauricio O.', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_4_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'P.O.D.', 'Youth of the Nation' FROM set_3_4
  RETURNING id
)
, votes_3_4_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_4_13.id, v.voter_name, v.score
  FROM song_3_4_13,
  (VALUES ('Jose J', 6.0), ('Hernan', 7.5), ('Daniel', 6.5), ('Carlos', 5.5), ('Mauricio O.', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_4_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'Phoenix', 'Trying to be cool' FROM set_3_4
  RETURNING id
)
, votes_3_4_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_4_14.id, v.voter_name, v.score
  FROM song_3_4_14,
  (VALUES ('Jose J', 6.0), ('Hernan', 6.0), ('Daniel', 6.5), ('Carlos', 5.0), ('Mauricio O.', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_3_4_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'Red hot chili peppers', 'Road Trippin' FROM set_3_4
  RETURNING id
)
, votes_3_4_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_4_15.id, v.voter_name, v.score
  FROM song_3_4_15,
  (VALUES ('Jose J', 6.0), ('Hernan', 8.0), ('Daniel', 6.0), ('Carlos', 6.0), ('Mauricio O.', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_4_16 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 16, 'Savage', 'Don´t cry tonight' FROM set_3_4
  RETURNING id
)
, votes_3_4_16 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_4_16.id, v.voter_name, v.score
  FROM song_3_4_16,
  (VALUES ('Jose J', 6.0), ('Hernan', 8.0), ('Daniel', 6.5), ('Carlos', 8.0), ('Mauricio O.', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_3_4_17 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 17, 'SNDCLSH', 'Thieves' FROM set_3_4
  RETURNING id
)
, votes_3_4_17 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_4_17.id, v.voter_name, v.score
  FROM song_3_4_17,
  (VALUES ('Jose J', 6.5), ('Hernan', 7.5), ('Daniel', 5.0), ('Carlos', 6.5), ('Mauricio O.', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_4_18 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 18, 'Spandau Ballet', 'Only when you leave' FROM set_3_4
  RETURNING id
)
, votes_3_4_18 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_4_18.id, v.voter_name, v.score
  FROM song_3_4_18,
  (VALUES ('Jose J', 6.0), ('Hernan', 7.5), ('Daniel', 6.5), ('Carlos', 7.0), ('Mauricio O.', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_4_19 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 19, 'U2', 'Hold me, Thrill me, Kiss me' FROM set_3_4
  RETURNING id
)
, votes_3_4_19 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_4_19.id, v.voter_name, v.score
  FROM song_3_4_19,
  (VALUES ('Jose J', 7.5), ('Hernan', 8.0), ('Daniel', 7.5), ('Carlos', 7.5), ('Mauricio O.', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, set_3_5 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 5, 'Set Jose Jaime' FROM s3
  RETURNING id
)
, song_3_5_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'Adele', 'Set Fire to The Rain' FROM set_3_5
  RETURNING id
)
, votes_3_5_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_5_0.id, v.voter_name, v.score
  FROM song_3_5_0,
  (VALUES ('Hernan', 8.0), ('Mario', 9.0), ('Daniel', 8.5), ('Carlos', 8.0), ('Freddy', 8.0), ('Mauricio O.', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_5_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'Augusto Polo Campos', 'Cuando llora la Guitarra' FROM set_3_5
  RETURNING id
)
, votes_3_5_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_5_1.id, v.voter_name, v.score
  FROM song_3_5_1,
  (VALUES ('Hernan', 8.0), ('Mario', 8.5), ('Daniel', 7.5), ('Carlos', 9.0), ('Freddy', 9.0), ('Mauricio O.', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_5_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'Elton Jhon', 'Song for Guy' FROM set_3_5
  RETURNING id
)
, votes_3_5_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_5_2.id, v.voter_name, v.score
  FROM song_3_5_2,
  (VALUES ('Hernan', 9.0), ('Mario', 9.0), ('Daniel', 7.5), ('Carlos', 8.5), ('Freddy', 9.5), ('Mauricio O.', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_5_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Fragil', 'Av. Larco' FROM set_3_5
  RETURNING id
)
, votes_3_5_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_5_3.id, v.voter_name, v.score
  FROM song_3_5_3,
  (VALUES ('Hernan', 10.0), ('Mario', 9.0), ('Daniel', 8.0), ('Carlos', 10.0), ('Freddy', 10.0), ('Mauricio O.', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_5_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'Guns N'' Roses', 'Estranged' FROM set_3_5
  RETURNING id
)
, votes_3_5_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_5_4.id, v.voter_name, v.score
  FROM song_3_5_4,
  (VALUES ('Hernan', 8.5), ('Mario', 7.5), ('Daniel', 9.0), ('Carlos', 7.0), ('Freddy', 7.0), ('Mauricio O.', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_5_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'Hoobastan', 'The Reason' FROM set_3_5
  RETURNING id
)
, votes_3_5_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_5_5.id, v.voter_name, v.score
  FROM song_3_5_5,
  (VALUES ('Hernan', 8.5), ('Mario', 7.0), ('Daniel', 9.0), ('Carlos', 8.0), ('Freddy', 8.0), ('Mauricio O.', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_5_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'James', 'Born of Frustration' FROM set_3_5
  RETURNING id
)
, votes_3_5_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_5_6.id, v.voter_name, v.score
  FROM song_3_5_6,
  (VALUES ('Hernan', 7.5), ('Mario', 8.0), ('Daniel', 7.5), ('Carlos', 7.5), ('Freddy', 7.5), ('Mauricio O.', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_5_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'Jean Michel Jarre', 'Oxygene IV' FROM set_3_5
  RETURNING id
)
, votes_3_5_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_5_7.id, v.voter_name, v.score
  FROM song_3_5_7,
  (VALUES ('Hernan', 9.0), ('Mario', 9.0), ('Daniel', 7.5), ('Carlos', 7.0), ('Freddy', 9.0), ('Mauricio O.', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_5_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'Joe Cocker', 'With a Little help from my friends' FROM set_3_5
  RETURNING id
)
, votes_3_5_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_5_8.id, v.voter_name, v.score
  FROM song_3_5_8,
  (VALUES ('Hernan', 8.5), ('Mario', 9.5), ('Daniel', 8.0), ('Carlos', 9.0), ('Freddy', 9.0), ('Mauricio O.', 10.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_5_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'Judas Priest', 'Victim of Changes' FROM set_3_5
  RETURNING id
)
, votes_3_5_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_5_9.id, v.voter_name, v.score
  FROM song_3_5_9,
  (VALUES ('Hernan', 8.5), ('Mario', 7.5), ('Daniel', 8.0), ('Carlos', 6.0), ('Freddy', 8.0), ('Mauricio O.', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_5_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'Lynyrd Skynyrd', 'Sweet Home Alabama' FROM set_3_5
  RETURNING id
)
, votes_3_5_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_5_10.id, v.voter_name, v.score
  FROM song_3_5_10,
  (VALUES ('Hernan', 6.5), ('Mario', 7.0), ('Daniel', 7.5), ('Carlos', 7.5), ('Freddy', 8.0), ('Mauricio O.', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_5_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'Snow Patrol', 'Chasing cars' FROM set_3_5
  RETURNING id
)
, votes_3_5_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_5_11.id, v.voter_name, v.score
  FROM song_3_5_11,
  (VALUES ('Hernan', 9.0), ('Mario', 7.5), ('Daniel', 8.5), ('Carlos', 8.0), ('Freddy', 7.5), ('Mauricio O.', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_3_5_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'Sweet', 'Room Blitz' FROM set_3_5
  RETURNING id
)
, votes_3_5_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_5_12.id, v.voter_name, v.score
  FROM song_3_5_12,
  (VALUES ('Hernan', 8.0), ('Mario', 8.5), ('Daniel', 9.0), ('Carlos', 8.5), ('Freddy', 8.0), ('Mauricio O.', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_3_5_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'The 1975', 'Sex' FROM set_3_5
  RETURNING id
)
, votes_3_5_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_5_13.id, v.voter_name, v.score
  FROM song_3_5_13,
  (VALUES ('Hernan', 7.0), ('Mario', 6.5), ('Daniel', 7.0), ('Carlos', 6.5), ('Freddy', 7.0), ('Mauricio O.', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_5_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'The Black keys', 'Sister' FROM set_3_5
  RETURNING id
)
, votes_3_5_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_5_14.id, v.voter_name, v.score
  FROM song_3_5_14,
  (VALUES ('Hernan', 8.5), ('Mario', 7.0), ('Daniel', 7.0), ('Carlos', 8.5), ('Freddy', 7.5), ('Mauricio O.', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_3_5_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'The Boxer Rebellion', 'Diamonds' FROM set_3_5
  RETURNING id
)
, votes_3_5_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_5_15.id, v.voter_name, v.score
  FROM song_3_5_15,
  (VALUES ('Hernan', 8.5), ('Mario', 8.5), ('Daniel', 7.0), ('Carlos', 7.0), ('Freddy', 7.0), ('Mauricio O.', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_5_16 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 16, 'The Outfiel', 'All The Love' FROM set_3_5
  RETURNING id
)
, votes_3_5_16 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_5_16.id, v.voter_name, v.score
  FROM song_3_5_16,
  (VALUES ('Hernan', 8.0), ('Mario', 8.0), ('Daniel', 7.5), ('Carlos', 8.5), ('Freddy', 8.0), ('Mauricio O.', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_5_17 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 17, 'The Polyphonic Spree', 'Carefull Try' FROM set_3_5
  RETURNING id
)
, votes_3_5_17 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_5_17.id, v.voter_name, v.score
  FROM song_3_5_17,
  (VALUES ('Hernan', 8.5), ('Mario', 7.0), ('Daniel', 6.5), ('Carlos', 8.5), ('Freddy', 7.0), ('Mauricio O.', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_5_18 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 18, 'Tom Petty', 'Free Fallin' FROM set_3_5
  RETURNING id
)
, votes_3_5_18 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_5_18.id, v.voter_name, v.score
  FROM song_3_5_18,
  (VALUES ('Hernan', 7.0), ('Mario', 8.0), ('Daniel', 8.0), ('Carlos', 7.5), ('Freddy', 8.0), ('Mauricio O.', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_5_19 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 19, 'White Lies', 'Getting Even' FROM set_3_5
  RETURNING id
)
, votes_3_5_19 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_5_19.id, v.voter_name, v.score
  FROM song_3_5_19,
  (VALUES ('Hernan', 8.5), ('Mario', 8.5), ('Daniel', 8.0), ('Carlos', 9.0), ('Freddy', 8.0), ('Mauricio O.', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, set_3_6 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 6, 'Set Mauricio' FROM s3
  RETURNING id
)
, song_3_6_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'Arcade Fire', 'Ready to Start' FROM set_3_6
  RETURNING id
)
, votes_3_6_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_6_0.id, v.voter_name, v.score
  FROM song_3_6_0,
  (VALUES ('Mario', 7.0), ('Carlos', 8.5), ('Freddy', 8.0), ('Lucho', 7.0), ('Gino', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_3_6_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'Black Strobe', 'I´m a man' FROM set_3_6
  RETURNING id
)
, votes_3_6_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_6_1.id, v.voter_name, v.score
  FROM song_3_6_1,
  (VALUES ('Mario', 8.5), ('Carlos', 9.0), ('Freddy', 8.0), ('Lucho', 9.0), ('Gino', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_6_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'Cold War Kids', 'First' FROM set_3_6
  RETURNING id
)
, votes_3_6_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_6_2.id, v.voter_name, v.score
  FROM song_3_6_2,
  (VALUES ('Mario', 8.5), ('Carlos', 6.0), ('Freddy', 6.0), ('Lucho', 7.0), ('Gino', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_3_6_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Coldplay', 'A Sky full of Stars' FROM set_3_6
  RETURNING id
)
, votes_3_6_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_6_3.id, v.voter_name, v.score
  FROM song_3_6_3,
  (VALUES ('Mario', 8.0), ('Carlos', 9.0), ('Freddy', 9.0), ('Lucho', 9.0), ('Gino', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_6_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'Empire of the Sun', 'High and Low' FROM set_3_6
  RETURNING id
)
, votes_3_6_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_6_4.id, v.voter_name, v.score
  FROM song_3_6_4,
  (VALUES ('Mario', 8.0), ('Carlos', 7.5), ('Freddy', 7.0), ('Lucho', 7.0), ('Gino', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_6_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'Foster the People', 'Don´t Stop' FROM set_3_6
  RETURNING id
)
, votes_3_6_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_6_5.id, v.voter_name, v.score
  FROM song_3_6_5,
  (VALUES ('Mario', 7.5), ('Carlos', 6.0), ('Freddy', 7.0), ('Lucho', 6.5), ('Gino', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_3_6_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'INXS', 'Suicide blonde' FROM set_3_6
  RETURNING id
)
, votes_3_6_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_6_6.id, v.voter_name, v.score
  FROM song_3_6_6,
  (VALUES ('Mario', 8.5), ('Carlos', 8.0), ('Freddy', 8.0), ('Lucho', 9.0), ('Gino', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_3_6_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'Lenny Kravitz', 'Again' FROM set_3_6
  RETURNING id
)
, votes_3_6_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_6_7.id, v.voter_name, v.score
  FROM song_3_6_7,
  (VALUES ('Mario', 6.5), ('Carlos', 7.0), ('Freddy', 8.0), ('Lucho', 7.5), ('Gino', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_6_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'Leon Bridges', 'Better Man' FROM set_3_6
  RETURNING id
)
, votes_3_6_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_6_8.id, v.voter_name, v.score
  FROM song_3_6_8,
  (VALUES ('Mario', 8.5), ('Carlos', 7.5), ('Freddy', 8.0), ('Lucho', 8.0), ('Gino', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_3_6_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'Mar de Copas', 'Suna' FROM set_3_6
  RETURNING id
)
, votes_3_6_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_6_9.id, v.voter_name, v.score
  FROM song_3_6_9,
  (VALUES ('Mario', 8.5), ('Carlos', 8.0), ('Freddy', 8.0), ('Lucho', 8.0), ('Gino', 5.5)) AS v(voter_name, score)
  RETURNING id
)
, song_3_6_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'New Order', 'Dreams never end' FROM set_3_6
  RETURNING id
)
, votes_3_6_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_6_10.id, v.voter_name, v.score
  FROM song_3_6_10,
  (VALUES ('Mario', 8.5), ('Carlos', 9.0), ('Freddy', 7.0), ('Lucho', 8.0), ('Gino', 9.5)) AS v(voter_name, score)
  RETURNING id
)
, song_3_6_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'Primal Scream', 'Where the Light Gets in' FROM set_3_6
  RETURNING id
)
, votes_3_6_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_6_11.id, v.voter_name, v.score
  FROM song_3_6_11,
  (VALUES ('Mario', 8.5), ('Carlos', 7.5), ('Freddy', 7.0), ('Lucho', 7.5), ('Gino', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_6_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'Rata Blanca', 'Mujer Amante' FROM set_3_6
  RETURNING id
)
, votes_3_6_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_6_12.id, v.voter_name, v.score
  FROM song_3_6_12,
  (VALUES ('Mario', 7.0), ('Carlos', 7.5), ('Freddy', 7.0), ('Lucho', 8.0), ('Gino', 5.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_6_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'Soda Stereo', 'Picnic En El 4°B' FROM set_3_6
  RETURNING id
)
, votes_3_6_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_6_13.id, v.voter_name, v.score
  FROM song_3_6_13,
  (VALUES ('Mario', 7.5), ('Carlos', 6.5), ('Freddy', 8.0), ('Lucho', 7.0), ('Gino', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_3_6_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'Stone Temple Pilots', 'Sour girl' FROM set_3_6
  RETURNING id
)
, votes_3_6_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_6_14.id, v.voter_name, v.score
  FROM song_3_6_14,
  (VALUES ('Mario', 6.5), ('Carlos', 6.0), ('Freddy', 6.0), ('Lucho', 6.5), ('Gino', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_6_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'Supergrass', 'Alright' FROM set_3_6
  RETURNING id
)
, votes_3_6_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_6_15.id, v.voter_name, v.score
  FROM song_3_6_15,
  (VALUES ('Mario', 6.5), ('Carlos', 6.5), ('Freddy', 6.0), ('Lucho', 6.5), ('Gino', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_3_6_16 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 16, 'Tame Impala', 'The less i Know The Better' FROM set_3_6
  RETURNING id
)
, votes_3_6_16 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_6_16.id, v.voter_name, v.score
  FROM song_3_6_16,
  (VALUES ('Mario', 8.5), ('Carlos', 7.0), ('Freddy', 7.0), ('Lucho', 9.0), ('Gino', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_6_17 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 17, 'The Drums', 'Let´s go surfing' FROM set_3_6
  RETURNING id
)
, votes_3_6_17 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_6_17.id, v.voter_name, v.score
  FROM song_3_6_17,
  (VALUES ('Mario', 7.5), ('Carlos', 8.0), ('Freddy', 7.0), ('Lucho', 8.0), ('Gino', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_6_18 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 18, 'The Drums', 'Book of Revelation' FROM set_3_6
  RETURNING id
)
, votes_3_6_18 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_6_18.id, v.voter_name, v.score
  FROM song_3_6_18,
  (VALUES ('Mario', 7.0), ('Carlos', 7.0), ('Freddy', 7.0), ('Lucho', 7.0), ('Gino', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_6_19 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 19, 'The Who', 'My Generation' FROM set_3_6
  RETURNING id
)
, votes_3_6_19 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_6_19.id, v.voter_name, v.score
  FROM song_3_6_19,
  (VALUES ('Mario', 9.0), ('Carlos', 8.0), ('Freddy', 8.0), ('Lucho', 8.5), ('Gino', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, set_3_7 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 7, 'Set Rafael' FROM s3
  RETURNING id
)
, song_3_7_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'Neil Diamond / Barbara Straisand', 'You don`t bring me flower' FROM set_3_7
  RETURNING id
)
, votes_3_7_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_7_0.id, v.voter_name, v.score
  FROM song_3_7_0,
  (VALUES ('Hernan', 5.0), ('Daniel', 5.5), ('Jorge A.', 5.0), ('Carlos', 5.5), ('Giusse', 9.0), ('Mauricio O.', 5.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_7_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'Bob Marley', 'Could you be loved' FROM set_3_7
  RETURNING id
)
, votes_3_7_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_7_1.id, v.voter_name, v.score
  FROM song_3_7_1,
  (VALUES ('Hernan', 7.5), ('Daniel', 7.5), ('Jorge A.', 7.5), ('Carlos', 7.5), ('Giusse', 9.0), ('Mauricio O.', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_3_7_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'Coldplay', 'Postcards from far away / Grass of water' FROM set_3_7
  RETURNING id
)
, votes_3_7_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_7_2.id, v.voter_name, v.score
  FROM song_3_7_2,
  (VALUES ('Hernan', 8.5), ('Daniel', 7.5), ('Jorge A.', 8.0), ('Carlos', 7.5), ('Giusse', 9.0), ('Mauricio O.', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_7_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Deep Purple', 'Shield' FROM set_3_7
  RETURNING id
)
, votes_3_7_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_7_3.id, v.voter_name, v.score
  FROM song_3_7_3,
  (VALUES ('Hernan', 8.0), ('Daniel', 7.0), ('Jorge A.', 8.0), ('Carlos', 7.0), ('Giusse', 7.5), ('Mauricio O.', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_7_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'Diana Krall', 'Peel me a grape' FROM set_3_7
  RETURNING id
)
, votes_3_7_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_7_4.id, v.voter_name, v.score
  FROM song_3_7_4,
  (VALUES ('Hernan', 7.5), ('Daniel', 6.5), ('Jorge A.', 6.5), ('Carlos', 6.0), ('Giusse', 8.5), ('Mauricio O.', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_7_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'Duran Duran', 'Save the player' FROM set_3_7
  RETURNING id
)
, votes_3_7_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_7_5.id, v.voter_name, v.score
  FROM song_3_7_5,
  (VALUES ('Hernan', 9.5), ('Daniel', 8.5), ('Jorge A.', 8.5), ('Carlos', 7.5), ('Giusse', 9.0), ('Mauricio O.', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_7_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'Elvis Presley', 'Thats all right' FROM set_3_7
  RETURNING id
)
, votes_3_7_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_7_6.id, v.voter_name, v.score
  FROM song_3_7_6,
  (VALUES ('Hernan', 6.0), ('Daniel', 6.5), ('Jorge A.', 5.0), ('Carlos', 6.0), ('Giusse', 6.5), ('Mauricio O.', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_7_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'Erick Clapton', 'I Shot the sheriff' FROM set_3_7
  RETURNING id
)
, votes_3_7_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_7_7.id, v.voter_name, v.score
  FROM song_3_7_7,
  (VALUES ('Hernan', 7.5), ('Daniel', 7.0), ('Jorge A.', 8.5), ('Carlos', 7.0), ('Giusse', 9.0), ('Mauricio O.', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_7_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'Frank Sinatra', 'New York' FROM set_3_7
  RETURNING id
)
, votes_3_7_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_7_8.id, v.voter_name, v.score
  FROM song_3_7_8,
  (VALUES ('Hernan', 7.5), ('Daniel', 7.0), ('Jorge A.', 7.5), ('Carlos', 8.0), ('Giusse', 8.0), ('Mauricio O.', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_7_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'James Brown', 'Papa`s got a Brand New Bag (`65)' FROM set_3_7
  RETURNING id
)
, votes_3_7_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_7_9.id, v.voter_name, v.score
  FROM song_3_7_9,
  (VALUES ('Hernan', 8.0), ('Daniel', 6.5), ('Jorge A.', 6.0), ('Carlos', 6.5), ('Giusse', 7.0), ('Mauricio O.', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_7_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'Janis Joplin', 'Piece of my heart (1968)' FROM set_3_7
  RETURNING id
)
, votes_3_7_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_7_10.id, v.voter_name, v.score
  FROM song_3_7_10,
  (VALUES ('Hernan', 7.0), ('Daniel', 6.5), ('Jorge A.', 7.0), ('Carlos', 8.0), ('Giusse', 7.5), ('Mauricio O.', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_7_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'Led Zeppelin', 'Black Dog' FROM set_3_7
  RETURNING id
)
, votes_3_7_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_7_11.id, v.voter_name, v.score
  FROM song_3_7_11,
  (VALUES ('Hernan', 6.5), ('Daniel', 8.0), ('Jorge A.', 7.0), ('Carlos', 7.5), ('Giusse', 7.0), ('Mauricio O.', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_7_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'Mecano', 'Dali' FROM set_3_7
  RETURNING id
)
, votes_3_7_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_7_12.id, v.voter_name, v.score
  FROM song_3_7_12,
  (VALUES ('Hernan', 9.0), ('Daniel', 7.5), ('Jorge A.', 7.0), ('Carlos', 8.5), ('Giusse', 8.5), ('Mauricio O.', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_7_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'New Order', 'Blue Monday (1983)' FROM set_3_7
  RETURNING id
)
, votes_3_7_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_7_13.id, v.voter_name, v.score
  FROM song_3_7_13,
  (VALUES ('Hernan', 9.0), ('Daniel', 8.5), ('Jorge A.', 8.5), ('Carlos', 9.5), ('Giusse', 8.5), ('Mauricio O.', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_7_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'Pet Shop Boys', 'My october Synphony' FROM set_3_7
  RETURNING id
)
, votes_3_7_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_7_14.id, v.voter_name, v.score
  FROM song_3_7_14,
  (VALUES ('Hernan', 9.0), ('Daniel', 8.0), ('Jorge A.', 8.0), ('Carlos', 7.5), ('Giusse', 9.0), ('Mauricio O.', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_7_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'REM', 'Everybody hurts' FROM set_3_7
  RETURNING id
)
, votes_3_7_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_7_15.id, v.voter_name, v.score
  FROM song_3_7_15,
  (VALUES ('Hernan', 8.0), ('Daniel', 8.5), ('Jorge A.', 8.0), ('Carlos', 9.0), ('Giusse', 9.0), ('Mauricio O.', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_7_16 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 16, 'Tears for Fears', 'Woman in chains' FROM set_3_7
  RETURNING id
)
, votes_3_7_16 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_7_16.id, v.voter_name, v.score
  FROM song_3_7_16,
  (VALUES ('Hernan', 9.0), ('Daniel', 8.5), ('Jorge A.', 8.5), ('Carlos', 7.0), ('Giusse', 9.0), ('Mauricio O.', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_7_17 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 17, 'The Beatles', 'I want to hold your hand' FROM set_3_7
  RETURNING id
)
, votes_3_7_17 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_7_17.id, v.voter_name, v.score
  FROM song_3_7_17,
  (VALUES ('Hernan', 7.5), ('Daniel', 7.5), ('Jorge A.', 7.0), ('Carlos', 7.0), ('Giusse', 7.0), ('Mauricio O.', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_7_18 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 18, 'The doors', 'LA Woman' FROM set_3_7
  RETURNING id
)
, votes_3_7_18 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_7_18.id, v.voter_name, v.score
  FROM song_3_7_18,
  (VALUES ('Hernan', 8.5), ('Daniel', 7.0), ('Jorge A.', 7.0), ('Carlos', 8.0), ('Giusse', 8.0), ('Mauricio O.', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_3_7_19 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 19, 'The Jackson 5', 'Shake your Body' FROM set_3_7
  RETURNING id
)
, votes_3_7_19 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_3_7_19.id, v.voter_name, v.score
  FROM song_3_7_19,
  (VALUES ('Hernan', 8.0), ('Daniel', 7.5), ('Jorge A.', 6.5), ('Carlos', 8.0), ('Giusse', 7.5), ('Mauricio O.', 7.0)) AS v(voter_name, score)
  RETURNING id
)
SELECT id FROM s3;

WITH s4 AS (
  INSERT INTO cyc_sessions (session_num, host, date, attendees, input_mode, sets_count, songs_count, complete)
  VALUES (4, 'Temporada 4', '2023-12-01', ARRAY["Carlos", "Daniel", "Giusse", "Hernan", "Jorge A.", "Jose J", "Lucho", "Mario", "Mauricio O.", "Mauricio R."]::text[], 'host', 6, 20, true)
  RETURNING id
)
, set_4_0 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 0, 'Set Carlos' FROM s4
  RETURNING id
)
, song_4_0_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'A Flock of Seagulls', 'Space Age Love Song' FROM set_4_0
  RETURNING id
)
, votes_4_0_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_0_0.id, v.voter_name, v.score
  FROM song_4_0_0,
  (VALUES ('Jose J', 8.5), ('Hernan', 8.5), ('Mario', 8.5), ('Daniel', 7.5), ('Giusse', 8.5), ('Mauricio O.', 7.5), ('Mauricio R.', 6.0), ('Lucho', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_0_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'AC/DC', 'Rock or Bust' FROM set_4_0
  RETURNING id
)
, votes_4_0_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_0_1.id, v.voter_name, v.score
  FROM song_4_0_1,
  (VALUES ('Jose J', 8.5), ('Hernan', 8.5), ('Mario', 8.0), ('Daniel', 8.0), ('Giusse', 8.0), ('Mauricio O.', 8.5), ('Mauricio R.', 7.5), ('Lucho', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_0_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'Danza Invisible', 'Sin Aliento' FROM set_4_0
  RETURNING id
)
, votes_4_0_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_0_2.id, v.voter_name, v.score
  FROM song_4_0_2,
  (VALUES ('Jose J', 7.0), ('Hernan', 7.5), ('Mario', 9.0), ('Daniel', 8.0), ('Giusse', 9.0), ('Mauricio O.', 9.5), ('Mauricio R.', 8.0), ('Lucho', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_0_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Depeche Mode', 'Strangelove [Blind Mix]' FROM set_4_0
  RETURNING id
)
, votes_4_0_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_0_3.id, v.voter_name, v.score
  FROM song_4_0_3,
  (VALUES ('Jose J', 6.5), ('Hernan', 8.0), ('Mario', 8.5), ('Daniel', 7.5), ('Giusse', 7.0), ('Mauricio O.', 8.0), ('Mauricio R.', 6.0), ('Lucho', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_0_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'Depeche Mode / Vcmg (Vince Clarke & Martin Gore)', 'Spock' FROM set_4_0
  RETURNING id
)
, votes_4_0_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_0_4.id, v.voter_name, v.score
  FROM song_4_0_4,
  (VALUES ('Jose J', 8.5), ('Hernan', 9.0), ('Mario', 7.0), ('Daniel', 6.0), ('Giusse', 8.0), ('Mauricio O.', 9.0), ('Mauricio R.', 8.0), ('Lucho', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_0_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'El Columpio Asesino', 'Toro (Kane Remix)' FROM set_4_0
  RETURNING id
)
, votes_4_0_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_0_5.id, v.voter_name, v.score
  FROM song_4_0_5,
  (VALUES ('Jose J', 6.0), ('Hernan', 7.5), ('Mario', 8.5), ('Daniel', 7.0), ('Giusse', 7.5), ('Mauricio O.', 8.0), ('Mauricio R.', 5.0), ('Lucho', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_0_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'Haddaway', 'What Is Love' FROM set_4_0
  RETURNING id
)
, votes_4_0_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_0_6.id, v.voter_name, v.score
  FROM song_4_0_6,
  (VALUES ('Jose J', 7.0), ('Hernan', 8.0), ('Mario', 8.5), ('Daniel', 6.0), ('Giusse', 7.0), ('Mauricio O.', 8.5), ('Mauricio R.', 8.0), ('Lucho', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_0_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'In The Valley Below', 'Peaches' FROM set_4_0
  RETURNING id
)
, votes_4_0_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_0_7.id, v.voter_name, v.score
  FROM song_4_0_7,
  (VALUES ('Jose J', 8.0), ('Hernan', 9.0), ('Mario', 9.5), ('Daniel', 7.0), ('Giusse', 7.5), ('Mauricio O.', 7.0), ('Mauricio R.', 10.0), ('Lucho', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_0_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'INXS', 'Original Sin' FROM set_4_0
  RETURNING id
)
, votes_4_0_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_0_8.id, v.voter_name, v.score
  FROM song_4_0_8,
  (VALUES ('Jose J', 8.0), ('Hernan', 9.0), ('Mario', 8.5), ('Daniel', 8.0), ('Giusse', 8.0), ('Mauricio O.', 8.5), ('Mauricio R.', 7.5), ('Lucho', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_0_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'M83', 'Midnight City' FROM set_4_0
  RETURNING id
)
, votes_4_0_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_0_9.id, v.voter_name, v.score
  FROM song_4_0_9,
  (VALUES ('Jose J', 8.0), ('Hernan', 8.5), ('Mario', 8.5), ('Daniel', 8.0), ('Giusse', 8.5), ('Mauricio O.', 8.5), ('Mauricio R.', 9.0), ('Lucho', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_0_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'Martin Garrix', 'Animals' FROM set_4_0
  RETURNING id
)
, votes_4_0_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_0_10.id, v.voter_name, v.score
  FROM song_4_0_10,
  (VALUES ('Jose J', 7.5), ('Hernan', 7.0), ('Mario', 8.0), ('Daniel', 5.5), ('Giusse', 7.0), ('Mauricio O.', 9.0), ('Lucho', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_0_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'Morrissey', 'First of the Gang to Die (Remastered)' FROM set_4_0
  RETURNING id
)
, votes_4_0_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_0_11.id, v.voter_name, v.score
  FROM song_4_0_11,
  (VALUES ('Jose J', 7.0), ('Hernan', 8.5), ('Mario', 6.0), ('Daniel', 7.0), ('Giusse', 7.0), ('Mauricio O.', 6.5), ('Mauricio R.', 7.5), ('Lucho', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_0_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'Of Monsters and Men', 'Little Talks' FROM set_4_0
  RETURNING id
)
, votes_4_0_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_0_12.id, v.voter_name, v.score
  FROM song_4_0_12,
  (VALUES ('Jose J', 7.5), ('Hernan', 8.0), ('Mario', 8.5), ('Daniel', 7.0), ('Giusse', 7.0), ('Mauricio O.', 6.0), ('Mauricio R.', 8.5), ('Lucho', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_0_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'Paul McCartney & Wings', 'Goodnight Tonight' FROM set_4_0
  RETURNING id
)
, votes_4_0_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_0_13.id, v.voter_name, v.score
  FROM song_4_0_13,
  (VALUES ('Jose J', 6.0), ('Hernan', 9.0), ('Mario', 9.0), ('Daniel', 7.5), ('Giusse', 8.5), ('Mauricio O.', 6.5), ('Mauricio R.', 7.0), ('Lucho', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_0_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'Pet Shop Boys', 'Heart [Shep Pettibone Version]' FROM set_4_0
  RETURNING id
)
, votes_4_0_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_0_14.id, v.voter_name, v.score
  FROM song_4_0_14,
  (VALUES ('Jose J', 7.0), ('Hernan', 7.5), ('Mario', 7.5), ('Daniel', 7.5), ('Giusse', 8.5), ('Mauricio O.', 9.5), ('Mauricio R.', 8.0), ('Lucho', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_0_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'Peter Frampton', 'Show Me the Way' FROM set_4_0
  RETURNING id
)
, votes_4_0_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_0_15.id, v.voter_name, v.score
  FROM song_4_0_15,
  (VALUES ('Jose J', 6.0), ('Hernan', 7.0), ('Mario', 7.0), ('Daniel', 7.0), ('Giusse', 8.0), ('Mauricio O.', 8.0), ('Mauricio R.', 8.0), ('Lucho', 10.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_0_16 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 16, 'Pieter Schoeman, London', 'The Four Seasons' FROM set_4_0
  RETURNING id
)
, votes_4_0_16 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_0_16.id, v.voter_name, v.score
  FROM song_4_0_16,
  (VALUES ('Jose J', 9.5), ('Hernan', 9.0), ('Mario', 10.0), ('Daniel', 7.0), ('Giusse', 10.0), ('Mauricio O.', 7.0), ('Mauricio R.', 10.0), ('Lucho', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_0_17 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 17, 'Placebo', 'The Bitter End' FROM set_4_0
  RETURNING id
)
, votes_4_0_17 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_0_17.id, v.voter_name, v.score
  FROM song_4_0_17,
  (VALUES ('Jose J', 9.0), ('Hernan', 9.0), ('Mario', 6.5), ('Daniel', 7.0), ('Giusse', 7.0), ('Mauricio O.', 8.5), ('Mauricio R.', 7.5), ('Lucho', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_0_18 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 18, 'Shocking Blue', 'Deamon Lover' FROM set_4_0
  RETURNING id
)
, votes_4_0_18 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_0_18.id, v.voter_name, v.score
  FROM song_4_0_18,
  (VALUES ('Jose J', 9.0), ('Hernan', 8.0), ('Mario', 10.0), ('Daniel', 8.0), ('Giusse', 9.0), ('Mauricio O.', 9.0), ('Mauricio R.', 10.0), ('Lucho', 9.5)) AS v(voter_name, score)
  RETURNING id
)
, song_4_0_19 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 19, 'The Thompson Twins', 'Hold Me Now' FROM set_4_0
  RETURNING id
)
, votes_4_0_19 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_0_19.id, v.voter_name, v.score
  FROM song_4_0_19,
  (VALUES ('Jose J', 8.5), ('Hernan', 9.0), ('Mario', 9.0), ('Daniel', 7.5), ('Giusse', 9.5), ('Mauricio O.', 7.0), ('Mauricio R.', 9.0), ('Lucho', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, set_4_1 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 1, 'Set Daniel' FROM s4
  RETURNING id
)
, song_4_1_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'Aerosmith', 'Keep the train rolling' FROM set_4_1
  RETURNING id
)
, votes_4_1_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_1_0.id, v.voter_name, v.score
  FROM song_4_1_0,
  (VALUES ('Jose J', 7.5), ('Hernan', 6.0), ('Mario', 6.5), ('Jorge A.', 4.0), ('Carlos', 6.5), ('Giusse', 6.5), ('Mauricio O.', 4.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_1_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'Aerosmith', 'I dont want to miss a thing' FROM set_4_1
  RETURNING id
)
, votes_4_1_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_1_1.id, v.voter_name, v.score
  FROM song_4_1_1,
  (VALUES ('Jose J', 8.0), ('Hernan', 7.0), ('Mario', 9.0), ('Jorge A.', 6.5), ('Carlos', 6.5), ('Giusse', 9.0), ('Mauricio O.', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_4_1_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'Bon Jovi', 'living on a prayer' FROM set_4_1
  RETURNING id
)
, votes_4_1_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_1_2.id, v.voter_name, v.score
  FROM song_4_1_2,
  (VALUES ('Jose J', 7.0), ('Hernan', 7.5), ('Mario', 7.0), ('Jorge A.', 8.0), ('Carlos', 7.5), ('Giusse', 6.5), ('Mauricio O.', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_1_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Erasure', 'O''lamour' FROM set_4_1
  RETURNING id
)
, votes_4_1_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_1_3.id, v.voter_name, v.score
  FROM song_4_1_3,
  (VALUES ('Jose J', 7.0), ('Hernan', 7.5), ('Mario', 7.0), ('Jorge A.', 7.0), ('Carlos', 9.0), ('Giusse', 7.5), ('Mauricio O.', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_1_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'Florida', 'Right Round' FROM set_4_1
  RETURNING id
)
, votes_4_1_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_1_4.id, v.voter_name, v.score
  FROM song_4_1_4,
  (VALUES ('Jose J', 6.5), ('Hernan', 4.0), ('Mario', 7.0), ('Jorge A.', 5.5), ('Carlos', 7.0), ('Giusse', 6.0), ('Mauricio O.', 5.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_1_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'Guns N'' Roses', 'Paradisse city' FROM set_4_1
  RETURNING id
)
, votes_4_1_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_1_5.id, v.voter_name, v.score
  FROM song_4_1_5,
  (VALUES ('Jose J', 8.5), ('Hernan', 7.0), ('Mario', 8.0), ('Jorge A.', 7.5), ('Carlos', 7.0), ('Giusse', 7.5), ('Mauricio O.', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_1_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'hole', 'celebrity skin' FROM set_4_1
  RETURNING id
)
, votes_4_1_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_1_6.id, v.voter_name, v.score
  FROM song_4_1_6,
  (VALUES ('Jose J', 7.0), ('Hernan', 7.5), ('Mario', 6.5), ('Jorge A.', 6.0), ('Carlos', 6.0), ('Giusse', 7.0), ('Mauricio O.', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_1_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'Human league', 'Dont you want me' FROM set_4_1
  RETURNING id
)
, votes_4_1_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_1_7.id, v.voter_name, v.score
  FROM song_4_1_7,
  (VALUES ('Jose J', 8.5), ('Hernan', 9.0), ('Mario', 8.0), ('Jorge A.', 8.5), ('Carlos', 9.0), ('Giusse', 8.5), ('Mauricio O.', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_1_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'Lady Gaga', 'Aplausse' FROM set_4_1
  RETURNING id
)
, votes_4_1_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_1_8.id, v.voter_name, v.score
  FROM song_4_1_8,
  (VALUES ('Jose J', 6.0), ('Hernan', 7.0), ('Mario', 6.0), ('Jorge A.', 6.0), ('Carlos', 7.5), ('Giusse', 7.0), ('Mauricio O.', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_4_1_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'Linking park-jayZ', 'Miami vice numb encore' FROM set_4_1
  RETURNING id
)
, votes_4_1_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_1_9.id, v.voter_name, v.score
  FROM song_4_1_9,
  (VALUES ('Jose J', 6.0), ('Hernan', 8.5), ('Mario', 7.0), ('Jorge A.', 7.5), ('Carlos', 5.5), ('Giusse', 7.5), ('Mauricio O.', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_1_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'los prisioneros', 'Estrechez de corazon' FROM set_4_1
  RETURNING id
)
, votes_4_1_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_1_10.id, v.voter_name, v.score
  FROM song_4_1_10,
  (VALUES ('Jose J', 5.0), ('Hernan', 7.0), ('Mario', 8.5), ('Jorge A.', 8.5), ('Carlos', 9.0), ('Giusse', 9.0), ('Mauricio O.', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_1_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'MC Hammer', 'U cant touch this' FROM set_4_1
  RETURNING id
)
, votes_4_1_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_1_11.id, v.voter_name, v.score
  FROM song_4_1_11,
  (VALUES ('Jose J', 4.5), ('Hernan', 0.0), ('Mario', 6.0), ('Jorge A.', 5.0), ('Carlos', 4.0), ('Giusse', 9.0), ('Mauricio O.', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_1_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'Nirvana', 'Lithium' FROM set_4_1
  RETURNING id
)
, votes_4_1_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_1_12.id, v.voter_name, v.score
  FROM song_4_1_12,
  (VALUES ('Jose J', 7.0), ('Hernan', 7.0), ('Mario', 7.0), ('Jorge A.', 7.0), ('Carlos', 7.0), ('Giusse', 7.0), ('Mauricio O.', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_4_1_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'Pet shop boys', 'Domino Dancing' FROM set_4_1
  RETURNING id
)
, votes_4_1_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_1_13.id, v.voter_name, v.score
  FROM song_4_1_13,
  (VALUES ('Jose J', 6.0), ('Hernan', 7.0), ('Mario', 8.5), ('Jorge A.', 9.0), ('Carlos', 8.0), ('Giusse', 7.5), ('Mauricio O.', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_1_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'Queen', 'Bohemian Rhapshody' FROM set_4_1
  RETURNING id
)
, votes_4_1_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_1_14.id, v.voter_name, v.score
  FROM song_4_1_14,
  (VALUES ('Jose J', 9.0), ('Hernan', 10.0), ('Mario', 10.0), ('Jorge A.', 10.0), ('Carlos', 10.0), ('Giusse', 10.0), ('Mauricio O.', 10.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_1_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'Savage garden', 'Afirmation' FROM set_4_1
  RETURNING id
)
, votes_4_1_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_1_15.id, v.voter_name, v.score
  FROM song_4_1_15,
  (VALUES ('Jose J', 6.5), ('Hernan', 8.0), ('Mario', 7.5), ('Jorge A.', 6.0), ('Carlos', 8.0), ('Giusse', 7.5), ('Mauricio O.', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_4_1_16 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 16, 'Soul Assylum', 'Misery' FROM set_4_1
  RETURNING id
)
, votes_4_1_16 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_1_16.id, v.voter_name, v.score
  FROM song_4_1_16,
  (VALUES ('Jose J', 8.0), ('Hernan', 8.0), ('Mario', 6.5), ('Jorge A.', 6.5), ('Carlos', 8.0), ('Giusse', 8.0), ('Mauricio O.', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_4_1_17 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 17, 'The Offspring', 'The kids arent right' FROM set_4_1
  RETURNING id
)
, votes_4_1_17 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_1_17.id, v.voter_name, v.score
  FROM song_4_1_17,
  (VALUES ('Jose J', 8.5), ('Hernan', 8.0), ('Mario', 8.0), ('Jorge A.', 7.0), ('Carlos', 7.0), ('Giusse', 6.5), ('Mauricio O.', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_4_1_18 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 18, 'The Rolling Stones', 'Paint it black' FROM set_4_1
  RETURNING id
)
, votes_4_1_18 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_1_18.id, v.voter_name, v.score
  FROM song_4_1_18,
  (VALUES ('Jose J', 8.5), ('Hernan', 9.5), ('Mario', 8.5), ('Jorge A.', 7.0), ('Carlos', 8.0), ('Giusse', 8.5), ('Mauricio O.', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_4_1_19 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 19, 'whez kalifa', 'see you again' FROM set_4_1
  RETURNING id
)
, votes_4_1_19 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_1_19.id, v.voter_name, v.score
  FROM song_4_1_19,
  (VALUES ('Jose J', 7.0), ('Hernan', 8.5), ('Mario', 8.0), ('Jorge A.', 7.0), ('Carlos', 7.0), ('Giusse', 7.5), ('Mauricio O.', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, set_4_2 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 2, 'Set Hernan' FROM s4
  RETURNING id
)
, song_4_2_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'Angels & Agony', 'Monument' FROM set_4_2
  RETURNING id
)
, votes_4_2_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_2_0.id, v.voter_name, v.score
  FROM song_4_2_0,
  (VALUES ('Jose J', 7.0), ('Mario', 9.0), ('Daniel', 8.0), ('Carlos', 9.0), ('Mauricio O.', 8.5), ('Lucho', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_2_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'Brandon Flowers', 'Digging up the heart' FROM set_4_2
  RETURNING id
)
, votes_4_2_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_2_1.id, v.voter_name, v.score
  FROM song_4_2_1,
  (VALUES ('Jose J', 8.0), ('Mario', 7.0), ('Daniel', 8.0), ('Carlos', 8.0), ('Mauricio O.', 7.0), ('Lucho', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_2_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'Cheerleader', 'The sunshine of your youth' FROM set_4_2
  RETURNING id
)
, votes_4_2_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_2_2.id, v.voter_name, v.score
  FROM song_4_2_2,
  (VALUES ('Jose J', 8.0), ('Mario', 7.0), ('Daniel', 8.0), ('Carlos', 6.0), ('Mauricio O.', 8.0), ('Lucho', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_2_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Chemical Brothers', 'Go' FROM set_4_2
  RETURNING id
)
, votes_4_2_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_2_3.id, v.voter_name, v.score
  FROM song_4_2_3,
  (VALUES ('Jose J', 6.0), ('Mario', 7.0), ('Daniel', 7.0), ('Carlos', 6.5), ('Mauricio O.', 6.0), ('Lucho', 4.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_2_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'Daft Punk', 'Instant Crush' FROM set_4_2
  RETURNING id
)
, votes_4_2_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_2_4.id, v.voter_name, v.score
  FROM song_4_2_4,
  (VALUES ('Jose J', 6.0), ('Mario', 7.0), ('Daniel', 7.0), ('Carlos', 5.0), ('Mauricio O.', 6.0), ('Lucho', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_2_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'David Bowie', 'Valentine''s day' FROM set_4_2
  RETURNING id
)
, votes_4_2_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_2_5.id, v.voter_name, v.score
  FROM song_4_2_5,
  (VALUES ('Jose J', 7.0), ('Mario', 6.5), ('Daniel', 7.0), ('Carlos', 7.5), ('Mauricio O.', 7.0), ('Lucho', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_2_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'Future islands', 'A dream of you and me' FROM set_4_2
  RETURNING id
)
, votes_4_2_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_2_6.id, v.voter_name, v.score
  FROM song_4_2_6,
  (VALUES ('Jose J', 7.5), ('Mario', 7.0), ('Daniel', 7.0), ('Carlos', 7.0), ('Mauricio O.', 7.0), ('Lucho', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_2_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'Gorillaz', 'On Melancholy Hill' FROM set_4_2
  RETURNING id
)
, votes_4_2_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_2_7.id, v.voter_name, v.score
  FROM song_4_2_7,
  (VALUES ('Jose J', 6.0), ('Mario', 6.5), ('Daniel', 6.0), ('Carlos', 7.0), ('Mauricio O.', 8.5), ('Lucho', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_2_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'Imagine dragons', 'Shots' FROM set_4_2
  RETURNING id
)
, votes_4_2_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_2_8.id, v.voter_name, v.score
  FROM song_4_2_8,
  (VALUES ('Jose J', 8.0), ('Mario', 8.0), ('Daniel', 8.0), ('Carlos', 8.5), ('Mauricio O.', 8.0), ('Lucho', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_2_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'Maroon 5', 'This summer' FROM set_4_2
  RETURNING id
)
, votes_4_2_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_2_9.id, v.voter_name, v.score
  FROM song_4_2_9,
  (VALUES ('Jose J', 4.5), ('Mario', 5.5), ('Daniel', 7.0), ('Carlos', 6.0), ('Mauricio O.', 6.0), ('Lucho', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_2_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'Miami Horror', 'Stranger' FROM set_4_2
  RETURNING id
)
, votes_4_2_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_2_10.id, v.voter_name, v.score
  FROM song_4_2_10,
  (VALUES ('Jose J', 6.5), ('Mario', 6.0), ('Daniel', 6.0), ('Carlos', 6.5), ('Mauricio O.', 8.5), ('Lucho', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_2_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'Miranda', 'Fantasmas' FROM set_4_2
  RETURNING id
)
, votes_4_2_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_2_11.id, v.voter_name, v.score
  FROM song_4_2_11,
  (VALUES ('Jose J', 6.0), ('Mario', 6.5), ('Daniel', 7.5), ('Carlos', 8.0), ('Mauricio O.', 7.0), ('Lucho', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_2_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'Moby', 'Perfect Life' FROM set_4_2
  RETURNING id
)
, votes_4_2_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_2_12.id, v.voter_name, v.score
  FROM song_4_2_12,
  (VALUES ('Jose J', 8.5), ('Mario', 7.0), ('Daniel', 7.5), ('Carlos', 7.5), ('Mauricio O.', 7.0), ('Lucho', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_2_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'OMD', 'Metroland' FROM set_4_2
  RETURNING id
)
, votes_4_2_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_2_13.id, v.voter_name, v.score
  FROM song_4_2_13,
  (VALUES ('Jose J', 6.5), ('Mario', 8.0), ('Daniel', 7.0), ('Carlos', 8.5), ('Mauricio O.', 8.5), ('Lucho', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_4_2_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'One Republic', 'Counting stars' FROM set_4_2
  RETURNING id
)
, votes_4_2_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_2_14.id, v.voter_name, v.score
  FROM song_4_2_14,
  (VALUES ('Jose J', 7.5), ('Mario', 8.5), ('Daniel', 8.5), ('Carlos', 7.5), ('Mauricio O.', 9.0), ('Lucho', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_2_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'Somos', 'Somos' FROM set_4_2
  RETURNING id
)
, votes_4_2_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_2_15.id, v.voter_name, v.score
  FROM song_4_2_15,
  (VALUES ('Jose J', 4.0), ('Mario', 7.0), ('Daniel', 4.5), ('Carlos', 4.0), ('Mauricio O.', 5.0), ('Lucho', 5.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_2_16 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 16, 'The Alan Parsons Project', 'Do you live at all?' FROM set_4_2
  RETURNING id
)
, votes_4_2_16 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_2_16.id, v.voter_name, v.score
  FROM song_4_2_16,
  (VALUES ('Jose J', 8.0), ('Mario', 8.0), ('Daniel', 7.5), ('Carlos', 7.0), ('Mauricio O.', 6.5), ('Lucho', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_2_17 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 17, 'Tony Bennett & Lady Gaga', 'Cheek to cheek' FROM set_4_2
  RETURNING id
)
, votes_4_2_17 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_2_17.id, v.voter_name, v.score
  FROM song_4_2_17,
  (VALUES ('Jose J', 5.0), ('Mario', 5.0), ('Daniel', 6.5), ('Carlos', 4.0), ('Mauricio O.', 4.0), ('Lucho', 5.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_2_18 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 18, 'U2', 'California (there is no end to love)' FROM set_4_2
  RETURNING id
)
, votes_4_2_18 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_2_18.id, v.voter_name, v.score
  FROM song_4_2_18,
  (VALUES ('Jose J', 8.0), ('Mario', 6.5), ('Daniel', 7.0), ('Carlos', 7.0), ('Mauricio O.', 7.0), ('Lucho', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_2_19 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 19, 'White Lies', 'Big Tv' FROM set_4_2
  RETURNING id
)
, votes_4_2_19 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_2_19.id, v.voter_name, v.score
  FROM song_4_2_19,
  (VALUES ('Jose J', 7.0), ('Mario', 6.5), ('Daniel', 7.0), ('Carlos', 6.0), ('Mauricio O.', 6.5), ('Lucho', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, set_4_3 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 3, 'Set Jorge' FROM s4
  RETURNING id
)
, song_4_3_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'Danny Elfman', 'The little things' FROM set_4_3
  RETURNING id
)
, votes_4_3_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_3_0.id, v.voter_name, v.score
  FROM song_4_3_0,
  (VALUES ('Hernan', 6.5), ('Mario', 6.5), ('Carlos', 6.5), ('Giusse', 7.0), ('Mauricio O.', 7.0), ('Mauricio R.', 7.5), ('Lucho', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_3_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'Depeche Mode', 'Policy of Truth' FROM set_4_3
  RETURNING id
)
, votes_4_3_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_3_1.id, v.voter_name, v.score
  FROM song_4_3_1,
  (VALUES ('Hernan', 9.5), ('Mario', 9.0), ('Carlos', 9.0), ('Giusse', 9.0), ('Mauricio O.', 8.5), ('Mauricio R.', 9.0), ('Lucho', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_3_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'Empire of the Sun', 'DNA' FROM set_4_3
  RETURNING id
)
, votes_4_3_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_3_2.id, v.voter_name, v.score
  FROM song_4_3_2,
  (VALUES ('Hernan', 8.0), ('Mario', 7.0), ('Carlos', 7.5), ('Giusse', 7.0), ('Mauricio O.', 8.5), ('Mauricio R.', 7.0), ('Lucho', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_3_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Ex Cops', 'Black Soap' FROM set_4_3
  RETURNING id
)
, votes_4_3_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_3_3.id, v.voter_name, v.score
  FROM song_4_3_3,
  (VALUES ('Hernan', 8.5), ('Mario', 7.0), ('Carlos', 8.0), ('Giusse', 7.0), ('Mauricio O.', 7.0), ('Mauricio R.', 8.0), ('Lucho', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_4_3_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'Filter', 'Take a picture' FROM set_4_3
  RETURNING id
)
, votes_4_3_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_3_4.id, v.voter_name, v.score
  FROM song_4_3_4,
  (VALUES ('Hernan', 8.5), ('Mario', 9.0), ('Carlos', 8.0), ('Giusse', 8.0), ('Mauricio O.', 9.5), ('Mauricio R.', 8.5), ('Lucho', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_4_3_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'Gazebo', 'I like Chopin (Extended Dance Version)' FROM set_4_3
  RETURNING id
)
, votes_4_3_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_3_5.id, v.voter_name, v.score
  FROM song_4_3_5,
  (VALUES ('Hernan', 8.5), ('Mario', 8.0), ('Carlos', 10.0), ('Giusse', 8.5), ('Mauricio O.', 8.5), ('Mauricio R.', 9.5), ('Lucho', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_3_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'Iron Maiden', 'The Trooper' FROM set_4_3
  RETURNING id
)
, votes_4_3_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_3_6.id, v.voter_name, v.score
  FROM song_4_3_6,
  (VALUES ('Hernan', 7.5), ('Mario', 7.0), ('Carlos', 7.0), ('Giusse', 8.0), ('Mauricio O.', 8.0), ('Mauricio R.', 9.5), ('Lucho', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_4_3_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'Jean Michel Jarre', 'AERO' FROM set_4_3
  RETURNING id
)
, votes_4_3_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_3_7.id, v.voter_name, v.score
  FROM song_4_3_7,
  (VALUES ('Hernan', 9.0), ('Mario', 9.0), ('Carlos', 7.5), ('Giusse', 8.5), ('Mauricio O.', 6.5), ('Mauricio R.', 9.0), ('Lucho', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_3_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'Kiesza', 'Hideaway' FROM set_4_3
  RETURNING id
)
, votes_4_3_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_3_8.id, v.voter_name, v.score
  FROM song_4_3_8,
  (VALUES ('Hernan', 7.5), ('Mario', 8.0), ('Carlos', 7.0), ('Giusse', 8.0), ('Mauricio O.', 7.5), ('Mauricio R.', 7.0), ('Lucho', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_4_3_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'Lighthouse family', 'Raincloud' FROM set_4_3
  RETURNING id
)
, votes_4_3_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_3_9.id, v.voter_name, v.score
  FROM song_4_3_9,
  (VALUES ('Hernan', 9.5), ('Mario', 8.5), ('Carlos', 7.5), ('Giusse', 8.5), ('Mauricio O.', 9.0), ('Mauricio R.', 8.5), ('Lucho', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_3_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'Lost Prophets', 'Shinobi vs Dragon ninja' FROM set_4_3
  RETURNING id
)
, votes_4_3_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_3_10.id, v.voter_name, v.score
  FROM song_4_3_10,
  (VALUES ('Hernan', 8.5), ('Mario', 7.0), ('Carlos', 7.0), ('Giusse', 7.5), ('Mauricio O.', 9.0), ('Mauricio R.', 9.0), ('Lucho', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_3_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'Radiohead', 'Weird Fishes' FROM set_4_3
  RETURNING id
)
, votes_4_3_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_3_11.id, v.voter_name, v.score
  FROM song_4_3_11,
  (VALUES ('Hernan', 8.5), ('Mario', 8.5), ('Carlos', 7.0), ('Giusse', 9.0), ('Mauricio O.', 9.5), ('Mauricio R.', 8.5), ('Lucho', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_3_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'Re flex', 'The politics of dancing' FROM set_4_3
  RETURNING id
)
, votes_4_3_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_3_12.id, v.voter_name, v.score
  FROM song_4_3_12,
  (VALUES ('Hernan', 7.0), ('Mario', 6.5), ('Carlos', 7.5), ('Giusse', 7.0), ('Mauricio O.', 7.0), ('Mauricio R.', 7.0), ('Lucho', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_4_3_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'Robbie Williams', 'Feel' FROM set_4_3
  RETURNING id
)
, votes_4_3_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_3_13.id, v.voter_name, v.score
  FROM song_4_3_13,
  (VALUES ('Hernan', 6.5), ('Mario', 9.0), ('Carlos', 8.0), ('Giusse', 8.0), ('Mauricio O.', 8.0), ('Mauricio R.', 6.0), ('Lucho', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_4_3_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'Smashing Satellites', 'Waterfall' FROM set_4_3
  RETURNING id
)
, votes_4_3_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_3_14.id, v.voter_name, v.score
  FROM song_4_3_14,
  (VALUES ('Hernan', 9.0), ('Mario', 8.0), ('Carlos', 8.0), ('Giusse', 7.5), ('Mauricio O.', 8.5), ('Mauricio R.', 8.5), ('Lucho', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_3_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'Soda Stereo', 'En la ciudad de la furia' FROM set_4_3
  RETURNING id
)
, votes_4_3_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_3_15.id, v.voter_name, v.score
  FROM song_4_3_15,
  (VALUES ('Hernan', 8.0), ('Mario', 9.0), ('Carlos', 7.5), ('Giusse', 9.0), ('Mauricio O.', 9.0), ('Mauricio R.', 9.0), ('Lucho', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_4_3_16 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 16, 'Soda Stereo', 'Prófugos' FROM set_4_3
  RETURNING id
)
, votes_4_3_16 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_3_16.id, v.voter_name, v.score
  FROM song_4_3_16,
  (VALUES ('Hernan', 7.5), ('Mario', 9.0), ('Carlos', 9.0), ('Giusse', 7.0), ('Mauricio O.', 9.0), ('Mauricio R.', 9.5), ('Lucho', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_4_3_17 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 17, 'Soda Stereo', 'Lo que sangra (La cúpula)' FROM set_4_3
  RETURNING id
)
, votes_4_3_17 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_3_17.id, v.voter_name, v.score
  FROM song_4_3_17,
  (VALUES ('Hernan', 7.0), ('Mario', 6.5), ('Carlos', 7.5), ('Giusse', 9.0), ('Mauricio O.', 9.0), ('Mauricio R.', 7.5), ('Lucho', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_4_3_18 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 18, 'Soda Stereo', 'Te para tres (Unplugged)' FROM set_4_3
  RETURNING id
)
, votes_4_3_18 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_3_18.id, v.voter_name, v.score
  FROM song_4_3_18,
  (VALUES ('Hernan', 6.5), ('Mario', 7.0), ('Carlos', 6.0), ('Giusse', 8.0), ('Mauricio O.', 8.5), ('Mauricio R.', 7.0), ('Lucho', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_3_19 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 19, 'Sussie 4', 'Remote Control' FROM set_4_3
  RETURNING id
)
, votes_4_3_19 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_3_19.id, v.voter_name, v.score
  FROM song_4_3_19,
  (VALUES ('Hernan', 8.5), ('Mario', 7.0), ('Carlos', 9.0), ('Giusse', 8.0), ('Mauricio O.', 9.0), ('Mauricio R.', 7.5), ('Lucho', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, set_4_4 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 4, 'Set Jose Jaime' FROM s4
  RETURNING id
)
, song_4_4_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'Bee Gees', 'You Should Be Dancing' FROM set_4_4
  RETURNING id
)
, votes_4_4_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_4_0.id, v.voter_name, v.score
  FROM song_4_4_0,
  (VALUES ('Hernan', 7.5), ('Mario', 8.0), ('Daniel', 8.0), ('Carlos', 9.0), ('Mauricio O.', 8.0), ('Mauricio R.', 8.0), ('Lucho', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_4_4_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'Bobby Goldsboro', 'Summer' FROM set_4_4
  RETURNING id
)
, votes_4_4_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_4_1.id, v.voter_name, v.score
  FROM song_4_4_1,
  (VALUES ('Hernan', 6.5), ('Mario', 8.0), ('Daniel', 6.5), ('Carlos', 6.0), ('Mauricio O.', 7.0), ('Mauricio R.', 7.5), ('Lucho', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_4_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'Boy George', 'The Crying Game' FROM set_4_4
  RETURNING id
)
, votes_4_4_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_4_2.id, v.voter_name, v.score
  FROM song_4_4_2,
  (VALUES ('Hernan', 8.5), ('Mario', 9.0), ('Daniel', 8.0), ('Carlos', 8.0), ('Mauricio O.', 7.0), ('Mauricio R.', 9.5), ('Lucho', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_4_4_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Capital Cities', 'Safe And Sound' FROM set_4_4
  RETURNING id
)
, votes_4_4_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_4_3.id, v.voter_name, v.score
  FROM song_4_4_3,
  (VALUES ('Hernan', 9.0), ('Mario', 8.5), ('Daniel', 7.5), ('Carlos', 9.0), ('Mauricio O.', 9.5), ('Mauricio R.', 9.0), ('Lucho', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_4_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'Cher', 'If I Could Turn Back Time' FROM set_4_4
  RETURNING id
)
, votes_4_4_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_4_4.id, v.voter_name, v.score
  FROM song_4_4_4,
  (VALUES ('Hernan', 8.0), ('Mario', 7.5), ('Daniel', 7.5), ('Carlos', 7.0), ('Mauricio O.', 7.5), ('Mauricio R.', 7.5), ('Lucho', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_4_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'Emerson, Lake & Palmer', 'Lucky Man' FROM set_4_4
  RETURNING id
)
, votes_4_4_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_4_5.id, v.voter_name, v.score
  FROM song_4_4_5,
  (VALUES ('Hernan', 8.5), ('Mario', 8.5), ('Daniel', 8.0), ('Carlos', 7.5), ('Mauricio O.', 8.5), ('Mauricio R.', 7.5), ('Lucho', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_4_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'Enigma', 'The Voice of Enigma' FROM set_4_4
  RETURNING id
)
, votes_4_4_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_4_6.id, v.voter_name, v.score
  FROM song_4_4_6,
  (VALUES ('Hernan', 8.5), ('Mario', 7.5), ('Daniel', 7.0), ('Carlos', 7.0), ('Mauricio O.', 7.0), ('Mauricio R.', 8.5), ('Lucho', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_4_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'Fat Boy Slim', 'Praise You' FROM set_4_4
  RETURNING id
)
, votes_4_4_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_4_7.id, v.voter_name, v.score
  FROM song_4_4_7,
  (VALUES ('Hernan', 8.0), ('Mario', 6.5), ('Daniel', 7.5), ('Carlos', 7.5), ('Mauricio O.', 8.0), ('Mauricio R.', 7.0), ('Lucho', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_4_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'Florence + The Machine', 'Shake It Out' FROM set_4_4
  RETURNING id
)
, votes_4_4_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_4_8.id, v.voter_name, v.score
  FROM song_4_4_8,
  (VALUES ('Hernan', 8.0), ('Mario', 7.5), ('Daniel', 7.0), ('Carlos', 7.0), ('Mauricio O.', 6.5), ('Mauricio R.', 8.0), ('Lucho', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_4_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'Imagine Dragons', 'It Comes Back To You' FROM set_4_4
  RETURNING id
)
, votes_4_4_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_4_9.id, v.voter_name, v.score
  FROM song_4_4_9,
  (VALUES ('Hernan', 8.5), ('Mario', 9.0), ('Daniel', 7.0), ('Carlos', 9.0), ('Mauricio O.', 7.5), ('Mauricio R.', 8.5), ('Lucho', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_4_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'Interpol', 'All The Rage Back Home' FROM set_4_4
  RETURNING id
)
, votes_4_4_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_4_10.id, v.voter_name, v.score
  FROM song_4_4_10,
  (VALUES ('Hernan', 8.5), ('Mario', 7.0), ('Daniel', 7.5), ('Carlos', 8.5), ('Mauricio O.', 7.5), ('Mauricio R.', 8.5), ('Lucho', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_4_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'Jean Michel Jarre', 'Les Chants Magnetiques' FROM set_4_4
  RETURNING id
)
, votes_4_4_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_4_11.id, v.voter_name, v.score
  FROM song_4_4_11,
  (VALUES ('Hernan', 9.0), ('Mario', 8.5), ('Daniel', 7.5), ('Carlos', 8.0), ('Mauricio O.', 8.0), ('Mauricio R.', 8.5), ('Lucho', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_4_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'Kasabian', 'Bow' FROM set_4_4
  RETURNING id
)
, votes_4_4_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_4_12.id, v.voter_name, v.score
  FROM song_4_4_12,
  (VALUES ('Hernan', 8.0), ('Mario', 8.5), ('Daniel', 7.0), ('Carlos', 8.0), ('Mauricio O.', 6.5), ('Mauricio R.', 8.0), ('Lucho', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_4_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'Luciano Pavarotti', 'Caruso de Lucio Dalla' FROM set_4_4
  RETURNING id
)
, votes_4_4_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_4_13.id, v.voter_name, v.score
  FROM song_4_4_13,
  (VALUES ('Hernan', 7.5), ('Mario', 9.5), ('Daniel', 7.5), ('Carlos', 8.5), ('Mauricio O.', 9.5), ('Mauricio R.', 9.5), ('Lucho', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_4_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'Rod Stewart', 'Young Turks' FROM set_4_4
  RETURNING id
)
, votes_4_4_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_4_14.id, v.voter_name, v.score
  FROM song_4_4_14,
  (VALUES ('Hernan', 8.0), ('Mario', 8.0), ('Daniel', 7.5), ('Carlos', 9.0), ('Mauricio O.', 8.0), ('Mauricio R.', 8.0), ('Lucho', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_4_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'Sinead O''Connor', 'Take Me To Church' FROM set_4_4
  RETURNING id
)
, votes_4_4_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_4_15.id, v.voter_name, v.score
  FROM song_4_4_15,
  (VALUES ('Hernan', 7.5), ('Mario', 6.5), ('Daniel', 6.5), ('Carlos', 7.5), ('Mauricio O.', 8.5), ('Mauricio R.', 7.0), ('Lucho', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_4_16 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 16, 'Stereophonics', 'Dakota' FROM set_4_4
  RETURNING id
)
, votes_4_4_16 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_4_16.id, v.voter_name, v.score
  FROM song_4_4_16,
  (VALUES ('Hernan', 9.0), ('Mario', 8.0), ('Daniel', 7.0), ('Carlos', 8.5), ('Mauricio O.', 8.5), ('Mauricio R.', 9.0), ('Lucho', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_4_4_17 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 17, 'The Cars', 'Drive' FROM set_4_4
  RETURNING id
)
, votes_4_4_17 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_4_17.id, v.voter_name, v.score
  FROM song_4_4_17,
  (VALUES ('Hernan', 8.5), ('Mario', 8.5), ('Daniel', 8.0), ('Carlos', 8.0), ('Mauricio O.', 9.0), ('Mauricio R.', 9.0), ('Lucho', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_4_18 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 18, 'The Neighbourhood', 'Afraid' FROM set_4_4
  RETURNING id
)
, votes_4_4_18 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_4_18.id, v.voter_name, v.score
  FROM song_4_4_18,
  (VALUES ('Hernan', 8.5), ('Mario', 8.0), ('Daniel', 7.0), ('Carlos', 6.5), ('Mauricio O.', 7.0), ('Mauricio R.', 7.0), ('Lucho', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_4_19 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 19, 'Van Halen', 'Dreams' FROM set_4_4
  RETURNING id
)
, votes_4_4_19 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_4_19.id, v.voter_name, v.score
  FROM song_4_4_19,
  (VALUES ('Hernan', 8.0), ('Mario', 7.0), ('Daniel', 7.5), ('Carlos', 6.5), ('Mauricio O.', 7.0), ('Mauricio R.', 8.5), ('Lucho', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, set_4_5 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 5, 'Set Rafael' FROM s4
  RETURNING id
)
, song_4_5_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'Bruce Springsteen', 'I´m on fire' FROM set_4_5
  RETURNING id
)
, votes_4_5_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_5_0.id, v.voter_name, v.score
  FROM song_4_5_0,
  (VALUES ('Hernan', 7.0), ('Daniel', 6.5), ('Carlos', 7.0), ('Giusse', 7.5), ('Mauricio O.', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_4_5_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'Deep Purple', 'Child In Time' FROM set_4_5
  RETURNING id
)
, votes_4_5_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_5_1.id, v.voter_name, v.score
  FROM song_4_5_1,
  (VALUES ('Hernan', 8.5), ('Daniel', 7.5), ('Carlos', 8.0), ('Giusse', 7.0), ('Mauricio O.', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_4_5_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'Deff lepard', 'Pour some sugar on me' FROM set_4_5
  RETURNING id
)
, votes_4_5_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_5_2.id, v.voter_name, v.score
  FROM song_4_5_2,
  (VALUES ('Hernan', 7.0), ('Daniel', 8.0), ('Carlos', 7.5), ('Giusse', 8.0), ('Mauricio O.', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_5_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Dire Straits', 'Brother in arms' FROM set_4_5
  RETURNING id
)
, votes_4_5_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_5_3.id, v.voter_name, v.score
  FROM song_4_5_3,
  (VALUES ('Hernan', 10.0), ('Daniel', 7.5), ('Carlos', 9.0), ('Giusse', 10.0), ('Mauricio O.', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_5_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'Echosmith', 'Cool Kids' FROM set_4_5
  RETURNING id
)
, votes_4_5_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_5_4.id, v.voter_name, v.score
  FROM song_4_5_4,
  (VALUES ('Hernan', 8.0), ('Daniel', 7.0), ('Carlos', 8.0), ('Giusse', 7.5), ('Mauricio O.', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_5_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'Ed Sheeram', 'I´m a Mess' FROM set_4_5
  RETURNING id
)
, votes_4_5_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_5_5.id, v.voter_name, v.score
  FROM song_4_5_5,
  (VALUES ('Hernan', 7.5), ('Daniel', 7.0), ('Carlos', 7.0), ('Giusse', 7.0), ('Mauricio O.', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_5_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'El último de la fila', 'Insurrección' FROM set_4_5
  RETURNING id
)
, votes_4_5_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_5_6.id, v.voter_name, v.score
  FROM song_4_5_6,
  (VALUES ('Hernan', 8.0), ('Daniel', 7.5), ('Carlos', 9.0), ('Giusse', 9.5), ('Mauricio O.', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_5_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'Elton John & Pavarotti', 'Live Like Horses - 1997' FROM set_4_5
  RETURNING id
)
, votes_4_5_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_5_7.id, v.voter_name, v.score
  FROM song_4_5_7,
  (VALUES ('Hernan', 7.5), ('Daniel', 7.5), ('Carlos', 7.5), ('Giusse', 8.0), ('Mauricio O.', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_5_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'INXS', 'Nevet Tear Us Apart' FROM set_4_5
  RETURNING id
)
, votes_4_5_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_5_8.id, v.voter_name, v.score
  FROM song_4_5_8,
  (VALUES ('Hernan', 7.0), ('Daniel', 7.5), ('Carlos', 7.5), ('Giusse', 8.5), ('Mauricio O.', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_5_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'Joan Osborne & Pavarotti', 'St. Teresa' FROM set_4_5
  RETURNING id
)
, votes_4_5_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_5_9.id, v.voter_name, v.score
  FROM song_4_5_9,
  (VALUES ('Hernan', 7.0), ('Daniel', 6.0), ('Carlos', 5.0), ('Giusse', 7.0), ('Mauricio O.', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_5_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'Nico & Vinz', 'Am I Wrong' FROM set_4_5
  RETURNING id
)
, votes_4_5_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_5_10.id, v.voter_name, v.score
  FROM song_4_5_10,
  (VALUES ('Hernan', 8.0), ('Daniel', 7.0), ('Carlos', 6.0), ('Giusse', 7.0), ('Mauricio O.', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_5_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'Omi (Felix Jaehn Remix)', 'Cheerleader' FROM set_4_5
  RETURNING id
)
, votes_4_5_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_5_11.id, v.voter_name, v.score
  FROM song_4_5_11,
  (VALUES ('Hernan', 6.5), ('Daniel', 6.5), ('Carlos', 6.0), ('Giusse', 6.0), ('Mauricio O.', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_4_5_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'Pearl Jam', 'Even Flow' FROM set_4_5
  RETURNING id
)
, votes_4_5_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_5_12.id, v.voter_name, v.score
  FROM song_4_5_12,
  (VALUES ('Hernan', 8.0), ('Daniel', 8.0), ('Carlos', 7.0), ('Giusse', 8.0), ('Mauricio O.', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_5_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'Shocking Blue', 'Never Marry a Railroad' FROM set_4_5
  RETURNING id
)
, votes_4_5_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_5_13.id, v.voter_name, v.score
  FROM song_4_5_13,
  (VALUES ('Hernan', 8.5), ('Daniel', 6.5), ('Carlos', 8.0), ('Giusse', 6.5), ('Mauricio O.', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_5_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'The Alan Parsons Project', 'Games People Play' FROM set_4_5
  RETURNING id
)
, votes_4_5_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_5_14.id, v.voter_name, v.score
  FROM song_4_5_14,
  (VALUES ('Hernan', 9.0), ('Daniel', 8.0), ('Carlos', 9.0), ('Giusse', 8.5), ('Mauricio O.', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_5_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'The Beatles', 'Eleanor Rigby' FROM set_4_5
  RETURNING id
)
, votes_4_5_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_5_15.id, v.voter_name, v.score
  FROM song_4_5_15,
  (VALUES ('Hernan', 9.0), ('Daniel', 7.0), ('Carlos', 8.0), ('Giusse', 9.0), ('Mauricio O.', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_5_16 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 16, 'The Rolling Stones', 'Doom and Gllom 12' FROM set_4_5
  RETURNING id
)
, votes_4_5_16 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_5_16.id, v.voter_name, v.score
  FROM song_4_5_16,
  (VALUES ('Hernan', 8.0), ('Daniel', 8.0), ('Carlos', 7.5), ('Giusse', 8.5), ('Mauricio O.', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_5_17 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 17, 'The Weeknd', 'Earned It' FROM set_4_5
  RETURNING id
)
, votes_4_5_17 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_5_17.id, v.voter_name, v.score
  FROM song_4_5_17,
  (VALUES ('Hernan', 8.0), ('Daniel', 7.5), ('Carlos', 6.0), ('Giusse', 8.5), ('Mauricio O.', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_4_5_18 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 18, 'Toto', 'Hold the line' FROM set_4_5
  RETURNING id
)
, votes_4_5_18 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_5_18.id, v.voter_name, v.score
  FROM song_4_5_18,
  (VALUES ('Hernan', 8.5), ('Daniel', 8.0), ('Carlos', 7.0), ('Giusse', 9.0), ('Mauricio O.', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_4_5_19 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 19, 'Tracy Chapman', 'Telling Stores' FROM set_4_5
  RETURNING id
)
, votes_4_5_19 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_4_5_19.id, v.voter_name, v.score
  FROM song_4_5_19,
  (VALUES ('Hernan', 8.0), ('Daniel', 7.0), ('Carlos', 7.5), ('Giusse', 8.5), ('Mauricio O.', 7.0)) AS v(voter_name, score)
  RETURNING id
)
SELECT id FROM s4;

WITH s5 AS (
  INSERT INTO cyc_sessions (session_num, host, date, attendees, input_mode, sets_count, songs_count, complete)
  VALUES (5, 'Temporada 5', '2024-02-01', ARRAY["Carlos", "Daniel", "Freddy", "Gino", "Jorge A.", "Jose J", "Lucho", "Mauricio O.", "Mauricio R."]::text[], 'host', 2, 20, true)
  RETURNING id
)
, set_5_0 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 0, 'Set Carlos' FROM s5
  RETURNING id
)
, song_5_0_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'Andy Bell', 'Beautiful' FROM set_5_0
  RETURNING id
)
, votes_5_0_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_5_0_0.id, v.voter_name, v.score
  FROM song_5_0_0,
  (VALUES ('Daniel', 8.0), ('Jorge A.', 6.5), ('Freddy', 9.5), ('Mauricio O.', 7.5), ('Mauricio R.', 8.5), ('Lucho', 8.5), ('Gino', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_5_0_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'Biffy Clyro', 'Bubbles' FROM set_5_0
  RETURNING id
)
, votes_5_0_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_5_0_1.id, v.voter_name, v.score
  FROM song_5_0_1,
  (VALUES ('Daniel', 7.0), ('Jorge A.', 7.0), ('Freddy', 8.5), ('Mauricio O.', 8.5), ('Mauricio R.', 8.5), ('Lucho', 8.0), ('Gino', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_5_0_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'Cherub', 'Dozes and Mimosas' FROM set_5_0
  RETURNING id
)
, votes_5_0_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_5_0_2.id, v.voter_name, v.score
  FROM song_5_0_2,
  (VALUES ('Daniel', 7.5), ('Jorge A.', 8.0), ('Freddy', 9.0), ('Mauricio O.', 9.0), ('Mauricio R.', 8.5), ('Lucho', 7.0), ('Gino', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_5_0_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Deepest Blue', 'Deepest Blue' FROM set_5_0
  RETURNING id
)
, votes_5_0_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_5_0_3.id, v.voter_name, v.score
  FROM song_5_0_3,
  (VALUES ('Daniel', 6.5), ('Jorge A.', 6.5), ('Freddy', 8.0), ('Mauricio O.', 9.0), ('Mauricio R.', 8.5), ('Lucho', 6.5), ('Gino', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_5_0_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'Dorian', 'A cualquier otra parte' FROM set_5_0
  RETURNING id
)
, votes_5_0_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_5_0_4.id, v.voter_name, v.score
  FROM song_5_0_4,
  (VALUES ('Daniel', 9.0), ('Jorge A.', 8.0), ('Freddy', 10.0), ('Mauricio O.', 9.0), ('Mauricio R.', 9.0), ('Lucho', 8.5), ('Gino', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_5_0_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'Elvis Presley', 'A little les conversation' FROM set_5_0
  RETURNING id
)
, votes_5_0_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_5_0_5.id, v.voter_name, v.score
  FROM song_5_0_5,
  (VALUES ('Daniel', 7.0), ('Jorge A.', 7.0), ('Freddy', 6.5), ('Mauricio O.', 8.5), ('Mauricio R.', 6.0), ('Lucho', 8.0), ('Gino', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_5_0_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'Kraftwerk', 'Trans Europe Express (2009 Remaster)' FROM set_5_0
  RETURNING id
)
, votes_5_0_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_5_0_6.id, v.voter_name, v.score
  FROM song_5_0_6,
  (VALUES ('Daniel', 6.0), ('Jorge A.', 5.5), ('Freddy', 8.0), ('Mauricio O.', 6.5), ('Mauricio R.', 8.0), ('Lucho', 9.0), ('Gino', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_5_0_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'Los Davalos', 'Sufriendo Estoy' FROM set_5_0
  RETURNING id
)
, votes_5_0_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_5_0_7.id, v.voter_name, v.score
  FROM song_5_0_7,
  (VALUES ('Daniel', 6.5), ('Jorge A.', 6.0), ('Freddy', 7.0), ('Mauricio O.', 7.5), ('Mauricio R.', 9.0), ('Lucho', 8.0), ('Gino', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_5_0_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'Madness', 'Our House' FROM set_5_0
  RETURNING id
)
, votes_5_0_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_5_0_8.id, v.voter_name, v.score
  FROM song_5_0_8,
  (VALUES ('Daniel', 8.0), ('Jorge A.', 7.5), ('Freddy', 8.5), ('Mauricio O.', 7.5), ('Mauricio R.', 9.0), ('Lucho', 9.0), ('Gino', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_5_0_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'Mikel Erentxun', 'El hombre que hay en mi' FROM set_5_0
  RETURNING id
)
, votes_5_0_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_5_0_9.id, v.voter_name, v.score
  FROM song_5_0_9,
  (VALUES ('Daniel', 7.0), ('Jorge A.', 6.0), ('Freddy', 9.0), ('Mauricio O.', 7.0), ('Mauricio R.', 7.0), ('Lucho', 8.0), ('Gino', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_5_0_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'Motorama', 'Alps' FROM set_5_0
  RETURNING id
)
, votes_5_0_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_5_0_10.id, v.voter_name, v.score
  FROM song_5_0_10,
  (VALUES ('Daniel', 7.5), ('Jorge A.', 6.5), ('Freddy', 9.0), ('Mauricio O.', 6.5), ('Mauricio R.', 6.5), ('Lucho', 7.0), ('Gino', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_5_0_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'Ozzy Osbourne', 'Dreamer' FROM set_5_0
  RETURNING id
)
, votes_5_0_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_5_0_11.id, v.voter_name, v.score
  FROM song_5_0_11,
  (VALUES ('Daniel', 5.0), ('Jorge A.', 6.0), ('Freddy', 7.0), ('Mauricio O.', 7.0), ('Mauricio R.', 9.0), ('Lucho', 7.5), ('Gino', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_5_0_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'Pilot', 'Magic' FROM set_5_0
  RETURNING id
)
, votes_5_0_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_5_0_12.id, v.voter_name, v.score
  FROM song_5_0_12,
  (VALUES ('Daniel', 7.0), ('Jorge A.', 7.0), ('Freddy', 7.0), ('Mauricio O.', 7.5), ('Mauricio R.', 8.5), ('Lucho', 9.0), ('Gino', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_5_0_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'Queen', 'Radio Ga Ga' FROM set_5_0
  RETURNING id
)
, votes_5_0_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_5_0_13.id, v.voter_name, v.score
  FROM song_5_0_13,
  (VALUES ('Daniel', 8.0), ('Jorge A.', 8.5), ('Freddy', 9.0), ('Mauricio O.', 8.5), ('Mauricio R.', 8.5), ('Lucho', 8.5), ('Gino', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_5_0_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'Sometimes Around Midnight', 'The Airbone Toxic Event' FROM set_5_0
  RETURNING id
)
, votes_5_0_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_5_0_14.id, v.voter_name, v.score
  FROM song_5_0_14,
  (VALUES ('Daniel', 7.5), ('Jorge A.', 6.5), ('Freddy', 8.5), ('Mauricio O.', 6.0), ('Mauricio R.', 8.0), ('Lucho', 7.5), ('Gino', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_5_0_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'Sting', 'Shape of my heart' FROM set_5_0
  RETURNING id
)
, votes_5_0_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_5_0_15.id, v.voter_name, v.score
  FROM song_5_0_15,
  (VALUES ('Daniel', 7.0), ('Jorge A.', 9.5), ('Freddy', 9.5), ('Mauricio O.', 8.0), ('Mauricio R.', 9.0), ('Lucho', 9.0), ('Gino', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_5_0_16 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 16, 'Tecnologhy - Elegant Machinery', 'Brave New World' FROM set_5_0
  RETURNING id
)
, votes_5_0_16 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_5_0_16.id, v.voter_name, v.score
  FROM song_5_0_16,
  (VALUES ('Daniel', 7.5), ('Jorge A.', 7.0), ('Freddy', 8.0), ('Mauricio O.', 7.0), ('Mauricio R.', 8.0), ('Lucho', 8.0), ('Gino', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_5_0_17 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 17, 'The Killers', 'Mr Brightside - Jacques Lu Cont mix' FROM set_5_0
  RETURNING id
)
, votes_5_0_17 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_5_0_17.id, v.voter_name, v.score
  FROM song_5_0_17,
  (VALUES ('Daniel', 7.0), ('Jorge A.', 7.0), ('Freddy', 9.0), ('Mauricio O.', 6.5), ('Mauricio R.', 8.5), ('Lucho', 7.5), ('Gino', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_5_0_18 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 18, 'The Strokes', 'Under Cover of Darkness' FROM set_5_0
  RETURNING id
)
, votes_5_0_18 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_5_0_18.id, v.voter_name, v.score
  FROM song_5_0_18,
  (VALUES ('Daniel', 7.0), ('Jorge A.', 7.0), ('Freddy', 8.5), ('Mauricio O.', 6.5), ('Mauricio R.', 8.0), ('Lucho', 6.0), ('Gino', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_5_0_19 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 19, 'Zombies', 'Groenlandia' FROM set_5_0
  RETURNING id
)
, votes_5_0_19 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_5_0_19.id, v.voter_name, v.score
  FROM song_5_0_19,
  (VALUES ('Daniel', 7.0), ('Jorge A.', 7.5), ('Freddy', 8.0), ('Mauricio O.', 9.5), ('Mauricio R.', 9.0), ('Lucho', 8.0), ('Gino', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, set_5_1 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 1, 'Set Rafael' FROM s5
  RETURNING id
)
, song_5_1_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'aznabur y celion dion', 'toi et moi' FROM set_5_1
  RETURNING id
)
, votes_5_1_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_5_1_0.id, v.voter_name, v.score
  FROM song_5_1_0,
  (VALUES ('Jose J', 7.0), ('Daniel', 7.0), ('Jorge A.', 7.0), ('Carlos', 5.0)) AS v(voter_name, score)
  RETURNING id
)
, song_5_1_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'bob dilan', 'lay lady lay' FROM set_5_1
  RETURNING id
)
, votes_5_1_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_5_1_1.id, v.voter_name, v.score
  FROM song_5_1_1,
  (VALUES ('Jose J', 7.0), ('Daniel', 7.0), ('Jorge A.', 7.0), ('Carlos', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_5_1_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'brian ferry', 'slave love' FROM set_5_1
  RETURNING id
)
, votes_5_1_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_5_1_2.id, v.voter_name, v.score
  FROM song_5_1_2,
  (VALUES ('Jose J', 8.5), ('Daniel', 8.0), ('Jorge A.', 7.5), ('Carlos', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_5_1_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Coldplay', 'life in technicolor' FROM set_5_1
  RETURNING id
)
, votes_5_1_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_5_1_3.id, v.voter_name, v.score
  FROM song_5_1_3,
  (VALUES ('Jose J', 8.0), ('Daniel', 6.5), ('Jorge A.', 7.5), ('Carlos', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_5_1_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'david bowie', 'let´s dance' FROM set_5_1
  RETURNING id
)
, votes_5_1_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_5_1_4.id, v.voter_name, v.score
  FROM song_5_1_4,
  (VALUES ('Jose J', 7.0), ('Daniel', 8.0), ('Jorge A.', 8.0), ('Carlos', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_5_1_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'madonna', 'sorry' FROM set_5_1
  RETURNING id
)
, votes_5_1_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_5_1_5.id, v.voter_name, v.score
  FROM song_5_1_5,
  (VALUES ('Jose J', 7.0), ('Daniel', 7.0), ('Jorge A.', 7.5), ('Carlos', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_5_1_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'madonna', 'isaac' FROM set_5_1
  RETURNING id
)
, votes_5_1_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_5_1_6.id, v.voter_name, v.score
  FROM song_5_1_6,
  (VALUES ('Jose J', 6.5), ('Daniel', 6.0), ('Jorge A.', 5.5), ('Carlos', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_5_1_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'nancy sinatra (kill bill)', 'bang bang' FROM set_5_1
  RETURNING id
)
, votes_5_1_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_5_1_7.id, v.voter_name, v.score
  FROM song_5_1_7,
  (VALUES ('Jose J', 6.0), ('Daniel', 7.0), ('Jorge A.', 7.0), ('Carlos', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_5_1_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'nied diamond', 'solitary man' FROM set_5_1
  RETURNING id
)
, votes_5_1_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_5_1_8.id, v.voter_name, v.score
  FROM song_5_1_8,
  (VALUES ('Jose J', 7.0), ('Daniel', 6.0), ('Jorge A.', 6.0), ('Carlos', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_5_1_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'obk', 'remix salvame' FROM set_5_1
  RETURNING id
)
, votes_5_1_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_5_1_9.id, v.voter_name, v.score
  FROM song_5_1_9,
  (VALUES ('Jose J', 8.0), ('Daniel', 8.0), ('Jorge A.', 9.5), ('Carlos', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_5_1_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'Path Methiny', 'and I  love her' FROM set_5_1
  RETURNING id
)
, votes_5_1_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_5_1_10.id, v.voter_name, v.score
  FROM song_5_1_10,
  (VALUES ('Jose J', 9.0), ('Daniel', 8.0), ('Jorge A.', 9.5), ('Carlos', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_5_1_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'Pet shop boys', 'being boring' FROM set_5_1
  RETURNING id
)
, votes_5_1_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_5_1_11.id, v.voter_name, v.score
  FROM song_5_1_11,
  (VALUES ('Jose J', 8.0), ('Daniel', 8.5), ('Jorge A.', 9.5), ('Carlos', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_5_1_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'Queen', 'under presure' FROM set_5_1
  RETURNING id
)
, votes_5_1_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_5_1_12.id, v.voter_name, v.score
  FROM song_5_1_12,
  (VALUES ('Jose J', 8.5), ('Daniel', 8.5), ('Jorge A.', 8.5), ('Carlos', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_5_1_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'Queen', 'inuendo' FROM set_5_1
  RETURNING id
)
, votes_5_1_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_5_1_13.id, v.voter_name, v.score
  FROM song_5_1_13,
  (VALUES ('Jose J', 9.0), ('Daniel', 8.5), ('Jorge A.', 8.0), ('Carlos', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_5_1_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'R.E.M', 'the one i love' FROM set_5_1
  RETURNING id
)
, votes_5_1_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_5_1_14.id, v.voter_name, v.score
  FROM song_5_1_14,
  (VALUES ('Jose J', 7.5), ('Daniel', 9.0), ('Jorge A.', 8.0), ('Carlos', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_5_1_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'simon and garfunkel', 'the boxer' FROM set_5_1
  RETURNING id
)
, votes_5_1_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_5_1_15.id, v.voter_name, v.score
  FROM song_5_1_15,
  (VALUES ('Jose J', 8.5), ('Daniel', 7.0), ('Jorge A.', 7.0), ('Carlos', 10.0)) AS v(voter_name, score)
  RETURNING id
)
, song_5_1_16 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 16, 'sting', 'field of gold' FROM set_5_1
  RETURNING id
)
, votes_5_1_16 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_5_1_16.id, v.voter_name, v.score
  FROM song_5_1_16,
  (VALUES ('Jose J', 8.5), ('Daniel', 7.0), ('Jorge A.', 7.5), ('Carlos', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_5_1_17 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 17, 'the doors', 'riders on the storm' FROM set_5_1
  RETURNING id
)
, votes_5_1_17 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_5_1_17.id, v.voter_name, v.score
  FROM song_5_1_17,
  (VALUES ('Jose J', 7.0), ('Daniel', 7.5), ('Jorge A.', 8.5), ('Carlos', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_5_1_18 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 18, 'U2', 'vertigo' FROM set_5_1
  RETURNING id
)
, votes_5_1_18 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_5_1_18.id, v.voter_name, v.score
  FROM song_5_1_18,
  (VALUES ('Jose J', 7.0), ('Jorge A.', 7.5), ('Carlos', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_5_1_19 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 19, 'yes', 'owner of a loney heart' FROM set_5_1
  RETURNING id
)
, votes_5_1_19 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_5_1_19.id, v.voter_name, v.score
  FROM song_5_1_19,
  (VALUES ('Jose J', 7.0), ('Daniel', 8.0), ('Jorge A.', 8.0), ('Carlos', 8.0)) AS v(voter_name, score)
  RETURNING id
)
SELECT id FROM s5;

WITH s6 AS (
  INSERT INTO cyc_sessions (session_num, host, date, attendees, input_mode, sets_count, songs_count, complete)
  VALUES (6, 'Temporada 6', '2024-05-01', ARRAY["Alex", "Carlos", "Daniel", "Freddy", "Gino", "Giusse", "Jorge A.", "Mario", "Mauricio O.", "Mauricio R.", "Patrick"]::text[], 'host', 9, 20, true)
  RETURNING id
)
, set_6_0 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 0, 'Set Alex' FROM s6
  RETURNING id
)
, song_6_0_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'Austin Mahone, Pitbull', 'Lady' FROM set_6_0
  RETURNING id
)
, votes_6_0_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_0_0.id, v.voter_name, v.score
  FROM song_6_0_0,
  (VALUES ('Daniel', 6.0), ('Carlos', 3.0), ('Mauricio R.', 2.0), ('Gino', 3.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_0_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'Avicci', 'Wake me up' FROM set_6_0
  RETURNING id
)
, votes_6_0_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_0_1.id, v.voter_name, v.score
  FROM song_6_0_1,
  (VALUES ('Daniel', 8.0), ('Carlos', 8.0), ('Mauricio R.', 8.0), ('Gino', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_0_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'Bee Gees', 'Staying´Alive' FROM set_6_0
  RETURNING id
)
, votes_6_0_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_0_2.id, v.voter_name, v.score
  FROM song_6_0_2,
  (VALUES ('Daniel', 7.0), ('Carlos', 8.0), ('Mauricio R.', 7.5), ('Gino', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_6_0_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Bill Medley, Jennifer Warnes', 'The time of my life' FROM set_6_0
  RETURNING id
)
, votes_6_0_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_0_3.id, v.voter_name, v.score
  FROM song_6_0_3,
  (VALUES ('Daniel', 8.0), ('Carlos', 7.0), ('Mauricio R.', 6.0), ('Gino', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_0_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'Bruno Mars', 'Just the way you are' FROM set_6_0
  RETURNING id
)
, votes_6_0_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_0_4.id, v.voter_name, v.score
  FROM song_6_0_4,
  (VALUES ('Daniel', 7.5), ('Carlos', 6.0), ('Mauricio R.', 6.0), ('Gino', 5.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_0_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'Bryan Adams', 'Summer of 69' FROM set_6_0
  RETURNING id
)
, votes_6_0_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_0_5.id, v.voter_name, v.score
  FROM song_6_0_5,
  (VALUES ('Daniel', 6.0), ('Carlos', 7.0), ('Mauricio R.', 7.5), ('Gino', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_0_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'C. C. Revival', 'Have you ever seen the rain' FROM set_6_0
  RETURNING id
)
, votes_6_0_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_0_6.id, v.voter_name, v.score
  FROM song_6_0_6,
  (VALUES ('Daniel', 8.0), ('Carlos', 8.5), ('Mauricio R.', 8.5), ('Gino', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_6_0_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'Charlie Puth', 'Attention' FROM set_6_0
  RETURNING id
)
, votes_6_0_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_0_7.id, v.voter_name, v.score
  FROM song_6_0_7,
  (VALUES ('Daniel', 7.0), ('Carlos', 6.5), ('Mauricio R.', 7.0), ('Gino', 5.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_0_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'David Guetta, Showtex, Vassy', 'Bad' FROM set_6_0
  RETURNING id
)
, votes_6_0_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_0_8.id, v.voter_name, v.score
  FROM song_6_0_8,
  (VALUES ('Daniel', 6.0), ('Carlos', 3.0), ('Mauricio R.', 3.5), ('Gino', 2.5)) AS v(voter_name, score)
  RETURNING id
)
, song_6_0_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'David Guetta, Usher', 'Without You' FROM set_6_0
  RETURNING id
)
, votes_6_0_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_0_9.id, v.voter_name, v.score
  FROM song_6_0_9,
  (VALUES ('Daniel', 6.5), ('Carlos', 7.0), ('Mauricio R.', 6.5), ('Gino', 5.5)) AS v(voter_name, score)
  RETURNING id
)
, song_6_0_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'Dire Straits', 'Walk of life' FROM set_6_0
  RETURNING id
)
, votes_6_0_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_0_10.id, v.voter_name, v.score
  FROM song_6_0_10,
  (VALUES ('Daniel', 7.0), ('Carlos', 8.0), ('Mauricio R.', 8.0), ('Gino', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_0_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'Kungs, Cooking On 3 Burners', 'This girl' FROM set_6_0
  RETURNING id
)
, votes_6_0_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_0_11.id, v.voter_name, v.score
  FROM song_6_0_11,
  (VALUES ('Daniel', 6.0), ('Carlos', 5.0), ('Mauricio R.', 4.0), ('Gino', 5.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_0_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'Ne-Yo', 'Because of you' FROM set_6_0
  RETURNING id
)
, votes_6_0_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_0_12.id, v.voter_name, v.score
  FROM song_6_0_12,
  (VALUES ('Daniel', 6.5), ('Carlos', 4.0), ('Mauricio R.', 5.0), ('Gino', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_0_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'Paul Simon', 'You can call me Al' FROM set_6_0
  RETURNING id
)
, votes_6_0_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_0_13.id, v.voter_name, v.score
  FROM song_6_0_13,
  (VALUES ('Daniel', 6.0), ('Carlos', 6.5), ('Mauricio R.', 6.0), ('Gino', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_6_0_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'Pitbull, Jhon Ryan', 'Fireball' FROM set_6_0
  RETURNING id
)
, votes_6_0_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_0_14.id, v.voter_name, v.score
  FROM song_6_0_14,
  (VALUES ('Daniel', 8.0), ('Carlos', 6.0), ('Mauricio R.', 4.0), ('Gino', 3.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_0_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'Pitbull, Ne-Yo.', 'Give me everything' FROM set_6_0
  RETURNING id
)
, votes_6_0_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_0_15.id, v.voter_name, v.score
  FROM song_6_0_15,
  (VALUES ('Daniel', 7.5), ('Carlos', 4.0), ('Mauricio R.', 2.0), ('Gino', 2.5)) AS v(voter_name, score)
  RETURNING id
)
, song_6_0_16 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 16, 'Spin Doctors', 'Two Princes' FROM set_6_0
  RETURNING id
)
, votes_6_0_16 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_0_16.id, v.voter_name, v.score
  FROM song_6_0_16,
  (VALUES ('Daniel', 7.0), ('Carlos', 7.0), ('Mauricio R.', 8.5), ('Gino', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_0_17 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 17, 'The B-52´s', 'Private Idaho' FROM set_6_0
  RETURNING id
)
, votes_6_0_17 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_0_17.id, v.voter_name, v.score
  FROM song_6_0_17,
  (VALUES ('Daniel', 9.0), ('Carlos', 8.5), ('Mauricio R.', 9.0), ('Gino', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_0_18 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 18, 'The Hollies', 'Long Cool Woman' FROM set_6_0
  RETURNING id
)
, votes_6_0_18 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_0_18.id, v.voter_name, v.score
  FROM song_6_0_18,
  (VALUES ('Daniel', 8.0), ('Carlos', 8.5), ('Mauricio R.', 8.5), ('Gino', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_6_0_19 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 19, 'The Pointer Ssisters', 'I´m so excited' FROM set_6_0
  RETURNING id
)
, votes_6_0_19 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_0_19.id, v.voter_name, v.score
  FROM song_6_0_19,
  (VALUES ('Daniel', 7.0), ('Carlos', 6.0), ('Mauricio R.', 5.0), ('Gino', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, set_6_1 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 1, 'Set Carlos' FROM s6
  RETURNING id
)
, song_6_1_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'Alan Walker', 'Faded' FROM set_6_1
  RETURNING id
)
, votes_6_1_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_1_0.id, v.voter_name, v.score
  FROM song_6_1_0,
  (VALUES ('Mario', 8.5), ('Daniel', 8.0), ('Freddy', 6.0), ('Giusse', 5.0), ('Mauricio O.', 8.5), ('Gino', 8.5), ('Patrick', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_1_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'Bronski Beat - Marc Almond', 'I feel love' FROM set_6_1
  RETURNING id
)
, votes_6_1_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_1_1.id, v.voter_name, v.score
  FROM song_6_1_1,
  (VALUES ('Mario', 9.0), ('Daniel', 7.0), ('Freddy', 8.0), ('Giusse', 8.5), ('Mauricio O.', 7.0), ('Gino', 9.5), ('Patrick', 10.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_1_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'Count On Me', 'Camouflage' FROM set_6_1
  RETURNING id
)
, votes_6_1_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_1_2.id, v.voter_name, v.score
  FROM song_6_1_2,
  (VALUES ('Mario', 7.0), ('Daniel', 7.0), ('Freddy', 7.0), ('Giusse', 8.0), ('Mauricio O.', 7.0), ('Gino', 7.0), ('Patrick', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_1_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Counting Crow', 'Mr Jones' FROM set_6_1
  RETURNING id
)
, votes_6_1_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_1_3.id, v.voter_name, v.score
  FROM song_6_1_3,
  (VALUES ('Mario', 8.5), ('Daniel', 7.0), ('Freddy', 7.5), ('Giusse', 9.5), ('Mauricio O.', 9.0), ('Gino', 6.5), ('Patrick', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_1_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'Danai', 'Detengamos un Minuto' FROM set_6_1
  RETURNING id
)
, votes_6_1_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_1_4.id, v.voter_name, v.score
  FROM song_6_1_4,
  (VALUES ('Mario', 6.0), ('Daniel', 4.0), ('Freddy', 6.0), ('Giusse', 7.0), ('Mauricio O.', 6.0), ('Gino', 4.0), ('Patrick', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_1_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'Depeche Mode', 'Where is the revolution' FROM set_6_1
  RETURNING id
)
, votes_6_1_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_1_5.id, v.voter_name, v.score
  FROM song_6_1_5,
  (VALUES ('Mario', 9.0), ('Daniel', 8.0), ('Freddy', 8.0), ('Giusse', 8.0), ('Mauricio O.', 6.5), ('Gino', 8.5), ('Patrick', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_1_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'Duke Dumont', 'I Got U' FROM set_6_1
  RETURNING id
)
, votes_6_1_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_1_6.id, v.voter_name, v.score
  FROM song_6_1_6,
  (VALUES ('Mario', 9.0), ('Daniel', 7.0), ('Freddy', 8.0), ('Giusse', 7.0), ('Mauricio O.', 8.0), ('Gino', 6.0), ('Patrick', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_1_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'Electric Guest', 'Back for Me' FROM set_6_1
  RETURNING id
)
, votes_6_1_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_1_7.id, v.voter_name, v.score
  FROM song_6_1_7,
  (VALUES ('Mario', 6.0), ('Daniel', 5.5), ('Freddy', 5.0), ('Giusse', 5.0), ('Mauricio O.', 6.5), ('Gino', 7.0), ('Patrick', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_1_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'Head On', 'Jesus and Mary Chain' FROM set_6_1
  RETURNING id
)
, votes_6_1_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_1_8.id, v.voter_name, v.score
  FROM song_6_1_8,
  (VALUES ('Mario', 6.5), ('Daniel', 8.0), ('Freddy', 7.0), ('Giusse', 7.0), ('Mauricio O.', 9.0), ('Gino', 8.0), ('Patrick', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_1_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'Hot Chocolate', 'Every 1´s a winner' FROM set_6_1
  RETURNING id
)
, votes_6_1_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_1_9.id, v.voter_name, v.score
  FROM song_6_1_9,
  (VALUES ('Mario', 8.5), ('Daniel', 7.5), ('Freddy', 9.0), ('Giusse', 8.5), ('Mauricio O.', 8.0), ('Gino', 7.5), ('Patrick', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_1_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'Mocedades', 'Solo era un niño' FROM set_6_1
  RETURNING id
)
, votes_6_1_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_1_10.id, v.voter_name, v.score
  FROM song_6_1_10,
  (VALUES ('Mario', 8.0), ('Daniel', 6.0), ('Freddy', 7.0), ('Giusse', 8.0), ('Mauricio O.', 5.0), ('Gino', 4.0), ('Patrick', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_1_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'Nacha Pop', 'La chica de Ayer' FROM set_6_1
  RETURNING id
)
, votes_6_1_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_1_11.id, v.voter_name, v.score
  FROM song_6_1_11,
  (VALUES ('Mario', 6.5), ('Daniel', 6.5), ('Freddy', 6.0), ('Giusse', 8.0), ('Mauricio O.', 7.0), ('Gino', 6.5), ('Patrick', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_1_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'Pet Shop Boys', 'Yesterday when I was Mad' FROM set_6_1
  RETURNING id
)
, votes_6_1_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_1_12.id, v.voter_name, v.score
  FROM song_6_1_12,
  (VALUES ('Mario', 8.0), ('Daniel', 7.5), ('Freddy', 8.5), ('Giusse', 7.5), ('Mauricio O.', 7.0), ('Gino', 7.0), ('Patrick', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_1_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'Ten Fe', 'Over Flow' FROM set_6_1
  RETURNING id
)
, votes_6_1_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_1_13.id, v.voter_name, v.score
  FROM song_6_1_13,
  (VALUES ('Mario', 8.0), ('Daniel', 8.0), ('Freddy', 7.0), ('Giusse', 8.0), ('Mauricio O.', 7.0), ('Gino', 8.0), ('Patrick', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_1_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'Terry Jacks', 'Seasons in the Sun' FROM set_6_1
  RETURNING id
)
, votes_6_1_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_1_14.id, v.voter_name, v.score
  FROM song_6_1_14,
  (VALUES ('Mario', 9.0), ('Daniel', 8.0), ('Freddy', 10.0), ('Giusse', 8.0), ('Mauricio O.', 9.5), ('Gino', 8.0), ('Patrick', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_1_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'The Guess Who', 'American Woman' FROM set_6_1
  RETURNING id
)
, votes_6_1_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_1_15.id, v.voter_name, v.score
  FROM song_6_1_15,
  (VALUES ('Mario', 10.0), ('Daniel', 8.0), ('Freddy', 9.0), ('Giusse', 9.0), ('Mauricio O.', 9.0), ('Gino', 7.5), ('Patrick', 10.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_1_16 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 16, 'The Letter', 'The Box Tops' FROM set_6_1
  RETURNING id
)
, votes_6_1_16 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_1_16.id, v.voter_name, v.score
  FROM song_6_1_16,
  (VALUES ('Mario', 8.5), ('Daniel', 7.0), ('Freddy', 8.0), ('Giusse', 7.0), ('Mauricio O.', 7.0), ('Gino', 7.5), ('Patrick', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_1_17 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 17, 'The Motels', 'Suddenly Last Summer' FROM set_6_1
  RETURNING id
)
, votes_6_1_17 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_1_17.id, v.voter_name, v.score
  FROM song_6_1_17,
  (VALUES ('Mario', 8.5), ('Daniel', 7.0), ('Freddy', 9.0), ('Giusse', 9.5), ('Mauricio O.', 8.5), ('Gino', 10.0), ('Patrick', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_1_18 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 18, 'The Rolling Stones', 'Ruby Tuesday' FROM set_6_1
  RETURNING id
)
, votes_6_1_18 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_1_18.id, v.voter_name, v.score
  FROM song_6_1_18,
  (VALUES ('Mario', 9.0), ('Daniel', 7.5), ('Freddy', 10.0), ('Giusse', 9.0), ('Mauricio O.', 8.0), ('Gino', 9.5), ('Patrick', 10.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_1_19 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 19, 'ZZ Top', 'La Grange' FROM set_6_1
  RETURNING id
)
, votes_6_1_19 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_1_19.id, v.voter_name, v.score
  FROM song_6_1_19,
  (VALUES ('Mario', 10.0), ('Daniel', 9.5), ('Freddy', 7.0), ('Giusse', 9.0), ('Mauricio O.', 7.0), ('Gino', 9.5), ('Patrick', 10.0)) AS v(voter_name, score)
  RETURNING id
)
, set_6_2 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 2, 'Set Daniel' FROM s6
  RETURNING id
)
, song_6_2_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'Aerosmith', 'living on the edge' FROM set_6_2
  RETURNING id
)
, votes_6_2_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_2_0.id, v.voter_name, v.score
  FROM song_6_2_0,
  (VALUES ('Mario', 7.0), ('Carlos', 7.5), ('Mauricio R.', 8.0), ('Patrick', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_2_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'Aerosmith', 'Cryin' FROM set_6_2
  RETURNING id
)
, votes_6_2_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_2_1.id, v.voter_name, v.score
  FROM song_6_2_1,
  (VALUES ('Mario', 8.0), ('Carlos', 7.0), ('Mauricio R.', 7.0), ('Patrick', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_2_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'Alanis Morissette', 'you ougtha know' FROM set_6_2
  RETURNING id
)
, votes_6_2_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_2_2.id, v.voter_name, v.score
  FROM song_6_2_2,
  (VALUES ('Mario', 5.0), ('Carlos', 7.0), ('Mauricio R.', 5.0), ('Patrick', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_2_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Billy Idol', 'Hot in the city' FROM set_6_2
  RETURNING id
)
, votes_6_2_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_2_3.id, v.voter_name, v.score
  FROM song_6_2_3,
  (VALUES ('Mario', 9.0), ('Carlos', 9.0), ('Mauricio R.', 6.5), ('Patrick', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_2_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'Bon Jovi', 'Run away' FROM set_6_2
  RETURNING id
)
, votes_6_2_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_2_4.id, v.voter_name, v.score
  FROM song_6_2_4,
  (VALUES ('Mario', 9.0), ('Carlos', 7.5), ('Mauricio R.', 7.0), ('Patrick', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_2_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'Bon Jovi', 'NEVER SAY GOOD BYE' FROM set_6_2
  RETURNING id
)
, votes_6_2_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_2_5.id, v.voter_name, v.score
  FROM song_6_2_5,
  (VALUES ('Mario', 8.0), ('Carlos', 6.5), ('Mauricio R.', 6.5), ('Patrick', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_2_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'Bryan Adams', 'SUMMER OF 69' FROM set_6_2
  RETURNING id
)
, votes_6_2_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_2_6.id, v.voter_name, v.score
  FROM song_6_2_6,
  (VALUES ('Mario', 7.5), ('Carlos', 7.5), ('Mauricio R.', 7.0), ('Patrick', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_2_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'FOO FIGHTERS', 'everlong' FROM set_6_2
  RETURNING id
)
, votes_6_2_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_2_7.id, v.voter_name, v.score
  FROM song_6_2_7,
  (VALUES ('Mario', 9.0), ('Carlos', 6.5), ('Mauricio R.', 9.0), ('Patrick', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_2_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'Green Day', '21 guns' FROM set_6_2
  RETURNING id
)
, votes_6_2_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_2_8.id, v.voter_name, v.score
  FROM song_6_2_8,
  (VALUES ('Mario', 7.0), ('Carlos', 9.0), ('Mauricio R.', 6.5), ('Patrick', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_2_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'Guns N'' Roses', 'You could be mine' FROM set_6_2
  RETURNING id
)
, votes_6_2_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_2_9.id, v.voter_name, v.score
  FROM song_6_2_9,
  (VALUES ('Mario', 7.5), ('Carlos', 6.5), ('Mauricio R.', 6.0), ('Patrick', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_2_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'HOLE', 'Malibu' FROM set_6_2
  RETURNING id
)
, votes_6_2_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_2_10.id, v.voter_name, v.score
  FROM song_6_2_10,
  (VALUES ('Mario', 6.0), ('Carlos', 7.0), ('Mauricio R.', 7.0), ('Patrick', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_2_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'Linkin Park', 'What ive done (concierto Moscow)' FROM set_6_2
  RETURNING id
)
, votes_6_2_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_2_11.id, v.voter_name, v.score
  FROM song_6_2_11,
  (VALUES ('Mario', 9.0), ('Carlos', 8.5), ('Mauricio R.', 7.0), ('Patrick', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_2_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'MOJARRAS', 'TRICICLO PERU' FROM set_6_2
  RETURNING id
)
, votes_6_2_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_2_12.id, v.voter_name, v.score
  FROM song_6_2_12,
  (VALUES ('Mario', 9.0), ('Carlos', 8.5), ('Mauricio R.', 8.0), ('Patrick', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_2_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'Nirvana', 'come as you are (unplugged in new york)' FROM set_6_2
  RETURNING id
)
, votes_6_2_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_2_13.id, v.voter_name, v.score
  FROM song_6_2_13,
  (VALUES ('Mario', 7.0), ('Carlos', 7.5), ('Mauricio R.', 8.0), ('Patrick', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_2_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'Poison', 'fallen angel' FROM set_6_2
  RETURNING id
)
, votes_6_2_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_2_14.id, v.voter_name, v.score
  FROM song_6_2_14,
  (VALUES ('Mario', 7.5), ('Carlos', 7.5), ('Mauricio R.', 9.0), ('Patrick', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_2_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'Red hot chili peppers', 'Otherside' FROM set_6_2
  RETURNING id
)
, votes_6_2_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_2_15.id, v.voter_name, v.score
  FROM song_6_2_15,
  (VALUES ('Mario', 8.5), ('Carlos', 8.0), ('Mauricio R.', 8.0), ('Patrick', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_2_16 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 16, 'SOUL ASSYLUM', 'runaway train' FROM set_6_2
  RETURNING id
)
, votes_6_2_16 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_2_16.id, v.voter_name, v.score
  FROM song_6_2_16,
  (VALUES ('Mario', 8.0), ('Carlos', 8.0), ('Mauricio R.', 8.5), ('Patrick', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_2_17 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 17, 'The killers', 'Human/read my mind' FROM set_6_2
  RETURNING id
)
, votes_6_2_17 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_2_17.id, v.voter_name, v.score
  FROM song_6_2_17,
  (VALUES ('Mario', 8.5), ('Carlos', 9.0), ('Mauricio R.', 7.0), ('Patrick', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_2_18 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 18, 'The Offspring', 'original prankster' FROM set_6_2
  RETURNING id
)
, votes_6_2_18 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_2_18.id, v.voter_name, v.score
  FROM song_6_2_18,
  (VALUES ('Mario', 7.0), ('Carlos', 7.0), ('Mauricio R.', 8.5), ('Patrick', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_2_19 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 19, 'U2', 'still haven found what ive' FROM set_6_2
  RETURNING id
)
, votes_6_2_19 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_2_19.id, v.voter_name, v.score
  FROM song_6_2_19,
  (VALUES ('Mario', 9.0), ('Carlos', 8.0), ('Mauricio R.', 8.0), ('Patrick', 10.0)) AS v(voter_name, score)
  RETURNING id
)
, set_6_3 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 3, 'Set Jorge Andre' FROM s6
  RETURNING id
)
, song_6_3_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'Alok, Bruno Martini', 'Hear me now' FROM set_6_3
  RETURNING id
)
, votes_6_3_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_3_0.id, v.voter_name, v.score
  FROM song_6_3_0,
  (VALUES ('Mario', 7.0), ('Carlos', 8.5), ('Mauricio O.', 7.0), ('Patrick', 8.0), ('Alex', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_6_3_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'Don Henley', 'The boys of summer' FROM set_6_3
  RETURNING id
)
, votes_6_3_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_3_1.id, v.voter_name, v.score
  FROM song_6_3_1,
  (VALUES ('Mario', 8.0), ('Carlos', 7.5), ('Mauricio O.', 6.5), ('Patrick', 6.0), ('Alex', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_6_3_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'Farbwall', 'I took a pill in Ibiza' FROM set_6_3
  RETURNING id
)
, votes_6_3_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_3_2.id, v.voter_name, v.score
  FROM song_6_3_2,
  (VALUES ('Mario', 6.0), ('Carlos', 7.5), ('Mauricio O.', 6.0), ('Patrick', 5.0), ('Alex', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_3_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Giacomo Puccini, Luciano Pavarotti', 'Nessun Dorma' FROM set_6_3
  RETURNING id
)
, votes_6_3_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_3_3.id, v.voter_name, v.score
  FROM song_6_3_3,
  (VALUES ('Mario', 9.0), ('Gino', 10.0), ('Patrick', 10.0), ('Alex', 10.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_3_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'Godsmack', 'I stand alone' FROM set_6_3
  RETURNING id
)
, votes_6_3_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_3_4.id, v.voter_name, v.score
  FROM song_6_3_4,
  (VALUES ('Mario', 5.0), ('Carlos', 4.0), ('Mauricio O.', 8.0), ('Patrick', 7.0), ('Alex', 2.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_3_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'Home', 'Resonance' FROM set_6_3
  RETURNING id
)
, votes_6_3_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_3_5.id, v.voter_name, v.score
  FROM song_6_3_5,
  (VALUES ('Mario', 6.0), ('Carlos', 5.0), ('Mauricio O.', 6.5), ('Patrick', 5.0), ('Alex', 4.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_3_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'Ivan Dorn', 'Curler' FROM set_6_3
  RETURNING id
)
, votes_6_3_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_3_6.id, v.voter_name, v.score
  FROM song_6_3_6,
  (VALUES ('Mario', 8.5), ('Carlos', 7.0), ('Mauricio O.', 6.5), ('Patrick', 7.0), ('Alex', 5.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_3_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'Jamiroquai', 'Little L' FROM set_6_3
  RETURNING id
)
, votes_6_3_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_3_7.id, v.voter_name, v.score
  FROM song_6_3_7,
  (VALUES ('Mario', 6.0), ('Carlos', 7.0), ('Mauricio O.', 8.0), ('Patrick', 7.0), ('Alex', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_3_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'Kaiser chiefs', 'Ruby' FROM set_6_3
  RETURNING id
)
, votes_6_3_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_3_8.id, v.voter_name, v.score
  FROM song_6_3_8,
  (VALUES ('Mario', 8.0), ('Carlos', 9.0), ('Mauricio O.', 8.0), ('Patrick', 8.0), ('Alex', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_6_3_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'Limp Bizkit', 'Take a look around' FROM set_6_3
  RETURNING id
)
, votes_6_3_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_3_9.id, v.voter_name, v.score
  FROM song_6_3_9,
  (VALUES ('Mario', 9.0), ('Carlos', 7.5), ('Mauricio O.', 9.0), ('Patrick', 10.0), ('Alex', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_3_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'Maroon 5', 'Sugar' FROM set_6_3
  RETURNING id
)
, votes_6_3_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_3_10.id, v.voter_name, v.score
  FROM song_6_3_10,
  (VALUES ('Mario', 7.5), ('Carlos', 8.0), ('Mauricio O.', 7.5), ('Patrick', 8.0), ('Alex', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_6_3_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'Michael Sembello', 'Maniac' FROM set_6_3
  RETURNING id
)
, votes_6_3_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_3_11.id, v.voter_name, v.score
  FROM song_6_3_11,
  (VALUES ('Mario', 8.0), ('Carlos', 7.5), ('Mauricio O.', 7.5), ('Patrick', 8.0), ('Alex', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_6_3_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'Oasis', 'Don''t go away' FROM set_6_3
  RETURNING id
)
, votes_6_3_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_3_12.id, v.voter_name, v.score
  FROM song_6_3_12,
  (VALUES ('Mario', 9.0), ('Carlos', 8.0), ('Mauricio O.', 8.5), ('Patrick', 7.0), ('Alex', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_6_3_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'Peter Bjorn, Bruno Martini', 'Young Folks' FROM set_6_3
  RETURNING id
)
, votes_6_3_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_3_13.id, v.voter_name, v.score
  FROM song_6_3_13,
  (VALUES ('Mario', 8.0), ('Carlos', 10.0), ('Mauricio O.', 8.5), ('Patrick', 8.0), ('Alex', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_3_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'Radiohead', 'High and Dry' FROM set_6_3
  RETURNING id
)
, votes_6_3_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_3_14.id, v.voter_name, v.score
  FROM song_6_3_14,
  (VALUES ('Mario', 7.0), ('Carlos', 8.0), ('Mauricio O.', 9.0), ('Patrick', 7.0), ('Alex', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_3_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'Ramnstein', 'Mein Teil' FROM set_6_3
  RETURNING id
)
, votes_6_3_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_3_15.id, v.voter_name, v.score
  FROM song_6_3_15,
  (VALUES ('Mario', 6.0), ('Carlos', 9.0), ('Mauricio O.', 9.0), ('Patrick', 8.0), ('Alex', 1.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_3_16 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 16, 'Robin Schulz, Jasmine Thompson', 'Sun Goes down' FROM set_6_3
  RETURNING id
)
, votes_6_3_16 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_3_16.id, v.voter_name, v.score
  FROM song_6_3_16,
  (VALUES ('Mario', 8.0), ('Carlos', 9.0), ('Mauricio O.', 9.0), ('Patrick', 8.0), ('Alex', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_6_3_17 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 17, 'Rusted Root', 'Send me on my way' FROM set_6_3
  RETURNING id
)
, votes_6_3_17 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_3_17.id, v.voter_name, v.score
  FROM song_6_3_17,
  (VALUES ('Mario', 9.0), ('Carlos', 8.0), ('Mauricio O.', 6.0), ('Patrick', 10.0), ('Alex', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_6_3_18 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 18, 'Skank', 'Estaré prendido de tus dedos' FROM set_6_3
  RETURNING id
)
, votes_6_3_18 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_3_18.id, v.voter_name, v.score
  FROM song_6_3_18,
  (VALUES ('Mario', 8.0), ('Carlos', 7.5), ('Mauricio O.', 8.5), ('Patrick', 7.0), ('Alex', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_6_3_19 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 19, 'TROUBLE (feat Absofacto)', 'The Knocks' FROM set_6_3
  RETURNING id
)
, votes_6_3_19 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_3_19.id, v.voter_name, v.score
  FROM song_6_3_19,
  (VALUES ('Mario', 7.0), ('Carlos', 8.0), ('Mauricio O.', 7.0), ('Patrick', 5.0), ('Alex', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, set_6_4 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 4, 'Set Lucho' FROM s6
  RETURNING id
)
, song_6_4_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'AC/DC', 'Hells Bells' FROM set_6_4
  RETURNING id
)
, votes_6_4_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_4_0.id, v.voter_name, v.score
  FROM song_6_4_0,
  (VALUES ('Mario', 8.5), ('Daniel', 8.0), ('Jorge A.', 8.0), ('Carlos', 8.0), ('Giusse', 8.5), ('Mauricio O.', 9.0), ('Mauricio R.', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_6_4_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'All Saints', 'Pure Shores' FROM set_6_4
  RETURNING id
)
, votes_6_4_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_4_1.id, v.voter_name, v.score
  FROM song_6_4_1,
  (VALUES ('Mario', 6.5), ('Daniel', 7.0), ('Jorge A.', 7.0), ('Carlos', 6.0), ('Giusse', 7.0), ('Mauricio O.', 8.5), ('Mauricio R.', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_4_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'Bachman Turner Overdrive', 'You ain´t seen nothing yet' FROM set_6_4
  RETURNING id
)
, votes_6_4_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_4_2.id, v.voter_name, v.score
  FROM song_6_4_2,
  (VALUES ('Mario', 8.0), ('Daniel', 8.0), ('Jorge A.', 7.5), ('Carlos', 8.5), ('Giusse', 8.5), ('Mauricio O.', 9.0), ('Mauricio R.', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_4_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Belle & Sebastian', 'Perfect couples' FROM set_6_4
  RETURNING id
)
, votes_6_4_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_4_3.id, v.voter_name, v.score
  FROM song_6_4_3,
  (VALUES ('Mario', 8.0), ('Daniel', 7.0), ('Jorge A.', 7.0), ('Carlos', 4.0), ('Giusse', 7.5), ('Mauricio O.', 7.0), ('Mauricio R.', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_6_4_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'Chicago', 'Saturday In the Park' FROM set_6_4
  RETURNING id
)
, votes_6_4_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_4_4.id, v.voter_name, v.score
  FROM song_6_4_4,
  (VALUES ('Mario', 6.0), ('Daniel', 7.5), ('Jorge A.', 6.0), ('Carlos', 6.0), ('Giusse', 7.5), ('Mauricio O.', 6.5), ('Mauricio R.', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_4_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'Deep Purple', 'Smoke on the water' FROM set_6_4
  RETURNING id
)
, votes_6_4_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_4_5.id, v.voter_name, v.score
  FROM song_6_4_5,
  (VALUES ('Mario', 9.0), ('Daniel', 8.5), ('Jorge A.', 8.5), ('Carlos', 7.5), ('Giusse', 7.0), ('Mauricio O.', 8.0), ('Mauricio R.', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_6_4_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'Depeche Mode', 'Personal Jesus' FROM set_6_4
  RETURNING id
)
, votes_6_4_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_4_6.id, v.voter_name, v.score
  FROM song_6_4_6,
  (VALUES ('Mario', 8.0), ('Daniel', 8.0), ('Jorge A.', 9.0), ('Carlos', 9.0), ('Giusse', 8.5), ('Mauricio O.', 8.0), ('Mauricio R.', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_6_4_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'Dirty Heads', 'My sweet summer' FROM set_6_4
  RETURNING id
)
, votes_6_4_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_4_7.id, v.voter_name, v.score
  FROM song_6_4_7,
  (VALUES ('Mario', 6.5), ('Daniel', 7.0), ('Jorge A.', 6.5), ('Carlos', 5.0), ('Giusse', 7.0), ('Mauricio O.', 6.5), ('Mauricio R.', 5.5)) AS v(voter_name, score)
  RETURNING id
)
, song_6_4_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'Duran Duran', 'Come Undone' FROM set_6_4
  RETURNING id
)
, votes_6_4_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_4_8.id, v.voter_name, v.score
  FROM song_6_4_8,
  (VALUES ('Mario', 8.5), ('Daniel', 8.0), ('Jorge A.', 7.5), ('Carlos', 7.0), ('Giusse', 8.5), ('Mauricio O.', 8.0), ('Mauricio R.', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_4_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'Empire of the sun', 'We are the people' FROM set_6_4
  RETURNING id
)
, votes_6_4_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_4_9.id, v.voter_name, v.score
  FROM song_6_4_9,
  (VALUES ('Mario', 8.0), ('Daniel', 6.0), ('Jorge A.', 8.0), ('Carlos', 6.5), ('Giusse', 7.5), ('Mauricio O.', 9.0), ('Mauricio R.', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_6_4_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'Fleetwood  Mac', 'Everywhere' FROM set_6_4
  RETURNING id
)
, votes_6_4_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_4_10.id, v.voter_name, v.score
  FROM song_6_4_10,
  (VALUES ('Mario', 7.5), ('Daniel', 7.0), ('Jorge A.', 7.0), ('Carlos', 9.0), ('Giusse', 8.5), ('Mauricio O.', 8.5), ('Mauricio R.', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_4_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'Gotye, Kimbra', 'Somebody that I used to know' FROM set_6_4
  RETURNING id
)
, votes_6_4_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_4_11.id, v.voter_name, v.score
  FROM song_6_4_11,
  (VALUES ('Mario', 9.5), ('Daniel', 7.0), ('Jorge A.', 9.0), ('Carlos', 9.0), ('Giusse', 9.0), ('Mauricio O.', 9.0), ('Mauricio R.', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_4_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'Heart', 'Magic man' FROM set_6_4
  RETURNING id
)
, votes_6_4_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_4_12.id, v.voter_name, v.score
  FROM song_6_4_12,
  (VALUES ('Mario', 7.0), ('Daniel', 6.5), ('Jorge A.', 7.0), ('Carlos', 6.5), ('Giusse', 7.0), ('Mauricio O.', 7.0), ('Mauricio R.', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_6_4_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'Jethro Tull', 'Living in the past' FROM set_6_4
  RETURNING id
)
, votes_6_4_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_4_13.id, v.voter_name, v.score
  FROM song_6_4_13,
  (VALUES ('Mario', 8.0), ('Daniel', 7.0), ('Jorge A.', 6.0), ('Carlos', 6.0), ('Giusse', 8.5), ('Mauricio O.', 6.0), ('Mauricio R.', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_4_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'Jon & Vangelis', 'I hear you Now' FROM set_6_4
  RETURNING id
)
, votes_6_4_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_4_14.id, v.voter_name, v.score
  FROM song_6_4_14,
  (VALUES ('Mario', 9.0), ('Daniel', 8.5), ('Jorge A.', 8.0), ('Carlos', 9.0), ('Giusse', 9.0), ('Mauricio O.', 6.5), ('Mauricio R.', 9.5)) AS v(voter_name, score)
  RETURNING id
)
, song_6_4_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'Lilly Wood & The Prick and Robin Schulz', 'Prayer in C' FROM set_6_4
  RETURNING id
)
, votes_6_4_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_4_15.id, v.voter_name, v.score
  FROM song_6_4_15,
  (VALUES ('Mario', 8.5), ('Daniel', 7.0), ('Jorge A.', 7.5), ('Carlos', 8.0), ('Giusse', 8.0), ('Mauricio O.', 7.5), ('Mauricio R.', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_4_16 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 16, 'Santana', 'Black Magic Woman' FROM set_6_4
  RETURNING id
)
, votes_6_4_16 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_4_16.id, v.voter_name, v.score
  FROM song_6_4_16,
  (VALUES ('Mario', 9.5), ('Daniel', 8.0), ('Jorge A.', 8.0), ('Carlos', 7.0), ('Giusse', 9.0), ('Mauricio O.', 8.5), ('Mauricio R.', 9.5)) AS v(voter_name, score)
  RETURNING id
)
, song_6_4_17 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 17, 'Santana', 'Mirage' FROM set_6_4
  RETURNING id
)
, votes_6_4_17 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_4_17.id, v.voter_name, v.score
  FROM song_6_4_17,
  (VALUES ('Mario', 8.0), ('Daniel', 8.5), ('Jorge A.', 8.0), ('Carlos', 8.0), ('Giusse', 9.5), ('Mauricio O.', 7.0), ('Mauricio R.', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_6_4_18 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 18, 'Santana', 'Singing winds, crying beasts' FROM set_6_4
  RETURNING id
)
, votes_6_4_18 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_4_18.id, v.voter_name, v.score
  FROM song_6_4_18,
  (VALUES ('Mario', 8.5), ('Daniel', 7.5), ('Jorge A.', 7.0), ('Carlos', 6.5), ('Giusse', 8.5), ('Mauricio O.', 7.0), ('Mauricio R.', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_6_4_19 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 19, 'The Beloved', 'Sweet harmony' FROM set_6_4
  RETURNING id
)
, votes_6_4_19 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_4_19.id, v.voter_name, v.score
  FROM song_6_4_19,
  (VALUES ('Mario', 7.0), ('Daniel', 8.0), ('Jorge A.', 8.0), ('Carlos', 8.0), ('Giusse', 8.0), ('Mauricio O.', 8.0), ('Mauricio R.', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, set_6_5 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 5, 'Set Mario' FROM s6
  RETURNING id
)
, song_6_5_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'AC/DC', 'Tunderstruke' FROM set_6_5
  RETURNING id
)
, votes_6_5_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_5_0.id, v.voter_name, v.score
  FROM song_6_5_0,
  (VALUES ('Daniel', 8.0), ('Carlos', 10.0), ('Mauricio O.', 9.5), ('Patrick', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_5_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'Bruce Springsteen', 'Born to Run' FROM set_6_5
  RETURNING id
)
, votes_6_5_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_5_1.id, v.voter_name, v.score
  FROM song_6_5_1,
  (VALUES ('Daniel', 7.0), ('Carlos', 7.5), ('Mauricio O.', 6.5), ('Patrick', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_5_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'Bryan Ferry', 'Don´t stop the dance' FROM set_6_5
  RETURNING id
)
, votes_6_5_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_5_2.id, v.voter_name, v.score
  FROM song_6_5_2,
  (VALUES ('Daniel', 7.0), ('Carlos', 7.0), ('Mauricio O.', 6.5), ('Patrick', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_5_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Clean Bandit', 'Rather Be' FROM set_6_5
  RETURNING id
)
, votes_6_5_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_5_3.id, v.voter_name, v.score
  FROM song_6_5_3,
  (VALUES ('Daniel', 7.0), ('Carlos', 7.5), ('Mauricio O.', 7.0), ('Patrick', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_5_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'Eric Clapton', 'Layla' FROM set_6_5
  RETURNING id
)
, votes_6_5_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_5_4.id, v.voter_name, v.score
  FROM song_6_5_4,
  (VALUES ('Daniel', 7.0), ('Carlos', 7.5), ('Mauricio O.', 6.5), ('Patrick', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_5_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'Eurythmics', 'Sweet Dreams' FROM set_6_5
  RETURNING id
)
, votes_6_5_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_5_5.id, v.voter_name, v.score
  FROM song_6_5_5,
  (VALUES ('Daniel', 7.5), ('Carlos', 9.0), ('Mauricio O.', 8.0), ('Patrick', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_5_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'Jose Luis Perales', 'Celos de mi Guitarra' FROM set_6_5
  RETURNING id
)
, votes_6_5_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_5_6.id, v.voter_name, v.score
  FROM song_6_5_6,
  (VALUES ('Daniel', 6.0), ('Carlos', 6.0), ('Mauricio O.', 6.5), ('Patrick', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_5_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'Leonard Cohen', 'Dance Me to the End of Love' FROM set_6_5
  RETURNING id
)
, votes_6_5_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_5_7.id, v.voter_name, v.score
  FROM song_6_5_7,
  (VALUES ('Daniel', 7.0), ('Carlos', 9.0), ('Mauricio O.', 7.5), ('Patrick', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_5_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'Miguel Bose', 'Creo en Ti' FROM set_6_5
  RETURNING id
)
, votes_6_5_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_5_8.id, v.voter_name, v.score
  FROM song_6_5_8,
  (VALUES ('Daniel', 7.0), ('Carlos', 8.0), ('Mauricio O.', 5.0), ('Patrick', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_5_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'Pet Shop Boys & Peter Rauhofer', 'Break 4 Love (Fribum & Urik H)' FROM set_6_5
  RETURNING id
)
, votes_6_5_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_5_9.id, v.voter_name, v.score
  FROM song_6_5_9,
  (VALUES ('Daniel', 6.5), ('Carlos', 9.0), ('Mauricio O.', 8.5), ('Patrick', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_5_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'Phil Collins', 'Another Day in Paradise' FROM set_6_5
  RETURNING id
)
, votes_6_5_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_5_10.id, v.voter_name, v.score
  FROM song_6_5_10,
  (VALUES ('Daniel', 7.5), ('Carlos', 8.0), ('Mauricio O.', 8.5), ('Patrick', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_5_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'Robin Schutz', 'Sugar (feat Francesco Yates)' FROM set_6_5
  RETURNING id
)
, votes_6_5_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_5_11.id, v.voter_name, v.score
  FROM song_6_5_11,
  (VALUES ('Daniel', 7.0), ('Carlos', 7.0), ('Mauricio O.', 7.0), ('Patrick', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_5_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'Smashing Pumpkins', 'Tonight, Tonight' FROM set_6_5
  RETURNING id
)
, votes_6_5_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_5_12.id, v.voter_name, v.score
  FROM song_6_5_12,
  (VALUES ('Daniel', 7.0), ('Carlos', 7.5), ('Mauricio O.', 10.0), ('Patrick', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_5_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'The Police', 'Walking On the Moon' FROM set_6_5
  RETURNING id
)
, votes_6_5_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_5_13.id, v.voter_name, v.score
  FROM song_6_5_13,
  (VALUES ('Daniel', 6.0), ('Carlos', 6.5), ('Mauricio O.', 6.5), ('Patrick', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_5_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'The Rolling Stones', 'Harlem Shuffle' FROM set_6_5
  RETURNING id
)
, votes_6_5_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_5_14.id, v.voter_name, v.score
  FROM song_6_5_14,
  (VALUES ('Daniel', 7.5), ('Carlos', 8.5), ('Mauricio O.', 8.5), ('Patrick', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_5_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'The Smiths', 'Bigmouth Strikes Again' FROM set_6_5
  RETURNING id
)
, votes_6_5_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_5_15.id, v.voter_name, v.score
  FROM song_6_5_15,
  (VALUES ('Daniel', 7.0), ('Carlos', 9.0), ('Mauricio O.', 8.5), ('Patrick', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_5_16 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 16, 'The Waterboys', 'Don´t Bang the Drum' FROM set_6_5
  RETURNING id
)
, votes_6_5_16 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_5_16.id, v.voter_name, v.score
  FROM song_6_5_16,
  (VALUES ('Daniel', 6.5), ('Carlos', 7.0), ('Mauricio O.', 7.5), ('Patrick', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_5_17 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 17, 'Toto', 'Hold the Line' FROM set_6_5
  RETURNING id
)
, votes_6_5_17 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_5_17.id, v.voter_name, v.score
  FROM song_6_5_17,
  (VALUES ('Daniel', 7.5), ('Carlos', 8.5), ('Mauricio O.', 9.0), ('Patrick', 10.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_5_18 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 18, 'Travis', 'Side' FROM set_6_5
  RETURNING id
)
, votes_6_5_18 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_5_18.id, v.voter_name, v.score
  FROM song_6_5_18,
  (VALUES ('Daniel', 8.5), ('Carlos', 7.0), ('Mauricio O.', 8.5), ('Patrick', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_5_19 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 19, 'Yes', 'Roundabout' FROM set_6_5
  RETURNING id
)
, votes_6_5_19 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_5_19.id, v.voter_name, v.score
  FROM song_6_5_19,
  (VALUES ('Daniel', 6.0), ('Carlos', 8.0), ('Mauricio O.', 7.0), ('Patrick', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, set_6_6 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 6, 'Set Mauricio Olivera' FROM s6
  RETURNING id
)
, song_6_6_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'Duncan Dhu', 'No Puedo Evitar' FROM set_6_6
  RETURNING id
)
, votes_6_6_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_6_0.id, v.voter_name, v.score
  FROM song_6_6_0,
  (VALUES ('Daniel', 6.5), ('Jorge A.', 6.0), ('Carlos', 8.0), ('Freddy', 6.0), ('Mauricio R.', 8.0), ('Alex', 3.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_6_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'El último Vecino', 'Tu Casa Nueva' FROM set_6_6
  RETURNING id
)
, votes_6_6_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_6_1.id, v.voter_name, v.score
  FROM song_6_6_1,
  (VALUES ('Daniel', 7.0), ('Jorge A.', 7.0), ('Carlos', 7.5), ('Freddy', 6.0), ('Mauricio R.', 7.0), ('Alex', 4.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_6_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'Foals', 'My Number' FROM set_6_6
  RETURNING id
)
, votes_6_6_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_6_2.id, v.voter_name, v.score
  FROM song_6_6_2,
  (VALUES ('Daniel', 7.5), ('Jorge A.', 7.0), ('Carlos', 8.0), ('Freddy', 8.0), ('Mauricio R.', 8.0), ('Alex', 5.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_6_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Interpol', 'Slow Hands' FROM set_6_6
  RETURNING id
)
, votes_6_6_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_6_3.id, v.voter_name, v.score
  FROM song_6_6_3,
  (VALUES ('Daniel', 7.0), ('Jorge A.', 6.0), ('Carlos', 8.0), ('Freddy', 6.0), ('Mauricio R.', 7.0), ('Alex', 5.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_6_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'Kenny Loggins', 'Footloose' FROM set_6_6
  RETURNING id
)
, votes_6_6_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_6_4.id, v.voter_name, v.score
  FROM song_6_6_4,
  (VALUES ('Daniel', 8.0), ('Jorge A.', 6.5), ('Carlos', 6.0), ('Freddy', 6.0), ('Mauricio R.', 4.0), ('Alex', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_6_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'Lenny Kravitz', 'Fly Away' FROM set_6_6
  RETURNING id
)
, votes_6_6_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_6_5.id, v.voter_name, v.score
  FROM song_6_6_5,
  (VALUES ('Daniel', 8.0), ('Jorge A.', 7.5), ('Carlos', 7.0), ('Freddy', 7.0), ('Mauricio R.', 8.0), ('Alex', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_6_6_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'Modjo', 'Lady' FROM set_6_6
  RETURNING id
)
, votes_6_6_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_6_6.id, v.voter_name, v.score
  FROM song_6_6_6,
  (VALUES ('Daniel', 7.5), ('Carlos', 7.0), ('Freddy', 7.0), ('Mauricio R.', 6.5), ('Alex', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_6_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'Phoenix', 'J-Boy' FROM set_6_6
  RETURNING id
)
, votes_6_6_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_6_7.id, v.voter_name, v.score
  FROM song_6_6_7,
  (VALUES ('Daniel', 7.0), ('Jorge A.', 9.0), ('Carlos', 7.5), ('Freddy', 6.0), ('Mauricio R.', 8.5), ('Alex', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_6_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'SAFIA', 'Make them Wheels Roll' FROM set_6_6
  RETURNING id
)
, votes_6_6_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_6_8.id, v.voter_name, v.score
  FROM song_6_6_8,
  (VALUES ('Daniel', 6.0), ('Jorge A.', 5.5), ('Carlos', 7.0), ('Freddy', 5.0), ('Mauricio R.', 7.5), ('Alex', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_6_6_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'Smash Mouth', 'Walkin´On the Sun' FROM set_6_6
  RETURNING id
)
, votes_6_6_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_6_9.id, v.voter_name, v.score
  FROM song_6_6_9,
  (VALUES ('Daniel', 7.0), ('Carlos', 7.0), ('Freddy', 7.0), ('Mauricio R.', 7.5), ('Alex', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_6_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'Stardust', 'The Music Sounds Better With You' FROM set_6_6
  RETURNING id
)
, votes_6_6_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_6_10.id, v.voter_name, v.score
  FROM song_6_6_10,
  (VALUES ('Daniel', 6.0), ('Jorge A.', 7.0), ('Carlos', 7.0), ('Freddy', 6.0), ('Mauricio R.', 5.0), ('Alex', 4.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_6_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'Stromae', 'Alors On Danse' FROM set_6_6
  RETURNING id
)
, votes_6_6_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_6_11.id, v.voter_name, v.score
  FROM song_6_6_11,
  (VALUES ('Daniel', 6.0), ('Jorge A.', 6.5), ('Carlos', 8.0), ('Freddy', 5.0), ('Mauricio R.', 4.5), ('Alex', 4.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_6_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'The Drums', 'Blood Under My Belt' FROM set_6_6
  RETURNING id
)
, votes_6_6_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_6_12.id, v.voter_name, v.score
  FROM song_6_6_12,
  (VALUES ('Daniel', 6.5), ('Jorge A.', 6.0), ('Carlos', 8.0), ('Freddy', 7.0), ('Mauricio R.', 7.5), ('Alex', 5.5)) AS v(voter_name, score)
  RETURNING id
)
, song_6_6_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'The Hives', 'Hate To Say I Told You So' FROM set_6_6
  RETURNING id
)
, votes_6_6_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_6_13.id, v.voter_name, v.score
  FROM song_6_6_13,
  (VALUES ('Daniel', 6.0), ('Carlos', 8.0), ('Freddy', 7.0), ('Mauricio R.', 8.0), ('Alex', 3.5)) AS v(voter_name, score)
  RETURNING id
)
, song_6_6_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'The Soul Survivors', 'Mama Soul' FROM set_6_6
  RETURNING id
)
, votes_6_6_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_6_14.id, v.voter_name, v.score
  FROM song_6_6_14,
  (VALUES ('Daniel', 6.0), ('Jorge A.', 5.5), ('Carlos', 7.0), ('Freddy', 8.0), ('Mauricio R.', 7.5), ('Alex', 5.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_6_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'The Strokes', 'The Modern Age' FROM set_6_6
  RETURNING id
)
, votes_6_6_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_6_15.id, v.voter_name, v.score
  FROM song_6_6_15,
  (VALUES ('Daniel', 7.0), ('Jorge A.', 7.0), ('Carlos', 8.0), ('Freddy', 7.0), ('Mauricio R.', 6.5), ('Alex', 4.5)) AS v(voter_name, score)
  RETURNING id
)
, song_6_6_16 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 16, 'The Wallflowers', 'One Headlight' FROM set_6_6
  RETURNING id
)
, votes_6_6_16 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_6_16.id, v.voter_name, v.score
  FROM song_6_6_16,
  (VALUES ('Daniel', 8.5), ('Jorge A.', 8.0), ('Carlos', 8.0), ('Freddy', 8.0), ('Mauricio R.', 8.0), ('Alex', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_6_17 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 17, 'The Who', 'Won´t Get Fooled Again' FROM set_6_6
  RETURNING id
)
, votes_6_6_17 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_6_17.id, v.voter_name, v.score
  FROM song_6_6_17,
  (VALUES ('Daniel', 8.5), ('Jorge A.', 8.5), ('Carlos', 9.0), ('Freddy', 8.0), ('Mauricio R.', 9.0), ('Alex', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_6_18 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 18, 'The Young Rascals', 'Groovin' FROM set_6_6
  RETURNING id
)
, votes_6_6_18 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_6_18.id, v.voter_name, v.score
  FROM song_6_6_18,
  (VALUES ('Daniel', 7.0), ('Jorge A.', 6.5), ('Carlos', 8.0), ('Freddy', 8.0), ('Mauricio R.', 8.0), ('Alex', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_6_19 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 19, 'Three Dog Night', 'Shambala' FROM set_6_6
  RETURNING id
)
, votes_6_6_19 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_6_19.id, v.voter_name, v.score
  FROM song_6_6_19,
  (VALUES ('Daniel', 6.5), ('Jorge A.', 6.0), ('Carlos', 6.5), ('Freddy', 8.0), ('Mauricio R.', 6.5), ('Alex', 5.0)) AS v(voter_name, score)
  RETURNING id
)
, set_6_7 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 7, 'Set Mauricio Rozas' FROM s6
  RETURNING id
)
, song_6_7_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, '4 Non Blondes', 'whats up?' FROM set_6_7
  RETURNING id
)
, votes_6_7_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_7_0.id, v.voter_name, v.score
  FROM song_6_7_0,
  (VALUES ('Mario', 9.0), ('Carlos', 8.5), ('Giusse', 8.0), ('Mauricio O.', 9.0), ('Gino', 9.0), ('Patrick', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_7_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'AJR', 'Sober Up' FROM set_6_7
  RETURNING id
)
, votes_6_7_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_7_1.id, v.voter_name, v.score
  FROM song_6_7_1,
  (VALUES ('Mario', 6.0), ('Carlos', 8.0), ('Giusse', 7.5), ('Mauricio O.', 6.0), ('Gino', 7.0), ('Patrick', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_7_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'Billy Joel', 'Shes always a woman' FROM set_6_7
  RETURNING id
)
, votes_6_7_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_7_2.id, v.voter_name, v.score
  FROM song_6_7_2,
  (VALUES ('Mario', 9.5), ('Carlos', 8.5), ('Giusse', 9.0), ('Mauricio O.', 8.0), ('Gino', 8.5), ('Patrick', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_7_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Bruce Springsteen', 'I''m going down' FROM set_6_7
  RETURNING id
)
, votes_6_7_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_7_3.id, v.voter_name, v.score
  FROM song_6_7_3,
  (VALUES ('Mario', 8.0), ('Carlos', 7.5), ('Giusse', 7.5), ('Mauricio O.', 7.0), ('Gino', 8.5), ('Patrick', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_7_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'Coldplay', 'Up & Up' FROM set_6_7
  RETURNING id
)
, votes_6_7_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_7_4.id, v.voter_name, v.score
  FROM song_6_7_4,
  (VALUES ('Mario', 8.0), ('Carlos', 7.5), ('Giusse', 8.0), ('Mauricio O.', 8.0), ('Gino', 6.0), ('Patrick', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_7_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'Concrete Blonde', 'Everyboody Knows' FROM set_6_7
  RETURNING id
)
, votes_6_7_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_7_5.id, v.voter_name, v.score
  FROM song_6_7_5,
  (VALUES ('Mario', 7.0), ('Carlos', 7.5), ('Giusse', 7.0), ('Mauricio O.', 8.0), ('Gino', 8.0), ('Patrick', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_7_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'Del Shanon', 'Runaway' FROM set_6_7
  RETURNING id
)
, votes_6_7_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_7_6.id, v.voter_name, v.score
  FROM song_6_7_6,
  (VALUES ('Mario', 10.0), ('Carlos', 9.0), ('Giusse', 9.0), ('Mauricio O.', 9.5), ('Gino', 7.5), ('Patrick', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_7_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'Franz Schubert', 'Serenade' FROM set_6_7
  RETURNING id
)
, votes_6_7_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_7_7.id, v.voter_name, v.score
  FROM song_6_7_7,
  (VALUES ('Mario', 9.5), ('Carlos', 9.0), ('Giusse', 9.0), ('Mauricio O.', 9.0), ('Gino', 9.0), ('Patrick', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_7_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'Imagine Dragons', 'Whatever it takes' FROM set_6_7
  RETURNING id
)
, votes_6_7_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_7_8.id, v.voter_name, v.score
  FROM song_6_7_8,
  (VALUES ('Mario', 6.0), ('Carlos', 7.0), ('Giusse', 6.5), ('Mauricio O.', 6.5), ('Gino', 5.5), ('Patrick', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_7_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'Imagine Dragons', 'Thunder' FROM set_6_7
  RETURNING id
)
, votes_6_7_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_7_9.id, v.voter_name, v.score
  FROM song_6_7_9,
  (VALUES ('Mario', 7.0), ('Carlos', 6.0), ('Giusse', 6.0), ('Mauricio O.', 6.5), ('Gino', 6.0), ('Patrick', 4.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_7_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'Jack Johnson', 'My mind for sale' FROM set_6_7
  RETURNING id
)
, votes_6_7_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_7_10.id, v.voter_name, v.score
  FROM song_6_7_10,
  (VALUES ('Mario', 7.0), ('Carlos', 6.5), ('Giusse', 8.0), ('Mauricio O.', 7.0), ('Gino', 6.5), ('Patrick', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_7_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'Joan Manuel Serrat', 'Mediterraneo' FROM set_6_7
  RETURNING id
)
, votes_6_7_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_7_11.id, v.voter_name, v.score
  FROM song_6_7_11,
  (VALUES ('Mario', 9.0), ('Carlos', 7.0), ('Giusse', 10.0), ('Mauricio O.', 6.0), ('Gino', 6.5), ('Patrick', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_7_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'Milky Chance', 'Cocoon' FROM set_6_7
  RETURNING id
)
, votes_6_7_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_7_12.id, v.voter_name, v.score
  FROM song_6_7_12,
  (VALUES ('Mario', 7.0), ('Carlos', 7.0), ('Giusse', 7.0), ('Mauricio O.', 7.5), ('Gino', 7.0), ('Patrick', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_6_7_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'Outfield', 'Your love' FROM set_6_7
  RETURNING id
)
, votes_6_7_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_7_13.id, v.voter_name, v.score
  FROM song_6_7_13,
  (VALUES ('Mario', 9.0), ('Carlos', 8.0), ('Giusse', 8.5), ('Mauricio O.', 9.0), ('Gino', 7.0), ('Patrick', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_7_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'Peter Bjorn and John', 'Breakin point' FROM set_6_7
  RETURNING id
)
, votes_6_7_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_7_14.id, v.voter_name, v.score
  FROM song_6_7_14,
  (VALUES ('Mario', 7.5), ('Carlos', 7.5), ('Giusse', 7.5), ('Mauricio O.', 8.0), ('Gino', 6.5), ('Patrick', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_7_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'Supertramp', 'Easy does' FROM set_6_7
  RETURNING id
)
, votes_6_7_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_7_15.id, v.voter_name, v.score
  FROM song_6_7_15,
  (VALUES ('Mario', 8.0), ('Carlos', 6.0), ('Giusse', 8.5), ('Mauricio O.', 6.5), ('Gino', 8.0), ('Patrick', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_7_16 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 16, 'The Lumineers', 'Cleopatra' FROM set_6_7
  RETURNING id
)
, votes_6_7_16 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_7_16.id, v.voter_name, v.score
  FROM song_6_7_16,
  (VALUES ('Mario', 7.0), ('Carlos', 6.5), ('Giusse', 7.0), ('Mauricio O.', 8.5), ('Gino', 7.5), ('Patrick', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_6_7_17 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 17, 'The Lumineers', 'Ophelia' FROM set_6_7
  RETURNING id
)
, votes_6_7_17 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_7_17.id, v.voter_name, v.score
  FROM song_6_7_17,
  (VALUES ('Mario', 6.0), ('Carlos', 6.5), ('Giusse', 7.5), ('Mauricio O.', 6.0), ('Gino', 6.5), ('Patrick', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_7_18 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 18, 'The Strumbellas', 'We don''t know' FROM set_6_7
  RETURNING id
)
, votes_6_7_18 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_7_18.id, v.voter_name, v.score
  FROM song_6_7_18,
  (VALUES ('Mario', 8.5), ('Carlos', 8.0), ('Giusse', 8.5), ('Mauricio O.', 8.0), ('Gino', 7.5), ('Patrick', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_7_19 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 19, 'Zombies', 'Time of the season' FROM set_6_7
  RETURNING id
)
, votes_6_7_19 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_7_19.id, v.voter_name, v.score
  FROM song_6_7_19,
  (VALUES ('Mario', 9.0), ('Carlos', 8.0), ('Giusse', 8.0), ('Mauricio O.', 6.5), ('Gino', 9.0), ('Patrick', 10.0)) AS v(voter_name, score)
  RETURNING id
)
, set_6_8 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 8, 'Set Patrick' FROM s6
  RETURNING id
)
, song_6_8_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'Billy Joel', 'New York State of Mind' FROM set_6_8
  RETURNING id
)
, votes_6_8_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_8_0.id, v.voter_name, v.score
  FROM song_6_8_0,
  (VALUES ('Mario', 7.0), ('Daniel', 6.5), ('Jorge A.', 7.0), ('Carlos', 6.0), ('Giusse', 6.5), ('Mauricio O.', 7.5), ('Gino', 5.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_8_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'Earth Wind and Fire', 'September' FROM set_6_8
  RETURNING id
)
, votes_6_8_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_8_1.id, v.voter_name, v.score
  FROM song_6_8_1,
  (VALUES ('Mario', 8.0), ('Daniel', 7.0), ('Jorge A.', 8.0), ('Carlos', 7.5), ('Giusse', 9.0), ('Mauricio O.', 8.0), ('Gino', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_8_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'Elis Regina & Tom Jobim', 'Aguas de Marzo' FROM set_6_8
  RETURNING id
)
, votes_6_8_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_8_2.id, v.voter_name, v.score
  FROM song_6_8_2,
  (VALUES ('Mario', 8.0), ('Daniel', 7.5), ('Jorge A.', 5.0), ('Carlos', 4.5), ('Giusse', 9.0), ('Mauricio O.', 7.0), ('Gino', 4.5)) AS v(voter_name, score)
  RETURNING id
)
, song_6_8_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Europe', 'The Final Countdown' FROM set_6_8
  RETURNING id
)
, votes_6_8_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_8_3.id, v.voter_name, v.score
  FROM song_6_8_3,
  (VALUES ('Mario', 7.0), ('Daniel', 7.5), ('Jorge A.', 7.0), ('Carlos', 7.0), ('Giusse', 6.0), ('Mauricio O.', 6.0), ('Gino', 5.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_8_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'Fleet Foxes', 'White Winter Hymnal' FROM set_6_8
  RETURNING id
)
, votes_6_8_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_8_4.id, v.voter_name, v.score
  FROM song_6_8_4,
  (VALUES ('Mario', 7.0), ('Daniel', 7.0), ('Jorge A.', 5.5), ('Carlos', 7.0), ('Giusse', 7.0), ('Mauricio O.', 7.5), ('Gino', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_6_8_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'Fleetwood Mac', 'Dreams' FROM set_6_8
  RETURNING id
)
, votes_6_8_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_8_5.id, v.voter_name, v.score
  FROM song_6_8_5,
  (VALUES ('Mario', 8.0), ('Daniel', 8.0), ('Jorge A.', 8.0), ('Carlos', 7.5), ('Giusse', 9.0), ('Mauricio O.', 7.0), ('Gino', 10.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_8_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'Jose Luis Perales', 'Cancion de Otono' FROM set_6_8
  RETURNING id
)
, votes_6_8_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_8_6.id, v.voter_name, v.score
  FROM song_6_8_6,
  (VALUES ('Mario', 7.0), ('Daniel', 7.0), ('Jorge A.', 6.0), ('Carlos', 6.5), ('Giusse', 6.5), ('Mauricio O.', 8.5), ('Gino', 5.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_8_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'Led Zeppelin', 'Immigrant Song' FROM set_6_8
  RETURNING id
)
, votes_6_8_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_8_7.id, v.voter_name, v.score
  FROM song_6_8_7,
  (VALUES ('Mario', 7.0), ('Daniel', 7.5), ('Jorge A.', 8.0), ('Carlos', 7.5), ('Giusse', 7.5), ('Mauricio O.', 6.5), ('Gino', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_6_8_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'Men at Work', 'Be Good Johnny' FROM set_6_8
  RETURNING id
)
, votes_6_8_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_8_8.id, v.voter_name, v.score
  FROM song_6_8_8,
  (VALUES ('Mario', 7.0), ('Daniel', 7.5), ('Jorge A.', 7.0), ('Carlos', 7.5), ('Giusse', 7.0), ('Mauricio O.', 7.5), ('Gino', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_6_8_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'Midnight Oil', 'Beds are burning' FROM set_6_8
  RETURNING id
)
, votes_6_8_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_8_9.id, v.voter_name, v.score
  FROM song_6_8_9,
  (VALUES ('Mario', 7.0), ('Daniel', 8.0), ('Jorge A.', 7.5), ('Carlos', 8.0), ('Giusse', 8.0), ('Mauricio O.', 7.0), ('Gino', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_6_8_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'Nirvana', 'Smell Like teen spirit' FROM set_6_8
  RETURNING id
)
, votes_6_8_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_8_10.id, v.voter_name, v.score
  FROM song_6_8_10,
  (VALUES ('Mario', 9.0), ('Daniel', 10.0), ('Jorge A.', 9.0), ('Carlos', 8.0), ('Giusse', 7.5), ('Mauricio O.', 8.0), ('Gino', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_8_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'Oasis', 'Don’t Look Back in Anger' FROM set_6_8
  RETURNING id
)
, votes_6_8_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_8_11.id, v.voter_name, v.score
  FROM song_6_8_11,
  (VALUES ('Mario', 9.0), ('Daniel', 7.0), ('Jorge A.', 8.5), ('Carlos', 8.0), ('Giusse', 7.0), ('Mauricio O.', 8.0), ('Gino', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_6_8_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'Queen', 'Somebody to Love' FROM set_6_8
  RETURNING id
)
, votes_6_8_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_8_12.id, v.voter_name, v.score
  FROM song_6_8_12,
  (VALUES ('Mario', 10.0), ('Daniel', 8.0), ('Jorge A.', 8.0), ('Carlos', 9.0), ('Giusse', 10.0), ('Mauricio O.', 9.5), ('Gino', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_8_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'Red hot chili peppers', 'The Zephyr Song' FROM set_6_8
  RETURNING id
)
, votes_6_8_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_8_13.id, v.voter_name, v.score
  FROM song_6_8_13,
  (VALUES ('Mario', 8.0), ('Daniel', 8.5), ('Jorge A.', 9.0), ('Carlos', 7.0), ('Giusse', 7.0), ('Mauricio O.', 6.5), ('Gino', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_8_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'Robbie Williams', 'better man' FROM set_6_8
  RETURNING id
)
, votes_6_8_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_8_14.id, v.voter_name, v.score
  FROM song_6_8_14,
  (VALUES ('Mario', 7.0), ('Daniel', 8.0), ('Jorge A.', 8.0), ('Carlos', 7.5), ('Giusse', 7.0), ('Mauricio O.', 8.0), ('Gino', 5.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_8_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'Supertramp', 'Goodbye Stranger' FROM set_6_8
  RETURNING id
)
, votes_6_8_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_8_15.id, v.voter_name, v.score
  FROM song_6_8_15,
  (VALUES ('Mario', 7.0), ('Daniel', 8.0), ('Jorge A.', 7.5), ('Carlos', 9.0), ('Giusse', 8.0), ('Mauricio O.', 8.5), ('Gino', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_8_16 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 16, 'The Doors', 'Break on Through' FROM set_6_8
  RETURNING id
)
, votes_6_8_16 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_8_16.id, v.voter_name, v.score
  FROM song_6_8_16,
  (VALUES ('Mario', 9.0), ('Daniel', 8.0), ('Jorge A.', 7.0), ('Carlos', 7.0), ('Giusse', 8.0), ('Mauricio O.', 8.0), ('Gino', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_6_8_17 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 17, 'U2', 'I Still Havent found what I''m looking for' FROM set_6_8
  RETURNING id
)
, votes_6_8_17 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_8_17.id, v.voter_name, v.score
  FROM song_6_8_17,
  (VALUES ('Mario', 9.0), ('Daniel', 9.0), ('Jorge A.', 8.0), ('Carlos', 7.0), ('Giusse', 8.0), ('Mauricio O.', 9.0), ('Gino', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_6_8_18 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 18, 'Van Halen', 'Somebody Get Me a Doctor' FROM set_6_8
  RETURNING id
)
, votes_6_8_18 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_8_18.id, v.voter_name, v.score
  FROM song_6_8_18,
  (VALUES ('Mario', 7.0), ('Daniel', 7.5), ('Jorge A.', 7.0), ('Carlos', 5.0), ('Giusse', 7.5), ('Mauricio O.', 8.0), ('Gino', 4.0)) AS v(voter_name, score)
  RETURNING id
)
, song_6_8_19 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 19, 'Van Halen', 'Hot for teacher' FROM set_6_8
  RETURNING id
)
, votes_6_8_19 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_6_8_19.id, v.voter_name, v.score
  FROM song_6_8_19,
  (VALUES ('Mario', 6.0), ('Daniel', 7.5), ('Jorge A.', 7.0), ('Carlos', 4.0), ('Giusse', 7.0), ('Mauricio O.', 6.0), ('Gino', 5.0)) AS v(voter_name, score)
  RETURNING id
)
SELECT id FROM s6;

WITH s7 AS (
  INSERT INTO cyc_sessions (session_num, host, date, attendees, input_mode, sets_count, songs_count, complete)
  VALUES (7, 'Temporada 7', '2024-07-01', ARRAY["Carlos", "Daniel", "Freddy", "Gino", "Jorge A.", "Mario", "Mauricio O.", "Mauricio R.", "Patrick"]::text[], 'host', 2, 16, true)
  RETURNING id
)
, set_7_0 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 0, 'Set Carlos' FROM s7
  RETURNING id
)
, song_7_0_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'Bee Gees', 'Melody Fair' FROM set_7_0
  RETURNING id
)
, votes_7_0_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_7_0_0.id, v.voter_name, v.score
  FROM song_7_0_0,
  (VALUES ('Mario', 9.0), ('Daniel', 5.5), ('Jorge A.', 5.0), ('Freddy', 9.0), ('Mauricio O.', 6.5), ('Mauricio R.', 7.5), ('Gino', 5.5)) AS v(voter_name, score)
  RETURNING id
)
, song_7_0_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'Eagles', 'Get Over It' FROM set_7_0
  RETURNING id
)
, votes_7_0_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_7_0_1.id, v.voter_name, v.score
  FROM song_7_0_1,
  (VALUES ('Mario', 6.0), ('Daniel', 7.5), ('Jorge A.', 7.0), ('Freddy', 7.5), ('Mauricio O.', 7.0), ('Mauricio R.', 8.0), ('Gino', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_7_0_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'Elton John', 'Goodbye Yellow Brick Road' FROM set_7_0
  RETURNING id
)
, votes_7_0_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_7_0_2.id, v.voter_name, v.score
  FROM song_7_0_2,
  (VALUES ('Mario', 8.0), ('Daniel', 8.0), ('Jorge A.', 7.0), ('Freddy', 10.0), ('Mauricio O.', 8.0), ('Mauricio R.', 7.0), ('Gino', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_7_0_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Gerry and the Pacemakers', 'You´ll never walk alone' FROM set_7_0
  RETURNING id
)
, votes_7_0_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_7_0_3.id, v.voter_name, v.score
  FROM song_7_0_3,
  (VALUES ('Mario', 8.0), ('Daniel', 5.5), ('Jorge A.', 6.0), ('Freddy', 9.0), ('Mauricio O.', 7.0), ('Mauricio R.', 7.5), ('Gino', 5.5)) AS v(voter_name, score)
  RETURNING id
)
, song_7_0_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'In Grid', 'Tu Es Foutu' FROM set_7_0
  RETURNING id
)
, votes_7_0_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_7_0_4.id, v.voter_name, v.score
  FROM song_7_0_4,
  (VALUES ('Mario', 9.0), ('Daniel', 6.5), ('Jorge A.', 8.5), ('Freddy', 8.0), ('Mauricio O.', 10.0), ('Mauricio R.', 9.0), ('Gino', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_7_0_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'John Fogerty', 'The Old Man Down the Road' FROM set_7_0
  RETURNING id
)
, votes_7_0_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_7_0_5.id, v.voter_name, v.score
  FROM song_7_0_5,
  (VALUES ('Mario', 6.0), ('Daniel', 8.0), ('Jorge A.', 5.5), ('Freddy', 8.0), ('Mauricio O.', 6.5), ('Mauricio R.', 8.5), ('Gino', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_7_0_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'Leiva', 'La Llamada' FROM set_7_0
  RETURNING id
)
, votes_7_0_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_7_0_6.id, v.voter_name, v.score
  FROM song_7_0_6,
  (VALUES ('Mario', 7.0), ('Daniel', 5.5), ('Jorge A.', 5.0), ('Freddy', 6.0), ('Mauricio O.', 5.0), ('Mauricio R.', 6.5), ('Gino', 4.0)) AS v(voter_name, score)
  RETURNING id
)
, song_7_0_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'New Order', 'Plastic' FROM set_7_0
  RETURNING id
)
, votes_7_0_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_7_0_7.id, v.voter_name, v.score
  FROM song_7_0_7,
  (VALUES ('Mario', 9.5), ('Daniel', 8.0), ('Jorge A.', 7.0), ('Freddy', 6.0), ('Mauricio O.', 8.0), ('Mauricio R.', 7.5), ('Gino', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_7_0_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'Osibisa', 'Dance de Body Music' FROM set_7_0
  RETURNING id
)
, votes_7_0_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_7_0_8.id, v.voter_name, v.score
  FROM song_7_0_8,
  (VALUES ('Mario', 7.0), ('Daniel', 7.5), ('Jorge A.', 7.0), ('Freddy', 6.0), ('Mauricio O.', 8.0), ('Mauricio R.', 6.0), ('Gino', 5.0)) AS v(voter_name, score)
  RETURNING id
)
, song_7_0_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'Portugal. The Man', 'Feel It Still' FROM set_7_0
  RETURNING id
)
, votes_7_0_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_7_0_9.id, v.voter_name, v.score
  FROM song_7_0_9,
  (VALUES ('Mario', 9.0), ('Daniel', 7.5), ('Jorge A.', 7.5), ('Freddy', 8.0), ('Mauricio O.', 8.0), ('Mauricio R.', 8.5), ('Gino', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_7_0_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'Queen', 'I was born to love you' FROM set_7_0
  RETURNING id
)
, votes_7_0_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_7_0_10.id, v.voter_name, v.score
  FROM song_7_0_10,
  (VALUES ('Mario', 9.0), ('Daniel', 8.0), ('Jorge A.', 7.5), ('Freddy', 9.0), ('Mauricio O.', 7.0), ('Mauricio R.', 8.0), ('Gino', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_7_0_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'Satellite Roses', 'Confetti' FROM set_7_0
  RETURNING id
)
, votes_7_0_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_7_0_11.id, v.voter_name, v.score
  FROM song_7_0_11,
  (VALUES ('Mario', 6.5), ('Daniel', 6.5), ('Jorge A.', 7.0), ('Freddy', 8.0), ('Mauricio O.', 6.5), ('Mauricio R.', 8.5), ('Gino', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_7_0_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'Supertramp', 'Cannoball' FROM set_7_0
  RETURNING id
)
, votes_7_0_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_7_0_12.id, v.voter_name, v.score
  FROM song_7_0_12,
  (VALUES ('Mario', 10.0), ('Daniel', 7.5), ('Jorge A.', 6.5), ('Freddy', 7.0), ('Mauricio O.', 5.0), ('Mauricio R.', 8.0), ('Gino', 10.0)) AS v(voter_name, score)
  RETURNING id
)
, song_7_0_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'The Cars', 'Tonight She Comes' FROM set_7_0
  RETURNING id
)
, votes_7_0_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_7_0_13.id, v.voter_name, v.score
  FROM song_7_0_13,
  (VALUES ('Mario', 9.5), ('Daniel', 8.0), ('Jorge A.', 8.5), ('Freddy', 9.0), ('Mauricio O.', 7.0), ('Mauricio R.', 8.0), ('Gino', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_7_0_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'The Chainsmokers and Cold Play', 'Something Just Like This' FROM set_7_0
  RETURNING id
)
, votes_7_0_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_7_0_14.id, v.voter_name, v.score
  FROM song_7_0_14,
  (VALUES ('Mario', 8.0), ('Daniel', 6.0), ('Jorge A.', 7.0), ('Freddy', 8.0), ('Mauricio O.', 6.5), ('Mauricio R.', 7.5), ('Gino', 4.0)) AS v(voter_name, score)
  RETURNING id
)
, song_7_0_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'You are in love with a Psycho', 'Kasabian' FROM set_7_0
  RETURNING id
)
, votes_7_0_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_7_0_15.id, v.voter_name, v.score
  FROM song_7_0_15,
  (VALUES ('Mario', 7.0), ('Daniel', 5.0), ('Jorge A.', 5.5), ('Freddy', 7.0), ('Mauricio O.', 6.5), ('Mauricio R.', 5.5), ('Gino', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, set_7_1 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 1, 'Set Daniel' FROM s7
  RETURNING id
)
, song_7_1_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'black eyed peas', 'I got a feeling' FROM set_7_1
  RETURNING id
)
, votes_7_1_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_7_1_0.id, v.voter_name, v.score
  FROM song_7_1_0,
  (VALUES ('Mario', 8.0), ('Jorge A.', 5.5), ('Carlos', 8.0), ('Gino', 7.5), ('Patrick', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_7_1_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'Bon Jovi', 'Bad Medicine' FROM set_7_1
  RETURNING id
)
, votes_7_1_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_7_1_1.id, v.voter_name, v.score
  FROM song_7_1_1,
  (VALUES ('Mario', 8.0), ('Jorge A.', 6.0), ('Carlos', 6.5), ('Gino', 4.0), ('Patrick', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_7_1_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'Bryan Adams', 'Heaven' FROM set_7_1
  RETURNING id
)
, votes_7_1_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_7_1_2.id, v.voter_name, v.score
  FROM song_7_1_2,
  (VALUES ('Mario', 8.5), ('Jorge A.', 7.0), ('Carlos', 7.5), ('Gino', 7.0), ('Patrick', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_7_1_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Bugles', 'Video Killed Radio Stars' FROM set_7_1
  RETURNING id
)
, votes_7_1_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_7_1_3.id, v.voter_name, v.score
  FROM song_7_1_3,
  (VALUES ('Mario', 9.0), ('Jorge A.', 7.5), ('Carlos', 8.0), ('Gino', 8.0), ('Patrick', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_7_1_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'Foo Fighters', 'Monkey wrench' FROM set_7_1
  RETURNING id
)
, votes_7_1_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_7_1_4.id, v.voter_name, v.score
  FROM song_7_1_4,
  (VALUES ('Mario', 6.0), ('Jorge A.', 7.0), ('Carlos', 5.5), ('Gino', 4.5), ('Patrick', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_7_1_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'Foreigner', 'Waiting for a girl like you' FROM set_7_1
  RETURNING id
)
, votes_7_1_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_7_1_5.id, v.voter_name, v.score
  FROM song_7_1_5,
  (VALUES ('Mario', 8.0), ('Jorge A.', 8.0), ('Carlos', 7.0), ('Gino', 5.5), ('Patrick', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_7_1_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'Green Day', 'Basket case' FROM set_7_1
  RETURNING id
)
, votes_7_1_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_7_1_6.id, v.voter_name, v.score
  FROM song_7_1_6,
  (VALUES ('Mario', 7.0), ('Jorge A.', 7.0), ('Carlos', 8.0), ('Gino', 6.0), ('Patrick', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_7_1_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'Green Day', 'Know your Enemy' FROM set_7_1
  RETURNING id
)
, votes_7_1_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_7_1_7.id, v.voter_name, v.score
  FROM song_7_1_7,
  (VALUES ('Mario', 6.0), ('Jorge A.', 6.0), ('Carlos', 7.5), ('Gino', 6.0), ('Patrick', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_7_1_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'guns n roses', 'Symphaty for th devil' FROM set_7_1
  RETURNING id
)
, votes_7_1_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_7_1_8.id, v.voter_name, v.score
  FROM song_7_1_8,
  (VALUES ('Mario', 7.0), ('Jorge A.', 4.0), ('Carlos', 7.0), ('Gino', 5.0), ('Patrick', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_7_1_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'Lenny Kravitz', 'Are you gona go my way' FROM set_7_1
  RETURNING id
)
, votes_7_1_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_7_1_9.id, v.voter_name, v.score
  FROM song_7_1_9,
  (VALUES ('Mario', 7.0), ('Jorge A.', 6.5), ('Carlos', 7.5), ('Gino', 7.0), ('Patrick', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_7_1_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'Metallica', 'Until it sleeps' FROM set_7_1
  RETURNING id
)
, votes_7_1_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_7_1_10.id, v.voter_name, v.score
  FROM song_7_1_10,
  (VALUES ('Mario', 6.5), ('Jorge A.', 7.5), ('Carlos', 7.0), ('Gino', 6.5), ('Patrick', 5.0)) AS v(voter_name, score)
  RETURNING id
)
, song_7_1_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'Poison', 'Every Rose has its thorn' FROM set_7_1
  RETURNING id
)
, votes_7_1_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_7_1_11.id, v.voter_name, v.score
  FROM song_7_1_11,
  (VALUES ('Mario', 8.0), ('Jorge A.', 6.5), ('Carlos', 7.5), ('Gino', 4.0), ('Patrick', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_7_1_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'Red hot chili peppers', 'by the way' FROM set_7_1
  RETURNING id
)
, votes_7_1_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_7_1_12.id, v.voter_name, v.score
  FROM song_7_1_12,
  (VALUES ('Mario', 8.5), ('Jorge A.', 8.5), ('Carlos', 7.0), ('Gino', 6.0), ('Patrick', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_7_1_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'The Rolling Stones', 'Satisfaction' FROM set_7_1
  RETURNING id
)
, votes_7_1_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_7_1_13.id, v.voter_name, v.score
  FROM song_7_1_13,
  (VALUES ('Mario', 7.0), ('Jorge A.', 6.5), ('Carlos', 7.5), ('Gino', 7.0), ('Patrick', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_7_1_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'Tina turner', 'Whats love got to do with it' FROM set_7_1
  RETURNING id
)
, votes_7_1_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_7_1_14.id, v.voter_name, v.score
  FROM song_7_1_14,
  (VALUES ('Mario', 9.0), ('Jorge A.', 8.0), ('Carlos', 8.0), ('Gino', 7.0), ('Patrick', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_7_1_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'Warrant', 'Heaven' FROM set_7_1
  RETURNING id
)
, votes_7_1_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_7_1_15.id, v.voter_name, v.score
  FROM song_7_1_15,
  (VALUES ('Mario', 7.0), ('Jorge A.', 6.0), ('Carlos', 6.0), ('Gino', 5.0), ('Patrick', 7.0)) AS v(voter_name, score)
  RETURNING id
)
SELECT id FROM s7;

WITH s8 AS (
  INSERT INTO cyc_sessions (session_num, host, date, attendees, input_mode, sets_count, songs_count, complete)
  VALUES (8, 'Temporada 8', '2024-09-01', ARRAY["Alex2", "Carlos", "Daniel", "Dante", "Freddy", "Gino", "Giusse", "Jorge A.", "Julio", "Mario", "Mauricio O.", "Mauricio R.", "Patrick"]::text[], 'host', 7, 18, true)
  RETURNING id
)
, set_8_0 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 0, 'Set Carlos' FROM s8
  RETURNING id
)
, song_8_0_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'A Flock of Seagulls', 'Space Age Love Song' FROM set_8_0
  RETURNING id
)
, votes_8_0_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_0_0.id, v.voter_name, v.score
  FROM song_8_0_0,
  (VALUES ('Mario', 10.0), ('Daniel', 8.5), ('Jorge A.', 9.5), ('Freddy', 8.0), ('Gino', 10.0)) AS v(voter_name, score)
  RETURNING id
)
, song_8_0_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'Cycle', 'Wicked' FROM set_8_0
  RETURNING id
)
, votes_8_0_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_0_1.id, v.voter_name, v.score
  FROM song_8_0_1,
  (VALUES ('Mario', 6.0), ('Daniel', 5.0), ('Jorge A.', 6.5), ('Freddy', 5.5), ('Gino', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_8_0_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'Depeche Mode', 'World in my eyes Cicada Mix' FROM set_8_0
  RETURNING id
)
, votes_8_0_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_0_2.id, v.voter_name, v.score
  FROM song_8_0_2,
  (VALUES ('Mario', 9.0), ('Daniel', 7.5), ('Jorge A.', 9.0), ('Freddy', 7.0), ('Gino', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_8_0_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Dorian', 'Algunos Amigos' FROM set_8_0
  RETURNING id
)
, votes_8_0_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_0_3.id, v.voter_name, v.score
  FROM song_8_0_3,
  (VALUES ('Mario', 8.5), ('Daniel', 8.0), ('Jorge A.', 7.0), ('Freddy', 8.0), ('Gino', 5.0)) AS v(voter_name, score)
  RETURNING id
)
, song_8_0_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'Dreyma', 'Air' FROM set_8_0
  RETURNING id
)
, votes_8_0_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_0_4.id, v.voter_name, v.score
  FROM song_8_0_4,
  (VALUES ('Mario', 6.0), ('Daniel', 6.0), ('Jorge A.', 6.0), ('Freddy', 6.0), ('Gino', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_8_0_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'Echo and the bunnymen', 'The Killing Moon' FROM set_8_0
  RETURNING id
)
, votes_8_0_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_0_5.id, v.voter_name, v.score
  FROM song_8_0_5,
  (VALUES ('Mario', 7.0), ('Daniel', 7.0), ('Jorge A.', 8.0), ('Freddy', 7.0), ('Gino', 10.0)) AS v(voter_name, score)
  RETURNING id
)
, song_8_0_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'Erasure', 'Sometimes' FROM set_8_0
  RETURNING id
)
, votes_8_0_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_0_6.id, v.voter_name, v.score
  FROM song_8_0_6,
  (VALUES ('Mario', 8.0), ('Daniel', 8.0), ('Jorge A.', 8.0), ('Freddy', 10.0), ('Gino', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_8_0_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'Foals', 'Late Night' FROM set_8_0
  RETURNING id
)
, votes_8_0_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_0_7.id, v.voter_name, v.score
  FROM song_8_0_7,
  (VALUES ('Mario', 8.5), ('Daniel', 7.0), ('Jorge A.', 7.5), ('Freddy', 7.0), ('Gino', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_8_0_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'Franz Ferdinand', 'Always Ascending' FROM set_8_0
  RETURNING id
)
, votes_8_0_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_0_8.id, v.voter_name, v.score
  FROM song_8_0_8,
  (VALUES ('Mario', 8.0), ('Daniel', 7.0), ('Jorge A.', 7.0), ('Freddy', 7.0), ('Gino', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_8_0_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'Human League', 'Lebanon' FROM set_8_0
  RETURNING id
)
, votes_8_0_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_0_9.id, v.voter_name, v.score
  FROM song_8_0_9,
  (VALUES ('Mario', 7.0), ('Daniel', 8.0), ('Jorge A.', 8.0), ('Freddy', 8.0), ('Gino', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_8_0_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'J J Cale', 'Cocaine' FROM set_8_0
  RETURNING id
)
, votes_8_0_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_0_10.id, v.voter_name, v.score
  FROM song_8_0_10,
  (VALUES ('Mario', 8.0), ('Daniel', 7.5), ('Jorge A.', 7.0), ('Freddy', 7.0), ('Gino', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_8_0_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'Los Bunkers', 'Bailando Solo' FROM set_8_0
  RETURNING id
)
, votes_8_0_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_0_11.id, v.voter_name, v.score
  FROM song_8_0_11,
  (VALUES ('Mario', 8.5), ('Daniel', 5.5), ('Jorge A.', 8.0), ('Freddy', 7.0), ('Gino', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_8_0_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'OMD', 'Maid of Orleans' FROM set_8_0
  RETURNING id
)
, votes_8_0_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_0_12.id, v.voter_name, v.score
  FROM song_8_0_12,
  (VALUES ('Mario', 10.0), ('Daniel', 7.0), ('Jorge A.', 5.0), ('Freddy', 9.0), ('Gino', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_8_0_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'The Drums', 'Me and the Moon' FROM set_8_0
  RETURNING id
)
, votes_8_0_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_0_13.id, v.voter_name, v.score
  FROM song_8_0_13,
  (VALUES ('Mario', 9.0), ('Daniel', 7.0), ('Jorge A.', 7.0), ('Freddy', 8.0), ('Gino', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_8_0_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'The Pretenders', 'Brass in Pocket' FROM set_8_0
  RETURNING id
)
, votes_8_0_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_0_14.id, v.voter_name, v.score
  FROM song_8_0_14,
  (VALUES ('Mario', 8.0), ('Daniel', 6.5), ('Jorge A.', 6.5), ('Freddy', 8.0), ('Gino', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_8_0_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'The Vaccines', 'I can´t quit' FROM set_8_0
  RETURNING id
)
, votes_8_0_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_0_15.id, v.voter_name, v.score
  FROM song_8_0_15,
  (VALUES ('Mario', 8.5), ('Daniel', 5.5), ('Jorge A.', 6.5), ('Freddy', 7.0), ('Gino', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, set_8_1 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 1, 'Set Daniel' FROM s8
  RETURNING id
)
, song_8_1_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'AC/DC', 'Back in Black' FROM set_8_1
  RETURNING id
)
, votes_8_1_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_1_0.id, v.voter_name, v.score
  FROM song_8_1_0,
  (VALUES ('Mario', 10.0), ('Jorge A.', 9.0), ('Carlos', 9.0), ('Giusse', 9.5), ('Alex2', 8.0), ('Julio', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_8_1_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'Aerosmith', 'Come Together' FROM set_8_1
  RETURNING id
)
, votes_8_1_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_1_1.id, v.voter_name, v.score
  FROM song_8_1_1,
  (VALUES ('Mario', 9.0), ('Jorge A.', 8.0), ('Carlos', 8.0), ('Giusse', 8.0), ('Alex2', 7.5), ('Julio', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_8_1_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'Alanis Morissette', 'Ironic' FROM set_8_1
  RETURNING id
)
, votes_8_1_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_1_2.id, v.voter_name, v.score
  FROM song_8_1_2,
  (VALUES ('Mario', 7.0), ('Jorge A.', 6.0), ('Carlos', 6.5), ('Giusse', 7.5), ('Alex2', 7.0), ('Julio', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_8_1_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Blondie', 'Maria' FROM set_8_1
  RETURNING id
)
, votes_8_1_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_1_3.id, v.voter_name, v.score
  FROM song_8_1_3,
  (VALUES ('Mario', 7.0), ('Jorge A.', 7.0), ('Carlos', 8.0), ('Giusse', 7.5), ('Alex2', 8.0), ('Julio', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_8_1_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'Cindy lauper', 'Time after time' FROM set_8_1
  RETURNING id
)
, votes_8_1_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_1_4.id, v.voter_name, v.score
  FROM song_8_1_4,
  (VALUES ('Mario', 8.5), ('Jorge A.', 7.0), ('Carlos', 8.0), ('Giusse', 8.0), ('Alex2', 8.5), ('Julio', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_8_1_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'David Bowie', 'heroes' FROM set_8_1
  RETURNING id
)
, votes_8_1_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_1_5.id, v.voter_name, v.score
  FROM song_8_1_5,
  (VALUES ('Mario', 9.0), ('Jorge A.', 9.0), ('Carlos', 9.0), ('Giusse', 9.0), ('Alex2', 9.0), ('Julio', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_8_1_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'Erasure', 'I love to hate you' FROM set_8_1
  RETURNING id
)
, votes_8_1_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_1_6.id, v.voter_name, v.score
  FROM song_8_1_6,
  (VALUES ('Mario', 8.0), ('Jorge A.', 8.0), ('Carlos', 8.5), ('Giusse', 7.5), ('Alex2', 7.0), ('Julio', 5.0)) AS v(voter_name, score)
  RETURNING id
)
, song_8_1_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'Green Day', 'She' FROM set_8_1
  RETURNING id
)
, votes_8_1_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_1_7.id, v.voter_name, v.score
  FROM song_8_1_7,
  (VALUES ('Mario', 7.0), ('Jorge A.', 6.5), ('Carlos', 7.0), ('Giusse', 7.0), ('Alex2', 7.5), ('Julio', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_8_1_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'Joan Jett & The Blackhearts', 'I hate myself for loving you' FROM set_8_1
  RETURNING id
)
, votes_8_1_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_1_8.id, v.voter_name, v.score
  FROM song_8_1_8,
  (VALUES ('Mario', 6.0), ('Jorge A.', 6.5), ('Carlos', 7.0), ('Giusse', 6.0), ('Alex2', 7.0), ('Julio', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_8_1_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'Kiss', 'God Gave Rock And Roll To You' FROM set_8_1
  RETURNING id
)
, votes_8_1_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_1_9.id, v.voter_name, v.score
  FROM song_8_1_9,
  (VALUES ('Mario', 7.0), ('Jorge A.', 6.5), ('Carlos', 7.5), ('Giusse', 7.0), ('Alex2', 7.5), ('Julio', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_8_1_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'Motley Crew', 'Same old Situation' FROM set_8_1
  RETURNING id
)
, votes_8_1_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_1_10.id, v.voter_name, v.score
  FROM song_8_1_10,
  (VALUES ('Mario', 6.0), ('Jorge A.', 6.0), ('Carlos', 6.5), ('Giusse', 7.5), ('Alex2', 7.0), ('Julio', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_8_1_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'Queen y David Bowie', 'Under Preasure' FROM set_8_1
  RETURNING id
)
, votes_8_1_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_1_11.id, v.voter_name, v.score
  FROM song_8_1_11,
  (VALUES ('Mario', 10.0), ('Jorge A.', 8.0), ('Carlos', 8.0), ('Giusse', 9.5), ('Alex2', 8.0), ('Julio', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_8_1_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'Red Hot Chili Peppers', 'Under the bridge' FROM set_8_1
  RETURNING id
)
, votes_8_1_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_1_12.id, v.voter_name, v.score
  FROM song_8_1_12,
  (VALUES ('Mario', 7.0), ('Jorge A.', 9.0), ('Carlos', 6.0), ('Giusse', 7.0), ('Alex2', 7.5), ('Julio', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_8_1_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'The Beatles', 'I saw her standing there' FROM set_8_1
  RETURNING id
)
, votes_8_1_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_1_13.id, v.voter_name, v.score
  FROM song_8_1_13,
  (VALUES ('Mario', 9.0), ('Jorge A.', 7.0), ('Carlos', 7.0), ('Giusse', 8.0), ('Alex2', 8.0), ('Julio', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_8_1_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'The Beatles', 'Penny lane' FROM set_8_1
  RETURNING id
)
, votes_8_1_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_1_14.id, v.voter_name, v.score
  FROM song_8_1_14,
  (VALUES ('Mario', 7.0), ('Jorge A.', 7.5), ('Carlos', 7.5), ('Giusse', 7.5), ('Alex2', 8.0), ('Julio', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_8_1_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'zz top', 'Sharped dressed man' FROM set_8_1
  RETURNING id
)
, votes_8_1_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_1_15.id, v.voter_name, v.score
  FROM song_8_1_15,
  (VALUES ('Mario', 7.0), ('Jorge A.', 7.0), ('Carlos', 8.0), ('Giusse', 8.0), ('Alex2', 6.5), ('Julio', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, set_8_2 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 2, 'Set Freddy' FROM s8
  RETURNING id
)
, song_8_2_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'Michael Young', 'Come over' FROM set_8_2
  RETURNING id
)
, votes_8_2_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_2_0.id, v.voter_name, v.score
  FROM song_8_2_0,
  (VALUES ('Mario', 8.0), ('Daniel', 8.0), ('Carlos', 7.5), ('Giusse', 8.0), ('Mauricio O.', 8.5), ('Mauricio R.', 5.5), ('Gino', 8.0), ('Patrick', 5.0), ('Alex2', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_8_2_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'A ha', 'Take on Me' FROM set_8_2
  RETURNING id
)
, votes_8_2_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_2_1.id, v.voter_name, v.score
  FROM song_8_2_1,
  (VALUES ('Mario', 9.0), ('Daniel', 8.5), ('Carlos', 9.0), ('Giusse', 8.5), ('Mauricio O.', 8.0), ('Gino', 8.0), ('Patrick', 8.0), ('Alex2', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_8_2_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'Andy Williams', 'Moon river' FROM set_8_2
  RETURNING id
)
, votes_8_2_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_2_2.id, v.voter_name, v.score
  FROM song_8_2_2,
  (VALUES ('Mario', 9.0), ('Daniel', 7.0), ('Carlos', 8.5), ('Giusse', 8.5), ('Mauricio O.', 8.0), ('Mauricio R.', 8.5), ('Gino', 5.0), ('Patrick', 9.0), ('Alex2', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_8_2_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Boney M', 'Gotta go home' FROM set_8_2
  RETURNING id
)
, votes_8_2_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_2_3.id, v.voter_name, v.score
  FROM song_8_2_3,
  (VALUES ('Mario', 7.0), ('Daniel', 7.0), ('Carlos', 6.5), ('Mauricio O.', 6.5), ('Mauricio R.', 5.5), ('Gino', 9.0), ('Patrick', 6.5), ('Alex2', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_8_2_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'Earth Wind and Fire', 'September' FROM set_8_2
  RETURNING id
)
, votes_8_2_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_2_4.id, v.voter_name, v.score
  FROM song_8_2_4,
  (VALUES ('Mario', 8.0), ('Daniel', 7.0), ('Carlos', 7.0), ('Mauricio O.', 8.0), ('Mauricio R.', 5.0), ('Gino', 7.0), ('Patrick', 8.0), ('Alex2', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_8_2_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'Greta van Fleck', 'The new day greta van fleck' FROM set_8_2
  RETURNING id
)
, votes_8_2_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_2_5.id, v.voter_name, v.score
  FROM song_8_2_5,
  (VALUES ('Mario', 9.0), ('Daniel', 7.5), ('Carlos', 9.0), ('Giusse', 8.0), ('Mauricio O.', 8.5), ('Mauricio R.', 9.0), ('Gino', 7.5), ('Patrick', 7.0), ('Alex2', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_8_2_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'Joao Gilberto', 'The girl from ipanema' FROM set_8_2
  RETURNING id
)
, votes_8_2_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_2_6.id, v.voter_name, v.score
  FROM song_8_2_6,
  (VALUES ('Mario', 9.5), ('Daniel', 7.5), ('Carlos', 7.5), ('Giusse', 8.0), ('Mauricio O.', 6.5), ('Mauricio R.', 9.0), ('Gino', 8.0), ('Patrick', 9.0), ('Alex2', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_8_2_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'Mat maeson', 'Cringe' FROM set_8_2
  RETURNING id
)
, votes_8_2_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_2_7.id, v.voter_name, v.score
  FROM song_8_2_7,
  (VALUES ('Mario', 7.0), ('Daniel', 7.0), ('Carlos', 6.5), ('Giusse', 7.0), ('Mauricio O.', 6.5), ('Mauricio R.', 7.0), ('Gino', 7.5), ('Patrick', 8.0), ('Alex2', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_8_2_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'Mikey Mike', 'Cooler' FROM set_8_2
  RETURNING id
)
, votes_8_2_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_2_8.id, v.voter_name, v.score
  FROM song_8_2_8,
  (VALUES ('Mario', 6.0), ('Daniel', 6.5), ('Carlos', 5.5), ('Giusse', 6.5), ('Mauricio O.', 6.5), ('Mauricio R.', 7.0), ('Gino', 8.0), ('Patrick', 7.0), ('Alex2', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_8_2_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'Player', 'Baby come back' FROM set_8_2
  RETURNING id
)
, votes_8_2_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_2_9.id, v.voter_name, v.score
  FROM song_8_2_9,
  (VALUES ('Mario', 9.5), ('Daniel', 8.0), ('Carlos', 8.0), ('Giusse', 8.5), ('Mauricio O.', 9.0), ('Mauricio R.', 7.0), ('Gino', 6.0), ('Patrick', 8.0), ('Alex2', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_8_2_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'Simon and Gardfunkel', 'The sound of silence' FROM set_8_2
  RETURNING id
)
, votes_8_2_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_2_10.id, v.voter_name, v.score
  FROM song_8_2_10,
  (VALUES ('Mario', 7.0), ('Daniel', 7.5), ('Carlos', 7.0), ('Giusse', 7.5), ('Mauricio O.', 6.5), ('Gino', 10.0), ('Patrick', 8.0), ('Alex2', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_8_2_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'Supertramp', 'Good bye stranger' FROM set_8_2
  RETURNING id
)
, votes_8_2_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_2_11.id, v.voter_name, v.score
  FROM song_8_2_11,
  (VALUES ('Mario', 9.5), ('Daniel', 8.5), ('Carlos', 10.0), ('Giusse', 9.5), ('Mauricio O.', 8.5), ('Gino', 10.0), ('Patrick', 10.0), ('Alex2', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_8_2_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'Taryn Southern', 'break free' FROM set_8_2
  RETURNING id
)
, votes_8_2_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_2_12.id, v.voter_name, v.score
  FROM song_8_2_12,
  (VALUES ('Mario', 6.0), ('Daniel', 6.5), ('Carlos', 6.5), ('Mauricio O.', 5.0), ('Mauricio R.', 7.5), ('Gino', 6.0), ('Patrick', 6.0), ('Alex2', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_8_2_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'The Beatles', 'Get Back' FROM set_8_2
  RETURNING id
)
, votes_8_2_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_2_13.id, v.voter_name, v.score
  FROM song_8_2_13,
  (VALUES ('Mario', 9.0), ('Daniel', 7.0), ('Carlos', 8.0), ('Giusse', 9.5), ('Mauricio O.', 9.0), ('Gino', 8.0), ('Patrick', 8.0), ('Alex2', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_8_2_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'The Regrettes', 'Dont stop me now' FROM set_8_2
  RETURNING id
)
, votes_8_2_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_2_14.id, v.voter_name, v.score
  FROM song_8_2_14,
  (VALUES ('Mario', 4.0), ('Daniel', 3.5), ('Carlos', 3.0), ('Giusse', 5.5), ('Mauricio O.', 3.5), ('Mauricio R.', 4.0), ('Gino', 4.0), ('Patrick', 2.0), ('Alex2', 4.0)) AS v(voter_name, score)
  RETURNING id
)
, song_8_2_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'The Strumbellas', 'Salvation' FROM set_8_2
  RETURNING id
)
, votes_8_2_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_2_15.id, v.voter_name, v.score
  FROM song_8_2_15,
  (VALUES ('Mario', 8.0), ('Daniel', 7.5), ('Carlos', 9.0), ('Mauricio O.', 7.0), ('Mauricio R.', 9.0), ('Gino', 6.0), ('Patrick', 8.0), ('Alex2', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, set_8_3 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 3, 'Set Jorge' FROM s8
  RETURNING id
)
, song_8_3_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'Babasonicos', 'Irresponsables' FROM set_8_3
  RETURNING id
)
, votes_8_3_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_3_0.id, v.voter_name, v.score
  FROM song_8_3_0,
  (VALUES ('Mario', 6.0), ('Daniel', 6.0), ('Carlos', 7.5), ('Mauricio O.', 7.0), ('Gino', 5.5), ('Patrick', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_8_3_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'Friendly fires', 'Skeleton boy' FROM set_8_3
  RETURNING id
)
, votes_8_3_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_3_1.id, v.voter_name, v.score
  FROM song_8_3_1,
  (VALUES ('Mario', 7.0), ('Daniel', 6.5), ('Carlos', 8.0), ('Mauricio O.', 6.5), ('Gino', 7.5), ('Patrick', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_8_3_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'Imagine dragons', 'On top of the world' FROM set_8_3
  RETURNING id
)
, votes_8_3_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_3_2.id, v.voter_name, v.score
  FROM song_8_3_2,
  (VALUES ('Mario', 7.0), ('Daniel', 7.0), ('Carlos', 6.0), ('Mauricio O.', 7.0), ('Gino', 7.0), ('Patrick', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_8_3_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Isaac delusion', 'Hoy much you want her' FROM set_8_3
  RETURNING id
)
, votes_8_3_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_3_3.id, v.voter_name, v.score
  FROM song_8_3_3,
  (VALUES ('Mario', 8.5), ('Daniel', 7.5), ('Carlos', 7.0), ('Mauricio O.', 8.0), ('Gino', 7.0), ('Patrick', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_8_3_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'Jamiroquai', 'Love Foolosophy' FROM set_8_3
  RETURNING id
)
, votes_8_3_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_3_4.id, v.voter_name, v.score
  FROM song_8_3_4,
  (VALUES ('Mario', 6.0), ('Daniel', 5.0), ('Carlos', 7.0), ('Mauricio O.', 8.5), ('Gino', 4.0), ('Patrick', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_8_3_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'Joe Hisaishi', 'One Summer day' FROM set_8_3
  RETURNING id
)
, votes_8_3_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_3_5.id, v.voter_name, v.score
  FROM song_8_3_5,
  (VALUES ('Mario', 9.0), ('Daniel', 7.0), ('Carlos', 8.5), ('Mauricio O.', 9.0), ('Gino', 7.0), ('Patrick', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_8_3_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'Kendrick Lamar SZA', 'All the Stars' FROM set_8_3
  RETURNING id
)
, votes_8_3_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_3_6.id, v.voter_name, v.score
  FROM song_8_3_6,
  (VALUES ('Mario', 8.5), ('Daniel', 7.0), ('Carlos', 7.0), ('Mauricio O.', 8.5), ('Gino', 7.0), ('Patrick', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_8_3_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'Kool and the Gang', 'Cherish' FROM set_8_3
  RETURNING id
)
, votes_8_3_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_3_7.id, v.voter_name, v.score
  FROM song_8_3_7,
  (VALUES ('Mario', 7.5), ('Daniel', 6.5), ('Carlos', 6.0), ('Mauricio O.', 7.0), ('Gino', 6.5), ('Patrick', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_8_3_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'Modest house', 'Float on' FROM set_8_3
  RETURNING id
)
, votes_8_3_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_3_8.id, v.voter_name, v.score
  FROM song_8_3_8,
  (VALUES ('Mario', 6.0), ('Daniel', 7.5), ('Carlos', 8.5), ('Mauricio O.', 8.5), ('Gino', 7.5), ('Patrick', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_8_3_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'PXNDX', 'Narcisista por excelencia' FROM set_8_3
  RETURNING id
)
, votes_8_3_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_3_9.id, v.voter_name, v.score
  FROM song_8_3_9,
  (VALUES ('Mario', 7.0), ('Daniel', 6.5), ('Carlos', 7.5), ('Mauricio O.', 8.0), ('Gino', 6.0), ('Patrick', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_8_3_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'PXNDX', 'Los malaventurados no lloran' FROM set_8_3
  RETURNING id
)
, votes_8_3_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_3_10.id, v.voter_name, v.score
  FROM song_8_3_10,
  (VALUES ('Mario', 7.0), ('Daniel', 7.0), ('Carlos', 7.0), ('Mauricio O.', 8.0), ('Gino', 5.0), ('Patrick', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_8_3_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'Satin jackets', 'Northern Lights' FROM set_8_3
  RETURNING id
)
, votes_8_3_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_3_11.id, v.voter_name, v.score
  FROM song_8_3_11,
  (VALUES ('Mario', 8.5), ('Daniel', 7.5), ('Carlos', 9.0), ('Mauricio O.', 7.0), ('Gino', 7.5), ('Patrick', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_8_3_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'Satin Jackets', 'Mirage' FROM set_8_3
  RETURNING id
)
, votes_8_3_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_3_12.id, v.voter_name, v.score
  FROM song_8_3_12,
  (VALUES ('Mario', 7.5), ('Daniel', 6.5), ('Carlos', 6.0), ('Mauricio O.', 7.0), ('Gino', 6.0), ('Patrick', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_8_3_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'The temper trap', 'Fader' FROM set_8_3
  RETURNING id
)
, votes_8_3_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_3_13.id, v.voter_name, v.score
  FROM song_8_3_13,
  (VALUES ('Mario', 6.0), ('Daniel', 6.0), ('Carlos', 7.0), ('Mauricio O.', 6.5), ('Gino', 6.0), ('Patrick', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_8_3_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'Wheatus', 'Teenage dirtbag' FROM set_8_3
  RETURNING id
)
, votes_8_3_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_3_14.id, v.voter_name, v.score
  FROM song_8_3_14,
  (VALUES ('Mario', 7.0), ('Daniel', 8.0), ('Carlos', 7.0), ('Mauricio O.', 9.0), ('Gino', 8.0), ('Patrick', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_8_3_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'You me at six', 'Back again' FROM set_8_3
  RETURNING id
)
, votes_8_3_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_3_15.id, v.voter_name, v.score
  FROM song_8_3_15,
  (VALUES ('Mario', 9.0), ('Daniel', 7.0), ('Carlos', 7.0), ('Mauricio O.', 7.0), ('Gino', 7.0), ('Patrick', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, set_8_4 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 4, 'Set Mauricio R' FROM s8
  RETURNING id
)
, song_8_4_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'Bastille', 'Those Nights' FROM set_8_4
  RETURNING id
)
, votes_8_4_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_4_0.id, v.voter_name, v.score
  FROM song_8_4_0,
  (VALUES ('Daniel', 7.0), ('Carlos', 6.0), ('Giusse', 8.0), ('Mauricio O.', 7.0), ('Julio', 5.0), ('Dante', 5.0)) AS v(voter_name, score)
  RETURNING id
)
, song_8_4_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'Carlos Gardel', 'Volver' FROM set_8_4
  RETURNING id
)
, votes_8_4_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_4_1.id, v.voter_name, v.score
  FROM song_8_4_1,
  (VALUES ('Daniel', 5.0), ('Carlos', 7.5), ('Giusse', 6.0), ('Mauricio O.', 8.5), ('Julio', 7.5), ('Dante', 5.5)) AS v(voter_name, score)
  RETURNING id
)
, song_8_4_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'Chabuca Granda', 'Cardo o Ceniza' FROM set_8_4
  RETURNING id
)
, votes_8_4_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_4_2.id, v.voter_name, v.score
  FROM song_8_4_2,
  (VALUES ('Daniel', 6.0), ('Carlos', 7.0), ('Giusse', 6.0), ('Mauricio O.', 6.0), ('Julio', 7.5), ('Dante', 5.0)) AS v(voter_name, score)
  RETURNING id
)
, song_8_4_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Creedence', 'Bad Moon Rising' FROM set_8_4
  RETURNING id
)
, votes_8_4_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_4_3.id, v.voter_name, v.score
  FROM song_8_4_3,
  (VALUES ('Daniel', 7.5), ('Carlos', 7.0), ('Giusse', 7.0), ('Mauricio O.', 7.5), ('Julio', 4.0), ('Dante', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_8_4_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'Eric Clapton', 'Cocaine' FROM set_8_4
  RETURNING id
)
, votes_8_4_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_4_4.id, v.voter_name, v.score
  FROM song_8_4_4,
  (VALUES ('Daniel', 7.5), ('Carlos', 7.5), ('Giusse', 7.0), ('Mauricio O.', 8.0), ('Julio', 6.5), ('Dante', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_8_4_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'Illenium Jon Bellion', 'Good Things Fall Apart' FROM set_8_4
  RETURNING id
)
, votes_8_4_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_4_5.id, v.voter_name, v.score
  FROM song_8_4_5,
  (VALUES ('Daniel', 7.0), ('Carlos', 7.0), ('Giusse', 8.0), ('Mauricio O.', 6.0), ('Julio', 6.0), ('Dante', 5.0)) AS v(voter_name, score)
  RETURNING id
)
, song_8_4_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'Lana del Rey', 'Doin'' Time' FROM set_8_4
  RETURNING id
)
, votes_8_4_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_4_6.id, v.voter_name, v.score
  FROM song_8_4_6,
  (VALUES ('Daniel', 7.0), ('Carlos', 6.0), ('Giusse', 6.0), ('Mauricio O.', 5.0), ('Julio', 4.0), ('Dante', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_8_4_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'Nazareth', 'Ruby Tuesday' FROM set_8_4
  RETURNING id
)
, votes_8_4_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_4_7.id, v.voter_name, v.score
  FROM song_8_4_7,
  (VALUES ('Daniel', 8.0), ('Carlos', 8.0), ('Giusse', 8.0), ('Mauricio O.', 9.0), ('Julio', 6.5), ('Dante', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_8_4_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'Neil Diamond', 'Forever in blujeans' FROM set_8_4
  RETURNING id
)
, votes_8_4_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_4_8.id, v.voter_name, v.score
  FROM song_8_4_8,
  (VALUES ('Daniel', 7.5), ('Carlos', 8.0), ('Giusse', 10.0), ('Mauricio O.', 8.0), ('Julio', 4.0), ('Dante', 5.0)) AS v(voter_name, score)
  RETURNING id
)
, song_8_4_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'Peter Schilling', 'Major Tom' FROM set_8_4
  RETURNING id
)
, votes_8_4_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_4_9.id, v.voter_name, v.score
  FROM song_8_4_9,
  (VALUES ('Daniel', 8.0), ('Carlos', 9.0), ('Giusse', 8.0), ('Mauricio O.', 7.5), ('Julio', 8.0), ('Dante', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_8_4_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'REO Speedwagon', 'Take it on the run' FROM set_8_4
  RETURNING id
)
, votes_8_4_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_4_10.id, v.voter_name, v.score
  FROM song_8_4_10,
  (VALUES ('Daniel', 7.0), ('Carlos', 8.5), ('Giusse', 9.0), ('Mauricio O.', 9.0), ('Julio', 7.5), ('Dante', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_8_4_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'Roxy Music', 'More Than This' FROM set_8_4
  RETURNING id
)
, votes_8_4_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_4_11.id, v.voter_name, v.score
  FROM song_8_4_11,
  (VALUES ('Daniel', 7.5), ('Carlos', 8.0), ('Giusse', 7.0), ('Mauricio O.', 7.0), ('Julio', 6.5), ('Dante', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_8_4_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'Ruben Blades', 'Pedro Navaja' FROM set_8_4
  RETURNING id
)
, votes_8_4_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_4_12.id, v.voter_name, v.score
  FROM song_8_4_12,
  (VALUES ('Daniel', 7.0), ('Carlos', 5.0), ('Giusse', 7.0), ('Mauricio O.', 6.5), ('Julio', 6.5), ('Dante', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_8_4_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'Tchaikovsky (sym Chicag)', 'Capriccio Italiano' FROM set_8_4
  RETURNING id
)
, votes_8_4_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_4_13.id, v.voter_name, v.score
  FROM song_8_4_13,
  (VALUES ('Daniel', 6.0), ('Carlos', 7.0), ('Giusse', 7.0), ('Mauricio O.', 9.0), ('Julio', 8.5), ('Dante', 4.0)) AS v(voter_name, score)
  RETURNING id
)
, song_8_4_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'The Lumineers', 'Gloria' FROM set_8_4
  RETURNING id
)
, votes_8_4_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_4_14.id, v.voter_name, v.score
  FROM song_8_4_14,
  (VALUES ('Daniel', 6.5), ('Carlos', 6.0), ('Giusse', 7.0), ('Mauricio O.', 7.0), ('Julio', 6.0), ('Dante', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_8_4_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'Traffic Sound', 'Meshkalina' FROM set_8_4
  RETURNING id
)
, votes_8_4_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_4_15.id, v.voter_name, v.score
  FROM song_8_4_15,
  (VALUES ('Daniel', 8.0), ('Carlos', 8.5), ('Giusse', 8.0), ('Mauricio O.', 8.5), ('Julio', 8.0), ('Dante', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, set_8_5 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 5, 'Set Patrick' FROM s8
  RETURNING id
)
, song_8_5_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'Beatles', 'Dear Prudence' FROM set_8_5
  RETURNING id
)
, votes_8_5_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_5_0.id, v.voter_name, v.score
  FROM song_8_5_0,
  (VALUES ('Daniel', 7.0), ('Jorge A.', 6.5), ('Carlos', 7.0), ('Freddy', 8.0), ('Mauricio R.', 7.0), ('Alex2', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_8_5_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'Belle & Sebastian', 'If you find yourself caught in love' FROM set_8_5
  RETURNING id
)
, votes_8_5_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_5_1.id, v.voter_name, v.score
  FROM song_8_5_1,
  (VALUES ('Daniel', 7.0), ('Jorge A.', 6.5), ('Carlos', 7.0), ('Freddy', 8.0), ('Mauricio R.', 7.0), ('Alex2', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_8_5_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'Bush', 'Glycerine' FROM set_8_5
  RETURNING id
)
, votes_8_5_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_5_2.id, v.voter_name, v.score
  FROM song_8_5_2,
  (VALUES ('Daniel', 8.0), ('Jorge A.', 7.5), ('Carlos', 7.5), ('Freddy', 8.0), ('Mauricio R.', 7.5), ('Alex2', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_8_5_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Cat Stevens', 'Wild World' FROM set_8_5
  RETURNING id
)
, votes_8_5_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_5_3.id, v.voter_name, v.score
  FROM song_8_5_3,
  (VALUES ('Daniel', 7.5), ('Jorge A.', 7.0), ('Carlos', 7.0), ('Freddy', 9.0), ('Mauricio R.', 7.0), ('Alex2', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_8_5_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'Celine Dion', 'Think Twice' FROM set_8_5
  RETURNING id
)
, votes_8_5_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_5_4.id, v.voter_name, v.score
  FROM song_8_5_4,
  (VALUES ('Daniel', 6.5), ('Jorge A.', 6.0), ('Carlos', 6.5), ('Freddy', 8.0), ('Mauricio R.', 5.0), ('Alex2', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_8_5_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'Charly Garcia', 'Funky' FROM set_8_5
  RETURNING id
)
, song_8_5_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'Coldplay', 'A rush of blood to the head' FROM set_8_5
  RETURNING id
)
, votes_8_5_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_5_6.id, v.voter_name, v.score
  FROM song_8_5_6,
  (VALUES ('Daniel', 6.5), ('Jorge A.', 7.5), ('Carlos', 6.5), ('Freddy', 7.0), ('Mauricio R.', 8.5), ('Alex2', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_8_5_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'George Harrison', 'My Sweet Lord' FROM set_8_5
  RETURNING id
)
, song_8_5_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'Heroes del Silencio', 'Entre Dos Tierras' FROM set_8_5
  RETURNING id
)
, votes_8_5_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_5_8.id, v.voter_name, v.score
  FROM song_8_5_8,
  (VALUES ('Daniel', 7.5), ('Jorge A.', 8.5), ('Carlos', 8.0), ('Freddy', 8.0), ('Mauricio R.', 8.5), ('Alex2', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_8_5_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'Lenny Kravitz', 'American Woman' FROM set_8_5
  RETURNING id
)
, votes_8_5_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_5_9.id, v.voter_name, v.score
  FROM song_8_5_9,
  (VALUES ('Daniel', 7.5), ('Jorge A.', 6.5), ('Carlos', 6.0), ('Freddy', 6.5), ('Mauricio R.', 8.0), ('Alex2', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_8_5_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'Louis Armstrong', 'What a Wonderfull World' FROM set_8_5
  RETURNING id
)
, votes_8_5_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_5_10.id, v.voter_name, v.score
  FROM song_8_5_10,
  (VALUES ('Daniel', 7.5), ('Jorge A.', 7.5), ('Carlos', 9.0), ('Freddy', 9.0), ('Mauricio R.', 7.0), ('Alex2', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_8_5_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'Mark Ronson Ft. Bruno Mars', 'Uptown Funk' FROM set_8_5
  RETURNING id
)
, votes_8_5_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_5_11.id, v.voter_name, v.score
  FROM song_8_5_11,
  (VALUES ('Daniel', 6.5), ('Jorge A.', 6.5), ('Carlos', 7.0), ('Freddy', 6.0), ('Mauricio R.', 6.0), ('Alex2', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_8_5_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'OASIS', 'Stand By Me' FROM set_8_5
  RETURNING id
)
, votes_8_5_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_5_12.id, v.voter_name, v.score
  FROM song_8_5_12,
  (VALUES ('Daniel', 6.0), ('Jorge A.', 8.5), ('Carlos', 8.0), ('Freddy', 8.0), ('Mauricio R.', 9.5), ('Alex2', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_8_5_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'Pablo Milanes', 'Yolanda' FROM set_8_5
  RETURNING id
)
, votes_8_5_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_5_13.id, v.voter_name, v.score
  FROM song_8_5_13,
  (VALUES ('Daniel', 5.0), ('Jorge A.', 5.0), ('Carlos', 8.5), ('Freddy', 5.0), ('Mauricio R.', 8.5), ('Alex2', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_8_5_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'Pat Benatar', 'Hit me with your best shot' FROM set_8_5
  RETURNING id
)
, votes_8_5_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_5_14.id, v.voter_name, v.score
  FROM song_8_5_14,
  (VALUES ('Daniel', 8.0), ('Jorge A.', 7.0), ('Carlos', 7.0), ('Freddy', 7.0), ('Mauricio R.', 6.5), ('Alex2', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_8_5_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'The Chiffons', 'He is so fine' FROM set_8_5
  RETURNING id
)
, song_8_5_16 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 16, 'The Doors', 'Indian Summer' FROM set_8_5
  RETURNING id
)
, votes_8_5_16 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_5_16.id, v.voter_name, v.score
  FROM song_8_5_16,
  (VALUES ('Daniel', 6.5), ('Jorge A.', 6.5), ('Carlos', 5.0), ('Freddy', 7.0), ('Mauricio R.', 8.5), ('Alex2', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_8_5_17 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 17, 'U2', 'One' FROM set_8_5
  RETURNING id
)
, votes_8_5_17 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_8_5_17.id, v.voter_name, v.score
  FROM song_8_5_17,
  (VALUES ('Daniel', 8.0), ('Jorge A.', 8.5), ('Carlos', 8.0), ('Freddy', 8.0), ('Mauricio R.', 9.0), ('Alex2', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, set_8_6 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 6, 'Set Rafael' FROM s8
  RETURNING id
)
, song_8_6_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'Bob Dylan', 'Like a Rolling Stones' FROM set_8_6
  RETURNING id
)
, song_8_6_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'BORNS', 'Electric Love' FROM set_8_6
  RETURNING id
)
, song_8_6_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'Dick Dale', 'Misirlou' FROM set_8_6
  RETURNING id
)
, song_8_6_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Fink', 'Looking Too Closely' FROM set_8_6
  RETURNING id
)
, song_8_6_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'Gnarls Barkley', 'Crazy' FROM set_8_6
  RETURNING id
)
, song_8_6_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'Janis Joplin', 'Maybe' FROM set_8_6
  RETURNING id
)
, song_8_6_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'Johnny Rivers', 'Secret Agent Man' FROM set_8_6
  RETURNING id
)
, song_8_6_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'Mumford &Son', 'Guiding Light' FROM set_8_6
  RETURNING id
)
, song_8_6_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'Neon Trees', 'Animal' FROM set_8_6
  RETURNING id
)
, song_8_6_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'Saint Motel', 'Cold Cold Man' FROM set_8_6
  RETURNING id
)
, song_8_6_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'Simple Red', 'Fairground (+Sample)' FROM set_8_6
  RETURNING id
)
, song_8_6_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'The Alan Parsons Project', 'I Wouldn´t Want to Be Like You' FROM set_8_6
  RETURNING id
)
, song_8_6_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'The Animals', 'Don´t Let Me Be Misunderstood' FROM set_8_6
  RETURNING id
)
, song_8_6_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'The Beatles', 'While My Guitar Gently Weeps' FROM set_8_6
  RETURNING id
)
, song_8_6_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'The Cure', 'The Lovecats' FROM set_8_6
  RETURNING id
)
, song_8_6_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'The Rolling Stones', '2000 Light Years from Home' FROM set_8_6
  RETURNING id
)
SELECT id FROM s8;

WITH s9 AS (
  INSERT INTO cyc_sessions (session_num, host, date, attendees, input_mode, sets_count, songs_count, complete)
  VALUES (9, 'Temporada 9', '2024-11-01', ARRAY["Alex", "Alex2", "Carlos", "Daniel", "Francisco", "Freddy", "Gino", "Giusse", "Jorge A.", "Julio", "Lucho", "Mario", "Mauricio O.", "Patrick"]::text[], 'host', 3, 20, true)
  RETURNING id
)
, set_9_0 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 0, 'Set Carlos' FROM s9
  RETURNING id
)
, song_9_0_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'Leonard Cohen', 'Hallelujah' FROM set_9_0
  RETURNING id
)
, votes_9_0_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_9_0_0.id, v.voter_name, v.score
  FROM song_9_0_0,
  (VALUES ('Mario', 8.5), ('Daniel', 8.5), ('Jorge A.', 7.5), ('Freddy', 8.5), ('Mauricio O.', 8.0), ('Lucho', 8.0), ('Gino', 7.5), ('Patrick', 9.0), ('Alex', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_9_0_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'AC DC', 'Demon Fire' FROM set_9_0
  RETURNING id
)
, votes_9_0_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_9_0_1.id, v.voter_name, v.score
  FROM song_9_0_1,
  (VALUES ('Mario', 8.5), ('Daniel', 7.5), ('Jorge A.', 8.0), ('Freddy', 7.0), ('Mauricio O.', 8.5), ('Lucho', 8.0), ('Gino', 8.0), ('Patrick', 8.0), ('Alex', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_9_0_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'Vivaldi', 'Invierno' FROM set_9_0
  RETURNING id
)
, votes_9_0_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_9_0_2.id, v.voter_name, v.score
  FROM song_9_0_2,
  (VALUES ('Mario', 10.0), ('Daniel', 7.5), ('Jorge A.', 9.5), ('Freddy', 9.5), ('Mauricio O.', 9.0), ('Lucho', 10.0), ('Gino', 9.0), ('Patrick', 8.0), ('Alex', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_9_0_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Procol Harum', 'A whiter Shade of Pale' FROM set_9_0
  RETURNING id
)
, votes_9_0_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_9_0_3.id, v.voter_name, v.score
  FROM song_9_0_3,
  (VALUES ('Mario', 9.0), ('Daniel', 7.0), ('Jorge A.', 7.5), ('Freddy', 10.0), ('Mauricio O.', 9.0), ('Lucho', 8.0), ('Gino', 7.0), ('Patrick', 8.0), ('Alex', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_9_0_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'Heaven 17', 'Let me Go' FROM set_9_0
  RETURNING id
)
, votes_9_0_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_9_0_4.id, v.voter_name, v.score
  FROM song_9_0_4,
  (VALUES ('Mario', 8.0), ('Daniel', 7.5), ('Jorge A.', 8.0), ('Freddy', 8.0), ('Mauricio O.', 7.0), ('Lucho', 7.5), ('Gino', 9.5), ('Patrick', 7.0), ('Alex', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_9_0_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'Barry Manilow', 'Can´t Smile Without You' FROM set_9_0
  RETURNING id
)
, votes_9_0_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_9_0_5.id, v.voter_name, v.score
  FROM song_9_0_5,
  (VALUES ('Mario', 7.5), ('Daniel', 7.5), ('Jorge A.', 8.0), ('Freddy', 9.0), ('Mauricio O.', 7.0), ('Lucho', 8.0), ('Gino', 8.0), ('Patrick', 8.0), ('Alex', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_9_0_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'Lykke Li', 'I follow rivers' FROM set_9_0
  RETURNING id
)
, votes_9_0_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_9_0_6.id, v.voter_name, v.score
  FROM song_9_0_6,
  (VALUES ('Mario', 8.0), ('Daniel', 8.0), ('Jorge A.', 8.5), ('Freddy', 7.0), ('Mauricio O.', 8.5), ('Lucho', 8.0), ('Gino', 8.0), ('Patrick', 8.0), ('Alex', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_9_0_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'Fleetwood Mac', 'Big Love' FROM set_9_0
  RETURNING id
)
, votes_9_0_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_9_0_7.id, v.voter_name, v.score
  FROM song_9_0_7,
  (VALUES ('Mario', 9.0), ('Daniel', 8.5), ('Jorge A.', 9.0), ('Freddy', 9.0), ('Mauricio O.', 9.0), ('Lucho', 9.0), ('Gino', 9.0), ('Patrick', 9.0), ('Alex', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_9_0_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'Rigoberta Bandini', 'In spain we call it Soledad' FROM set_9_0
  RETURNING id
)
, votes_9_0_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_9_0_8.id, v.voter_name, v.score
  FROM song_9_0_8,
  (VALUES ('Mario', 9.0), ('Daniel', 6.5), ('Jorge A.', 8.0), ('Freddy', 8.0), ('Mauricio O.', 6.5), ('Lucho', 7.5), ('Gino', 7.0), ('Patrick', 9.0), ('Alex', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_9_0_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'Bongos Atomicos', 'Tarde para Amarte' FROM set_9_0
  RETURNING id
)
, votes_9_0_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_9_0_9.id, v.voter_name, v.score
  FROM song_9_0_9,
  (VALUES ('Mario', 7.0), ('Daniel', 7.5), ('Jorge A.', 8.5), ('Freddy', 8.0), ('Mauricio O.', 9.0), ('Lucho', 7.5), ('Gino', 9.0), ('Patrick', 8.0), ('Alex', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_9_0_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'Monomen', 'Drum of Glass' FROM set_9_0
  RETURNING id
)
, votes_9_0_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_9_0_10.id, v.voter_name, v.score
  FROM song_9_0_10,
  (VALUES ('Mario', 8.0), ('Daniel', 8.0), ('Jorge A.', 8.5), ('Freddy', 7.0), ('Mauricio O.', 7.0), ('Lucho', 9.0), ('Gino', 8.0), ('Patrick', 8.0), ('Alex', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_9_0_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'A-Ha', 'Scoundrel Days' FROM set_9_0
  RETURNING id
)
, votes_9_0_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_9_0_11.id, v.voter_name, v.score
  FROM song_9_0_11,
  (VALUES ('Mario', 9.0), ('Daniel', 8.5), ('Jorge A.', 7.5), ('Freddy', 8.0), ('Mauricio O.', 9.0), ('Lucho', 8.0), ('Gino', 8.0), ('Patrick', 9.0), ('Alex', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_9_0_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'Abba', 'The Name of the Game' FROM set_9_0
  RETURNING id
)
, votes_9_0_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_9_0_12.id, v.voter_name, v.score
  FROM song_9_0_12,
  (VALUES ('Mario', 10.0), ('Daniel', 8.5), ('Jorge A.', 6.5), ('Freddy', 9.5), ('Mauricio O.', 6.5), ('Lucho', 8.0), ('Gino', 8.0), ('Patrick', 10.0), ('Alex', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_9_0_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'Cage the Elephant', 'Black Madonna' FROM set_9_0
  RETURNING id
)
, votes_9_0_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_9_0_13.id, v.voter_name, v.score
  FROM song_9_0_13,
  (VALUES ('Mario', 7.0), ('Daniel', 7.5), ('Jorge A.', 8.5), ('Freddy', 6.0), ('Mauricio O.', 8.5), ('Lucho', 9.0), ('Gino', 7.5), ('Patrick', 7.0), ('Alex', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_9_0_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'Fisher', 'Losing It' FROM set_9_0
  RETURNING id
)
, votes_9_0_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_9_0_14.id, v.voter_name, v.score
  FROM song_9_0_14,
  (VALUES ('Mario', 7.5), ('Daniel', 7.0), ('Jorge A.', 8.0), ('Freddy', 9.0), ('Mauricio O.', 8.5), ('Lucho', 7.5), ('Gino', 6.0), ('Patrick', 7.0), ('Alex', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_9_0_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'Pedro Suarez Vertiz', 'Si escuchas un angel' FROM set_9_0
  RETURNING id
)
, votes_9_0_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_9_0_15.id, v.voter_name, v.score
  FROM song_9_0_15,
  (VALUES ('Mario', 7.0), ('Daniel', 8.0), ('Jorge A.', 8.5), ('Freddy', 10.0), ('Mauricio O.', 9.0), ('Lucho', 8.0), ('Gino', 6.0), ('Patrick', 7.0), ('Alex', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_9_0_16 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 16, 'Modern Talking', 'You are my Heart' FROM set_9_0
  RETURNING id
)
, votes_9_0_16 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_9_0_16.id, v.voter_name, v.score
  FROM song_9_0_16,
  (VALUES ('Mario', 7.0), ('Daniel', 8.0), ('Jorge A.', 9.0), ('Freddy', 8.0), ('Mauricio O.', 9.5), ('Lucho', 8.5), ('Gino', 7.0), ('Patrick', 7.5), ('Alex', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_9_0_17 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 17, 'Boney M', 'Rivers of Babilony' FROM set_9_0
  RETURNING id
)
, votes_9_0_17 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_9_0_17.id, v.voter_name, v.score
  FROM song_9_0_17,
  (VALUES ('Mario', 9.0), ('Daniel', 7.0), ('Jorge A.', 6.5), ('Freddy', 9.0), ('Mauricio O.', 7.0), ('Lucho', 9.0), ('Gino', 8.5), ('Patrick', 9.0), ('Alex', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_9_0_18 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 18, 'Air Supply', 'Just as I am' FROM set_9_0
  RETURNING id
)
, votes_9_0_18 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_9_0_18.id, v.voter_name, v.score
  FROM song_9_0_18,
  (VALUES ('Mario', 8.5), ('Daniel', 7.5), ('Jorge A.', 7.0), ('Freddy', 8.0), ('Mauricio O.', 7.5), ('Lucho', 8.0), ('Gino', 6.5), ('Patrick', 9.0), ('Alex', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_9_0_19 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 19, 'The Cure', 'Boys dont cry' FROM set_9_0
  RETURNING id
)
, votes_9_0_19 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_9_0_19.id, v.voter_name, v.score
  FROM song_9_0_19,
  (VALUES ('Mario', 9.0), ('Daniel', 7.5), ('Jorge A.', 9.0), ('Freddy', 10.0), ('Mauricio O.', 8.0), ('Lucho', 8.5), ('Gino', 8.5), ('Patrick', 8.0), ('Alex', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, set_9_1 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 1, 'Set Lucho' FROM s9
  RETURNING id
)
, song_9_1_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'Electronic', 'Getting Away with It' FROM set_9_1
  RETURNING id
)
, votes_9_1_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_9_1_0.id, v.voter_name, v.score
  FROM song_9_1_0,
  (VALUES ('Mario', 8.0), ('Jorge A.', 8.0), ('Carlos', 8.0), ('Freddy', 8.0), ('Mauricio O.', 8.0), ('Patrick', 6.0), ('Alex2', 8.0), ('Julio', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_9_1_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'Sade', 'Hang On to Your Love' FROM set_9_1
  RETURNING id
)
, votes_9_1_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_9_1_1.id, v.voter_name, v.score
  FROM song_9_1_1,
  (VALUES ('Mario', 9.0), ('Jorge A.', 8.5), ('Carlos', 8.5), ('Freddy', 8.0), ('Mauricio O.', 8.5), ('Patrick', 8.5), ('Alex2', 8.5), ('Julio', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_9_1_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'Supertramp', 'I''m Beggin'' you' FROM set_9_1
  RETURNING id
)
, votes_9_1_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_9_1_2.id, v.voter_name, v.score
  FROM song_9_1_2,
  (VALUES ('Mario', 8.5), ('Jorge A.', 8.0), ('Carlos', 9.0), ('Freddy', 7.0), ('Mauricio O.', 8.0), ('Patrick', 8.5), ('Alex2', 8.5), ('Julio', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_9_1_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Daft Punk', 'Giorgio by Moroder' FROM set_9_1
  RETURNING id
)
, votes_9_1_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_9_1_3.id, v.voter_name, v.score
  FROM song_9_1_3,
  (VALUES ('Mario', 8.0), ('Jorge A.', 9.0), ('Carlos', 7.5), ('Freddy', 7.0), ('Mauricio O.', 9.0), ('Patrick', 9.0), ('Alex2', 7.0), ('Julio', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_9_1_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'Lipps, inc.', 'How Long' FROM set_9_1
  RETURNING id
)
, votes_9_1_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_9_1_4.id, v.voter_name, v.score
  FROM song_9_1_4,
  (VALUES ('Mario', 9.0), ('Jorge A.', 7.5), ('Carlos', 7.5), ('Freddy', 8.0), ('Giusse', 8.0), ('Mauricio O.', 8.0), ('Patrick', 8.0), ('Alex2', 7.5), ('Julio', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_9_1_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'Emerson, Lake & Palmer', 'From the Beginning' FROM set_9_1
  RETURNING id
)
, votes_9_1_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_9_1_5.id, v.voter_name, v.score
  FROM song_9_1_5,
  (VALUES ('Mario', 7.0), ('Jorge A.', 8.0), ('Carlos', 7.0), ('Freddy', 8.0), ('Giusse', 8.0), ('Mauricio O.', 7.5), ('Patrick', 8.0), ('Alex2', 7.0), ('Julio', 9.5)) AS v(voter_name, score)
  RETURNING id
)
, song_9_1_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'Giorgio Moroder', 'Chase' FROM set_9_1
  RETURNING id
)
, votes_9_1_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_9_1_6.id, v.voter_name, v.score
  FROM song_9_1_6,
  (VALUES ('Mario', 8.5), ('Jorge A.', 7.0), ('Carlos', 7.0), ('Freddy', 7.5), ('Giusse', 8.0), ('Mauricio O.', 8.5), ('Patrick', 7.5), ('Alex2', 7.0), ('Julio', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_9_1_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'The Avener', 'Fade Out Lines - The Avener Rework' FROM set_9_1
  RETURNING id
)
, votes_9_1_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_9_1_7.id, v.voter_name, v.score
  FROM song_9_1_7,
  (VALUES ('Mario', 8.5), ('Jorge A.', 8.0), ('Carlos', 8.0), ('Freddy', 8.0), ('Giusse', 9.0), ('Mauricio O.', 8.5), ('Patrick', 8.5), ('Alex2', 8.0), ('Julio', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_9_1_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'Steely Dan', 'Hey Nineteen' FROM set_9_1
  RETURNING id
)
, votes_9_1_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_9_1_8.id, v.voter_name, v.score
  FROM song_9_1_8,
  (VALUES ('Mario', 8.0), ('Jorge A.', 8.0), ('Carlos', 7.5), ('Freddy', 8.0), ('Giusse', 9.0), ('Mauricio O.', 7.0), ('Patrick', 9.0), ('Alex2', 7.0), ('Julio', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_9_1_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'Supertramp', 'School' FROM set_9_1
  RETURNING id
)
, votes_9_1_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_9_1_9.id, v.voter_name, v.score
  FROM song_9_1_9,
  (VALUES ('Mario', 9.0), ('Jorge A.', 9.0), ('Carlos', 9.5), ('Freddy', 8.5), ('Giusse', 10.0), ('Mauricio O.', 9.0), ('Patrick', 9.0), ('Alex2', 9.5), ('Julio', 10.0)) AS v(voter_name, score)
  RETURNING id
)
, song_9_1_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'The Who', 'Baba O''Riley' FROM set_9_1
  RETURNING id
)
, votes_9_1_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_9_1_10.id, v.voter_name, v.score
  FROM song_9_1_10,
  (VALUES ('Mario', 8.5), ('Jorge A.', 7.5), ('Carlos', 8.5), ('Freddy', 8.5), ('Giusse', 8.0), ('Mauricio O.', 8.5), ('Patrick', 9.0), ('Alex2', 8.5), ('Julio', 9.5)) AS v(voter_name, score)
  RETURNING id
)
, song_9_1_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'The Naked And Famous', 'Young Blood' FROM set_9_1
  RETURNING id
)
, votes_9_1_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_9_1_11.id, v.voter_name, v.score
  FROM song_9_1_11,
  (VALUES ('Mario', 8.0), ('Jorge A.', 7.5), ('Carlos', 7.5), ('Freddy', 8.0), ('Giusse', 8.5), ('Mauricio O.', 8.0), ('Patrick', 8.0), ('Alex2', 9.0), ('Julio', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_9_1_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'Calvin Harris, Alesso, Hurts', 'Under Control (feat. Hurts)' FROM set_9_1
  RETURNING id
)
, votes_9_1_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_9_1_12.id, v.voter_name, v.score
  FROM song_9_1_12,
  (VALUES ('Mario', 7.0), ('Daniel', 7.5), ('Jorge A.', 8.5), ('Carlos', 7.0), ('Freddy', 7.5), ('Giusse', 7.5), ('Mauricio O.', 8.5), ('Patrick', 7.0), ('Alex2', 8.0), ('Julio', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_9_1_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'Gerry Rafferty', 'Right Down the Line' FROM set_9_1
  RETURNING id
)
, votes_9_1_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_9_1_13.id, v.voter_name, v.score
  FROM song_9_1_13,
  (VALUES ('Mario', 9.0), ('Daniel', 8.0), ('Jorge A.', 6.5), ('Carlos', 7.0), ('Freddy', 8.0), ('Giusse', 8.0), ('Mauricio O.', 7.0), ('Patrick', 8.0), ('Alex2', 9.0), ('Julio', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_9_1_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'DJ Maretimo', 'Cafe Internacional - Jumairah Skyscrapers' FROM set_9_1
  RETURNING id
)
, votes_9_1_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_9_1_14.id, v.voter_name, v.score
  FROM song_9_1_14,
  (VALUES ('Mario', 8.0), ('Daniel', 6.5), ('Jorge A.', 6.5), ('Carlos', 6.5), ('Freddy', 6.0), ('Giusse', 7.5), ('Mauricio O.', 6.0), ('Patrick', 6.0), ('Alex2', 7.0), ('Julio', 5.0)) AS v(voter_name, score)
  RETURNING id
)
, song_9_1_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'Poolside Mix Einstone', 'Without You' FROM set_9_1
  RETURNING id
)
, votes_9_1_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_9_1_15.id, v.voter_name, v.score
  FROM song_9_1_15,
  (VALUES ('Mario', 7.0), ('Daniel', 7.0), ('Jorge A.', 7.0), ('Carlos', 7.0), ('Freddy', 7.0), ('Giusse', 7.0), ('Mauricio O.', 8.0), ('Patrick', 6.0), ('Alex2', 7.5), ('Julio', 5.5)) AS v(voter_name, score)
  RETURNING id
)
, song_9_1_16 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 16, 'Virus', 'Tomo Lo Que Encuentro' FROM set_9_1
  RETURNING id
)
, votes_9_1_16 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_9_1_16.id, v.voter_name, v.score
  FROM song_9_1_16,
  (VALUES ('Mario', 7.5), ('Daniel', 7.5), ('Jorge A.', 9.0), ('Carlos', 7.5), ('Freddy', 7.5), ('Giusse', 8.5), ('Mauricio O.', 9.5), ('Patrick', 7.5), ('Alex2', 8.0), ('Julio', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_9_1_17 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 17, 'Carole King', 'It''s Too Late' FROM set_9_1
  RETURNING id
)
, votes_9_1_17 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_9_1_17.id, v.voter_name, v.score
  FROM song_9_1_17,
  (VALUES ('Mario', 8.0), ('Daniel', 8.0), ('Jorge A.', 7.5), ('Carlos', 8.0), ('Freddy', 9.0), ('Giusse', 8.5), ('Mauricio O.', 8.0), ('Patrick', 9.0), ('Alex2', 8.0), ('Julio', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_9_1_18 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 18, 'Santana', 'Song of the Wind' FROM set_9_1
  RETURNING id
)
, votes_9_1_18 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_9_1_18.id, v.voter_name, v.score
  FROM song_9_1_18,
  (VALUES ('Mario', 8.0), ('Daniel', 8.5), ('Jorge A.', 8.0), ('Carlos', 8.0), ('Freddy', 7.5), ('Giusse', 9.0), ('Mauricio O.', 8.0), ('Patrick', 9.0), ('Alex2', 8.0), ('Julio', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_9_1_19 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 19, 'Faithless', 'God is a DJ' FROM set_9_1
  RETURNING id
)
, votes_9_1_19 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_9_1_19.id, v.voter_name, v.score
  FROM song_9_1_19,
  (VALUES ('Mario', 6.0), ('Daniel', 5.0), ('Jorge A.', 7.5), ('Carlos', 7.5), ('Freddy', 7.5), ('Giusse', 7.0), ('Mauricio O.', 7.0), ('Patrick', 6.0), ('Alex2', 7.0), ('Julio', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, set_9_2 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 2, 'Set Mauricio' FROM s9
  RETURNING id
)
, song_9_2_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'Opus', 'Live is life' FROM set_9_2
  RETURNING id
)
, votes_9_2_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_9_2_0.id, v.voter_name, v.score
  FROM song_9_2_0,
  (VALUES ('Francisco', 8.5), ('Daniel', 6.5), ('Jorge A.', 6.5), ('Carlos', 7.5), ('Freddy', 8.5), ('Lucho', 9.0), ('Alex', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_9_2_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'Wax', 'Right between the eyes' FROM set_9_2
  RETURNING id
)
, votes_9_2_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_9_2_1.id, v.voter_name, v.score
  FROM song_9_2_1,
  (VALUES ('Francisco', 8.0), ('Daniel', 7.0), ('Jorge A.', 8.5), ('Carlos', 8.0), ('Freddy', 8.5), ('Lucho', 8.0), ('Alex', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_9_2_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'ELO', 'Evil woman' FROM set_9_2
  RETURNING id
)
, votes_9_2_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_9_2_2.id, v.voter_name, v.score
  FROM song_9_2_2,
  (VALUES ('Francisco', 8.5), ('Daniel', 7.5), ('Jorge A.', 8.5), ('Carlos', 9.0), ('Freddy', 8.5), ('Lucho', 9.0), ('Alex', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_9_2_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'F.R. David', 'Words' FROM set_9_2
  RETURNING id
)
, votes_9_2_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_9_2_3.id, v.voter_name, v.score
  FROM song_9_2_3,
  (VALUES ('Francisco', 9.0), ('Daniel', 8.0), ('Jorge A.', 7.0), ('Carlos', 7.5), ('Freddy', 8.5), ('Lucho', 8.0), ('Alex', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_9_2_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'The Housemartins', 'Bow down' FROM set_9_2
  RETURNING id
)
, votes_9_2_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_9_2_4.id, v.voter_name, v.score
  FROM song_9_2_4,
  (VALUES ('Francisco', 8.5), ('Daniel', 7.5), ('Jorge A.', 7.5), ('Carlos', 7.0), ('Freddy', 7.0), ('Lucho', 8.5), ('Gino', 7.5), ('Alex', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_9_2_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'Queens of the Stone Age', 'No one knows' FROM set_9_2
  RETURNING id
)
, votes_9_2_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_9_2_5.id, v.voter_name, v.score
  FROM song_9_2_5,
  (VALUES ('Francisco', 8.5), ('Daniel', 7.5), ('Jorge A.', 7.5), ('Carlos', 7.5), ('Freddy', 7.0), ('Lucho', 7.5), ('Gino', 8.5), ('Alex', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_9_2_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'A Perfect Circle', '3 Libras' FROM set_9_2
  RETURNING id
)
, votes_9_2_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_9_2_6.id, v.voter_name, v.score
  FROM song_9_2_6,
  (VALUES ('Francisco', 7.0), ('Daniel', 6.5), ('Jorge A.', 7.5), ('Carlos', 6.0), ('Freddy', 6.5), ('Lucho', 8.0), ('Gino', 6.0), ('Alex', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_9_2_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'The Cure', 'Primary' FROM set_9_2
  RETURNING id
)
, votes_9_2_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_9_2_7.id, v.voter_name, v.score
  FROM song_9_2_7,
  (VALUES ('Francisco', 8.0), ('Daniel', 7.0), ('Jorge A.', 7.5), ('Carlos', 9.0), ('Freddy', 8.0), ('Lucho', 8.0), ('Gino', 9.0), ('Alex', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_9_2_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'Pearl Jam', 'Sirens' FROM set_9_2
  RETURNING id
)
, votes_9_2_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_9_2_8.id, v.voter_name, v.score
  FROM song_9_2_8,
  (VALUES ('Francisco', 8.0), ('Daniel', 7.5), ('Jorge A.', 8.0), ('Carlos', 7.5), ('Freddy', 7.0), ('Lucho', 6.5), ('Gino', 5.0), ('Alex', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_9_2_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'The Kinks', 'Living on a thin line' FROM set_9_2
  RETURNING id
)
, votes_9_2_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_9_2_9.id, v.voter_name, v.score
  FROM song_9_2_9,
  (VALUES ('Francisco', 8.5), ('Daniel', 8.0), ('Jorge A.', 8.0), ('Carlos', 8.5), ('Freddy', 7.0), ('Lucho', 8.0), ('Gino', 8.0), ('Alex', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_9_2_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'The Drums', 'Forever and Ever Amen' FROM set_9_2
  RETURNING id
)
, votes_9_2_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_9_2_10.id, v.voter_name, v.score
  FROM song_9_2_10,
  (VALUES ('Francisco', 7.5), ('Daniel', 7.0), ('Jorge A.', 7.5), ('Carlos', 7.5), ('Freddy', 8.0), ('Lucho', 7.5), ('Gino', 7.0), ('Alex', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_9_2_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'The Clash', 'Janie Jones' FROM set_9_2
  RETURNING id
)
, votes_9_2_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_9_2_11.id, v.voter_name, v.score
  FROM song_9_2_11,
  (VALUES ('Francisco', 9.0), ('Daniel', 8.0), ('Jorge A.', 7.0), ('Carlos', 8.5), ('Freddy', 8.0), ('Lucho', 7.0), ('Gino', 8.0), ('Alex', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_9_2_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'Salvatore Cardillo, Luciano Pavarotti', 'Cor´ngrato (Arr. Chiaramello)' FROM set_9_2
  RETURNING id
)
, votes_9_2_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_9_2_12.id, v.voter_name, v.score
  FROM song_9_2_12,
  (VALUES ('Francisco', 8.5), ('Daniel', 6.5), ('Jorge A.', 8.5), ('Carlos', 8.5), ('Freddy', 7.0), ('Lucho', 8.5), ('Gino', 7.0), ('Alex', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_9_2_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'The Doobie Brothers', 'What a Fool Believes' FROM set_9_2
  RETURNING id
)
, votes_9_2_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_9_2_13.id, v.voter_name, v.score
  FROM song_9_2_13,
  (VALUES ('Francisco', 8.5), ('Daniel', 7.5), ('Jorge A.', 9.0), ('Carlos', 8.0), ('Freddy', 9.0), ('Lucho', 10.0), ('Gino', 7.5), ('Alex', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_9_2_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'Interpol', 'C´mere' FROM set_9_2
  RETURNING id
)
, votes_9_2_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_9_2_14.id, v.voter_name, v.score
  FROM song_9_2_14,
  (VALUES ('Francisco', 8.0), ('Daniel', 7.0), ('Jorge A.', 7.0), ('Carlos', 7.5), ('Freddy', 6.5), ('Lucho', 8.0), ('Gino', 6.0), ('Alex', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_9_2_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'Charly García, Pedro Aznar', 'Tu amor' FROM set_9_2
  RETURNING id
)
, votes_9_2_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_9_2_15.id, v.voter_name, v.score
  FROM song_9_2_15,
  (VALUES ('Francisco', 8.5), ('Daniel', 7.0), ('Jorge A.', 7.5), ('Carlos', 8.0), ('Freddy', 7.0), ('Lucho', 8.5), ('Gino', 6.0), ('Alex', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_9_2_16 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 16, 'Emergency Blanket', 'Survivors' FROM set_9_2
  RETURNING id
)
, votes_9_2_16 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_9_2_16.id, v.voter_name, v.score
  FROM song_9_2_16,
  (VALUES ('Francisco', 8.5), ('Daniel', 6.5), ('Jorge A.', 8.0), ('Carlos', 7.0), ('Freddy', 7.0), ('Lucho', 8.5), ('Gino', 7.0), ('Alex', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_9_2_17 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 17, 'Los Gatos', 'La balsa' FROM set_9_2
  RETURNING id
)
, votes_9_2_17 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_9_2_17.id, v.voter_name, v.score
  FROM song_9_2_17,
  (VALUES ('Francisco', 7.0), ('Daniel', 6.0), ('Jorge A.', 6.5), ('Carlos', 6.0), ('Freddy', 7.0), ('Lucho', 6.5), ('Gino', 6.0), ('Alex', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_9_2_18 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 18, 'La Ley', 'Día cero' FROM set_9_2
  RETURNING id
)
, votes_9_2_18 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_9_2_18.id, v.voter_name, v.score
  FROM song_9_2_18,
  (VALUES ('Francisco', 8.0), ('Daniel', 7.0), ('Jorge A.', 8.5), ('Carlos', 7.5), ('Freddy', 7.0), ('Lucho', 9.0), ('Gino', 7.5), ('Alex', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_9_2_19 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 19, 'GIT', 'Tarado de cumpleaños' FROM set_9_2
  RETURNING id
)
, votes_9_2_19 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_9_2_19.id, v.voter_name, v.score
  FROM song_9_2_19,
  (VALUES ('Francisco', 8.5), ('Daniel', 8.0), ('Jorge A.', 8.5), ('Carlos', 8.0), ('Freddy', 9.0), ('Lucho', 8.5), ('Gino', 8.5), ('Alex', 8.0)) AS v(voter_name, score)
  RETURNING id
)
SELECT id FROM s9;

WITH s10 AS (
  INSERT INTO cyc_sessions (session_num, host, date, attendees, input_mode, sets_count, songs_count, complete)
  VALUES (10, 'Temporada 10', '2025-02-01', ARRAY["Alex", "Carlos", "Daniel", "Francisco", "Freddy", "Gino", "Giusse", "Jorge A.", "Julio", "Lucho", "Mario", "Mauricio O.", "Mauricio R.", "Patrick"]::text[], 'host', 7, 20, true)
  RETURNING id
)
, set_10_0 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 0, 'Set Carlos' FROM s10
  RETURNING id
)
, song_10_0_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'Siouxsie and the banshees', 'The passenger' FROM set_10_0
  RETURNING id
)
, votes_10_0_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_0_0.id, v.voter_name, v.score
  FROM song_10_0_0,
  (VALUES ('Francisco', 8.5), ('Mario', 8.5), ('Daniel', 8.0), ('Freddy', 8.0), ('Lucho', 8.0), ('Gino', 9.0), ('Patrick', 7.5), ('Alex', 7.5), ('Julio', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_0_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'Vanessa Paradis', 'Joe le Taxi' FROM set_10_0
  RETURNING id
)
, votes_10_0_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_0_1.id, v.voter_name, v.score
  FROM song_10_0_1,
  (VALUES ('Francisco', 8.0), ('Mario', 8.5), ('Daniel', 7.0), ('Freddy', 7.5), ('Lucho', 9.0), ('Gino', 7.0), ('Patrick', 8.0), ('Alex', 8.5), ('Julio', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_0_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'Spacelog', 'In the meantime' FROM set_10_0
  RETURNING id
)
, votes_10_0_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_0_2.id, v.voter_name, v.score
  FROM song_10_0_2,
  (VALUES ('Francisco', 8.5), ('Mario', 7.5), ('Daniel', 8.0), ('Freddy', 8.0), ('Lucho', 7.0), ('Gino', 8.0), ('Patrick', 9.0), ('Alex', 8.5), ('Julio', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_0_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Javier Ojeda - Second', 'Sin Aliento' FROM set_10_0
  RETURNING id
)
, votes_10_0_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_0_3.id, v.voter_name, v.score
  FROM song_10_0_3,
  (VALUES ('Francisco', 8.5), ('Mario', 9.0), ('Daniel', 6.0), ('Freddy', 8.0), ('Lucho', 7.4), ('Gino', 8.5), ('Patrick', 8.5), ('Alex', 9.5), ('Julio', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_10_0_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'Leonard Cohen', 'lover, lover, lover (live)' FROM set_10_0
  RETURNING id
)
, votes_10_0_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_0_4.id, v.voter_name, v.score
  FROM song_10_0_4,
  (VALUES ('Francisco', 9.0), ('Mario', 9.5), ('Daniel', 8.0), ('Freddy', 7.5), ('Lucho', 9.0), ('Gino', 8.5), ('Patrick', 9.0), ('Alex', 8.0), ('Julio', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_10_0_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'Erasure', 'Victim of Love' FROM set_10_0
  RETURNING id
)
, votes_10_0_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_0_5.id, v.voter_name, v.score
  FROM song_10_0_5,
  (VALUES ('Francisco', 9.5), ('Mario', 7.0), ('Daniel', 8.5), ('Freddy', 8.0), ('Lucho', 7.0), ('Gino', 6.5), ('Patrick', 8.0), ('Alex', 7.5), ('Julio', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_10_0_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'Tina Turner', 'The Best' FROM set_10_0
  RETURNING id
)
, votes_10_0_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_0_6.id, v.voter_name, v.score
  FROM song_10_0_6,
  (VALUES ('Francisco', 9.0), ('Mario', 8.5), ('Daniel', 8.5), ('Freddy', 8.5), ('Lucho', 8.5), ('Gino', 6.0), ('Patrick', 8.0), ('Alex', 9.0), ('Julio', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_0_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'Marc Almond', 'Say Hello, Wave Goodbye' FROM set_10_0
  RETURNING id
)
, votes_10_0_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_0_7.id, v.voter_name, v.score
  FROM song_10_0_7,
  (VALUES ('Francisco', 8.5), ('Mario', 7.5), ('Daniel', 8.0), ('Freddy', 8.0), ('Lucho', 7.5), ('Gino', 9.5), ('Patrick', 9.0), ('Alex', 8.5), ('Julio', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_10_0_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'Tainted Blue', 'Ttrruuces' FROM set_10_0
  RETURNING id
)
, votes_10_0_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_0_8.id, v.voter_name, v.score
  FROM song_10_0_8,
  (VALUES ('Francisco', 8.5), ('Mario', 8.0), ('Daniel', 7.0), ('Freddy', 7.5), ('Lucho', 9.0), ('Gino', 8.0), ('Patrick', 7.0), ('Alex', 8.0), ('Julio', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_0_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'Joe Cocker', 'Summer in the  City' FROM set_10_0
  RETURNING id
)
, votes_10_0_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_0_9.id, v.voter_name, v.score
  FROM song_10_0_9,
  (VALUES ('Francisco', 8.0), ('Mario', 8.0), ('Daniel', 7.5), ('Freddy', 8.0), ('Lucho', 8.5), ('Gino', 7.0), ('Patrick', 8.5), ('Alex', 7.5), ('Julio', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_0_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'The Cars', 'Drive (version sinfonica)' FROM set_10_0
  RETURNING id
)
, votes_10_0_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_0_10.id, v.voter_name, v.score
  FROM song_10_0_10,
  (VALUES ('Francisco', 10.0), ('Mario', 9.5), ('Daniel', 8.0), ('Freddy', 10.0), ('Lucho', 8.5), ('Gino', 8.5), ('Patrick', 10.0), ('Alex', 10.0), ('Julio', 9.5)) AS v(voter_name, score)
  RETURNING id
)
, song_10_0_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'BUNT', 'Clouds' FROM set_10_0
  RETURNING id
)
, votes_10_0_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_0_11.id, v.voter_name, v.score
  FROM song_10_0_11,
  (VALUES ('Francisco', 8.5), ('Mario', 8.5), ('Daniel', 6.0), ('Freddy', 8.0), ('Lucho', 9.0), ('Gino', 8.0), ('Patrick', 6.0), ('Alex', 7.5), ('Julio', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_10_0_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'Alan Parsons', 'Sooner or Later' FROM set_10_0
  RETURNING id
)
, votes_10_0_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_0_12.id, v.voter_name, v.score
  FROM song_10_0_12,
  (VALUES ('Francisco', 8.0), ('Daniel', 8.0), ('Freddy', 9.0), ('Lucho', 7.5), ('Gino', 5.0), ('Patrick', 8.0), ('Alex', 8.0), ('Julio', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_10_0_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'Venturi', 'Estamos Vivos' FROM set_10_0
  RETURNING id
)
, votes_10_0_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_0_13.id, v.voter_name, v.score
  FROM song_10_0_13,
  (VALUES ('Francisco', 8.5), ('Daniel', 7.0), ('Freddy', 7.0), ('Lucho', 8.0), ('Gino', 7.5), ('Patrick', 7.5), ('Alex', 7.0), ('Julio', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_10_0_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'The Carpenters', 'Yesterday Once More' FROM set_10_0
  RETURNING id
)
, votes_10_0_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_0_14.id, v.voter_name, v.score
  FROM song_10_0_14,
  (VALUES ('Francisco', 9.0), ('Daniel', 7.5), ('Freddy', 10.0), ('Lucho', 8.5), ('Gino', 7.5), ('Patrick', 9.0), ('Alex', 9.0), ('Julio', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_10_0_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'Portugal The Man', 'Dummy' FROM set_10_0
  RETURNING id
)
, votes_10_0_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_0_15.id, v.voter_name, v.score
  FROM song_10_0_15,
  (VALUES ('Francisco', 8.5), ('Daniel', 6.0), ('Freddy', 7.0), ('Lucho', 9.0), ('Gino', 7.0), ('Patrick', 7.0), ('Alex', 7.5), ('Julio', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_0_16 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 16, 'Earth, Wind & Fire', 'Let`s Groove' FROM set_10_0
  RETURNING id
)
, votes_10_0_16 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_0_16.id, v.voter_name, v.score
  FROM song_10_0_16,
  (VALUES ('Francisco', 9.0), ('Daniel', 8.0), ('Freddy', 10.0), ('Lucho', 8.5), ('Gino', 7.0), ('Patrick', 8.0), ('Alex', 7.0), ('Julio', 3.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_0_17 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 17, 'The George Baker Selection', 'Litlle Green Bag' FROM set_10_0
  RETURNING id
)
, votes_10_0_17 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_0_17.id, v.voter_name, v.score
  FROM song_10_0_17,
  (VALUES ('Francisco', 9.0), ('Daniel', 7.5), ('Freddy', 7.0), ('Lucho', 8.5), ('Gino', 9.0), ('Patrick', 8.0), ('Alex', 7.5), ('Julio', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_0_18 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 18, 'Eurythmics', 'Here comes the rain again' FROM set_10_0
  RETURNING id
)
, votes_10_0_18 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_0_18.id, v.voter_name, v.score
  FROM song_10_0_18,
  (VALUES ('Francisco', 9.0), ('Daniel', 7.5), ('Freddy', 9.0), ('Lucho', 9.0), ('Gino', 9.5), ('Patrick', 8.0), ('Alex', 8.0), ('Julio', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_0_19 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 19, 'Gonzalo', 'Quien piensa en ti' FROM set_10_0
  RETURNING id
)
, votes_10_0_19 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_0_19.id, v.voter_name, v.score
  FROM song_10_0_19,
  (VALUES ('Francisco', 9.0), ('Daniel', 9.5), ('Freddy', 9.0), ('Lucho', 8.5), ('Gino', 9.0), ('Patrick', 9.0), ('Alex', 9.0), ('Julio', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, set_10_1 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 1, 'Set Francisco' FROM s10
  RETURNING id
)
, song_10_1_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'One day', 'Matisyahu' FROM set_10_1
  RETURNING id
)
, votes_10_1_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_1_0.id, v.voter_name, v.score
  FROM song_10_1_0,
  (VALUES ('Mario', 7.0), ('Daniel', 7.0), ('Carlos', 7.0), ('Freddy', 8.0), ('Giusse', 7.0), ('Mauricio O.', 7.5), ('Lucho', 8.5), ('Gino', 7.5), ('Patrick', 8.0), ('Julio', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_1_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'El Yerberito Moderno', 'Juan Diego Flores' FROM set_10_1
  RETURNING id
)
, votes_10_1_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_1_1.id, v.voter_name, v.score
  FROM song_10_1_1,
  (VALUES ('Mario', 8.5), ('Daniel', 7.0), ('Carlos', 7.5), ('Freddy', 8.0), ('Giusse', 8.0), ('Mauricio O.', 8.0), ('Lucho', 7.5), ('Gino', 6.0), ('Patrick', 8.0), ('Julio', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_10_1_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'Je veux', 'Zaz' FROM set_10_1
  RETURNING id
)
, votes_10_1_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_1_2.id, v.voter_name, v.score
  FROM song_10_1_2,
  (VALUES ('Mario', 7.0), ('Daniel', 6.5), ('Carlos', 7.5), ('Freddy', 7.0), ('Giusse', 7.0), ('Mauricio O.', 6.5), ('Lucho', 7.0), ('Gino', 7.5), ('Patrick', 6.0), ('Julio', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_1_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Puente', 'Gustavo Cerati' FROM set_10_1
  RETURNING id
)
, votes_10_1_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_1_3.id, v.voter_name, v.score
  FROM song_10_1_3,
  (VALUES ('Mario', 8.5), ('Daniel', 8.0), ('Carlos', 6.0), ('Freddy', 7.0), ('Giusse', 9.0), ('Mauricio O.', 9.0), ('Lucho', 7.0), ('Gino', 6.0), ('Patrick', 7.0), ('Julio', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_1_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'Sunshine', 'David Guetta, Avicii' FROM set_10_1
  RETURNING id
)
, votes_10_1_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_1_4.id, v.voter_name, v.score
  FROM song_10_1_4,
  (VALUES ('Mario', 6.5), ('Daniel', 6.5), ('Carlos', 7.0), ('Freddy', 10.0), ('Giusse', 6.0), ('Mauricio O.', 7.0), ('Lucho', 9.0), ('Gino', 6.0), ('Patrick', 6.5), ('Julio', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_1_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'Cold Heart', 'Elton John, Dua Lipa' FROM set_10_1
  RETURNING id
)
, votes_10_1_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_1_5.id, v.voter_name, v.score
  FROM song_10_1_5,
  (VALUES ('Mario', 7.0), ('Daniel', 7.0), ('Carlos', 7.5), ('Freddy', 7.0), ('Giusse', 7.0), ('Mauricio O.', 8.5), ('Lucho', 8.0), ('Gino', 8.5), ('Patrick', 8.0), ('Julio', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_10_1_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'Try', 'Pink' FROM set_10_1
  RETURNING id
)
, votes_10_1_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_1_6.id, v.voter_name, v.score
  FROM song_10_1_6,
  (VALUES ('Mario', 7.5), ('Daniel', 8.5), ('Carlos', 8.0), ('Freddy', 8.0), ('Giusse', 7.0), ('Mauricio O.', 6.5), ('Lucho', 7.0), ('Gino', 6.0), ('Patrick', 8.0), ('Julio', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_10_1_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'I Want you back', 'Jackson 5' FROM set_10_1
  RETURNING id
)
, votes_10_1_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_1_7.id, v.voter_name, v.score
  FROM song_10_1_7,
  (VALUES ('Mario', 8.5), ('Daniel', 7.5), ('Carlos', 8.0), ('Freddy', 8.0), ('Giusse', 7.5), ('Mauricio O.', 8.5), ('Lucho', 7.5), ('Gino', 6.5), ('Patrick', 7.0), ('Julio', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_10_1_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'Behind blue eyes', 'Limp Bizkit' FROM set_10_1
  RETURNING id
)
, votes_10_1_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_1_8.id, v.voter_name, v.score
  FROM song_10_1_8,
  (VALUES ('Mario', 8.5), ('Daniel', 8.0), ('Carlos', 8.0), ('Freddy', 8.0), ('Giusse', 7.5), ('Mauricio O.', 8.5), ('Lucho', 8.0), ('Gino', 8.0), ('Patrick', 8.0), ('Julio', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_1_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'Poison', 'Alice Cooper' FROM set_10_1
  RETURNING id
)
, votes_10_1_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_1_9.id, v.voter_name, v.score
  FROM song_10_1_9,
  (VALUES ('Mario', 7.5), ('Daniel', 7.0), ('Carlos', 7.0), ('Freddy', 6.0), ('Giusse', 7.0), ('Mauricio O.', 6.0), ('Lucho', 7.0), ('Gino', 6.5), ('Patrick', 7.0), ('Julio', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_1_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'Pull me under', 'Dream Theater' FROM set_10_1
  RETURNING id
)
, votes_10_1_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_1_10.id, v.voter_name, v.score
  FROM song_10_1_10,
  (VALUES ('Mario', 6.0), ('Daniel', 7.5), ('Carlos', 5.5), ('Freddy', 7.0), ('Giusse', 7.0), ('Mauricio O.', 8.0), ('Lucho', 6.5), ('Gino', 6.0), ('Patrick', 8.0), ('Julio', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_10_1_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'Demolición', 'Los Saicos' FROM set_10_1
  RETURNING id
)
, votes_10_1_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_1_11.id, v.voter_name, v.score
  FROM song_10_1_11,
  (VALUES ('Mario', 6.0), ('Daniel', 8.0), ('Carlos', 8.0), ('Freddy', 6.0), ('Giusse', 7.5), ('Mauricio O.', 8.0), ('Lucho', 7.0), ('Gino', 6.0), ('Patrick', 9.0), ('Julio', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_1_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'Always Something there to remind me', 'Naked Eyes' FROM set_10_1
  RETURNING id
)
, votes_10_1_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_1_12.id, v.voter_name, v.score
  FROM song_10_1_12,
  (VALUES ('Mario', 7.5), ('Daniel', 8.0), ('Jorge A.', 8.0), ('Carlos', 8.5), ('Freddy', 8.0), ('Giusse', 8.5), ('Mauricio O.', 7.5), ('Lucho', 8.0), ('Gino', 9.0), ('Patrick', 8.0), ('Julio', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_10_1_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'It''s a man''s world - live', 'James Brown' FROM set_10_1
  RETURNING id
)
, votes_10_1_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_1_13.id, v.voter_name, v.score
  FROM song_10_1_13,
  (VALUES ('Mario', 10.0), ('Daniel', 8.0), ('Jorge A.', 7.0), ('Carlos', 5.5), ('Freddy', 8.0), ('Giusse', 8.5), ('Mauricio O.', 7.0), ('Lucho', 7.0), ('Gino', 7.5), ('Patrick', 9.0), ('Julio', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_1_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'Goodbye pork pie hat', 'Charles Mingus' FROM set_10_1
  RETURNING id
)
, votes_10_1_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_1_14.id, v.voter_name, v.score
  FROM song_10_1_14,
  (VALUES ('Mario', 8.5), ('Daniel', 6.5), ('Jorge A.', 8.5), ('Carlos', 5.0), ('Freddy', 9.0), ('Giusse', 8.0), ('Mauricio O.', 6.5), ('Lucho', 7.5), ('Gino', 8.0), ('Patrick', 8.0), ('Julio', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_1_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'I say a little prayer', 'Aretha Franklin' FROM set_10_1
  RETURNING id
)
, votes_10_1_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_1_15.id, v.voter_name, v.score
  FROM song_10_1_15,
  (VALUES ('Mario', 8.5), ('Daniel', 8.0), ('Jorge A.', 7.5), ('Carlos', 8.0), ('Freddy', 8.0), ('Giusse', 8.5), ('Mauricio O.', 9.0), ('Lucho', 8.0), ('Gino', 7.0), ('Patrick', 8.5), ('Julio', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_10_1_16 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 16, 'Unchained Melody', 'Tom Jones' FROM set_10_1
  RETURNING id
)
, votes_10_1_16 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_1_16.id, v.voter_name, v.score
  FROM song_10_1_16,
  (VALUES ('Mario', 8.5), ('Daniel', 6.5), ('Jorge A.', 7.0), ('Carlos', 8.0), ('Freddy', 8.0), ('Giusse', 7.5), ('Mauricio O.', 6.5), ('Lucho', 8.0), ('Gino', 9.0), ('Patrick', 8.0), ('Julio', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_10_1_17 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 17, 'Have you ever see the rain', 'Rod Stewart' FROM set_10_1
  RETURNING id
)
, votes_10_1_17 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_1_17.id, v.voter_name, v.score
  FROM song_10_1_17,
  (VALUES ('Mario', 8.0), ('Daniel', 9.0), ('Jorge A.', 8.0), ('Carlos', 8.5), ('Freddy', 9.0), ('Giusse', 7.0), ('Mauricio O.', 8.5), ('Lucho', 7.5), ('Gino', 9.0), ('Patrick', 8.5), ('Julio', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_10_1_18 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 18, 'Welcome to paradise', 'Green Day' FROM set_10_1
  RETURNING id
)
, votes_10_1_18 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_1_18.id, v.voter_name, v.score
  FROM song_10_1_18,
  (VALUES ('Mario', 7.0), ('Daniel', 8.5), ('Jorge A.', 8.0), ('Carlos', 7.5), ('Freddy', 8.0), ('Giusse', 7.0), ('Mauricio O.', 8.5), ('Lucho', 8.0), ('Gino', 6.5), ('Patrick', 7.0), ('Julio', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_1_19 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 19, 'Come and get your love', 'Redbone' FROM set_10_1
  RETURNING id
)
, votes_10_1_19 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_1_19.id, v.voter_name, v.score
  FROM song_10_1_19,
  (VALUES ('Mario', 8.0), ('Daniel', 7.0), ('Jorge A.', 9.0), ('Carlos', 8.0), ('Freddy', 9.0), ('Giusse', 8.0), ('Mauricio O.', 9.5), ('Lucho', 9.0), ('Gino', 7.5), ('Patrick', 9.0), ('Julio', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, set_10_2 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 2, 'Set Freddy' FROM s10
  RETURNING id
)
, song_10_2_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'Greta Van Fleet', 'Heat above' FROM set_10_2
  RETURNING id
)
, votes_10_2_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_2_0.id, v.voter_name, v.score
  FROM song_10_2_0,
  (VALUES ('Mario', 7.0), ('Daniel', 7.0), ('Jorge A.', 6.5), ('Carlos', 7.5), ('Giusse', 8.0), ('Lucho', 8.0), ('Gino', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_10_2_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'George Harrison', 'Here comes the sun (live at madison square garden)' FROM set_10_2
  RETURNING id
)
, votes_10_2_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_2_1.id, v.voter_name, v.score
  FROM song_10_2_1,
  (VALUES ('Mario', 8.5), ('Daniel', 6.0), ('Jorge A.', 6.5), ('Carlos', 7.0), ('Giusse', 7.5), ('Lucho', 7.5), ('Gino', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_2_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'Rise Against', 'Nowhere generation' FROM set_10_2
  RETURNING id
)
, votes_10_2_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_2_2.id, v.voter_name, v.score
  FROM song_10_2_2,
  (VALUES ('Mario', 6.0), ('Daniel', 7.0), ('Jorge A.', 7.5), ('Carlos', 6.0), ('Giusse', 7.0), ('Lucho', 8.0), ('Gino', 5.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_2_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'The Lumineers', 'WHERE WE ARE' FROM set_10_2
  RETURNING id
)
, votes_10_2_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_2_3.id, v.voter_name, v.score
  FROM song_10_2_3,
  (VALUES ('Mario', 7.0), ('Daniel', 7.0), ('Jorge A.', 6.0), ('Carlos', 6.5), ('Giusse', 6.5), ('Lucho', 7.0), ('Gino', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_2_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'Spoon', 'The Hardest Cut' FROM set_10_2
  RETURNING id
)
, votes_10_2_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_2_4.id, v.voter_name, v.score
  FROM song_10_2_4,
  (VALUES ('Mario', 8.5), ('Daniel', 7.5), ('Jorge A.', 7.5), ('Carlos', 8.0), ('Giusse', 7.5), ('Lucho', 7.5), ('Gino', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_2_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'Tom Jones', 'Its Not Unusual' FROM set_10_2
  RETURNING id
)
, votes_10_2_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_2_5.id, v.voter_name, v.score
  FROM song_10_2_5,
  (VALUES ('Mario', 8.0), ('Daniel', 7.5), ('Jorge A.', 8.0), ('Carlos', 8.5), ('Giusse', 8.0), ('Lucho', 8.0), ('Gino', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_2_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'Sam Fender', 'Seventeen Going Under' FROM set_10_2
  RETURNING id
)
, votes_10_2_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_2_6.id, v.voter_name, v.score
  FROM song_10_2_6,
  (VALUES ('Mario', 8.5), ('Daniel', 8.0), ('Jorge A.', 7.0), ('Carlos', 7.5), ('Giusse', 7.5), ('Lucho', 8.0), ('Gino', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_2_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'The Rolling Stones', 'As Tears Go By (Mono)' FROM set_10_2
  RETURNING id
)
, votes_10_2_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_2_7.id, v.voter_name, v.score
  FROM song_10_2_7,
  (VALUES ('Mario', 8.5), ('Daniel', 8.0), ('Jorge A.', 7.5), ('Carlos', 9.0), ('Giusse', 8.0), ('Lucho', 8.0), ('Gino', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_10_2_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'Inhaler', 'Cheer Up Baby' FROM set_10_2
  RETURNING id
)
, votes_10_2_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_2_8.id, v.voter_name, v.score
  FROM song_10_2_8,
  (VALUES ('Mario', 7.0), ('Daniel', 7.5), ('Jorge A.', 7.5), ('Carlos', 6.5), ('Giusse', 7.5), ('Lucho', 7.0), ('Gino', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_2_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'Cerrone', 'Got To Have Loving' FROM set_10_2
  RETURNING id
)
, votes_10_2_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_2_9.id, v.voter_name, v.score
  FROM song_10_2_9,
  (VALUES ('Mario', 7.0), ('Daniel', 7.5), ('Jorge A.', 7.0), ('Carlos', 8.5), ('Giusse', 8.0), ('Lucho', 8.0), ('Gino', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_2_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'The War On Drugs', 'I Dont Live Here Anymore' FROM set_10_2
  RETURNING id
)
, votes_10_2_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_2_10.id, v.voter_name, v.score
  FROM song_10_2_10,
  (VALUES ('Mario', 6.5), ('Daniel', 7.0), ('Jorge A.', 7.0), ('Carlos', 6.0), ('Giusse', 7.0), ('Lucho', 7.0), ('Gino', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_2_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'Donna Summer', 'I Feel Love (Edit)' FROM set_10_2
  RETURNING id
)
, votes_10_2_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_2_11.id, v.voter_name, v.score
  FROM song_10_2_11,
  (VALUES ('Mario', 9.0), ('Daniel', 8.0), ('Jorge A.', 8.0), ('Carlos', 9.0), ('Giusse', 8.5), ('Lucho', 10.0), ('Gino', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_10_2_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'Windser', 'Memory' FROM set_10_2
  RETURNING id
)
, votes_10_2_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_2_12.id, v.voter_name, v.score
  FROM song_10_2_12,
  (VALUES ('Mario', 8.5), ('Daniel', 7.5), ('Jorge A.', 7.5), ('Carlos', 7.7), ('Giusse', 7.5), ('Lucho', 7.5), ('Gino', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_2_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'Ferrante and Teicher', 'La Strada' FROM set_10_2
  RETURNING id
)
, votes_10_2_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_2_13.id, v.voter_name, v.score
  FROM song_10_2_13,
  (VALUES ('Mario', 6.5), ('Daniel', 7.0), ('Jorge A.', 7.5), ('Carlos', 7.0), ('Giusse', 7.0), ('Lucho', 8.5), ('Gino', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_2_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'Bastille', 'Pompeii (Kat Crazy Remix)' FROM set_10_2
  RETURNING id
)
, votes_10_2_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_2_14.id, v.voter_name, v.score
  FROM song_10_2_14,
  (VALUES ('Mario', 7.0), ('Daniel', 6.5), ('Jorge A.', 6.0), ('Carlos', 6.0), ('Giusse', 7.0), ('Lucho', 8.0), ('Gino', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_2_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'Cher', 'Believe' FROM set_10_2
  RETURNING id
)
, votes_10_2_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_2_15.id, v.voter_name, v.score
  FROM song_10_2_15,
  (VALUES ('Mario', 8.5), ('Daniel', 7.5), ('Jorge A.', 8.0), ('Carlos', 8.0), ('Giusse', 7.5), ('Lucho', 8.0), ('Gino', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_2_16 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 16, 'Ed Sheeran', 'Bad Habits' FROM set_10_2
  RETURNING id
)
, votes_10_2_16 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_2_16.id, v.voter_name, v.score
  FROM song_10_2_16,
  (VALUES ('Mario', 7.0), ('Daniel', 6.0), ('Jorge A.', 8.0), ('Carlos', 6.5), ('Giusse', 7.5), ('Lucho', 8.0), ('Gino', 5.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_2_17 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 17, 'Red Hot Chilli Peppers', 'Black Summer' FROM set_10_2
  RETURNING id
)
, votes_10_2_17 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_2_17.id, v.voter_name, v.score
  FROM song_10_2_17,
  (VALUES ('Mario', 7.5), ('Daniel', 8.0), ('Jorge A.', 6.5), ('Carlos', 7.0), ('Giusse', 7.0), ('Lucho', 7.5), ('Gino', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_10_2_18 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 18, 'John Paul Young', 'Love Is In the Air' FROM set_10_2
  RETURNING id
)
, votes_10_2_18 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_2_18.id, v.voter_name, v.score
  FROM song_10_2_18,
  (VALUES ('Mario', 9.0), ('Daniel', 7.5), ('Jorge A.', 8.5), ('Carlos', 8.0), ('Giusse', 8.0), ('Lucho', 8.0), ('Gino', 10.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_2_19 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 19, 'Harry Styles', 'As It Was' FROM set_10_2
  RETURNING id
)
, votes_10_2_19 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_2_19.id, v.voter_name, v.score
  FROM song_10_2_19,
  (VALUES ('Mario', 9.0), ('Daniel', 6.5), ('Jorge A.', 7.0), ('Carlos', 8.0), ('Giusse', 8.0), ('Lucho', 8.5), ('Gino', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, set_10_3 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 3, 'Set Giusse' FROM s10
  RETURNING id
)
, song_10_3_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'Justin Hurwitz', 'Overture' FROM set_10_3
  RETURNING id
)
, song_10_3_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'Tom Petty', 'Running  Down a Dream' FROM set_10_3
  RETURNING id
)
, votes_10_3_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_3_1.id, v.voter_name, v.score
  FROM song_10_3_1,
  (VALUES ('Mario', 8.0), ('Lucho', 7.5), ('Gino', 7.0), ('Patrick', 7.0), ('Julio', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_3_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'The Commodores', 'Easy' FROM set_10_3
  RETURNING id
)
, votes_10_3_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_3_2.id, v.voter_name, v.score
  FROM song_10_3_2,
  (VALUES ('Mario', 7.5), ('Lucho', 8.0), ('Gino', 6.0), ('Patrick', 8.0), ('Julio', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_10_3_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Supertramp', 'My kind of Lady' FROM set_10_3
  RETURNING id
)
, votes_10_3_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_3_3.id, v.voter_name, v.score
  FROM song_10_3_3,
  (VALUES ('Mario', 9.0), ('Lucho', 8.5), ('Gino', 7.0), ('Patrick', 9.0), ('Julio', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_10_3_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'Miguel Rios', 'El rock no tiene la culpa' FROM set_10_3
  RETURNING id
)
, votes_10_3_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_3_4.id, v.voter_name, v.score
  FROM song_10_3_4,
  (VALUES ('Mario', 8.5), ('Lucho', 8.0), ('Gino', 6.5), ('Patrick', 7.0), ('Julio', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_3_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'Masaru Yokohama', 'Uso to Honto' FROM set_10_3
  RETURNING id
)
, votes_10_3_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_3_5.id, v.voter_name, v.score
  FROM song_10_3_5,
  (VALUES ('Mario', 8.5), ('Lucho', 8.5), ('Gino', 8.0), ('Patrick', 9.0), ('Julio', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_10_3_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'GIT', 'Viento Loco' FROM set_10_3
  RETURNING id
)
, votes_10_3_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_3_6.id, v.voter_name, v.score
  FROM song_10_3_6,
  (VALUES ('Mario', 8.5), ('Lucho', 9.0), ('Gino', 7.0), ('Patrick', 8.0), ('Julio', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_10_3_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'Cat Stevens (Yusuf Islam)', 'Morning has Broken' FROM set_10_3
  RETURNING id
)
, votes_10_3_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_3_7.id, v.voter_name, v.score
  FROM song_10_3_7,
  (VALUES ('Mario', 8.5), ('Lucho', 8.0), ('Gino', 6.0), ('Patrick', 8.0), ('Julio', 9.5)) AS v(voter_name, score)
  RETURNING id
)
, song_10_3_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'Ratt', 'Back for more' FROM set_10_3
  RETURNING id
)
, votes_10_3_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_3_8.id, v.voter_name, v.score
  FROM song_10_3_8,
  (VALUES ('Mario', 6.0), ('Lucho', 7.0), ('Gino', 5.0), ('Patrick', 7.0), ('Julio', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_3_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'Little River Band', 'Riminiscing' FROM set_10_3
  RETURNING id
)
, votes_10_3_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_3_9.id, v.voter_name, v.score
  FROM song_10_3_9,
  (VALUES ('Mario', 9.0), ('Lucho', 9.0), ('Gino', 8.0), ('Patrick', 8.0), ('Julio', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_10_3_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'Tears for Fears', 'Brake it down again' FROM set_10_3
  RETURNING id
)
, votes_10_3_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_3_10.id, v.voter_name, v.score
  FROM song_10_3_10,
  (VALUES ('Mario', 9.0), ('Lucho', 8.5), ('Gino', 9.0), ('Patrick', 8.0), ('Julio', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_3_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'Seru Giran', 'Salir de la melancolia' FROM set_10_3
  RETURNING id
)
, votes_10_3_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_3_11.id, v.voter_name, v.score
  FROM song_10_3_11,
  (VALUES ('Mario', 7.0), ('Lucho', 9.0), ('Gino', 6.5), ('Patrick', 7.5), ('Julio', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_3_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'The Guess Who', 'Undun' FROM set_10_3
  RETURNING id
)
, votes_10_3_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_3_12.id, v.voter_name, v.score
  FROM song_10_3_12,
  (VALUES ('Mario', 7.5), ('Lucho', 7.5), ('Gino', 8.0), ('Patrick', 7.0), ('Julio', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_3_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'Mecano', 'Quedate en Madrid' FROM set_10_3
  RETURNING id
)
, votes_10_3_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_3_13.id, v.voter_name, v.score
  FROM song_10_3_13,
  (VALUES ('Mario', 9.0), ('Lucho', 8.5), ('Gino', 8.0), ('Patrick', 8.0), ('Julio', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_10_3_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'U2', 'Magnificent' FROM set_10_3
  RETURNING id
)
, votes_10_3_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_3_14.id, v.voter_name, v.score
  FROM song_10_3_14,
  (VALUES ('Mario', 8.0), ('Lucho', 8.5), ('Gino', 7.0), ('Patrick', 7.0), ('Julio', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_3_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'Dire Straits', 'Your latest trick' FROM set_10_3
  RETURNING id
)
, votes_10_3_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_3_15.id, v.voter_name, v.score
  FROM song_10_3_15,
  (VALUES ('Mario', 8.5), ('Lucho', 8.0), ('Gino', 6.5), ('Patrick', 8.0), ('Julio', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_10_3_16 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 16, 'Toto', 'Pamela' FROM set_10_3
  RETURNING id
)
, votes_10_3_16 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_3_16.id, v.voter_name, v.score
  FROM song_10_3_16,
  (VALUES ('Mario', 8.0), ('Lucho', 8.0), ('Gino', 7.5), ('Patrick', 7.0), ('Julio', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_10_3_17 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 17, 'Miguel Bose y Bimba', 'Como un lobo' FROM set_10_3
  RETURNING id
)
, votes_10_3_17 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_3_17.id, v.voter_name, v.score
  FROM song_10_3_17,
  (VALUES ('Mario', 8.5), ('Lucho', 6.0), ('Gino', 4.0), ('Patrick', 9.0), ('Julio', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_3_18 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 18, '?', '?' FROM set_10_3
  RETURNING id
)
, song_10_3_19 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 19, '?', '?' FROM set_10_3
  RETURNING id
)
, set_10_4 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 4, 'Set Julio' FROM s10
  RETURNING id
)
, song_10_4_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'Grace Jones', 'I´ve Seen that face Before' FROM set_10_4
  RETURNING id
)
, votes_10_4_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_4_0.id, v.voter_name, v.score
  FROM song_10_4_0,
  (VALUES ('Mario', 7.5), ('Jorge A.', 7.0), ('Carlos', 7.0), ('Freddy', 8.0), ('Giusse', 8.5), ('Mauricio R.', 8.5), ('Lucho', 9.5), ('Gino', 7.5), ('Patrick', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_4_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'Kim Seviour', 'Mother Wisdom' FROM set_10_4
  RETURNING id
)
, votes_10_4_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_4_1.id, v.voter_name, v.score
  FROM song_10_4_1,
  (VALUES ('Mario', 6.5), ('Jorge A.', 6.5), ('Carlos', 8.0), ('Freddy', 8.0), ('Giusse', 7.0), ('Mauricio R.', 7.5), ('Lucho', 8.0), ('Gino', 6.0), ('Patrick', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_4_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'Kingfisher Sky', 'All that is Left' FROM set_10_4
  RETURNING id
)
, votes_10_4_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_4_2.id, v.voter_name, v.score
  FROM song_10_4_2,
  (VALUES ('Mario', 8.5), ('Jorge A.', 8.0), ('Carlos', 8.0), ('Freddy', 8.0), ('Giusse', 9.0), ('Mauricio R.', 8.0), ('Lucho', 7.0), ('Gino', 8.0), ('Patrick', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_4_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Sarah Brightman', 'Runnig' FROM set_10_4
  RETURNING id
)
, votes_10_4_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_4_3.id, v.voter_name, v.score
  FROM song_10_4_3,
  (VALUES ('Mario', 9.0), ('Jorge A.', 8.0), ('Carlos', 7.5), ('Freddy', 8.5), ('Giusse', 7.5), ('Mauricio R.', 7.0), ('Lucho', 7.5), ('Gino', 6.5), ('Patrick', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_4_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'Colective Soul', 'run' FROM set_10_4
  RETURNING id
)
, votes_10_4_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_4_4.id, v.voter_name, v.score
  FROM song_10_4_4,
  (VALUES ('Mario', 8.5), ('Jorge A.', 8.5), ('Carlos', 9.0), ('Freddy', 8.5), ('Giusse', 9.0), ('Mauricio R.', 8.0), ('Lucho', 8.0), ('Gino', 8.5), ('Patrick', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_10_4_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'Porcupine Tree', 'Slave Called Shiver' FROM set_10_4
  RETURNING id
)
, votes_10_4_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_4_5.id, v.voter_name, v.score
  FROM song_10_4_5,
  (VALUES ('Mario', 7.0), ('Jorge A.', 8.0), ('Carlos', 7.0), ('Freddy', 7.5), ('Giusse', 8.5), ('Mauricio R.', 8.0), ('Lucho', 8.5), ('Gino', 7.0), ('Patrick', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_4_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'Muse', 'Knigths of Cydonia' FROM set_10_4
  RETURNING id
)
, votes_10_4_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_4_6.id, v.voter_name, v.score
  FROM song_10_4_6,
  (VALUES ('Mario', 7.5), ('Jorge A.', 7.5), ('Carlos', 7.5), ('Freddy', 8.0), ('Giusse', 8.0), ('Mauricio R.', 7.0), ('Lucho', 9.0), ('Gino', 8.0), ('Patrick', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_4_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'RadioHead', 'burn to the wicht' FROM set_10_4
  RETURNING id
)
, votes_10_4_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_4_7.id, v.voter_name, v.score
  FROM song_10_4_7,
  (VALUES ('Mario', 9.0), ('Jorge A.', 7.5), ('Carlos', 6.5), ('Freddy', 8.5), ('Giusse', 8.5), ('Mauricio R.', 8.5), ('Lucho', 7.5), ('Gino', 7.0), ('Patrick', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_4_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'Boston', 'More than a feeling' FROM set_10_4
  RETURNING id
)
, votes_10_4_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_4_8.id, v.voter_name, v.score
  FROM song_10_4_8,
  (VALUES ('Mario', 8.5), ('Daniel', 9.0), ('Jorge A.', 9.0), ('Carlos', 9.0), ('Freddy', 10.0), ('Giusse', 8.5), ('Mauricio R.', 9.5), ('Lucho', 9.0), ('Gino', 8.0), ('Patrick', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_4_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'toto', 'Child''s Anthem' FROM set_10_4
  RETURNING id
)
, votes_10_4_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_4_9.id, v.voter_name, v.score
  FROM song_10_4_9,
  (VALUES ('Mario', 9.0), ('Daniel', 8.5), ('Jorge A.', 6.5), ('Carlos', 8.0), ('Freddy', 8.0), ('Giusse', 8.5), ('Mauricio R.', 8.0), ('Lucho', 9.0), ('Gino', 8.0), ('Patrick', 10.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_4_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'The Alan Parsons Project', 'The Voice' FROM set_10_4
  RETURNING id
)
, votes_10_4_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_4_10.id, v.voter_name, v.score
  FROM song_10_4_10,
  (VALUES ('Mario', 6.5), ('Daniel', 7.0), ('Jorge A.', 8.0), ('Carlos', 6.5), ('Freddy', 7.0), ('Giusse', 8.0), ('Mauricio R.', 7.0), ('Lucho', 6.5), ('Gino', 6.5), ('Patrick', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_4_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'Supertramp', 'Child of Vision' FROM set_10_4
  RETURNING id
)
, votes_10_4_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_4_11.id, v.voter_name, v.score
  FROM song_10_4_11,
  (VALUES ('Mario', 9.0), ('Daniel', 8.0), ('Jorge A.', 8.0), ('Carlos', 7.5), ('Freddy', 9.0), ('Giusse', 9.5), ('Mauricio R.', 8.0), ('Lucho', 9.0), ('Gino', 7.0), ('Patrick', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_4_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'New Trolls', 'Barocco''n''Roll (Allegro Brioso)' FROM set_10_4
  RETURNING id
)
, votes_10_4_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_4_12.id, v.voter_name, v.score
  FROM song_10_4_12,
  (VALUES ('Mario', 6.5), ('Daniel', 6.5), ('Jorge A.', 7.0), ('Carlos', 6.5), ('Freddy', 7.0), ('Giusse', 7.0), ('Mauricio R.', 7.5), ('Lucho', 6.0), ('Gino', 8.0), ('Patrick', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_4_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'Negramaro', 'Verano (estate)' FROM set_10_4
  RETURNING id
)
, votes_10_4_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_4_13.id, v.voter_name, v.score
  FROM song_10_4_13,
  (VALUES ('Mario', 6.5), ('Daniel', 7.0), ('Jorge A.', 6.5), ('Carlos', 6.0), ('Freddy', 7.5), ('Giusse', 7.5), ('Mauricio R.', 6.5), ('Lucho', 6.0), ('Gino', 6.0), ('Patrick', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_4_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'PFM', 'Andare per Andare' FROM set_10_4
  RETURNING id
)
, votes_10_4_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_4_14.id, v.voter_name, v.score
  FROM song_10_4_14,
  (VALUES ('Mario', 5.0), ('Daniel', 6.0), ('Jorge A.', 6.0), ('Carlos', 6.0), ('Freddy', 6.5), ('Giusse', 7.5), ('Mauricio R.', 6.5), ('Lucho', 6.0), ('Gino', 5.0), ('Patrick', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_4_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'Il bacio della Medusa', 'la bestia e il delirio' FROM set_10_4
  RETURNING id
)
, votes_10_4_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_4_15.id, v.voter_name, v.score
  FROM song_10_4_15,
  (VALUES ('Mario', 6.0), ('Daniel', 6.5), ('Jorge A.', 7.0), ('Carlos', 5.0), ('Freddy', 7.0), ('Giusse', 8.0), ('Mauricio R.', 8.5), ('Lucho', 6.5), ('Gino', 7.0), ('Patrick', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_4_16 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 16, 'King Crimson', 'Thela Hun Ginjeet' FROM set_10_4
  RETURNING id
)
, votes_10_4_16 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_4_16.id, v.voter_name, v.score
  FROM song_10_4_16,
  (VALUES ('Mario', 6.5), ('Jorge A.', 6.5), ('Carlos', 7.0), ('Freddy', 7.0), ('Giusse', 7.5), ('Mauricio R.', 7.0), ('Lucho', 7.0), ('Gino', 7.5), ('Patrick', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_10_4_17 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 17, 'Genesis', 'I know I What I Like' FROM set_10_4
  RETURNING id
)
, votes_10_4_17 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_4_17.id, v.voter_name, v.score
  FROM song_10_4_17,
  (VALUES ('Mario', 7.5), ('Jorge A.', 6.5), ('Carlos', 7.5), ('Freddy', 7.0), ('Giusse', 8.0), ('Mauricio R.', 8.5), ('Lucho', 7.5), ('Gino', 6.0), ('Patrick', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_4_18 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 18, 'Yes', 'Release, Release' FROM set_10_4
  RETURNING id
)
, votes_10_4_18 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_4_18.id, v.voter_name, v.score
  FROM song_10_4_18,
  (VALUES ('Mario', 8.5), ('Jorge A.', 6.0), ('Carlos', 6.5), ('Freddy', 8.0), ('Giusse', 8.0), ('Mauricio R.', 8.0), ('Lucho', 8.5), ('Gino', 6.0), ('Patrick', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_4_19 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 19, 'PinkFloyd', 'Money' FROM set_10_4
  RETURNING id
)
, votes_10_4_19 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_4_19.id, v.voter_name, v.score
  FROM song_10_4_19,
  (VALUES ('Mario', 8.5), ('Jorge A.', 7.5), ('Carlos', 8.0), ('Freddy', 9.0), ('Giusse', 7.5), ('Mauricio R.', 8.5), ('Lucho', 9.0), ('Gino', 7.0), ('Patrick', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, set_10_5 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 5, 'Set Patrick' FROM s10
  RETURNING id
)
, song_10_5_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'ZZ Top', 'Gimme All Your Lovin' FROM set_10_5
  RETURNING id
)
, votes_10_5_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_5_0.id, v.voter_name, v.score
  FROM song_10_5_0,
  (VALUES ('Mario', 9.0), ('Jorge A.', 8.0), ('Carlos', 8.5), ('Freddy', 8.0), ('Giusse', 9.5), ('Lucho', 9.0), ('Julio', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_10_5_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'Kool & The Gang', 'Get Dwon on it' FROM set_10_5
  RETURNING id
)
, votes_10_5_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_5_1.id, v.voter_name, v.score
  FROM song_10_5_1,
  (VALUES ('Mario', 9.5), ('Jorge A.', 9.0), ('Carlos', 9.0), ('Freddy', 10.0), ('Giusse', 8.5), ('Lucho', 9.5), ('Julio', 4.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_5_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'Pearl Jam', 'Yellow Ledbetter' FROM set_10_5
  RETURNING id
)
, votes_10_5_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_5_2.id, v.voter_name, v.score
  FROM song_10_5_2,
  (VALUES ('Mario', 9.0), ('Jorge A.', 8.5), ('Carlos', 7.5), ('Freddy', 8.0), ('Giusse', 8.0), ('Lucho', 8.5), ('Julio', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_10_5_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Chris Norman and Suzy Quatro', 'Stumblin'' In (Tropezando)' FROM set_10_5
  RETURNING id
)
, votes_10_5_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_5_3.id, v.voter_name, v.score
  FROM song_10_5_3,
  (VALUES ('Mario', 8.5), ('Jorge A.', 8.0), ('Carlos', 8.5), ('Freddy', 8.0), ('Giusse', 8.0), ('Lucho', 9.0), ('Julio', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_10_5_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'Yes', 'And You and I' FROM set_10_5
  RETURNING id
)
, votes_10_5_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_5_4.id, v.voter_name, v.score
  FROM song_10_5_4,
  (VALUES ('Mario', 9.0), ('Jorge A.', 6.5), ('Carlos', 7.0), ('Freddy', 8.0), ('Giusse', 8.5), ('Lucho', 8.5), ('Julio', 10.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_5_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'Scorpions', 'Always Somewhere' FROM set_10_5
  RETURNING id
)
, votes_10_5_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_5_5.id, v.voter_name, v.score
  FROM song_10_5_5,
  (VALUES ('Mario', 9.0), ('Jorge A.', 7.5), ('Carlos', 8.0), ('Freddy', 7.5), ('Giusse', 8.0), ('Lucho', 9.0), ('Julio', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_10_5_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'Alanis Morissette', 'You learn' FROM set_10_5
  RETURNING id
)
, votes_10_5_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_5_6.id, v.voter_name, v.score
  FROM song_10_5_6,
  (VALUES ('Mario', 8.0), ('Jorge A.', 7.5), ('Carlos', 7.0), ('Freddy', 7.0), ('Giusse', 9.5), ('Lucho', 8.5), ('Julio', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_5_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'Van Halen', 'Jump' FROM set_10_5
  RETURNING id
)
, votes_10_5_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_5_7.id, v.voter_name, v.score
  FROM song_10_5_7,
  (VALUES ('Mario', 7.0), ('Jorge A.', 8.0), ('Carlos', 7.5), ('Freddy', 9.0), ('Giusse', 8.5), ('Lucho', 8.5), ('Julio', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_5_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'Weather Report', 'Havona' FROM set_10_5
  RETURNING id
)
, votes_10_5_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_5_8.id, v.voter_name, v.score
  FROM song_10_5_8,
  (VALUES ('Mario', 8.0), ('Jorge A.', 7.0), ('Carlos', 5.5), ('Freddy', 8.0), ('Giusse', 9.0), ('Lucho', 8.5), ('Julio', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_5_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'Lyn Collins', 'Think (About It)' FROM set_10_5
  RETURNING id
)
, votes_10_5_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_5_9.id, v.voter_name, v.score
  FROM song_10_5_9,
  (VALUES ('Mario', 8.5), ('Jorge A.', 6.5), ('Carlos', 7.0), ('Freddy', 8.0), ('Giusse', 8.0), ('Lucho', 8.0), ('Julio', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_5_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'Collective Soul', 'Precious Declaration' FROM set_10_5
  RETURNING id
)
, votes_10_5_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_5_10.id, v.voter_name, v.score
  FROM song_10_5_10,
  (VALUES ('Mario', 7.0), ('Jorge A.', 8.5), ('Carlos', 7.5), ('Freddy', 7.0), ('Giusse', 7.5), ('Lucho', 7.0), ('Julio', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_5_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'Metallica Symphonic Medley (popurry)', 'For Whom The Bell Tolls' FROM set_10_5
  RETURNING id
)
, votes_10_5_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_5_11.id, v.voter_name, v.score
  FROM song_10_5_11,
  (VALUES ('Mario', 8.0), ('Jorge A.', 9.0), ('Carlos', 6.5), ('Freddy', 7.5), ('Giusse', 7.5), ('Lucho', 8.0), ('Julio', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_5_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'Jeff Beck', '"Goin'' Down" - Jeff Beck ft Beth Hart (2013)' FROM set_10_5
  RETURNING id
)
, votes_10_5_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_5_12.id, v.voter_name, v.score
  FROM song_10_5_12,
  (VALUES ('Mario', 7.0), ('Jorge A.', 7.0), ('Carlos', 8.0), ('Freddy', 6.0), ('Giusse', 8.0), ('Lucho', 9.0), ('Julio', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_5_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'John Legend', 'All of me' FROM set_10_5
  RETURNING id
)
, votes_10_5_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_5_13.id, v.voter_name, v.score
  FROM song_10_5_13,
  (VALUES ('Mario', 8.0), ('Jorge A.', 8.0), ('Carlos', 7.0), ('Freddy', 9.0), ('Giusse', 7.0), ('Lucho', 7.0), ('Julio', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_5_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'Iron Miden', '2 minutes to midnight' FROM set_10_5
  RETURNING id
)
, votes_10_5_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_5_14.id, v.voter_name, v.score
  FROM song_10_5_14,
  (VALUES ('Mario', 6.5), ('Jorge A.', 8.5), ('Carlos', 6.5), ('Freddy', 7.0), ('Giusse', 7.5), ('Lucho', 8.5), ('Julio', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_10_5_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'Led Zeppelin', 'Misty Mountain Hop' FROM set_10_5
  RETURNING id
)
, votes_10_5_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_5_15.id, v.voter_name, v.score
  FROM song_10_5_15,
  (VALUES ('Mario', 7.0), ('Jorge A.', 7.0), ('Carlos', 8.0), ('Freddy', 7.0), ('Giusse', 7.0), ('Lucho', 8.0), ('Julio', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_5_16 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 16, 'Betty Wright', 'Clean Up Woman' FROM set_10_5
  RETURNING id
)
, votes_10_5_16 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_5_16.id, v.voter_name, v.score
  FROM song_10_5_16,
  (VALUES ('Mario', 8.0), ('Jorge A.', 7.0), ('Carlos', 6.0), ('Freddy', 7.0), ('Giusse', 8.0), ('Lucho', 7.5), ('Julio', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_10_5_17 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 17, 'Mariya Takeuchi', 'Plastic Love' FROM set_10_5
  RETURNING id
)
, votes_10_5_17 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_5_17.id, v.voter_name, v.score
  FROM song_10_5_17,
  (VALUES ('Mario', 7.0), ('Jorge A.', 7.0), ('Carlos', 6.5), ('Freddy', 7.0), ('Giusse', 7.0), ('Lucho', 7.5), ('Julio', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_5_18 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 18, 'Barns Courtney', 'Supernatural' FROM set_10_5
  RETURNING id
)
, votes_10_5_18 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_5_18.id, v.voter_name, v.score
  FROM song_10_5_18,
  (VALUES ('Mario', 7.0), ('Jorge A.', 7.0), ('Carlos', 7.0), ('Freddy', 6.5), ('Giusse', 7.0), ('Lucho', 7.5), ('Julio', 4.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_5_19 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 19, 'Marvin Gaye. "Shake Your Body (Down to the Ground)"  / "Don''t Stop ''til You Get Enough" /', 'Got to give it up' FROM set_10_5
  RETURNING id
)
, votes_10_5_19 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_5_19.id, v.voter_name, v.score
  FROM song_10_5_19,
  (VALUES ('Mario', 7.0), ('Jorge A.', 6.0), ('Carlos', 6.0), ('Freddy', 8.0), ('Giusse', 7.5), ('Lucho', 6.0), ('Julio', 4.0)) AS v(voter_name, score)
  RETURNING id
)
, set_10_6 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 6, 'Set Rafael' FROM s10
  RETURNING id
)
, song_10_6_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'Radiohead', 'Nude' FROM set_10_6
  RETURNING id
)
, votes_10_6_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_6_0.id, v.voter_name, v.score
  FROM song_10_6_0,
  (VALUES ('Francisco', 7.5), ('Jorge A.', 7.5), ('Carlos', 6.5), ('Mauricio O.', 7.0), ('Lucho', 7.5), ('Gino', 6.0), ('Julio', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_10_6_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'Roy Orbison', 'Blue Bayou' FROM set_10_6
  RETURNING id
)
, votes_10_6_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_6_1.id, v.voter_name, v.score
  FROM song_10_6_1,
  (VALUES ('Francisco', 7.5), ('Jorge A.', 7.0), ('Carlos', 7.5), ('Mauricio O.', 8.5), ('Lucho', 8.5), ('Gino', 7.0), ('Julio', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_6_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'James', 'Getting Away with It' FROM set_10_6
  RETURNING id
)
, votes_10_6_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_6_2.id, v.voter_name, v.score
  FROM song_10_6_2,
  (VALUES ('Francisco', 8.0), ('Jorge A.', 7.5), ('Carlos', 9.0), ('Mauricio O.', 8.5), ('Lucho', 8.0), ('Gino', 8.0), ('Julio', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_6_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'College & Electrick Youth', 'A Real hero' FROM set_10_6
  RETURNING id
)
, votes_10_6_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_6_3.id, v.voter_name, v.score
  FROM song_10_6_3,
  (VALUES ('Francisco', 8.0), ('Jorge A.', 6.5), ('Carlos', 7.0), ('Mauricio O.', 7.0), ('Lucho', 7.5), ('Gino', 7.0), ('Julio', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_6_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'Sam Fender', 'Seventheen Going Under' FROM set_10_6
  RETURNING id
)
, votes_10_6_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_6_4.id, v.voter_name, v.score
  FROM song_10_6_4,
  (VALUES ('Francisco', 8.0), ('Jorge A.', 8.0), ('Carlos', 7.5), ('Mauricio O.', 7.5), ('Lucho', 7.5), ('Gino', 8.0), ('Julio', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_10_6_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'Trafic Sound', 'Virgin' FROM set_10_6
  RETURNING id
)
, votes_10_6_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_6_5.id, v.voter_name, v.score
  FROM song_10_6_5,
  (VALUES ('Francisco', 8.5), ('Jorge A.', 8.0), ('Carlos', 8.0), ('Mauricio O.', 9.0), ('Lucho', 8.0), ('Gino', 7.5), ('Julio', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_6_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'Any Lenox', 'Fragile (Singing to Sting)' FROM set_10_6
  RETURNING id
)
, votes_10_6_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_6_6.id, v.voter_name, v.score
  FROM song_10_6_6,
  (VALUES ('Francisco', 8.0), ('Jorge A.', 8.0), ('Carlos', 8.0), ('Mauricio O.', 6.0), ('Lucho', 8.0), ('Gino', 8.0), ('Julio', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_6_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'Deep Purple', 'Lazy' FROM set_10_6
  RETURNING id
)
, votes_10_6_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_6_7.id, v.voter_name, v.score
  FROM song_10_6_7,
  (VALUES ('Francisco', 9.0), ('Jorge A.', 8.0), ('Carlos', 9.0), ('Mauricio O.', 8.0), ('Lucho', 9.0), ('Gino', 8.5), ('Julio', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_10_6_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'Tears for Fears', 'Elemental' FROM set_10_6
  RETURNING id
)
, votes_10_6_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_6_8.id, v.voter_name, v.score
  FROM song_10_6_8,
  (VALUES ('Francisco', 8.5), ('Jorge A.', 8.5), ('Carlos', 6.5), ('Mauricio O.', 8.0), ('Lucho', 8.0), ('Gino', 6.0), ('Julio', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_10_6_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'Duran Duran', 'Give It All Up (feat Tove Lo)' FROM set_10_6
  RETURNING id
)
, votes_10_6_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_6_9.id, v.voter_name, v.score
  FROM song_10_6_9,
  (VALUES ('Francisco', 8.0), ('Jorge A.', 8.5), ('Carlos', 7.5), ('Mauricio O.', 7.5), ('Lucho', 8.5), ('Gino', 8.0), ('Julio', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_10_6_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'The Alan Parsons Project', 'Sirius 2017 (Disco Demolition Remix)' FROM set_10_6
  RETURNING id
)
, votes_10_6_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_6_10.id, v.voter_name, v.score
  FROM song_10_6_10,
  (VALUES ('Francisco', 9.0), ('Jorge A.', 8.0), ('Carlos', 9.0), ('Mauricio O.', 8.0), ('Lucho', 9.0), ('Gino', 8.0), ('Julio', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_6_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'Bon Iver', 'Holocene' FROM set_10_6
  RETURNING id
)
, votes_10_6_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_6_11.id, v.voter_name, v.score
  FROM song_10_6_11,
  (VALUES ('Francisco', 8.5), ('Jorge A.', 6.5), ('Carlos', 6.0), ('Mauricio O.', 7.0), ('Lucho', 7.0), ('Gino', 7.0), ('Julio', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_10_6_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'Manolo Garcia', 'Llanto de Pasion' FROM set_10_6
  RETURNING id
)
, votes_10_6_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_6_12.id, v.voter_name, v.score
  FROM song_10_6_12,
  (VALUES ('Francisco', 7.5), ('Jorge A.', 7.0), ('Carlos', 7.5), ('Mauricio O.', 8.5), ('Lucho', 8.5), ('Gino', 8.0), ('Julio', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_10_6_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'Fleetwood Mac', 'A Little Deamon' FROM set_10_6
  RETURNING id
)
, votes_10_6_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_6_13.id, v.voter_name, v.score
  FROM song_10_6_13,
  (VALUES ('Francisco', 8.5), ('Jorge A.', 7.0), ('Carlos', 8.5), ('Mauricio O.', 8.0), ('Lucho', 8.5), ('Gino', 8.5), ('Julio', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_10_6_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'The Avener & John Lee Hooker', 'It Serves your right to Suffer (The Avener & John Lee Hooker)' FROM set_10_6
  RETURNING id
)
, votes_10_6_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_6_14.id, v.voter_name, v.score
  FROM song_10_6_14,
  (VALUES ('Francisco', 8.0), ('Jorge A.', 8.0), ('Carlos', 7.5), ('Mauricio O.', 7.0), ('Lucho', 7.5), ('Gino', 8.0), ('Julio', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_6_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'Bob Sinclair', 'World, Hold On' FROM set_10_6
  RETURNING id
)
, votes_10_6_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_6_15.id, v.voter_name, v.score
  FROM song_10_6_15,
  (VALUES ('Francisco', 9.0), ('Jorge A.', 9.0), ('Carlos', 9.0), ('Mauricio O.', 9.0), ('Lucho', 9.0), ('Gino', 8.5), ('Julio', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_6_16 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 16, 'My Morning Jacket', 'Gideon' FROM set_10_6
  RETURNING id
)
, votes_10_6_16 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_6_16.id, v.voter_name, v.score
  FROM song_10_6_16,
  (VALUES ('Francisco', 8.0), ('Jorge A.', 8.0), ('Carlos', 7.5), ('Mauricio O.', 7.5), ('Lucho', 8.5), ('Gino', 7.5), ('Julio', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_6_17 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 17, 'TV on the Radio', 'Dlz' FROM set_10_6
  RETURNING id
)
, votes_10_6_17 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_6_17.id, v.voter_name, v.score
  FROM song_10_6_17,
  (VALUES ('Francisco', 7.5), ('Jorge A.', 7.5), ('Carlos', 7.0), ('Mauricio O.', 6.5), ('Lucho', 8.0), ('Gino', 7.5), ('Julio', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_6_18 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 18, 'Steath', 'Judgement Day' FROM set_10_6
  RETURNING id
)
, votes_10_6_18 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_6_18.id, v.voter_name, v.score
  FROM song_10_6_18,
  (VALUES ('Francisco', 8.0), ('Jorge A.', 8.0), ('Carlos', 7.0), ('Mauricio O.', 6.5), ('Lucho', 7.0), ('Gino', 7.5), ('Julio', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_10_6_19 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 19, 'The Rolling Stones', 'She´s a Rainbow' FROM set_10_6
  RETURNING id
)
, votes_10_6_19 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_10_6_19.id, v.voter_name, v.score
  FROM song_10_6_19,
  (VALUES ('Francisco', 10.0), ('Jorge A.', 8.5), ('Carlos', 9.5), ('Mauricio O.', 9.5), ('Lucho', 8.5), ('Gino', 9.5), ('Julio', 9.0)) AS v(voter_name, score)
  RETURNING id
)
SELECT id FROM s10;

WITH s11 AS (
  INSERT INTO cyc_sessions (session_num, host, date, attendees, input_mode, sets_count, songs_count, complete)
  VALUES (11, 'Temporada 11', '2025-05-01', ARRAY["Alex", "Carlos", "Daniel", "Francisco", "Freddy", "Gino", "Giusse", "Jorge A.", "Julio", "Kurt", "Lucho", "Mario", "Mauricio O.", "Mauricio R.", "Patrick"]::text[], 'host', 6, 20, true)
  RETURNING id
)
, set_11_0 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 0, 'Set Carlos' FROM s11
  RETURNING id
)
, song_11_0_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'Don Henley', 'Dirty Laundry' FROM set_11_0
  RETURNING id
)
, votes_11_0_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_0_0.id, v.voter_name, v.score
  FROM song_11_0_0,
  (VALUES ('Daniel', 7.5), ('Freddy', 7.5), ('Mauricio O.', 9.0), ('Mauricio R.', 7.5), ('Lucho', 9.0), ('Gino', 7.5), ('Patrick', 8.0), ('Julio', 7.5), ('Kurt', 9.5)) AS v(voter_name, score)
  RETURNING id
)
, song_11_0_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'David Bowie', 'Let´s Dance - Symphonic' FROM set_11_0
  RETURNING id
)
, votes_11_0_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_0_1.id, v.voter_name, v.score
  FROM song_11_0_1,
  (VALUES ('Daniel', 8.0), ('Freddy', 8.5), ('Mauricio O.', 8.5), ('Mauricio R.', 7.5), ('Lucho', 9.0), ('Gino', 8.0), ('Patrick', 8.0), ('Julio', 8.5), ('Kurt', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_11_0_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'The Vaccines', 'Lunar Eclipse' FROM set_11_0
  RETURNING id
)
, votes_11_0_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_0_2.id, v.voter_name, v.score
  FROM song_11_0_2,
  (VALUES ('Daniel', 7.5), ('Freddy', 7.5), ('Mauricio O.', 8.5), ('Mauricio R.', 8.0), ('Lucho', 7.5), ('Gino', 6.5), ('Patrick', 7.0), ('Julio', 7.0), ('Kurt', 10.0)) AS v(voter_name, score)
  RETURNING id
)
, song_11_0_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Alaska y Dinarma', 'La decision' FROM set_11_0
  RETURNING id
)
, votes_11_0_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_0_3.id, v.voter_name, v.score
  FROM song_11_0_3,
  (VALUES ('Daniel', 7.0), ('Freddy', 6.5), ('Mauricio O.', 7.0), ('Mauricio R.', 6.0), ('Lucho', 7.0), ('Gino', 6.5), ('Patrick', 7.0), ('Julio', 7.5), ('Kurt', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_11_0_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'Royal Philharmonic Orchesta', 'Hooked on Classics 1' FROM set_11_0
  RETURNING id
)
, votes_11_0_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_0_4.id, v.voter_name, v.score
  FROM song_11_0_4,
  (VALUES ('Daniel', 8.5), ('Freddy', 10.0), ('Mauricio O.', 9.5), ('Mauricio R.', 8.5), ('Lucho', 10.0), ('Gino', 9.0), ('Patrick', 10.0), ('Julio', 9.0), ('Kurt', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_11_0_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'New Order', 'Temptation' FROM set_11_0
  RETURNING id
)
, votes_11_0_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_0_5.id, v.voter_name, v.score
  FROM song_11_0_5,
  (VALUES ('Daniel', 8.5), ('Freddy', 7.0), ('Mauricio O.', 8.5), ('Mauricio R.', 7.0), ('Lucho', 8.0), ('Gino', 8.5), ('Patrick', 7.5), ('Julio', 6.5), ('Kurt', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_11_0_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'Rod Stewart', 'I dont want to talk about it - Philamornic' FROM set_11_0
  RETURNING id
)
, votes_11_0_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_0_6.id, v.voter_name, v.score
  FROM song_11_0_6,
  (VALUES ('Daniel', 8.5), ('Freddy', 7.5), ('Mauricio O.', 8.5), ('Mauricio R.', 8.5), ('Lucho', 8.0), ('Gino', 6.0), ('Patrick', 9.0), ('Julio', 7.5), ('Kurt', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_11_0_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'Depeche Mode', 'Something to do' FROM set_11_0
  RETURNING id
)
, votes_11_0_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_0_7.id, v.voter_name, v.score
  FROM song_11_0_7,
  (VALUES ('Daniel', 8.5), ('Freddy', 8.0), ('Mauricio O.', 8.5), ('Mauricio R.', 7.0), ('Lucho', 7.0), ('Gino', 8.0), ('Patrick', 7.5), ('Julio', 7.5), ('Kurt', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_11_0_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'Dion', 'Runaround Sue' FROM set_11_0
  RETURNING id
)
, votes_11_0_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_0_8.id, v.voter_name, v.score
  FROM song_11_0_8,
  (VALUES ('Daniel', 8.0), ('Freddy', 7.0), ('Mauricio O.', 8.5), ('Mauricio R.', 8.0), ('Lucho', 8.0), ('Gino', 7.0), ('Patrick', 8.0), ('Julio', 7.5), ('Kurt', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_11_0_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'Blossoms', 'To do list' FROM set_11_0
  RETURNING id
)
, votes_11_0_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_0_9.id, v.voter_name, v.score
  FROM song_11_0_9,
  (VALUES ('Daniel', 9.0), ('Freddy', 7.5), ('Mauricio O.', 7.5), ('Mauricio R.', 7.5), ('Lucho', 8.0), ('Gino', 8.0), ('Patrick', 8.0), ('Julio', 8.0), ('Kurt', 9.5)) AS v(voter_name, score)
  RETURNING id
)
, song_11_0_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'Exile', 'Kiss You All Over' FROM set_11_0
  RETURNING id
)
, votes_11_0_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_0_10.id, v.voter_name, v.score
  FROM song_11_0_10,
  (VALUES ('Daniel', 8.5), ('Freddy', 8.0), ('Mauricio O.', 8.0), ('Mauricio R.', 8.0), ('Lucho', 9.0), ('Gino', 8.5), ('Patrick', 9.0), ('Julio', 8.0), ('Kurt', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_11_0_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'OMD', 'Tesla Girls' FROM set_11_0
  RETURNING id
)
, votes_11_0_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_0_11.id, v.voter_name, v.score
  FROM song_11_0_11,
  (VALUES ('Daniel', 7.5), ('Freddy', 7.0), ('Mauricio O.', 8.0), ('Mauricio R.', 6.0), ('Lucho', 7.0), ('Gino', 7.0), ('Patrick', 8.0), ('Julio', 6.5), ('Kurt', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_11_0_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'Paper Lace', 'The night Chicago Died' FROM set_11_0
  RETURNING id
)
, votes_11_0_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_0_12.id, v.voter_name, v.score
  FROM song_11_0_12,
  (VALUES ('Daniel', 8.0), ('Freddy', 7.5), ('Mauricio O.', 9.0), ('Mauricio R.', 9.0), ('Lucho', 8.5), ('Gino', 7.5), ('Patrick', 8.5), ('Julio', 7.5), ('Kurt', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_11_0_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'pink floyd', 'the final cut' FROM set_11_0
  RETURNING id
)
, votes_11_0_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_0_13.id, v.voter_name, v.score
  FROM song_11_0_13,
  (VALUES ('Daniel', 7.5), ('Freddy', 7.5), ('Mauricio O.', 7.5), ('Mauricio R.', 9.0), ('Lucho', 7.5), ('Gino', 6.0), ('Patrick', 9.0), ('Julio', 10.0), ('Kurt', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_11_0_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'Les rita Mitsouko', 'c,est comme za' FROM set_11_0
  RETURNING id
)
, votes_11_0_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_0_14.id, v.voter_name, v.score
  FROM song_11_0_14,
  (VALUES ('Daniel', 7.5), ('Freddy', 7.5), ('Mauricio O.', 9.0), ('Mauricio R.', 7.0), ('Lucho', 8.0), ('Gino', 9.0), ('Patrick', 7.5), ('Julio', 8.0), ('Kurt', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_11_0_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'Future Island', 'Peach' FROM set_11_0
  RETURNING id
)
, votes_11_0_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_0_15.id, v.voter_name, v.score
  FROM song_11_0_15,
  (VALUES ('Daniel', 7.5), ('Freddy', 7.0), ('Mauricio O.', 8.0), ('Mauricio R.', 7.0), ('Lucho', 8.0), ('Gino', 8.0), ('Patrick', 8.0), ('Julio', 6.5), ('Kurt', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_11_0_16 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 16, 'Aaron', 'Blouson Noir' FROM set_11_0
  RETURNING id
)
, votes_11_0_16 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_0_16.id, v.voter_name, v.score
  FROM song_11_0_16,
  (VALUES ('Daniel', 7.5), ('Freddy', 8.5), ('Mauricio O.', 7.5), ('Mauricio R.', 7.5), ('Lucho', 9.0), ('Gino', 7.5), ('Patrick', 7.5), ('Julio', 8.0), ('Kurt', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_11_0_17 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 17, 'Alabama Shakes', 'Always Alright' FROM set_11_0
  RETURNING id
)
, votes_11_0_17 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_0_17.id, v.voter_name, v.score
  FROM song_11_0_17,
  (VALUES ('Daniel', 8.0), ('Freddy', 6.5), ('Mauricio O.', 8.5), ('Mauricio R.', 7.5), ('Lucho', 8.0), ('Gino', 8.5), ('Patrick', 8.0), ('Julio', 7.5), ('Kurt', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_11_0_18 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 18, 'La Beriso - Victor Heredia', 'Sobreviviendo' FROM set_11_0
  RETURNING id
)
, votes_11_0_18 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_0_18.id, v.voter_name, v.score
  FROM song_11_0_18,
  (VALUES ('Daniel', 7.5), ('Freddy', 8.0), ('Mauricio O.', 8.0), ('Mauricio R.', 1.0), ('Lucho', 9.0), ('Gino', 5.0), ('Patrick', 9.0), ('Julio', 9.0), ('Kurt', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_11_0_19 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 19, 'Prince', 'Purple Rain' FROM set_11_0
  RETURNING id
)
, votes_11_0_19 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_0_19.id, v.voter_name, v.score
  FROM song_11_0_19,
  (VALUES ('Daniel', 8.5), ('Freddy', 7.5), ('Mauricio O.', 8.5), ('Mauricio R.', 8.5), ('Lucho', 8.5), ('Gino', 5.0), ('Patrick', 8.0), ('Julio', 5.0), ('Kurt', 9.5)) AS v(voter_name, score)
  RETURNING id
)
, set_11_1 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 1, 'Set Gino' FROM s11
  RETURNING id
)
, song_11_1_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'Stars on 45', 'Stars on 45' FROM set_11_1
  RETURNING id
)
, votes_11_1_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_1_0.id, v.voter_name, v.score
  FROM song_11_1_0,
  (VALUES ('Mario', 8.0), ('Daniel', 7.5), ('Jorge A.', 7.5), ('Carlos', 8.5), ('Giusse', 8.0), ('Mauricio O.', 8.0), ('Patrick', 8.0), ('Alex', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_11_1_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'Sinead O''Connor', 'The emperor''s new clothes' FROM set_11_1
  RETURNING id
)
, votes_11_1_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_1_1.id, v.voter_name, v.score
  FROM song_11_1_1,
  (VALUES ('Mario', 8.5), ('Daniel', 6.0), ('Jorge A.', 6.5), ('Carlos', 7.0), ('Giusse', 7.5), ('Mauricio O.', 7.0), ('Patrick', 7.0), ('Alex', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_11_1_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'Franz Listz', 'La Campanella' FROM set_11_1
  RETURNING id
)
, votes_11_1_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_1_2.id, v.voter_name, v.score
  FROM song_11_1_2,
  (VALUES ('Mario', 9.0), ('Daniel', 7.5), ('Jorge A.', 9.0), ('Carlos', 8.0), ('Giusse', 8.0), ('Mauricio O.', 9.0), ('Patrick', 9.0), ('Alex', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_11_1_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Fleetwood Mac', 'Can''t go back' FROM set_11_1
  RETURNING id
)
, votes_11_1_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_1_3.id, v.voter_name, v.score
  FROM song_11_1_3,
  (VALUES ('Mario', 8.5), ('Daniel', 8.0), ('Jorge A.', 7.0), ('Carlos', 8.0), ('Giusse', 8.5), ('Mauricio O.', 8.0), ('Lucho', 9.0), ('Patrick', 8.0), ('Alex', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_11_1_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'The Fratellis', 'Chelsea Dagger' FROM set_11_1
  RETURNING id
)
, votes_11_1_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_1_4.id, v.voter_name, v.score
  FROM song_11_1_4,
  (VALUES ('Mario', 6.5), ('Daniel', 7.0), ('Jorge A.', 7.0), ('Carlos', 7.5), ('Giusse', 7.5), ('Mauricio O.', 7.0), ('Lucho', 7.5), ('Patrick', 8.0), ('Alex', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_11_1_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'Genesis', 'Home by the sea' FROM set_11_1
  RETURNING id
)
, votes_11_1_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_1_5.id, v.voter_name, v.score
  FROM song_11_1_5,
  (VALUES ('Mario', 8.5), ('Daniel', 8.5), ('Jorge A.', 8.0), ('Carlos', 8.0), ('Giusse', 9.0), ('Mauricio O.', 8.0), ('Lucho', 8.5), ('Patrick', 9.0), ('Alex', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_11_1_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'Run River North', 'Funhouse' FROM set_11_1
  RETURNING id
)
, votes_11_1_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_1_6.id, v.voter_name, v.score
  FROM song_11_1_6,
  (VALUES ('Mario', 7.0), ('Daniel', 6.0), ('Jorge A.', 7.0), ('Carlos', 7.5), ('Giusse', 7.5), ('Mauricio O.', 7.0), ('Lucho', 7.5), ('Patrick', 6.0), ('Alex', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_11_1_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'Legiao Urbana', 'Indios' FROM set_11_1
  RETURNING id
)
, votes_11_1_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_1_7.id, v.voter_name, v.score
  FROM song_11_1_7,
  (VALUES ('Mario', 8.0), ('Daniel', 8.0), ('Jorge A.', 8.0), ('Carlos', 8.5), ('Giusse', 9.0), ('Mauricio O.', 8.0), ('Lucho', 8.0), ('Patrick', 7.5), ('Alex', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_11_1_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'Thee Oh Sees', 'Lupine Dominus' FROM set_11_1
  RETURNING id
)
, votes_11_1_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_1_8.id, v.voter_name, v.score
  FROM song_11_1_8,
  (VALUES ('Mario', 7.0), ('Daniel', 6.5), ('Jorge A.', 6.5), ('Carlos', 7.5), ('Giusse', 7.0), ('Mauricio O.', 6.0), ('Lucho', 7.0), ('Patrick', 7.0), ('Alex', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_11_1_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'Sparks', 'Popularity' FROM set_11_1
  RETURNING id
)
, votes_11_1_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_1_9.id, v.voter_name, v.score
  FROM song_11_1_9,
  (VALUES ('Mario', 8.0), ('Daniel', 7.5), ('Jorge A.', 7.5), ('Carlos', 9.0), ('Giusse', 7.5), ('Mauricio O.', 8.5), ('Lucho', 7.0), ('Patrick', 7.5), ('Alex', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_11_1_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'Siouxie & The Banshees', 'Dazzle' FROM set_11_1
  RETURNING id
)
, votes_11_1_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_1_10.id, v.voter_name, v.score
  FROM song_11_1_10,
  (VALUES ('Mario', 8.0), ('Daniel', 8.0), ('Jorge A.', 7.5), ('Carlos', 8.5), ('Giusse', 8.0), ('Mauricio O.', 7.5), ('Lucho', 7.5), ('Patrick', 8.5), ('Alex', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_11_1_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'The Temper Trap', 'Sweet disposition' FROM set_11_1
  RETURNING id
)
, votes_11_1_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_1_11.id, v.voter_name, v.score
  FROM song_11_1_11,
  (VALUES ('Mario', 8.5), ('Daniel', 7.5), ('Jorge A.', 8.5), ('Carlos', 7.5), ('Giusse', 8.0), ('Mauricio O.', 9.0), ('Lucho', 8.5), ('Patrick', 8.0), ('Alex', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_11_1_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'The Smiths', 'Barbarism begins at home' FROM set_11_1
  RETURNING id
)
, votes_11_1_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_1_12.id, v.voter_name, v.score
  FROM song_11_1_12,
  (VALUES ('Mario', 9.0), ('Daniel', 7.5), ('Jorge A.', 8.0), ('Carlos', 9.0), ('Giusse', 8.0), ('Mauricio O.', 8.5), ('Lucho', 8.5), ('Patrick', 9.0), ('Alex', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_11_1_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'Madness', 'One Better Day' FROM set_11_1
  RETURNING id
)
, votes_11_1_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_1_13.id, v.voter_name, v.score
  FROM song_11_1_13,
  (VALUES ('Mario', 8.5), ('Daniel', 8.0), ('Jorge A.', 8.0), ('Carlos', 6.5), ('Giusse', 8.0), ('Mauricio O.', 8.5), ('Lucho', 9.0), ('Patrick', 8.5), ('Alex', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_11_1_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'Milky Chance', 'Stolen Dance' FROM set_11_1
  RETURNING id
)
, votes_11_1_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_1_14.id, v.voter_name, v.score
  FROM song_11_1_14,
  (VALUES ('Mario', 8.0), ('Daniel', 8.0), ('Jorge A.', 6.5), ('Carlos', 7.5), ('Giusse', 7.0), ('Mauricio O.', 9.0), ('Lucho', 9.0), ('Patrick', 8.5), ('Alex', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_11_1_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'Silversun pickups', 'Lazy eye' FROM set_11_1
  RETURNING id
)
, votes_11_1_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_1_15.id, v.voter_name, v.score
  FROM song_11_1_15,
  (VALUES ('Mario', 7.5), ('Daniel', 7.5), ('Jorge A.', 7.0), ('Carlos', 7.0), ('Giusse', 7.5), ('Mauricio O.', 7.5), ('Lucho', 8.5), ('Patrick', 8.0), ('Alex', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_11_1_16 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 16, 'Pigbag', 'Papa''s got a brand new pigbag' FROM set_11_1
  RETURNING id
)
, votes_11_1_16 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_1_16.id, v.voter_name, v.score
  FROM song_11_1_16,
  (VALUES ('Mario', 8.0), ('Daniel', 7.5), ('Jorge A.', 7.0), ('Carlos', 8.5), ('Giusse', 8.0), ('Mauricio O.', 7.0), ('Lucho', 8.0), ('Patrick', 9.0), ('Alex', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_11_1_17 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 17, 'Limahl', 'Never ending story' FROM set_11_1
  RETURNING id
)
, votes_11_1_17 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_1_17.id, v.voter_name, v.score
  FROM song_11_1_17,
  (VALUES ('Mario', 8.5), ('Daniel', 8.5), ('Jorge A.', 9.5), ('Carlos', 8.0), ('Giusse', 7.5), ('Mauricio O.', 8.0), ('Lucho', 9.5), ('Patrick', 8.0), ('Alex', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_11_1_18 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 18, 'Echo & The Bunnymen', 'The Killing Moon ( Symphonic)' FROM set_11_1
  RETURNING id
)
, votes_11_1_18 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_1_18.id, v.voter_name, v.score
  FROM song_11_1_18,
  (VALUES ('Mario', 8.0), ('Daniel', 7.5), ('Jorge A.', 7.5), ('Carlos', 9.0), ('Giusse', 7.5), ('Mauricio O.', 7.0), ('Lucho', 7.0), ('Patrick', 8.0), ('Alex', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_11_1_19 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 19, 'Royel Otis', 'Foam' FROM set_11_1
  RETURNING id
)
, votes_11_1_19 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_1_19.id, v.voter_name, v.score
  FROM song_11_1_19,
  (VALUES ('Mario', 8.5), ('Daniel', 7.0), ('Jorge A.', 8.0), ('Carlos', 7.5), ('Giusse', 8.0), ('Mauricio O.', 8.5), ('Lucho', 8.5), ('Patrick', 8.0), ('Alex', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, set_11_2 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 2, 'Set Julio' FROM s11
  RETURNING id
)
, song_11_2_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'The Rockets', 'Galactica' FROM set_11_2
  RETURNING id
)
, votes_11_2_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_2_0.id, v.voter_name, v.score
  FROM song_11_2_0,
  (VALUES ('Francisco', 8.0), ('Mario', 8.5), ('Freddy', 8.0), ('Mauricio R.', 7.5), ('Lucho', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_11_2_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'Gary Numan', 'The Joy Circuit' FROM set_11_2
  RETURNING id
)
, votes_11_2_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_2_1.id, v.voter_name, v.score
  FROM song_11_2_1,
  (VALUES ('Francisco', 8.0), ('Mario', 9.0), ('Freddy', 8.0), ('Mauricio R.', 8.0), ('Lucho', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_11_2_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'The Alan Parsons Project', 'The Raven' FROM set_11_2
  RETURNING id
)
, votes_11_2_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_2_2.id, v.voter_name, v.score
  FROM song_11_2_2,
  (VALUES ('Francisco', 8.5), ('Mario', 8.5), ('Freddy', 8.0), ('Mauricio R.', 8.5), ('Lucho', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_11_2_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Muse', 'Verona' FROM set_11_2
  RETURNING id
)
, votes_11_2_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_2_3.id, v.voter_name, v.score
  FROM song_11_2_3,
  (VALUES ('Francisco', 8.0), ('Mario', 7.0), ('Freddy', 8.0), ('Mauricio R.', 8.0), ('Lucho', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_11_2_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'Weyes Blood', 'Children of the empiries' FROM set_11_2
  RETURNING id
)
, votes_11_2_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_2_4.id, v.voter_name, v.score
  FROM song_11_2_4,
  (VALUES ('Francisco', 7.5), ('Mario', 7.0), ('Daniel', 7.5), ('Freddy', 7.0), ('Mauricio R.', 7.0), ('Lucho', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_11_2_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'Weendo', 'Run Away' FROM set_11_2
  RETURNING id
)
, votes_11_2_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_2_5.id, v.voter_name, v.score
  FROM song_11_2_5,
  (VALUES ('Francisco', 8.0), ('Mario', 6.5), ('Daniel', 7.0), ('Freddy', 7.0), ('Mauricio R.', 6.5), ('Lucho', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_11_2_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'Touchstone', 'Solace 2013' FROM set_11_2
  RETURNING id
)
, votes_11_2_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_2_6.id, v.voter_name, v.score
  FROM song_11_2_6,
  (VALUES ('Francisco', 8.0), ('Mario', 7.5), ('Daniel', 8.0), ('Freddy', 7.5), ('Mauricio R.', 8.5), ('Lucho', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_11_2_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'Kingfisher Sky', 'Liquid Clocks' FROM set_11_2
  RETURNING id
)
, votes_11_2_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_2_7.id, v.voter_name, v.score
  FROM song_11_2_7,
  (VALUES ('Francisco', 8.5), ('Mario', 7.0), ('Daniel', 8.0), ('Freddy', 7.0), ('Mauricio R.', 9.0), ('Lucho', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_11_2_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'ColdPlay', 'Arabesque' FROM set_11_2
  RETURNING id
)
, votes_11_2_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_2_8.id, v.voter_name, v.score
  FROM song_11_2_8,
  (VALUES ('Francisco', 8.5), ('Mario', 7.0), ('Daniel', 7.0), ('Carlos', 7.5), ('Freddy', 7.5), ('Mauricio R.', 7.0), ('Lucho', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_11_2_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'James', 'Comming Home P2' FROM set_11_2
  RETURNING id
)
, votes_11_2_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_2_9.id, v.voter_name, v.score
  FROM song_11_2_9,
  (VALUES ('Francisco', 8.5), ('Mario', 8.0), ('Daniel', 7.5), ('Carlos', 8.0), ('Freddy', 8.0), ('Mauricio R.', 8.0), ('Lucho', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_11_2_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'Rush', 'The Weapon (Part II of Fear)' FROM set_11_2
  RETURNING id
)
, votes_11_2_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_2_10.id, v.voter_name, v.score
  FROM song_11_2_10,
  (VALUES ('Francisco', 7.0), ('Mario', 7.0), ('Daniel', 7.0), ('Carlos', 7.0), ('Freddy', 7.0), ('Mauricio R.', 7.0), ('Lucho', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_11_2_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'Queen', 'The Millionaire Waltz' FROM set_11_2
  RETURNING id
)
, votes_11_2_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_2_11.id, v.voter_name, v.score
  FROM song_11_2_11,
  (VALUES ('Francisco', 9.0), ('Mario', 10.0), ('Daniel', 8.0), ('Carlos', 8.5), ('Freddy', 9.0), ('Mauricio R.', 8.0), ('Lucho', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_11_2_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'Phideaux', 'The error Lives on' FROM set_11_2
  RETURNING id
)
, votes_11_2_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_2_12.id, v.voter_name, v.score
  FROM song_11_2_12,
  (VALUES ('Francisco', 7.5), ('Mario', 7.5), ('Daniel', 7.0), ('Carlos', 7.5), ('Freddy', 8.0), ('Mauricio R.', 8.0), ('Lucho', 9.5)) AS v(voter_name, score)
  RETURNING id
)
, song_11_2_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'The Skys', 'The Wings of the Night' FROM set_11_2
  RETURNING id
)
, votes_11_2_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_2_13.id, v.voter_name, v.score
  FROM song_11_2_13,
  (VALUES ('Francisco', 7.0), ('Mario', 7.5), ('Daniel', 7.0), ('Carlos', 6.5), ('Freddy', 7.0), ('Mauricio R.', 7.0), ('Lucho', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_11_2_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'IZZ', 'The Wait of it All' FROM set_11_2
  RETURNING id
)
, votes_11_2_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_2_14.id, v.voter_name, v.score
  FROM song_11_2_14,
  (VALUES ('Francisco', 7.0), ('Mario', 7.0), ('Daniel', 8.0), ('Carlos', 6.0), ('Freddy', 5.5), ('Mauricio R.', 5.0), ('Lucho', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_11_2_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'PFM', 'Mr.Non Lo So' FROM set_11_2
  RETURNING id
)
, votes_11_2_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_2_15.id, v.voter_name, v.score
  FROM song_11_2_15,
  (VALUES ('Francisco', 7.0), ('Mario', 6.5), ('Carlos', 5.0), ('Freddy', 7.0), ('Mauricio R.', 8.0), ('Lucho', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_11_2_16 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 16, 'Banco di Mutuo Soccorso', 'Tremila' FROM set_11_2
  RETURNING id
)
, votes_11_2_16 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_2_16.id, v.voter_name, v.score
  FROM song_11_2_16,
  (VALUES ('Francisco', 7.0), ('Mario', 6.0), ('Carlos', 5.0), ('Freddy', 7.0), ('Mauricio R.', 7.0), ('Lucho', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_11_2_17 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 17, 'Pink Floyd', 'Lost for Words' FROM set_11_2
  RETURNING id
)
, votes_11_2_17 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_2_17.id, v.voter_name, v.score
  FROM song_11_2_17,
  (VALUES ('Francisco', 8.5), ('Mario', 8.0), ('Carlos', 7.5), ('Freddy', 8.0), ('Mauricio R.', 9.0), ('Lucho', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_11_2_18 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 18, 'Yes', 'We Agree' FROM set_11_2
  RETURNING id
)
, votes_11_2_18 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_2_18.id, v.voter_name, v.score
  FROM song_11_2_18,
  (VALUES ('Francisco', 7.5), ('Mario', 8.0), ('Carlos', 7.0), ('Freddy', 7.0), ('Mauricio R.', 6.0), ('Lucho', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_11_2_19 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 19, 'Genesis', 'Robbery, Assault and Battery' FROM set_11_2
  RETURNING id
)
, votes_11_2_19 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_2_19.id, v.voter_name, v.score
  FROM song_11_2_19,
  (VALUES ('Francisco', 8.0), ('Mario', 6.5), ('Carlos', 6.5), ('Freddy', 8.0), ('Mauricio R.', 7.0), ('Lucho', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, set_11_3 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 3, 'Set Lucho' FROM s11
  RETURNING id
)
, song_11_3_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'Fobee', 'Contact' FROM set_11_3
  RETURNING id
)
, votes_11_3_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_3_0.id, v.voter_name, v.score
  FROM song_11_3_0,
  (VALUES ('Mario', 8.5), ('Carlos', 7.0), ('Freddy', 7.5), ('Mauricio O.', 7.0), ('Julio', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_11_3_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, '(feat. Beth Hirsch) Air, Beth Hirsch', 'All I Need' FROM set_11_3
  RETURNING id
)
, votes_11_3_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_3_1.id, v.voter_name, v.score
  FROM song_11_3_1,
  (VALUES ('Mario', 9.0), ('Carlos', 9.0), ('Freddy', 8.0), ('Mauricio O.', 8.5), ('Julio', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_11_3_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'Bakermat, GoldFish, Marie Plassard', 'Games Continued (feat. Marie Plassard) - Radio Edit' FROM set_11_3
  RETURNING id
)
, votes_11_3_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_3_2.id, v.voter_name, v.score
  FROM song_11_3_2,
  (VALUES ('Mario', 8.0), ('Carlos', 8.5), ('Freddy', 7.5), ('Mauricio O.', 8.0), ('Julio', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_11_3_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Sonnentanz', 'Sonnentanz' FROM set_11_3
  RETURNING id
)
, votes_11_3_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_3_3.id, v.voter_name, v.score
  FROM song_11_3_3,
  (VALUES ('Mario', 8.0), ('Carlos', 8.5), ('Freddy', 8.0), ('Mauricio O.', 7.0), ('Julio', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_11_3_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'Manfred Mann''s Earth Band', 'Blinded By The Light' FROM set_11_3
  RETURNING id
)
, votes_11_3_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_3_4.id, v.voter_name, v.score
  FROM song_11_3_4,
  (VALUES ('Mario', 7.5), ('Carlos', 8.0), ('Freddy', 8.0), ('Mauricio O.', 8.5), ('Julio', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_11_3_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'Herb Alpert', 'Rise' FROM set_11_3
  RETURNING id
)
, votes_11_3_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_3_5.id, v.voter_name, v.score
  FROM song_11_3_5,
  (VALUES ('Mario', 10.0), ('Daniel', 7.5), ('Carlos', 7.5), ('Freddy', 8.0), ('Mauricio O.', 8.0), ('Julio', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_11_3_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'Steve Miller Band', 'Fly Like an Eagle' FROM set_11_3
  RETURNING id
)
, votes_11_3_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_3_6.id, v.voter_name, v.score
  FROM song_11_3_6,
  (VALUES ('Mario', 7.0), ('Daniel', 7.0), ('Carlos', 7.5), ('Freddy', 7.5), ('Mauricio O.', 8.0), ('Julio', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_11_3_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'Supertramp', 'Bloody Well Right' FROM set_11_3
  RETURNING id
)
, votes_11_3_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_3_7.id, v.voter_name, v.score
  FROM song_11_3_7,
  (VALUES ('Mario', 9.0), ('Daniel', 8.0), ('Carlos', 9.0), ('Freddy', 8.5), ('Mauricio O.', 9.5), ('Julio', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_11_3_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'Diana Ross', 'Upside Down' FROM set_11_3
  RETURNING id
)
, votes_11_3_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_3_8.id, v.voter_name, v.score
  FROM song_11_3_8,
  (VALUES ('Mario', 8.0), ('Daniel', 7.5), ('Carlos', 8.0), ('Freddy', 8.0), ('Mauricio O.', 8.0), ('Julio', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_11_3_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'Grand Funk Railroad', 'Footstompin'' Music - Live/1975/Remastered 1999' FROM set_11_3
  RETURNING id
)
, votes_11_3_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_3_9.id, v.voter_name, v.score
  FROM song_11_3_9,
  (VALUES ('Mario', 8.0), ('Daniel', 7.5), ('Carlos', 8.0), ('Freddy', 8.5), ('Mauricio O.', 8.0), ('Julio', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_11_3_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'Change', 'Searching' FROM set_11_3
  RETURNING id
)
, votes_11_3_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_3_10.id, v.voter_name, v.score
  FROM song_11_3_10,
  (VALUES ('Mario', 8.5), ('Daniel', 8.0), ('Carlos', 9.0), ('Freddy', 8.0), ('Mauricio O.', 8.0), ('Julio', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_11_3_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'Robert Miles', 'Children' FROM set_11_3
  RETURNING id
)
, votes_11_3_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_3_11.id, v.voter_name, v.score
  FROM song_11_3_11,
  (VALUES ('Mario', 9.0), ('Daniel', 8.0), ('Carlos', 9.5), ('Freddy', 8.0), ('Mauricio O.', 8.5), ('Julio', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_11_3_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'Dido', 'White Flag' FROM set_11_3
  RETURNING id
)
, votes_11_3_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_3_12.id, v.voter_name, v.score
  FROM song_11_3_12,
  (VALUES ('Mario', 9.5), ('Daniel', 8.0), ('Carlos', 9.0), ('Freddy', 8.0), ('Mauricio O.', 8.0), ('Julio', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_11_3_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'Bachman-Turner Overdrive', 'Hey You' FROM set_11_3
  RETURNING id
)
, votes_11_3_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_3_13.id, v.voter_name, v.score
  FROM song_11_3_13,
  (VALUES ('Mario', 8.0), ('Daniel', 7.5), ('Carlos', 7.0), ('Freddy', 8.0), ('Mauricio O.', 9.0), ('Julio', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_11_3_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'Chuck Mangione', 'Feels So Good - Single Version' FROM set_11_3
  RETURNING id
)
, votes_11_3_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_3_14.id, v.voter_name, v.score
  FROM song_11_3_14,
  (VALUES ('Mario', 9.0), ('Daniel', 7.0), ('Carlos', 8.0), ('Freddy', 10.0), ('Mauricio O.', 8.0), ('Julio', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_11_3_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'Loui & Scibi, Nuwella', 'Your Love - Touch & Go Club Mix' FROM set_11_3
  RETURNING id
)
, votes_11_3_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_3_15.id, v.voter_name, v.score
  FROM song_11_3_15,
  (VALUES ('Mario', 7.0), ('Daniel', 6.5), ('Carlos', 7.0), ('Freddy', 7.0), ('Mauricio O.', 6.5), ('Julio', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_11_3_16 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 16, 'Vanessa-Mae', 'Storm' FROM set_11_3
  RETURNING id
)
, votes_11_3_16 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_3_16.id, v.voter_name, v.score
  FROM song_11_3_16,
  (VALUES ('Mario', 8.0), ('Daniel', 7.5), ('Carlos', 5.0), ('Freddy', 8.0), ('Mauricio O.', 6.5), ('Julio', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_11_3_17 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 17, 'Steely Dan', 'Do It Again' FROM set_11_3
  RETURNING id
)
, votes_11_3_17 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_3_17.id, v.voter_name, v.score
  FROM song_11_3_17,
  (VALUES ('Mario', 8.5), ('Daniel', 7.5), ('Carlos', 7.5), ('Freddy', 8.0), ('Mauricio O.', 8.5), ('Julio', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_11_3_18 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 18, 'Vangelis', 'Alpha' FROM set_11_3
  RETURNING id
)
, votes_11_3_18 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_3_18.id, v.voter_name, v.score
  FROM song_11_3_18,
  (VALUES ('Mario', 8.5), ('Daniel', 7.0), ('Carlos', 7.0), ('Freddy', 8.0), ('Mauricio O.', 6.0), ('Julio', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_11_3_19 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 19, 'George Benson', 'Give Me the Night' FROM set_11_3
  RETURNING id
)
, votes_11_3_19 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_3_19.id, v.voter_name, v.score
  FROM song_11_3_19,
  (VALUES ('Mario', 8.0), ('Daniel', 7.5), ('Carlos', 8.0), ('Freddy', 9.0), ('Mauricio O.', 8.0), ('Julio', 5.0)) AS v(voter_name, score)
  RETURNING id
)
, set_11_4 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 4, 'Set Mauricio' FROM s11
  RETURNING id
)
, song_11_4_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'Men Without Hats', 'I Got The Message' FROM set_11_4
  RETURNING id
)
, votes_11_4_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_4_0.id, v.voter_name, v.score
  FROM song_11_4_0,
  (VALUES ('Francisco', 8.5), ('Mario', 8.0), ('Jorge A.', 7.5), ('Carlos', 8.5), ('Giusse', 8.0), ('Julio', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_11_4_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'The Doobie Brothers', 'Listen to Music' FROM set_11_4
  RETURNING id
)
, votes_11_4_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_4_1.id, v.voter_name, v.score
  FROM song_11_4_1,
  (VALUES ('Francisco', 8.5), ('Mario', 8.0), ('Jorge A.', 8.0), ('Carlos', 8.0), ('Giusse', 7.5), ('Julio', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_11_4_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'Blur', 'Coffee & TV' FROM set_11_4
  RETURNING id
)
, votes_11_4_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_4_2.id, v.voter_name, v.score
  FROM song_11_4_2,
  (VALUES ('Francisco', 8.5), ('Mario', 7.0), ('Jorge A.', 7.5), ('Carlos', 6.5), ('Giusse', 7.0), ('Julio', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_11_4_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Joy Again', 'Looking Out for You' FROM set_11_4
  RETURNING id
)
, votes_11_4_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_4_3.id, v.voter_name, v.score
  FROM song_11_4_3,
  (VALUES ('Francisco', 7.5), ('Mario', 6.0), ('Jorge A.', 7.0), ('Carlos', 7.5), ('Giusse', 7.0), ('Julio', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_11_4_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'Toto', 'Georgy Porgy' FROM set_11_4
  RETURNING id
)
, votes_11_4_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_4_4.id, v.voter_name, v.score
  FROM song_11_4_4,
  (VALUES ('Francisco', 9.5), ('Mario', 9.0), ('Jorge A.', 9.0), ('Carlos', 8.5), ('Giusse', 9.5), ('Julio', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_11_4_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'Los Prisioneros', 'Maldito Sudaca' FROM set_11_4
  RETURNING id
)
, votes_11_4_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_4_5.id, v.voter_name, v.score
  FROM song_11_4_5,
  (VALUES ('Francisco', 8.0), ('Mario', 7.0), ('Jorge A.', 7.0), ('Carlos', 8.0), ('Giusse', 7.5), ('Julio', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_11_4_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'The Weeknd', 'Save Your Tears' FROM set_11_4
  RETURNING id
)
, votes_11_4_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_4_6.id, v.voter_name, v.score
  FROM song_11_4_6,
  (VALUES ('Francisco', 9.0), ('Mario', 8.5), ('Jorge A.', 8.0), ('Carlos', 8.0), ('Giusse', 8.0), ('Julio', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_11_4_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'Luis Alberto Spinetta, Charly García', 'Rezo por Vos' FROM set_11_4
  RETURNING id
)
, votes_11_4_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_4_7.id, v.voter_name, v.score
  FROM song_11_4_7,
  (VALUES ('Francisco', 9.0), ('Mario', 7.0), ('Jorge A.', 7.0), ('Carlos', 7.5), ('Giusse', 9.0), ('Julio', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_11_4_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'Turf', 'Pasos Al Costado' FROM set_11_4
  RETURNING id
)
, votes_11_4_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_4_8.id, v.voter_name, v.score
  FROM song_11_4_8,
  (VALUES ('Francisco', 8.5), ('Mario', 7.0), ('Jorge A.', 7.0), ('Carlos', 7.0), ('Giusse', 8.0), ('Julio', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_11_4_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'Natalia Lafourcade', 'Hasta la Raiz' FROM set_11_4
  RETURNING id
)
, votes_11_4_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_4_9.id, v.voter_name, v.score
  FROM song_11_4_9,
  (VALUES ('Francisco', 9.0), ('Mario', 8.5), ('Jorge A.', 8.0), ('Carlos', 8.5), ('Giusse', 8.0), ('Julio', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_11_4_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'Mumford & Sons', 'I Will Wait' FROM set_11_4
  RETURNING id
)
, votes_11_4_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_4_10.id, v.voter_name, v.score
  FROM song_11_4_10,
  (VALUES ('Francisco', 8.0), ('Mario', 6.5), ('Jorge A.', 7.0), ('Carlos', 6.5), ('Giusse', 7.0), ('Julio', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_11_4_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'Evanescence', 'My Immortal' FROM set_11_4
  RETURNING id
)
, votes_11_4_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_4_11.id, v.voter_name, v.score
  FROM song_11_4_11,
  (VALUES ('Francisco', 8.5), ('Mario', 8.5), ('Jorge A.', 8.5), ('Carlos', 7.5), ('Giusse', 8.0), ('Julio', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_11_4_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'Travelling Wildburys', 'Handle With Care' FROM set_11_4
  RETURNING id
)
, votes_11_4_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_4_12.id, v.voter_name, v.score
  FROM song_11_4_12,
  (VALUES ('Francisco', 9.0), ('Mario', 9.5), ('Jorge A.', 7.5), ('Carlos', 10.0), ('Giusse', 9.0), ('Julio', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_11_4_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'Morrisey', 'The Last of the Famous International Playboys' FROM set_11_4
  RETURNING id
)
, votes_11_4_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_4_13.id, v.voter_name, v.score
  FROM song_11_4_13,
  (VALUES ('Francisco', 8.5), ('Mario', 7.5), ('Jorge A.', 7.5), ('Carlos', 9.0), ('Giusse', 8.0), ('Julio', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_11_4_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'Bee Gees', 'Alone' FROM set_11_4
  RETURNING id
)
, votes_11_4_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_4_14.id, v.voter_name, v.score
  FROM song_11_4_14,
  (VALUES ('Francisco', 8.5), ('Mario', 9.0), ('Jorge A.', 9.0), ('Carlos', 9.0), ('Giusse', 8.5), ('Julio', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_11_4_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'Daryl Hall & John Oates', 'out of touch' FROM set_11_4
  RETURNING id
)
, votes_11_4_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_4_15.id, v.voter_name, v.score
  FROM song_11_4_15,
  (VALUES ('Francisco', 8.5), ('Mario', 8.5), ('Jorge A.', 8.5), ('Carlos', 7.5), ('Giusse', 8.5), ('Julio', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_11_4_16 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 16, 'Cafuné', 'Tek It' FROM set_11_4
  RETURNING id
)
, votes_11_4_16 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_4_16.id, v.voter_name, v.score
  FROM song_11_4_16,
  (VALUES ('Francisco', 7.5), ('Mario', 7.0), ('Jorge A.', 7.5), ('Carlos', 7.0), ('Giusse', 8.5), ('Julio', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_11_4_17 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 17, 'The Stone Roses', 'I Wanna Be Adored' FROM set_11_4
  RETURNING id
)
, votes_11_4_17 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_4_17.id, v.voter_name, v.score
  FROM song_11_4_17,
  (VALUES ('Francisco', 9.0), ('Mario', 9.0), ('Jorge A.', 8.0), ('Carlos', 7.5), ('Giusse', 8.0), ('Julio', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_11_4_18 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 18, 'Fitz and The Tantrums', 'Out of My League' FROM set_11_4
  RETURNING id
)
, votes_11_4_18 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_4_18.id, v.voter_name, v.score
  FROM song_11_4_18,
  (VALUES ('Francisco', 8.5), ('Mario', 8.0), ('Jorge A.', 7.5), ('Carlos', 7.5), ('Giusse', 8.0), ('Julio', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_11_4_19 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 19, 'Robert Palmer', 'Addicted To Love' FROM set_11_4
  RETURNING id
)
, votes_11_4_19 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_4_19.id, v.voter_name, v.score
  FROM song_11_4_19,
  (VALUES ('Francisco', 9.0), ('Mario', 7.5), ('Jorge A.', 7.5), ('Carlos', 8.0), ('Giusse', 7.5), ('Julio', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, set_11_5 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 5, 'Set Patrick' FROM s11
  RETURNING id
)
, song_11_5_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'Chick Corea', 'SPAIN' FROM set_11_5
  RETURNING id
)
, votes_11_5_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_5_0.id, v.voter_name, v.score
  FROM song_11_5_0,
  (VALUES ('Carlos', 6.0), ('Mauricio O.', 7.0), ('Gino', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_11_5_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'Carole King / James Taylor', 'You''ve got a friend' FROM set_11_5
  RETURNING id
)
, votes_11_5_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_5_1.id, v.voter_name, v.score
  FROM song_11_5_1,
  (VALUES ('Carlos', 7.0), ('Mauricio O.', 7.5), ('Gino', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_11_5_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'Jimi Hnedrix', 'Foxey Lady (Dama astuta)' FROM set_11_5
  RETURNING id
)
, votes_11_5_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_5_2.id, v.voter_name, v.score
  FROM song_11_5_2,
  (VALUES ('Carlos', 7.0), ('Mauricio O.', 8.5), ('Gino', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_11_5_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Yuri Honing Trio', 'Walking on the moon' FROM set_11_5
  RETURNING id
)
, votes_11_5_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_5_3.id, v.voter_name, v.score
  FROM song_11_5_3,
  (VALUES ('Carlos', 6.5), ('Mauricio O.', 6.0), ('Gino', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_11_5_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'Pink Floyd', 'Another Brick in The Wall Part 1 Part 2 Part 3' FROM set_11_5
  RETURNING id
)
, votes_11_5_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_5_4.id, v.voter_name, v.score
  FROM song_11_5_4,
  (VALUES ('Carlos', 7.5), ('Mauricio O.', 6.0), ('Gino', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_11_5_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'Jose Feliciano / Carlos Santana', 'Samba pa ti' FROM set_11_5
  RETURNING id
)
, votes_11_5_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_5_5.id, v.voter_name, v.score
  FROM song_11_5_5,
  (VALUES ('Carlos', 8.0), ('Mauricio O.', 8.5), ('Gino', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_11_5_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'U2', 'Picture of you' FROM set_11_5
  RETURNING id
)
, votes_11_5_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_5_6.id, v.voter_name, v.score
  FROM song_11_5_6,
  (VALUES ('Carlos', 7.0), ('Mauricio O.', 7.0), ('Gino', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_11_5_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'La Pastillas del Abuelo (Grupo Argentino(', 'Loco por volverla a ver' FROM set_11_5
  RETURNING id
)
, votes_11_5_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_5_7.id, v.voter_name, v.score
  FROM song_11_5_7,
  (VALUES ('Carlos', 6.5), ('Mauricio O.', 6.5), ('Gino', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_11_5_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'Erick Clapton', 'Circus' FROM set_11_5
  RETURNING id
)
, votes_11_5_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_5_8.id, v.voter_name, v.score
  FROM song_11_5_8,
  (VALUES ('Carlos', 6.5), ('Mauricio O.', 8.5), ('Gino', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_11_5_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'Erick Clapton', 'Tears in Heaven' FROM set_11_5
  RETURNING id
)
, votes_11_5_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_5_9.id, v.voter_name, v.score
  FROM song_11_5_9,
  (VALUES ('Carlos', 8.0), ('Mauricio O.', 9.5), ('Gino', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_11_5_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'Led Zeppelin', 'Over The Hills and Far Away' FROM set_11_5
  RETURNING id
)
, votes_11_5_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_5_10.id, v.voter_name, v.score
  FROM song_11_5_10,
  (VALUES ('Carlos', 7.5), ('Mauricio O.', 8.5), ('Gino', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_11_5_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'Fito Paez', 'La Rueda Magica' FROM set_11_5
  RETURNING id
)
, votes_11_5_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_5_11.id, v.voter_name, v.score
  FROM song_11_5_11,
  (VALUES ('Carlos', 7.0), ('Mauricio O.', 7.5), ('Gino', 5.0)) AS v(voter_name, score)
  RETURNING id
)
, song_11_5_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'Gerald Rafferty', 'Baker Street' FROM set_11_5
  RETURNING id
)
, votes_11_5_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_5_12.id, v.voter_name, v.score
  FROM song_11_5_12,
  (VALUES ('Carlos', 7.0), ('Mauricio O.', 7.5), ('Gino', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_11_5_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'Jeff Beck', 'Hammerhead' FROM set_11_5
  RETURNING id
)
, votes_11_5_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_5_13.id, v.voter_name, v.score
  FROM song_11_5_13,
  (VALUES ('Carlos', 7.5), ('Mauricio O.', 6.5), ('Gino', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_11_5_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'Betty Wright', 'I love the way you love' FROM set_11_5
  RETURNING id
)
, votes_11_5_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_5_14.id, v.voter_name, v.score
  FROM song_11_5_14,
  (VALUES ('Carlos', 7.0), ('Mauricio O.', 8.0), ('Gino', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_11_5_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'Conociendo Rusia', 'Jaula de Oro' FROM set_11_5
  RETURNING id
)
, votes_11_5_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_5_15.id, v.voter_name, v.score
  FROM song_11_5_15,
  (VALUES ('Carlos', 7.5), ('Mauricio O.', 7.0), ('Gino', 5.0)) AS v(voter_name, score)
  RETURNING id
)
, song_11_5_16 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 16, 'Radiohead', 'Paranoid' FROM set_11_5
  RETURNING id
)
, votes_11_5_16 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_5_16.id, v.voter_name, v.score
  FROM song_11_5_16,
  (VALUES ('Carlos', 8.0), ('Mauricio O.', 8.5), ('Gino', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_11_5_17 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 17, 'Eagles', 'Hotel California' FROM set_11_5
  RETURNING id
)
, votes_11_5_17 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_5_17.id, v.voter_name, v.score
  FROM song_11_5_17,
  (VALUES ('Carlos', 8.5), ('Mauricio O.', 9.0), ('Gino', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_11_5_18 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 18, 'Juan Diego Torres', 'Tamalito' FROM set_11_5
  RETURNING id
)
, votes_11_5_18 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_5_18.id, v.voter_name, v.score
  FROM song_11_5_18,
  (VALUES ('Carlos', 7.0), ('Mauricio O.', 7.0), ('Gino', 5.0)) AS v(voter_name, score)
  RETURNING id
)
, song_11_5_19 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 19, 'Frankie Ruiz', 'Mi   Libertad' FROM set_11_5
  RETURNING id
)
, votes_11_5_19 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_11_5_19.id, v.voter_name, v.score
  FROM song_11_5_19,
  (VALUES ('Carlos', 6.0), ('Mauricio O.', 8.5), ('Gino', 4.5)) AS v(voter_name, score)
  RETURNING id
)
SELECT id FROM s11;

WITH s12 AS (
  INSERT INTO cyc_sessions (session_num, host, date, attendees, input_mode, sets_count, songs_count, complete)
  VALUES (12, 'Temporada 12', '2025-08-01', ARRAY["Carlos", "Daniel", "Giusse", "Juan Carlos", "Julio", "Mario", "Mauricio O.", "Patrick"]::text[], 'host', 2, 20, true)
  RETURNING id
)
, set_12_0 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 0, 'Set Carlos' FROM s12
  RETURNING id
)
, song_12_0_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'Stevie wonder', 'Superstition' FROM set_12_0
  RETURNING id
)
, votes_12_0_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_12_0_0.id, v.voter_name, v.score
  FROM song_12_0_0,
  (VALUES ('Mario', 9.0), ('Daniel', 8.0), ('Giusse', 8.0), ('Mauricio O.', 8.0), ('Julio', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_12_0_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'A flock of seagulls', 'Transfer Affection' FROM set_12_0
  RETURNING id
)
, votes_12_0_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_12_0_1.id, v.voter_name, v.score
  FROM song_12_0_1,
  (VALUES ('Mario', 7.5), ('Daniel', 7.5), ('Giusse', 7.5), ('Mauricio O.', 8.0), ('Julio', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_12_0_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'Artemas', 'I like the way you kiss me' FROM set_12_0
  RETURNING id
)
, votes_12_0_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_12_0_2.id, v.voter_name, v.score
  FROM song_12_0_2,
  (VALUES ('Mario', 7.0), ('Daniel', 6.5), ('Giusse', 7.0), ('Mauricio O.', 8.5), ('Julio', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_12_0_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'The beatles', 'If I fell' FROM set_12_0
  RETURNING id
)
, votes_12_0_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_12_0_3.id, v.voter_name, v.score
  FROM song_12_0_3,
  (VALUES ('Mario', 8.5), ('Daniel', 7.0), ('Giusse', 7.0), ('Mauricio O.', 9.0), ('Julio', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_12_0_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'Chic', 'Le Freak' FROM set_12_0
  RETURNING id
)
, votes_12_0_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_12_0_4.id, v.voter_name, v.score
  FROM song_12_0_4,
  (VALUES ('Mario', 8.5), ('Daniel', 8.0), ('Giusse', 8.5), ('Mauricio O.', 8.5), ('Julio', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_12_0_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'Maneskin', 'Beggin' FROM set_12_0
  RETURNING id
)
, votes_12_0_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_12_0_5.id, v.voter_name, v.score
  FROM song_12_0_5,
  (VALUES ('Mario', 8.5), ('Daniel', 8.0), ('Giusse', 8.5), ('Mauricio O.', 8.5), ('Julio', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_12_0_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'Neil Young', 'Heart of Gold' FROM set_12_0
  RETURNING id
)
, votes_12_0_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_12_0_6.id, v.voter_name, v.score
  FROM song_12_0_6,
  (VALUES ('Mario', 9.5), ('Daniel', 8.0), ('Giusse', 8.5), ('Mauricio O.', 9.0), ('Julio', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_12_0_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'The Church', 'Reptile' FROM set_12_0
  RETURNING id
)
, votes_12_0_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_12_0_7.id, v.voter_name, v.score
  FROM song_12_0_7,
  (VALUES ('Mario', 8.5), ('Daniel', 7.5), ('Giusse', 8.0), ('Mauricio O.', 6.0), ('Julio', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_12_0_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'The driver area', 'Get off my phone' FROM set_12_0
  RETURNING id
)
, votes_12_0_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_12_0_8.id, v.voter_name, v.score
  FROM song_12_0_8,
  (VALUES ('Mario', 7.0), ('Daniel', 6.5), ('Giusse', 7.0), ('Mauricio O.', 6.5), ('Julio', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_12_0_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'cyndi lauper', 'I drove all night' FROM set_12_0
  RETURNING id
)
, votes_12_0_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_12_0_9.id, v.voter_name, v.score
  FROM song_12_0_9,
  (VALUES ('Mario', 8.5), ('Daniel', 9.0), ('Giusse', 7.5), ('Mauricio O.', 9.0), ('Julio', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_12_0_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'Bee Gees', 'Islands in the stream' FROM set_12_0
  RETURNING id
)
, votes_12_0_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_12_0_10.id, v.voter_name, v.score
  FROM song_12_0_10,
  (VALUES ('Mario', 9.5), ('Daniel', 8.0), ('Giusse', 8.0), ('Mauricio O.', 8.5), ('Julio', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_12_0_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'Patrick Hernandez', 'Born to be alive' FROM set_12_0
  RETURNING id
)
, votes_12_0_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_12_0_11.id, v.voter_name, v.score
  FROM song_12_0_11,
  (VALUES ('Mario', 8.0), ('Daniel', 7.5), ('Giusse', 8.0), ('Mauricio O.', 7.5), ('Julio', 6.5)) AS v(voter_name, score)
  RETURNING id
)
, song_12_0_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'Bandalos Chinos', 'El Ritmo' FROM set_12_0
  RETURNING id
)
, votes_12_0_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_12_0_12.id, v.voter_name, v.score
  FROM song_12_0_12,
  (VALUES ('Mario', 8.0), ('Daniel', 7.0), ('Giusse', 8.0), ('Mauricio O.', 7.5), ('Julio', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_12_0_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'Motorama', 'Heavy wave' FROM set_12_0
  RETURNING id
)
, votes_12_0_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_12_0_13.id, v.voter_name, v.score
  FROM song_12_0_13,
  (VALUES ('Mario', 9.5), ('Daniel', 7.0), ('Giusse', 8.0), ('Mauricio O.', 7.0), ('Julio', 5.0)) AS v(voter_name, score)
  RETURNING id
)
, song_12_0_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'Los kipus', 'Huye de mi' FROM set_12_0
  RETURNING id
)
, votes_12_0_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_12_0_14.id, v.voter_name, v.score
  FROM song_12_0_14,
  (VALUES ('Mario', 9.0), ('Daniel', 8.0), ('Giusse', 7.5), ('Mauricio O.', 8.0), ('Julio', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_12_0_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'Radio Head', 'Creep' FROM set_12_0
  RETURNING id
)
, votes_12_0_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_12_0_15.id, v.voter_name, v.score
  FROM song_12_0_15,
  (VALUES ('Mario', 10.0), ('Daniel', 9.0), ('Giusse', 9.5), ('Mauricio O.', 8.0), ('Julio', 10.0)) AS v(voter_name, score)
  RETURNING id
)
, song_12_0_16 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 16, 'When in Rome', 'The promise' FROM set_12_0
  RETURNING id
)
, votes_12_0_16 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_12_0_16.id, v.voter_name, v.score
  FROM song_12_0_16,
  (VALUES ('Mario', 9.0), ('Daniel', 8.0), ('Giusse', 8.5), ('Mauricio O.', 7.5), ('Julio', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_12_0_17 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 17, 'Sextile', 'Contortion' FROM set_12_0
  RETURNING id
)
, votes_12_0_17 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_12_0_17.id, v.voter_name, v.score
  FROM song_12_0_17,
  (VALUES ('Mario', 8.0), ('Daniel', 7.5), ('Giusse', 8.0), ('Mauricio O.', 7.5), ('Julio', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_12_0_18 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 18, 'Marmalade', 'Reflections of my Life' FROM set_12_0
  RETURNING id
)
, votes_12_0_18 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_12_0_18.id, v.voter_name, v.score
  FROM song_12_0_18,
  (VALUES ('Mario', 9.0), ('Daniel', 8.0), ('Giusse', 8.5), ('Mauricio O.', 9.5), ('Julio', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_12_0_19 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 19, 'Shocking blue', 'Demon Lover' FROM set_12_0
  RETURNING id
)
, votes_12_0_19 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_12_0_19.id, v.voter_name, v.score
  FROM song_12_0_19,
  (VALUES ('Mario', 10.0), ('Daniel', 9.0), ('Giusse', 8.0), ('Mauricio O.', 9.0), ('Julio', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, set_12_1 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 1, 'Set Giuse' FROM s12
  RETURNING id
)
, song_12_1_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'Hilario Durand', 'Night in Tunisia' FROM set_12_1
  RETURNING id
)
, votes_12_1_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_12_1_0.id, v.voter_name, v.score
  FROM song_12_1_0,
  (VALUES ('Mario', 8.5), ('Daniel', 7.5), ('Carlos', 6.0), ('Patrick', 8.0), ('Juan Carlos', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_12_1_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'Coldplay', 'Speed of sound' FROM set_12_1
  RETURNING id
)
, votes_12_1_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_12_1_1.id, v.voter_name, v.score
  FROM song_12_1_1,
  (VALUES ('Mario', 8.5), ('Daniel', 8.0), ('Carlos', 7.0), ('Patrick', 8.0), ('Juan Carlos', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_12_1_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'Supertramp', 'My kind of lady' FROM set_12_1
  RETURNING id
)
, votes_12_1_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_12_1_2.id, v.voter_name, v.score
  FROM song_12_1_2,
  (VALUES ('Mario', 9.0), ('Daniel', 7.5), ('Carlos', 7.5), ('Patrick', 9.0), ('Juan Carlos', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_12_1_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Alan Parsons', 'I would not want to be like you' FROM set_12_1
  RETURNING id
)
, votes_12_1_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_12_1_3.id, v.voter_name, v.score
  FROM song_12_1_3,
  (VALUES ('Mario', 9.0), ('Daniel', 8.0), ('Carlos', 8.5), ('Patrick', 8.0), ('Juan Carlos', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_12_1_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'Barbra Streisand', 'Someone I used to love' FROM set_12_1
  RETURNING id
)
, votes_12_1_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_12_1_4.id, v.voter_name, v.score
  FROM song_12_1_4,
  (VALUES ('Mario', 8.0), ('Daniel', 7.0), ('Carlos', 6.5), ('Patrick', 8.0), ('Juan Carlos', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_12_1_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'Neil Diamond', 'September morning' FROM set_12_1
  RETURNING id
)
, votes_12_1_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_12_1_5.id, v.voter_name, v.score
  FROM song_12_1_5,
  (VALUES ('Mario', 8.0), ('Daniel', 7.5), ('Carlos', 9.0), ('Patrick', 9.0), ('Juan Carlos', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_12_1_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'Lou Rawls', 'See you when I get there' FROM set_12_1
  RETURNING id
)
, votes_12_1_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_12_1_6.id, v.voter_name, v.score
  FROM song_12_1_6,
  (VALUES ('Mario', 7.0), ('Daniel', 7.5), ('Carlos', 7.5), ('Patrick', 7.0), ('Juan Carlos', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_12_1_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'Toto', 'You''ll supply the night' FROM set_12_1
  RETURNING id
)
, votes_12_1_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_12_1_7.id, v.voter_name, v.score
  FROM song_12_1_7,
  (VALUES ('Mario', 8.5), ('Daniel', 7.5), ('Carlos', 8.0), ('Patrick', 8.0), ('Juan Carlos', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_12_1_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'Fleetwood Mac', 'You make loving fun' FROM set_12_1
  RETURNING id
)
, votes_12_1_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_12_1_8.id, v.voter_name, v.score
  FROM song_12_1_8,
  (VALUES ('Mario', 9.5), ('Daniel', 8.0), ('Carlos', 9.0), ('Patrick', 8.0), ('Juan Carlos', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_12_1_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'America', 'A horse with no name' FROM set_12_1
  RETURNING id
)
, votes_12_1_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_12_1_9.id, v.voter_name, v.score
  FROM song_12_1_9,
  (VALUES ('Mario', 8.5), ('Daniel', 7.5), ('Carlos', 7.5), ('Patrick', 8.0), ('Juan Carlos', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_12_1_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'Nancy Sinatra', 'These boots are made for waking' FROM set_12_1
  RETURNING id
)
, votes_12_1_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_12_1_10.id, v.voter_name, v.score
  FROM song_12_1_10,
  (VALUES ('Mario', 7.5), ('Daniel', 7.5), ('Carlos', 8.0), ('Patrick', 9.0), ('Juan Carlos', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_12_1_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'Elthon Jhon', 'Friends' FROM set_12_1
  RETURNING id
)
, votes_12_1_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_12_1_11.id, v.voter_name, v.score
  FROM song_12_1_11,
  (VALUES ('Mario', 8.0), ('Daniel', 7.0), ('Carlos', 7.0), ('Patrick', 7.0), ('Juan Carlos', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_12_1_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'Jose Feliciano', 'Light my fire' FROM set_12_1
  RETURNING id
)
, votes_12_1_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_12_1_12.id, v.voter_name, v.score
  FROM song_12_1_12,
  (VALUES ('Mario', 7.0), ('Daniel', 6.5), ('Carlos', 7.0), ('Patrick', 7.0), ('Juan Carlos', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_12_1_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'Queen', 'Love of my life' FROM set_12_1
  RETURNING id
)
, votes_12_1_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_12_1_13.id, v.voter_name, v.score
  FROM song_12_1_13,
  (VALUES ('Mario', 10.0), ('Daniel', 8.5), ('Carlos', 10.0), ('Patrick', 9.0), ('Juan Carlos', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_12_1_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'Cat Stevens', 'Moonshadow' FROM set_12_1
  RETURNING id
)
, votes_12_1_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_12_1_14.id, v.voter_name, v.score
  FROM song_12_1_14,
  (VALUES ('Mario', 8.0), ('Daniel', 8.0), ('Carlos', 6.5), ('Patrick', 7.0), ('Juan Carlos', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_12_1_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'Charly Garcia', 'No bombardeen Buenos Aires' FROM set_12_1
  RETURNING id
)
, votes_12_1_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_12_1_15.id, v.voter_name, v.score
  FROM song_12_1_15,
  (VALUES ('Mario', 7.0), ('Daniel', 7.0), ('Carlos', 8.0), ('Patrick', 7.5), ('Juan Carlos', 7.0)) AS v(voter_name, score)
  RETURNING id
)
SELECT id FROM s12;

WITH s13 AS (
  INSERT INTO cyc_sessions (session_num, host, date, attendees, input_mode, sets_count, songs_count, complete)
  VALUES (13, 'Temporada 13', '2026-02-01', ARRAY["Carlos", "Claudio", "Freddy", "Jorge A.", "Julio", "Mario", "Mauricio R.", "Patrick", "Ricardo V."]::text[], 'host', 2, 20, true)
  RETURNING id
)
, set_13_0 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 0, 'Set Gino' FROM s13
  RETURNING id
)
, song_13_0_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'Julian Cope', 'Charlotte Anne' FROM set_13_0
  RETURNING id
)
, votes_13_0_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_13_0_0.id, v.voter_name, v.score
  FROM song_13_0_0,
  (VALUES ('Mario', 6.5), ('Carlos', 7.5), ('Freddy', 7.0), ('Mauricio R.', 8.0), ('Patrick', 7.0), ('Julio', 7.5), ('Ricardo V.', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_13_0_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'Pete Townshend', 'Face the Face' FROM set_13_0
  RETURNING id
)
, votes_13_0_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_13_0_1.id, v.voter_name, v.score
  FROM song_13_0_1,
  (VALUES ('Mario', 8.5), ('Carlos', 8.0), ('Freddy', 8.0), ('Mauricio R.', 8.0), ('Patrick', 9.0), ('Julio', 9.0), ('Ricardo V.', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_13_0_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'Boy Harsher', 'Fate' FROM set_13_0
  RETURNING id
)
, votes_13_0_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_13_0_2.id, v.voter_name, v.score
  FROM song_13_0_2,
  (VALUES ('Mario', 8.5), ('Carlos', 8.0), ('Freddy', 7.5), ('Mauricio R.', 7.0), ('Patrick', 7.0), ('Julio', 7.0), ('Ricardo V.', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_13_0_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'The Wild Swans', 'Bible Dreams' FROM set_13_0
  RETURNING id
)
, votes_13_0_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_13_0_3.id, v.voter_name, v.score
  FROM song_13_0_3,
  (VALUES ('Mario', 8.5), ('Carlos', 8.0), ('Freddy', 8.0), ('Mauricio R.', 8.5), ('Patrick', 8.5), ('Julio', 7.0), ('Ricardo V.', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_13_0_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'Lola Young', 'Messy' FROM set_13_0
  RETURNING id
)
, votes_13_0_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_13_0_4.id, v.voter_name, v.score
  FROM song_13_0_4,
  (VALUES ('Mario', 9.0), ('Carlos', 7.0), ('Freddy', 6.5), ('Mauricio R.', 8.5), ('Patrick', 7.5), ('Julio', 8.0), ('Ricardo V.', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_13_0_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'You And I Part II Full', 'Fleetwood Mac' FROM set_13_0
  RETURNING id
)
, votes_13_0_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_13_0_5.id, v.voter_name, v.score
  FROM song_13_0_5,
  (VALUES ('Mario', 9.0), ('Carlos', 8.5), ('Freddy', 8.0), ('Mauricio R.', 8.0), ('Patrick', 8.0), ('Julio', 8.0), ('Ricardo V.', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_13_0_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'The Cult', 'She Sells Sanctuary' FROM set_13_0
  RETURNING id
)
, votes_13_0_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_13_0_6.id, v.voter_name, v.score
  FROM song_13_0_6,
  (VALUES ('Mario', 8.0), ('Carlos', 9.0), ('Freddy', 8.0), ('Mauricio R.', 9.0), ('Patrick', 8.5), ('Julio', 8.5), ('Ricardo V.', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_13_0_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'Nina Hagen', 'Ave Maria' FROM set_13_0
  RETURNING id
)
, votes_13_0_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_13_0_7.id, v.voter_name, v.score
  FROM song_13_0_7,
  (VALUES ('Mario', 8.5), ('Carlos', 9.0), ('Freddy', 10.0), ('Mauricio R.', 9.5), ('Patrick', 9.0), ('Julio', 9.0), ('Ricardo V.', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_13_0_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'Bruce Springsteen', 'O Mary Don''t You Weep' FROM set_13_0
  RETURNING id
)
, votes_13_0_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_13_0_8.id, v.voter_name, v.score
  FROM song_13_0_8,
  (VALUES ('Mario', 8.0), ('Carlos', 7.0), ('Freddy', 6.0), ('Mauricio R.', 6.0), ('Patrick', 9.0), ('Julio', 8.0), ('Ricardo V.', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_13_0_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'Nation Of Language', 'Weak In Your Light' FROM set_13_0
  RETURNING id
)
, votes_13_0_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_13_0_9.id, v.voter_name, v.score
  FROM song_13_0_9,
  (VALUES ('Mario', 8.0), ('Carlos', 8.5), ('Freddy', 7.0), ('Mauricio R.', 8.5), ('Patrick', 8.0), ('Julio', 6.0), ('Ricardo V.', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_13_0_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'Arcade Fire', 'Sprawl II (Mountains Beyond Mountains)' FROM set_13_0
  RETURNING id
)
, votes_13_0_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_13_0_10.id, v.voter_name, v.score
  FROM song_13_0_10,
  (VALUES ('Mario', 8.5), ('Carlos', 8.0), ('Freddy', 7.0), ('Mauricio R.', 7.0), ('Patrick', 8.0), ('Julio', 7.5), ('Ricardo V.', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_13_0_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'The Clash', 'Hitsville UK' FROM set_13_0
  RETURNING id
)
, votes_13_0_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_13_0_11.id, v.voter_name, v.score
  FROM song_13_0_11,
  (VALUES ('Mario', 8.5), ('Carlos', 7.5), ('Freddy', 7.5), ('Mauricio R.', 7.5), ('Patrick', 8.0), ('Julio', 7.5), ('Ricardo V.', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_13_0_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'Undercover (Of The Night)', 'The Rolling Stones' FROM set_13_0
  RETURNING id
)
, votes_13_0_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_13_0_12.id, v.voter_name, v.score
  FROM song_13_0_12,
  (VALUES ('Mario', 10.0), ('Carlos', 8.0), ('Freddy', 8.5), ('Mauricio R.', 9.5), ('Patrick', 10.0), ('Julio', 9.0), ('Ricardo V.', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_13_0_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'The Smiths', 'Oscillate Wildly' FROM set_13_0
  RETURNING id
)
, votes_13_0_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_13_0_13.id, v.voter_name, v.score
  FROM song_13_0_13,
  (VALUES ('Mario', 8.5), ('Carlos', 7.5), ('Freddy', 8.0), ('Mauricio R.', 7.0), ('Patrick', 8.0), ('Julio', 8.5), ('Ricardo V.', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_13_0_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'Temples', 'Keep In The Dark' FROM set_13_0
  RETURNING id
)
, votes_13_0_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_13_0_14.id, v.voter_name, v.score
  FROM song_13_0_14,
  (VALUES ('Mario', 6.5), ('Carlos', 6.5), ('Freddy', 7.5), ('Mauricio R.', 6.5), ('Patrick', 0.0), ('Julio', 7.0), ('Ricardo V.', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_13_0_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'Daniel Sentacruz Ensemble', 'Linda Bella Linda' FROM set_13_0
  RETURNING id
)
, votes_13_0_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_13_0_15.id, v.voter_name, v.score
  FROM song_13_0_15,
  (VALUES ('Mario', 8.5), ('Carlos', 8.0), ('Freddy', 8.5), ('Mauricio R.', 9.0), ('Patrick', 0.0), ('Julio', 8.5), ('Ricardo V.', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_13_0_16 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 16, 'The Kills', 'Getting Down' FROM set_13_0
  RETURNING id
)
, votes_13_0_16 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_13_0_16.id, v.voter_name, v.score
  FROM song_13_0_16,
  (VALUES ('Mario', 6.5), ('Carlos', 7.5), ('Freddy', 6.5), ('Mauricio R.', 6.0), ('Patrick', 0.0), ('Julio', 6.5), ('Ricardo V.', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_13_0_17 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 17, 'Depeche Mode', 'Halo' FROM set_13_0
  RETURNING id
)
, votes_13_0_17 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_13_0_17.id, v.voter_name, v.score
  FROM song_13_0_17,
  (VALUES ('Mario', 9.0), ('Carlos', 9.5), ('Freddy', 8.5), ('Mauricio R.', 8.0), ('Patrick', 0.0), ('Julio', 7.5), ('Ricardo V.', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_13_0_18 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 18, 'Celebrate The Nun', 'Ordinary World' FROM set_13_0
  RETURNING id
)
, votes_13_0_18 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_13_0_18.id, v.voter_name, v.score
  FROM song_13_0_18,
  (VALUES ('Mario', 7.0), ('Carlos', 7.5), ('Freddy', 7.0), ('Mauricio R.', 8.0), ('Patrick', 0.0), ('Julio', 7.5), ('Ricardo V.', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_13_0_19 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 19, 'Turnstile', 'Seein'' Stars' FROM set_13_0
  RETURNING id
)
, votes_13_0_19 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_13_0_19.id, v.voter_name, v.score
  FROM song_13_0_19,
  (VALUES ('Mario', 7.0), ('Carlos', 7.5), ('Freddy', 7.0), ('Mauricio R.', 7.5), ('Patrick', 0.0), ('Julio', 7.5), ('Ricardo V.', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, set_13_1 AS (
  INSERT INTO cyc_sets (session_id, set_index, label)
  SELECT id, 1, 'Set Julio' FROM s13
  RETURNING id
)
, song_13_1_0 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 0, 'Mike Oldfield', 'Foreign Affair' FROM set_13_1
  RETURNING id
)
, votes_13_1_0 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_13_1_0.id, v.voter_name, v.score
  FROM song_13_1_0,
  (VALUES ('Mario', 7.5), ('Jorge A.', 7.5), ('Carlos', 8.5), ('Freddy', 8.0), ('Mauricio R.', 8.0), ('Patrick', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_13_1_1 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 1, 'Jean Michel Jarre', 'Oxygene Pt.17' FROM set_13_1
  RETURNING id
)
, votes_13_1_1 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_13_1_1.id, v.voter_name, v.score
  FROM song_13_1_1,
  (VALUES ('Mario', 8.5), ('Jorge A.', 8.0), ('Carlos', 7.5), ('Freddy', 8.0), ('Mauricio R.', 8.0), ('Patrick', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_13_1_2 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 2, 'Gary Numan', 'The Aircrash Bureu' FROM set_13_1
  RETURNING id
)
, votes_13_1_2 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_13_1_2.id, v.voter_name, v.score
  FROM song_13_1_2,
  (VALUES ('Mario', 8.0), ('Jorge A.', 6.5), ('Carlos', 7.5), ('Freddy', 7.0), ('Mauricio R.', 7.0), ('Patrick', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_13_1_3 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 3, 'Jon & Vangelis', 'I''ll find my way home' FROM set_13_1
  RETURNING id
)
, votes_13_1_3 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_13_1_3.id, v.voter_name, v.score
  FROM song_13_1_3,
  (VALUES ('Mario', 9.0), ('Jorge A.', 6.5), ('Carlos', 8.0), ('Freddy', 8.0), ('Mauricio R.', 8.0), ('Patrick', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_13_1_4 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 4, 'The Moody Blues', 'Talking out of Turn' FROM set_13_1
  RETURNING id
)
, votes_13_1_4 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_13_1_4.id, v.voter_name, v.score
  FROM song_13_1_4,
  (VALUES ('Mario', 9.0), ('Jorge A.', 7.5), ('Carlos', 9.0), ('Freddy', 8.0), ('Mauricio R.', 8.5), ('Patrick', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_13_1_5 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 5, 'Invisible', 'Dios de la Adolescencia' FROM set_13_1
  RETURNING id
)
, votes_13_1_5 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_13_1_5.id, v.voter_name, v.score
  FROM song_13_1_5,
  (VALUES ('Mario', 6.5), ('Jorge A.', 7.0), ('Carlos', 6.5), ('Freddy', 7.0), ('Mauricio R.', 5.0), ('Patrick', 6.0)) AS v(voter_name, score)
  RETURNING id
)
, song_13_1_6 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 6, 'La Maquina de Hacer Pajaros', 'Hipercandombe' FROM set_13_1
  RETURNING id
)
, votes_13_1_6 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_13_1_6.id, v.voter_name, v.score
  FROM song_13_1_6,
  (VALUES ('Mario', 6.0), ('Jorge A.', 6.0), ('Carlos', 6.5), ('Freddy', 6.0), ('Mauricio R.', 7.5), ('Patrick', 7.0)) AS v(voter_name, score)
  RETURNING id
)
, song_13_1_7 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 7, 'Charly Garcia', 'La ruta del tentempie' FROM set_13_1
  RETURNING id
)
, votes_13_1_7 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_13_1_7.id, v.voter_name, v.score
  FROM song_13_1_7,
  (VALUES ('Mario', 8.0), ('Jorge A.', 8.0), ('Carlos', 7.0), ('Freddy', 7.0), ('Mauricio R.', 8.0), ('Patrick', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_13_1_8 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 8, 'Soda Stereo', '(En) el Septimo Dia' FROM set_13_1
  RETURNING id
)
, votes_13_1_8 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_13_1_8.id, v.voter_name, v.score
  FROM song_13_1_8,
  (VALUES ('Mario', 7.5), ('Jorge A.', 9.5), ('Carlos', 7.5), ('Freddy', 8.0), ('Mauricio R.', 8.0), ('Patrick', 7.0), ('Claudio', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_13_1_9 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 9, 'Rosalia', 'Reliquia' FROM set_13_1
  RETURNING id
)
, votes_13_1_9 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_13_1_9.id, v.voter_name, v.score
  FROM song_13_1_9,
  (VALUES ('Mario', 8.5), ('Jorge A.', 7.0), ('Carlos', 8.0), ('Freddy', 8.0), ('Mauricio R.', 8.0), ('Patrick', 8.5), ('Claudio', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_13_1_10 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 10, 'Supertramp', 'An Awful Thing to Waste' FROM set_13_1
  RETURNING id
)
, votes_13_1_10 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_13_1_10.id, v.voter_name, v.score
  FROM song_13_1_10,
  (VALUES ('Mario', 7.5), ('Jorge A.', 8.0), ('Carlos', 8.5), ('Freddy', 8.0), ('Mauricio R.', 8.5), ('Patrick', 8.5), ('Claudio', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_13_1_11 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 11, 'Phideux', 'A curse of Miracles' FROM set_13_1
  RETURNING id
)
, votes_13_1_11 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_13_1_11.id, v.voter_name, v.score
  FROM song_13_1_11,
  (VALUES ('Mario', 8.0), ('Jorge A.', 7.5), ('Carlos', 8.5), ('Freddy', 8.5), ('Mauricio R.', 9.0), ('Patrick', 9.0), ('Claudio', 7.5)) AS v(voter_name, score)
  RETURNING id
)
, song_13_1_12 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 12, 'Meer', 'Chain of Changes' FROM set_13_1
  RETURNING id
)
, votes_13_1_12 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_13_1_12.id, v.voter_name, v.score
  FROM song_13_1_12,
  (VALUES ('Mario', 7.0), ('Jorge A.', 8.0), ('Carlos', 7.5), ('Freddy', 7.5), ('Mauricio R.', 7.0), ('Patrick', 8.5), ('Claudio', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_13_1_13 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 13, 'Steve Hackett', 'Enter the Ring' FROM set_13_1
  RETURNING id
)
, votes_13_1_13 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_13_1_13.id, v.voter_name, v.score
  FROM song_13_1_13,
  (VALUES ('Mario', 7.5), ('Jorge A.', 7.5), ('Carlos', 7.0), ('Freddy', 7.0), ('Mauricio R.', 8.0), ('Patrick', 8.0), ('Claudio', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_13_1_14 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 14, 'Genesis', 'Follow you follow me' FROM set_13_1
  RETURNING id
)
, votes_13_1_14 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_13_1_14.id, v.voter_name, v.score
  FROM song_13_1_14,
  (VALUES ('Mario', 8.5), ('Jorge A.', 6.0), ('Carlos', 7.5), ('Freddy', 9.5), ('Mauricio R.', 9.0), ('Patrick', 8.0), ('Claudio', 8.0)) AS v(voter_name, score)
  RETURNING id
)
, song_13_1_15 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 15, 'Pink Floyd', 'Run Like Hell' FROM set_13_1
  RETURNING id
)
, votes_13_1_15 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_13_1_15.id, v.voter_name, v.score
  FROM song_13_1_15,
  (VALUES ('Mario', 9.0), ('Jorge A.', 8.0), ('Carlos', 9.0), ('Freddy', 8.0), ('Mauricio R.', 9.0), ('Patrick', 7.5), ('Claudio', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_13_1_16 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 16, 'The Beatles', 'A Day in the Life' FROM set_13_1
  RETURNING id
)
, votes_13_1_16 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_13_1_16.id, v.voter_name, v.score
  FROM song_13_1_16,
  (VALUES ('Mario', 9.5), ('Jorge A.', 7.5), ('Carlos', 9.0), ('Freddy', 10.0), ('Mauricio R.', 9.5), ('Patrick', 10.0), ('Claudio', 9.5)) AS v(voter_name, score)
  RETURNING id
)
, song_13_1_17 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 17, 'Rick Wakeman', 'Anne of cleves' FROM set_13_1
  RETURNING id
)
, votes_13_1_17 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_13_1_17.id, v.voter_name, v.score
  FROM song_13_1_17,
  (VALUES ('Mario', 8.5), ('Jorge A.', 7.0), ('Carlos', 7.0), ('Freddy', 7.0), ('Mauricio R.', 7.5), ('Patrick', 9.0), ('Claudio', 9.0)) AS v(voter_name, score)
  RETURNING id
)
, song_13_1_18 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 18, 'Emerson Lake & Palmer', 'Tank' FROM set_13_1
  RETURNING id
)
, votes_13_1_18 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_13_1_18.id, v.voter_name, v.score
  FROM song_13_1_18,
  (VALUES ('Mario', 7.0), ('Jorge A.', 6.5), ('Carlos', 6.5), ('Freddy', 7.0), ('Mauricio R.', 7.5), ('Patrick', 8.5), ('Claudio', 8.5)) AS v(voter_name, score)
  RETURNING id
)
, song_13_1_19 AS (
  INSERT INTO cyc_songs (set_id, song_index, artist, title)
  SELECT id, 19, 'Quella Vecchia Locanda', 'Un Giorno un Amico' FROM set_13_1
  RETURNING id
)
, votes_13_1_19 AS (
  INSERT INTO cyc_votes (song_id, voter_name, score)
  SELECT song_13_1_19.id, v.voter_name, v.score
  FROM song_13_1_19,
  (VALUES ('Mario', 8.0), ('Jorge A.', 7.0), ('Carlos', 7.0), ('Freddy', 7.5), ('Mauricio R.', 9.5), ('Patrick', 8.5), ('Claudio', 9.0)) AS v(voter_name, score)
  RETURNING id
)
SELECT id FROM s13;
COMMIT;