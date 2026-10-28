# Party foundation testing ground

Godot 4.7.2. Open testing_ground.tscn and Run Current Scene (F6).
The original world.tscn remains the main scene; no prototype gameplay scripts are modified.
This is the first integrated sandbox milestone, not the complete game feature set.

## Controls

- WASD/arrows: travel; Space: terrain-aware jump. A low/high ledge course is near x=0, y=320, between the bending wing and original party course.
- Tab: rotate only the selected group's characters through their existing physical slots.
- E: selected leader's inventory; Tab inside: carousel only this group's inventories.
- Tap T: check who stays with the current leader; unchecked companions form a new idle group.
- R: cycle groups. Supports four groups, with five characters in the test roster.
- Hold T for 0.55 seconds: inactive groups fast-walk back when a path exists. Releasing a hold does not open the split dialog. R or a new split cancels regrouping.
- F: developer ice gate toggle; cannot close on a character. Close it between groups to test blocked return.
- 1: select the active bender's basic technique when quickslot 1 is empty. Katara: pool, then vessel/reservoir/fire. Toph: marked stone. Aang: lightweight block. Zuko: unlit brazier.
- Right-click: drop Katara's held water or cancel the active bender's short cast. Water concentration lasts 45 seconds and survives control changes.
- B: show bending control help.
- Enter on the gold east-side pad: full-party event check (all five test characters).
- Left-click world: equipped weapon swing aimed toward the cursor.

## Inventory and equipment

Eight on-person slots and six quick slots are provisional capacities. Backpack starts with 12 visible cells in three rows of four and adds scrollable rows as it fills.
Click to pick up a stack; it leaves the slot and follows the cursor. Click again to place it.
Right-click picks half or places one. Tab changes inventories within this group while retaining the held item.
Carry/Moves/Pack and category buttons are on the right. Pack scrolls inside the supplied artwork. Moves is a placeholder for a separate 4-to-8-slot combat loadout. Keyboard Tab still switches characters; its on-screen button is removed.
Place Sokka's club directly into his labeled Weapon slot to equip. Click it again to pick it up and unequip.
Close safely returns held items; a full inventory keeps the window open rather than losing anything.
Two valid club hits break the test crate. Inventory pauses the whole world.
See UI_DRAFT.md for the updated interface. The user's element/nonbender panel textures are unchanged.

## Art and animation handoff

Katara/Sokka use existing art. Aang/Toph/Zuko are labeled tinted stand-ins, not final designs.
Club wield/swing reuses the existing icon plus socket rotation and a temporary body lean.
No newly drawn attack animation is claimed. Add attack_<direction> animations to copied sandbox SpriteFrames
and adjust the WeaponSocket presentation when approved character/club frames are available.
WeaponDefinition stores the attack timings/rules separately from the animation.
Use the reference atlas plus Avatar animated-series direction; the user controls final art and map layout.

## Scope and limitations

Navigation is a sandbox-only flat grid matched to the fixed ice wall/gate. This does not settle exploration elevation architecture.
Followers replay bounded breadcrumbs with collision sweeps; if a route becomes invalid they wait rather than teleport.
Regroup uses physical movement and revalidates a moving destination. All world physics, attacks, animations,
concentration and returning groups pause during inventory. The split dialog also pauses as a sandbox convenience.
Water Manipulation now collects/carries/releases one water sphere, fills a reservoir to open its gate, and extinguishes a fire.
See WATER_MILESTONE.md for details and tests; UI_DRAFT.md describes the new reference-inspired interface. No combat, save files, Appa, final backpack categories,
logical elevation, damage to characters, quests or final world layout are implemented here yet.
Use this one playground for subsequent approved milestones. Do not overwrite the production village.

UI: Gameplay HUD is at 75% of its earlier size. Placing Sokka's club into a quickslot selects and equips that same owned item; its icon appears in the HUD and inventory weapon slot without duplication.

## Element training wing (October 28)

Walk left from spawn. The sandbox spans x=-640..640, y=0..448 with a navigation grid covering the whole area. Four colored, labeled areas have open walking lanes: water northwest, earth northeast, air southwest, fire southeast. Original party/gate course remains east.

Toph raises/lowers the designated stone, changing collision and navigation. Raising underneath a party member is rejected. Aang pushes a lightweight block 32 pixels away from the cast direction, checking obstacles, actors and boundaries first. Zuko delivers a short orange Ignite effect; the brazier can be extinguished by Katara and relit. These are deliberately small sandbox interactions, not final terrain deformation, freeform air control, damage, traversal powers, or combat moves.

