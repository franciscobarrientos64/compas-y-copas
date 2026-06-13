import { useState, useEffect, useCallback, useRef } from "react";
import { createClient } from "@supabase/supabase-js";

const SUPA_URL = "https://jmkvphayyhwzootlybde.supabase.co";
const SUPA_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Impta3ZwaGF5eWh3em9vdGx5YmRlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Nzc5ODE3ODEsImV4cCI6MjA5MzU1Nzc4MX0.EP2vv5avU1FIXlZn4jFo3QkvqnxOdLOrICqNV8qAZxM";
const db = createClient(SUPA_URL, SUPA_KEY);

const DEFAULT_VOTERS = ["Alex","Alex2","Carlos","Claudio","Daniel","Dante","Francisco","Freddy","Gino","Giusse","Hernan","Jorge A.","Jose J","Juan Carlos","Julio","Kurt","Lucho","Mario","Mauricio O.","Mauricio R.","Patrick","Ricardo V.","Tono"];
const SCORE_VALS = [1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,7.5,8,8.5,9,9.5,10];

/* ══════════════════════════════════════════════════════════════
   ATARI 80s ARCADE CSS — pixel grids, scanlines, joystick energy
══════════════════════════════════════════════════════════════ */
const CSS = `
@import url('https://fonts.googleapis.com/css2?family=Press+Start+2P&family=Share+Tech+Mono&family=Orbitron:wght@700;900&display=swap');

*, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

:root {
  /* Paleta cyan/celeste — arcade 80s */
  --bg: #000d18;
  --bg2: #001525;
  --surf: #001e30;
  --surf2: #00253a;
  --border: #003a55;
  --border2: #005577;

  /* Neon cyan dominante */
  --magenta: #00ccff;   /* cyan eléctrico — dominante */
  --mag2: rgba(0,204,255,.12);
  --cyan: #00ffff;      /* cyan puro — acento */
  --cyn2: rgba(0,255,255,.1);
  --yellow: #ffff00;    /* amarillo — highlights y scores altos */
  --orange: #00aaff;    /* azul eléctrico */
  --green: #00ffcc;     /* verde agua */
  --red: #ff4466;
  --white: #ffffff;
  --cream: #aaeeff;     /* texto principal — celeste suave */
  --muted: #1a6688;
  --r: 0px;
}

body {
  background: var(--bg);
  color: var(--cream);
  font-family: 'Share Tech Mono', monospace;
  min-height: 100vh;
  overflow-x: hidden;
}

/* ── GRID SYNTHWAVE en el fondo ── */
body::after {
  content: '';
  position: fixed;
  inset: 0;
  background-image: 
    linear-gradient(rgba(0,204,255,.04) 1px, transparent 1px),
    linear-gradient(90deg, rgba(0,204,255,.04) 1px, transparent 1px);
  background-size: 32px 32px;
  pointer-events: none;
  z-index: 0;
}

/* ── SCANLINES ── */
body::before {
  content: '';
  position: fixed;
  inset: 0;
  background: repeating-linear-gradient(
    0deg,
    transparent,
    transparent 3px,
    rgba(0,0,0,.25) 3px,
    rgba(0,0,0,.25) 4px
  );
  pointer-events: none;
  z-index: 9998;
}

.app { 
  max-width: 860px; 
  margin: 0 auto; 
  padding: 16px 12px 80px;
  position: relative;
  z-index: 1;
}

/* ── HEADER — estilo arcade cabinet screen ── */
.hdr {
  text-align: center;
  padding: 28px 0 20px;
  position: relative;
}

/* Líneas decorativas tipo equalizer */
.hdr-eq {
  display: flex; align-items: flex-end; justify-content: center;
  gap: 3px; height: 28px; margin-bottom: 14px;
}
.eq-bar {
  width: 6px;
  background: var(--magenta);
  box-shadow: 0 0 6px var(--magenta);
  image-rendering: pixelated;
  animation: eq-bounce var(--d, 0.6s) steps(4) infinite alternate;
}
@keyframes eq-bounce {
  from { height: 20%; opacity: .5; }
  to   { height: 100%; opacity: 1; }
}

/* Pixel corners */
.pixel-border {
  position: relative;
  display: inline-block;
  padding: 8px 16px;
}
.pixel-border::before, .pixel-border::after {
  content: '';
  position: absolute;
  width: 8px; height: 8px;
  background: var(--magenta);
  box-shadow: 0 0 8px var(--magenta);
}
.pixel-border::before { top: 0; left: 0; }
.pixel-border::after  { bottom: 0; right: 0; }

.title {
  font-family: 'Press Start 2P', monospace;
  font-size: clamp(12px, 3.5vw, 24px);
  letter-spacing: 2px;
  text-transform: uppercase;
  color: var(--magenta);
  text-shadow: 
    3px 3px 0 #004466,
    0 0 20px var(--cyan),
    0 0 40px rgba(0,204,255,.4);
  line-height: 1.4;
  display: block;
}
.title-amp { 
  color: var(--cyan); 
  text-shadow: 3px 3px 0 #006666, 0 0 20px var(--cyan), 0 0 40px rgba(0,255,255,.4);
}
.sub {
  font-family: 'Share Tech Mono', monospace;
  font-size: 10px;
  color: var(--muted);
  text-transform: uppercase;
  letter-spacing: .25em;
  margin-top: 10px;
}
.dot-on {
  width: 6px; height: 6px;
  display: inline-block;
  background: var(--green);
  box-shadow: 0 0 6px var(--green);
  animation: blink 0.8s steps(1) infinite;
}
@keyframes blink { 0%,100%{opacity:1} 50%{opacity:0} }

/* ── SCORE coin effect ── */
.coin {
  display: inline-block;
  width: 10px; height: 10px;
  background: var(--yellow);
  box-shadow: 0 0 8px var(--yellow);
  animation: coin-spin 1s steps(4) infinite;
}
@keyframes coin-spin {
  0%   { transform: scaleX(1); }
  25%  { transform: scaleX(.5); }
  50%  { transform: scaleX(.1); }
  75%  { transform: scaleX(.5); }
  100% { transform: scaleX(1); }
}

/* ── NAV ── */
.nav {
  display: flex; gap: 0;
  background: var(--surf);
  border: 2px solid var(--magenta);
  box-shadow: 0 0 16px rgba(0,204,255,.4), inset 0 0 20px rgba(0,204,255,.05);
  padding: 0;
  margin-bottom: 20px;
  position: sticky; top: 8px; z-index: 50;
}
.nb {
  flex: 1; padding: 12px 6px;
  border: none;
  border-right: 2px solid var(--border);
  background: transparent;
  color: var(--muted);
  cursor: pointer;
  font-family: 'Press Start 2P', monospace;
  font-size: 7px;
  letter-spacing: .05em;
  text-transform: uppercase;
  transition: all .1s steps(1);
}
.nb:last-child { border-right: none; }
.nb.on {
  background: var(--magenta);
  color: var(--bg);
  text-shadow: none;
  box-shadow: inset 0 -3px 0 rgba(0,0,0,.4);
}
.nb:hover:not(.on) { 
  background: var(--surf2);
  color: var(--magenta); 
}

/* ── CARDS — estilo pantalla de videojuego ── */
.card {
  background: var(--surf);
  border: 2px solid var(--border);
  padding: 16px;
  margin-bottom: 12px;
  position: relative;
  overflow: hidden;
}

/* pixel corner decorations */
.card::before, .card::after {
  content: '';
  position: absolute;
  width: 6px; height: 6px;
}
.card::before {
  top: -1px; left: -1px;
  border-top: 2px solid var(--magenta);
  border-left: 2px solid var(--magenta);
  box-shadow: 0 0 4px var(--magenta);
}
.card::after {
  bottom: -1px; right: -1px;
  border-bottom: 2px solid var(--magenta);
  border-right: 2px solid var(--magenta);
  box-shadow: 0 0 4px var(--magenta);
}
.card.mag { border-color: var(--magenta); }
.card.mag::before, .card.mag::after { border-color: var(--cyan); box-shadow: 0 0 4px var(--cyan); }
.card.yel { border-color: var(--orange); }
.card.yel::before, .card.yel::after { border-color: var(--yellow); box-shadow: 0 0 4px var(--yellow); }
.card.grn { border-color: var(--green); }
.card.grn::before, .card.grn::after { border-color: var(--cyan); box-shadow: 0 0 4px var(--cyan); }

.ct {
  font-family: 'Press Start 2P', monospace;
  font-size: 8px;
  letter-spacing: .1em;
  text-transform: uppercase;
  color: var(--cyan);
  text-shadow: 1px 1px 0 #006666, 0 0 8px var(--cyan);
  margin-bottom: 14px;
  display: flex; align-items: center; gap: 8px;
}
.ct.mag { color: var(--magenta); text-shadow: 1px 1px 0 #004466, 0 0 8px var(--magenta); }
.ct.yel { color: var(--yellow); text-shadow: 1px 1px 0 #666600, 0 0 8px var(--yellow); }
.ct.grn { color: var(--green); text-shadow: 1px 1px 0 #006622, 0 0 8px var(--green); }

/* ── FORM ── */
input, select {
  background: #000;
  border: 2px solid var(--border);
  color: var(--green);
  font-family: 'Share Tech Mono', monospace;
  font-size: 13px;
  padding: 8px 10px;
  width: 100%;
  outline: none;
  transition: border-color .1s steps(1);
}
input:focus, select:focus {
  border-color: var(--cyan);
  box-shadow: 0 0 0 1px var(--cyan), inset 0 0 10px rgba(0,255,255,.05);
}
input::placeholder { color: #333366; }
select option { background: #000; color: var(--green); }
label {
  display: block;
  font-family: 'Press Start 2P', monospace;
  font-size: 7px;
  color: var(--muted);
  text-transform: uppercase;
  letter-spacing: .08em;
  margin-bottom: 5px;
}
.field { margin-bottom: 12px; }
.row { display: flex; gap: 8px; align-items: flex-end; }
.row .field { flex: 1; margin-bottom: 0; }

/* ── BUTTONS — pixel style ── */
.btn {
  padding: 10px 18px;
  border: 2px solid;
  cursor: pointer;
  font-family: 'Press Start 2P', monospace;
  font-size: 7px;
  letter-spacing: .08em;
  text-transform: uppercase;
  transition: all .05s steps(1);
  display: inline-flex; align-items: center; gap: 8px;
  image-rendering: pixelated;
}
.btn:disabled { opacity: .3; cursor: not-allowed; }
.bp {
  background: var(--cyan);
  border-color: var(--cyan);
  color: #000;
  box-shadow: 3px 3px 0 #006666;
}
.bp:hover:not(:disabled) {
  background: #000;
  color: var(--cyan);
  box-shadow: 3px 3px 0 var(--cyan);
}
.bp:active:not(:disabled) { transform: translate(2px,2px); box-shadow: 1px 1px 0 #006666; }
.bm {
  background: var(--magenta);
  border-color: var(--magenta);
  color: #000;
  box-shadow: 3px 3px 0 #004466;
}
.bm:hover:not(:disabled) { background: #000; color: var(--magenta); box-shadow: 3px 3px 0 var(--magenta); }
.bm:active:not(:disabled) { transform: translate(2px,2px); box-shadow: 1px 1px 0 #004466; }
.bs {
  background: transparent;
  border-color: var(--muted);
  color: var(--muted);
}
.bs:hover:not(:disabled) { border-color: var(--cream); color: var(--cream); }
.bd {
  background: var(--red);
  border-color: var(--red);
  color: #fff;
  box-shadow: 3px 3px 0 #660000;
}
.bd:hover:not(:disabled) { background: #000; color: var(--red); }
.bsm { padding: 7px 12px; font-size: 6px; }
.bfw { width: 100%; justify-content: center; }

/* ── TAGS ── */
.tag {
  display: inline-flex; align-items: center; gap: 5px;
  background: #000;
  border: 1px solid var(--cyan);
  padding: 3px 7px;
  font-family: 'Share Tech Mono', monospace;
  font-size: 11px;
  color: var(--cyan);
}
.tag-x { cursor: pointer; opacity: .6; }
.tag-x:hover { opacity: 1; color: var(--red); }
.tags { display: flex; flex-wrap: wrap; gap: 4px; margin-top: 7px; }

/* ── SCORE GRID — pixel buttons ── */
.sg { display: grid; grid-template-columns: repeat(10,1fr); gap: 2px; margin-top: 8px; }
.sb {
  aspect-ratio: 1;
  border: 2px solid var(--border);
  background: #000;
  color: var(--muted);
  cursor: pointer;
  font-family: 'Press Start 2P', monospace;
  font-size: 8px;
  transition: all .05s steps(1);
  padding: 0;
}
.sb:hover, .sb.sel {
  background: var(--magenta);
  border-color: var(--magenta);
  color: #000;
  box-shadow: 0 0 8px var(--magenta);
  transform: scale(1.05);
}
.sb.half { font-size: 6px; }

/* ── SONG ROW ── */
.srow {
  display: flex; align-items: center; gap: 8px;
  padding: 7px 10px;
  background: rgba(0,204,255,.03);
  margin-bottom: 2px;
  border-left: 3px solid transparent;
  transition: border-color .05s steps(1);
}
.srow:hover { 
  border-left-color: var(--magenta); 
  background: rgba(0,204,255,.08);
}
.snum { 
  font-family: 'Press Start 2P', monospace; 
  font-size: 8px; 
  color: var(--muted); 
  width: 20px; 
  text-align: right; 
  flex-shrink: 0; 
}
.sinfo { flex: 1; min-width: 0; }
.stitle { 
  font-size: 13px; 
  font-weight: 600; 
  white-space: nowrap; 
  overflow: hidden; 
  text-overflow: ellipsis;
  color: var(--cream);
}
.sartist { 
  font-family: 'Share Tech Mono', monospace; 
  font-size: 10px; 
  color: var(--muted); 
  margin-top: 2px; 
}
.sscore { 
  font-family: 'Press Start 2P', monospace; 
  font-size: 13px; 
  flex-shrink: 0; 
  min-width: 44px; 
  text-align: right; 
}

/* ── PROGRESS BAR — pixel style ── */
.pbar { 
  height: 8px; 
  background: #000; 
  border: 1px solid var(--border);
  margin-top: 10px; 
  overflow: hidden;
}
.pbar-f { 
  height: 100%; 
  background: repeating-linear-gradient(
    90deg,
    var(--magenta) 0px, var(--magenta) 8px,
    transparent 8px, transparent 10px
  );
  transition: width .4s steps(10); 
}

/* ── SET HEADER ── */
.seth {
  display: flex; align-items: center; justify-content: space-between;
  padding: 7px 10px;
  background: #000;
  border: 2px solid var(--border);
  border-left: 4px solid var(--magenta);
  margin-bottom: 4px;
}
.setl { 
  font-family: 'Press Start 2P', monospace; 
  font-size: 8px; 
  letter-spacing: .08em; 
  color: var(--magenta); 
  text-shadow: 0 0 6px var(--magenta);
}

/* ── STATS ── */
.sgrid { display: grid; grid-template-columns: repeat(auto-fill,minmax(120px,1fr)); gap: 8px; }
.sbox {
  background: #000;
  border: 2px solid var(--border);
  padding: 12px;
  text-align: center;
  position: relative;
}
.sbox::before {
  content: '';
  position: absolute;
  top: 0; left: 0; right: 0; height: 3px;
  background: var(--orange);
  box-shadow: 0 0 6px var(--orange);
}
.sval { 
  font-family: 'Press Start 2P', monospace; 
  font-size: 20px; 
  color: var(--yellow); 
  text-shadow: 2px 2px 0 #666600, 0 0 10px var(--yellow);
  line-height: 1.3;
}
.slbl { 
  font-family: 'Share Tech Mono', monospace; 
  font-size: 9px; 
  color: var(--muted); 
  text-transform: uppercase; 
  letter-spacing: .1em; 
  margin-top: 5px; 
}

/* ── LEADERBOARD — high score table ── */
.lb {
  display: flex; align-items: center; gap: 10px;
  padding: 9px 10px;
  margin-bottom: 3px;
  background: #000;
  border: 1px solid var(--border2);
  border-left: 4px solid var(--muted);
  transition: all .05s steps(1);
}
.lb:hover { background: rgba(0,204,255,.06); }
.lb:nth-child(1) { border-left-color: var(--yellow); box-shadow: -2px 0 8px rgba(255,255,0,.3); }
.lb:nth-child(2) { border-left-color: #aaaaaa; }
.lb:nth-child(3) { border-left-color: var(--orange); }
.lbr { 
  font-family: 'Press Start 2P', monospace; 
  font-size: 12px; 
  min-width: 32px; 
  color: var(--muted);
}
.lb:nth-child(1) .lbr { color: var(--yellow); text-shadow: 0 0 8px var(--yellow), 2px 2px 0 #666600; }
.lb:nth-child(2) .lbr { color: #cccccc; }
.lb:nth-child(3) .lbr { color: var(--orange); }
.lbi { flex: 1; min-width: 0; }
.lbsong { font-size: 13px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; color: var(--cream); }
.lbartist { font-family: 'Share Tech Mono', monospace; font-size: 10px; color: var(--muted); margin-top: 2px; }
.lbsc { 
  font-family: 'Press Start 2P', monospace; 
  font-size: 14px; 
  flex-shrink: 0; 
}

/* ── VOTER CARD ── */
.vc {
  background: #000;
  border: 1px solid var(--border);
  padding: 10px;
  margin-bottom: 7px;
}
.vch { display: flex; align-items: center; justify-content: space-between; margin-bottom: 8px; }
.vcn { font-family: 'Share Tech Mono', monospace; font-size: 12px; color: var(--cyan); }

/* ── FILTER BAR ── */
.filters {
  display: flex; flex-wrap: wrap; gap: 6px;
  margin-bottom: 14px;
  padding: 10px;
  background: #000;
  border: 2px solid var(--border);
}
.filter-chip {
  padding: 5px 10px;
  border: 1px solid var(--border);
  background: transparent;
  color: var(--muted);
  cursor: pointer;
  font-family: 'Share Tech Mono', monospace;
  font-size: 10px;
  transition: all .05s steps(1);
  text-transform: uppercase;
  letter-spacing: .05em;
}
.filter-chip.on {
  border-color: var(--magenta);
  color: #000;
  background: var(--magenta);
  box-shadow: 2px 2px 0 #006677;
}
.filter-chip:hover:not(.on) { color: var(--cyan); border-color: var(--cyan); }
.filter-select {
  background: #000;
  border: 1px solid var(--border);
  color: var(--green);
  font-family: 'Share Tech Mono', monospace;
  font-size: 10px;
  padding: 5px 8px;
  outline: none;
  cursor: pointer;
  width: auto;
}
.filter-select:focus { border-color: var(--cyan); }

/* ── CHART BARS — pixel EQ ── */
.chart-bar-row { margin-bottom: 8px; }
.chart-label { font-family: 'Share Tech Mono', monospace; font-size: 10px; color: var(--muted); margin-bottom: 3px; display: flex; justify-content: space-between; }
.chart-track { 
  height: 10px; 
  background: #000; 
  border: 1px solid var(--border);
  overflow: hidden;
}
.chart-fill { 
  height: 100%; 
  background: repeating-linear-gradient(
    90deg,
    var(--magenta) 0px, var(--magenta) 6px,
    transparent 6px, transparent 8px
  );
  transition: width .5s steps(12); 
}

/* ── MISC ── */
.between { display: flex; align-items: center; justify-content: space-between; }
.muted { color: var(--muted); font-size: 11px; font-family: 'Share Tech Mono', monospace; }
.mt8 { margin-top: 8px; }
.mt12 { margin-top: 12px; }
.mt16 { margin-top: 16px; }
.mb0 { margin-bottom: 0 !important; }
.divider { border: none; border-top: 1px solid var(--border); margin: 12px 0; }
.empty { text-align: center; padding: 52px 20px; }
.ei { font-size: 40px; margin-bottom: 10px; }
.mono { font-family: 'Share Tech Mono', monospace; }
.orb { font-family: 'Press Start 2P', monospace; }

.summary-s { 
  display: flex; 
  justify-content: space-between; 
  align-items: center; 
  padding: 5px 0; 
  border-bottom: 1px solid rgba(0,204,255,.1); 
  font-size: 12px; 
}
.summary-s:last-child { border-bottom: none; }

/* ── SCORE BIG — Atari score display ── */
.score-big { text-align: center; padding: 14px 0; }
.score-big-val { 
  font-family: 'Press Start 2P', monospace; 
  font-size: 48px; 
  font-weight: 900; 
  line-height: 1;
}
.score-big-lbl { 
  font-family: 'Share Tech Mono', monospace; 
  font-size: 10px; 
  color: var(--muted); 
  text-transform: uppercase; 
  letter-spacing: .2em; 
  margin-top: 6px; 
}

/* ── PIXEL EQ BARS decorativos ── */
.eq-bars { 
  display: flex; align-items: flex-end; gap: 2px; height: 20px; 
}
.eq-b { 
  width: 4px;
  box-shadow: 0 0 4px currentColor;
  animation: eq-anim var(--d,0.5s) steps(5) infinite alternate;
}
@keyframes eq-anim {
  from { height: 15%; }
  to   { height: 100%; }
}

/* ── GLITCH on title ── */
.title:hover {
  animation: px-glitch .2s steps(2) forwards;
}
@keyframes px-glitch {
  0%  { text-shadow: -3px 0 var(--cyan), 3px 0 var(--magenta), 0 3px var(--yellow); color: var(--yellow); }
  33% { text-shadow: 3px 0 var(--magenta), -3px 0 var(--cyan); color: var(--magenta); }
  66% { text-shadow: 0 0 0 transparent; color: var(--orange); }
  100%{ text-shadow: 3px 3px 0 #004466, 0 0 20px var(--cyan); color: var(--magenta); }
}

/* ── SCROLLBAR pixel style ── */
::-webkit-scrollbar { width: 6px; }
::-webkit-scrollbar-track { background: #000; border-left: 1px solid var(--border); }
::-webkit-scrollbar-thumb { background: var(--magenta); box-shadow: 0 0 4px var(--magenta); }

/* ── MODAL ── */
.modal-overlay {
  position: fixed; inset: 0;
  background: rgba(0,0,0,.85);
  z-index: 1000;
  display: flex; align-items: center; justify-content: center;
  padding: 16px;
}
.modal {
  background: var(--surf);
  border: 2px solid var(--magenta);
  box-shadow: 0 0 40px rgba(0,204,255,.4), 0 0 80px rgba(0,204,255,.15);
  width: 100%; max-width: 480px;
  max-height: 90vh;
  overflow-y: auto;
  padding: 20px;
  position: relative;
}
.modal::before, .modal::after {
  content: "";
  position: absolute;
  width: 10px; height: 10px;
}
.modal::before { top: -1px; left: -1px; border-top: 2px solid var(--cyan); border-left: 2px solid var(--cyan); }
.modal::after  { bottom: -1px; right: -1px; border-bottom: 2px solid var(--cyan); border-right: 2px solid var(--cyan); }

/* ── VOTE BREAKDOWN in modal ── */
.vote-row {
  display: flex; align-items: center; justify-content: space-between;
  padding: 4px 0;
  border-bottom: 1px solid rgba(0,204,255,.06);
  font-size: 12px;
}
.vote-row:last-child { border-bottom: none; }
.vote-name { font-family: "Share Tech Mono", monospace; color: var(--cream); }
.vote-score { font-family: "Press Start 2P", monospace; font-size: 11px; }

/* ── DUP WARNING ── */
.dup-warning {
  background: rgba(255,200,0,.08);
  border: 2px solid var(--yellow);
  padding: 10px 12px;
  margin-top: 8px;
  font-family: "Share Tech Mono", monospace;
  font-size: 11px;
}
.dup-item {
  padding: 4px 0;
  border-bottom: 1px solid rgba(255,255,0,.1);
  color: var(--yellow);
}
.dup-item:last-child { border-bottom: none; }

/* ── SEARCH BAR ── */
.search-bar {
  display: flex; gap: 6px;
  margin-bottom: 12px;
}
.search-input {
  flex: 1;
  background: #000;
  border: 2px solid var(--magenta);
  color: var(--cream);
  font-family: "Share Tech Mono", monospace;
  font-size: 14px;
  padding: 10px 12px;
  outline: none;
  box-shadow: 0 0 10px rgba(0,204,255,.2);
}
.search-input:focus { border-color: var(--cyan); box-shadow: 0 0 16px rgba(0,255,255,.3); }
.search-input::placeholder { color: var(--muted); }

/* ── SEARCH RESULT ── */
.sr {
  display: flex; align-items: center; gap: 10px;
  padding: 9px 10px;
  background: #000;
  border: 1px solid var(--border);
  border-left: 3px solid transparent;
  margin-bottom: 3px;
  cursor: pointer;
  transition: border-left-color .05s steps(1);
}
.sr:hover { border-left-color: var(--magenta); background: rgba(0,204,255,.05); }

/* ── SPOTIFY / APPLE links ── */
.music-links { display: flex; gap: 6px; margin-top: 12px; flex-wrap: wrap; }
.mlink {
  display: inline-flex; align-items: center; gap: 6px;
  padding: 7px 12px;
  border: 1px solid var(--border);
  background: #000;
  color: var(--cream);
  font-family: "Share Tech Mono", monospace;
  font-size: 10px;
  text-decoration: none;
  text-transform: uppercase;
  letter-spacing: .05em;
  cursor: pointer;
  transition: all .05s steps(1);
}
.mlink:hover { border-color: var(--cyan); color: var(--cyan); }
.mlink.spotify { border-color: #1db954; color: #1db954; }
.mlink.spotify:hover { background: rgba(29,185,84,.1); }
.mlink.apple { border-color: #fa243c; color: #fa243c; }
.mlink.apple:hover { background: rgba(250,36,60,.1); }

/* ── INSERT COIN blink ── */
@keyframes insert-coin {
  0%, 49% { opacity: 1; }
  50%, 100% { opacity: 0; }
}
.insert-coin {
  font-family: 'Press Start 2P', monospace;
  font-size: 8px;
  color: var(--yellow);
  text-shadow: 0 0 8px var(--yellow);
  animation: insert-coin 1s steps(1) infinite;
  letter-spacing: .1em;
}
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

/* ── Pixel EQ Bars component — estilo arcade ── */
const EQ_COLORS = ["#00ccff","#00ccff","#ff6600","#ffff00","#00ff44","#00ffff","#ffff00","#ff6600","#00ccff","#00ccff"];
function PixelEQ({ n = 10 }) {
  const bars = Array.from({length: n}, (_, i) => ({
    d: (Math.random() * 0.4 + 0.3).toFixed(2) + "s",
    delay: (i * 0.06).toFixed(2) + "s",
    color: EQ_COLORS[i % EQ_COLORS.length]
  }));
  return (
    <div className="eq-bars">
      {bars.map((b, i) => (
        <div key={i} className="eq-b" style={{
          width: 5,
          color: b.color,
          background: b.color,
          "--d": b.d,
          animationDelay: b.delay,
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

  // Song detail modal (Top 20 click)
  const [modalSong, setModalSong] = useState(null);

  // Search tab
  const [searchQ, setSearchQ] = useState("");
  const [searchSeason, setSearchSeason] = useState("all");
  const [searchPerson, setSearchPerson] = useState("all");

  // Duplicate warning during live entry
  const [dupWarning, setDupWarning] = useState(null);

  /* ── Load all historical sessions ── */
  const loadSessions = useCallback(async () => {
    setLoading(true);
    const { data: sess } = await db.from("cyc_sessions")
      .select("*").eq("complete", true).order("session_num", { ascending: false });
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

  /* ── Load live sets for a session ── */
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

  /* ── On mount: check for active session + load history ── */
  useEffect(() => {
    loadSessions();
    // Check if there's an active session anyone can join
    db.from("cyc_sessions").select("*").eq("active", true).eq("complete", false).maybeSingle()
      .then(({ data }) => {
        if (data) {
          setLiveSession(data);
          setCurSet(data.cur_set || 0);
          setCurSong(data.cur_song || 0);
          setPhase(data.phase || "entry");
          refreshLiveSets(data.id);
          setTab("live");
        }
      });
  }, [loadSessions, refreshLiveSets]);

  /* ── Realtime: subscribe to votes + session state changes ── */
  useEffect(() => {
    if (!liveSession) return;
    const sub = db.channel(`cyc_live_${liveSession.id}`)
      .on("postgres_changes", { event: "*", schema: "public", table: "cyc_votes" }, () => {
        refreshLiveSets(liveSession.id);
      })
      .on("postgres_changes", { event: "UPDATE", schema: "public", table: "cyc_sessions",
          filter: `id=eq.${liveSession.id}` }, (payload) => {
        const s = payload.new;
        // Sync navigation state from DB for observers
        if (s.cur_set !== undefined) setCurSet(s.cur_set);
        if (s.cur_song !== undefined) setCurSong(s.cur_song);
        if (s.phase !== undefined) setPhase(s.phase);
        if (s.complete) {
          setLiveSession(null); setLiveSets([]); setPhase("entry");
          loadSessions(); setTab("history");
        }
      })
      .on("postgres_changes", { event: "*", schema: "public", table: "cyc_songs" }, () => {
        refreshLiveSets(liveSession.id);
      })
      .subscribe();
    realtimeSub.current = sub;
    return () => { db.removeChannel(sub); };
  }, [liveSession, refreshLiveSets, loadSessions]);

  /* ── Create session ── */
  async function createSession() {
    if (!nHost || !nAttendees.length) return;
    setCreating(true);
    // Mark any previous active session as inactive
    await db.from("cyc_sessions").update({ active: false }).eq("active", true);
    const [sC, sgC] = nMode === "4x5" ? [4, 5] : [5, 4];
    const sessionNum = (sessions.length > 0 ? Math.max(...sessions.map(s => s.session_num)) : 0) + 1;
    const { data: sess, error } = await db.from("cyc_sessions").insert({
      session_num: sessionNum, host: nHost, date: nDate,
      attendees: nAttendees, input_mode: nInput,
      sets_count: sC, songs_count: sgC,
      complete: false, active: true,
      cur_set: 0, cur_song: 0, phase: "entry"
    }).select().single();
    if (error || !sess) { setCreating(false); alert("Error: " + error?.message); return; }
    const allSets = [];
    for (let si = 0; si < sC; si++) {
      const { data: setRow } = await db.from("cyc_sets").insert({
        session_id: sess.id, set_index: si, label: `Set ${si + 1}`
      }).select().single();
      const songs = [];
      for (let so = 0; so < sgC; so++) {
        const { data: song } = await db.from("cyc_songs").insert({
          set_id: setRow.id, song_index: so, artist: "", title: ""
        }).select().single();
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

  /* ── Navigation — persists to DB so all devices sync ── */
  async function syncNav(set, song, ph) {
    await db.from("cyc_sessions").update({ cur_set: set, cur_song: song, phase: ph })
      .eq("id", liveSession.id);
  }
  function openVoting() {
    const song = liveSets[curSet]?.songs[curSong];
    if (!song?.artist || !song?.title) return;
    setPhase("voting");
    syncNav(curSet, curSong, "voting");
  }
  function nextSong() {
    const sgC = liveSession.songs_count;
    const sC = liveSession.sets_count;
    if (curSong < sgC - 1) {
      const ns = curSong + 1;
      setCurSong(ns); setPhase("entry");
      syncNav(curSet, ns, "entry");       // persiste antes de render
    } else if (curSet < sC - 1) {
      setPhase("set_done");
      syncNav(curSet, curSong, "set_done");
    } else { finishSession(); }
  }
  async function finishSession() {
    await db.from("cyc_sessions").update({ complete: true, active: false }).eq("id", liveSession.id);
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

  /* ── Fuzzy duplicate detection ── */
  function normalize(s) {
    return (s || "").toLowerCase()
      .normalize("NFD").replace(/[̀-ͯ]/g, "")
      .replace(/[^a-z0-9 ]/g, "").trim();
  }
  function similarity(a, b) {
    const na = normalize(a), nb = normalize(b);
    if (!na || !nb) return 0;
    if (na === nb) return 1;
    if (na.includes(nb) || nb.includes(na)) return 0.9;
    const wa = new Set(na.split(" ")), wb = nb.split(" ");
    const common = wb.filter(w => w.length > 2 && wa.has(w)).length;
    return common / Math.max(wa.size, wb.length);
  }
  function findDuplicates(artist, title) {
    if (!artist || !title) return [];
    const results = [];
    sessions.forEach(s => s.sets.forEach(st => st.songs.forEach(sg => {
      if (!sg.title) return;
      const artistSim = similarity(artist, sg.artist);
      const titleSim = similarity(title, sg.title);
      if (titleSim > 0.75 && artistSim > 0.5) {
        results.push({ ...sg, sessionNum: s.session_num, sessionDate: s.date, setLabel: st.label });
      }
    })));
    return results;
  }

  /* ── Search across all sessions ── */
  function searchSongs(q, season, person) {
    let songs = sessions.flatMap(s => s.sets.flatMap(st => st.songs.map(sg => ({
      ...sg, sessionNum: s.session_num, sessionDate: s.date,
      setLabel: st.label, sessionHost: s.host,
      sessionId: s.id
    }))));
    if (season !== "all") songs = songs.filter(sg => String(sg.sessionNum) === season);
    if (person !== "all") songs = songs.filter(sg => sg.votes && sg.votes[person] !== undefined);
    if (q.trim()) {
      const nq = normalize(q);
      songs = songs.filter(sg =>
        normalize(sg.title).includes(nq) ||
        normalize(sg.artist).includes(nq) ||
        normalize(sg.album).includes(nq)
      );
    }
    return songs.filter(sg => sg.title).sort((a, b) => (songAvg(b) || 0) - (songAvg(a) || 0));
  }

  /* ─────────────────────────────────────────────────────────
     RENDER
  ───────────────────────────────────────────────────────── */
  return (
    <>
      <style>{CSS}</style>
      <div className="app">

        {/* ── HEADER — Arcade Cabinet Screen ── */}
        <header className="hdr">
          <div style={{ display: "flex", alignItems: "center", justifyContent: "center", gap: 16, marginBottom: 14 }}>
            <PixelEQ n={8} />
            <PixelEQ n={8} />
          </div>
          <div className="pixel-border" style={{ marginBottom: 6 }}>
            <span className="title">COMPÁS <span className="title-amp">&amp;</span> COPAS</span>
          </div>
          <p className="sub">
            {connected
              ? <><span className="dot-on" /> ONLINE &nbsp;·&nbsp; {sessions.reduce((a,s) => a + s.sets.reduce((b,st) => b + st.songs.filter(sg=>sg.title).length, 0), 0)} TRACKS</>
              : <span className="insert-coin">▶ INSERT COIN ◀</span>}
          </p>
        </header>

        {/* ── NAV ── */}
        <nav className="nav">
          <button className={`nb ${tab === "live" ? "on" : ""}`} onClick={() => setTab("live")}>▶ PLAY</button>
          <button className={`nb ${tab === "history" ? "on" : ""}`} onClick={() => setTab("history")}>◉ SCORES</button>
          <button className={`nb ${tab === "search" ? "on" : ""}`} onClick={() => setTab("search")}>⊕ BUSCAR</button>
          <button className={`nb ${tab === "stats" ? "on" : ""}`} onClick={() => setTab("stats")}>▲ HALL</button>
        </nav>

        {/* ══ TAB: LIVE ══════════════════════════════════════════ */}
        {tab === "live" && <>

          {!liveSession && !showNew && (
            <div className="empty">
              <div className="ei">🕹️</div>
              <p className="orb" style={{ fontSize: 10, color: "var(--magenta)", textShadow: "2px 2px 0 #006677, 0 0 10px var(--magenta)", lineHeight: 2 }}>GAME OVER</p>
              <p className="insert-coin" style={{ marginTop: 12 }}>▶ INSERT COIN ◀</p>
              <button className="btn bm mt16" onClick={() => setShowNew(true)}>▶ NUEVA SESIÓN</button>
            </div>
          )}

          {showNew && !liveSession && (
            <div className="card mag">
              <div className="ct mag">◈ NUEVA SESIÓN — PLAYER 1</div>
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
                    <select value={nAttName} onChange={e => setNAttName(e.target.value)}>
                      <option value="">— seleccionar —</option>
                      {DEFAULT_VOTERS.filter(v => !nAttendees.includes(v)).map(v => (
                        <option key={v} value={v}>{v}</option>
                      ))}
                      <option value="__nuevo__">+ Nombre nuevo...</option>
                    </select>
                  </div>
                  <button className="btn bp bsm" onClick={() => {
                    if (nAttName === "__nuevo__") {
                      const n = prompt("Nombre del nuevo asistente:");
                      if (n && n.trim() && !nAttendees.includes(n.trim())) {
                        setNAttendees([...nAttendees, n.trim()]);
                        setNAttName("");
                      }
                    } else if (nAttName && !nAttendees.includes(nAttName)) {
                      setNAttendees([...nAttendees, nAttName]);
                      setNAttName("");
                    }
                  }}>+ ADD</button>
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
            {/* EN VIVO banner */}
            <div style={{
              background: "rgba(0,255,80,.07)", border: "2px solid #00ff50",
              padding: "8px 12px", marginBottom: 8, display: "flex",
              alignItems: "center", justifyContent: "space-between",
              boxShadow: "0 0 12px rgba(0,255,80,.2)"
            }}>
              <div style={{ display: "flex", alignItems: "center", gap: 8 }}>
                <span className="dot-on" style={{ background: "#00ff50", boxShadow: "0 0 6px #00ff50" }} />
                <span style={{ fontFamily: "'Press Start 2P', monospace", fontSize: 7, color: "#00ff50", letterSpacing: ".1em" }}>
                  EN VIVO — TODOS PUEDEN VER
                </span>
              </div>
              <span style={{ fontFamily: "'Share Tech Mono', monospace", fontSize: 10, color: "#00ff50", opacity: .7 }}>
                compas-y-copas.vercel.app
              </span>
            </div>

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
                    onChange={e => { saveSongMeta(curSet, curSong, "artist", e.target.value); setDupWarning(null); }}
                    autoFocus />
                </div>
                <div className="field"><label>Canción</label>
                  <input placeholder="Ej: Personal Jesus" value={curLiveSong.title || ""}
                    onChange={e => { saveSongMeta(curSet, curSong, "title", e.target.value); setDupWarning(null); }}
                    onBlur={() => {
                      const dups = findDuplicates(curLiveSong.artist, curLiveSong.title);
                      setDupWarning(dups.length > 0 ? dups : null);
                    }}
                    onKeyDown={e => e.key === "Enter" && openVoting()} />
                </div>
                <div className="field"><label>Álbum (opcional)</label>
                  <input placeholder="Ej: Violator" value={curLiveSong.album || ""}
                    onChange={e => saveSongMeta(curSet, curSong, "album", e.target.value)} />
                </div>
                {dupWarning && (
                  <div className="dup-warning">
                    <div style={{ color: "var(--yellow)", fontFamily: "'Press Start 2P', monospace", fontSize: 7, marginBottom: 6 }}>
                      ⚠ YA FUE TOCADA ANTES
                    </div>
                    {dupWarning.map((d, i) => (
                      <div key={i} className="dup-item">
                        {d.artist} — {d.title}<br/>
                        <span style={{ opacity: .7, fontSize: 10 }}>T{d.sessionNum} · {d.setLabel} · {new Date(d.sessionDate).toLocaleDateString("es-PE")} · avg {songAvg(d)}</span>
                      </div>
                    ))}
                  </div>
                )}
                <button className="btn bp bfw mt12" onClick={openVoting} disabled={!curLiveSong.artist || !curLiveSong.title}>
                  ► ABRIR VOTACIÓN
                </button>
              </div>
            )}

            {/* PHASE: voting */}
            {phase === "voting" && curLiveSong && (
              <div className="card mag">
                <div className="ct mag">◉ VOTANDO</div>
                <div style={{ marginBottom: 14 }}>
                  <div style={{ fontFamily: "'Share Tech Mono', monospace", fontSize: 13, color: "var(--white)" }}>
                    {curLiveSong.artist} — {curLiveSong.title}
                  </div>
                  {curLiveSong.album && (
                    <div style={{ fontFamily: "'Share Tech Mono', monospace", fontSize: 10, color: "var(--muted)", marginTop: 3 }}>
                      💿 {curLiveSong.album}
                    </div>
                  )}
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
                  <button className="btn bp mt16" onClick={() => { const ns = curSet + 1; setCurSet(ns); setCurSong(0); setPhase("entry"); syncNav(ns, 0, "entry"); }}>
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
            <div className="empty"><div className="ei">▲</div><p className="insert-coin">NO SCORES YET</p></div>
          ) : <>

            {/* Sub-nav */}
            <div style={{ display: "flex", gap: 6, marginBottom: 16 }}>
              {["songs", "voters", "seasons"].map(v => (
                <button key={v} className={`filter-chip ${statsView === v ? "on" : ""}`} onClick={() => setStatsView(v)}>
                  {v === "songs" ? "TOP TRACKS" : v === "voters" ? "PLAYERS" : "TEMPORADAS"}
                </button>
              ))}
            </div>

            {/* Global numbers */}
            <div className="card mag" style={{ marginBottom: 16 }}>
              <div className="ct mag">▲ HIGH SCORES</div>
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
                <div className="ct">◉ TOP 20 — ALL TIME HIGH SCORES</div>
                <p className="muted" style={{ marginBottom: 10 }}>Toca cualquier canción para ver el detalle</p>
                {topSongs(20).map((song, i) => (
                  <div key={i} className="lb" style={{ cursor: "pointer" }} onClick={() => setModalSong(song)}>
                    <span className="lbr">{rankEmoji(i)}</span>
                    <div className="lbi">
                      <div className="lbsong">{song.title}</div>
                      <div className="lbartist">{song.artist}{song.album ? ` · 💿 ${song.album}` : ""} · T{song.sessionNum} · {new Date(song.sessionDate).toLocaleDateString("es-PE")}</div>
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

        {/* ── TAB: BUSCAR ── */}
        {tab === "search" && <>
          <div className="card">
            <div className="ct">⊕ BUSCADOR DE CANCIONES</div>
            <div className="search-bar">
              <input
                className="search-input"
                placeholder="Buscar artista o canción..."
                value={searchQ}
                onChange={e => setSearchQ(e.target.value)}
                autoFocus
              />
            </div>
            <div className="filters" style={{ marginBottom: 10 }}>
              <select className="filter-select" value={searchSeason} onChange={e => setSearchSeason(e.target.value)}>
                <option value="all">Todas las temporadas</option>
                {[...new Set(sessions.map(s => s.session_num))].sort((a,b)=>a-b).map(n => (
                  <option key={n} value={String(n)}>Temporada {n}</option>
                ))}
              </select>
              <select className="filter-select" value={searchPerson} onChange={e => setSearchPerson(e.target.value)}>
                <option value="all">Todos los votantes</option>
                {DEFAULT_VOTERS.map(v => <option key={v} value={v}>{v}</option>)}
              </select>
            </div>
            {(searchQ.trim() || searchSeason !== "all" || searchPerson !== "all") ? (() => {
              const results = searchSongs(searchQ, searchSeason, searchPerson);
              return results.length === 0
                ? <div className="empty" style={{ padding: "20px 0" }}><p className="insert-coin">SIN RESULTADOS</p></div>
                : <>
                  <p className="muted" style={{ marginBottom: 8 }}>{results.length} resultado{results.length !== 1 ? "s" : ""}</p>
                  {results.map((song, i) => (
                    <div key={i} className="sr" onClick={() => setModalSong(song)}>
                      <div style={{ flex: 1, minWidth: 0 }}>
                        <div className="stitle">{song.title}</div>
                        <div className="sartist">{song.artist}{song.album ? ` · 💿 ${song.album}` : ""}</div>
                        <div className="mono" style={{ fontSize: 9, color: "var(--muted)", marginTop: 2 }}>
                          T{song.sessionNum} · {song.setLabel} · {new Date(song.sessionDate).toLocaleDateString("es-PE")}
                          {searchPerson !== "all" && song.votes[searchPerson] !== undefined &&
                            <span style={{ color: scoreColor(song.votes[searchPerson]), marginLeft: 6 }}>
                              {searchPerson}: {song.votes[searchPerson]}
                            </span>
                          }
                        </div>
                      </div>
                      <span style={{ fontFamily: "'Press Start 2P', monospace", fontSize: 12, color: scoreColor(songAvg(song)), flexShrink: 0 }}>
                        {songAvg(song) ?? "—"}
                      </span>
                    </div>
                  ))}
                </>;
            })()
            : <div className="empty" style={{ padding: "20px 0" }}>
                <p className="muted">Escribe para buscar entre {sessions.reduce((a,s)=>a+s.sets.flatMap(st=>st.songs).filter(sg=>sg.title).length,0)} canciones</p>
              </div>
            }
          </div>
        </>}

      </div>

      {/* ── MODAL: DETALLE DE CANCIÓN ── */}
      {modalSong && (() => {
        const s = modalSong;
        const sc = songAvg(s);
        const votes = Object.entries(s.votes || {}).sort((a,b) => b[1] - a[1]);
        const q = encodeURIComponent(`${s.artist} ${s.title}`);
        return (
          <div className="modal-overlay" onClick={() => setModalSong(null)}>
            <div className="modal" onClick={e => e.stopPropagation()}>
              <div style={{ marginBottom: 14 }}>
                <div className="ct mag" style={{ marginBottom: 6 }}>◉ DETALLE</div>
                <div style={{ fontFamily: "'Press Start 2P', monospace", fontSize: 11, color: "var(--cream)", lineHeight: 1.8, marginBottom: 4 }}>
                  {s.title}
                </div>
                <div className="mono" style={{ fontSize: 12, color: "var(--muted)" }}>{s.artist}</div>
              {s.album && (
                <div className="mono" style={{ fontSize: 11, color: "var(--muted)", marginTop: 3 }}>
                  💿 {s.album}
                </div>
              )}
              </div>

              <div style={{ display: "flex", gap: 10, marginBottom: 14, flexWrap: "wrap" }}>
                <div className="sbox" style={{ flex: 1, minWidth: 80 }}>
                  <div className="sval" style={{ fontSize: 28, color: scoreColor(sc) }}>{sc ?? "—"}</div>
                  <div className="slbl">Promedio</div>
                </div>
                <div className="sbox" style={{ flex: 1, minWidth: 80 }}>
                  <div className="sval" style={{ fontSize: 18 }}>T{s.sessionNum}</div>
                  <div className="slbl">Temporada</div>
                </div>
                <div className="sbox" style={{ flex: 1, minWidth: 80 }}>
                  <div className="sval" style={{ fontSize: 14 }}>{new Date(s.sessionDate).toLocaleDateString("es-PE", { day:"2-digit", month:"short", year:"2-digit" })}</div>
                  <div className="slbl">Fecha</div>
                </div>
              </div>

              <div className="mono" style={{ fontSize: 10, color: "var(--muted)", marginBottom: 12 }}>
                {s.setLabel} · {s.sessionHost || ""}
              </div>

              <hr className="divider" />
              <div className="ct" style={{ fontSize: 8, marginBottom: 8 }}>VOTOS</div>
              {votes.length === 0
                ? <p className="muted">Sin votos registrados</p>
                : votes.map(([voter, score]) => (
                  <div key={voter} className="vote-row">
                    <span className="vote-name">{voter}</span>
                    <span className="vote-score" style={{ color: scoreColor(score) }}>{score}</span>
                  </div>
                ))
              }

              <hr className="divider" />
              <div className="ct" style={{ fontSize: 8, marginBottom: 8 }}>ABRIR EN</div>
              <div className="music-links">
                <a className="mlink spotify" href={`https://open.spotify.com/search/${q}`} target="_blank" rel="noreferrer">
                  ♫ Spotify
                </a>
                <a className="mlink apple" href={`https://music.apple.com/search?term=${q}`} target="_blank" rel="noreferrer">
                  ♫ Apple Music
                </a>
                <a className="mlink" href={`https://www.youtube.com/results?search_query=${q}`} target="_blank" rel="noreferrer">
                  ▶ YouTube
                </a>
              </div>

              <button className="btn bs bfw mt16" style={{ fontSize: 7 }} onClick={() => setModalSong(null)}>
                ✕ CERRAR
              </button>
            </div>
          </div>
        );
      })()}

    </>
  );
}
