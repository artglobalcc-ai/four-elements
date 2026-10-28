# Combat: Battlefield, Movement, and Environment

> **Organization note:** This feature note groups design ideas and game references from both supplied guides. The curated synthesis below is an index, not a replacement for the verbatim source excerpts that follow. Where older source wording conflicts with later approved decisions, see [[15_Decisions_Conflicts_and_Questions]].

## References brought together

- **Death Howl:** PRIMARY battlefield reference: compact tactical zone, click-to-move positioning, readable enemy threats; G1–G4.
- **Prisoner of Azkaban (GBA):** Character portraits, turn-order presentation, ability icons and attack animations; B2–B4.
- **Darkest Dungeon:** Meaningful tactical risk, damage variation, visible statistics and statuses; E1–E3.
- **Pokémon:** Equipped moves, multi-turn moves, temporary Fly/Dig-like vertical states.
- **Baldur’s Gate 3:** Environmental reactions and positional combinations, not a full 3D combat requirement.

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

### Inspiration Guide — source page 24

10. Pixel-art visual direction

Aim for a bright, readable, expressive top-down/isometric-inspired pixel-art world with distinct silhouettes,
this should be exactly like stardew valley and Pokemon Gen 3, and POA. purposeful environmental detail, and
coherent scale. The Southern Water Tribe should feel icy, open, and wind-swept; other regions should have
their own material palettes, vegetation, architecture, weather cues, and ambient life. The world can be colorful
and welcoming while still supporting ominous ruins, dangerous wilderness, and serious story moments.

Movement should feel responsive and consistent in eight directions. Sprite anatomy, perspective, facing, and
foot alternation should remain coherent. Cutscenes can be modestly more detailed than gameplay, but should
feel like the same visual universe rather than a completely different art style. Favor clarity of interactive objects
over decorative noise.

References establish visual and gameplay goals, not permission to reuse proprietary sprites, audio, or
source code. New assets and implementations should be made for Four Elements.

11. Sound, feedback, and interface tone

Creative guidance, not a finalized asset list: Let each region have a recognizable ambient soundscape.
Bending should sound materially different—flowing water, shifting stone, air pressure, flame. Interactions need
prompt, restrained feedback: a mechanism clicks, ice forms, a container opens, a technique fails for a legible
reason.

Menus should be quick and understandable, with minimal interruption to exploration. Combat presentation
should emphasize HP, SP, statuses, hit chances, and readable consequences. UI should support deliberate
play without covering the world in constant tutorial prompts.

12. What the game should NOT feel like

    ●​ A series of one-off scripted puzzles where abilities only work on their designated prop.
    ●​ An empty world with huge travel distances and little to discover.
    ●​ A survival game that forces constant hunger, tool repair, or tedious maintenance.
    ●​ A combat system where the strongest move is always the best move.
    ●​ A combat system where outcomes feel random because the player cannot understand the risks.
    ●​ A party game where companions teleport through obstacles or lose their identity.
    ●​ A progression grind where repeated trivial actions are better than meaningful exploration.
    ●​ A technical demo whose systems work individually but do not produce a coherent adventure.

13. The creative decision filter for Codex

When choosing between plausible implementations, ask:

    1.​ Does this make exploration more curious, rewarding, and physically understandable?
    2.​ Does the player retain agency in choosing and applying abilities?
    3.​ Does it preserve the distinct identities of characters and elements?
    4.​ Does it reward preparation, observation, and skill rather than rote repetition?
    5.​ Does it fit the tone of an adventurous Avatar journey, including humor, warmth, and danger?
    6.​ Is the system reusable and data-driven rather than tailored only to the example?

## Source passages — Technical Guide (verbatim)

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

### Technical Guide — source page 29

Neutral Encounter

Both sides become aware of each other simultaneously.

Opening turn order is randomized.

Subsequent rounds

After the first round, initiative for all eligible combatants is recalculated using Speed + RNG at the beginning of each round.

The turn-order display updates to reflect the new sequence.

Potential additions

    ●​ Speed affecting initiative.
    ●​  Priority moves.
    ●​ Stun delaying or canceling actions.
    ●​  Surprise bonuses.
    ●​ Enemy awareness states.
    ●​  Stealth-enhancing equipment.

Decisions required

    ●​ Should turn order be completely random or influenced by speed?

Speed stat + RNG

    ●​ Should every character receive exactly one action per round?

yes

    ●​ Can moves alter turn order?

yes

    ●​ Can stunned characters lose entire turns?

yes

    ●​ Does an ambush grant extra damage as well as initiative?

Yes, but it just makes the damage stat rng range use the top half +2 (so instead of DMG 12-18, it is DMG
15-20 SNK ATTK)


17. Combat Move Progression

