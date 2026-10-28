# Appa Camp, Storage, and Customization

> **Organization note:** This feature note groups design ideas and game references from both supplied guides. The curated synthesis below is an index, not a replacement for the verbatim source excerpts that follow. Where older source wording conflicts with later approved decisions, see [[15_Decisions_Conflicts_and_Questions]].

## References brought together

- **Pokémon Secret Base:** Persistent decoration, trophies, customization of tent interior; D1.
- **Stardew Valley:** Placeable functional/decorative objects, furniture grids, container interaction; C1–C2.
- **Pokémon bag UI:** Appa storage categories; A4.
- **Avatar: The Last Airbender:** Appa availability and camp location follow story.

## Source passages — Inspiration Guide (verbatim)

### Inspiration Guide — source page 4

Reference A4 — Pokémon Gen 3/4 bag UI. Study: bag segmented into loot types Apply: this is how Appas
storage should be structured, but rather than the names of the items, I want it to to show up like Stardew Valley
chests that we carousel through.

A4:





B. Prisoner of Azkaban (GBA) — character-led narrative and compact information,
exploration, Combat layout and design

![Reference image from original page 4](Four_Elements_Reference_Images/reference_page_04_01.png)

![Reference image from original page 4](Four_Elements_Reference_Images/reference_page_04_02.png)

![[reference_page_04_01.png]]

![[reference_page_04_02.png]]

### Inspiration Guide — source page 9

​


D. Pokémon Emerald — portable-home customization precedent

Reference D1 — Pokémon Gen 3, Secret Base customization. Study: how a small game world can support
furniture placement, trophies, decorations, and a sense of ownership without becoming a building simulator.
Apply: the player's tent at portable Appa campsite will have a non-canon interior where players can decorate
their camp with all the special loot items they have collected throughout the game, with useful and purely
decorative finds, equipment, and a persistent layout. Difference: Appa's camp moves between eligible
locations and has story-dependent availability. Screenshot and background: GamesRadar.

​
D1:​





E. Darkest Dungeon — tactical stakes and combat legibility

Reference E1 — Darkest Dungeon, turn-based combat. Study: simultaneously visible party and enemy
formations, actionable skill choices, health, accuracy, critical chance, and speed indicators. Apply: combat
decisions based on readable risk, meaningful costs, status and enemy intent. Target choosing, targeting
limitations, position limitations. Difference: Four Elements should retain Avatar's colorful, adventurous tone, its
own turn order, and its own party rules. Four Elements Combat interface will look more like Prisoner of
Azkabans, with heroes in the foreground and enemies across in the distance. Screenshot source: NoobFeed
review.

E1:

![Reference image from original page 9](Four_Elements_Reference_Images/reference_page_09_01.png)

![Reference image from original page 9](Four_Elements_Reference_Images/reference_page_09_02.png)

![[reference_page_09_01.png]]

![[reference_page_09_02.png]]

### Inspiration Guide — source page 10

Reference E2 — Darkest Dungeon, impactful critical attack. Study: immediate damage feedback and a
dramatic consequence of decision. Enemy strikes friendly character for a higher damage critical hit. Note that
there are character unique animations for each move. Apply: readable hit/miss/crit/status results, significant
attacks that feel powerful, and visual feedback appropriate to Avatar bending. Some moves may take 2 turns to
activate, some moves may cause damage to both the caster and target, some moves may have lasting effects
for multiple subsequent turns. Do not copy: gothic imagery, gore, stress mechanics, or its exact HUD.

E2:





                                                                                          ​
​
Reference E3 — Darkest Dungeon, visible statistics-based chance. Study E3: note that both friendly and
enemy characters have stats for all aspects of combat and stats are visible. Implement: we want our stat
system to work very similarly to Darkest dungeon with accuracy levels, crit rate, variable damage, Dodge,
Protection, Speed, and resistances - Stun, Debuff, Move

![Reference image from original page 10](Four_Elements_Reference_Images/reference_page_10_01.png)

![Reference image from original page 10](Four_Elements_Reference_Images/reference_page_10_02.png)

![[reference_page_10_01.png]]

![[reference_page_10_02.png]]

### Inspiration Guide — source page 11

E3:​





F. Resident Evil 4 — Puzzles and collecting items​

Reference F1 — Resident Evil 4 puzzle items Study E3: the player has to collect various items in order to
unlock a doorway. Each item is in separate locations in the world and need to be searched for.
F1:​





