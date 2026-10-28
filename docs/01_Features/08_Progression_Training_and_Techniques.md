# Progression, Training, and Techniques

> **Organization note:** This feature note groups design ideas and game references from both supplied guides. The curated synthesis below is an index, not a replacement for the verbatim source excerpts that follow. Where older source wording conflicts with later approved decisions, see [[15_Decisions_Conflicts_and_Questions]].

## References brought together

- **Pokémon:** Prepared party, equipped moves, progressive capability unlocks.
- **Prisoner of Azkaban (GBA):** Character-specific development, newly learned traversal and combat abilities.
- **Avatar: The Last Airbender:** Story and teacher-driven training, meaningful advanced arts.

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

### Inspiration Guide — source page 25

7.​ Is the implementation readable, testable, performant, and compatible with existing working features?
    8.​ Does the world support meaningful vertical discovery and character-specific routes without sacrificing
        visual clarity?
    9.​ Does collecting, crafting, and customizing Appa’s camp deepen the sense of a shared journey rather
       than create busywork?

If the answer conflicts with an explicit rule in the Master Specification, do not override the rule. Flag the
tension and ask for a decision.

Architecture and design authority

The creative brief defines desired player experience, not Godot implementation details. Codex should first
perform a read-only audit of existing working systems, identify dependencies and contradictions, and propose
technical approaches with tradeoffs for approval. Illustrative scenarios are not exhaustive hardcoded
requirements. The Master Specification governs finalized mechanics; unresolved choices should be flagged
instead of silently decided.

14. One-paragraph north star

Four Elements is an inviting, richly explorable Avatar The last Airbender Book 1-3 adventure in which
Team Avatar party grows from novice benders and warriors into increasingly capable masters of their
abilities. The player chooses how to use those abilities, discovers secrets through attention and
experimentation, revisits old places with new understanding, and faces turn-based battles that are
tense, uncertain, and won through preparation and strategy rather than attack spam. Layered terrain
and a customizable traveling camp should make discovery and belonging tangible. The world should
feel coherent and reactive; the companions should feel distinct; and every major system should
deepen the sense of journey, discovery, and earned mastery. All of this, as the Player lives out the
events of Avatar the Last Airbender book 1-3 to ultimately defeat the firelord.

## Source passages — Technical Guide (verbatim)

### Technical Guide — source page 25

12. Natural Bending Development

Bending is an innate skill that characters develop through experience.

Basic and intermediate techniques should not require a training minigame.

Established direction

Characters acquire fundamental abilities through:

    ●​  Level progression.
    ●​  Story milestones.
    ●​  Natural character development.
    ●​  Increased bending proficiency.

New abilities become available automatically when the appropriate requirements are met.

Proposed progression attributes

    ●​  Character level.
    ●​  Experience points.
    ●​  Health.
    ●​ Bending power.
    ●​ Bending control.
    ●​  Control range.
    ●​ Element capacity.
    ●​  Precision.
    ●​ Speed.
    ●​  Defensive ability.
    ●​ Technique proficiency.

Not every character needs identical attributes.

Decisions required

    ●​  Is progression primarily level-based or story-based?
    ●​ What is the maximum level?
    ●​ Are attributes automatically increased or player-assigned?
    ●​ Do non-benders progress differently?
    ●​ Can characters specialize?
    ●​ Should story-critical techniques unlock independently of level?


13. Advanced Bending Techniques

Advanced techniques can be acquired through exploration, training, or important story events.

Examples include:

### Technical Guide — source page 26

●​  Discovering ancient scrolls.
    ●​  Studying a hidden manuscript.
    ●​  Learning from a bending master.
    ●​ Completing a specialized training sequence.
    ●​ Reaching a major story milestone.

Example: Katara and Master Pakku

After Katara's confrontation with Pakku at the Northern Water Tribe, a story sequence could involve specialized
training.

The player enters a bending-training minigame to learn the new technique.

Successfully completing the exercise permanently unlocks the ability.

Important distinction

Ordinary progression unlocks techniques automatically. Special training and loot scrolls unlock
selected advanced techniques through an interactive learning experience.


PART IX — BENDING TRAINING MINIGAME

14. Learning Advanced Techniques

The training minigame draws inspiration from tracing spells in the original Harry Potter PC games.

The player uses the mouse to reproduce a movement pattern associated with a bending technique.

The patterns should reflect the physical philosophy of each element.

Elemental movement styles

Water

    ●​  Flowing curves.
    ●​ Continuous movements.
    ●​ Smooth transitions.
    ●​  Controlled circular motions.

Earth

    ●​  Angular shapes.
    ●​  Precise corners.
    ●​  Deliberate movements.
    ●​  Firm pauses.

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
