"""Turn docs/*.md into GitHub wiki pages: README becomes Home, links lose their .md, and a sidebar lists every page."""
import os, re, sys
src, out = sys.argv[1], sys.argv[2]
REPO = 'https://github.com/ZhanderMusic/lanternfall'
ORDER = ['README.md', 'how-to-play.md', 'strategy.md', 'lanterns.md', 'foes.md', 'worlds.md', 'enemy-scaling.md',
         'boons.md', 'camp-upgrades.md', 'progression.md', 'settings-and-saves.md']
files = [f for f in ORDER if os.path.exists(os.path.join(src, f))] + sorted(
    f for f in os.listdir(src) if f.endswith('.md') and f not in ORDER)
names, titles = {}, {}
for f in files:
    text = open(os.path.join(src, f), encoding='utf-8').read()
    m = re.search(r'^# (.+)$', text, re.M)
    titles[f] = 'Home' if f == 'README.md' else (m.group(1).strip() if m else f[:-3])
    names[f] = 'Home' if f == 'README.md' else re.sub(r'[^\w]+', '-', titles[f]).strip('-')
def fix_link(m):
    label, target = m.group(1), m.group(2)
    if re.match(r'^[a-z]+:', target) or target.startswith('#'):
        return m.group(0)
    path, _, anchor = target.partition('#')
    if path.startswith('../'):
        return f'[{label}]({REPO}/blob/main/{path[3:]}{"#" + anchor if anchor else ""})'
    if path in names:
        return f'[{label}]({names[path]}{"#" + anchor if anchor else ""})'
    return m.group(0)
for f in files:
    text = open(os.path.join(src, f), encoding='utf-8').read()
    text = re.sub(r'^# .+\n+', '', text, count=1)                       # the wiki shows the page name as its title
    text = re.sub(r'^\[← Docs home\]\(README\.md\) · ', '', text, flags=re.M)
    text = re.sub(r'^\[Play Lanternfall\]\(([^)]+)\) · \[Back to the main page\]\(\.\./README\.md\)', r'[Play Lanternfall](\1) · [Project page](' + REPO + ')', text, flags=re.M)
    text = re.sub(r'\[([^\]]+)\]\(([^)\s]+)\)', fix_link, text)
    open(os.path.join(out, names[f] + '.md'), 'w', encoding='utf-8').write(text)
side = '**[▶ Play Lanternfall](https://zhandermusic.github.io/lanternfall/)**\n\n' + '\n'.join(
    f'- [{"Docs home" if f == "README.md" else titles[f]}]({names[f]})' for f in files) + '\n'
open(os.path.join(out, '_Sidebar.md'), 'w', encoding='utf-8').write(side)
open(os.path.join(out, '_Footer.md'), 'w', encoding='utf-8').write(
    f'[Play Lanternfall](https://zhandermusic.github.io/lanternfall/) · [Project page]({REPO}) · These pages are generated from the docs folder in the repo.\n')
print('wrote', len(files), 'pages')
