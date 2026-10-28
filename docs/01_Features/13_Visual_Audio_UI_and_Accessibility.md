# Visual Art, Audio, UI, and Accessibility

> **Organization note:** This feature note groups design ideas and game references from both supplied guides. The curated synthesis below is an index, not a replacement for the verbatim source excerpts that follow. Where older source wording conflicts with later approved decisions, see [[15_Decisions_Conflicts_and_Questions]].

## References brought together

- **Pokémon Emerald:** Bright legible tile-art world and readable navigation; A1–A3.
- **Prisoner of Azkaban (GBA):** Expressive sprites, portraits, menus and combat UI; B1–B5.
- **Stardew Valley:** Warm, detailed, readable environment and inventory; C1–C3.
- **Death Howl:** Tactical visual clarity and battle transition; G1–G4.
- **Darkest Dungeon:** Readable feedback for hits, criticals, status and risk; E1–E3.

## Source passages — Inspiration Guide (verbatim)

### Inspiration Guide — source page 1

FOUR ELEMENTS — GAME FEEL & CREATIVE
DIRECTION

Companion creative brief | Revised October 25, 2026

     Purpose: This document describes the intended experience, not a replacement for the Master
      Specifications. When implementing systems, Codex should use these principles to make
      reasonable presentation and usability recommendations, but must not invent mechanics that
       conflict with the specification. References are inspiration for feel and function, not instructions to
     copy assets or code.

1. The emotional promise

Four Elements should make the player feel that they are traveling through a living Avatar world with
Team Avatar— allowing them to play out the exact storyline of Avatar the last Airbender scene for
scene. The world we are building should be open and full of small details and secrets, making Players
curious about what lies beyond the next door, excited to recognize a familiar place, and increasingly
capable of changing their surroundings and fighting off the wild creatures, mercenaries, and fire nation
army through the skills they have learned.

It should feel adventurous, warm, mysterious, funny, and sometimes genuinely dangerous. Its world is worth
exploring even when no quest marker points the way. Combat is consequential, but the overall game is not
relentlessly bleak. Moments of relief, companionship, beauty, and discovery are essential contrasts to difficult
battles and the escalating stakes of the story.

The player should feel clever when solving an environmental problem, observant when discovering a hidden
reward, proud when winning a difficult battle, and connected to the party when character abilities complement
one another.

2. Reference DNA: what to borrow

    ●​ Pokémon Gen 3: The excitement of reaching a new city/town to explore, finding a hidden route,
       exploring a cave, recognizing that an old obstacle is now passable with newly learned skills, and
        revisiting a region with newly learned capabilities. Memorable routes and meaningful boundaries, not a
       featureless continuous map. The party tracking system should resemble a party of pokemon, where
       players are able to customize their movesets, give special items, and overall plan their party
        strategically. Also map / world layout style
    ●​ Harry Potter and the Prisoner of Azkaban for Gameboy advanced (POA): Character-specific
       exploration mechanics, magical-feeling environmental interaction, puzzle spaces that ask the player to
      observe and experiment, and the pleasure of coordinating party members and leveling them up
        individually. Techniques should feel learned and embodied. Also world layout
    ●​ Stardew Valley: A readable, charming pixel-art world with enough detail that a bush, crate, drawer,
        shoreline, or path edge might reward attention. Gathering should be relaxing and satisfying, not a chore
       or an endless checklist. World should feel alive and abundant and colorful and full of hidden easter
      eggs and items and locations

### Inspiration Guide — source page 2

●​ Darkest Dungeon: seriousness of battles, variable damage, hit uncertainty, hard choices, and enemies
        that punish having no strategy. Importantly, difficulty should come from readable risks and
      meaningful choices, not arbitrary obscurity or forced grinding.

These references are not equal in every situation. Exploration should be inviting; combat should be
demanding. Neither should erase the other.

VISUAL REFERENCE ATLAS — screenshots and design
takeaways

     For Codex: The screenshots below are actual reference-game screenshots, not mockups of Four
      Elements. Read each caption alongside the creative brief. The image is the visual evidence; the
      caption identifies the particular property to study. Do not assume everything visible in a
     screenshot is a requested feature. These images are hosted at their credited source URLs, but
      screenshots have been attached. Do not copy proprietary sprites, textures, UI graphics, music, or
     code into the game. Implement original assets and systems reflecting the approved design
       principles.

A. Pokémon Emerald — readable outdoor routes, boundaries, and exploration

Reference A1 — Pokémon Emerald, outdoor route. Study: saturated yet readable pixel-art terrain, obvious
walkable paths, vegetation defining the route, NPC placement, and distinct encounter terrain. Apply to Four
Elements: similarly inviting visual clarity and purposeful regional layouts, but with richer environmental
interactions, layered elevation, and more physical movement. Do not copy: the exact tiles, grass sprites, or
Pokémon encounter rules. Screenshot source: Eurogamer.​
​

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

### Inspiration Guide — source page 5

Reference B1 — Harry Potter and the Prisoner of Azkaban (GBA), party and story prompt. Study: small
expressive characters, legible group staging, and a readable story instruction integrated into the game. Apply:
Team Avatar's distinctive sprites, group positioning, dialogue prompts, and story-driven transitions. Do not
copy: the specific Hogwarts interface or character sprites. Screenshot source: GamePro gallery.

B1:





Reference B2 — Prisoner of Azkaban (GBA), Combat UI, character and ability interface. Study: character
portraits for current character turn, visible numerical information, compact ability and menu icons, and
information hierarchy. combat order in top right of image shows combat order (Hermione, enemy1, harry,
enemy2, ron) for this turn. Encounter shows enemy party across from player’s party. Apply: a clear
character-specific identity, readable SP/HP and equipped actions. Combat order indicator, general character
and enemy layout. Important: Four Elements has a separate turn-based combat scene and its own
approved combat loadout rules; this is primarily a UI reference, not a combat-layout mandate. Screenshot
source: GamePro gallery.

B2:





Reference B3 and B4 — Prisoner of Azkaban (GBA), Combat UI, layout, environmental effect on battle,
environmental attacks, attack animations. B3: Study: combat encounter B3 shows “Horklump Spores appear
on the battlefield and blast enemy with pollen.” Apply: the surrounding environment may become a variable in

![Reference image from original page 5](Four_Elements_Reference_Images/reference_page_05_01.png)

![Reference image from original page 5](Four_Elements_Reference_Images/reference_page_05_02.png)

![[reference_page_05_01.png]]

![[reference_page_05_02.png]]

### Inspiration Guide — source page 6

combat encounters. Characters may be able to create environmental variables with special moves or abilities.
Do Not Infer: that the layout will be exactly the same as depicted in the image. Image B4: Study: Enemies
have their own level, health bars, and unique attacks. Enemy attack is portrayed with words, and an animation
of the goblin jumping forward and attacking. APPLY: enemy name, health, stat, info graph. All moves, from our
characters or enemies will have unique animations. Both enemies and our characters will have “taking
damage” animations.

B3:





B4:





                                                                                          ​


​
Reference B5 — Prisoner of Azkaban (GBA), exploration and discovery. Study: Harry is in his room and finds
a letter on the bed that he is able to read, there is also a chest in the corner that can be opened. Apply:
readable objects. Show characters icon with dialogue when reading or thinking.

B5:

![Reference image from original page 6](Four_Elements_Reference_Images/reference_page_06_01.png)

![Reference image from original page 6](Four_Elements_Reference_Images/reference_page_06_02.png)

![[reference_page_06_01.png]]

![[reference_page_06_02.png]]

### Inspiration Guide — source page 7

Reference B6 — Prisoner of Azkaban (GBA), puzzles and world traversal. Study: Hermione is capable of
freezing water with a spell in order to cross a section of the map that is otherwise inaccessible. Understand:
characters will be traversing the map using special abilities that they gradually learn.

B6:





C. Stardew Valley — world feel, loot handling, material richness, and personal spaces

Reference C1 — Stardew Valley, chest transfer interface. Study: clearly separated container/chest and player
inventory, stacks and item icons, quick visual scanning, and choosing which resources to move. Apply:
openable chests, drawers, Appa storage, baskets, stashes, etc. take-all/select-some/leave-all interactions,
quick move items with shift click. Do not infer: that the final backpack must use this exact grid or slot limit;
Pokémon-like pockets are also part of the brief.

C1

![Reference image from original page 7](Four_Elements_Reference_Images/reference_page_07_01.png)

![Reference image from original page 7](Four_Elements_Reference_Images/reference_page_07_02.png)

![[reference_page_07_01.png]]

![[reference_page_07_02.png]]

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

### Inspiration Guide — source page 12

Characters should move by selecting a destination within their available movement range.
Each character ordinarily has one movement allowance and one primary action per turn.
Movement should be important for positioning, avoiding attacks, approaching elemental
resources, and preparing techniques.

Do Not Infer: That Four Elements will use Death Howl's deckbuilding mechanics, action-point
economy, or exact movement grid. A square-grid system is a strong candidate but should be
evaluated by Codex before final implementation.

G1:





Reference G2 — Death Howl, movement range, targeting & enemy positioning.

Study: How the game communicates available movement, attack ranges, enemy positions,
and tactical opportunities through a compact, readable interface. Positioning and distance
influence which actions are possible and how effectively the player can respond to enemies.

Apply: Four Elements should clearly display a character's available movement range when
selecting a destination. Hovering over a location should preview the intended path and
movement cost. When selecting a technique, the game should communicate its range,
affected area, eligible targets, and relevant environmental interactions.

Positioning should matter for every character. Katara may move toward water to access
stronger bending techniques. Toph may reposition to manipulate earth or create barriers.
Sokka may use trees, rocks, and structures as cover. Aang may use his mobility to avoid
danger or reach advantageous positions.

Enemy characters should also move, seek cover, approach targets, and react to changes in
the battlefield.

G2:

![Reference image from original page 12](Four_Elements_Reference_Images/reference_page_12_01.png)

![Reference image from original page 12](Four_Elements_Reference_Images/reference_page_12_02.png)

![[reference_page_12_01.png]]

![[reference_page_12_02.png]]

### Inspiration Guide — source page 13

Reference G3 — Death Howl, enemy attack patterns & tactical decision-making.

Study: How enemy positioning, attack ranges, and recognizable attack patterns encourage
players to anticipate threats rather than simply exchange damage. Movement can be used
defensively, offensively, or to prepare for a subsequent turn.

Apply: Four Elements should reward observation and intelligent positioning. Enemies may
indicate their intended attacks, allowing players to move out of danger, raise defensive
barriers, interrupt preparations, or reposition vulnerable party members.

Combat should encourage multi-turn planning. A character might spend one turn creating
cover, another manipulating that cover into an attack, or use a temporary defensive technique
in anticipation of an enemy's powerful move.

Environmental changes should persist across turns when appropriate. A tree destroyed by
firebending should no longer provide cover. A newly created earth wall should obstruct
movement and attacks until destroyed, removed, or otherwise affected.



Reference G4 — Death Howl, compact tactical combat integrated with pixel-art exploration.

Study: How a pixel-art RPG can combine exploration with a distinct tactical combat
experience while maintaining a consistent visual identity. Battles are small enough to remain
readable but contain sufficient space for movement and tactical decisions.

Apply: Four Elements should maintain a cohesive pixel-art aesthetic between its overworld
and combat scenes. Battlefields should visually reflect the location of the encounter without
requiring a full recreation of every overworld feature.

Combat should generally take place on a single navigable plane. Permanent battlefield
elevation should not create positions where characters become effectively untouchable.

![Reference image from original page 13](Four_Elements_Reference_Images/reference_page_13_01.png)

![[reference_page_13_01.png]]

### Inspiration Guide — source page 14

Instead, vertical movement should primarily be represented by temporary technique states
inspired by Pokémon's Fly and Dig. Characters may become Airborne, Elevated, Burrowed,
or Submerged, changing their vulnerability and available actions for a limited duration.