G. Death Howl — Tactical Movement, Battlefield Positioning &
Turn-Based Combat

Reference G1 — Death Howl, tactical combat battlefield.

Study: Compact, top-down pixel-art battlefields where characters and enemies occupy
physical positions rather than standing in fixed formations. The battlefield is divided into
navigable spaces, allowing the player to move strategically, approach enemies, avoid
dangerous positions, and use the surrounding environment.

Apply: Four Elements should use a similar approach to turn-based combat. When an
encounter begins, the player enters a compact tactical battlefield based on the surrounding
overworld location. Nearby rivers, trees, boulders, structures, and other environmental
features may become part of the encounter.

![Reference image from original page 11](Four_Elements_Reference_Images/reference_page_11_01.png)

![Reference image from original page 11](Four_Elements_Reference_Images/reference_page_11_02.png)

![Reference image from original page 11](Four_Elements_Reference_Images/reference_page_11_03.png)

![[reference_page_11_01.png]]

![[reference_page_11_02.png]]

![[reference_page_11_03.png]]

### Inspiration Guide — source page 22

Character levels improve broad capability; seven discipline masteries (Levels 1–10) deepen broad categories
of proficiency: Precision, Area Control, Defense, Manipulation, Transformation, Mobility, and Support.
Individual learned techniques draw on primary and sometimes secondary disciplines rather than earning
separate move XP. Specialized Advanced Arts are unlocked through character identity, training, and story
events rather than forming an eighth discipline. Not every technique upgrade changes traversal capability, but
certain upgrades should transform how the player sees familiar places: a previously uncrossable stream, an
unreachable ledge, a frozen waterfall, or a sealed mechanism becomes an opportunity. In battle, discipline
development may improve SP efficiency, damage ranges, accuracy, critical potential, or other relevant
attributes. Not every discipline improves every property, and exact balance belongs in the Master Specification.

Advanced Arts: individual character identity

Advanced Arts are specialized character-specific ability families, not an eighth generic discipline and not
necessarily one special move per character. They may be passive exploration talents, active combat states,
new material interactions, or story-unlocked techniques. They should make the player excited to switch
characters because each sees and uses the world differently.

    ●​ Aang — Avatar State: An extraordinary, story-governed power, initially difficult to control and not a
       routine combat shortcut.
    ●​ Sokka — Perception, Strategy, and Foraging: Uncover hidden routes and resources, read enemy
      weaknesses, improve tactical preparation, and identify or harvest rare ingredients. His nonbending
         abilities must remain genuinely valuable.
    ●​ Katara — Water Healing: Specialized restorative waterbending that develops with Support and related
        capabilities, while preserving its narrative learning milestones.
    ●​ Toph — Seismic Sense and Metalbending: Detect structures and movement through connected
       ground, uncover hidden spaces, and eventually interact with metal as a new material. These are
        distinct specialties.
    ●​ Zuko — Exploration and Battle Fury: Agility, infiltration, swordsmanship, and a potential high-risk
      combat state emphasizing critical potential or offense. The exact name, effects, and evolution with his
        story are proposed, not yet fixed.

These are creative examples to develop within canonical character arcs. Special abilities should not become
interchangeable bonuses or bypass the story's timing.

Backtracking should produce the feeling “I know how to get there now”, not “the game made me repeat
this road for no reason.” Appa fast travel reduces dead travel after discovery, while story flags can
temporarily restrict arriving at or departing from particular locations for meaningful narrative reasons. Appa will
not always be available, whether or not its because you are in enemy territory and he needs to stay in a cave,
appa is separated from the group, or another reason. Sometimes Appa will be following the group, and others
he will be static in one location.

9. World richness and rewards

Foraging, containers, environmental debris, hidden caches, lore, and regional details should make locations
feel inhabited and worth examining. Rewards do not all need to be powerful: an ingredient, a note, a charming
environmental interaction, a fun easter egg from the original series, or a small shortcut can justify exploration.

Food and passive recovery and camping support the journey without requiring oppressive survival meters.
Looting should be simple, consistent, and satisfying. The player should not have to fight the inventory UI to

### Inspiration Guide — source page 23

enjoy collecting things.. Open a chest like in stardew valley or minecraft, and either transfer all items to your
inventory or pick and choose, or choose nothing.

Appa's customizable portable campsite: a traveling home

