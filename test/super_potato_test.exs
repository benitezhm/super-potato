defmodule SuperPotatoTest do
  use ExUnit.Case
  doctest SuperPotato

  test "greets the world" do
    assert SuperPotato.hello() == :world
  end
end