For example, Toph might raise herself on a temporary earth pillar to avoid an anticipated
attack, then spend her next turn's movement allowance descending. Such techniques should
have appropriate weaknesses and counters.

G4:





Overall Design Takeaway

Death Howl should serve as the primary reference for the physical structure and movement of
Four Elements' tactical combat.

Prisoner of Azkaban remains the reference for character portraits, combat information,
distinctive animations, and accessible interface presentation. Darkest Dungeon remains the
reference for statistical depth, difficulty, status effects, and consequential decisions. Pokémon
informs equipped movesets, progression, and multi turn moves and techniques. Baldur's Gate
3 contributes inspiration for creative environmental interactions.

Four Elements should combine these strengths into a combat system where characters
actively move, use cover, manipulate terrain, anticipate enemy actions, and employ bending
techniques that change the battlefield.

The goal is for combat to feel like an Avatar battle: dynamic, strategic, expressive, and
fundamentally shaped by movement and the environment.

Codex should inspect the existing Godot project and evaluate grid-based navigation,
click-to-move movement allowances, targeting, environmental interactions, and temporary
positioning states before proposing an implementation architecture.

![Reference image from original page 14](Four_Elements_Reference_Images/reference_page_14_01.png)

![[reference_page_14_01.png]]

### Inspiration Guide — source page 15

H. How these references combine

The references contribute different functions, not competing templates. Pokémon guides readable exploration, equipped moves, and temporary positioning techniques. Stardew Valley informs gathering, environmental detail, and visual storage. Prisoner of Azkaban informs character presentation, dialogue, puzzles, and readable combat information. Resident Evil 4 informs multi-location item puzzles. Darkest Dungeon informs combat statistics, risk, and consequences. Death Howl is the leading reference for compact tactical combat, click-to-move positioning, and enemy attack patterns. Baldur's Gate 3 informs creative environmental combinations, without requiring its 3D navigation.

Exploration supports genuine layered topography. Combat generally uses a single navigable plane with temporary technique-driven vertical states. The written Technical Guide governs approved rules; Codex should identify remaining uncertainties and seek approval before changing architecture.

Four Elements is not intended to recreate any one of these games. It combines the strongest aspects of their
exploration, world design, character interaction, combat, inventory, and progression systems into a cohesive
RPG built around the world, characters, and original story of Avatar: The Last Airbender.

The result should feel like a game that could have existed during the Game Boy Advance era, but with the
scale, interactivity, depth, and technical capabilities of a modern game engine.

World Design, Exploration & Traversal

Pokémon Emerald establishes the foundation for how the world is organized and explored. Regions
should feature recognizable pathways, towns, wilderness, buildings, caves, hidden locations, and
environmental obstacles. The player should regularly encounter places that invite exploration or suggest
opportunities to return with new abilities.

Stardew Valley contributes environmental richness and interactivity. The world should contain plants,
ingredients, crafting materials, treasures, containers, and useful objects. Players should be rewarded for
examining their surroundings, interacting with the environment, and venturing beyond the main story route.

Prisoner of Azkaban contributes character-driven exploration and ability-based puzzles. Individual
members of Team Avatar should possess distinctive skills that allow them to interact with the world in different
ways. Newly learned abilities should expand what players can accomplish, opening new routes, solving
puzzles, and revealing previously inaccessible locations.

Four Elements extends these ideas with significantly greater physical freedom and environmental complexity.
Its world should feature meaningful elevation, overlapping pathways, cliffs, rooftops, underground passages,
caves, and vertical traversal. Characters should be able to use bending, agility, and other learned abilities to
manipulate their surroundings and reach new areas.

Environmental interactions should generally follow reusable material and ability rules rather than existing solely
as scripted puzzle solutions.

### Inspiration Guide — source page 16

Character Presentation, Dialogue & Discovery

Prisoner of Azkaban is the primary reference for the presentation of playable characters and story
interactions.

Characters should have expressive, recognizable pixel-art sprites, with portraits and dialogue that
communicate their personalities. Objects discovered in the world may prompt dialogue, observations, or
reactions from individual party members.

Players should be able to inspect letters, books, containers, mechanisms, and other objects, with discoveries
contributing to storytelling, puzzles, and exploration.

Team Avatar should feel like a group of distinct characters traveling together, rather than interchangeable units.
Their relationships, humor, observations, and evolving abilities should remain central to the experience.

Combat Presentation, Tactical Movement & Depth

Prisoner of Azkaban is the strongest visual reference for combat presentation. Battles should take place
in a separate turn-based battle scene, with Team Avatar positioned in the foreground and enemies across the
battlefield. Character portraits, health and stamina information, equipped techniques, and the upcoming turn
order should be clearly presented.

Every character and enemy should have recognizable combat animations, including unique technique
animations, attacks, defensive actions, and reactions to taking damage.

Darkest Dungeon is the primary reference for combat depth, statistics, and meaningful tactical
decisions.

Combat should reward preparation, intelligent technique selection, awareness of enemy strengths and
weaknesses, and careful resource management. Accuracy, dodge, protection, critical chance, damage ranges,
speed, resistances, status effects, targeting limitations, and initiative should all contribute to the outcome of
encounters.

Different techniques should have distinct tactical purposes. Some may require preparation across multiple
turns, affect several targets, manipulate battlefield conditions, cause lasting effects, or involve meaningful risks
and tradeoffs.

The environment itself should sometimes participate in combat, as demonstrated by Prisoner of
Azkaban's environmental attacks. Terrain, available materials, hazards, and character abilities may create
opportunities or complications that change how an encounter unfolds.

Pokémon contributes the accessibility and clarity of a turn-based RPG, while Darkest Dungeon contributes the
strategic depth and consequences. The goal is combat that is approachable to understand but challenging to
master.

Visually and emotionally, battles must remain consistent with Avatar's adventurous, expressive world—not
Darkest Dungeon's gothic atmosphere.

Inventory, Resources & Collectibles