Appa's campsite should be more than a rest menu. It should feel like Team Avatar's little moving home, built
up gradually from discoveries and resources gathered throughout Books 1–3. When the group makes camp at
a suitable place, players should be able to arrange its layout and contents: bedrolls, cooking gear, chests,
lanterns, rugs, souvenirs, crafting tools, training objects, and decorative finds. Placement and, where
appropriate, rotation should be player-controlled. Functional objects can also be decorative.

The campsite's preferred layout and owned contents persist as the group travels with Appa. Different camp
locations retain their own atmosphere and terrain; the system should handle limited space by safely packing
items that cannot fit rather than losing them or placing them inside obstacles. Some camps may be basic
temporary camps without Appa or without access to all facilities, depending on story circumstances.

Camp upgrades can improve rest and healing, cooking quality and recipes, storage capacity,
crafting/preparation, and training. Progress should come from gathered materials, discoveries, trade, and
story milestones. Decorating is an enjoyable optional pursuit; it should not become a mandatory chore or a
substitute for character progression. The camp should grow more personal over time without turning into a
permanent mansion or a survival-management simulator.

Resources, treasures, crafting, and rewarding discoveries

The world should contain a broad variety of items with meaningful and sometimes overlapping uses:
ingredients, crafting materials, tools, equipment, combat consumables, valuables, collectible treasures, scrolls,
quest objects, furniture, and decorative items. Some treasures might grant XP toward a specific discipline,
support training, teach or unlock a technique, or provide a distinctive equipment effect. A lantern could
decorate camp and also provide light; a discovered artifact might be collectible, tradable, or useful in
progression. Exact rewards and limits are balancing decisions, not permission for Codex to invent a complete
item economy.

The joy of finding a hidden chest or returning to a remote cave should be enhanced by not knowing whether it
contains a rare material, a practical tool, an exciting scroll, a piece of camp furniture, or a playful reference to
the series. Loot should feel abundant and diverse, while powerful rewards remain earned and paced.

Personal backpacks and Appa's storage

The desired direction is simple, Pokémon-inspired pocket organization for each character's carried items,
separate from equipped gear and combat loadouts. Pockets might organize consumables, materials, tools,
valuables, scrolls/key items, and decorations; an item can have multiple functional tags even if it appears in
one pocket. Appa carries bulk storage, furniture, crafting supplies, and the camp collection when
narratively and physically available. Avoid a magically shared party inventory that negates separation or Appa's
absence.

Backpack capacity is not yet finally chosen: generous Pokémon-style storage with sensible restrictions is
currently preferred over constant slot-by-slot inventory friction. No weight-based micromanagement is desired.
Preserve and audit the existing inventory implementation before proposing a migration. Story-essential items
must not become irretrievably inaccessible when Appa is absent.

## Source passages — Technical Guide (verbatim)

### Technical Guide — source page 34

●​ Expandable storage.
    ●​ Backpacks that increase capacity.
    ●​ Shared party storage.
    ●​  Large-capacity storage associated with Appa.
    ●​ Chests and containers.
    ●​  Sorting.
    ●​  Item filtering.
    ●​  Item tooltips.
    ●​  Item descriptions.
    ●​ Weight or capacity limits.
    ●​  Quest-item protection.
    ●​  Hotbar item use.
    ●​ Equipment stat comparisons.

Decisions required

    ●​  Is inventory limited by slots only or also by weight?
    ●​ Can characters exchange items regardless of distance?
    ●​ Can items be transferred during combat?
    ●​ Are quest items stored separately?
    ●​ Can equipment be changed during combat?
    ●​ Does Appa's storage require physical access?


PART XIII — ITEM BEHAVIOR AND PROPERTIES

22. Item Capabilities

An item can have multiple independent capabilities.

For example, a lantern may be:

    ●​  Droppable.
    ●​  Placeable.
    ●​  Equipable.
    ●​  Refillable.
    ●​  Fuel-powered.
    ●​  Breakable.
    ●​  Sellable.

A shovel may be:

    ●​  Equipable.
    ●​  Usable.
    ●​  Droppable.
    ●​  Repairable.
    ●​  Durability-based.

### Technical Guide — source page 42

Bending integration

    ●​  Firebending can ignite cooking stations.
    ●​ Waterbending can fill cooking vessels.
    ●​  Earthbending may assist certain material-processing activities.
    ●​  Airbending could operate ventilation or wind-powered devices.

