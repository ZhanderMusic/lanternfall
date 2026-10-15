/* Lanternfall service worker
   - The game page is fetched network-first, so a new version shows up the next time you open the app online.
   - Everything is cached, so the game also works offline.
   - Bump CACHE on every release (the build script does this from the game's VERSION). */
const CACHE='lanternfall-v0.19.1';
const SHELL=[
  './',
  './index.html',
  './manifest.webmanifest',
  './icons/icon-192.png',
  './icons/icon-512.png',
  './icons/maskable-512.png',
  './icons/apple-touch-icon.png',
  './icons/favicon-32.png'
];

self.addEventListener('install',e=>{
  e.waitUntil(caches.open(CACHE).then(c=>c.addAll(SHELL)).then(()=>self.skipWaiting()));
});

self.addEventListener('activate',e=>{
  e.waitUntil(
    caches.keys()
      .then(keys=>Promise.all(keys.filter(k=>k.startsWith('lanternfall-')&&k!==CACHE).map(k=>caches.delete(k))))
      .then(()=>self.clients.claim())
  );
});

self.addEventListener('fetch',e=>{
  const req=e.request;
  if(req.method!=='GET')return;
  const url=new URL(req.url);

  /* version.json is how the game learns about updates: never cache it */
  if(url.origin===location.origin&&url.pathname.endsWith('/version.json')){
    e.respondWith(fetch(req,{cache:'no-store'}));
    return;
  }

  /* the game page: network first, fall back to the cached copy offline */
  if(req.mode==='navigate'||(url.origin===location.origin&&url.pathname.endsWith('.html'))){
    e.respondWith(
      fetch(req).then(res=>{const copy=res.clone();caches.open(CACHE).then(c=>c.put('./index.html',copy));return res})
        .catch(()=>caches.match('./index.html').then(r=>r||caches.match('./')))
    );
    return;
  }

  /* Google Fonts and our own files: cache first, then network (and remember it) */
  if(url.origin===location.origin||url.hostname==='fonts.googleapis.com'||url.hostname==='fonts.gstatic.com'){
    e.respondWith(
      caches.match(req).then(hit=>hit||fetch(req).then(res=>{
        if(res.ok||res.type==='opaque'){const copy=res.clone();caches.open(CACHE).then(c=>c.put(req,copy))}
        return res;
      }))
    );
  }
});