Updated combat reference priority: Death Howl defines navigable battlefield structure and click-to-move positioning. Prisoner of Azkaban defines readable portraits and character-specific UI, not stationary formations. Darkest Dungeon informs statistical decisions. Battlefield features can be manipulated across turns. Combat is ordinarily single-plane; temporary Airborne, Elevated, Burrowed, or Submerged states supply vertical tactics without permanent height-based immunity.

### Inspiration Guide — source page 17

Pokémon provides the organizational reference for categorized inventories, with separate pockets for
different types of items.

Stardew Valley provides the reference for visual item management, including recognizable item icons,
stack quantities, storage containers, and convenient transfer interactions.

Appa's storage should combine these ideas: categorized storage with visual item grids that players can
browse, rather than relying primarily on text lists.

The world should contain a broad variety of collectible items, including crafting materials, ingredients,
consumables, equipment, scrolls, valuable treasures, decorative objects, and rare discoveries that unlock
techniques or contribute to discipline progression.

Items should be found through exploration, foraging, combat, trading, containers, hidden areas, and puzzle
completion. Some treasures may have several uses, creating meaningful choices about whether to consume,
equip, trade, craft with, or display them.

Inventory management should be satisfying and intuitive, with enough resource management to reward
preparation without constantly interrupting exploration.

Appa's Campsite — A Portable, Customizable Home

Pokémon's Secret Bases provide the reference for personalizing a small space with collected furniture,
trophies, and decorations.

Stardew Valley provides the reference for arranging functional and decorative objects in a living
environment.

Together, these inspire Appa's campsite: a portable home that travels with Team Avatar and evolves
throughout the adventure.

Players should be able to customize the campsite's outdoor arrangement with tents, cooking equipment,
storage containers, crafting stations, training facilities, decorative objects, souvenirs, and other discoveries.
Functional upgrades may improve cooking, recovery, storage, crafting, and training.

The campsite should exist physically within suitable outdoor locations rather than functioning only as a menu.
Its layout and contents should persist when the party travels, while accommodating the different terrain and
available space at each landing location. Objects that cannot fit should remain available for later placement.

The player's tent should also have a customizable interior, inspired by Pokémon's Secret Bases, where
collected decorations, treasures, and meaningful objects can be displayed.

The camp should feel personal and rewarding to develop, but remain recognizably Team Avatar's traveling
home rather than becoming a permanent settlement or elaborate building simulator.

Appa's location and availability must continue to follow the original story, including periods when the party
cannot access the full campsite or its stored supplies.

Puzzles, Secrets & Environmental Challenges

### Inspiration Guide — source page 18

Prisoner of Azkaban demonstrates how character abilities can transform the environment and unlock
new routes.

Pokémon demonstrates how visible obstacles, hidden items, and newly acquired abilities encourage
players to revisit locations.

Resident Evil 4 contributes the idea of larger environmental puzzles involving the discovery, collection,
and placement of important objects. Puzzle components may be distributed across rooms, structures, or
entire areas, requiring exploration, observation, combat, and problem-solving before the player can proceed.

Four Elements should incorporate all of these approaches.

Some puzzles may be solved through a single clever bending interaction. Others may require multiple
characters, coordinated abilities, collected objects, environmental transformations, or exploration across
several connected locations.

Enemies may inhabit puzzle areas, and certain challenges may require players to alternate between combat,
exploration, and environmental manipulation.

Puzzles should feel naturally integrated into the Avatar world, with solutions grounded in the characters'
capabilities and the physical properties of their surroundings. Mandatory story progression must remain
completable even when players make unexpected choices.

The Overall Experience

The combined experience should be:

    ●​ As inviting and readable to explore as Pokémon Emerald.
    ●​ As rich with discoveries, resources, and personal expression as Stardew Valley.
    ●​ As character-driven in its exploration, puzzles, dialogue, and combat presentation as Prisoner
       of Azkaban.
    ●​ As tactically demanding and consequential in combat as Darkest Dungeon.
    ●​ As rewarding in its larger environmental puzzles and treasure hunts as Resident Evil 4.
    ●​ As faithful as possible to the characters, humor, emotional depth, worldbuilding, and events of
       the original Avatar: The Last Airbender series.

These references are not competing design directions. Each contributes a particular strength to the same
game.

The defining feature of Four Elements is that its exploration, combat, puzzles, character progression,
resources, and campsite all belong to one interconnected world. A technique learned during the story
might improve combat, unlock a hidden passage, help solve an environmental puzzle, or reveal a rare treasure
that can be used back at camp. The player should continually discover new reasons to explore familiar places
as Team Avatar grows more capable.

The game should preserve the charm and immediacy of classic handheld RPGs while providing a substantially
larger, more responsive, and more interactive Avatar world.

Instructions for Codex

### Inspiration Guide — source page 19

These screenshots are visual and experiential references, not instructions to reproduce another game's assets
or mechanics wholesale.

Codex should study the referenced screenshots alongside their captions, identify the specific presentation and
interaction principles being requested, and use them to inform original designs for Four Elements.

The written Master Specification remains authoritative for approved gameplay rules. Where implementation
details are unresolved, Codex should inspect the existing Godot project, evaluate appropriate solutions, and
present recommendations rather than silently introducing new mechanics or replacing functioning systems.

The goal is not to make a game that looks exactly like Pokémon, Stardew Valley, Prisoner of Azkaban,
Darkest Dungeon, or Resident Evil 4. It is to make an Avatar RPG that captures the best qualities of
each while establishing its own cohesive identity.




3. The desired rhythm

A satisfying play session might look like this:

    1.​ Arrive at a kyoshi island and notice several possible routes to take.
    2.​ Talk to someone in the village that needs some help
    3.​ Go explore
    4.​ Collect an ingredient or find a small reward off the main path.
    5.​ Encounter an obstacle that responds to a technique already learned—or if not, remember it for later.
    6.​ Switch to the party member whose abilities best fit the problem.
    7.​ Solve a puzzle through deliberate input, not an automatic contextual prompt.
    8.​ Meet a character, advance the story, or find a hidden space.
    9.​ Enter a battle that requires attention to enemy intent, stamina, status, and risk.
    10.​Recover, improve a technique, and find the trinket the person in town needed.
    11.​Play out the events of the ATLA series by talking to a specific person
   12.​Zuko attacks and you need to fight him then escape to the next location

