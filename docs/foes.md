# Foes

[← Docs home](README.md) · [Play Lanternfall](https://zhandermusic.github.io/lanternfall/)

Every foe in the game, what it does and how to deal with it. Health and gold below are base values: the real numbers grow every wave and every depth (see [How foes get tougher](enemy-scaling.md)). Regular foes in a wave also have half of these values each, since waves send twice as many.

## Contents

- [The basics](#the-basics)
- [Bosses](#bosses)
- [Depth foes](#depth-foes)
- [Event foes](#event-foes)
- [Foe abilities](#foe-abilities)

## The basics

These show up in every world.

| Foe | Health | Speed | Armor | Lives lost | Gold | Notes |
|---|---:|---|---:|---:|---:|---|
| **Moth** | 20 | average | 0 | 1 | 3 | The basic foe. Comes in numbers. |
| **Wisp** | 12 | very fast | 0 | 1 | 3 | Fast and fragile. From wave 2. |
| **Beetle** | 55 | slow | 3 | 1 | 5 | Slow and armored. Weak hits barely scratch it. |
| **Brood** | 48 | slow | 0 | 2 | 4 | Splits into moths when it dies. Costs 2 lives. |

- **Moths** make up most of every wave.
- **Wisps** join from wave 2. They're fast and fragile.
- **Beetles** join from wave 3 and get more common as waves go on. Their armor goes up by 1 every 2 waves.
- **Broods** join from wave 6. When one dies it bursts into moths (more in some worlds).

## Bosses

| Foe | Health | Speed | Armor | Lives lost | Gold |
|---|---:|---|---:|---:|---:|
| **Boss** | 650 | very slow | 4 | 8 | 45 |

Early bosses are gentler: before wave 10 a boss has less health (55% on wave 5, rising to full by wave 10), and its armor builds up until wave 15.

A boss arrives every 5th wave: 1 until wave 15, 2 from wave 20, 3 from wave 35, and in Endless one more every 15 waves after wave 50 (up to 8). Bosses don't split their health with the rest of the wave, so they're far tougher than anything else. Some worlds (Starfall Void and Eclipse Spire) also send a **mini-boss** with less health on every third wave.

### World bosses

Every world has its own boss with its own name, look and tricks. A health bar at the top of the board shows its name, title, shield and health. The first time you meet one, a card explains what it does. Unless noted, each uses the base boss numbers above.

| Depth | World | Boss | What it does |
|---|---|---|---|
| Surface | Whisperwood | **Elder Moth**, Mother of the Swarm | Calls moths out of the dark, and a cloud of them at half health. Snuff it before the swarm grows. |
| 1 | Ashen Marsh | **Bog King**, The Drowned Crown | Sinks into the mud now and then, and heals while it walks. Hit it hard while it’s up. |
| 2 | Frostmere | **Glacier Wyrm**, The Frozen Coil | Slows slide right off it. It carries a shield and freezes a fresh one at half health. |
| 3 | Emberwaste | **Magma Colossus**, Heart of the Waste | Speeds up as it cracks, then bursts into four magmites. |
| 4 | Sunken Ruins | **Tideshell Warden**, Keeper of the Drowned Gate | A huge shield, and it plates every foe near it with +4 armor. |
| 5 | Glimmer Caves | **Prism Wraith**, The Many-Faced | Blinks down the trail every few seconds and dodges one shot in five. |
| 6 | Bone Dunes | **Sand Tyrant**, Lord of Bones | Raises wisps as it walks, and drops two bone carriers when it falls. |
| 7 | Storm Peaks | **Thunderbird**, The Storm’s Eye | Dashes at triple speed and shakes off slows, poison and marks every few seconds. |
| 8 | Fungal Deep | **Spore Queen**, Mother of Rot | Heals every foe around it and spawns broods. Focus it down first. |
| 9 | Starfall Void | **Void Herald**, Voice of the Rift | Fades out of reality now and then, and calls voidlings through the rift. |
| 10 | The Last Ember | **Ember Lord**, The Last Fire | Thick armor and it can’t be stunned. Speeds up as it burns down, and calls two ember knights at half health. |
| 11 | Crimson Bog | **Leech Mother**, The Red Tide | Heals itself fast and spawns bog leeches. Burst it down. |
| 12 | Glass Desert | **Mirage Sphinx**, Riddle of Glass | Dodges a third of all shots and flickers forward along the trail. |
| 13 | Sunken Belfry | **The Great Bell**, Toll of the Deep | Its toll silences lanterns near it for a moment, and its ringing speeds up every foe around it. |
| 14 | Ironroot Thicket | **Ironroot Ancient**, The Unbending | Slow and heavily armored, and it gives every foe near it +6 armor. Bring armor piercing. |
| 15 | Aurora Fields | **Aurora Serpent**, The Shifting Light | Shrugs off poison and burns, dashes ahead and cleanses itself. |
| 16 | Cinder Cathedral | **Kiln Archon**, Bishop of Ash | Speeds up as it cracks, shields itself at half health and drops a kiln golem. |
| 17 | The Hive | **Hive Matriarch**, The Queen’s Hand | Releases drone swarms all the time, and a huge one at half health. Area lanterns are your friend. |
| 18 | Frozen Abyss | **Rime Titan**, The Endless Winter | Can’t be slowed, carries a thick shield and cleanses itself every 2 seconds. |
| 19 | Eclipse Spire | **Shade Sovereign**, Crown of Night | Fades in and out, calls eclipse shades and silences lanterns near it. |
| 20 | The Hollow Moon | **The Moth Queen**, She Who Woke Hungry | The Queen herself. Shielded and always calling her swarm. At two thirds she summons a cloud of moths, and at one third she rages, silences lanterns around her and shields again. Costs 8 lives if she gets through. |

Some bosses change the base numbers: the Elder Moth has 55% health, the Ironroot Ancient 120% (+5 armor, 20% slower), the Rime Titan 110%, the Tideshell Warden +2 armor and the Ember Lord +6 armor.

In the Hollow Harvest event the boss is the **Pumpkin King**: 30% more health and a shield.

## Depth foes

Every depth introduces a new foe. It appears in the very first wave of its world, then keeps showing up in deeper worlds alongside the others. The newest foe appears most often.

| Depth | World | Foe | Health | Speed | Armor | Lives lost | What it does |
|---:|---|---|---:|---|---:|---:|---|
| 1 | Ashen Marsh | **Bog lurker** | 34 | slow | 0 | 1 | Dives under the mud now and then. Lanterns can’t hit it while it’s hidden. |
| 2 | Frostmere | **Ice skater** | 24 | fast | 0 | 1 | Fast, and slows don’t work on it. |
| 3 | Emberwaste | **Magmite** | 40 | slow | 0 | 1 | Splits into two smaller magmites when snuffed. |
| 4 | Sunken Ruins | **Shellback** | 45 | slow | 2 | 1 | Carries a shield that soaks up damage before its health. |
| 5 | Glimmer Caves | **Glint** | 22 | average | 0 | 1 | Blinks forward along the trail every few seconds. |
| 6 | Bone Dunes | **Bone carrier** | 60 | slow | 1 | 1 | Releases three wisps when snuffed. |
| 7 | Storm Peaks | **Stormrunner** | 30 | average | 0 | 1 | Dashes at triple speed every few seconds. |
| 8 | Fungal Deep | **Sporemother** | 45 | slow | 0 | 1 | Heals foes around it. Snuff it first. |
| 9 | Starfall Void | **Voidling** | 32 | average | 0 | 1 | Phases out of reality for a moment. It can’t be hit while faded. |
| 10 | The Last Ember | **Ember knight** | 90 | very slow | 7 | 1 | Heavy armor, and it can’t be stunned. |
| 11 | Crimson Bog | **Bog leech** | 50 | slow | 0 | 3 | Heals itself quickly and costs 3 lives if it gets through. |
| 12 | Glass Desert | **Sand wraith** | 30 | average | 0 | 1 | Dodges almost a third of all shots. |
| 13 | Sunken Belfry | **Bellringer** | 55 | slow | 1 | 1 | Its tolling makes nearby foes 30% faster. |
| 14 | Ironroot Thicket | **Barkguard** | 80 | slow | 3 | 1 | Gives nearby foes +4 armor. |
| 15 | Aurora Fields | **Prism** | 40 | average | 0 | 1 | Shrugs off poison and burns. |
| 16 | Cinder Cathedral | **Kiln golem** | 110 | very slow | 4 | 2 | Speeds up as it takes damage, up to twice as fast. |
| 17 | The Hive | **Hive drone** | 9 | fast | 0 | 1 | Tiny and fast. Arrives in swarms of four. |
| 18 | Frozen Abyss | **Rime wraith** | 55 | slow | 0 | 1 | Shakes off slows, stuns and poison every 2 seconds. |
| 19 | Eclipse Spire | **Eclipse shade** | 70 | slow | 1 | 1 | Calls a moth out of the dark every few seconds. |
| 20 | The Hollow Moon | **Moon titan** | 260 | very slow | 6 | 5 | Huge, shielded, armored and can’t be slowed. Costs 5 lives. |

## Event foes

These only appear in event worlds. During the Hollow Harvest they replace the usual foes.

| Foe | Health | Speed | Armor | What it does |
|---|---:|---|---:|---|
| **Vampire bat** | 14 | very fast | 0 | Fast and arrives in flocks of three. |
| **Jack** | 48 | slow | 0 | Bursts into three seeds when snuffed. |
| **Ghost** | 30 | average | 0 | Fades out now and then, and slows pass right through it. |
| **Skeleton** | 50 | slow | 3 | Pulls itself back together once after being snuffed. |

## Foe abilities

| Ability | Foes | What it means for you |
|---|---|---|
| **Armor** | Beetle, Shellback, Bone carrier, Ember knight, Barkguard, Kiln golem, Moon titan, Skeleton | Every hit loses that much damage, down to 30% of the hit. Poison, Moonwell and armor piercing get around it. |
| **Shield** | Shellback, Moon titan, Pumpkin King | Soaks up damage before health. |
| **Can't be slowed** | Ice skater, Moon titan, Ghost | Frost and other slows do nothing. |
| **Can't be stunned** | Ember knight | Freezes and stuns do nothing. |
| **Untargetable for a moment** | Bog lurker (burrows), Voidling and Ghost (phase out) | Lanterns can't hit them while hidden. Spread your damage along the trail. |
| **Moves in bursts** | Glint (blinks), Stormrunner (dashes) | Can skip past a single kill zone. |
| **Splits or releases foes** | Brood, Magmite, Bone carrier, Jack, Eclipse shade | Keep area damage after your main kill zone. |
| **Heals** | Sporemother (heals others), Bog leech (heals itself) | Burst them down fast. |
| **Buffs others** | Bellringer (+30% speed), Barkguard (+4 armor) | Focus them first. |
| **Dodges** | Sand wraith (30% of shots) | Area damage, poison and burns can't miss. |
| **Shrugs off effects** | Prism (no poison or burns), Rime wraith (cleanses every 2s) | Use direct damage. |
| **Comes back** | Skeleton | Revives once with 40% health. |
| **Enrages** | Kiln golem | Speeds up as it takes damage, up to twice as fast. |
| **Swarms** | Hive drone, Vampire bat | Arrive in groups. Area damage and multi-shot shine. |

---

← [Lanterns](lanterns.md) · [Worlds and modes](worlds.md) →
