DO $$
DECLARE set_id uuid; song_id uuid; sess_id uuid;
BEGIN
  SELECT id INTO sess_id FROM cyc_sessions WHERE session_num=8;
  INSERT INTO cyc_sets (session_id,set_index,label) VALUES (sess_id,6,'Set Rafael') RETURNING id INTO set_id;
  INSERT INTO cyc_songs (set_id,song_index,artist,title) VALUES (set_id,0,'Bob Dylan','Like a Rolling Stones') RETURNING id INTO song_id;
  INSERT INTO cyc_songs (set_id,song_index,artist,title) VALUES (set_id,1,'BORNS','Electric Love') RETURNING id INTO song_id;
  INSERT INTO cyc_songs (set_id,song_index,artist,title) VALUES (set_id,2,'Dick Dale','Misirlou') RETURNING id INTO song_id;
  INSERT INTO cyc_songs (set_id,song_index,artist,title) VALUES (set_id,3,'Fink','Looking Too Closely') RETURNING id INTO song_id;
  INSERT INTO cyc_songs (set_id,song_index,artist,title) VALUES (set_id,4,'Gnarls Barkley','Crazy') RETURNING id INTO song_id;
  INSERT INTO cyc_songs (set_id,song_index,artist,title) VALUES (set_id,5,'Janis Joplin','Maybe') RETURNING id INTO song_id;
  INSERT INTO cyc_songs (set_id,song_index,artist,title) VALUES (set_id,6,'Johnny Rivers','Secret Agent Man') RETURNING id INTO song_id;
  INSERT INTO cyc_songs (set_id,song_index,artist,title) VALUES (set_id,7,'Mumford &Son','Guiding Light') RETURNING id INTO song_id;
  INSERT INTO cyc_songs (set_id,song_index,artist,title) VALUES (set_id,8,'Neon Trees','Animal') RETURNING id INTO song_id;
  INSERT INTO cyc_songs (set_id,song_index,artist,title) VALUES (set_id,9,'Saint Motel','Cold Cold Man') RETURNING id INTO song_id;
  INSERT INTO cyc_songs (set_id,song_index,artist,title) VALUES (set_id,10,'Simple Red','Fairground (+Sample)') RETURNING id INTO song_id;
  INSERT INTO cyc_songs (set_id,song_index,artist,title) VALUES (set_id,11,'The Alan Parsons Project','I Wouldn´t Want to Be Like You') RETURNING id INTO song_id;
  INSERT INTO cyc_songs (set_id,song_index,artist,title) VALUES (set_id,12,'The Animals','Don´t Let Me Be Misunderstood') RETURNING id INTO song_id;
  INSERT INTO cyc_songs (set_id,song_index,artist,title) VALUES (set_id,13,'The Beatles','While My Guitar Gently Weeps') RETURNING id INTO song_id;
  INSERT INTO cyc_songs (set_id,song_index,artist,title) VALUES (set_id,14,'The Cure','The Lovecats') RETURNING id INTO song_id;
  INSERT INTO cyc_songs (set_id,song_index,artist,title) VALUES (set_id,15,'The Rolling Stones','2000 Light Years from Home') RETURNING id INTO song_id;
END $$;