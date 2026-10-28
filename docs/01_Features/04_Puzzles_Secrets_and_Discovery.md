# Puzzles, Secrets, and Discovery

> **Organization note:** This feature note groups design ideas and game references from both supplied guides. The curated synthesis below is an index, not a replacement for the verbatim source excerpts that follow. Where older source wording conflicts with later approved decisions, see [[15_Decisions_Conflicts_and_Questions]].

## References brought together

- **Prisoner of Azkaban (GBA):** Ability-driven obstacles and environmental problem-solving; B5–B6.
- **Pokémon Emerald:** Visible future routes, hidden items, revisits; A2–A3.
- **Resident Evil 4:** Collect-and-place puzzles distributed across locations; F1.
- **Stardew Valley:** Reward curiosity, foraging and inspecting ordinary objects; C3.

## Source passages — Inspiration Guide (verbatim)

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

### Inspiration Guide — source page 3

A1:​





Reference A2 — Pokémon Emerald Seaglass, obstructed route (fan-made variant, not original Emerald).
Study: a visible, memorable obstruction that suggests a return trip after acquiring a traversal ability. Apply:
boulders, ice, cliffs, gates, streams, and tunnels should advertise future opportunities. Unlike a single-use HM
rock or tree, Four Elements' objects should react through reusable capability and material rules. Screenshot
source: Mr. Walkthroughs.

A2:





Reference A3 — Pokémon Emerald Seaglass, obstructed route (fan-made variant, not original Emerald).
Study: a visible item on the ground that can be picked up, as well as a body of water that can be traversed
using the correct move. Apply: items can be available and visible on the overworld, not just in containers
Screenshot source: Mr. Walkthroughs.

A3:

![Reference image from original page 3](Four_Elements_Reference_Images/reference_page_03_01.png)

![Reference image from original page 3](Four_Elements_Reference_Images/reference_page_03_02.png)

![[reference_page_03_01.png]]

![[reference_page_03_02.png]]

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

### Inspiration Guide — source page 8

Reference C2 — Stardew Valley, player arranged storage, items, and decorative objects. Study: objects that
are functional and expressive of player preference, a compact but personalized space, and clear placement on
the world grid. Apply: Appa's mobile campsite as a customizable “home”, persistent arrangement, storage
furniture, crafting stations, souvenirs, and decorations. Pay Attention: the camp should not look like an indoor
house. It will be outside in the open world at designated Appa fast travel locations. It will not require identical
geometry at every landing point. Items that can not fit on the ground should go into a side bar to be placed
down by the player if necessary. Camp items may include: campfire to cook, tents, item upgrade station, level
up skill station, storage containers connected to Appas storage, and potentially other Avatar related content
Screenshot source: player-shared Imgur album.​
​
C2:​





Reference C3 — Stardew Valley, open world with items and foraging. Study: stardew valley has foragable
foods in the open world, from root vegetables to fruit bushes, as well as multiple different types of resources
that can be collected in the open world.​


C3:

![Reference image from original page 8](Four_Elements_Reference_Images/reference_page_08_01.png)

![Reference image from original page 8](Four_Elements_Reference_Images/reference_page_08_02.png)

![[reference_page_08_01.png]]

![[reference_page_08_02.png]]

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

### Technical Guide — source page 8

●​ Does sustained bending consume energy?

      yes

    ●​ What happens when the character is interrupted while bending?

Simple interactions like dialogue will not disrupt bending. Combat situations, certain major cutscenes, or fast
travel will disrupt bending.


PART V — ELEMENTAL EXPLORATION
ABILITIES

1. Environmental Interaction System

Four Elements uses a unified environmental interaction system across waterbending, earthbending,
firebending, airbending, and nonbending abilities.

All techniques use a standardized vocabulary describing what an action accomplishes. The specific
materials, objects, and conditions affected are identified in parentheses.

Techniques with the same function must use the same utility label, regardless of element. However, sharing a
utility does not mean two techniques can interact with the same objects.

Standardized Interaction Vocabulary


          Utility                                 Function



 Strike Targets        Apply directed force to enemies, objects, or mechanisms.



 Move Objects        Push, pull, lift, carry, retrieve, or reposition compatible objects and
                         materials.



 Manipulate Flow      Redirect, stop, accelerate, or control moving substances and
                         currents.



 Activate             Operate physical or element-sensitive devices.
 Mechanisms

### Technical Guide — source page 9

