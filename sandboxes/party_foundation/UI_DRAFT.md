# Inventory revision: supplied element panels

Uses the user's existing inventory_water/standard/air/earth/fire PNGs without modifying them.
Katara/Sokka/Aang/Toph/Zuko select their corresponding skin while browsing with Tab.
The original prototype remains unchanged.

E opens inventory. Carry shows eight on-person storage slots; Pack opens a 3-row by 4-column backpack inset that grows into scrollable rows inside the existing artwork. Food/Gear/Other are optional backpack
filters on the right side. Six quick slots remain along the bottom. These capacities are provisional.

Click an item to pick it up: it leaves its old slot and follows the mouse. Click a destination to place,
merge or swap it. Right-click picks up half or places one. Held items persist through Tab and bag changes.
Place Sokka's club directly into the labeled Weapon slot to equip it. Click that slot to pick it back up.
Other equipment frames are presentation placeholders; they are not implemented equipment slots yet.

Personal-item ownership and equipment compatibility are enforced. Closing inventory returns a held item
to its owner; if no space exists, it stays open and retains the item. The entire world remains paused.

Verification: 26 UI/inventory checks, 43 water checks and 43 party/weapon checks pass.
Rendered base panel, backpack, held stack and equipped club frames inspected.
No commits or pushes performed.