The world should alternate between quiet discovery, active manipulation, social/story moments, and
bursts of danger. Avoid repetitive encounters that interrupt puzzle concentration or turn every few steps into
combat.

4. Exploration: curiosity over instruction

Do not constantly tell the player exactly which move to use. Present materials, environmental clues, and
visually legible mechanisms so the player can form a hypothesis. The player deliberately selects a move from
their learned catalog/hotbar and aims it. A technique can work in many places when its utility and the object's
reaction profile are compatible.

A successful interaction should feel like the world responded logically, not like the player found the single
scripted answer. Optional areas should reward unusual combinations, careful observation, and returning with
new mastery. Sometimes not thinking ahead will be punishing, like destroying a boulder versus moving it to a

### Inspiration Guide — source page 20

place that blocks a piece of treasure. Mandatory paths should never require an unavailable party member or
inaccessible technique. There will be places where you need to discover or learn the technique previously in
the game in order to advance, similarly to have in pokemon you need to learn cut, rock smash, or swim before
being able to explore certain areas fully.

Hidden rewards should be discoverable, not random invisible pixels. Use environmental composition, unusual
object placement, sound, dialogue, lighting, or landmarks to hint at secrets. Like in pokemon, sometimes you
will see an item across a body of water, or on a path blocked by a rock. You must remember to come back
when you have the necessary skills.

Layered topography and vertical exploration

The world must preserve the inviting, readable top-down pixel-art feel of Pokémon Gen 3, Stardew Valley, and
Prisoner of Azkaban while giving its unusually agile characters meaningful vertical terrain. Mountainsides,
ledges, rooftops, raised walkways, ravines, underground chambers, caves, tunnels, and overlapping routes
should be part of exploration—not merely painted scenery. Height should matter to how a place is traversed,
how characters separate, and what secrets they notice.

For example, Aang might use an air-assisted double jump to reach a shelf on a mountainside and glide across
a gap. Toph might sense a hollow chamber and uncover a tunnel entrance. Katara might create an icy path
near a waterfall; Sokka might spot a concealed route or practical way around an obstacle. These are illustrative
possibilities, not a requirement that every region contain all four solutions. Ordinary characters should feel
agile, while extraordinary traversal capabilities remain distinctive and earned.

The player should see an intriguing place and wonder which character, technique, or route will let me get
there? Some paths are accessible now, others after learning an ability, and others only after a story event.
Elevated routes and underground passages should reward observation without making navigation visually
confusing.

Technical boundary: This is a gameplay and presentation requirement, not a prescribed engine
implementation. Codex should audit the existing Godot project and compare viable ways to support height,
collision, jumping, occlusion, bending targets, followers, separate maps, and saving. Propose an architecture
and a small test area for approval before rebuilding existing maps. Do not assume full 3D or a particular
tile/elevation solution has been selected.

5. Bending: distinct physical personalities

    ●​ Water: Fluid, adaptive, continuous, graceful, able to change state. Manipulation should have smooth
        visual response and a sense of weight or volume.
    ●​  Earth: Grounded, forceful, geometric, deliberate, heavy. Raising stone should feel stable and
       consequential.
    ●​  Fire: Quick, energetic, precise or volatile depending on technique. Heat, ignition, and illumination
       should have visible reactions and consequences.
    ●​  Air: Light, mobile, sweeping, responsive. Motion and momentum should be expressive without
        sacrificing control.
    ●​ Nonbending: Ingenious, practical, observant, resourceful, witty. Sokka's tools, planning, and foraging
      must feel like valuable specialties, not lesser substitutes for bending.

### Inspiration Guide — source page 21

Shared interaction utilities are a technical language, not an excuse for every element to feel the same. Two
techniques can move an object while differing in animation, momentum, range, material requirements, stamina
cost, and feedback.

6. Party: companions, not interchangeable units

The default follower chain should make the group feel like a traveling team. Party separation should be
available when the story, campsite, or designed exploration/puzzle area permits it—not necessarily at every
moment. A character may leave the group from camp for a solo excursion. Switching leaders should be
immediate and readable. Splitting the party should create opportunities for clever cooperation: one character
holds a position, another navigates a separate route, a third activates a mechanism. Reuniting should feel
convenient when physically possible, but never teleport companions past a meaningful obstacle.​
​
Aang air scooters over a gap at the air temple, then walks through a doorway into a new zone - the other party
member should not be with him in the new area. Aang needs to unlock the back way around, and regroup with
his companions.

Sustained bending can remain active when the player switches away: a controlled element may hover near the
inactive character while concentration continues to matter. Active aiming and interruption rules require careful
design; switching must not automatically make every held effect permanent.

Story events can remove or relocate companions. Those absences should feel narratively motivated and
should be reflected in available interactions, traversal routes, and combat encounters.

7. Combat: harsh, fair, and expressive

Combat should be punishing to lazy repetition, and should reward preparation and intelligent recovery.
Attacks have damage ranges, accuracy and critical uncertainty. A strong attack is not always the right attack:
SP (Stamina Points) cost, target defenses, elemental context, status, enemy intent, and party synergy should
matter.

The player should often think: Can I afford this attack? What happens if it misses? Should I defend, interrupt,
conserve stamina, use this item, flee, or take the risk?

A victory should feel earned, not simply inevitable from having a higher level. Conversely, bad RNG should
create a difficult situation, not make every thoughtful decision irrelevant. Make odds, ranges, relevant status
conditions, and significant enemy telegraphs sufficiently legible. Short, ordinary encounters should remain brisk
and relatively easy; major enemies and bosses can demand sustained planning.

