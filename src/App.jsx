import { useState, useEffect, useCallback, useRef } from "react";
import { createClient } from "@supabase/supabase-js";

const SUPA_URL = "https://jmkvphayyhwzootlybde.supabase.co";
const SUPA_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Impta3ZwaGF5eWh3em9vdGx5YmRlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Nzc5ODE3ODEsImV4cCI6MjA5MzU1Nzc4MX0.EP2vv5avU1FIXlZn4jFo3QkvqnxOdLOrICqNV8qAZxM";
const db = createClient(SUPA_URL, SUPA_KEY);

const DEFAULT_VOTERS = ["Jose J","Francisco","Hernan","Mario","Daniel","Jorge A.","Carlos","Freddy","Giusse","Mauricio O.","Tono","Mauricio R.","Lucho","Gino","Patrick","Alex","Julio","Dante","Kurt","Juan Carlos"];
const SCORE_VALS = [1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,7.5,8,8.5,9,9.5,10];

/* ══════════════════════════════════════════════════════════════
   80s NEON RETRO CSS — VHS, synth, cassette vibes
══════════════════════════════════════════════════════════════ */
const CSS = `
@import url('https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700;900&family=Share+Tech+Mono&family=Rajdhani:wght@400;500;600;700&display=swap');

*, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

:root {
  --bg: #050508;
  --bg2: #0a0a14;
  --surf: #0d0d1f;
  --surf2: #121228;
  --border: #1a1a3e;
  --cyan: #00f5ff;
  --cyan2: rgba(0,245,255,.12);
  --magenta: #ff00aa;
  --mag2: rgba(255,0,170,.12);
  --yellow: #ffe600;
  --yel2: rgba(255,230,0,.12);
  --green: #00ff88;
  --grn2: rgba(0,255,136,.1);
  --white: #e8e8ff;
  --muted: #4a4a7a;
  --r: 4px;
}

body {
  background: var(--bg);
  color: var(--white);
  font-family: 'Rajdhani', sans-serif;
  min-height: 100vh;
  overflow-x: hidden;
}

/* scanline overlay */
body::before {
  content: '';
  position: fixed;
  inset: 0;
  background: repeating-linear-gradient(
    0deg,
    transparent,
    transparent 2px,
    rgba(0,0,0,.15) 2px,
    rgba(0,0,0,.15) 4px
  );
  pointer-events: none;
  z-index: 9999;
}

.app { max-width: 920px; margin: 0 auto; padding: 16px 12px 80px; }

/* ── HEADER ── */
.hdr {
  text-align: center;
  padding: 32px 0 24px;
  position: relative;
}
.hdr-tape {
  display: flex; align-items: center; justify-content: center;
  gap: 12px; margin-bottom: 16px;
}
.cassette {
  width: 48px; height: 32px;
  border: 2px solid var(--cyan);
  border-radius: 4px;
  position: relative;
  box-shadow: 0 0 12px var(--cyan), inset 0 0 8px rgba(0,245,255,.1);
  display: flex; align-items: center; justify-content: center; gap: 6px;
}
.cassette::before, .cassette::after {
  content: '';
  width: 10px; height: 10px;
  border-radius: 50%;
  border: 2px solid var(--cyan);
  box-shadow: 0 0 6px var(--cyan);
}

.title {
  font-family: 'Orbitron', monospace;
  font-size: clamp(22px,5vw,40px);
  font-weight: 900;
  letter-spacing: 4px;
  text-transform: uppercase;
  color: var(--cyan);
  text-shadow: 0 0 20px var(--cyan), 0 0 40px rgba(0,245,255,.4);
  line-height: 1.1;
}
.title-amp { color: var(--magenta); text-shadow: 0 0 20px var(--magenta), 0 0 40px rgba(255,0,170,.4); }
.sub {
  font-family: 'Share Tech Mono', monospace;
  font-size: 11px;
  color: var(--muted);
  text-transform: uppercase;
  letter-spacing: .2em;
  margin-top: 8px;
}
.dot-on {
  width: 7px; height: 7px;
  border-radius: 50%;
  background: var(--green);
  box-shadow: 0 0 8px var(--green);
  display: inline-block;
  animation: blink 1.4s step-end infinite;
}
@keyframes blink { 0%,100%{opacity:1} 50%{opacity:0.2} }

/* ── NAV ── */
.nav {
  display: flex; gap: 2px;
  background: var(--surf);
  border: 1px solid var(--border);
  border-radius: var(--r);
  padding: 4px;
  margin-bottom: 20px;
  position: sticky; top: 8px; z-index: 50;
  box-shadow: 0 0 24px rgba(0,0,0,.8), 0 0 1px var(--cyan);
}
.nb {
  flex: 1; padding: 10px 6px;
  border: 1px solid transparent;
  border-radius: 2px;
  background: transparent;
  color: var(--muted);
  cursor: pointer;
  font-family: 'Orbitron', monospace;
  font-size: 10px;
  font-weight: 700;
  letter-spacing: .1em;
  text-transform: uppercase;
  transition: all .15s;
}
.nb.on {
  background: rgba(0,245,255,.08);
  border-color: var(--cyan);
  color: var(--cyan);
  text-shadow: 0 0 10px var(--cyan);
  box-shadow: inset 0 0 12px rgba(0,245,255,.05), 0 0 8px rgba(0,245,255,.2);
}
.nb:hover:not(.on) { color: var(--white); border-color: var(--muted); }

/* ── CARDS ── */
.card {
  background: var(--surf);
  border: 1px solid var(--border);
  border-radius: var(--r);
  padding: 18px;
  margin-bottom: 14px;
  position: relative;
  overflow: hidden;
}
.card::before {
  content: '';
  position: absolute;
  top: 0; left: 0; right: 0;
  height: 1px;
  background: linear-gradient(90deg, transparent, var(--cyan), transparent);
  opacity: .4;
}
.card.mag::before { background: linear-gradient(90deg, transparent, var(--magenta), transparent); }
.card.yel::before { background: linear-gradient(90deg, transparent, var(--yellow), transparent); }
.card.grn::before { background: linear-gradient(90deg, transparent, var(--green), transparent); }

.ct {
  font-family: 'Orbitron', monospace;
  font-size: 12px;
  font-weight: 700;
  letter-spacing: .15em;
  text-transform: uppercase;
  color: var(--cyan);
  text-shadow: 0 0 8px var(--cyan);
  margin-bottom: 14px;
  display: flex; align-items: center; gap: 8px;
}
.ct.mag { color: var(--magenta); text-shadow: 0 0 8px var(--magenta); }
.ct.yel { color: var(--yellow); text-shadow: 0 0 8px var(--yellow); }
.ct.grn { color: var(--green); text-shadow: 0 0 8px var(--green); }

/* ── FORM ── */
input, select {
  background: var(--bg2);
  border: 1px solid var(--border);
  border-radius: 2px;
  color: var(--white);
  font-family: 'Share Tech Mono', monospace;
  font-size: 13px;
  padding: 9px 12px;
  width: 100%;
  outline: none;
  transition: border-color .15s, box-shadow .15s;
}
input:focus, select:focus {
  border-color: var(--cyan);
  box-shadow: 0 0 8px rgba(0,245,255,.2);
}
input::placeholder { color: var(--muted); }
select option { background: var(--bg2); }
label {
  display: block;
  font-family: 'Share Tech Mono', monospace;
  font-size: 10px;
  color: var(--muted);
  text-transform: uppercase;
  letter-spacing: .1em;
  margin-bottom: 5px;
}
.field { margin-bottom: 12px; }
.row { display: flex; gap: 9px; align-items: flex-end; }
.row .field { flex: 1; margin-bottom: 0; }

/* ── BUTTONS ── */
.btn {
  padding: 10px 20px;
  border-radius: 2px;
  border: 1px solid;
  cursor: pointer;
  font-family: 'Orbitron', monospace;
  font-size: 10px;
  font-weight: 700;
  letter-spacing: .1em;
  text-transform: uppercase;
  transition: all .15s;
  display: inline-flex; align-items: center; gap: 6px;
}
.btn:disabled { opacity: .35; cursor: not-allowed; }
.bp {
  background: rgba(0,245,255,.08);
  border-color: var(--cyan);
  color: var(--cyan);
  text-shadow: 0 0 8px var(--cyan);
}
.bp:hover:not(:disabled) {
  background: rgba(0,245,255,.18);
  box-shadow: 0 0 16px rgba(0,245,255,.3);
}
.bm {
  background: rgba(255,0,170,.08);
  border-color: var(--magenta);
  color: var(--magenta);
}
.bm:hover:not(:disabled) { background: rgba(255,0,170,.18); box-shadow: 0 0 16px rgba(255,0,170,.3); }
.bs {
  background: transparent;
  border-color: var(--muted);
  color: var(--muted);
}
.bs:hover:not(:disabled) { border-color: var(--white); color: var(--white); }
.bd {
  background: rgba(255,50,50,.08);
  border-color: #ff3232;
  color: #ff5555;
}
.bsm { padding: 6px 12px; font-size: 9px; }
.bfw { width: 100%; justify-content: center; }

/* ── TAGS ── */
.tag {
  display: inline-flex; align-items: center; gap: 5px;
  background: rgba(0,245,255,.06);
  border: 1px solid rgba(0,245,255,.3);
  border-radius: 2px;
  padding: 3px 8px;
  font-family: 'Share Tech Mono', monospace;
  font-size: 11px;
  color: var(--cyan);
}
.tag-x { cursor: pointer; opacity: .6; }
.tag-x:hover { opacity: 1; }
.tags { display: flex; flex-wrap: wrap; gap: 5px; margin-top: 7px; }

/* ── SCORE GRID ── */
.sg { display: grid; grid-template-columns: repeat(10,1fr); gap: 3px; margin-top: 8px; }
.sb {
  aspect-ratio: 1;
  border: 1px solid var(--border);
  border-radius: 2px;
  background: var(--bg2);
  color: var(--muted);
  cursor: pointer;
  font-family: 'Share Tech Mono', monospace;
  font-size: 11px;
  transition: all .12s;
  padding: 0;
}
.sb:hover, .sb.sel {
  background: rgba(255,0,170,.15);
  border-color: var(--magenta);
  color: var(--magenta);
  text-shadow: 0 0 8px var(--magenta);
  box-shadow: 0 0 8px rgba(255,0,170,.2);
}
.sb.half { font-size: 9px; }

/* ── SONG ROW ── */
.srow {
  display: flex; align-items: center; gap: 10px;
  padding: 8px 12px;
  border-radius: 2px;
  background: rgba(255,255,255,.02);
  margin-bottom: 3px;
  border-left: 2px solid transparent;
  transition: border-color .15s;
}
.srow:hover { border-left-color: var(--cyan); }
.snum { font-family: 'Share Tech Mono', monospace; font-size: 10px; color: var(--muted); width: 20px; text-align: right; flex-shrink: 0; }
.sinfo { flex: 1; min-width: 0; }
.stitle { font-size: 14px; font-weight: 600; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; }
.sartist { font-family: 'Share Tech Mono', monospace; font-size: 10px; color: var(--muted); margin-top: 1px; }
.sscore { font-family: 'Orbitron', monospace; font-size: 16px; font-weight: 700; flex-shrink: 0; min-width: 40px; text-align: right; }

/* ── PROGRESS BAR ── */
.pbar { height: 3px; border-radius: 0; background: var(--border); margin-top: 12px; }
.pbar-f { height: 100%; background: linear-gradient(90deg, var(--cyan), var(--magenta)); transition: width .4s; }

/* ── SET HEADER ── */
.seth {
  display: flex; align-items: center; justify-content: space-between;
  padding: 8px 12px;
  background: var(--bg2);
  border: 1px solid var(--border);
  border-radius: 2px;
  margin-bottom: 5px;
}
.setl { font-family: 'Orbitron', monospace; font-size: 10px; font-weight: 700; letter-spacing: .1em; color: var(--cyan); }

/* ── STATS ── */
.sgrid { display: grid; grid-template-columns: repeat(auto-fill,minmax(130px,1fr)); gap: 10px; }
.sbox {
  background: var(--bg2);
  border: 1px solid var(--border);
  border-radius: 2px;
  padding: 14px;
  text-align: center;
  position: relative;
}
.sbox::before {
  content: '';
  position: absolute; top: 0; left: 0; right: 0; height: 1px;
  background: linear-gradient(90deg, transparent, var(--magenta), transparent);
  opacity: .5;
}
.sval { font-family: 'Orbitron', monospace; font-size: 24px; font-weight: 900; color: var(--magenta); text-shadow: 0 0 10px var(--magenta); }
.slbl { font-family: 'Share Tech Mono', monospace; font-size: 9px; color: var(--muted); text-transform: uppercase; letter-spacing: .1em; margin-top: 4px; }

/* ── LEADERBOARD ── */
.lb {
  display: flex; align-items: center; gap: 10px;
  padding: 10px 12px;
  border-radius: 2px;
  margin-bottom: 4px;
  background: var(--bg2);
  border: 1px solid var(--border);
  border-left: 3px solid var(--muted);
  transition: border-left-color .15s;
}
.lb:nth-child(1) { border-left-color: var(--yellow); }
.lb:nth-child(2) { border-left-color: #c0c0c0; }
.lb:nth-child(3) { border-left-color: #cd7f32; }
.lbr { font-family: 'Orbitron', monospace; font-size: 16px; font-weight: 900; min-width: 28px; color: var(--muted); }
.lb:nth-child(1) .lbr { color: var(--yellow); text-shadow: 0 0 8px var(--yellow); }
.lb:nth-child(2) .lbr { color: #c0c0c0; }
.lb:nth-child(3) .lbr { color: #cd7f32; }
.lbi { flex: 1; min-width: 0; }
.lbsong { font-size: 13px; font-weight: 600; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; }
.lbartist { font-family: 'Share Tech Mono', monospace; font-size: 10px; color: var(--muted); margin-top: 2px; }
.lbsc { font-family: 'Orbitron', monospace; font-size: 18px; font-weight: 700; flex-shrink: 0; }

/* ── VOTER CARD ── */
.vc {
  background: var(--bg2);
  border: 1px solid var(--border);
  border-radius: 2px;
  padding: 12px;
  margin-bottom: 8px;
}
.vch { display: flex; align-items: center; justify-content: space-between; margin-bottom: 10px; }
.vcn { font-family: 'Share Tech Mono', monospace; font-size: 13px; color: var(--cyan); }

/* ── FILTER BAR ── */
.filters {
  display: flex; flex-wrap: wrap; gap: 8px;
  margin-bottom: 16px;
  padding: 12px;
  background: var(--surf);
  border: 1px solid var(--border);
  border-radius: var(--r);
}
.filter-chip {
  padding: 5px 12px;
  border: 1px solid var(--border);
  border-radius: 2px;
  background: transparent;
  color: var(--muted);
  cursor: pointer;
  font-family: 'Share Tech Mono', monospace;
  font-size: 10px;
  transition: all .12s;
  text-transform: uppercase;
  letter-spacing: .05em;
}
.filter-chip.on {
  border-color: var(--magenta);
  color: var(--magenta);
  background: rgba(255,0,170,.08);
  text-shadow: 0 0 6px var(--magenta);
}
.filter-chip:hover:not(.on) { color: var(--white); border-color: var(--muted); }
.filter-select {
  background: var(--bg2);
  border: 1px solid var(--border);
  color: var(--white);
  font-family: 'Share Tech Mono', monospace;
  font-size: 10px;
  padding: 5px 10px;
  border-radius: 2px;
  outline: none;
  cursor: pointer;
  width: auto;
}
.filter-select:focus { border-color: var(--cyan); }

/* ── CHART BARS ── */
.chart-bar-row { margin-bottom: 8px; }
.chart-label { font-family: 'Share Tech Mono', monospace; font-size: 10px; color: var(--muted); margin-bottom: 3px; display: flex; justify-content: space-between; }
.chart-track { height: 6px; background: var(--border); border-radius: 0; }
.chart-fill { height: 100%; border-radius: 0; background: linear-gradient(90deg, var(--cyan), var(--magenta)); transition: width .6s; }

/* ── MISC ── */
.between { display: flex; align-items: center; justify-content: space-between; }
.muted { color: var(--muted); font-size: 12px; font-family: 'Share Tech Mono', monospace; }
.mt8 { margin-top: 8px; }
.mt12 { margin-top: 12px; }
.mt16 { margin-top: 16px; }
.mb0 { margin-bottom: 0 !important; }
.divider { border: none; border-top: 1px solid var(--border); margin: 14px 0; }
.empty { text-align: center; padding: 52px 20px; }
.ei { font-size: 44px; margin-bottom: 10px; }
.mono { font-family: 'Share Tech Mono', monospace; }
.orb { font-family: 'Orbitron', monospace; }

.summary-s { display: flex; justify-content: space-between; align-items: center; padding: 6px 0; border-bottom: 1px solid rgba(255,255,255,.04); font-size: 13px; }
.summary-s:last-child { border-bottom: none; }

/* ── SCORE BIG ── */
.score-big { text-align: center; padding: 16px 0; }
.score-big-val { font-family: 'Orbitron', monospace; font-size: 52px; font-weight: 900; line-height: 1; }
.score-big-lbl { font-family: 'Share Tech Mono', monospace; font-size: 10px; color: var(--muted); text-transform: uppercase; letter-spacing: .1em; margin-top: 4px; }

/* ── WAVEFORM decorative ── */
.wave { display: flex; align-items: flex-end; gap: 2px; height: 24px; }
.wave-bar { width: 3px; border-radius: 1px; background: var(--cyan); opacity: .4; animation: wave-anim var(--d,0.8s) ease-in-out infinite alternate; }
@keyframes wave-anim { from { transform: scaleY(.2); } to { transform: scaleY(1); } }

/* ── VHS GLITCH effect on title hover ── */
.title:hover {
  animation: glitch .3s steps(2) forwards;
}
@keyframes glitch {
  0% { text-shadow: 2px 0 var(--magenta), -2px 0 var(--cyan); }
  25% { text-shadow: -2px 2px var(--cyan), 2px -2px var(--magenta); }
  50% { text-shadow: 2px -2px var(--yellow), -2px 2px var(--magenta); }
  75% { text-shadow: -2px 0 var(--yellow), 2px 0 var(--cyan); }
  100% { text-shadow: 0 0 20px var(--cyan), 0 0 40px rgba(0,245,255,.4); }
}

/* ── SCROLLBAR ── */
::-webkit-scrollbar { width: 4px; }
::-webkit-scrollbar-track { background: var(--bg); }
::-webkit-scrollbar-thumb { background: var(--border); border-radius: 2px; }
`;

