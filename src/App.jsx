import { useState, useEffect, useCallback, useRef } from "react";
import { createClient } from "@supabase/supabase-js";

// ── Supabase ─────────────────────────────────────────────────────────────────
const SUPA_URL = "https://jmkvphayyhwzootlybde.supabase.co";
const SUPA_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Impta3ZwaGF5eWh3em9vdGx5YmRlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Nzc5ODE3ODEsImV4cCI6MjA5MzU1Nzc4MX0.EP2vv5avU1FIXlZn4jFo3QkvqnxOdLOrICqNV8qAZxM";
const db = createClient(SUPA_URL, SUPA_KEY);

// ── Palette tokens ────────────────────────────────────────────────────────────
const CSS = `
@import url('https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700;900&family=DM+Sans:ital,wght@0,300;0,400;0,500;0,600;1,400&display=swap');
*,*::before,*::after{box-sizing:border-box;margin:0;padding:0}
:root{
  --bg:#0d0f1a;--surf:#161929;--surf2:#1e2336;--surf3:#252b42;
  --border:#2a2f47;--border2:#343b57;
  --amber:#d4921e;--amber-l:#f5b942;--amber-dim:rgba(212,146,30,.14);
  --cream:#f2e8d5;--cream2:rgba(242,232,213,.65);--muted:#6b7299;
  --green:#4caf7d;--red:#e05050;
  --r:12px;--r-sm:8px;--r-xs:6px;
}
body{background:var(--bg);color:var(--cream);font-family:'DM Sans',system-ui,sans-serif;min-height:100vh;-webkit-font-smoothing:antialiased}
.app{max-width:860px;margin:0 auto;padding:16px 12px 80px}

/* Header */
.hdr{text-align:center;padding:28px 0 20px}
.vinyl{width:52px;height:52px;border-radius:50%;
  background:conic-gradient(#1a1a2e 0 30deg,#2a2040 30deg 60deg,#1a1a2e 60deg 90deg,#2a2040 90deg 120deg,#1a1a2e 120deg 150deg,#2a2040 150deg 180deg,#1a1a2e 180deg 210deg,#2a2040 210deg 240deg,#1a1a2e 240deg 270deg,#2a2040 270deg 300deg,#1a1a2e 300deg 330deg,#2a2040 330deg 360deg);
  display:inline-flex;align-items:center;justify-content:center;margin-bottom:10px;
  animation:spin 8s linear infinite;box-shadow:0 0 28px rgba(212,146,30,.35)}
.vinyl-c{width:13px;height:13px;border-radius:50%;background:var(--amber)}
@keyframes spin{to{transform:rotate(360deg)}}
.title{font-family:'Playfair Display',serif;font-size:clamp(26px,6vw,44px);font-weight:900;letter-spacing:-.5px}
.title span{color:var(--amber)}
.sub{color:var(--muted);font-size:12px;margin-top:5px;letter-spacing:.06em;text-transform:uppercase}

/* Nav */
.nav{display:flex;gap:3px;background:var(--surf);border-radius:var(--r);padding:4px;margin-bottom:20px;position:sticky;top:8px;z-index:50;box-shadow:0 4px 24px rgba(0,0,0,.4)}
.nb{flex:1;padding:10px 6px;border:none;border-radius:var(--r-sm);background:transparent;color:var(--muted);cursor:pointer;font-family:inherit;font-size:13px;font-weight:500;transition:all .18s;white-space:nowrap}
.nb.on{background:var(--amber);color:#0d0f1a;font-weight:700}
.nb:hover:not(.on){color:var(--cream);background:var(--surf2)}

/* Cards */
.card{background:var(--surf);border:1px solid var(--border);border-radius:var(--r);padding:18px;margin-bottom:14px}
.ct{font-family:'Playfair Display',serif;font-size:17px;font-weight:700;color:var(--amber);margin-bottom:14px;display:flex;align-items:center;gap:8px}

/* Form */
input,select,textarea{background:var(--surf2);border:1px solid var(--border);border-radius:var(--r-sm);color:var(--cream);font-family:inherit;font-size:14px;padding:9px 13px;width:100%;transition:border-color .18s;outline:none}
input:focus,select:focus,textarea:focus{border-color:var(--amber)}
input::placeholder,textarea::placeholder{color:var(--muted)}
select option{background:var(--surf2)}
label{display:block;font-size:11px;font-weight:600;color:var(--muted);text-transform:uppercase;letter-spacing:.06em;margin-bottom:5px}
.field{margin-bottom:12px}
.row{display:flex;gap:9px;align-items:flex-end}
.row .field{flex:1;margin-bottom:0}

/* Buttons */
.btn{padding:10px 20px;border-radius:var(--r-sm);border:none;cursor:pointer;font-family:inherit;font-size:13px;font-weight:600;transition:all .16s;display:inline-flex;align-items:center;gap:6px}
.btn:disabled{opacity:.4;cursor:not-allowed}
.bp{background:var(--amber);color:#0d0f1a}.bp:hover:not(:disabled){background:var(--amber-l)}
.bs{background:var(--surf2);color:var(--cream);border:1px solid var(--border)}.bs:hover:not(:disabled){border-color:var(--amber);color:var(--amber)}
.bd{background:rgba(224,80,80,.12);color:var(--red);border:1px solid rgba(224,80,80,.25)}.bd:hover:not(:disabled){background:rgba(224,80,80,.22)}
.bg{background:transparent;color:var(--muted);border:1px solid transparent}.bg:hover{color:var(--cream);border-color:var(--border)}
.bsm{padding:6px 12px;font-size:12px}
.bfw{width:100%;justify-content:center}

/* Tags */
.tag{display:inline-flex;align-items:center;gap:5px;background:var(--amber-dim);border:1px solid rgba(212,146,30,.3);border-radius:99px;padding:4px 10px;font-size:12px;color:var(--amber-l)}
.tag-x{cursor:pointer;opacity:.6;line-height:1}.tag-x:hover{opacity:1}
.tags{display:flex;flex-wrap:wrap;gap:5px;margin-top:7px}

/* Score grid */
.sg{display:grid;grid-template-columns:repeat(10,1fr);gap:3px;margin-top:8px}
.sb{aspect-ratio:1;border:1px solid var(--border);border-radius:5px;background:var(--surf2);color:var(--cream2);cursor:pointer;font-size:12px;font-weight:600;transition:all .14s;padding:0}
.sb:hover,.sb.sel{background:var(--amber);color:#0d0f1a;border-color:var(--amber);transform:scale(1.05)}
.sb.half{font-size:10px}

/* Song row */
.srow{display:flex;align-items:center;gap:10px;padding:9px 12px;border-radius:var(--r-sm);background:rgba(255,255,255,.02);margin-bottom:3px}
.snum{font-size:10px;color:var(--muted);width:20px;text-align:right;flex-shrink:0}
.sinfo{flex:1;min-width:0}
.stitle{font-size:14px;font-weight:500;white-space:nowrap;overflow:hidden;text-overflow:ellipsis}
.sartist{font-size:11px;color:var(--muted);margin-top:1px}
.sscore{font-size:17px;font-weight:700;flex-shrink:0;min-width:38px;text-align:right}

/* Progress bar */
.pbar{height:4px;border-radius:99px;background:var(--border);margin-top:12px}
.pbar-f{height:100%;border-radius:99px;background:linear-gradient(90deg,var(--amber),var(--amber-l));transition:width .4s}

/* Set header */
.seth{display:flex;align-items:center;justify-content:space-between;padding:10px 13px;background:var(--surf2);border-radius:var(--r-sm);margin-bottom:6px}
.setl{font-family:'Playfair Display',serif;font-size:14px;font-weight:700;color:var(--amber)}

/* Stats */
.sgrid{display:grid;grid-template-columns:repeat(auto-fill,minmax(130px,1fr));gap:10px}
.sbox{background:var(--surf2);border-radius:var(--r-sm);padding:15px;text-align:center;border:1px solid var(--border)}
.sval{font-family:'Playfair Display',serif;font-size:26px;font-weight:900;color:var(--amber)}
.slbl{font-size:10px;color:var(--muted);text-transform:uppercase;letter-spacing:.06em;margin-top:3px}

/* Leaderboard */
.lb{display:flex;align-items:center;gap:10px;padding:11px 13px;border-radius:var(--r-sm);margin-bottom:5px;background:var(--surf2);border:1px solid var(--border)}
.lbr{font-family:'Playfair Display',serif;font-size:18px;font-weight:900;min-width:30px}
.lbr.g{color:#ffd700}.lbr.s{color:#c0c0c0}.lbr.b{color:#cd7f32}
.lbi{flex:1;min-width:0}
.lbsong{font-size:13px;font-weight:600;white-space:nowrap;overflow:hidden;text-overflow:ellipsis}
.lbartist{font-size:11px;color:var(--muted)}
.lbsc{font-size:20px;font-weight:700;flex-shrink:0}

/* Voter card */
.vc{background:var(--surf2);border:1px solid var(--border);border-radius:var(--r-sm);padding:13px;margin-bottom:9px}
.vch{display:flex;align-items:center;justify-content:space-between;margin-bottom:10px}
.vcn{font-size:14px;font-weight:600}

/* Realtime dot */
.dot{width:8px;height:8px;border-radius:50%;background:var(--green);display:inline-block;box-shadow:0 0 6px var(--green);animation:pulse 2s infinite}
@keyframes pulse{0%,100%{opacity:1}50%{opacity:.4}}

/* Empty */
.empty{text-align:center;padding:52px 20px;color:var(--muted)}
.ei{font-size:44px;margin-bottom:10px}

/* Misc */
.between{display:flex;align-items:center;justify-content:space-between}
.muted{color:var(--muted);font-size:13px}
.mt8{margin-top:8px}.mt12{margin-top:12px}.mt16{margin-top:16px}
.mb0{margin-bottom:0!important}
.divider{border:none;border-top:1px solid var(--border);margin:16px 0}
.conn-badge{display:inline-flex;align-items:center;gap:5px;font-size:11px;color:var(--muted)}
.summary-s{display:flex;justify-content:space-between;align-items:center;padding:7px 0;border-bottom:1px solid rgba(255,255,255,.04);font-size:13px}
.summary-s:last-child{border-bottom:none}
.spin-sm{display:inline-block;animation:spin .8s linear infinite;font-size:16px}
`;

