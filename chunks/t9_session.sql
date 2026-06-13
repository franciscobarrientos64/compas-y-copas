DO $$ DECLARE sess_id uuid;
BEGIN
  INSERT INTO cyc_sessions (session_num,host,date,attendees,input_mode,sets_count,songs_count,complete)
  VALUES (9,'Temporada 9','2024-11-01',ARRAY['Alex','Alex2','Carlos','Daniel','Francisco','Freddy','Gino','Giusse','Jorge A.','Julio','Lucho','Mario','Mauricio O.','Patrick']::text[],'host',3,20,true);
END $$;