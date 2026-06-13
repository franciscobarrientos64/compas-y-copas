DO $$ DECLARE sess_id uuid;
BEGIN
  INSERT INTO cyc_sessions (session_num,host,date,attendees,input_mode,sets_count,songs_count,complete)
  VALUES (8,'Temporada 8','2024-09-01',ARRAY['Alex2','Carlos','Daniel','Dante','Freddy','Gino','Giusse','Jorge A.','Julio','Mario','Mauricio O.','Mauricio R.','Patrick']::text[],'host',7,18,true);
END $$;