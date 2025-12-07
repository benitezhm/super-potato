# Changelog
<!-- next-header -->

## [Unreleased] - ReleaseDate
### Changed
* **BREAKING**: `SuperPotato.calculate_required_fuel/2` now accepts a list of maps as the second argument (flight path) instead of a list of tuples. Each map must contain `:action` (either `:launch` or `:land`) and `:gravity` (gravitational acceleration in m/s²).  This change improves code readability and maintainability.

  **Before:**
  ```elixir
  SuperPotato.calculate_required_fuel(mass, [{:launch, 9.807}, {:land, 1.62}])
  ```
  
  **Now:**
  ```elixir
  SuperPotato.calculate_required_fuel(1000, [
    %{action: :launch, gravity: 9.807},
    %{action: :land, gravity: 1.62}
  ])
  ```
  
### Dependencies
#### Upgraded:
  * bunt 0.2.0 => 1.0.0 (major)
  * credo 1.5.6 => 1.7.14
  * earmark_parser 1.4.15 => 1.4.44
  * ex_doc 0.25.3 => 0.39.2 (minor)
  * excoveralls 0.14.3 => 0.18.5 (minor)
  * file_system 0.2.10 => 1.1.1 (major)
  * jason 1.2.2 => 1.4.4
  * makeup 1.0.5 => 1.2.1
  * makeup_elixir 0.15.1 => 1.0.1 (major)
  * makeup_erlang 0.1.1 => 1.0.2 (major)
  * nimble_parsec 1.1.0 => 1.4.2
#### New:
  *  version_release 0.5.3
  * dialyxir 1.4.7
  * erlex 0.2.8
    
<!-- next-url -->
[Unreleased]: https://github.com/benitezhm/super-potato/compare/master...HEAD
