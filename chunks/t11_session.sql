DO $$ DECLARE sess_id uuid;
BEGIN
  INSERT INTO cyc_sessions (session_num,host,date,attendees,input_mode,sets_count,songs_count,complete)
  VALUES (11,'Temporada 11','2025-05-01',ARRAY['Alex','Carlos','Daniel','Francisco','Freddy','Gino','Giusse','Jorge A.','Julio','Kurt','Lucho','Mario','Mauricio O.','Mauricio R.','Patrick']::text[],'host',6,20,true);
END $$;