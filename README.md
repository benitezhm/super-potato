# SuperPotato

![Tests Passed](https://github.com/benitezhm/super-potato/actions/workflows/elixir.yml/badge.svg)


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

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc) with the command `mix docs` and then can be accessed in file:///[path_to_your_local_copy]/super_potato/doc/SuperPotato.html.

## Test

You can run the tests with `mix test` also you can generate the coverage report with `mix excoveralls.html` and check the report in file:///[path_to_your_local_copy]/super_potato/cover/excoveralls.html

The coverall artifact report is also available for 5 days in [github actions](https://github.com/benitezhm/super-potato/actions).