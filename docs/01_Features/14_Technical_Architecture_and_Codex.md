# Technical Architecture, Roadmap, and Codex

> **Organization note:** This feature note groups design ideas and game references from both supplied guides. The curated synthesis below is an index, not a replacement for the verbatim source excerpts that follow. Where older source wording conflicts with later approved decisions, see [[15_Decisions_Conflicts_and_Questions]].

## References brought together

- **All references:** Inspiration only; written decisions and existing Godot project take precedence.
- **Death Howl:** Evaluate tactical movement and battlefield architecture in a small prototype before committing.

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

### Technical Guide — source page 20

A technique's elemental properties, force, and special behaviors should be shared between exploration and
combat wherever applicable, while combat targeting, damage, status effects, and turn costs are handled by the
combat system.

9. New techniques and objects should be data-driven.

Codex should implement reusable systems and configurable Godot resources rather than hardcoding every
technique-object combination.

10. Environmental puzzles may require sequential interactions.

Objects may change states through combinations of bending techniques, such as wetting and freezing a
mechanism, igniting and extinguishing an obstacle, or raising terrain before activating a switch.




   8. Character-Specific and Specialized Techniques

Some bending techniques should be recognizable not only by their element, but also by the character who
learns or masters them.

These abilities may use shared environmental utilities, but their special characteristics should remain
uniquely described.

Examples worth exploring:

Toph — Seismic Sense

    ●​  Detect movement through the ground.
    ●​ Reveal concealed underground structures.
    ●​  Identify environmental features unavailable through ordinary sight.

Aang — Air Scooter

    ●​  Travel using a sustained sphere of rotating air.
    ●​  Navigate movement challenges requiring balance, momentum, or speed.

Katara — Healing

    ●​  Restore health using water.
    ●​  Treat designated injuries or status effects.
    ●​  Interact with injured characters during story events.

Advanced Waterbenders — Specialized Ice Construction

    ●​  Create more complex structures from available water.
    ●​  Build designated ice formations with greater reach, stability, or duration.

Advanced Firebenders — Precision Heat Control

### Technical Guide — source page 22

PART VI — MULTI-ELEMENT PUZZLES

10. Combining Bending Abilities

Some puzzles should require multiple techniques or characters.

This is a major opportunity to distinguish Four Elements from conventional RPGs.

Examples

Water + Fire​
Fill a boiler with water, then heat it to generate steam and activate an elevator.

Earth + Air​
Raise a stone platform, then use an air-assisted jump to cross a large gap.

Fire + Air​
Ignite a furnace, then increase airflow to intensify the flames.

Water + Earth​
Raise a stone barrier to redirect a river and reveal a submerged entrance.

Fire + Water​
Melt an ice obstruction, then manipulate the resulting water into another mechanism.

Earth + Fire​
Reveal a buried metal mechanism, then heat it to trigger a reaction.

Important design principle

Not every puzzle should have exactly one solution.

Where physically reasonable, multiple bending approaches should be possible.

For example, a fallen tree might be moved using air, burned using fire, or displaced by raising the earth
beneath it.

Proposed puzzle categories

    ●​  Single-element puzzles.
    ●​  Multi-element sequential puzzles.
    ●​  Multi-character puzzles.
    ●​ Timed environmental puzzles.
    ●​  Physics-based object manipulation.
    ●​ Hidden environmental interactions.
    ●​ Advanced-technique gates.

### Technical Guide — source page 23

●​  Optional treasure puzzles.
    ●​  Story-critical traversal puzzles.

Decisions required

    ●​ Should puzzles have multiple solutions whenever practical?
    ●​ Can party members perform techniques simultaneously?
    ●​ Can one character leave an element suspended while another interacts with it?
    ●​ Should environmental changes persist indefinitely?
    ●​ How much free-form manipulation is practical for the game?


PART VII — ENVIRONMENTAL OBJECTS

11. Bendable Objects

Environmental objects should react according to their physical properties and supported interactions.

Three interaction types

1. Immediate Reaction

The player activates a technique and the object responds automatically.

Examples:

    ●​  Lighting a torch.
    ●​  Breaking a fragile rock.
    ●​  Hitting a target.
    ●​  Extinguishing a fire.

2. Controlled Manipulation

The player actively controls an object.

Examples:

    ●​ Moving a boulder.
    ●​  Carrying a sphere of water.
    ●​  Repositioning an object using air.
    ●​  Raising a movable platform.

3. Environmental Transformation

A technique changes the state of an object or location.

Examples:

### Technical Guide — source page 24

●​  Freezing a river.
    ●​  Draining a chamber.
    ●​  Melting ice.
    ●​ Opening a stone passage.

Core principle

If the direction matters, let the player control it. If only activation matters, automate the reaction.

