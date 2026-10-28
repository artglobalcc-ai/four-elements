# Decisions, Conflicts, and Questions

This note distinguishes previously discussed decisions from unresolved implementation questions. **Do not silently overwrite older wording or infer that a source example is an approved rule.** The two full guides are preserved under `99_Original_Documents`.

## Later design decisions to apply when reading older passages

- **Combat:** Separate, compact tactical battlefield reflecting nearby terrain. Click a reachable destination to move within a limited movement allowance; one primary action per character turn. Death Howl is the primary spatial reference; Prisoner of Azkaban is a presentation reference; Darkest Dungeon supplies statistical/tactical depth. The exact grid and movement splitting remain to be evaluated.
- **Combat elevation:** Usually one navigable plane. Temporary Airborne, Elevated, Burrowed, or Submerged technique states with counters and movement/action tradeoffs; no permanent high-ground immunity. Exploration retains multi-layer traversal.
- **Combat loadout:** Four initially equipped combat moves, expanding to eight, **not twelve**. Exploration hotbar is separate. Mid-battle technique changes cost a turn; inventory item actions and eligible equipped quick-use items need differentiated rules.
- **Combat initiative:** Ambush affects opening advantage; later turn order is Speed plus randomness, not purely random.
- **Combat resource:** Stamina Points (SP) for benders and nonbenders; separate regenerating exploration concentration. Running does not cost combat SP.
- **Party encounters:** Ordinary encounters involve physically present characters, including solo fights; major authored encounters can specify regrouping.
- **Progression:** Seven disciplines (Precision, Area Control, Defense, Manipulation, Transformation, Mobility, Support) level 1–10; level 5 cap until end of Book 1. Automatic core stat growth; techniques unlock through story/training; no individual technique XP bars. Advanced Arts are character-specific.
- **Saving and defeat:** Manual/checkpoint saves outside combat; resume-only in-battle saves persist RNG state. Ordinary defeat returns to a suitable checkpoint/campsite with a moderate penalty; KO is not death.
- **Appa campsite:** Outdoor, portable, customizable camp at eligible landing sites; persistent tent interior and storage; variable terrain and overflow sidebar; story-dependent availability.
- **Project governance:** Codex audits the existing Godot project and proposes alternatives before major architectural changes; preserve working systems.

## Open technical and balance questions

1. Visible square grid versus invisible grid/free movement with pathfinding.
2. Whether movement can be split around an action, or only used once in one continuous movement.
3. Battlefield derivation from overworld: contextual extraction, templates, or a hybrid.
4. How cover, environmental object persistence, enemy intents, and movement costs interact.
5. Exact rules for temporary elevation states, counters, descending, and multi-turn attacks.
6. Performance and pathfinding for changing terrain, without full multi-level combat navigation.

## Specific older-guide conflicts to check

- Technical Guide contains legacy **twelve move slots** and **randomized initiative** language. Treat these as superseded by later decisions above.
- Technical Guide's earlier stationary/formation combat assumptions are superseded by compact spatial tactical combat.
- Inspiration Guide includes older synthesis wording that underemphasizes Death Howl; use the grouped combat notes and later decisions for current intent.
- Some example techniques and prospective features in the source guides are illustrative rather than approved requirements.

## Source integrity

Every source-page excerpt in the feature notes is copied verbatim from the revised Markdown files. Because topics overlap, the same source page may appear in multiple feature notes. The full original revised Markdown and PDF files are preserved for comparison. Embedded screenshots were copied from the existing extracted image set; no image relinking is required for those images.
