# Four Elements Technical Guide

Revised October 26, 2026. Complete revised text organized by source page.

## Source page 1

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

## Source page 2

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

## Source page 3

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

## Source page 4

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

## Source page 5

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

## Source page 6

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

## Source page 7

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

## Source page 8

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

## Source page 9

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

## Source page 10

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

## Source page 11

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

## Source page 12

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

## Source page 13

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

## Source page 14

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

## Source page 15

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

## Source page 16

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

## Source page 17

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

## Source page 18

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

## Source page 19

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

## Source page 20

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

## Source page 21

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

## Source page 22

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

## Source page 23

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

## Source page 24

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

## Source page 25

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

## Source page 26

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

## Source page 27

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

## Source page 28

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

## Source page 29

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

## Source page 30

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

## Source page 31

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

## Source page 32

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

## Source page 33

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

## Source page 34

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

## Source page 35

●​  Sellable.

Proposed item capabilities

    Capability               Description

 Consumable      Quantity decreases when used

 Droppable      Can be placed on the ground

 Throwable      Can be launched

 Placeable      Can be positioned as a world
                    object

 Equipable      Can occupy an equipment slot

 Breakable      Can be destroyed

 Repairable       Condition can be restored

 Refillable         Fuel or charge can be replenished

 Craftable       Can be created from materials

 Sellable        Can be sold

 Transferable    Can move between inventories

 Quest-Protected  Cannot be accidentally discarded

 Readable       Opens text, maps, or lore

 Usable           Activates an effect

 Light-Producing   Illuminates surroundings


Not every property must be implemented immediately.


23. Dropping Items

Dropping removes an item or stack quantity from inventory and creates a corresponding object in the world.

Proposed behavior

    ●​  Items appear near the character.
    ●​ Dropped items can be collected again.
    ●​  Quantities are preserved.
    ●​  Item condition and fuel are preserved.
    ●​ Dropped items can potentially persist after leaving the area.

## Source page 36

Input options to decide

    ●​ Drag outside the inventory.
    ●​  Dedicated Drop button.
    ●​ Both methods.

Important questions

    ●​ Can any ordinary item be dropped?

Any item other than quest items and personal artifacts that are character or party specific. Non droppable items
are able to be put into group storage or be sold after the Player uses them for their intended purpose.

    ●​ Can items be dropped in combat?​
      no , but some items may be used in combat​

    ●​ Can dropped items block movement?​
      No, dropped items will not block movement. If the Player walks away from the dropped items, walking
      back over them will pick them up. There will be a discard trashcan system in the inventory like Stardew
       Valley
    ●​ Can enemies interact with dropped items?​
      No, if an item is placed down (torch, chest, rock) they may be able to interact with it
    ●​ Do dropped items despawn?​
      Yes they do after something like 5 minutes or if there are over 100 individual other items dropped


24. Throwing Items

Throwing is distinct from dropping, which is distinct from placing

A thrown item travels through the world and may interact with objects or characters.

Examples

    ●​ Throwing rocks.
    ●​ Throwing a pot.
    ●​ Throwing food.
    ●​ Throwing a distraction object.
    ●​ Throwing a tool toward a mechanism.

Proposed properties

    ●​ Throw distance.
    ●​ Throw speed.
    ●​  Impact behavior.
    ●​  Recoverability.
    ●​  Breakability.
    ●​  Environmental reactions.

## Source page 37

Potential additions

    ●​ Thrown objects trigger pressure plates.
    ●​  Fragile objects shatter.
    ●​ Thrown objects distract enemies.
    ●​  Objects land and become collectible.
    ●​  Certain objects interact with bending.

Design boundary

Because initial combat is turn-based, throwing objects in exploration should primarily support puzzles and
environmental interaction.

Combat throwing attacks should be represented as turn-based moves.


25. Placeable Objects

Some items can be placed into the environment and used there.

Proposed examples

Lantern

    ●​  Place on the ground.
    ●​  Illuminate an area.
    ●​ Consume fuel.
    ●​  Pick up again.

Campfire

    ●​  Provide light.
    ●​ Cook food.
    ●​  Potentially provide warmth or rest.

Trap

    ●​  Place in a suitable location.
    ●​  Interact with animals or enemies.

Crate

    ●​  Position for puzzles.
    ●​  Potentially use as a platform or obstruction.

Potential additions

    ●​  Tents.
    ●​ Cooking stations.

## Source page 38

●​  Portable storage.
    ●​ Temporary shelters.
    ●​  Bait.
    ●​  Markers.
    ●​  Environmental tools.

