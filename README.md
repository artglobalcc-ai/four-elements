# Four Elements 🜁🜂🜃🜄

A 2D Godot 4 game project. Clone, open in Godot, and play.

## Requirements

- [Godot 4.7](https://godotengine.org/download) (GL Compatibility renderer)
- Git + [GitHub CLI (`gh`)](https://cli.github.com) (optional, for contributing)

## Quick start

```bash
git clone https://github.com/artglobalcc-ai/four-elements.git
cd four-elements
# Open project.godot in Godot 4.7 and press F5
```

The project opens at `world.tscn` (Main scene: `uid://ds3avok3aj5hc`).

## Project layout

| Path | What lives there |
|---|---|
| `project.godot`, `world.tscn` | Project config + main scene |
| `movement scripts/` | Player / party controllers |
| `Items/` | Item data + item scene resources |
| `UI/` | Inventory + menu UI |
| `assets/` | Characters, environments, item images |
| `concept art/`, `katara misc/` | Reference art, not used in-game |

> Folder names with spaces (`movement scripts`, `concept art`, `katara misc`)
> are inherited history. New folders should use `snake_case`.

## Working together

- `main` is the playable branch — keep it green.
- Branch per change: `git checkout -b yourname/short-description`.
- Commit scenes/scripts together (`*.tscn` + its `*.gd` + `*.uid` files).
- Pull latest before you start: `git pull --rebase`.
- Open a Pull Request to merge; one review from the other person.

### Godot + Git tips

- Never commit `.godot/` — it regenerates on open (already in `.gitignore`).
- Keep `.import` files committed — they're needed for correct reimport.
- PSDs and raw art live in the repo for now; don't add new multi-MB
  binaries without asking — large assets may move to Git LFS later.

## License

TBD — decide with your collaborator before sharing outside the repo.
