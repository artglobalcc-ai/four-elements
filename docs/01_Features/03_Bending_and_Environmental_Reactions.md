# Bending and Environmental Reactions

> **Organization note:** This feature note groups design ideas and game references from both supplied guides. The curated synthesis below is an index, not a replacement for the verbatim source excerpts that follow. Where older source wording conflicts with later approved decisions, see [[15_Decisions_Conflicts_and_Questions]].

## References brought together

- **Prisoner of Azkaban (GBA):** Character-specific environmental techniques and traversal; B6.
- **Pokémon Emerald:** Ability-gated routes, extended into reusable material rules; A2–A3.
- **Stardew Valley:** Abundant interactive world resources; C3.
- **Baldur’s Gate 3:** Creative combinations of terrain and elemental actions (inspiration only).

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

### Technical Guide — source page 6

●​ The player will choose between the various moves in their knowledge base via hotbar selection. The
          full move knowledge base can be accessed quickly to choose the appropriate move if not already in the
       hotbar.

This provides flexibility without requiring a completely unrestricted physics simulation.


5. Bending Range

Each bender has an invisible circular control radius centered on the character.

The mouse can move freely in any direction, but a controlled element cannot travel beyond the character's
current bending range. This same 360 degree aiming system will determine the direction of a ranged bending
move (like rock throw, water whip, fire blast, air push).

Certain moves may drag an element in a certain direction via a combination of character movement and the
mouse, such as redirecting the flow of water.

Established mechanics

    ●​  Full 360-degree mouse targeting.
    ●​ The bending radius follows the moving character.
    ●​  Controlled elements cannot instantly travel across the map.
    ●​ When the cursor moves beyond the radius, the element remains at the radius boundary.
    ●​  Controlled elements move smoothly toward the desired position.
    ●​ Bending range can increase through XP level progression.
    ●​ The maximum size or quantity of controlled material can also increase.

Example

Katara draws water from a pond.

A floating water sphere appears within her control radius.

She can walk while keeping the sphere suspended nearby.

The player moves the mouse to reposition the sphere, but it remains within Katara's bending range.

When Katara reaches a fire, she releases the water onto it to extinguish it.

Proposed bending attributes

     Attribute                     Function

 Control Range    Maximum distance for sustained manipulation

 Element Capacity  Maximum amount of material controlled

 Control Speed    How quickly controlled material responds

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

### Technical Guide — source page 11

Rock Blast     Shatter



 Air Blast       Shatter if force is sufficient



 Melee Attack  Shatter if force is sufficient



 Fire Blast    No reaction unless a compatible heat or impact reaction is
                configured


Example: Wooden Crate


     Interaction            Reaction



 Air Blast          Move if force is sufficient



 Water Blast        Move if force is sufficient



 Rock Blast          Break if force is sufficient



 Fire Blast              Ignite



 Water Manipulation   Extinguish if burning



 Melee Attack        Break if force is sufficient



Core principle: Abilities describe what they can do; objects determine what they respond to.

Compatibility must be evaluated through utilities, elemental properties, strength, and object state—not element
alone.

### Technical Guide — source page 12

3. Waterbending — World Traversal and Interaction

Identity: Fluid manipulation, freezing, flow control, adaptability, and restoration.

Core Techniques

Water Blast

    ●​  Strike Targets (enemies, fragile objects, distant switches).
    ●​ Move Objects (push lightweight objects).
    ●​  Activate Mechanisms (water-sensitive devices).

Water Manipulation

    ●​ Move Objects (extract, carry, and transfer available water; fill containers and reservoirs).
    ●​  Manipulate Flow (controlled water).
    ●​  Activate Mechanisms (water-powered devices).

Freeze

    ●​  Modify Material State (freeze available water, moving currents, and designated objects).
    ●​  Create Pathways (ice bridges and frozen surfaces).
    ●​  Create Platforms (ice formations).
    ●​  Create Barriers (ice walls).
    ●​ Enhance Traversal (frozen surfaces).