Technique and reaction resources provide character permissions, utility/material compatibility, range and speed. Short earth/air/fire delivery uses ElementController; sustained water keeps its existing controller. In-flight casts pause with inventory, support cancellation, and stop when the delivery path becomes blocked. They do not consume combat SP or start a sustained concentration timer. State persists only during the session.

Tests: element_tests.gd (44 checks); training_layout_tests.gd (four negative-coordinate routes plus bounds/prop placement); existing party, water, inventory and scrolling/quickslot suites. Visual review uses actual Godot viewport renders. Original character artwork remains unchanged; Aang/Toph/Zuko still use tinted stand-ins.

## Shared interactions and elemental shots

1 selects basic interaction: water carrying, earth raise/lower, air push, or flame control. Zuko's flame control toggles a compatible fire off or on. 2 selects a separate short elemental shot, aimed at the cursor in any direction, with a provisional 144-pixel maximum and visible travel. Katara must collect water using 1 first; shooting consumes that held water. 3 selects Toph's Earth Push. Item assignments still take priority over these sandbox empty-slot defaults.

The same stone accepts earth reshape, earth push and air push through separate reaction resources, with shape sweeps and actor guards for pushes. Fragile crates and impact switches accept the shared strike_targets utility from water, earth, fire and air shots. Utility-only flame control does not damage crates. Each shot checks collisions along every traveled segment, expires at maximum range, pauses in inventory, and can be cancelled. Test crates and switches are available in each elemental area. They are gray/yellow when inactive, green/yellow when activated.

Freezing is not yet implemented; it remains a Katara-specific technique, not a blanket permission granted to all elements. Short shots do not establish final combat damage, SP costs, unlocks or movesets. The reservoir pocket has a western wall so the expanded training wing cannot bypass its gate.

## Simplified Katara controls and safe thawing

Move 1 starts selected for all benders. Katara's move 1 combines collecting, carrying, vessel/reservoir placement, extinguishing, and shooting; click a compatible receptacle for placement or another target/open ground to shoot. The internal water-shot controller is no longer a separate hotbar move. Move 2 is Freeze / Thaw. The marked water crossing in the western water area toggles between a blocked liquid surface and walkable ice. This is a designated sandbox surface, not universal freezing of every water texture or vessel yet.

Freeze requires Katara's specific technique and permissions. Thaw rechecks all roster actors at effect arrival, including inactive groups and collision-radius overlap at platform edges. Occupied ice stays frozen, retaining its collision/navigation state. Freeze/Thaw pauses with inventory. Other characters keep their existing shot/push controls.

freeze_tests.gd verifies the revised controls, physical/navigation changes, reversible state, character permission, active/inactive party protection, and pause behavior (27 checks).

## Environmental water material

Pools, finite puddles, the water crossing, filled vessels and reservoirs share WaterMaterial state (per instance): bending_allowed, renewable, amount/capacity, frozen. Ordinary placed water is bendable by default; scenery exceptions must explicitly disable bending. This does not infer interactive water from arbitrary background pixels: new water areas need an interactive body/shape placed with their artwork.

The training puddle holds two provisional units and can be emptied/refilled; the test pools and crossing are explicitly renewable. Frozen water cannot be drawn or topped up. Freeze/Thaw now also works on pools and stored water, while empty containers cannot freeze. Freeze is Katara-specific and cannot accidentally extinguish fire through the water reaction. Stored quantities survive freezing; draining the thawed reservoir still closes the gate.

The crossing supplies water from its reachable shoreline, rather than trying to path a water effect into a blocked liquid collider. Frozen crossing/platform safety still inspects every party group. Frozen pool/puddle surfaces also refuse thaw while overlapped by a party member; container ice has no walkable platform. Pools and containers keep their existing collision behavior.

water_material_tests.gd: 40 checks covering quantity conservation, independent state, pool/container/crossing freeze rules, opt-out permissions, active water collection from the crossing, and thaw safety.

## Sandbox drawing order

Terrain, water/ice surfaces, puddles, lowered stone and rock ground patches use floor depth (z=0). The world and Characters container enable Y sorting. Characters, upright containers/flames, crates/switches, raised stone and air blocks share upright depth (z=1), sorting by their world base position rather than creation order. Characters south of an upright prop draw in front; characters north can be correctly occluded. Rock ground patches remain on the floor while its raised body sorts independently. Bending effects remain above this at z=4; interface remains in its CanvasLayer. Collision, navigation, and thaw rules are independent of drawing order.

