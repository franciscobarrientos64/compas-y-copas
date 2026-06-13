DO $$ DECLARE sess_id uuid;
BEGIN
  INSERT INTO cyc_sessions (session_num,host,date,attendees,input_mode,sets_count,songs_count,complete)
  VALUES (2,'Temporada 2','2023-06-01',ARRAY['Carlos','Daniel','Freddy','Giusse','Hernan','Jorge A.','Jose J','Lucho','Mario','Mauricio O.','Mauricio R.','Tono']::text[],'host',8,20,true);
END $$;