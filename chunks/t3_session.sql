DO $$ DECLARE sess_id uuid;
BEGIN
  INSERT INTO cyc_sessions (session_num,host,date,attendees,input_mode,sets_count,songs_count,complete)
  VALUES (3,'Temporada 3','2023-09-01',ARRAY['Carlos','Daniel','Francisco','Freddy','Gino','Giusse','Hernan','Jorge A.','Jose J','Lucho','Mario','Mauricio O.']::text[],'host',8,20,true);
END $$;