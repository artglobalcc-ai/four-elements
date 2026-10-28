# Katara water-bending milestone

## Play

Open testing_ground.tscn and Run Current Scene (F6), using Godot 4.7.2.
Select Katara with Tab within her group; press 1 to select Water Manipulation.
Click the blue pool northwest of the starting formation. A simple animated blue water sphere is collected.
Walk with WASD and aim with the mouse to steer it within a 96-unit control radius.
Click the empty reservoir northeast of the start to deliver water and open the north-pocket gate.
Collect more water, then click the fire southeast of the start to extinguish it.
Walk closer when a source/target is outside range. Right-click drops held water with a splash.

Concentration lasts 45 seconds per collected sphere. It continues while Katara is inactive, including
in another group. Tab slot rotation retains her owned effect. Inventory pauses world movement,
concentration, water motion and all blue animation. Repeated clicks do not refill concentration.
A release has travel time and applies its reaction once on arrival; it cannot remotely activate a target.
Existing Sokka club controls remain available when Sokka is selected.

## Implementation boundaries

- TechniqueDefinition: identity, allowed characters, utility/property tags, range, speed, concentration.
- ReactionProfile: accepted utility, required material property, minimum strength and reaction result.
- EnvironmentTarget: reusable source/reservoir/fire state with state-change signals.
- WaterController: one held element, steering, collision, release and blue presentation.
- Reservoir signal opens a gate and updates physical collision and navigation.
- Animation uses Godot drawing primitives: blue sphere, orbiting droplets, ripples and splash.
  It needs no generated texture files and can later be replaced by approved artwork.

The renewable pool is intentionally inexhaustible for testing. Pool and reservoir visuals are nonblocking
interaction targets, not swimming/traversal surfaces. Freeze, projectiles, stronger attacks, combat, save/load,
vertical water movement and permanent puddles are not implemented in this milestone.
Object states persist for this running session only. Restarting the scene resets them.
Navigation uses the sandbox's flat grid with swept checks against walls/crates. Tab's intentional slot swap
moves the owned effect with Katara; normal water steering does not teleport through solids.
Out-of-range or incompatible reactions retain water. Cursor targets clamp to the moving control circle; reaching its edge never cancels concentration. If solids block the element, it stops rather than bypassing the wall.
All capacities/timings except the approved timer example are provisional tuning values, not final progression.

## Verification

- water_tests.gd: 43 checks, zero failures (headless Godot 4.7.2).
- tests.gd: 43 party/inventory/weapon regression checks, zero failures.
- Rendered game viewport frames inspected for carrying, delivery, gate opening and extinguished fire.
- Original prototype main scene, project settings and existing gameplay/UI scripts remain unchanged.

Run checks:

    Godot --headless --path <project> --script res://sandboxes/party_foundation/water_tests.gd
    Godot --headless --path <project> --script res://sandboxes/party_foundation/tests.gd

## Next proposed milestone

Refine the UI structure/feedback with a small representative set of actions before expanding the move catalog.
Freeze should be a distinct material-state technique that alters traversal. Stronger Water Blast should use
force thresholds on compatible object profiles, informed by character/discipline progression, not move XP bars.
No final ice duration, progression formula, move costs or save rules have been silently selected.

Revision: clear-space aiming updates every physics frame with eased motion. Filled reservoirs and vessels hold one recoverable unit; drawing removes it. Water can be transferred to the second vessel or used on the fire. The reservoir gate closes again after draining, restoring collision and navigation blocking.

Latest controls: move 1 is active by default and combines collection, placement and shooting. Move 2 toggles Freeze/Thaw on the marked western crossing. Thaw is blocked while any party member overlaps that surface. Earlier instructions requiring a separate water-shot selection are superseded.

Environmental-water update: all sandbox pools, puddles, the crossing and filled containers share water material state. Freeze/Thaw affects any of these wet bodies; empty containers and explicitly nonbendable water refuse it. The crossing can now supply water from its shoreline. Finite puddles can be emptied and refilled. Water visuals alone are not automatically converted into game objects; world builders place interactive water shapes with artwork.
