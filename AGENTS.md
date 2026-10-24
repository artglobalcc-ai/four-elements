# AGENTS.md — contributing to Four Elements

This file is for every contributor (human or agent) working in this repo.
Follow it and the game stays playable on `main`, always.

## The one rule

**`main` must always open and run in Godot 4.7.** If your change breaks
`main`, fixing it is your top priority.

## Glossary (30 seconds)

- **Repo** — this project on GitHub, plus your local copy of it.
- **Branch** — your own parallel copy of the code to work in safely.
- **`main`** — the shared, playable branch. Never edit it directly.
- **Commit** — a saved snapshot of your changes with a message.
- **Push** — send your commits to GitHub.
- **Pull Request (PR)** — a proposal: "please merge my branch into `main`".
- **Merge** — the act of joining your branch into `main` after review.

## Everyday workflow

Do these steps in order, every time you work.

### 1. Start fresh

```bash
git checkout main
git pull --rebase
git checkout -b yourname/short-description
# example: git checkout -b katara/fix-swim-speed
```

A good branch name is `who/what` — who you are, and what the branch does.

### 2. Make the change, then check what changed

```bash
git status --short
```

Read the list. Every file there should belong to your change. If you see
surprise files (exports, `.godot/`, OS files), stop and ask or clean up.

### 3. Stage and commit

Stage exactly the files for this change — never `git add -A` in this repo:

```bash
git add path/to/changed_scene.tscn path/to/changed_script.gd
git commit -m "Area: what changed and why"
```

Commit message format: `Area: short summary`, for example:

- `Movement: fix party follower teleport distance`
- `Inventory: add fish item icon`
- `World: block player from leaving southern tribe bounds`

Keep commits small — one idea per commit, so a bad one can be reverted.

### 4. Godot-specific checks before you push

Run these before every push:

- [ ] Project opens in Godot 4.7 with no new errors in the debugger.
- [ ] `world.tscn` (the main scene) still plays with F5.
- [ ] If you touched a `.tscn`, you also committed its `.gd` and `.uid` files.
- [ ] No `.godot/` contents, export files, or `.DS_Store` in `git status`.

If the editor regenerated `.import` files for art you didn't touch, that's
normal — commit them if `git status` shows them alongside your files.

### 5. Push and open a PR

```bash
git push -u origin yourname/short-description
gh pr create --fill
```

Or open the PR on GitHub in the browser. Write in the PR:

- **What** this changes (1–2 sentences).
- **How to test** — exactly what to click/play to verify it.
- **Screenshot or video** if anything visual changed.

### 6. Review and merge

- One approval from the other person is required before merging.
- Merge with **Squash and merge** so `main` history stays one line per PR.
- Delete the branch after merging (`gh pr merge --squash --delete-branch`).
- After merge, update your local copy:

```bash
git checkout main
git pull --rebase
git branch -d yourname/short-description
```

## Rules for agents

These apply whenever an AI coding agent makes changes here.

1. **Never commit or push without being asked.** Make the change, show the
   diff with `git status --short` and `git diff --stat`, and stop.
2. **Never touch `main` directly.** All work happens on a feature branch.
3. **One PR = one idea.** Don't bundle unrelated changes.
4. **Explain every PR like the reader is new to git.** Use the
   What / How to test format from step 5.
5. **Small diffs win.** If a change is getting big, split it or ask first.
6. **Don't rewrite history** (`rebase`, `amend`, `reset --hard`) on a branch
   someone else has pulled — ask before doing it.
7. **Don't fix CI by weakening checks** — fix the game code instead.
8. **Leave `.gitignore` alone** unless the task explicitly requires it.

## When things go wrong

| Symptom | What to do |
|---|---|
| `git status` shows files you didn't touch | Don't commit them. Ask the other person what they are. |
| Godot won't open after a pull | Delete `.godot/` locally (it regenerates) and reopen the project. Never commit `.godot/`. |
| Merge conflict in a `.tscn` | Don't hand-edit the conflict markers blindly. Open the scene in Godot, re-make the change on the latest `main`, and commit that. |
| Pushed to the wrong branch | Stop. Tell the other person before pushing anything else. |
| Broke `main` | Say so immediately, then fix forward or revert the PR. |

## Quick reference

```bash
git checkout main && git pull --rebase   # update
git checkout -b name/what                 # new branch
git status --short                        # what changed
git add <exact files>                     # stage
git commit -m "Area: summary"             # snapshot
git push -u origin name/what              # upload
gh pr create --fill                       # propose merge
gh pr merge --squash --delete-branch      # merge after review
```
