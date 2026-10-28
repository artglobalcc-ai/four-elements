# Persistence, Saving, and World State

> **Organization note:** This feature note groups design ideas and game references from both supplied guides. The curated synthesis below is an index, not a replacement for the verbatim source excerpts that follow. Where older source wording conflicts with later approved decisions, see [[15_Decisions_Conflicts_and_Questions]].

## References brought together

- **Stardew Valley:** Persistent arranged personal spaces and storage.
- **Pokémon:** Exploration backtracking and progression state.
- **Death Howl / Avatar design:** Combat environmental states and consequences should be clearly scoped and saved where required.

## Source passages — Inspiration Guide (verbatim)

### Inspiration Guide — source page 23

enjoy collecting things.. Open a chest like in stardew valley or minecraft, and either transfer all items to your
inventory or pick and choose, or choose nothing.

Appa's customizable portable campsite: a traveling home

Appa's campsite should be more than a rest menu. It should feel like Team Avatar's little moving home, built
up gradually from discoveries and resources gathered throughout Books 1–3. When the group makes camp at
a suitable place, players should be able to arrange its layout and contents: bedrolls, cooking gear, chests,
lanterns, rugs, souvenirs, crafting tools, training objects, and decorative finds. Placement and, where
appropriate, rotation should be player-controlled. Functional objects can also be decorative.

The campsite's preferred layout and owned contents persist as the group travels with Appa. Different camp
locations retain their own atmosphere and terrain; the system should handle limited space by safely packing
items that cannot fit rather than losing them or placing them inside obstacles. Some camps may be basic
temporary camps without Appa or without access to all facilities, depending on story circumstances.

Camp upgrades can improve rest and healing, cooking quality and recipes, storage capacity,
crafting/preparation, and training. Progress should come from gathered materials, discoveries, trade, and
story milestones. Decorating is an enjoyable optional pursuit; it should not become a mandatory chore or a
substitute for character progression. The camp should grow more personal over time without turning into a
permanent mansion or a survival-management simulator.

Resources, treasures, crafting, and rewarding discoveries

The world should contain a broad variety of items with meaningful and sometimes overlapping uses:
ingredients, crafting materials, tools, equipment, combat consumables, valuables, collectible treasures, scrolls,
quest objects, furniture, and decorative items. Some treasures might grant XP toward a specific discipline,
support training, teach or unlock a technique, or provide a distinctive equipment effect. A lantern could
decorate camp and also provide light; a discovered artifact might be collectible, tradable, or useful in
progression. Exact rewards and limits are balancing decisions, not permission for Codex to invent a complete
item economy.

The joy of finding a hidden chest or returning to a remote cave should be enhanced by not knowing whether it
contains a rare material, a practical tool, an exciting scroll, a piece of camp furniture, or a playful reference to
the series. Loot should feel abundant and diverse, while powerful rewards remain earned and paced.

Personal backpacks and Appa's storage

The desired direction is simple, Pokémon-inspired pocket organization for each character's carried items,
separate from equipped gear and combat loadouts. Pockets might organize consumables, materials, tools,
valuables, scrolls/key items, and decorations; an item can have multiple functional tags even if it appears in
one pocket. Appa carries bulk storage, furniture, crafting supplies, and the camp collection when
narratively and physically available. Avoid a magically shared party inventory that negates separation or Appa's
absence.

Backpack capacity is not yet finally chosen: generous Pokémon-style storage with sensible restrictions is
currently preferred over constant slot-by-slot inventory friction. No weight-based micromanagement is desired.
Preserve and audit the existing inventory implementation before proposing a migration. Story-essential items
must not become irretrievably inaccessible when Appa is absent.

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

### Technical Guide — source page 34

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

### Technical Guide — source page 35

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

### Technical Guide — source page 36

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

### Technical Guide — source page 37

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

### Technical Guide — source page 38

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

### Technical Guide — source page 39

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

### Technical Guide — source page 40

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

### Technical Guide — source page 41

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

### Technical Guide — source page 42

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

### Technical Guide — source page 43

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
