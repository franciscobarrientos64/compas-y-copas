DO $$ DECLARE sess_id uuid;
BEGIN
  INSERT INTO cyc_sessions (session_num,host,date,attendees,input_mode,sets_count,songs_count,complete)
  VALUES (6,'Temporada 6','2024-05-01',ARRAY['Alex','Carlos','Daniel','Freddy','Gino','Giusse','Jorge A.','Mario','Mauricio O.','Mauricio R.','Patrick']::text[],'host',9,20,true);
END $$;