Potential additions

    ●​  Recipes.
    ●​ Recipe discovery.
    ●​  Crafting stations.
    ●​  Material quality.
    ●​  Crafting proficiency.
    ●​  Special regional ingredients.


31. Merchants and Economy

Merchants could sell:

    ●​ Food.
    ●​  Tools.
    ●​ Equipment.
    ●​  Lanterns.
    ●​  Fuel.
    ●​  Crafting materials.
    ●​ Maps.
    ●​  Scrolls.
    ●​  Special items.

Proposed features

    ●​  Buying.
    ●​  Selling.
    ●​  Item values.
    ●​  Merchant-specific inventories.
    ●​  Regional pricing.
    ●​ Rare items.
    ●​ Equipment upgrades.
    ●​  Repair services.

Decisions required

    ●​ What currency system will be used?
    ●​ Can all merchants buy all item categories?
    ●​ Do merchant inventories restock?
    ●​ Are rare scrolls purchasable or exploration-only?

### Technical Guide — source page 43

PART XVII — EXPLORATION REWARDS

32. Treasure and Collectibles

Exploration should reward players with more than experience.

Potential rewards

    ●​  Currency.
    ●​ Rare equipment.
    ●​  Crafting materials.
    ●​ Hidden scrolls.
    ●​  Lore documents.
    ●​ Maps.
    ●​  Special tools.
    ●​ Cosmetic items.
    ●​  Collectibles.
    ●​ Permanent character upgrades.

Proposed Treasure Journal

A dedicated journal could record important treasures, collectibles, and discoveries.

Additional ideas

    ●​ Hidden treasure caches.
    ●​  Environmental clues.
    ●​  Regional collectible sets.
    ●​ Rare item descriptions.
    ●​  Secret rooms.
    ●​  Optional advanced puzzles.
    ●​  Discovery achievements.


PART XVIII — WORLD PERSISTENCE

33. Persistent Environmental Changes

The game should remember meaningful changes to the world.

Examples

### Technical Guide — source page 44

●​ Opened doors.
    ●​ Moved boulders.
    ●​  blocked reservoirs.
    ●​  Collected treasure.
    ●​  placed items.
    ●​ Placed lanterns.
    ●​ Broken objects.
    ●​ Completed puzzles.
    ●​  Activated mechanisms.

Important technical distinction

Some changes should be permanent.

Others should reset when an area reloads or after a defined period, such as Ice, fog clearing, etc

Proposed state categories

Permanent

    ●​  Collected unique treasure.
    ●​ Opened story passages.
    ●​ Completed major puzzles.
    ●​  Certain Moved boulders
    ●​ Unlocked doors

Temporary

    ●​  Active fire.
    ●​ Suspended water.
    ●​ Temporary ice bridges.
    ●​  Short-lived environmental effects.

Persistent but changeable

    ●​ Dropped items.
    ●​ Placed lanterns.
    ●​ Moved boulders.
    ●​ Opened ordinary containers.

Decisions required

    ●​ When do temporary environmental changes reset?

I think this should be after reload of the location

    ●​ Do dropped items persist indefinitely?

      No, thye disappear after around 5 m in, or when dropped items reach 100 they start to disapear from
       oldest to newest dropped

### Technical Guide — source page 45

●​ Does weather affect environmental states?

In some instances there may be permanent weather like rain and you cant catch something on fire

    ●​ Can puzzles be reset?

There should be a way to reset puzzles that we are able to decide to use or not from a developing standpoint

    ●​ Can players accidentally block important pathways?
    ●​   I think this is where we need a simple reset that may be a button at the beginning of a puzzle that can
       reset only the puzzle, so it would keep a broken basket on the pathway to the puzzle as is, but reset the
       stones of the puzzle


PART XIX — SAVING AND LOADING

34. Save System

The save system will eventually need to track:

Character data

    ●​  Level.
    ●​  Experience.
    ●​  Health.
    ●​ Learned techniques and their individual levels
    ●​ Bending attributes.
    ●​ Combat move selections.
    ●​ Equipment.
    ●​  Character and party storage layout

Inventory data

    ●​  Items.
    ●​  Stack quantities.
    ●​  Durability.
    ●​  Fuel.
    ●​  Storage expansion.
    ●​ Shared storage layout

World data

    ●​  Current location.
    ●​  Character positions.
    ●​  Collected treasure.
    ●​ Opened doors.
    ●​ Completed puzzles.
