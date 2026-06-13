import { createClient } from '@supabase/supabase-js';
import { readFileSync } from 'fs';

const db = createClient(
  'https://jmkvphayyhwzootlybde.supabase.co',
  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Impta3ZwaGF5eWh3em9vdGx5YmRlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Nzc5ODE3ODEsImV4cCI6MjA5MzU1Nzc4MX0.EP2vv5avU1FIXlZn4jFo3QkvqnxOdLOrICqNV8qAZxM'
);

const data = JSON.parse(readFileSync('./import_data.json', 'utf-8'));

// Approximate dates per season
const DATES = {
  1: '2023-03-01', 2: '2023-06-01', 3: '2023-09-01', 4: '2023-12-01',
  5: '2024-02-01', 6: '2024-05-01', 7: '2024-07-01', 8: '2024-09-01',
  9: '2024-11-01', 10: '2025-02-01', 11: '2025-05-01', 12: '2025-08-01',
  13: '2026-02-01'
};

let totalSongs = 0, totalVotes = 0;

for (const session of data) {
  // Insert session
  const { data: sess, error: sessErr } = await db.from('cyc_sessions').insert({
    session_num: session.session_num,
    host: session.host,
    date: DATES[session.session_num] || '2024-01-01',
    attendees: session.attendees,
    input_mode: 'host',
    sets_count: session.sets.length,
    songs_count: session.sets[0]?.songs.length || 20,
    complete: true
  }).select().single();

  if (sessErr) { console.error('Session error:', sessErr.message); continue; }
  console.log(`✓ Session T${session.session_num} created (${session.sets.length} sets)`);

  for (let si = 0; si < session.sets.length; si++) {
    const set = session.sets[si];
    const { data: setRow, error: setErr } = await db.from('cyc_sets').insert({
      session_id: sess.id,
      set_index: si,
      label: set.label
    }).select().single();
    if (setErr) { console.error('Set error:', setErr.message); continue; }

    for (let so = 0; so < set.songs.length; so++) {
      const song = set.songs[so];
      const { data: songRow, error: songErr } = await db.from('cyc_songs').insert({
        set_id: setRow.id,
        song_index: so,
        artist: song.artist,
        title: song.title
      }).select().single();
      if (songErr) { console.error('Song error:', songErr.message); continue; }
      totalSongs++;

      // Insert votes
      const voteInserts = Object.entries(song.votes).map(([voter, score]) => ({
        song_id: songRow.id,
        voter_name: voter,
        score: score
      }));
      if (voteInserts.length > 0) {
        const { error: vErr } = await db.from('cyc_votes').insert(voteInserts);
        if (vErr) console.error('Vote error:', vErr.message);
        else totalVotes += voteInserts.length;
      }
    }
  }
}

console.log(`\n✅ Import complete: ${totalSongs} songs, ${totalVotes} votes`);