Darkest Dungeon's tactical severity is the reference, not its pervasive hopelessness. Four Elements should
retain the adventurous, humane, and sometimes playful emotional character of Avatar. Characters will be
exhausted or KO’d to portray defeat, and defeat does not always mean game over. Ordinary party defeat
returns the group to the last suitable campsite or authored checkpoint, with a meaningful but not oppressive
consequence. Optional Ironman rules may be harsher; a temporary KO is not automatically a canonical
character death.

8. Progression: growing capability changes perception

## Source passages — Technical Guide (verbatim)

### Technical Guide — source page 2

2. Distinct elemental identities

Water, Earth, Fire, and Air have different physical characteristics and applications to use in the open world.

3. Natural character progression

Benders develop fundamental abilities through experience and story progression. Advanced techniques may
require special training from masters, discovery through treasure, or bartering from traders.

4. Strategic turn-based combat

Combat encounters are separate from exploration and emphasize tactical move selection, status effects,
initiative, and party composition.

5. A reactive, persistent world

Objects respond logically to player actions. Environmental changes and dropped items can persist.

6. Meaningful exploration rewards

Hidden scrolls, equipment, collectibles, crafting materials, shortcuts, and special companions reward players
who investigate the world thoroughly.


PART II — CURRENT DEVELOPMENT
FOUNDATION

2. Existing Systems

The current Godot project already includes or has begun implementing:

    ●​ A playable world scene.
    ●​  Multiple controllable party characters, currently Katara and Sokka.
    ●​  Character switching using Tab.
    ●​  Party leader and linear follower behavior.
    ●​  Character movement and collision.
    ●​ A camera system.
    ●​  Individual character inventories.
    ●​ An inventory interface opened with E.
    ●​  Eight initial personal storage slots.
    ●​  Six hotbar slots.
    ●​  Six equipment slot buttons.
    ●​  Character-specific inventory portraits.
    ●​  Item resource framework defining names, icons, categories, restrictions, and stack limits.
    ●​  Item stacks with quantities.
    ●​ Mouse-based item pickup, placement, swapping, splitting, and combining in the latest inventory UI
       implementation.

### Technical Guide — source page 3

●​  Item transfer restrictions for character specific items.
    ●​  Fluid item transfer between character’s personal inventory
    ●​ The initial framework for consumable items, durability, fuel, and lighting properties.

Existing example items

Fish

    ●​ Food item.
    ●​  Stackable, maximum 20 per stack.
    ●​  Katara begins with 15.
    ●​  Transferable between characters.
    ●​  Intended to support consumption and cooking.

Sokka's Club

    ●​ Weapon.
    ●​ Maximum stack of one.
    ●​  Restricted to Sokka.
    ●​ Cannot be transferred to another character.
    ●​  Intended to remain permanent without ordinary durability loss.

Current development caution

Some inventory functionality has been implemented in code but still requires complete gameplay testing.
Equipment functionality, actual item consumption, durability depletion, fuel consumption, lighting, and world
item interactions are not yet implemented. Jumping is only implemented as an animation, and needs to alter
the character’s world height and interact with ledges.

Existing movement, party switching, inventory portraits, and inventory functionality should be
preserved while adding new systems.


PART III — WORLD EXPLORATION AND
MOVEMENT

3. Real-Time Exploration

Exploration occurs in real time.

Players move characters through the world using WASD keyboard controls while interacting with the
environment using the mouse and contextual actions.

Established direction

    ●​  Characters move independently of mouse targeting.

### Technical Guide — source page 4

●​  Party members travel together linearly.
    ●​ The player can switch the active party member.
    ●​  Environmental bending can be performed while moving.
    ●​  Exploration bending does not automatically initiate combat.
    ●​  Different characters possess different abilities and environmental interactions.

Potential additions

    ●​ Running and walking.
    ●​ Sneaking and stealth.
    ●​ Swimming.
    ●​  Climbing.
    ●​  Traversal shortcuts.
    ●​  Environmental hazards.
    ●​ Weather conditions.
    ●​  Day/night cycles.
    ●​  Fast travel.
    ●​  Rideable transportation. (appa, etc…)
    ●​  Special traversal techniques such as air scooters, ice slides, and earth surfing.

Decisions required

    ●​  Is the world fully interconnected, divided into regions, or composed of separate maps?​
            ​
      The world is interconnected but divided into regions with specialty POIs- it presents on a map as a
        single world. The regions are very large, yet separated through various doorways like how cities and
       routes are separated by load points in Pokemon games. There may be a large rock in the way, bad
       weather, a boss fight, or simply guards that will not let you pass to the next area of the region. Each
       region will have various fast travel points that will be accessible via Appa once discovered. when Appa
         is not available due to story line reasons the player is unable to fast travel. Specialty POIs (air temples,
       ancient ruins, or large cities) may operate with maps of their own and may have an intricate network of
      pathways and depth, or volume of interactions. Explorative POIs may follow a dungeon crawler style of
        exploration, requiring gathering special resources and skills before being able to successfully complete
       every part of the zone.​

    ●​  Will the party always travel together?

     When traveling together, the party will always travel in a linear one-after-the-next order. Certain
       characters will automatically leave the party for story line reasons and become unplayable for a period
        of time, be deposited at a location for a period of time, or be ordered to perform an action in a location
       before rejoining the group.

    ●​ Can party members separate temporarily for puzzles?

       Yes, absolutely. characters can separate to perform different actions simultaneously. These characters
      can be swapped between. When separated, then the player can press a certain key (such as “G”) and
         “call back” the group if the pathways are passable.

### Technical Guide — source page 5

●​ Which traversal actions are available to every character?​
      Jumping, crouching/sneaking, running, opening/closing lootable containers, activating levers, switches,
       buttons,
    ●​  Will stamina or energy limit special movement?​
      There will be stamina/energy that limits the amount of time characters are able to sustain bending in the
      open world. running will not deplete stamina


PART IV — THE BENDING SYSTEM

4. Fundamental Bending Philosophy

Bending should function as a flexible environmental interaction system.