/* ── Helpers ──────────────────────────────────────────────── */
function avg(arr) {
  const v = arr.filter(x => x != null && !isNaN(x));
  if (!v.length) return null;
  return Math.round(v.reduce((a, b) => a + Number(b), 0) / v.length * 100) / 100;
}
function scoreColor(s) {
  if (s == null) return "var(--muted)";
  if (s >= 9) return "var(--green)";
  if (s >= 7.5) return "var(--cyan)";
  if (s >= 6) return "var(--white)";
  return "#ff5555";
}
function fmtDate(d) {
  return new Date(d).toLocaleDateString("es-PE", { weekday: "short", year: "numeric", month: "short", day: "numeric" });
}
function rankEmoji(i) { return ["🥇","🥈","🥉"][i] || `#${i+1}`; }

/* ── Song average helpers ── */
function songAvg(song) {
  const vals = Object.values(song.votes || {}).filter(v => !isNaN(v));
  return avg(vals);
}
function voteCount(song) { return Object.keys(song.votes || {}).length; }
function setAvg(set) {
  const avgs = (set.songs || []).map(s => songAvg(s)).filter(x => x !== null);
  return avg(avgs);
}

/* ── Wave decorative component ── */
function Wave() {
  const bars = Array.from({length: 16}, (_, i) => ({
    h: Math.random() * 70 + 30,
    d: (Math.random() * 0.6 + 0.4).toFixed(2) + "s",
    delay: (i * 0.05).toFixed(2) + "s"
  }));
  return (
    <div className="wave">
      {bars.map((b, i) => (
        <div key={i} className="wave-bar" style={{
          height: b.h + "%",
          "--d": b.d,
          animationDelay: b.delay,
          opacity: 0.3 + Math.random() * 0.4
        }} />
      ))}
    </div>
  );
}

