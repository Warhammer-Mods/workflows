# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog],
and this project adheres to [Semantic Versioning].

## [Unreleased]

## [2.0.2] - 2022-08-30

### Fixed

- Folders being included in glob matches
  - Folders are included by default in tj-actions/glob@v13

## [2.0.1] - 2022-08-26

Maintenance release.

## [2.0.0] - 2022-08-26

### Added

- Changelog.
- Packfile Build workflow:
  - Automatically build a `.pack` file on each commit.
  - Ready to use. Useful for quick testing and distribution.
  - Highlight incompatible `DB` and `LOC` TSV files.
    - Includes `rpfm_cli.json` problem matcher.

### Changed

- Lua Lint:
  - General optimizations.
- DB Check:
  - General optimizations.

## [1.0.11] - 2022-08-25

### Fixed

- Lua Lint:
  - Revert skipping `luarocks install` step if cache hit has occurred.
  - Passing wrong rockspec file to `luarocks install` step.

## [1.0.10] - 2022-08-01

### Changed

- Lua Lint:
  - Skip `luarocks install` step if cache hit has occurred.

## [1.0.9] - 2022-08-26

### Fixed

- Failing curl requests  
  Make `curl` requests more reliable by retrying up to 5 times.

## [1.0.8] - 2022-08-01

### Fixed

- Lua Lint:
  - Skip extracting globals from `luacheck`.

### Changed

- Bump default Lua version to `5.4`.

## [1.0.7] - 2022-08-01

### Added

- Lua Lint:
  - input: `debug_enabled`  
    type: `boolean`, default: `false`  
    Enables debug script logging.

### Changed

- Pass `update_lua_globals.sh` directly to shell, skipping saving to a file.

## [1.0.6] - 2022-07-28

### Fixed

- Problem matcher install in a workflow.

## [1.0.5] - 2022-07-27

### Fixed

- Fix syntax errors.

### Changed

- Bump `lua-globals` to v0.3.0

## [1.0.4] - 2022-04-09

Maintenance release.

## [1.0.3] - 2022-03-17

Maintenance release.

## [1.0.2] - 2021-11-22

### Fixed

- Add conditional check for rockspec install.

## [1.0.1] - 2021-11-22

### Fixed

- Minor syntax and conditional fixes.

## [1.0.0] - 2021-11-21

Initial release.

### Added

- Lua Lint workflow:
  - Automatically lint lua files with Luacheck.
  - Get PRs for updates to used Lua global variables.
- DB Check workflow:
  - Check extracted DB tables in TSV format for integrity.

<!-- Links -->
[keep a changelog]: https://keepachangelog.com/en/1.0.0/
[semantic versioning]: https://semver.org/spec/v2.0.0.html

<!-- Versions -->
[Unreleased]: https://github.com/Warhammer-Mods/workflows/compare/v2.0.2..HEAD
[2.0.2]: https://github.com/Warhammer-Mods/workflows/compare/v2.0.1..v2.0.2
[2.0.1]: https://github.com/Warhammer-Mods/workflows/compare/v2.0.0..v2.0.1
[2.0.0]: https://github.com/Warhammer-Mods/workflows/compare/v1.0.11..v2.0.0
[1.0.11]: https://github.com/Warhammer-Mods/workflows/compare/v1.0.10..v1.0.11
[1.0.10]: https://github.com/Warhammer-Mods/workflows/compare/v1.0.9..v1.0.10
[1.0.9]: https://github.com/Warhammer-Mods/workflows/compare/v1.0.8..v1.0.9
[1.0.8]: https://github.com/Warhammer-Mods/workflows/compare/v1.0.7..v1.0.8
[1.0.7]: https://github.com/Warhammer-Mods/workflows/compare/v1.0.6..v1.0.7
[1.0.6]: https://github.com/Warhammer-Mods/workflows/compare/v1.0.5..v1.0.6
[1.0.5]: https://github.com/Warhammer-Mods/workflows/compare/v1.0.4..v1.0.5
[1.0.4]: https://github.com/Warhammer-Mods/workflows/compare/v1.0.3..v1.0.4
[1.0.3]: https://github.com/Warhammer-Mods/workflows/compare/v1.0.2..v1.0.3
[1.0.2]: https://github.com/Warhammer-Mods/workflows/compare/v1.0.1..v1.0.2
[1.0.1]: https://github.com/Warhammer-Mods/workflows/compare/v1.0.0..v1.0.1
[1.0.0]: https://github.com/Warhammer-Mods/workflows/releases/tag/v1.0.0
