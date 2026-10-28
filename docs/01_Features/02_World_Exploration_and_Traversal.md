# World, Exploration, and Traversal

> **Organization note:** This feature note groups design ideas and game references from both supplied guides. The curated synthesis below is an index, not a replacement for the verbatim source excerpts that follow. Where older source wording conflicts with later approved decisions, see [[15_Decisions_Conflicts_and_Questions]].

## References brought together

- **Pokémon Emerald / Emerald Seaglass:** Readable routes, visible obstacles, revisiting places, collectible items; A1–A3.
- **Prisoner of Azkaban (GBA):** Party-led traversal, freezing water and character abilities; B1, B5–B6.
- **Stardew Valley:** Dense foraging, containers, lively environmental detail; C3.
- **Resident Evil 4:** Multi-location exploration and collecting components; F1.

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

### Technical Guide — source page 1

FOUR ELEMENTS

Game Design & Development Brief

Version 0.1 — October 20, 2026

Project: Four Elements​
Engine: Godot 4.7.2​
Platform: PC initially​
Visual style: Pixel-art, isometric-inspired RPG​
Primary inspiration: Avatar: The Last Airbender​
Gameplay inspirations: Harry Potter and the Prisoner of Azkaban (PC and Game Boy Advance), Gen 2&3
Pokémon (Leaf Green, Fire Red, Diamond, Pearl), Stardew Valley, and other exploration-driven adventure
RPGs.


PART I — THE CORE VISION

1. Game Identity

Four Elements is an exploration-driven open world RPG set in the world of Avatar: The Last Airbender,
combining real-time environmental interaction, elemental-bending-based traversal and puzzle-solving,
character progression, treasure and loot hunting, inventory management, and turn-based combat encounters.

The defining gameplay principle is:

Bending is not simply a combat mechanic. It is the primary way characters interact with, navigate, and
transform the world to progress and discover new areas, while playing out the events of Avatar the
Last Air Bender season 1-3 as closely as possible.

The game should encourage curiosity, experimentation, and exploration

Players will encounter obstacles, hidden pathways, environmental puzzles, treasures, multiple types of
enemies, and characters throughout an interconnected world.

Progression comes from developing bending abilities, learning specialized techniques, acquiring equipment,
exploring new areas, and advancing the story.

Primary design pillars

1. Exploration through bending

Bending abilities open pathways, manipulate environmental objects, reveal secrets, and solve puzzles.

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

### Technical Guide — source page 7

Sustained            Ability to maintain demanding techniques
 Control            over longer periods of time

 Projectile Range   Distance a released attack can travel

 Bending Power    Strength of particular techniques


These attributes should not necessarily increase at the same rate.

Important distinction

Control range and projectile range are separate.

A suspended water sphere simply remains within the control radius.

A launched water blast can travel beyond it.

Potential additions

    ●​  Larger objects move more slowly.
    ●​ Advanced benders can manipulate multiple objects simultaneously.
    ●​  Environmental obstacles block controlled objects.
    ●​  Line-of-sight restrictions.
    ●​  Certain techniques require nearby source material.
    ●​  Stronger techniques require more concentration or resources.
    ●​ Some controlled elements can interact with one another.
    ●​  Characters can learn “move combos” where party members can perform moves together if conditions
       are met. Conditions may be each character must know a specific move to do a combo move.
    ●​  Certain characters can carry small amounts of their element, such as rocks or water

Decisions required

    ●​ Should controlled objects physically collide with walls?

            ​
        Projectiles should stop at walls and objects, while sustained bending moves should simply follow the
       character if hitting a wall for too long

    ●​ Can water travel around corners under the player's control?

      yes

    ●​ Can controlled elements move vertically between elevations?

      yes

    ●​ Can players maintain more than one controlled object?

no

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
