# AGENTS.md — Four Elements contributor and Codex instructions

This file governs human and AI contributions to the Four Elements Godot project. Its priorities are: preserve a playable project, respect approved game design, and make small, testable changes.

## Non-negotiable rules

1. **`main` must remain playable in the project's currently approved Godot version.** The project has been developed with Godot 4.7.x; verify the exact version in use before changing project settings or upgrading. Do not silently migrate engine versions.
2. **Never edit `main` directly.** Work on a feature branch. If the current checkout has uncommitted work, do not switch branches or discard changes without permission.
3. **AI agents must not commit, push, open or merge a PR unless explicitly asked.** Implement only the authorized scope, run appropriate checks, show the diff and report results, then stop.
4. **Inspect before changing.** Read relevant scenes, scripts, resources, and documentation; preserve working systems and existing user work.
5. **Approved design decisions outrank examples and inspiration.** Do not invent or silently finalize unresolved gameplay mechanics.

## Where to find the design

The repository may contain a `docs/` directory of Markdown notes organized by feature for Obsidian. Obsidian is an editor for those files, not a dependency of the game.

At the beginning of a task:

1. Locate the documentation index (for example, `docs/START_HERE.md`) and relevant feature notes. Paths are illustrative: inspect the repository rather than assuming a folder exists.
2. Check the current approved decisions and change log, if present.
3. Read the relevant Technical Guide and Inspiration Guide passages, including image captions when the task involves presentation or visual design.
4. Inspect the actual Godot implementation and identify differences between documented intent and current behavior.
5. Summarize the intended change, affected files, risks, and verification plan before significant architectural work.

### Document interpretation

- **Approved decisions:** requirements to implement unless the user changes them.
- **Proposals or examples:** design possibilities, not automatic requirements.
- **Unresolved questions:** ask before choosing an option with major gameplay or architectural consequences.
- **Visual references:** guidance about presentation, interaction, and feel; do not copy another game's proprietary assets, code, maps, or exact UI.
- **Historical or archived guides:** preserve for provenance, but do not let superseded wording override newer explicit decisions.

If two active documents disagree, do not silently pick one. Report the conflict and the likely implications; ask the user which rule is authoritative. If a source's status is unclear, treat it as unresolved. Do not replace substantial design detail with a summary unless specifically asked.

## Current design guardrails

These reflect decisions made during design discussions and should be checked against the latest approved notes before implementation:

- **Story:** faithful to the original *Avatar: The Last Airbender* Books 1–3, including character growth, humor, emotional nuance, and story-driven party availability.
- **Exploration:** top-down pixel-art world with meaningful layered elevation, character-specific traversal, environmental bending, and breadcrumb-style party following. Preserve the working Godot prototype.
- **Combat:** separate, compact tactical encounters inspired by Death Howl's positioning and click-to-move movement; one ordinary movement allowance and one primary action per character turn, subject to explicitly defined technique exceptions. Battlefield environments can include water, earth, trees, cover, hazards, and persistent changes.
- **Combat elevation:** generally a single navigable combat plane. Airborne, Elevated, Burrowed, Submerged, and similar vertical effects are temporary technique states with counters and tradeoffs, not permanent safe high-ground platforms. Exploration elevation is a separate concern.
- **Combat presentation:** Prisoner of Azkaban (GBA) informs portraits, turn-order readability, and character-specific presentation; Darkest Dungeon informs statistical and tactical depth; Pokémon informs equipped techniques and some multi-turn move concepts; Baldur's Gate 3 informs environmental combinations. These are distinct influences, not instructions to reproduce another game.
- **Combat loadout:** four equipped combat techniques initially, expanding to eight. Exploration hotbar and combat loadout are separate. Unified combat Stamina Points (SP) apply to benders and nonbenders; exploration concentration is separate.
- **Party encounters:** routine battles include only physically present characters; authored story encounters may specify exceptions.
- **Progression:** seven disciplines—Precision, Area Control, Defense, Manipulation, Transformation, Mobility, Support—with story/training technique unlocks. Do not reintroduce individual-move XP bars or a twelve-slot combat loadout without approval.
- **Appa's camp:** customizable portable outdoor campsite with linked storage and a customizable tent interior, subject to story availability.

Unresolved implementation choices—such as visible versus hidden combat grid, splitting movement before and after an action, contextual battlefield construction, and navigation architecture—require evaluation and user approval before becoming foundational rules.

## Everyday Git workflow

### 1. Check the working tree