Characters begin with four available combat moves. To switch out a combat move, the Player must select it
from the learned movies catalog as their turn. This operates in the same way that switching out a pokemon
works.

### Technical Guide — source page 30

Through progression, the number of active combat moves can increase to a maximum of 8.

Proposed interface

Moves are organized into groups of four.

    ●​ Page 1: Moves 1–4.
    ●​ Page 2: Moves 5–8.

The player can switch between pages during their turn.

Important unresolved distinction

The 8 moves represents the maximum number of equipped moves, selected from a larger library.


18. Combat Move Properties

Each move should be defined using reusable properties rather than unique combat code whenever possible.

Proposed properties

      Property                  Purpose

 Move Name          Display name

 Element              Water, Earth, Fire, Air, or Non-bending

 Power            Damage or healing amount

 Accuracy           Chance of success

 Target Type           Single target, multiple targets, self, allies

 Status Effect          Stun, burn, freeze, etc.

 Status Chance        Probability of applying effect

 Effect Duration      Number of rounds

 Resource Cost       Energy required

 Cooldown           Turns before reuse

 Priority               Special initiative behavior

 Animation             Visual effect

 Unlock Requirement  Level, story event, scroll, training


Potential combat effects

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

### Technical Guide — source page 33

A technique should have a shared identity and unlock status, even when its exploration and combat
implementations differ.

Not every exploration technique needs a combat equivalent.

Likewise, some combat moves may have no exploration application.


PART XII — INVENTORY AND ITEM
MANAGEMENT

21. Character Inventories

The current inventory framework supports individual character storage.

Existing structure

    ●​  Eight personal storage slots.
    ●​  Six hotbar slots.
    ●​  Six equipment slots.
    ●​  Stackable items.
    ●​  Item quantities.
    ●​  Character restrictions.
    ●​  Item transfers.
    ●​ Mouse-held items.
    ●​  Inventory character switching.

Established and proposed interactions

    ●​  Pick up a full stack.
    ●​  Split a stack.
    ●​  Place one item.
    ●​ Combine matching stacks.
    ●​ Swap items.
    ●​  Transfer items between characters.
    ●​ Equip or unequip items.
    ●​ Consume items.
    ●​ Drop items into the world.
    ●​ Throw designated items.
    ●​  Place designated objects.
    ●​ Use items in crafting.
    ●​  Sell items.
    ●​  Store items.

Proposed future inventory features

### Technical Guide — source page 49

●​  Duration.
    ●​  Magnitude.
    ●​  Application and expiration.

EnemyAI

    ●​ Move selection.
    ●​  Target selection.
    ●​  Tactical behavior.

CombatUI

    ●​ Move selection.
    ●​  Target selection.
    ●​  Turn-order display.
    ●​  Battle information.


38. Item Systems

ItemData

    ●​ Shared item definitions.
    ●​  Categories.
    ●​  Capabilities.
    ●​ Base statistics.

ItemStack

    ●​  Item reference.
    ●​  Quantity.
    ●​  Instance-specific state when appropriate.

ItemInstance / EquipmentState

    ●​  Individual durability.
    ●​  Fuel.
    ●​ Upgrades.
    ●​  Other unique condition data.

InventoryManager

    ●​  Adding.
    ●​ Removing.
    ●​  Splitting.
    ●​ Combining.
    ●​  Transferring.
    ●​ Consuming.

WorldItem

### Technical Guide — source page 52

●​  Initiative.
    ●​  Turn-order UI.
    ●​ Four starting moves.
    ●​  Target selection.
    ●​ Damage and healing.
    ●​  Basic enemy AI.
    ●​  Victory and defeat.

Milestone: A complete turn-based encounter can be played from beginning to end.

Phase 8 — Combat Expansion

    ●​ Up to eight equipped combat moves.
    ●​  Status effects.
    ●​  Multi-target attacks.
    ●​  Defensive moves.
    ●​ Advanced enemy AI.
    ●​ Combat rewards.
    ●​  Character-specific move progression.

Milestone: Combat supports varied tactical encounters.

Phase 9 — World Systems

    ●​ Dropped-item persistence.
    ●​  Placeable objects.
    ●​  Lantern lighting and fuel.
    ●​  Tool durability.
    ●​  Crafting.
    ●​  Merchants.
    ●​  Storage containers.
    ●​  Exploration rewards.

Phase 10 — Saving and Content Development

    ●​  Save/load architecture.
    ●​  Persistent environmental states.
    ●​  Story progression.
    ●​  Dialogue and quests.
    ●​  Regional maps.
    ●​ More enemies and NPCs.
    ●​ Advanced puzzles.
    ●​  Additional characters.

Recommended process

Build one complete example of each system before expanding it.

For example, one fully functional water puzzle is more valuable than ten partially implemented bending
techniques.

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
