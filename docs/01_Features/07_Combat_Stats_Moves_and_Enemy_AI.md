# Combat: Statistics, Moves, and Enemy AI

> **Organization note:** This feature note groups design ideas and game references from both supplied guides. The curated synthesis below is an index, not a replacement for the verbatim source excerpts that follow. Where older source wording conflicts with later approved decisions, see [[15_Decisions_Conflicts_and_Questions]].

## References brought together

- **Darkest Dungeon:** Accuracy, crit, variable damage, dodge, protection, speed, resistances and consequential choices; E1–E3.
- **Prisoner of Azkaban (GBA):** Readable HP/SP, portraits, move feedback and distinct animations; B2–B4.
- **Death Howl:** Attack telegraphs, targeting patterns, spatial planning and movement; G2–G3.
- **Pokémon:** Prepared move selection, multi-turn actions and temporary vulnerability states.

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