Clear Obstacles     Remove, disperse, or destroy designated obstructions.



 Create Pathways    Form traversable routes, bridges, ramps, or surfaces.



 Create Platforms    Form or raise surfaces that support characters or objects.



 Create Barriers      Form structures that block movement, attacks, or hazards.



 Modify Terrain        Raise, lower, reshape, excavate, or otherwise alter suitable terrain.



 Modify Material       Freeze, melt, ignite, extinguish, heat, cool, dry, or otherwise change
 State                  material conditions.



 Reveal Hidden       Expose concealed objects, passages, mechanisms, or
 Objects              environmental information.



 Illuminate Areas     Produce light in dark environments.



 Enhance Traversal   Improve movement, jumping, gliding, sliding, propulsion, or
                         navigation.



 Protect Characters   Prevent or reduce damage from attacks or environmental hazards.



 Restore Characters   Restore health or remove designated negative conditions.



Each technique lists only its distinct utilities. Specific applications appear in parentheses.

Example:

Water Blast

    ●​  Strike Targets (enemies, fragile objects, distant switches).
    ●​ Move Objects (push lightweight objects).
    ●​  Activate Mechanisms (water-sensitive devices).

### Technical Guide — source page 10

An object's reaction rules determine whether the attempted interaction succeeds.


2. Universal Object-Reaction System

All objects intended to respond to bending, weapons, or environmental forces use a shared interaction
component with configurable reaction profiles.

Each profile defines:

    ●​ Accepted Elements: Water, Earth, Fire, Air.
    ●​ Accepted Nonbending Interactions: Melee, projectiles, tools, or other physical actions.
    ●​ Required Utilities: The standardized actions an object can respond to.
    ●​ Required Properties: Impact, heat, cold, wind, water, pressure, or other applicable properties.
    ●​ Strength Requirements: Minimum force or proficiency needed.
    ●​  State Requirements: Conditions such as intact, wet, frozen, burning, or activated.
    ●​ Reaction Results: Break, move, ignite, extinguish, freeze, activate, reveal, or other supported
       behaviors.

Objects may support multiple reactions, including different reactions to the same technique depending on their
current state.

Reusable Reaction Profiles

Reaction profiles are reusable Godot resources assigned independently of an object's texture or appearance.

Examples include:

    ●​  Fragile Ceramic
    ●​ wooden crate
    ●​  Unlit torch
    ●​ Heavy Stone
    ●​ Frozen Barrier
    ●​  Reinforced Structure
    ●​ Dry debris

Individual objects may override their assigned profile when necessary.

Example: Ceramic Pot


  Interaction                           Reaction



 Water Whip    Shatter

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

### Technical Guide — source page 21

●​  Apply controlled heat to mechanisms or materials without igniting their surroundings.
    ●​  Solve puzzles requiring precise thermal manipulation.

These are examples rather than a finalized list of character-exclusive abilities. Some techniques may be
learnable by multiple characters, while others could remain unique to a particular character or story event.


   9. Implications for Game Development

This shared vocabulary should become the basis for how Bendable Objects respond to different abilities.

A ceramic pot, for example, would support Break Fragile Objects.

It would not need separate instructions for Water Whip, Rock Blast, Fire Blast, and Air Blast. Any technique
with that utility and sufficient force could break it.

A windmill, by contrast, might support Activate Elemental Mechanisms, but specifically require a wind-based
interaction.

A large stone barrier might support Break Reinforced Objects, while requiring an appropriate material
interaction or minimum force.

  Proposed ability data structure

Each bending technique could eventually define:

    ●​ Technique Name: Water Whip, Rock Blast, etc.
    ●​ Element: Water, Earth, Fire, Air.
    ●​  Utility Tags: Shared actions the technique can perform.
    ●​ Elemental Properties: Water, ice, heat, wind, stone, etc.
    ●​  Target Requirements: Which objects, materials, or sources it can affect.
    ●​ Range: How far from the character the technique can operate.
    ●​ Force / Strength: The level of physical impact it can produce.
    ●​ Manipulation Capacity: How much material or how many objects it can control.
    ●​  Duration: How long its effects persist.
    ●​ Movement Rules: Whether the character can move while maintaining the technique.
    ●​ Progression Requirements: Level, story milestone, teacher, or discoverable scroll.
    ●​  Special Behaviors: Unique interactions not covered by shared utilities.

This separates what an ability can do from which element or character performs it.

It also gives us a scalable way to introduce new bending techniques without writing entirely new interaction
logic for every object.

Example puzzle

A canyon contains several elevated platforms.

Aang uses a high jump to reach the first platform, then activates a wind-driven mechanism to open a passage.

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