```bash
git status --short
git branch --show-current
```

If there are unexpected changes, stop and ask before switching branches, pulling, cleaning, or editing overlapping files. Do not discard or overwrite the user's uncommitted work.

### 2. Start a focused branch

For a clean, up-to-date working tree, a human contributor may run:

```bash
git switch main
git pull --ff-only
git switch -c name/short-description
```

Agents should not pull from the network, change branches, or create branches without considering the user's current work and task authorization. If a feature branch already exists, use it unless directed otherwise.

### 3. Make a small change and inspect it

```bash
git status --short
git diff --check
git diff --stat
git diff
```

Do not bundle unrelated refactors. Do not use `git add -A` by default. Never overwrite unexpected edits to make a task easier.

### 4. Test in Godot

Before asking for a commit or PR:

- [ ] The project opens in the approved Godot version with no new parser, missing-resource, or scene-load errors.
- [ ] `world.tscn` (or the currently configured main scene) still runs, when relevant.
- [ ] Changed interactions are exercised in the editor or in-game.
- [ ] Resource paths, `.tres`, `.tscn`, sprites, scripts, and `.uid` dependencies are intact.
- [ ] Any tests or headless checks used are reported with their exact results and limitations.
- [ ] No unrelated `.godot/`, OS metadata, temporary exports, or generated cache files are staged.

Do not claim a Godot playtest passed if the editor or runtime was unavailable.

### 5. Commit, push, and PR — humans or explicitly authorized agents only

Stage only the relevant files:

```bash
git add path/to/changed_file.gd path/to/related_scene.tscn
git commit -m "Area: short summary"
git push -u origin name/short-description
gh pr create --fill
```

Use one focused idea per PR. Explain **What changed**, **How to test**, and any visual differences with screenshots or video when useful. Require the team's agreed review approval before merging. Squash merge when that is the team's chosen policy.

Agents stop after presenting the working-tree changes unless the user expressly authorizes later Git actions.

## Godot resource and folder safety

- Prefer moving scenes, scripts, textures, and resources through Godot's FileSystem dock so the editor can update tracked dependencies.
- Hardcoded `res://` strings in GDScript may still require manual repair after moves.
- Before renaming or relocating a folder, search for `load()`, `preload()`, `res://` references, and dependent `.tscn`/`.tres` files. Back up or commit a known-good state first.
- If a resource becomes missing, check whether its file was renamed or moved before changing code. Repair the path and re-test dependent scenes.
- **Do not delete `.godot/` as a routine troubleshooting step.** It is generated project data, but clearing it can complicate diagnosis. Consider a cache rebuild only after identifying the issue and obtaining approval when it could disrupt the user's environment.
- Commit tracked source assets and necessary Godot UID files as appropriate; do not automatically commit every adjacent `.gd`, `.uid`, or generated `.import` file.
- Do not edit `.gitignore` without explicit authorization.

## Architecture and scope approvals

Before replacing a working system, introducing a new foundational abstraction, migrating save formats, reorganizing project folders, or adding a large dependency:

1. Explain the problem with the existing approach.
2. Present feasible options and tradeoffs.
3. Recommend the smallest useful prototype.
4. Identify compatibility, save-data, and rollback risks.
5. Wait for user approval before implementation.

For combat specifically, prove movement, targeting, turn flow, environmental state, and enemy response in a small encounter before expanding the full move catalog or AI.

## When something goes wrong

| Symptom | First response |
|---|---|
| Unexpected files in `git status` | Do not stage, delete, or reset them. Ask what they are. |
| Godot reports a missing `res://` file | Locate the actual file; inspect recent moves/renames and update references. |
| Scene fails after pulling | Inspect parser errors, paths, UID references, and diffs before considering cache regeneration. |
| Merge conflict in `.tscn` or `.tres` | Preserve both versions; inspect dependencies and resolve carefully, preferably with Godot validation. |
| Agent discovers conflicting design rules | Document the conflict and ask; do not invent the answer. |
| Wrong branch was pushed | Stop and report immediately; do not force-push or rewrite shared history without approval. |
| `main` is broken | Report immediately and prioritize a reviewed fix or revert. |

## Definition of done

A task is done when its approved scope is implemented, relevant documentation is updated if needed, the affected functionality has been verified, the diff contains no unrelated changes, and the user has a concise report of what changed, what was tested, what remains uncertain, and whether any Git action was taken.

**Protect the playable game, preserve the design intent, and ask before making consequential decisions.**
