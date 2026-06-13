DO $$ DECLARE sess_id uuid;
BEGIN
  INSERT INTO cyc_sessions (session_num,host,date,attendees,input_mode,sets_count,songs_count,complete)
  VALUES (4,'Temporada 4','2023-12-01',ARRAY['Carlos','Daniel','Giusse','Hernan','Jorge A.','Jose J','Lucho','Mario','Mauricio O.','Mauricio R.']::text[],'host',6,20,true);
END $$;