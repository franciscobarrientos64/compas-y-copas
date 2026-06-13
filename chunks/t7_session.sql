DO $$ DECLARE sess_id uuid;
BEGIN
  INSERT INTO cyc_sessions (session_num,host,date,attendees,input_mode,sets_count,songs_count,complete)
  VALUES (7,'Temporada 7','2024-07-01',ARRAY['Carlos','Daniel','Freddy','Gino','Jorge A.','Mario','Mauricio O.','Mauricio R.','Patrick']::text[],'host',2,16,true);
END $$;