// ── Helpers ──────────────────────────────────────────────────────────────────
const SCORE_VALS = [1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,7.5,8,8.5,9,9.5,10];
const DEFAULT_VOTERS = ["Jose J","Francisco","Hernan","Mario","Daniel","Jorge A.","Carlos","Freddy","Giusse","Mauricio O.","Tono","Mauricio R.","Lucho","Gino","Patrick","Alex","Julio","Dante","Kurt","Juan Carlos"];

function scoreColor(s){
  if(s===null||s===undefined)return"var(--muted)";
  if(s>=9)return"#4caf7d";if(s>=7.5)return"var(--amber-l)";if(s>=6)return"var(--cream)";return"var(--red)";
}
function avg(arr){
  const v=arr.filter(x=>x!=null&&!isNaN(x));
  if(!v.length)return null;
  return Math.round(v.reduce((a,b)=>a+Number(b),0)/v.length*100)/100;
}
function rankMeta(i){
  const classes=["g","s","b","","","","","","",""];
  const emojis=["🥇","🥈","🥉"];
  return{cls:classes[i]||"",label:emojis[i]||`#${i+1}`};
}
function fmtDate(d){
  return new Date(d).toLocaleDateString("es-PE",{weekday:"long",year:"numeric",month:"long",day:"numeric"});
}

