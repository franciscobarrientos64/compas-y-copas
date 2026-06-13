DO $$ DECLARE sess_id uuid;
BEGIN
  INSERT INTO cyc_sessions (session_num,host,date,attendees,input_mode,sets_count,songs_count,complete)
  VALUES (1,'Temporada 1','2023-03-01',ARRAY['Carlos','Daniel','Francisco','Freddy','Gino','Giusse','Hernan','Jorge A.','Jose J','Lucho','Mario','Mauricio O.','Mauricio R.']::text[],'host',11,20,true);
END $$;