Visual regression review: party across frozen crossing, character in front of raised rock, character behind raised rock, character on lowered stone. Keep the sprite origin at its ground contact/base when replacing placeholder art.

## Terrain jump prototype

Sandbox actors now track ground_height and world_height separately from their flat map position. Space uses a vertical arc with live directional control, sweeping the actual character shape and ignoring only terrain below the current height. Landing records the designated surface height; standing and walking on a low ledge retain it, and jumping down returns to ground level. Crates/walls remain solid at every jump height; containers/fire pits cannot be landing supports. Only TerrainSurface nodes define elevations.

The small low ledge uses elevation 16, the unreachable test ledge 40; ordinary jump height remains the provisional 18. These values demonstrate capability boundaries, not final progression. The whole character visual (sprite, labels, equipped weapon) moves together with height. Shadow stays on its support plane. Walking cannot automatically climb or fall off a ledge. Invalid or interrupted jumps return to their takeoff terrain.

Followers replay the same physical jump at its breadcrumb launch point. They can bunch up if the leader stops at the landing; keep walking on the ledge to reform the line. Leader/group rotation, splits and recall wait for current jumps to finish; inventory still pauses the jump. After landing, Tab transfers height with the physical formation slots.

This is a sandbox prototype, not a migration of original world.tscn or the base character controller. The ordinary recall grid treats elevated surfaces as blocked and does not plan jumps; return by manually controlling the group when a ledge separates groups. Overlapping bridges, ramps, falling, cross-elevation bending/attacks, and character-specific high jump/glide remain future work.

Verification: jump_tests.gd (22 checks), full_party_jump_tests.gd (all five reach the ledge), existing party/melee (43), freeze/water (27), and quickslot/equipment (15) checks; Godot-rendered takeoff, airborne, standing and descended frames.

## Foot anchors and blocked jumping

All sandbox characters now use a radius-5 foot collider centered at the actor origin, and visible idle height 24. Each SpriteFrames texture is aligned by its nontransparent bounds so its visible bottom/center lands on that same foot origin. Alignment updates with every frame and animation change, independently of height. The source PNGs and original character controller are not edited. This removes differing transparent-padding offsets between Katara, Sokka and their jump sheets. The other three characters still use tinted Sokka placeholders.

The earlier fixed takeoff/travel phases have been replaced by live movement input throughout the vertical arc. This permits jumping onto the low ledge from a flush walking approach. If forward landing or travel is impossible, Space performs an in-place hop rather than doing nothing. The hop never bypasses props or grants terrain height. Followers hop in place with the leader without consuming route distance; actual traversal jumps are replayed at the breadcrumb launch point and never silently converted into hops. Existing airborne followers are not restarted by a new party hop.

foot_alignment_tests.gd checks the collider and all 52 animation frames for each of five characters (260 frame placements), flush ledge traversal by the full party, in-place hop route conservation, and hopping while movement is held against a real crate. Together with jump_tests.gd (23), ordinary party/melee tests (43) and UI/equipment tests (26), 117 checks passed. Godot visual review includes foot-collider overlay, flush takeoff, elevated landing and blocked hop.

## Live directional air control

Space starts a vertical jump, with no preselected horizontal destination or guaranteed travel distance. Hold WASD/arrows to travel at ordinary movement speed while airborne; release to stop horizontal motion, change direction to steer, or jump with no input to hop in place. Diagonal input is normalized. Collision holds horizontal movement at walls, props, and ledges above the current height while allowing the vertical hop to continue. Descending characters land on the actual designated terrain under their feet; jumping down can take longer than a same-height hop. Diagonal movement uses a cardinal jump-pose fallback where source art has no diagonal jump frames.

The leader records positions, heights and traveled path distance throughout each jump. Followers wait for a completed trace and replay that exact curve with collision checks; they do not infer a fixed leap from its starting direction. Completed traces are discarded once everyone has replayed them. A stationary hop is echoed by followers in place after the leader's trace is ready, without changing breadcrumb distance.

This supersedes earlier fixed-distance jump instructions and tests. air_control_tests.gd covers release, holding duration, steering, reversing, diagonal speed/pose, pause, barriers, ledge ascent/descent, curved follower replay, and all-five ledge traversal. Earlier terrain/foot tests now explicitly hold movement when travel is intended.
