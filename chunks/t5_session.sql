DO $$ DECLARE sess_id uuid;
BEGIN
  INSERT INTO cyc_sessions (session_num,host,date,attendees,input_mode,sets_count,songs_count,complete)
  VALUES (5,'Temporada 5','2024-02-01',ARRAY['Carlos','Daniel','Freddy','Gino','Jorge A.','Jose J','Lucho','Mauricio O.','Mauricio R.']::text[],'host',2,20,true);
END $$;