/* ══════════════════════════════════════════════════════════════
   MAIN APP
══════════════════════════════════════════════════════════════ */
export default function App() {
  const [tab, setTab] = useState("live");
  const [sessions, setSessions] = useState([]);
  const [loading, setLoading] = useState(true);
  const [connected, setConnected] = useState(false);

  // New session form
  const [showNew, setShowNew] = useState(false);
  const [nHost, setNHost] = useState("");
  const [nDate, setNDate] = useState(new Date().toISOString().slice(0, 10));
  const [nAttendees, setNAttendees] = useState([]);
  const [nAttName, setNAttName] = useState("");
  const [nMode, setNMode] = useState("4x5");
  const [nInput, setNInput] = useState("host");
  const [creating, setCreating] = useState(false);

  // Live session
  const [liveSession, setLiveSession] = useState(null);
  const [liveSets, setLiveSets] = useState([]);
  const [curSet, setCurSet] = useState(0);
  const [curSong, setCurSong] = useState(0);
  const [phase, setPhase] = useState("entry");
  const realtimeSub = useRef(null);

  // History filters
  const [filterSeason, setFilterSeason] = useState("all");
  const [filterHost, setFilterHost] = useState("all");
  const [filterVoter, setFilterVoter] = useState("all");
  const [sortBy, setSortBy] = useState("season");

  // Stats filters
  const [statsView, setStatsView] = useState("songs"); // songs|voters|seasons

  /* ── Load sessions ── */
  const loadSessions = useCallback(async () => {
    setLoading(true);
    const { data: sess } = await db.from("cyc_sessions").select("*").order("session_num", { ascending: false });
    if (!sess) { setLoading(false); return; }
    const full = await Promise.all(sess.map(async s => {
      const { data: sets } = await db.from("cyc_sets").select("*").eq("session_id", s.id).order("set_index");
      const setsWithSongs = await Promise.all((sets || []).map(async st => {
        const { data: songs } = await db.from("cyc_songs").select("*").eq("set_id", st.id).order("song_index");
        const songsWithVotes = await Promise.all((songs || []).map(async sg => {
          const { data: votes } = await db.from("cyc_votes").select("*").eq("song_id", sg.id);
          const vm = {}; (votes || []).forEach(v => { vm[v.voter_name] = Number(v.score); });
          return { ...sg, votes: vm };
        }));
        return { ...st, songs: songsWithVotes };
      }));
      return { ...s, sets: setsWithSongs };
    }));
    setSessions(full);
    setLoading(false);
    setConnected(true);
  }, []);

  useEffect(() => { loadSessions(); }, [loadSessions]);

  /* ── Realtime ── */
  useEffect(() => {
    if (!liveSession) return;
    const sub = db.channel(`cyc_live_${liveSession.id}`)
      .on("postgres_changes", { event: "*", schema: "public", table: "cyc_votes" }, () => {
        refreshLiveSets(liveSession.id);
      }).subscribe();
    realtimeSub.current = sub;
    return () => { db.removeChannel(sub); };
  }, [liveSession]);

  const refreshLiveSets = useCallback(async (sessionId) => {
    const { data: sets } = await db.from("cyc_sets").select("*").eq("session_id", sessionId).order("set_index");
    const sw = await Promise.all((sets || []).map(async st => {
      const { data: songs } = await db.from("cyc_songs").select("*").eq("set_id", st.id).order("song_index");
      const sv = await Promise.all((songs || []).map(async sg => {
        const { data: votes } = await db.from("cyc_votes").select("*").eq("song_id", sg.id);
        const vm = {}; (votes || []).forEach(v => { vm[v.voter_name] = Number(v.score); });
        return { ...sg, votes: vm };
      }));
      return { ...st, songs: sv };
    }));
    setLiveSets(sw);
  }, []);

  /* ── Create session ── */
  async function createSession() {
    if (!nHost || !nAttendees.length) return;
    setCreating(true);
    const [sC, sgC] = nMode === "4x5" ? [4, 5] : [5, 4];
    const sessionNum = (sessions.length > 0 ? Math.max(...sessions.map(s => s.session_num)) : 0) + 1;
    const { data: sess, error } = await db.from("cyc_sessions").insert({
      session_num: sessionNum, host: nHost, date: nDate,
      attendees: nAttendees, input_mode: nInput,
      sets_count: sC, songs_count: sgC, complete: false
    }).select().single();
    if (error || !sess) { setCreating(false); alert("Error: " + error?.message); return; }
    const allSets = [];
    for (let si = 0; si < sC; si++) {
      const { data: setRow } = await db.from("cyc_sets").insert({ session_id: sess.id, set_index: si, label: `Set ${si + 1}` }).select().single();
      const songs = [];
      for (let so = 0; so < sgC; so++) {
        const { data: song } = await db.from("cyc_songs").insert({ set_id: setRow.id, song_index: so, artist: "", title: "" }).select().single();
        songs.push({ ...song, votes: {} });
      }
      allSets.push({ ...setRow, songs });
    }
    setLiveSession(sess); setLiveSets(allSets);
    setCurSet(0); setCurSong(0); setPhase("entry");
    setShowNew(false); setNHost(""); setNAttendees([]);
    setCreating(false); setTab("live");
  }

  /* ── Song / vote ops ── */
  async function saveSongMeta(si, so, field, val) {
    const song = liveSets[si]?.songs[so];
    if (!song) return;
    const upd = JSON.parse(JSON.stringify(liveSets));
    upd[si].songs[so][field] = val;
    setLiveSets(upd);
    await db.from("cyc_songs").update({ [field]: val }).eq("id", song.id);
  }
  async function castVote(si, so, voter, score) {
    const song = liveSets[si]?.songs[so];
    if (!song) return;
    const upd = JSON.parse(JSON.stringify(liveSets));
    upd[si].songs[so].votes[voter] = score;
    setLiveSets(upd);
    await db.from("cyc_votes").upsert(
      { song_id: song.id, voter_name: voter, score, updated_at: new Date().toISOString() },
      { onConflict: "song_id,voter_name" }
    );
  }

  /* ── Navigation ── */
  function openVoting() {
    const song = liveSets[curSet]?.songs[curSong];
    if (!song?.artist || !song?.title) return;
    setPhase("voting");
  }
  function nextSong() {
    const sgC = liveSession.songs_count;
    const sC = liveSession.sets_count;
    if (curSong < sgC - 1) { setCurSong(curSong + 1); setPhase("entry"); }
    else if (curSet < sC - 1) { setPhase("set_done"); }
    else { finishSession(); }
  }
  async function finishSession() {
    await db.from("cyc_sessions").update({ complete: true }).eq("id", liveSession.id);
    await loadSessions();
    setLiveSession(null); setLiveSets([]); setPhase("entry"); setTab("history");
  }

  /* ── Computed ── */
  const curLiveSong = liveSets[curSet]?.songs[curSong];
  const totalSongs = (liveSession?.sets_count || 0) * (liveSession?.songs_count || 0);
  const doneCount = curSet * (liveSession?.songs_count || 0) + curSong;

  // History filters
  const allSeasons = [...new Set(sessions.map(s => s.session_num))].sort((a, b) => a - b);
  const allHosts = [...new Set(sessions.flatMap(s => (s.sets || []).map(st => st.label.replace("Set ", ""))))].sort();
  const allVoters = [...new Set(sessions.flatMap(s => s.attendees || []))].sort();

  function filteredSongs() {
    let songs = sessions
      .filter(s => filterSeason === "all" || s.session_num === Number(filterSeason))
      .flatMap(s => (s.sets || [])
        .filter(st => filterHost === "all" || st.label.includes(filterHost))
        .flatMap(st => st.songs.map(sg => ({
          ...sg,
          sessionNum: s.session_num,
          setLabel: st.label,
          sessionDate: s.date,
          host: st.label.replace("Set ", "")
        })))
      )
      .filter(sg => sg.title);

    if (filterVoter !== "all") {
      songs = songs.filter(sg => sg.votes[filterVoter] !== undefined);
    }

    songs = songs.filter(sg => songAvg(sg) !== null);
    if (sortBy === "score") songs.sort((a, b) => songAvg(b) - songAvg(a));
    else if (sortBy === "season") songs.sort((a, b) => a.sessionNum - b.sessionNum);
    else if (sortBy === "votes") songs.sort((a, b) => voteCount(b) - voteCount(a));
    return songs;
  }

  function voterStats() {
    const map = {};
    sessions.forEach(s => s.sets.forEach(st => st.songs.forEach(sg => {
      Object.entries(sg.votes || {}).forEach(([voter, score]) => {
        if (!map[voter]) map[voter] = { sum: 0, count: 0, tens: 0, ones: 0 };
        map[voter].sum += Number(score);
        map[voter].count++;
        if (score >= 9.5) map[voter].tens++;
        if (score <= 3) map[voter].ones++;
      });
    })));
    return Object.entries(map)
      .map(([name, d]) => ({ name, avg: Math.round(d.sum / d.count * 100) / 100, count: d.count, tens: d.tens, ones: d.ones }))
      .sort((a, b) => b.avg - a.avg);
  }

  function topSongs(n = 10) {
    return sessions
      .flatMap(s => (s.sets || []).flatMap(st => st.songs.map(sg => ({
        ...sg, sessionNum: s.session_num, sessionHost: st.label, sessionDate: s.date
      }))))
      .filter(s => s.title && songAvg(s) !== null)
      .sort((a, b) => songAvg(b) - songAvg(a))
      .slice(0, n);
  }

  /* ─────────────────────────────────────────────────────────
     RENDER
  ───────────────────────────────────────────────────────── */
  return (
    <>
      <style>{CSS}</style>
      <div className="app">

        {/* ── HEADER ── */}
        <header className="hdr">
          <div className="hdr-tape">
            <div className="cassette" />
            <Wave />
            <div className="cassette" />
          </div>
          <h1 className="title">COMPÁS <span className="title-amp">&amp;</span> COPAS</h1>
          <p className="sub">
            {connected
              ? <><span className="dot-on" /> ONLINE · REAL TIME</>
              : "CONNECTING..."}
          </p>
        </header>

        {/* ── NAV ── */}
        <nav className="nav">
          <button className={`nb ${tab === "live" ? "on" : ""}`} onClick={() => setTab("live")}>► SESIÓN</button>
          <button className={`nb ${tab === "history" ? "on" : ""}`} onClick={() => setTab("history")}>◉ HISTORIAL</button>
          <button className={`nb ${tab === "stats" ? "on" : ""}`} onClick={() => setTab("stats")}>▲ STATS</button>
        </nav>

        {/* ══ TAB: LIVE ══════════════════════════════════════════ */}
        {tab === "live" && <>

          {!liveSession && !showNew && (
            <div className="empty">
              <div className="ei">📼</div>
              <p className="orb" style={{ fontSize: 16, color: "var(--cyan)", textShadow: "0 0 10px var(--cyan)" }}>SIN SESIÓN ACTIVA</p>
              <p className="muted mt8">Presiona PLAY para comenzar</p>
              <button className="btn bp mt16" onClick={() => setShowNew(true)}>► NUEVA SESIÓN</button>
            </div>
          )}

          {showNew && !liveSession && (
            <div className="card mag">
              <div className="ct mag">◈ NUEVA SESIÓN</div>
              <div className="row">
                <div className="field"><label>Anfitrión</label>
                  <input placeholder="¿Quién pone la música?" value={nHost} onChange={e => setNHost(e.target.value)} />
                </div>
                <div className="field"><label>Fecha</label>
                  <input type="date" value={nDate} onChange={e => setNDate(e.target.value)} />
                </div>
              </div>
              <div className="row">
                <div className="field"><label>Formato</label>
                  <select value={nMode} onChange={e => setNMode(e.target.value)}>
                    <option value="4x5">4 sets × 5 canciones</option>
                    <option value="5x4">5 sets × 4 canciones</option>
                  </select>
                </div>
                <div className="field"><label>Modo votación</label>
                  <select value={nInput} onChange={e => setNInput(e.target.value)}>
                    <option value="host">Anfitrión ingresa votos</option>
                    <option value="individual">Cada uno en su cel</option>
                  </select>
                </div>
              </div>
              <div className="field"><label>Asistentes</label>
                <div className="row">
                  <div className="field mb0" style={{ flex: 1 }}>
                    <input placeholder="Nombre..." value={nAttName}
                      onChange={e => setNAttName(e.target.value)}
                      onKeyDown={e => { if (e.key === "Enter" && nAttName.trim()) { setNAttendees([...nAttendees, nAttName.trim()]); setNAttName(""); } }}
                      list="vlist" />
                    <datalist id="vlist">{DEFAULT_VOTERS.map(v => <option key={v} value={v} />)}</datalist>
                  </div>
                  <button className="btn bs bsm" onClick={() => { if (nAttName.trim()) { setNAttendees([...nAttendees, nAttName.trim()]); setNAttName(""); } }}>+ ADD</button>
                </div>
                {nAttendees.length > 0 && (
                  <div className="tags mt8">
                    {nAttendees.map(a => <span key={a} className="tag">{a} <span className="tag-x" onClick={() => setNAttendees(nAttendees.filter(x => x !== a))}>×</span></span>)}
                  </div>
                )}
              </div>
              <div className="row mt12">
                <button className="btn bs" onClick={() => setShowNew(false)}>CANCEL</button>
                <button className="btn bp bfw" onClick={createSession} disabled={!nHost || !nAttendees.length || creating}>
                  {creating ? "CARGANDO..." : `► INICIAR CON ${nAttendees.length} MIEMBROS`}
                </button>
              </div>
            </div>
          )}

          {liveSession && <>
            {/* Session bar */}
            <div className="card">
              <div className="between">
                <div>
                  <div className="mono" style={{ fontSize: 10, color: "var(--muted)" }}>SESIÓN #{liveSession.session_num}</div>
                  <div className="orb" style={{ fontSize: 17, color: "var(--cyan)", textShadow: "0 0 10px var(--cyan)", marginTop: 4 }}>
                    ► {liveSession.host}
                  </div>
                  <div className="muted" style={{ marginTop: 4, fontSize: 10 }}>
                    {fmtDate(liveSession.date)} · {liveSession.attendees?.length} MIEMBROS
                  </div>
                </div>
                <div style={{ textAlign: "right" }}>
                  <div className="orb" style={{ fontSize: 28, color: "var(--magenta)", textShadow: "0 0 12px var(--magenta)" }}>
                    {doneCount}/{totalSongs}
                  </div>
                  <div className="mono" style={{ fontSize: 9, color: "var(--muted)" }}>TRACKS</div>
                </div>
              </div>
              <div className="pbar"><div className="pbar-f" style={{ width: `${totalSongs > 0 ? (doneCount / totalSongs) * 100 : 0}%` }} /></div>
              <div style={{ display: "flex", justifyContent: "space-between", marginTop: 5 }}>
                {liveSets.map((s, i) => (
                  <span key={i} className="mono" style={{ fontSize: 9, color: i === curSet ? "var(--cyan)" : "var(--muted)" }}>{s.label}</span>
                ))}
              </div>
            </div>

            {/* PHASE: entry */}
            {phase === "entry" && curLiveSong && (
              <div className="card yel">
                <div className="ct yel">◈ {liveSets[curSet]?.label} · TRACK {curSong + 1}</div>
                <div className="field"><label>Artista / Banda</label>
                  <input placeholder="Ej: Depeche Mode" value={curLiveSong.artist || ""}
                    onChange={e => saveSongMeta(curSet, curSong, "artist", e.target.value)} autoFocus />
                </div>
                <div className="field"><label>Canción</label>
                  <input placeholder="Ej: Personal Jesus" value={curLiveSong.title || ""}
                    onChange={e => saveSongMeta(curSet, curSong, "title", e.target.value)}
                    onKeyDown={e => e.key === "Enter" && openVoting()} />
                </div>
                <button className="btn bp bfw mt12" onClick={openVoting} disabled={!curLiveSong.artist || !curLiveSong.title}>
                  ► ABRIR VOTACIÓN
                </button>
              </div>
            )}

            {/* PHASE: voting */}
            {phase === "voting" && curLiveSong && (
              <div className="card mag">
                <div className="ct mag">◉ VOTANDO</div>
                <div className="mono" style={{ fontSize: 13, color: "var(--white)", marginBottom: 14 }}>
                  {curLiveSong.artist} — {curLiveSong.title}
                </div>

                {(liveSession.attendees || []).map(voter => {
                  const v = curLiveSong.votes?.[voter] ?? null;
                  return (
                    <div key={voter} className="vc">
                      <div className="vch">
                        <span className="vcn">► {voter}</span>
                        {v !== null && <span className="orb" style={{ fontSize: 20, color: scoreColor(v), textShadow: `0 0 10px ${scoreColor(v)}` }}>{v}</span>}
                      </div>
                      <div className="sg">
                        {SCORE_VALS.map(sv => (
                          <button key={sv} className={`sb ${sv % 1 !== 0 ? "half" : ""} ${v === sv ? "sel" : ""}`}
                            onClick={() => castVote(curSet, curSong, voter, sv)}>{sv}</button>
                        ))}
                      </div>
                    </div>
                  );
                })}

                {(() => {
                  const a = songAvg(curLiveSong);
                  const cnt = voteCount(curLiveSong);
                  return a !== null && (
                    <div className="score-big">
                      <div className="score-big-lbl">PROMEDIO PARCIAL ({cnt}/{liveSession.attendees?.length})</div>
                      <div className="score-big-val" style={{ color: scoreColor(a), textShadow: `0 0 20px ${scoreColor(a)}` }}>{a}</div>
                    </div>
                  );
                })()}

                <button className="btn bm bfw" onClick={nextSong} disabled={voteCount(curLiveSong) < 1}>
                  {curSong < liveSession.songs_count - 1 ? "NEXT TRACK ►" :
                    curSet < liveSession.sets_count - 1 ? `CERRAR ${liveSets[curSet]?.label} ►` : "✓ FINALIZAR"}
                </button>
              </div>
            )}

            {/* PHASE: set_done */}
            {phase === "set_done" && (
              <div className="card grn" style={{ textAlign: "center" }}>
                <div style={{ fontSize: 40, marginBottom: 12 }}>📼</div>
                <div className="orb" style={{ fontSize: 18, color: "var(--green)", textShadow: "0 0 12px var(--green)", marginBottom: 12 }}>
                  {liveSets[curSet]?.label} COMPLETO
                </div>
                {liveSets[curSet]?.songs.map((s, i) => (
                  <div key={i} className="summary-s">
                    <span className="mono" style={{ fontSize: 12 }}>{s.artist} — {s.title}</span>
                    {songAvg(s) !== null && <span className="orb" style={{ fontSize: 13, color: scoreColor(songAvg(s)) }}>{songAvg(s)}</span>}
                  </div>
                ))}
                {liveSets[curSet + 1] && (
                  <button className="btn bp mt16" onClick={() => { setCurSet(curSet + 1); setCurSong(0); setPhase("entry"); }}>
                    ► INICIAR {liveSets[curSet + 1]?.label}
                  </button>
                )}
              </div>
            )}

            {/* Completed sets preview */}
            {phase !== "set_done" && liveSets.slice(0, curSet + (phase === "voting" ? 1 : 0)).map((set, si) => (
              <div key={si} className="card" style={{ padding: 12 }}>
                <div className="seth">
                  <span className="setl">{set.label}</span>
                  {setAvg(set) !== null && <span className="orb" style={{ color: scoreColor(setAvg(set)), fontSize: 12 }}>AVG {setAvg(set)}</span>}
                </div>
                {set.songs.filter(s => s.title).map((song, so) => (
                  <div key={so} className="srow">
                    <span className="snum">{so + 1}</span>
                    <div className="sinfo"><div className="stitle">{song.title}</div><div className="sartist">{song.artist}</div></div>
                    {songAvg(song) !== null && <span className="sscore" style={{ color: scoreColor(songAvg(song)) }}>{songAvg(song)}</span>}
                  </div>
                ))}
              </div>
            ))}

            <div style={{ textAlign: "center", marginTop: 12 }}>
              <button className="btn bs bsm" onClick={() => { if (window.confirm("¿Abandonar? Los datos en Supabase se conservan.")) setLiveSession(null); }}>
                ABANDONAR
              </button>
            </div>
          </>}
        </>}

        {/* ══ TAB: HISTORY ════════════════════════════════════════ */}
        {tab === "history" && <>

          {/* Filters */}
          <div className="filters">
            <select className="filter-select" value={filterSeason} onChange={e => setFilterSeason(e.target.value)}>
              <option value="all">TODAS LAS TEMPORADAS</option>
              {allSeasons.map(s => <option key={s} value={s}>T{s}</option>)}
            </select>
            <select className="filter-select" value={filterHost} onChange={e => setFilterHost(e.target.value)}>
              <option value="all">TODOS LOS ANFITRIONES</option>
              {allHosts.map(h => <option key={h} value={h}>{h}</option>)}
            </select>
            <select className="filter-select" value={filterVoter} onChange={e => setFilterVoter(e.target.value)}>
              <option value="all">TODOS LOS VOTANTES</option>
              {allVoters.map(v => <option key={v} value={v}>{v}</option>)}
            </select>
            <select className="filter-select" value={sortBy} onChange={e => setSortBy(e.target.value)}>
              <option value="season">ORDENAR: TEMPORADA</option>
              <option value="score">ORDENAR: PUNTAJE ↓</option>
              <option value="votes">ORDENAR: VOTOS ↓</option>
            </select>
            <button className="btn bs bsm" onClick={loadSessions} style={{ marginLeft: "auto" }}>↺ REFRESH</button>
          </div>

          {loading && <div className="empty"><p className="orb" style={{ color: "var(--cyan)" }}>CARGANDO...</p></div>}

          {!loading && (() => {
            const songs = filteredSongs();
            if (!songs.length) return (
              <div className="empty">
                <div className="ei">📭</div>
                <p className="muted">Sin resultados con estos filtros</p>
              </div>
            );

            // Group by session+set if no specific filter, else show flat list sorted by score
            if (sortBy === "score" || filterHost !== "all" || filterVoter !== "all") {
              return (
                <div className="card">
                  <div className="ct">◉ {songs.length} CANCIONES</div>
                  {songs.map((song, i) => (
                    <div key={song.id || i} className="srow">
                      <span className="snum" style={{ width: 28, fontSize: 11 }}>{i + 1}</span>
                      <div className="sinfo">
                        <div className="stitle">{song.title}</div>
                        <div className="sartist">{song.artist} · T{song.sessionNum} · {song.setLabel}</div>
                      </div>
                      <div style={{ textAlign: "right" }}>
                        {songAvg(song) !== null && <div className="sscore" style={{ color: scoreColor(songAvg(song)) }}>{songAvg(song)}</div>}
                        <div className="mono" style={{ fontSize: 9, color: "var(--muted)" }}>{voteCount(song)} votos</div>
                        {filterVoter !== "all" && song.votes[filterVoter] !== undefined && (
                          <div className="mono" style={{ fontSize: 9, color: "var(--magenta)" }}>{filterVoter}: {song.votes[filterVoter]}</div>
                        )}
                      </div>
                    </div>
                  ))}
                </div>
              );
            }

            // Group by session
            return sessions
              .filter(s => filterSeason === "all" || s.session_num === Number(filterSeason))
              .map(session => {
                const allSongsInSess = session.sets.flatMap(st => st.songs.filter(sg => sg.title));
                const gAvg = avg(allSongsInSess.map(s => songAvg(s)).filter(x => x !== null));
                const ranked = [...allSongsInSess].sort((a, b) => (songAvg(b) || 0) - (songAvg(a) || 0));
                return (
                  <div key={session.id} className="card">
                    <div className="between" style={{ marginBottom: 12 }}>
                      <div>
                        <div className="orb" style={{ fontSize: 14, color: "var(--cyan)", textShadow: "0 0 8px var(--cyan)" }}>
                          T{session.session_num} — {fmtDate(session.date)}
                        </div>
                        <div className="mono" style={{ fontSize: 10, color: "var(--muted)", marginTop: 3 }}>
                          {session.sets.length} SETS · {allSongsInSess.length} TRACKS · {session.attendees?.join(", ")}
                        </div>
                      </div>
                      {gAvg !== null && (
                        <div style={{ textAlign: "right" }}>
                          <div className="orb" style={{ fontSize: 24, color: scoreColor(gAvg), textShadow: `0 0 12px ${scoreColor(gAvg)}` }}>{gAvg}</div>
                          <div className="mono" style={{ fontSize: 9, color: "var(--muted)" }}>AVG</div>
                        </div>
                      )}
                    </div>

                    {/* Top 3 */}
                    {ranked.slice(0, 3).map((song, i) => (
                      <div key={i} className="lb">
                        <span className="lbr">{rankEmoji(i)}</span>
                        <div className="lbi">
                          <div className="lbsong">{song.title}</div>
                          <div className="lbartist">{song.artist}</div>
                        </div>
                        <span className="lbsc" style={{ color: scoreColor(songAvg(song)) }}>{songAvg(song)}</span>
                      </div>
                    ))}

                    {/* All sets */}
                    {session.sets.map((set, si) => (
                      <div key={si} style={{ marginTop: 10 }}>
                        <div className="seth">
                          <span className="setl">{set.label}</span>
                          {setAvg(set) !== null && <span className="orb" style={{ color: scoreColor(setAvg(set)), fontSize: 10 }}>AVG {setAvg(set)}</span>}
                        </div>
                        {set.songs.filter(s => s.title).map((song, so) => (
                          <div key={so} className="srow">
                            <span className="snum">{so + 1}</span>
                            <div className="sinfo"><div className="stitle">{song.title}</div><div className="sartist">{song.artist}</div></div>
                            <div style={{ textAlign: "right" }}>
                              {songAvg(song) !== null && <div className="sscore" style={{ color: scoreColor(songAvg(song)) }}>{songAvg(song)}</div>}
                              <div className="mono" style={{ fontSize: 9, color: "var(--muted)" }}>{voteCount(song)} votes</div>
                            </div>
                          </div>
                        ))}
                      </div>
                    ))}

                    <div style={{ marginTop: 12 }}>
                      <button className="btn bd bsm" onClick={async () => {
                        if (window.confirm("¿Eliminar T" + session.session_num + "?")) {
                          await db.from("cyc_sessions").delete().eq("id", session.id);
                          loadSessions();
                        }
                      }}>✕ ELIMINAR</button>
                    </div>
                  </div>
                );
              });
          })()}
        </>}

        {/* ══ TAB: STATS ══════════════════════════════════════════ */}
        {tab === "stats" && <>
          {sessions.length === 0 ? (
            <div className="empty"><div className="ei">▲</div><p className="muted">Completa una sesión para ver stats</p></div>
          ) : <>

            {/* Sub-nav */}
            <div style={{ display: "flex", gap: 6, marginBottom: 16 }}>
              {["songs", "voters", "seasons"].map(v => (
                <button key={v} className={`filter-chip ${statsView === v ? "on" : ""}`} onClick={() => setStatsView(v)}>
                  {v === "songs" ? "TOP TRACKS" : v === "voters" ? "VOTANTES" : "TEMPORADAS"}
                </button>
              ))}
            </div>

            {/* Global numbers */}
            <div className="card mag" style={{ marginBottom: 16 }}>
              <div className="ct mag">▲ GLOBAL</div>
              <div className="sgrid">
                <div className="sbox"><div className="sval">{sessions.length}</div><div className="slbl">Temporadas</div></div>
                <div className="sbox">
                  <div className="sval">{sessions.reduce((a, s) => a + s.sets.flatMap(st => st.songs).filter(sg => sg.title).length, 0)}</div>
                  <div className="slbl">Tracks</div>
                </div>
                <div className="sbox">
                  <div className="sval">{(() => {
                    const all = sessions.flatMap(s => s.sets.flatMap(st => st.songs).map(sg => songAvg(sg))).filter(x => x !== null);
                    return avg(all) ?? "—";
                  })()}</div>
                  <div className="slbl">Avg global</div>
                </div>
                <div className="sbox">
                  <div className="sval">{new Set(sessions.flatMap(s => s.attendees || [])).size}</div>
                  <div className="slbl">Miembros</div>
                </div>
                <div className="sbox">
                  <div className="sval">{sessions.reduce((a, s) => a + s.sets.flatMap(st => st.songs).reduce((b, sg) => b + voteCount(sg), 0), 0)}</div>
                  <div className="slbl">Votos totales</div>
                </div>
                <div className="sbox">
                  <div className="sval">{sessions.reduce((a, s) => a + s.sets.length, 0)}</div>
                  <div className="slbl">Sets</div>
                </div>
              </div>
            </div>

            {statsView === "songs" && (
              <div className="card">
                <div className="ct">◉ TOP 20 TRACKS DE TODOS LOS TIEMPOS</div>
                {topSongs(20).map((song, i) => (
                  <div key={i} className="lb">
                    <span className="lbr">{rankEmoji(i)}</span>
                    <div className="lbi">
                      <div className="lbsong">{song.title}</div>
                      <div className="lbartist">{song.artist} · T{song.sessionNum} · {new Date(song.sessionDate).toLocaleDateString("es-PE")}</div>
                    </div>
                    <span className="lbsc" style={{ color: scoreColor(songAvg(song)) }}>{songAvg(song)}</span>
                  </div>
                ))}
              </div>
            )}

            {statsView === "voters" && (
              <div className="card">
                <div className="ct">◉ RANKING DE VOTANTES</div>
                {voterStats().map((v, i) => (
                  <div key={v.name} style={{ marginBottom: 12 }}>
                    <div className="between" style={{ marginBottom: 4 }}>
                      <div style={{ display: "flex", alignItems: "center", gap: 10 }}>
                        <span className="orb" style={{ fontSize: 13, color: scoreColor(v.avg) }}>{rankEmoji(i)}</span>
                        <div>
                          <div style={{ fontSize: 14, fontWeight: 600 }}>{v.name}</div>
                          <div className="mono" style={{ fontSize: 9, color: "var(--muted)" }}>
                            {v.count} votos · {v.tens} tens · {v.ones} bajos
                          </div>
                        </div>
                      </div>
                      <span className="orb" style={{ fontSize: 18, color: scoreColor(v.avg), textShadow: `0 0 8px ${scoreColor(v.avg)}` }}>{v.avg}</span>
                    </div>
                    <div className="chart-track">
                      <div className="chart-fill" style={{ width: `${(v.avg / 10) * 100}%` }} />
                    </div>
                  </div>
                ))}
              </div>
            )}

            {statsView === "seasons" && (
              <div className="card">
                <div className="ct">◉ PROMEDIO POR TEMPORADA</div>
                {[...sessions].reverse().map(session => {
                  const allAvgs = session.sets.flatMap(st => st.songs).map(s => songAvg(s)).filter(x => x !== null);
                  const gAvg = avg(allAvgs);
                  return (
                    <div key={session.id} style={{ marginBottom: 14 }}>
                      <div className="between" style={{ marginBottom: 4 }}>
                        <div>
                          <span className="orb" style={{ fontSize: 12, color: "var(--cyan)" }}>T{session.session_num}</span>
                          <span className="mono" style={{ fontSize: 10, color: "var(--muted)", marginLeft: 8 }}>
                            {session.sets.length} sets · {allAvgs.length} tracks
                          </span>
                        </div>
                        {gAvg !== null && <span className="orb" style={{ color: scoreColor(gAvg), fontSize: 14 }}>{gAvg}</span>}
                      </div>
                      {gAvg !== null && (
                        <div className="chart-track">
                          <div className="chart-fill" style={{ width: `${(gAvg / 10) * 100}%` }} />
                        </div>
                      )}
                    </div>
                  );
                })}
              </div>
            )}
          </>}
        </>}

      </div>
    </>
  );
}
