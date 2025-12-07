# SuperPotato

![Tests Passed](https://github.com/benitezhm/super-potato/actions/workflows/elixir.yml/badge.svg)

<img src="https://github.com/benitezhm/super-potato/blob/master/logo.jpg?raw=true" width="120" height="100">

> A fuel calculation library for space missions. Calculate the exact amount of fuel required for any flight path based on mass, gravity, and mission phases.

## Features

- 🚀 Calculate fuel requirements for launch and landing maneuvers
- 🌍 Support for any planetary body (Earth, Moon, Mars, or custom gravity values)
- 📊 Accurate multi-step mission planning (round trips, multi-planet journeys)
- ⚡ Simple, flexible API

## Installation

This package is not yet available in Hex. Install by adding `super_potato` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:super_potato, git: "https://github.com/benitezhm/super-potato.git", branch: "master"}
  ]
end
```

Then run:
```bash
mix deps.get
```

## Usage

### Basic Example

```elixir
# Calculate fuel for landing on Earth
SuperPotato.calculate_required_fuel(28_801, [
  %{action: :land, gravity: 9.807}
])
# => 13_447
```

### Common Gravity Values

| Body    | Gravity (m/s²) |
|---------|----------------|
| Earth   | 9.807          |
| Moon    | 1.62           |
| Mars    | 3.721          |
| Venus   | 8.87           |
| Jupiter | 24.79          |
| Saturn  | 10.44          |

### Multi-Planet Mission

```elixir
# Mars mission
SuperPotato.calculate_required_fuel(14_606, [
  %{action: :launch, gravity: 9.807},   # Launch from Earth
  %{action: :land, gravity: 3.721},     # Land on Mars
  %{action: :launch, gravity: 3.721},   # Launch from Mars
  %{action: :land, gravity: 9.807}      # Return to Earth
])
# => 33_388
```

### Custom Gravity

```elixir
# Mission to a fictional planet
SuperPotato.calculate_required_fuel(10_000, [
  %{action: :launch, gravity: 9.807},   # Launch from Earth
  %{action: :land, gravity: 15.5},      # Land on high-gravity planet
  %{action: :launch, gravity: 15. 5},    # Launch from high-gravity planet
  %{action: :land, gravity: 9. 807}      # Return to Earth
])
```

## API Reference

### `calculate_required_fuel/2`

Calculates the fuel required (in kg) for a spaceship's flight path.

**Parameters:**
- `mass` (integer) - Initial ship mass in kg
- `flight_path` (list of maps) - List of flight steps, each containing:
  - `:action` - Either `:launch` or `:land`
  - `:gravity` - Gravitational acceleration in m/s²

**Returns:** Required fuel mass in kg (integer)

## Development

### Running Locally

Clone the repository and start an interactive session:

```bash
git clone https://github.com/benitezhm/super-potato.git
cd super-potato
mix do deps.get, deps.compile
iex -S mix
```

### Running Tests

```bash
# Run all tests
mix test

# Run with coverage
mix test --cover

# Generate HTML coverage report
mix coveralls.html
```

View the coverage report at `cover/excoveralls.html`

Coverage reports are also available as artifacts in [GitHub Actions](https://github.com/benitezhm/super-potato/actions) (retained for 5 days).

### Generating Documentation

```bash
mix docs
```

View the documentation at `doc/index.html`

## Examples

### Apollo 11 Moon Landing
```elixir
SuperPotato.calculate_required_fuel(28_801, [
  %{action: :launch, gravity: 9.807},
  %{action: :land, gravity: 1.62},
  %{action: :launch, gravity: 1.62},
  %{action: :land, gravity: 9.807}
])
# => 51_898
```

### Passenger Ship Multi-Planet Journey
```elixir
SuperPotato.calculate_required_fuel(75_432, [
  %{action: :launch, gravity: 9.807},  # Earth
  %{action: :land, gravity: 1.62},     # Moon
  %{action: :launch, gravity: 1. 62},   # Moon
  %{action: :land, gravity: 3.721},    # Mars
  %{action: :launch, gravity: 3.721},  # Mars
  %{action: :land, gravity: 9.807}     # Earth
])
# => 212_161
```

## Contributing
Contributions are welcome! Please feel free to submit a Pull Request. 

## License
MIT

## Credits
Built with ❤️ for space exploration
