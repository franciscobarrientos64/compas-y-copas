DO $$ DECLARE sess_id uuid;
BEGIN
  INSERT INTO cyc_sessions (session_num,host,date,attendees,input_mode,sets_count,songs_count,complete)
  VALUES (12,'Temporada 12','2025-08-01',ARRAY['Carlos','Daniel','Giusse','Juan Carlos','Julio','Mario','Mauricio O.','Patrick']::text[],'host',2,20,true);
END $$;