Decisions required

    ●​ Which items are placeable?
    ●​ Can placed objects be moved after placement?
    ●​ Do placed objects persist?
    ●​ Can placed items be destroyed?
    ●​ Can bending interact with placed objects?


PART XIV — CONSUMPTION, DURABILITY,
FUEL, AND LIGHTING

26. Consumption

Consumable items decrease in quantity when used.

Examples:

    ●​ Food.
    ●​  Potions.
    ●​  Crafting ingredients.
    ●​ Ammunition.
    ●​ Cooking materials.

When quantity reaches zero, the stack disappears.

Potential additions

    ●​  Hunger.
    ●​ Temporary buffs from meals.
    ●​  Healing food.
    ●​  Special recipes.
    ●​  Status-curing consumables.

Hunger and survival requirements have not been selected as core features.


27. Selective Durability

## Source page 39

We have agreed that universal equipment durability would likely be unnecessarily tedious.

Durability should primarily apply to selected tools and equipment.

Examples

Shovel

    ●​ Has a limited number of uses.
    ●​ Wears down when digging.
    ●​ Can potentially be repaired or replaced.

Fishing Net

    ●​  Gradually wears down.
    ●​  Better nets last longer.

Sokka's Club

    ●​ No ordinary durability requirement.
    ●​ Remains permanent.

Potential additions

    ●​  Tool quality tiers.
    ●​  Repairs.
    ●​  Crafting upgrades.
    ●​  Tool efficiency.
    ●​ Breakage animations.
    ●​ Worn equipment penalties.


28. Fuel and Lighting

Fuel should be separate from durability.

Lantern properties

    ●​  Light radius.
    ●​  Fuel capacity.
    ●​  Current fuel.
    ●​  Fuel consumption rate.
    ●​  Lit/unlit state.
    ●​  Refillable state.

Example progression

Basic Lantern

## Source page 40

●​  Small light radius.
    ●​  Short fuel duration.

Traveler's Lantern

    ●​  Larger light radius.
    ●​  Greater fuel capacity.

Masterwork Lantern

    ●​ Broad illumination.
    ●​  Long-lasting fuel.

Proposed lighting interactions

    ●​  Carry lanterns.
    ●​ Equip lanterns.
    ●​  Place lanterns.
    ●​  Refill lanterns.
    ●​  Light or extinguish lanterns.
    ●​  Illuminate dark passages.
    ●​ Reveal hidden environmental details.

Bending integration

Firebenders can create temporary light.

Waterbenders may extinguish flames.

Airbenders may influence some flames.

Lighting could become a meaningful exploration mechanic, particularly in caves, ruins, and underground areas.


PART XV — EQUIPMENT

29. Equipment System

The inventory UI currently contains slots for:

    ●​ Head.
    ●​ Upper Body.
    ●​ Lower Body.
    ●​  Trinket 1.
    ●​  Trinket 2.
    ●​ Backpack.

Actual equipment behavior remains to be implemented.

## Source page 41

Proposed equipment effects

    ●​  Increased defense.
    ●​  Elemental resistance.
    ●​  Increased storage capacity.
    ●​ Improved bending attributes.
    ●​  Increased light radius.
    ●​ Reduced fuel consumption.
    ●​ Improved stealth.
    ●​ Improved movement speed.
    ●​  Special environmental interactions.

Visual equipment

A future feature under consideration is displaying equipped clothing and armor on character portraits and
potentially on world sprites.

This would require layered character visuals or alternate sprite sets.

Decisions required

    ●​ Do weapons have dedicated equipment slots?
    ●​ Can characters equip off-hand items?
    ●​ Do equipped items alter appearance?
    ●​ Are trinket bonuses passive?
    ●​ Can equipment unlock abilities?
    ●​  Is equipment character-specific?


PART XVI — CRAFTING, COOKING, AND
ECONOMY

30. Crafting

Crafting would use inventory materials to produce new items.

Possible categories

    ●​  Cooking.
    ●​  Tool crafting.
    ●​ Equipment crafting.
    ●​  Repairs.
    ●​  Fuel preparation.
    ●​  Potions and remedies.
    ●​  Specialized exploration items.

## Source page 42

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

## Source page 43

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

## Source page 44

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

## Source page 45

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

## Source page 46

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

## Source page 47

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

## Source page 48

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

## Source page 49

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

## Source page 50

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

## Source page 51

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

## Source page 52

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

## Source page 53

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

## Source page 54

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

## Source page 55

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

## Source page 56

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

## Source page 57

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
