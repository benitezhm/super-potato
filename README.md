# SuperPotato

![Tests Passed](https://github.com/benitezhm/super-potato/actions/workflows/elixir.yml/badge.svg)

<img src="https://github.com/benitezhm/super-potato/blob/master/logo.jpg?raw=true" width="120" height="100">

> This is a library for NASA to get to know how much fuel is required for a specified trip to space.

## Installation

This package is not yet available in Hex, however, the package can be installed
by adding `super_potato` to your list of dependencies in `mix.exs` like this:

```elixir
def deps do
  [
    {:super_potato, git: "https://github.com/benitezhm/super-potato.git", branch: "master"}
  ]
end
```

Also you can run it by yourself with:

```bash
mix do deps.get, deps.compile && iex -S mix
```

and once in IEx console you can do:

```elixir
> SuperPotato.calculate_required_fuel(28_801, [{:launch, 9.807}, {:land, 1.62}, {:launch, 1.62}, {:land, 9.807}])
> 51898
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc) with the command `mix docs` and then can be accessed in file:///[path_to_your_local_copy]/super_potato/doc/SuperPotato.html.

## Test

You can run the tests with `mix test` also you can generate the coverage report with `mix excoveralls.html` and check the report in file:///[path_to_your_local_copy]/super_potato/cover/excoveralls.html

The coverall artifact report is also available for 5 days in [github actions](https://github.com/benitezhm/super-potato/actions).