// ── App ───────────────────────────────────────────────────────────────────────
export default function App(){
  const [tab,setTab]=useState("live");
  const [sessions,setSessions]=useState([]);
  const [loading,setLoading]=useState(true);
  const [connected,setConnected]=useState(false);

  // New session form
  const [showNew,setShowNew]=useState(false);
  const [nHost,setNHost]=useState("");
  const [nDate,setNDate]=useState(new Date().toISOString().slice(0,10));
  const [nAttendees,setNAttendees]=useState([]);
  const [nAttName,setNAttName]=useState("");
  const [nMode,setNMode]=useState("4x5");
  const [nInput,setNInput]=useState("host");
  const [creating,setCreating]=useState(false);

  // Live session
  const [liveSession,setLiveSession]=useState(null);// full session object
  const [liveSets,setLiveSets]=useState([]);// sets with songs+votes
  const [curSet,setCurSet]=useState(0);
  const [curSong,setCurSong]=useState(0);
  const [phase,setPhase]=useState("entry");// entry|voting|set_done|done
  const [saving,setSaving]=useState(false);
  const realtimeSub=useRef(null);

  // ── Load sessions ──────────────────────────────────────────────────────────
  const loadSessions=useCallback(async()=>{
    setLoading(true);
    const{data:sess}=await db.from("cyc_sessions").select("*").order("session_num",{ascending:false});
    if(!sess){setLoading(false);return;}
    // For each session load sets+songs+votes
    const full=await Promise.all(sess.map(async s=>{
      const{data:sets}=await db.from("cyc_sets").select("*").eq("session_id",s.id).order("set_index");
      const setsWithSongs=await Promise.all((sets||[]).map(async st=>{
        const{data:songs}=await db.from("cyc_songs").select("*").eq("set_id",st.id).order("song_index");
        const songsWithVotes=await Promise.all((songs||[]).map(async sg=>{
          const{data:votes}=await db.from("cyc_votes").select("*").eq("song_id",sg.id);
          const votesMap={};(votes||[]).forEach(v=>{votesMap[v.voter_name]=Number(v.score)});
          return{...sg,votes:votesMap};
        }));
        return{...st,songs:songsWithVotes};
      }));
      return{...s,sets:setsWithSongs};
    }));
    setSessions(full);
    setLoading(false);
    setConnected(true);
  },[]);

  useEffect(()=>{loadSessions();},[loadSessions]);

  // ── Subscribe to realtime on live session ──────────────────────────────────
  useEffect(()=>{
    if(!liveSession)return;
    const sub=db.channel(`cyc_live_${liveSession.id}`)
      .on("postgres_changes",{event:"*",schema:"public",table:"cyc_votes"},(payload)=>{
        // refresh live sets when a vote lands
        refreshLiveSets(liveSession.id);
      })
      .subscribe();
    realtimeSub.current=sub;
    return()=>{db.removeChannel(sub)};
  },[liveSession]);

  const refreshLiveSets=useCallback(async(sessionId)=>{
    const{data:sets}=await db.from("cyc_sets").select("*").eq("session_id",sessionId).order("set_index");
    const setsWithSongs=await Promise.all((sets||[]).map(async st=>{
      const{data:songs}=await db.from("cyc_songs").select("*").eq("set_id",st.id).order("song_index");
      const songsWithVotes=await Promise.all((songs||[]).map(async sg=>{
        const{data:votes}=await db.from("cyc_votes").select("*").eq("song_id",sg.id);
        const vm={};(votes||[]).forEach(v=>{vm[v.voter_name]=Number(v.score)});
        return{...sg,votes:vm};
      }));
      return{...st,songs:songsWithVotes};
    }));
    setLiveSets(setsWithSongs);
  },[]);

  // ── Create session ─────────────────────────────────────────────────────────
  async function createSession(){
    if(!nHost||!nAttendees.length)return;
    setCreating(true);
    const[sC,sgC]=nMode==="4x5"?[4,5]:[5,4];
    const sessionNum=sessions.length+1;

    const{data:sess,error}=await db.from("cyc_sessions").insert({
      session_num:sessionNum,host:nHost,date:nDate,
      attendees:nAttendees,input_mode:nInput,
      sets_count:sC,songs_count:sgC,complete:false
    }).select().single();
    if(error||!sess){setCreating(false);alert("Error al crear sesión: "+error?.message);return;}

    // Create sets and songs
    const allSets=[];
    for(let si=0;si<sC;si++){
      const{data:setRow}=await db.from("cyc_sets").insert({
        session_id:sess.id,set_index:si,label:`Set ${si+1}`
      }).select().single();
      const songs=[];
      for(let so=0;so<sgC;so++){
        const{data:song}=await db.from("cyc_songs").insert({
          set_id:setRow.id,song_index:so,artist:"",title:""
        }).select().single();
        songs.push({...song,votes:{}});
      }
      allSets.push({...setRow,songs});
    }

    setLiveSession(sess);
    setLiveSets(allSets);
    setCurSet(0);setCurSong(0);setPhase("entry");
    setShowNew(false);setNHost("");setNAttendees([]);
    setCreating(false);setTab("live");
  }

  // ── Update song metadata ───────────────────────────────────────────────────
  async function saveSongMeta(setIdx,songIdx,field,value){
    const song=liveSets[setIdx]?.songs[songIdx];
    if(!song)return;
    const updated=[...liveSets];
    updated[setIdx].songs[songIdx][field]=value;
    setLiveSets(updated);
    // Debounce DB write
    await db.from("cyc_songs").update({[field]:value}).eq("id",song.id);
  }

  // ── Cast a vote ────────────────────────────────────────────────────────────
  async function castVote(setIdx,songIdx,voter,score){
    const song=liveSets[setIdx]?.songs[songIdx];
    if(!song)return;
    // Optimistic update
    const updated=JSON.parse(JSON.stringify(liveSets));
    updated[setIdx].songs[songIdx].votes[voter]=score;
    setLiveSets(updated);
    // Upsert
    await db.from("cyc_votes").upsert(
      {song_id:song.id,voter_name:voter,score,updated_at:new Date().toISOString()},
      {onConflict:"song_id,voter_name"}
    );
  }

  // ── Navigation ─────────────────────────────────────────────────────────────
  function openVoting(){
    const song=liveSets[curSet]?.songs[curSong];
    if(!song?.artist||!song?.title)return;
    setPhase("voting");
  }
  function nextSong(){
    const sgC=liveSession.songs_count;
    const sC=liveSession.sets_count;
    if(curSong<sgC-1){setCurSong(curSong+1);setPhase("entry");}
    else if(curSet<sC-1){setPhase("set_done");}
    else{finishSession();}
  }
  function moveToNextSet(){setCurSet(curSet+1);setCurSong(0);setPhase("entry");}
  async function finishSession(){
    await db.from("cyc_sessions").update({complete:true}).eq("id",liveSession.id);
    await loadSessions();
    setLiveSession(null);setLiveSets([]);setPhase("entry");setTab("history");
  }

  // ── Computed ───────────────────────────────────────────────────────────────
  function songAvg(song){
    const vals=Object.values(song.votes||{}).filter(v=>!isNaN(v));
    return avg(vals);
  }
  function voteCount(song){return Object.keys(song.votes||{}).filter(k=>song.votes[k]!=null).length;}
  function setAvg(set){
    const avgs=set.songs.map(s=>songAvg(s)).filter(x=>x!==null);
    return avg(avgs);
  }

  const curLiveSong=liveSets[curSet]?.songs[curSong];
  const totalSongs=(liveSession?.sets_count||0)*(liveSession?.songs_count||0);
  const doneCount=curSet*(liveSession?.songs_count||0)+curSong;

  // All-time top songs
  function topSongs(n=10){
    return sessions
      .flatMap(s=>s.sets.flatMap(st=>st.songs.map(sg=>({...sg,sessionHost:s.host,sessionDate:s.date,setLabel:st.label}))))
      .filter(s=>s.title&&songAvg(s)!==null)
      .sort((a,b)=>songAvg(b)-songAvg(a))
      .slice(0,n);
  }
  function voterStats(){
    const map={};
    sessions.forEach(s=>s.sets.forEach(st=>st.songs.forEach(sg=>{
      Object.entries(sg.votes||{}).forEach(([voter,score])=>{
        if(!map[voter])map[voter]={sum:0,count:0};
        map[voter].sum+=Number(score);map[voter].count++;
      });
    })));
    return Object.entries(map)
      .map(([name,d])=>({name,avg:Math.round(d.sum/d.count*100)/100,count:d.count}))
      .sort((a,b)=>b.avg-a.avg);
  }

  // ── Render ─────────────────────────────────────────────────────────────────
  return(
    <>
      <style>{CSS}</style>
      <div className="app">

        {/* Header */}
        <header className="hdr">
          <div className="vinyl"><div className="vinyl-c"/></div>
          <h1 className="title">Compás <span>&</span> Copas</h1>
          <p className="sub">
            {connected
              ? <><span className="dot"/> Conectado · Tiempo real</>
              : "Conectando…"}
          </p>
        </header>

        {/* Nav */}
        <nav className="nav">
          <button className={`nb ${tab==="live"?"on":""}`} onClick={()=>setTab("live")}>🎵 Sesión</button>
          <button className={`nb ${tab==="history"?"on":""}`} onClick={()=>setTab("history")}>📚 Historial</button>
          <button className={`nb ${tab==="stats"?"on":""}`} onClick={()=>setTab("stats")}>📊 Stats</button>
        </nav>

        {/* ══ TAB LIVE ══════════════════════════════════════════════════════ */}
        {tab==="live"&&<>

          {/* No session active */}
          {!liveSession&&!showNew&&(
            <div className="empty">
              <div className="ei">🎸</div>
              <p style={{fontSize:17,fontWeight:600,color:"var(--cream)"}}>Sin sesión activa</p>
              <p className="muted mt8">Crea una nueva sesión para empezar a votar</p>
              <button className="btn bp mt16" onClick={()=>setShowNew(true)}>+ Nueva sesión</button>
            </div>
          )}

          {/* New session form */}
          {showNew&&!liveSession&&(
            <div className="card">
              <div className="ct">🎉 Nueva sesión</div>
              <div className="row">
                <div className="field"><label>Anfitrión</label>
                  <input placeholder="¿Quién pone la música?" value={nHost} onChange={e=>setNHost(e.target.value)}/>
                </div>
                <div className="field"><label>Fecha</label>
                  <input type="date" value={nDate} onChange={e=>setNDate(e.target.value)}/>
                </div>
              </div>
              <div className="row">
                <div className="field"><label>Formato</label>
                  <select value={nMode} onChange={e=>setNMode(e.target.value)}>
                    <option value="4x5">4 sets × 5 canciones</option>
                    <option value="5x4">5 sets × 4 canciones</option>
                  </select>
                </div>
                <div className="field"><label>Modo votación</label>
                  <select value={nInput} onChange={e=>setNInput(e.target.value)}>
                    <option value="host">Anfitrión ingresa votos</option>
                    <option value="individual">Cada asistente en su celular</option>
                  </select>
                </div>
              </div>
              <div className="field"><label>Asistentes</label>
                <div className="row">
                  <div className="field mb0" style={{flex:1}}>
                    <input placeholder="Nombre…" value={nAttName}
                      onChange={e=>setNAttName(e.target.value)}
                      onKeyDown={e=>{if(e.key==="Enter"&&nAttName.trim()){setNAttendees([...nAttendees,nAttName.trim()]);setNAttName("");}}}
                      list="vlist"/>
                    <datalist id="vlist">{DEFAULT_VOTERS.map(v=><option key={v} value={v}/>)}</datalist>
                  </div>
                  <button className="btn bs bsm" onClick={()=>{if(nAttName.trim()){setNAttendees([...nAttendees,nAttName.trim()]);setNAttName("");}}}>+ Agregar</button>
                </div>
                {nAttendees.length>0&&(
                  <div className="tags mt8">
                    {nAttendees.map(a=><span key={a} className="tag">{a} <span className="tag-x" onClick={()=>setNAttendees(nAttendees.filter(x=>x!==a))}>×</span></span>)}
                  </div>
                )}
              </div>
              <div className="row mt12">
                <button className="btn bs" onClick={()=>setShowNew(false)}>Cancelar</button>
                <button className="btn bp bfw" onClick={createSession}
                  disabled={!nHost||!nAttendees.length||creating}>
                  {creating?<span className="spin-sm">⟳</span>:null}
                  {creating?"Creando…":`🎵 Iniciar con ${nAttendees.length} asistente${nAttendees.length!==1?"s":""}`}
                </button>
              </div>
            </div>
          )}

          {/* ── Live session ── */}
          {liveSession&&<>

            {/* Session bar */}
            <div className="card">
              <div className="between">
                <div>
                  <div style={{fontSize:11,color:"var(--muted)",textTransform:"uppercase",letterSpacing:".06em"}}>Sesión #{liveSession.session_num}</div>
                  <div style={{fontSize:19,fontFamily:"'Playfair Display',serif",fontWeight:700}}>🎙 {liveSession.host}</div>
                  <div className="muted" style={{marginTop:3,fontSize:12}}>{fmtDate(liveSession.date)} · {liveSession.attendees?.length} asistentes</div>
                </div>
                <div style={{textAlign:"right"}}>
                  <div style={{fontSize:26,fontFamily:"'Playfair Display',serif",fontWeight:900,color:"var(--amber)"}}>{doneCount}/{totalSongs}</div>
                  <div style={{fontSize:10,color:"var(--muted)",textTransform:"uppercase"}}>canciones</div>
                </div>
              </div>
              <div className="pbar"><div className="pbar-f" style={{width:`${totalSongs>0?(doneCount/totalSongs)*100:0}%`}}/></div>
              <div style={{display:"flex",justifyContent:"space-between",marginTop:5}}>
                {liveSets.map((s,i)=>(
                  <span key={i} style={{fontSize:10,color:i===curSet?"var(--amber)":"var(--muted)",fontWeight:i===curSet?700:400}}>{s.label}</span>
                ))}
              </div>
            </div>

            {/* PHASE: entry */}
            {phase==="entry"&&curLiveSong&&(
              <div className="card">
                <div className="ct">🎵 {liveSets[curSet]?.label} · Canción {curSong+1}</div>
                <div className="field"><label>Artista / Banda</label>
                  <input placeholder="Ej: Pink Floyd" value={curLiveSong.artist||""}
                    onChange={e=>saveSongMeta(curSet,curSong,"artist",e.target.value)} autoFocus/>
                </div>
                <div className="field"><label>Canción</label>
                  <input placeholder="Ej: Wish You Were Here" value={curLiveSong.title||""}
                    onChange={e=>saveSongMeta(curSet,curSong,"title",e.target.value)}
                    onKeyDown={e=>e.key==="Enter"&&openVoting()}/>
                </div>
                <button className="btn bp bfw mt12" onClick={openVoting} disabled={!curLiveSong.artist||!curLiveSong.title}>
                  🗳 Abrir votación
                </button>
              </div>
            )}

            {/* PHASE: voting */}
            {phase==="voting"&&curLiveSong&&(
              <div className="card">
                <div className="ct">
                  🗳 Votando
                  <span style={{fontSize:13,color:"var(--cream2)",fontFamily:"'DM Sans'"}}>{curLiveSong.artist} — {curLiveSong.title}</span>
                </div>
                {(liveSession.attendees||[]).map(voter=>{
                  const v=curLiveSong.votes?.[voter]??null;
                  return(
                    <div key={voter} className="vc">
                      <div className="vch">
                        <span className="vcn">👤 {voter}</span>
                        {v!==null&&<span style={{fontSize:22,fontWeight:900,color:scoreColor(v)}}>{v}</span>}
                      </div>
                      <div className="sg">
                        {SCORE_VALS.map(sv=>(
                          <button key={sv} className={`sb ${sv%1!==0?"half":""} ${v===sv?"sel":""}`}
                            onClick={()=>castVote(curSet,curSong,voter,sv)}>{sv}</button>
                        ))}
                      </div>
                    </div>
                  );
                })}
                {(()=>{
                  const a=songAvg(curLiveSong);const cnt=voteCount(curLiveSong);
                  return a!==null&&(
                    <div style={{textAlign:"center",padding:"14px 0"}}>
                      <div style={{fontSize:12,color:"var(--muted)",textTransform:"uppercase",letterSpacing:".06em"}}>Promedio parcial ({cnt}/{liveSession.attendees?.length})</div>
                      <div style={{fontSize:48,fontFamily:"'Playfair Display',serif",fontWeight:900,color:scoreColor(a)}}>{a}</div>
                    </div>
                  );
                })()}
                <button className="btn bp bfw" onClick={nextSong} disabled={voteCount(curLiveSong)<1}>
                  {curSong<liveSession.songs_count-1?"Siguiente canción →":curSet<liveSession.sets_count-1?`Cerrar ${liveSets[curSet]?.label} →`:"✅ Finalizar sesión"}
                </button>
              </div>
            )}

            {/* PHASE: set_done */}
            {phase==="set_done"&&(
              <div className="card" style={{textAlign:"center"}}>
                <div style={{fontSize:44}}>🥂</div>
                <div style={{fontFamily:"'Playfair Display',serif",fontSize:22,fontWeight:700,margin:"10px 0 6px"}}>{liveSets[curSet]?.label} completado</div>
                <div style={{marginBottom:14}}>
                  {liveSets[curSet]?.songs.map((s,i)=>(
                    <div key={i} className="summary-s">
                      <span>{s.artist} — {s.title}</span>
                      {songAvg(s)!==null&&<span style={{fontWeight:700,color:scoreColor(songAvg(s))}}>{songAvg(s)}</span>}
                    </div>
                  ))}
                </div>
                {liveSets[curSet+1]&&<button className="btn bp" onClick={moveToNextSet}>🎵 Iniciar {liveSets[curSet+1]?.label} →</button>}
              </div>
            )}

            {/* Completed sets preview */}
            {phase!=="set_done"&&liveSets.slice(0,curSet+(phase==="voting"?1:0)).map((set,si)=>(
              <div key={si} className="card" style={{padding:"14px"}}>
                <div className="seth">
                  <span className="setl">{set.label}</span>
                  {setAvg(set)!==null&&<span style={{color:scoreColor(setAvg(set)),fontWeight:700,fontSize:13}}>avg {setAvg(set)}</span>}
                </div>
                {set.songs.filter(s=>s.title).map((song,so)=>(
                  <div key={so} className="srow">
                    <span className="snum">{so+1}</span>
                    <div className="sinfo"><div className="stitle">{song.title}</div><div className="sartist">{song.artist}</div></div>
                    {songAvg(song)!==null&&<span className="sscore" style={{color:scoreColor(songAvg(song))}}>{songAvg(song)}</span>}
                  </div>
                ))}
              </div>
            ))}

            <div style={{textAlign:"center",marginTop:12}}>
              <button className="btn bg bsm" onClick={()=>{if(window.confirm("¿Abandonar sesión? Los datos ya guardados en Supabase se conservan."))setLiveSession(null);}}>
                Abandonar
              </button>
            </div>
          </>}
        </>}

        {/* ══ TAB HISTORY ═══════════════════════════════════════════════════ */}
        {tab==="history"&&<>
          <div className="between" style={{marginBottom:14}}>
            <h2 style={{fontFamily:"'Playfair Display',serif",fontSize:18}}>{sessions.length} sesiones</h2>
            <div style={{display:"flex",gap:8}}>
              <button className="btn bs bsm" onClick={loadSessions}>↻ Refresh</button>
              <button className="btn bp bsm" onClick={()=>{setTab("live");setShowNew(true);}}>+ Nueva</button>
            </div>
          </div>

          {loading&&<div className="empty"><div className="ei">⟳</div><p className="muted">Cargando…</p></div>}

          {!loading&&sessions.length===0&&(
            <div className="empty"><div className="ei">📭</div><p className="muted">Aún no hay sesiones guardadas</p></div>
          )}

          {sessions.map(session=>{
            const allSongs=session.sets.flatMap(st=>st.songs.filter(s=>s.title));
            const allAvgs=allSongs.map(s=>songAvg(s)).filter(x=>x!==null);
            const gAvg=avg(allAvgs);
            const ranked=[...allSongs].sort((a,b)=>songAvg(b)-songAvg(a));
            return(
              <div key={session.id} className="card">
                <div className="between" style={{marginBottom:10}}>
                  <div>
                    <div style={{fontFamily:"'Playfair Display',serif",fontSize:17,fontWeight:700}}>Sesión #{session.session_num} · {session.host}</div>
                    <div className="muted" style={{fontSize:12,marginTop:3}}>{fmtDate(session.date)} · {session.attendees?.join(", ")}</div>
                  </div>
                  {gAvg!==null&&<div style={{textAlign:"right"}}>
                    <div style={{fontSize:26,fontFamily:"'Playfair Display',serif",fontWeight:900,color:scoreColor(gAvg)}}>{gAvg}</div>
                    <div style={{fontSize:10,color:"var(--muted)",textTransform:"uppercase"}}>promedio</div>
                  </div>}
                </div>

                {/* Top 3 */}
                {ranked.slice(0,3).map((song,i)=>{
                  const{cls,label}=rankMeta(i);
                  return(
                    <div key={i} className="lb">
                      <span className={`lbr ${cls}`}>{label}</span>
                      <div className="lbi"><div className="lbsong">{song.title}</div><div className="lbartist">{song.artist}</div></div>
                      <span className="lbsc" style={{color:scoreColor(songAvg(song))}}>{songAvg(song)}</span>
                    </div>
                  );
                })}

                {/* All sets */}
                {session.sets.map((set,si)=>(
                  <div key={si} style={{marginTop:8}}>
                    <div className="seth">
                      <span className="setl">{set.label}</span>
                      {setAvg(set)!==null&&<span style={{color:scoreColor(setAvg(set)),fontWeight:700,fontSize:12}}>avg {setAvg(set)}</span>}
                    </div>
                    {set.songs.map((song,so)=>(
                      <div key={so} className="srow">
                        <span className="snum">{so+1}</span>
                        <div className="sinfo">
                          <div className="stitle">{song.title||<span style={{color:"var(--muted)"}}>—</span>}</div>
                          <div className="sartist">{song.artist}</div>
                        </div>
                        <div style={{textAlign:"right"}}>
                          {songAvg(song)!==null&&<div className="sscore" style={{color:scoreColor(songAvg(song))}}>{songAvg(song)}</div>}
                          <div style={{fontSize:10,color:"var(--muted)"}}>{voteCount(song)} votos</div>
                        </div>
                      </div>
                    ))}
                  </div>
                ))}

                <div style={{marginTop:12}}>
                  <button className="btn bd bsm" onClick={async()=>{
                    if(window.confirm("¿Eliminar esta sesión? Se borrará de Supabase.")){
                      await db.from("cyc_sessions").delete().eq("id",session.id);
                      loadSessions();
                    }
                  }}>Eliminar</button>
                </div>
              </div>
            );
          })}
        </>}

        {/* ══ TAB STATS ═════════════════════════════════════════════════════ */}
        {tab==="stats"&&<>
          {sessions.length===0?(
            <div className="empty"><div className="ei">📊</div><p className="muted">Completa una sesión para ver estadísticas</p></div>
          ):<>
            {/* Global numbers */}
            <div className="card">
              <div className="ct">🌐 General</div>
              <div className="sgrid">
                <div className="sbox"><div className="sval">{sessions.length}</div><div className="slbl">Sesiones</div></div>
                <div className="sbox">
                  <div className="sval">{sessions.reduce((a,s)=>a+s.sets.flatMap(st=>st.songs).filter(sg=>sg.title).length,0)}</div>
                  <div className="slbl">Canciones</div>
                </div>
                <div className="sbox">
                  <div className="sval" style={{color:"var(--amber-l)"}}>
                    {(()=>{const all=sessions.flatMap(s=>s.sets.flatMap(st=>st.songs).map(sg=>songAvg(sg))).filter(x=>x!==null);return avg(all)??"—";})()}
                  </div>
                  <div className="slbl">Promedio global</div>
                </div>
                <div className="sbox">
                  <div className="sval">{new Set(sessions.flatMap(s=>s.attendees||[])).size}</div>
                  <div className="slbl">Asistentes únicos</div>
                </div>
              </div>
            </div>

            {/* Top 10 songs all-time */}
            <div className="card">
              <div className="ct">🏆 Top 10 canciones de todos los tiempos</div>
              {topSongs(10).map((song,i)=>{
                const{cls,label}=rankMeta(i);
                return(
                  <div key={i} className="lb">
                    <span className={`lbr ${cls}`}>{label}</span>
                    <div className="lbi">
                      <div className="lbsong">{song.title}</div>
                      <div className="lbartist">{song.artist} · {song.sessionHost} · {new Date(song.sessionDate).toLocaleDateString("es-PE")}</div>
                    </div>
                    <span className="lbsc" style={{color:scoreColor(songAvg(song))}}>{songAvg(song)}</span>
                  </div>
                );
              })}
            </div>

            {/* Voter stats */}
            <div className="card">
              <div className="ct">👥 Votantes · promedio que dan</div>
              {voterStats().map((v,i)=>{
                const{cls,label}=rankMeta(i);
                return(
                  <div key={v.name} className="lb">
                    <span className={`lbr ${cls}`}>{label}</span>
                    <div className="lbi"><div className="lbsong">{v.name}</div><div className="lbartist">{v.count} votos emitidos</div></div>
                    <span className="lbsc" style={{color:scoreColor(v.avg)}}>{v.avg}</span>
                  </div>
                );
              })}
            </div>

            {/* Session avg chart */}
            <div className="card">
              <div className="ct">📈 Promedio por sesión</div>
              {[...sessions].reverse().map(session=>{
                const allAvgs=session.sets.flatMap(st=>st.songs).map(s=>songAvg(s)).filter(x=>x!==null);
                const gAvg=avg(allAvgs);
                return(
                  <div key={session.id} style={{marginBottom:10}}>
                    <div className="between" style={{marginBottom:3}}>
                      <span style={{fontSize:12}}>#{session.session_num} {session.host}</span>
                      {gAvg!==null&&<span style={{color:scoreColor(gAvg),fontWeight:700,fontSize:12}}>{gAvg}</span>}
                    </div>
                    {gAvg!==null&&<div className="pbar"><div className="pbar-f" style={{width:`${(gAvg/10)*100}%`}}/></div>}
                  </div>
                );
              })}
            </div>
          </>}
        </>}

      </div>
    </>
  );
}