Water Redirection

    ●​  Manipulate Flow (redirect, stop, or drain water).
    ●​  Clear Obstacles (flooded passages and water obstructions).
    ●​ Reveal Hidden Objects (submerged objects exposed by lowering water levels).
    ●​  Activate Mechanisms (waterwheels and hydraulic devices).

Water Whip

    ●​  Strike Targets (enemies, fragile objects, close switches).
    ●​ Move Objects (pull or retrieve compatible objects).

Ice Slide

    ●​  Create Pathways (temporary sliding surfaces).
    ●​ Enhance Traversal (rapid movement across ice).

Water Lift

    ●​  Create Platforms (controlled columns of water).
    ●​ Enhance Traversal (vertical movement).
    ●​ Move Objects (raise compatible objects).

Ice Ramp

### Technical Guide — source page 13

●​  Create Pathways (inclined ice surfaces).
    ●​  Create Platforms (elevated ice formations).

Water Pressure

    ●​  Strike Targets (high-pressure impact).
    ●​  Clear Obstacles (designated pressure-vulnerable barriers).
    ●​  Activate Mechanisms (pressure-sensitive devices).

Water Vortex

    ●​ Move Objects (multiple objects within a controlled area).
    ●​  Manipulate Flow (rotating water currents).

Mist Manipulation

    ●​  Manipulate Flow (mist and water vapor).
    ●​  Clear Obstacles (mist obstructing visibility).
    ●​  Activate Mechanisms (humidity-sensitive devices).

Plant Hydration

    ●​  Modify Material State (rehydrate dried vegetation).
    ●​  Activate Mechanisms (plant-growth and water-sensitive mechanisms).
    ●​  Create Pathways (designated plant growth).

Healing Techniques

    ●​  Restore Characters (health and applicable negative conditions).

Specialized Ice Structures

    ●​  Create Pathways (complex ice bridges and routes).
    ●​  Create Platforms (advanced ice formations).
    ●​  Create Barriers (larger or more durable ice structures).

Example Puzzle

A flooded chamber contains a submerged treasure chest.

Katara uses Water Redirection to divert incoming water into another channel, lowering the water level and
revealing the chest.

She then uses Water Manipulation to transfer water into a reservoir, activating a mechanism that opens the
next passage.


4. Earthbending — World Traversal and Interaction

Identity: Structure, terrain modification, physical force, stability, and protection.

### Technical Guide — source page 14

Core Techniques

Rock Blast

    ●​  Strike Targets (enemies, fragile objects, reinforced structures, distant switches).
    ●​ Move Objects (push objects through impact).
    ●​  Activate Mechanisms (impact-sensitive devices).

Earth Manipulation

    ●​ Move Objects (push, pull, lift, carry, and reposition earth and stone).
    ●​  Clear Obstacles (movable earth and stone obstructions).
    ●​  Activate Mechanisms (pressure plates and physical switches).

Raise / Lower Earth

    ●​  Modify Terrain (raise, lower, and reshape suitable ground).
    ●​  Create Platforms (pillars and elevators).
    ●​  Create Pathways (stairs, bridges, and raised routes).
    ●​  Clear Obstacles (designated terrain obstructions).
    ●​  Activate Mechanisms (elevation-dependent devices).

Earth Shield

    ●​  Create Barriers (stone shields and protective cover).
    ●​  Protect Characters (projectiles, falling debris, and environmental hazards).

Advanced Techniques

Earth Surfing

    ●​ Enhance Traversal (rapid movement across suitable terrain).

Stone Bridge

    ●​  Create Pathways (stable stone bridges).
    ●​  Create Platforms (extended stone supports).

Earth Shelter

    ●​  Create Barriers (enclosed stone shelters).
    ●​  Protect Characters (environmental hazards and incoming attacks).

Burrowing

    ●​  Modify Terrain (excavate suitable earth).
    ●​  Create Pathways (underground passages).
    ●​  Clear Obstacles (soft earth).