Rather than creating a unique scripted ability for every puzzle, characters learn techniques that can affect
many compatible environmental objects.

For example, Water Manipulation might:

    ●​ Remove water from a pond.
    ●​  Fill a reservoir.
    ●​  Extinguish a fire.
    ●​  Activate a water-powered mechanism.
    ●​  Carry water to a distant location.
    ●​ Water a plant.
    ●​ Freeze a river.
    ●​ Make an ice slide down a slope.

The underlying technique remains the same, while the target object determines the reaction.

Hybrid targeting

We have selected a hybrid approach combining:

Directional bending

    ●​ The mouse controls direction and targeting.
    ●​  Players can aim freely around the character.
    ●​  Controlled materials respond to mouse movement.

Contextual environmental interaction

    ●​  Certain world objects have predefined reactions to appropriate techniques.
    ●​ Some interactions activate automatically.
    ●​  Others require sustained manipulation.
    ●​  Specific bending techniques must be learned to perform specific world interactions

### Technical Guide — source page 27

Fire

    ●​  Fast strokes.
    ●​ Sharp changes in direction.
    ●​  Decisive movements.
    ●​  Timing-based challenges.

Air

    ●​  Spirals.
    ●​  Circular movements.
    ●​ Sweeping arcs.
    ●​ Rhythm and fluid motion.

Proposed training sequence

    1.​ Discover or receive instruction in a technique.
    2.​ Watch a demonstration.
    3.​ Trace or perform the required movement.
    4.​ Receive accuracy feedback.
    5.​ Repeat if necessary.
    6.​ Permanently unlock the technique.

Difficulty variations

    ●​  Single-stroke patterns.
    ●​  Multiple connected strokes.
    ●​ Timed sequences.
    ●​ Pauses at specific points.
    ●​  Directional changes.
    ●​ Complex advanced patterns.

Established design principle

Players should not need to repeat the tracing minigame every time they use an unlocked ability.

The minigame is a learning experience, not a routine combat input.

Potential additions

    ●​  Training scores.
    ●​  Optional mastery challenges.
    ●​  Perfectly learned XP bonus


PART X — TURN-BASED COMBAT

### Technical Guide — source page 28

15. Combat Structure

Open-world real-time combat is not planned for the initial game. Exploration movement remains real-time; combat uses turn-based click-to-move tactical positioning.

Instead, encounters transition into a separate turn-based combat system inspired by Pokémon, darkest
dungeon, and Harry Potter and the Prisoner of Azkaban for Game Boy Advance.

Established direction

    ●​ Combat occurs in dedicated encounters on compact tactical battlefields derived from the surrounding location.
    ●​  Characters take turns repositioning through click-to-move movement and selecting actions.
    ●​ Combat moves have different effects.
    ●​ The party can use bending, weapons, and non-bending techniques.
    ●​ Turn order is displayed on-screen.
    ●​ Encounter circumstances affect opening initiative.
    ●​ Turn order is randomized after the opening round.

Proposed combat screen

The interface contains:

    ●​  Player party.
    ●​ Enemy combatants.
    ●​  Health indicators.
    ●​  Current active character.
    ●​  Available moves.
    ●​  Target selection.
    ●​  Status effects.
    ●​  Battle messages.
    ●​  Turn-order display in the upper-right corner.


16. Initiative and Encounter Advantage

The circumstances under which combat begins determine opening-round initiative.

Player Ambush

The party approaches undetected and initiates the encounter.

All participating party members act before enemies in the first round.

Enemy Ambush

An enemy detects and engages the party first.

All enemies act before the party in the first round.

15A. Approved Tactical Combat Direction — October 26, 2026

Combat is a compact, navigable, turn-based encounter rather than a stationary exchange between fixed party formations. Death Howl is the leading reference for battlefield structure and tactical movement; Prisoner of Azkaban remains a presentation reference, Darkest Dungeon a statistical reference, and Pokémon a reference for move preparation and temporary positioning techniques.

When combat begins, a small battlefield reflects relevant surroundings, such as water, earth, trees, boulders, and structures. Each participating character ordinarily receives one movement allowance and one primary action per turn. The player clicks a destination within the allowed movement distance; the interface should preview reachability, path, and movement cost. The exact grid representation and whether movement can be split around an action remain implementation questions for Codex to prototype and recommend.

Characters and enemies can reposition, seek cover, approach elemental resources, anticipate threats, and alter the battlefield. Environmental changes may persist across turns: earth walls obstruct movement or attacks, destroyed trees cease providing cover, and water sources influence waterbending options. Reuse the exploration system's material and reaction definitions where possible, while keeping combat-specific turn costs, targeting, and AI distinct.

Combat generally has one navigable ground plane. Exploration's multi-layer elevation does NOT imply permanent elevated tactical platforms. Airborne, Elevated, Burrowed, Submerged, and related states are temporary move-driven conditions with duration, vulnerability, targeting, counterplay, and movement consequences. Example: Toph raises herself on a pillar to avoid certain attacks, then may spend the following turn's movement allowance descending. These states must not confer unconditional invulnerability.

Ordinary battles should remain brisk. Major encounters can use bespoke arenas. The initial prototype should demonstrate two characters, limited click-to-move, a river or water source, earth cover, a destructible object, enemy positioning, and one temporary positioning state. Codex must inspect the current Godot project and present architectural options before replacing existing systems.

Status: Approved design direction. Technical pathfinding/grid details and exact balance parameters remain to be evaluated.

### Technical Guide — source page 31

●​  Direct damage.
    ●​ Area damage.
    ●​  Healing.
    ●​  Stun.
    ●​  Burn.
    ●​  Freeze.
    ●​  Poison.
    ●​  Shield.
    ●​ Damage reduction.
    ●​  Evasion.
    ●​  Counterattack.
    ●​  Attack enhancement.
    ●​ Defense enhancement.
    ●​ Reduced accuracy.
    ●​ Reduced movement or initiative.
    ●​  Cleansing negative effects.
    ●​  Multi-hit attacks.
    ●​ Delayed attacks.

