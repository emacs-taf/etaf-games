# ETAF games

Native Emacs games built with ETAF and GameKit. Each game is an independent
application repository with its own entry, rules configuration, resources,
interface, tests and documentation. This workspace owns their common development
contract and integration commands, not their implementations.

## Applications

| Repository | Game | Backend |
| --- | --- | --- |
| `etaf-solitaire` | Verdant: K+ Klondike solitaire | OpenSpiel |
| `etaf-salvage` | Salvage Station: real-time exploration and extraction | Godot |
| `etaf-xiangqi` | Chu He: xiangqi (Chinese chess) hot-seat | OpenSpiel |
| `etaf-tanks` | Iron Tide: real-time tank battle | Godot |

Game applications live here, not inside `etaf-gamekit/examples/`. GameKit stays
an independent framework for definitions, running instances, actions,
observations, backend adapters and lifetime management. Requiring it does not
load or launch a game.

## Requirements and use

Use Emacs 29.1+ with [etaf-gamekit](https://github.com/emacs-taf/etaf-gamekit),
`etaf` and `etaf-ui` and their dependencies.
In an emacs-taf checkout, the framework repositories are siblings of this
workspace; games are children of this directory. Install only the native backend
needed by the game. Each game's README owns its installation and launch example.

Both light and dark presentation, fixed game-element geometry, responsive
surrounding UI and keyboard/mouse operation are part of the shared acceptance
contract. A backend's registered game name alone is not a complete application.

## Development checks

```sh
make check
make -C etaf-solitaire check
make -C etaf-salvage check
make -C etaf-xiangqi check
make -C etaf-tanks check
```

Game correctness scenarios, GUI acceptance and performance workloads remain in
the game that owns them. The enclosing workspace provides the shared Lisp and
performance runners. Batch checks do not certify GUI appearance or input latency.

See the [game application contract](docs/architecture.zh-CN.md) for boundaries
and acceptance requirements. `workspace.json` lists maintained local repositories;
unpublished repositories have no remote integration revision.