Stone Door Manipulation

    ●​ Move Objects (stone doors and movable structures).

### Technical Guide — source page 15

●​  Activate Mechanisms (stone-operated devices).

Seismic Sense

    ●​ Reveal Hidden Objects (concealed passages, underground structures, and objects).
    ●​ Reveal Hidden Objects (movement and environmental information transmitted through connected
       ground).

Buried Object Detection

    ●​ Reveal Hidden Objects (objects concealed beneath suitable terrain).

Earth Wall

    ●​  Create Barriers (stone walls).
    ●​  Protect Characters (projectiles and environmental hazards).

Rock Redirection

    ●​ Move Objects (redirect falling or moving rocks).
    ●​  Protect Characters (falling stone hazards).

Multiple Boulder Manipulation

    ●​ Move Objects (multiple stones simultaneously).
    ●​  Activate Mechanisms (multiple pressure plates).

Earthquake

    ●​  Strike Targets (area impact).
    ●​  Modify Terrain (designated unstable ground).
    ●​  Activate Mechanisms (vibration-sensitive devices).
    ●​  Clear Obstacles (fragile structures).

Specialized Material Manipulation

    ●​ Move Objects (advanced earth materials).
    ●​  Modify Terrain (material-specific environments).

Example Puzzle

A broken mountain pathway is impassable.

Toph uses Raise / Lower Earth to create a series of platforms across the gap.

At the far side, she uses Rock Blast to strike a distant mechanism and open the final passage.


5. Firebending — World Traversal and Interaction

Identity: Heat, ignition, combustion, illumination, energy, and propulsion.

### Technical Guide — source page 16

Core Techniques

Fire Blast

    ●​  Strike Targets (enemies and compatible objects).
    ●​  Modify Material State (ignite combustible materials).
    ●​  Clear Obstacles (combustible obstructions).
    ●​  Activate Mechanisms (fire-sensitive devices).

Ignite

    ●​  Modify Material State (ignite torches, braziers, campfires, furnaces, and fuses).
    ●​  Illuminate Areas (controlled flames).
    ●​  Activate Mechanisms (fire-powered devices).

Heat

    ●​  Modify Material State (melt ice, heat metal, dry materials, and cook food).
    ●​  Clear Obstacles (ice and heat-sensitive obstructions).
    ●​  Activate Mechanisms (temperature-sensitive devices).

Flame Illumination

    ●​  Illuminate Areas (sustained controlled flame).
    ●​  Modify Material State (ignite nearby compatible objects).

Advanced Techniques

Fire Jet

    ●​ Enhance Traversal (propulsion, elevated movement, and crossing gaps).

Controlled Heating

    ●​  Modify Material State (precise heating and melting).
    ●​  Activate Mechanisms (temperature-sensitive devices).

Steam Generation

    ●​  Modify Material State (convert available water into steam).
    ●​  Activate Mechanisms (steam-powered and pressure-sensitive devices).

Furnace Activation

    ●​  Activate Mechanisms (furnaces and heat-powered machinery).
    ●​  Modify Material State (heat metal and other compatible materials).

Thermal Updraft

    ●​  Manipulate Flow (rising heated air).
    ●​ Enhance Traversal (upward air currents).

### Technical Guide — source page 17

Combustion Control

    ●​  Modify Material State (ignite, intensify, or control designated flames).
    ●​  Clear Obstacles (combustible obstructions).

Advanced Flame Manipulation

    ●​ Move Objects (controlled flames).
    ●​  Modify Material State (ignite multiple targets).
    ●​  Activate Mechanisms (multiple fire-sensitive devices).

Example Puzzle

A ruined building contains a blocked entrance and a frozen mechanism.

A firebender uses Ignite to burn away combustible debris, Heat to melt the frozen mechanism, and Furnace
Activation to power the machinery inside.


6. Airbending — World Traversal and Interaction