Potential object properties

    ●​ Bendable by Water.
    ●​ Bendable by Earth.
    ●​ Bendable by Fire.
    ●​ Bendable by Air.
    ●​ Flammable.
    ●​  Freezable.
    ●​  Meltable.
    ●​  Breakable.
    ●​ Movable.
    ●​ Heavy or lightweight.
    ●​  Contains water.
    ●​ Conducts heat.
    ●​ Generates light.
    ●​  Activates mechanisms.
    ●​  Persistent state.
    ●​ Recoverable after interaction.

Proposed environmental systems

    ●​  Pressure plates.
    ●​  Levers and switches.
    ●​ Water reservoirs.
    ●​ Doors and gates.
    ●​  Elevators.
    ●​ Movable rocks.
    ●​ Frozen structures.
    ●​  Fire sources.
    ●​  Wind-driven mechanisms.
    ●​  Fragile walls.
    ●​ Hidden passages.
    ●​  Environmental hazards.


PART VIII — CHARACTER PROGRESSION

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

### Technical Guide — source page 46

●​ Dropped objects.
    ●​ Placed objects.
    ●​  Persistent environmental changes.

Story data

    ●​ Completed quests.
    ●​  Dialogue flags.
    ●​  Training events.
    ●​  Story milestones.

Decisions required

    ●​ Manual saving?

Yes but can be toggled off or on from the development side

    ●​  Autosaving?

Yes but can be toggled off or on from the development side

    ●​ Save points?

Yes before key plot moments so if Players fail they fall back a certain amount of time before the interaction,
mini game, or sequence that they just failed, allowing them to reevaluate.

    ●​  Multiple save slots?

Yes but can be toggled off or on from the development side

    ●​ Permadeath or conventional defeat recovery?

Open to ideas on how to make a Party wipe feel significant. There should be a perma death mode. I dont want
players to be able to abuse save slots to


PART XX — TECHNICAL ARCHITECTURE

35. Recommended Code Organization

The goal should be a modular, data-driven architecture.

New abilities, items, and environmental objects should usually be created through reusable resources and
components rather than rewriting character scripts.

Character Systems

CharacterData

### Technical Guide — source page 47

●​  Identity.
    ●​ Base attributes.
    ●​  Progression information.

CharacterInventory

    ●​  Storage.
    ●​  Hotbar.
    ●​ Equipment.

CharacterProgression

    ●​  Level.
    ●​  Experience.
    ●​  Stat growth.
    ●​ Unlock conditions.

CharacterBending

    ●​ Known techniques.
    ●​  Current controlled element.
    ●​ Bending attributes.
    ●​  Targeting and control.

CharacterCombat

    ●​ Combat stats.
    ●​  Active moves.
    ●​  Status effects.


36. Bending Systems

BendingTechnique

    ●​ Technique identity.
    ●​  Element.
    ●​ Unlock requirements.
    ●​  Exploration behavior.
    ●​ Combat behavior.
    ●​ Bending range requirements.
    ●​  Training pattern reference.

BendingController

    ●​ Mouse targeting.
    ●​ Range enforcement.
    ●​ Technique activation.
    ●​  Sustained control.
    ●​ Release behavior.

### Technical Guide — source page 48

ControlledElement

    ●​ Water sphere.
    ●​  Boulder.
    ●​ Flame.
    ●​  Air-manipulated object.
    ●​ Movement and collision behavior.

BendableObject

    ●​ Supported interactions.
    ●​  Environmental reactions.
    ●​  State changes.
    ●​  Persistence.

BendingTraining

    ●​  Training patterns.
    ●​ Mouse tracing.
    ●​ Accuracy evaluation.
    ●​ Technique unlocking.


37. Combat Systems

CombatEncounter

    ●​  Participants.
    ●​ Encounter type.
    ●​  Battle state.

TurnManager

    ●​ Round generation.
    ●​  Initiative.
    ●​  Current actor.
    ●​ Turn completion.

CombatMove

    ●​ Damage.
    ●​  Accuracy.
    ●​  Targeting.
    ●​  Status effects.
    ●​  Costs.
    ●​  Animation references.

StatusEffect

    ●​  Effect type.

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

### Technical Guide — source page 50

●​ Dropped items.
    ●​  Pickups.
    ●​ Placed objects.
    ●​ World position.
    ●​  Persistent state.

EquipmentManager

    ●​ Equipment compatibility.
    ●​  Stat modifications.
    ●​  Equip/unequip behavior.

Important architectural consideration

Stackable materials and individually stateful equipment should not necessarily use identical storage rules.

A stack of 15 Fish can share one item definition and quantity.

Two lanterns with different fuel levels must preserve their separate condition.

This distinction should be addressed before implementing durability and fuel.


PART XXI — DEVELOPMENT ROADMAP

39. Proposed Development Phases

The following order prioritizes stable foundations, reusable systems, and small playable prototypes.

Phase 1 — Complete Inventory Foundation

    ●​  Verify stack splitting and combining.
    ●​ Implement item consumption.
    ●​ Implement equipment functionality.
    ●​ Implement item tooltips.
    ●​ Add item capability properties.
    ●​  Establish individual item condition data.
    ●​ Implement basic item dropping and collection.

