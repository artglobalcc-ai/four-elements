# Party, Characters, and Dialogue

> **Organization note:** This feature note groups design ideas and game references from both supplied guides. The curated synthesis below is an index, not a replacement for the verbatim source excerpts that follow. Where older source wording conflicts with later approved decisions, see [[15_Decisions_Conflicts_and_Questions]].

## References brought together

- **Prisoner of Azkaban (GBA):** Party staging, character portraits, discovery dialogue, individualized abilities; B1, B5.
- **Pokémon:** Party organization and preparation.
- **Avatar: The Last Airbender:** Character voices, relationships, story-driven availability and separation.

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
