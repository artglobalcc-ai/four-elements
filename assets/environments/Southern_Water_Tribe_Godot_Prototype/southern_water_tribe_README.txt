FOUR ELEMENTS — SOUTHERN WATER TRIBE VILLAGE PROTOTYPE

This PNG is a static background cropped from the latest concept illustration.
It is NOT a tilemap. The people, buildings, and props are baked into the image.
It has no collision, depth sorting, or separate interactive objects.

Godot 4 setup:
1. Copy southern_water_tribe_village_prototype.png to res://assets/environments/southern_water_tribe/
2. Open world.tscn. Select World, add child Sprite2D and name it VillageBackground.
3. Assign PNG as its Texture. Set Centered = OFF. Set Position = (0, 0).
4. Move VillageBackground to be the first child of World, above Katara in the Scene tree.
5. Select Katara, set Position approximately (600, 675) near the southern entrance.
6. Save, then Run Current Scene (F6).

The illustration is 1154 x 855 pixels. It is a VISUAL TEST ONLY.
Do not add collision yet until the player scale and layout are approved.
The baked-in figure near the entrance may overlap with your playable Katara.
The next phase requires creating true separated sprites/tiles and collisions.