Proposed character identities

Katara: Control, healing, freezing, defensive support.

Sokka: Physical attacks, tools, disruption, tactical abilities.

Toph: Heavy damage, protection, crowd control.

Aang: Evasion, defensive techniques, control, disabling enemies.

These are initial design directions rather than finalized move lists.


19. Enemy Combat Behavior

Enemies should use recognizable tactics.

Examples:

    ●​  Attack vulnerable party members.
    ●​ Defend before using powerful moves.
    ●​  Apply status effects.
    ●​ Heal allies.
    ●​  Target specific character weaknesses.
    ●​ Use environmental advantages.

Potential additions

    ●​ Enemy elemental resistances.
    ●​  Boss-specific mechanics.

### Technical Guide — source page 32

●​  Multi-stage boss encounters.
    ●​  Environmental battle modifiers.
    ●​  Special combat rewards.
    ●​ Escape or retreat.
    ●​  Nonviolent encounter resolutions.
    ●​ Enemy reinforcements.

Decisions required

    ●​ How many party members can participate?
    ●​ Can reserve members enter mid-battle?
    ●​ What happens when a character reaches zero HP?
    ●​  Is there a shared or individual energy resource?
    ●​ How do elemental resistances work?
    ●​ Are healing items usable during combat?
    ●​ Can the player flee?
    ●​ What constitutes defeat?


PART XI — EXPLORATION AND COMBAT
TECHNIQUE SHARING

20. Shared Technique Definitions

Some learned bending techniques should function in both exploration and combat.

For example:


 Technique          Exploration              Combat

 Water Whip   Pull distant objects         Damage and possible
                                           stun

 Earth Wall   Block hazards                 Protect allies

 Fire Blast     Ignite targets             Damage enemy

 Air Blast    Push objects             Damage or disrupt

 Ice Shield    Block environmental        Reduce damage
             hazards

 Air Scooter   Faster traversal              Possible evasive
                                           technique

### Technical Guide — source page 53

Likewise, one complete combat encounter should be finished before designing dozens of moves.


PART XXII — ADDITIONAL FEATURES WORTH
EXPLORING

40. Potential Future Systems

These ideas have not been selected as core requirements, but could complement the game.

Exploration

    ●​  Regional weather.
    ●​  Day/night cycles.
    ●​ Hidden caves.
    ●​  Environmental shortcuts.
    ●​ Swimming and underwater exploration.
    ●​  Specialized traversal equipment.
    ●​  Secret bending challenges.
    ●​  Fast travel on Appa or other means

Party

    ●​  Companion-specific abilities.
    ●​ Temporary party separation.
    ●​  Party conversations.
    ●​  Character relationship development.
    ●​  Character-specific side quests.
    ●​  Formation settings.

Bending

    ●​  Multiple simultaneous controlled elements.
    ●​  Elemental combination puzzles.
    ●​ Advanced bending mastery.
    ●​  Environmental material differences.
    ●​  Specialized bending schools.
    ●​  Optional technique challenges.

Combat

    ●​ Boss phases.
    ●​  Elemental terrain modifiers.
    ●​  Cooperative combination attacks.
    ●​  Counterattacks.

### Technical Guide — source page 54

●​  Passive abilities.
    ●​ Enemy resistances.
    ●​  Tactical equipment.
    ●​  Nonviolent encounter outcomes.

Inventory

    ●​  Item sorting.
    ●​ Search and filtering.
    ●​ Equipment comparison.
    ●​  Favorite-item protection.
    ●​  Quick-use consumables.
    ●​ Expanded shared storage.

World

    ●​ NPC schedules.
    ●​  Reputation.
    ●​  Regional economies.
    ●​  Environmental consequences.
    ●​  Optional quests.
    ●​ Hidden collectibles.
    ●​  Treasure journals.

Quality of Life

    ●​  Adjustable text speed.
    ●​ Remappable controls.
    ●​  Controller support.
    ●​  Accessibility options for tracing minigames.
    ●​ Quest journal.
    ●​ Map markers.
    ●​  Tutorial prompts.
    ●​  Adjustable combat animation speed.

Story

    ●​ Where necessary, parts of the story will be told through cutscenes (made by pictures with dialogue)

These should be considered individually rather than automatically added to the development scope.


PART XXIII — KEY DECISIONS TO FINALIZE

41. Design Decision Checklist

### Technical Guide — source page 55

Before committing to a full architecture, the following decisions would benefit from explicit answers.

A. World and Exploration

    ●​  Interconnected world, region-based world, or individual maps?
    ●​  Party always together or occasionally separated?
    ●​ Sneaking and enemy detection system?
    ●​  Day/night and weather systems?
    ●​ Swimming and climbing?

B. Bending

    ●​  Hybrid directional and contextual targeting.
    ●​  Mouse-controlled 360-degree bending.
    ●​  Invisible character-centered bending radius.
    ●​ Movement allowed during sustained bending.
    ●​ Range and capacity improve with progression.
    ●​  Collision and line-of-sight restrictions.
    ●​  Multiple controlled elements.
    ●​ Energy or concentration costs.
    ●​ How bending techniques are selected during exploration.

C. Progression

    ●​  Natural techniques unlock without minigames.
    ●​  Special advanced techniques can require training.
    ●​  Scrolls and teachers can unlock techniques.
    ●​  Level cap.
    ●​  Attribute allocation.
    ●​  Character specialization.
    ●​  Proficiency system.

D. Training

    ●​ Mouse-based tracing for selected advanced techniques.
    ●​  Element-specific movement patterns.
    ●​  Scoring and failure thresholds.
    ●​  Optional mastery challenges.
    ●​  Accessibility alternatives.

E. Combat

    ●​ Separate turn-based encounters.
    ●​ Four initial combat moves.
    ●​ Growth to eight equipped combat moves.
    ●​  Turn-order display.
    ●​ Ambush determines opening advantage.
    ●​ After the opening round, initiative is determined by Speed + RNG.
    ●​ Maximum active party size.
