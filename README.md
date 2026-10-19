# ETAF games (archived)

This repository is archived. The game application workspace it hosted was merged
into the single [emacs-taf](https://github.com/emacs-taf/emacs-taf) workspace,
where every repository — framework packages, applications and games — is one
sibling checkout registered in `workspace.json`.

- Sources: each game is its own repository under the `emacs-taf` organisation
  (`etaf-tanks`, `etaf-xiangqi`, `etaf-solitaire`, `etaf-salvage`).
- Development: clone the workspace root and follow its README. There is one
  checkout per repository, so no second workspace has to be kept in sync.
- Installation: `M-x etaf-install` from the package archive at
  <https://etaf.top/packages/>. GameKit ships with the archive; install the
  native backend the chosen game needs.
- The game application contract, the backend matrix and the shared acceptance
  gates moved to the workspace root repository (`README.md`,
  `docs/architecture.zh-CN.md`, `workspace.json`).

Git history here remains readable; nothing in it was rewritten.
