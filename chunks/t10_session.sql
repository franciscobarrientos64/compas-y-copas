DO $$ DECLARE sess_id uuid;
BEGIN
  INSERT INTO cyc_sessions (session_num,host,date,attendees,input_mode,sets_count,songs_count,complete)
  VALUES (10,'Temporada 10','2025-02-01',ARRAY['Alex','Carlos','Daniel','Francisco','Freddy','Gino','Giusse','Jorge A.','Julio','Lucho','Mario','Mauricio O.','Mauricio R.','Patrick']::text[],'host',7,20,true);
END $$;