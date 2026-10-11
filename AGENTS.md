# Game application development

This workspace owns game applications, not the GameKit framework. Follow the
engineering and delivery policy in the enclosing emacs-taf workspace. Each game
is an independent Jujutsu/Git repository; commit changes in its owning repository.

## Start here

- Read README.md for maintained games and commands, then
  [the game application contract](docs/architecture.zh-CN.md).
- Read a game's root entry Commentary and its manual before changing it.
- GameKit stays in the sibling `etaf-gamekit` repository. Use its public entry
  for game definitions, actions, observations and instance lifetime. Games do
  not require its implementation modules or call Ebox directly.
- Discover missing shared capabilities in their owning provider: game runtime
  capabilities in GameKit, presentation components in etaf-ui, rendering and
  input capabilities exposed through ETAF. Never add a game's name, rules,
  launcher, assets or layout policy to framework core.
- Put game code in `./<game>/<game>.el` and `./<game>/lisp/`, with native rules,
  tests, benchmarks and documentation in that game's repository. Do not put
  maintained game applications under GameKit's examples directory.

## UI and validation

- Every game supports both light and dark themes. Neither is optional and
  replacing one with the other is not a theme fix. Validate both, including
  selected/hover/disabled states, dialogs, hints and game surfaces.
- Theme switching preserves the game instance, selection, focus, input and
  backend state. Reuse ETAF's reactive theme tokens; do not restart a game or
  recolor the user's Emacs frame.
- Preserve intrinsic card, tile, piece and sprite dimensions. Reflow surrounding
  UI rather than stretching the world. The contract defines the supported-size
  matrix, deliberate clipping below minimum size and appearance acceptance.
- Validate each game as a complete playable workflow through its real backend,
  keyboard and public activation paths, screenshots and latency. Pure rule tests
  do not establish application acceptance. Review screenshots separately from
  assertions; an unattractive or incomplete demonstration is not a finished UI.
- Use the enclosing workspace's `scripts/elisp.py` and `scripts/performance.py`.
  Keep each game's correctness inventory in tests/acceptance.json, GUI scenarios
  in scripts/, and performance scenarios in benchmarks/.
- Run each affected game's `make check`, then this workspace's `make check` on
  sealed, quiet trees. Failed or missing GUI/performance gates remain unverified.

## Providers and delivery

Providers normally live two directories above a game in the emacs-taf checkout;
a standalone game clone can keep them as siblings. Reuse the existing provider
resolution and check commands rather than requiring users to edit load-path
chains for development.

The workspace registry lists existing game repositories only. Add future games
when they have maintained files; do not create empty placeholder applications.
Record published integration revisions only after validation and delivery. A
local unpublished repository is not a remotely reproducible checkpoint.