Milestone: Items can be stored, transferred, consumed, equipped, dropped, and recovered.

Phase 2 — Basic Environmental Interaction

    ●​  Create interactable object framework.
    ●​ Add object targeting.
    ●​ Add contextual interactions.
    ●​ Add environmental state changes.
    ●​  Create test switches, doors, and mechanisms.

### Technical Guide — source page 51

Milestone: A player can interact with reusable environmental objects.

Phase 3 — First Bending Prototype

    ●​ Add character bending range.
    ●​ Implement mouse-based targeting.
    ●​ Implement Water Manipulation.
    ●​  Create a controllable water sphere.
    ●​  Allow movement while carrying water.
    ●​  Create a water source.
    ●​  Create a target reservoir.
    ●​  Test releasing water and activating a mechanism.

Milestone: Katara can collect, carry, and deposit water to solve a puzzle.

Phase 4 — Expand Elemental Interaction

    ●​  Earth Manipulation.
    ●​  Fire Ignition.
    ●​  Air Push/Pull.
    ●​  Environmental collision.
    ●​  Additional object reactions.
    ●​  Multi-element puzzles.

Milestone: All four elements can meaningfully affect the environment.

Phase 5 — Character Progression

    ●​  Experience and leveling.
    ●​ Bending attributes.
    ●​  Automatic technique unlocks.
    ●​ Technique library.
    ●​  Character-specific progression.

Milestone: Characters naturally acquire and improve abilities.

Phase 6 — Advanced Training Minigame

    ●​  Tracing interface.
    ●​  Training patterns.
    ●​ Accuracy evaluation.
    ●​  Unlocking advanced techniques.
    ●​  Scroll and teacher integration.

Milestone: A discovered scroll or master can teach a new technique through interactive training.

Phase 7 — Turn-Based Combat Prototype

    ●​  Battle scene.
    ●​ Encounter transitions.

Roadmap clarification: Phase 7 must include click-to-move tactical positioning, a contextual battlefield, a reactive environmental object, and a temporary positioning state. Phase 8 expands these systems. Any reference to twelve equipped moves is superseded by the approved eight-move maximum.

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

### Technical Guide — source page 56

●​  Completely random or stat-influenced initiative.
    ●​ Move resource costs.
    ●​ Combat equipment usage.
    ●​  Defeat and recovery.
    ●​ Move customization.

F. Items

    ●​  Stackable inventory.
    ●​  Character-specific restrictions.
    ●​  Selective durability rather than universal wear.
    ●​ Separate fuel and lighting mechanics.
    ●​ Drop interaction method.
    ●​ Throwable item rules.
    ●​  Placeable item rules.
    ●​  Item persistence.
    ●​ Equipment restrictions.
    ●​  Inventory weight versus slot limits.

G. World Systems

    ●​  Crafting and cooking complexity.
    ●​ Merchant economy.
    ●​ Shared party storage.
    ●​ Appa storage.
    ●​  Persistent environmental changes.
    ●​ Save system behavior.


PART XXIV — FINAL DEVELOPMENT
PRINCIPLES

42. Principles to Protect Throughout Development

1. Preserve the identity of Avatar.

Bending should remain central to exploration, puzzles, character progression, and combat.

2. Reward experimentation.

Players should be encouraged to test bending techniques on environmental objects.

3. Keep everyday interactions intuitive.

Basic bending should be easy to perform. Advanced training should feel special.

### Technical Guide — source page 57

4. Separate exploration and combat without disconnecting progression.

Techniques should retain their identity across both gameplay systems.

5. Make the world feel physical.

Water flows, rocks move, fire burns, and air creates motion. Environmental responses should follow
understandable rules.

6. Avoid unnecessary maintenance systems.

Durability, fuel, and inventory restrictions should contribute to gameplay rather than become chores.

7. Design systems to be reusable.

New objects, techniques, and combat moves should be data-driven wherever practical.

8. Prioritize working prototypes.

Implement small, complete examples before expanding content.

9. Preserve existing working functionality.

Changes should be incremental, tested, and backed up.

10. Distinguish confirmed decisions from exploratory ideas.

Not every attractive feature should become a required system.


Overall Development Objective

Build an exploration-driven RPG in which the four elements fundamentally shape how players navigate,
manipulate, and understand the world.

Bending should feel intuitive and expressive. Character progression should feel natural. Advanced techniques
should be meaningful discoveries. Combat should reward strategic decisions. Inventory and equipment should
support exploration without distracting from it.

The game's strongest identity will come from the interaction between these systems: discovering a technique,
using it to reach a previously inaccessible area, solving an environmental puzzle, uncovering treasure, and
carrying that progression forward into the story and turn-based encounters.

The next step is to turn this brief into a finalized feature specification, followed by a modular technical
architecture and milestone-based development plan.
