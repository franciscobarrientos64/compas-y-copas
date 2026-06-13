DO $$ DECLARE sess_id uuid;
BEGIN
  INSERT INTO cyc_sessions (session_num,host,date,attendees,input_mode,sets_count,songs_count,complete)
  VALUES (13,'Temporada 13','2026-02-01',ARRAY['Carlos','Claudio','Freddy','Jorge A.','Julio','Mario','Mauricio R.','Patrick','Ricardo V.']::text[],'host',2,20,true);
END $$;