Identity: Movement, airflow, momentum, pressure, evasion, and mobility.

Core Techniques

Air Blast

    ●​  Strike Targets (enemies, fragile objects, distant switches).
    ●​ Move Objects (push lightweight objects).
    ●​  Activate Mechanisms (wind-sensitive devices).

Air Manipulation (Push / Pull)

    ●​ Move Objects (push, pull, lift, carry, and retrieve lightweight objects).
    ●​  Manipulate Flow (controlled air currents).
    ●​  Activate Mechanisms (airflow-operated devices).

High Jump / Glide

    ●​ Enhance Traversal (elevated locations, crossing gaps, gliding, and safe descent).

Air Scooter

    ●​ Enhance Traversal (rapid ground movement and momentum-based challenges).

Advanced Techniques

Air Clearing

    ●​  Clear Obstacles (smoke, fumes, and airborne debris).

### Technical Guide — source page 18

●​  Manipulate Flow (redirect air currents).

Sandstorm Dispersal

    ●​  Clear Obstacles (airborne sand).
    ●​  Manipulate Flow (sand-carrying currents).
    ●​ Reveal Hidden Objects (objects concealed by sand).

Windmill Activation

    ●​  Activate Mechanisms (windmills, turbines, and wind-powered devices).

Projectile Redirection

    ●​ Move Objects (redirect compatible projectiles).
    ●​  Protect Characters (incoming projectiles).

Air Cushion

    ●​  Protect Characters (falls and falling objects).
    ●​ Enhance Traversal (safe landings).

Air Lift

    ●​ Move Objects (lift and carry lightweight objects).
    ●​  Create Platforms (temporary air-supported lift).
    ●​ Enhance Traversal (vertical movement).

Pressure Manipulation

    ●​ Move Objects (push and pull using air pressure).
    ●​  Activate Mechanisms (pressure-sensitive devices).

Sound Manipulation

    ●​  Manipulate Flow (sound-carrying air currents).
    ●​  Activate Mechanisms (sound-sensitive devices).

Air Vortex

    ●​ Move Objects (multiple lightweight objects).
    ●​  Manipulate Flow (rotating air currents).

Wind Current

    ●​  Manipulate Flow (directed air currents).
    ●​ Enhance Traversal (air-assisted movement and gliding).
    ●​ Move Objects (propel airborne objects).

Sail Propulsion

    ●​ Move Objects (wind-driven boats and sails).
    ●​ Enhance Traversal (wind-powered travel).

### Technical Guide — source page 19

●​  Activate Mechanisms (wind-powered devices).

Example Puzzle

A ruined temple contains a suspended platform, a wind-powered mechanism, and a passage filled with smoke.

Aang uses Air Clearing to disperse the smoke, Air Blast to activate a distant switch, and Air Manipulation to
move a lightweight object onto a pressure plate.

He then uses High Jump / Glide to reach the newly accessible platform.


7. Implementation Principles

The following rules apply to all elemental exploration abilities.

1. Shared utilities must use identical terminology.

The same action must always use the same utility label, regardless of element or character.

2. Specific applications belong in parentheses.

For example:

    ●​  Strike Targets (fragile ceramic).
    ●​ Move Objects (push lightweight stones).
    ●​  Modify Material State (freeze water).

3. Object compatibility is determined by reaction rules.

A technique's utility does not automatically make it effective against every object supporting that utility.

4. Textures do not determine behavior.

Interaction profiles are assigned to objects independently of their appearance.

5. Reaction profiles must be reusable and configurable.

Objects share common reaction profiles, with optional overrides for unique objects and puzzles.

6. Multiple reactions and states are supported.

Objects may respond differently depending on their material, current condition, or previous interactions.

7. Techniques retain their individual identities.

Shared utilities do not make techniques interchangeable. Each technique may have different range, force,
material requirements, duration, movement restrictions, and progression requirements.

8. Environmental interactions and combat use compatible ability data.

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
