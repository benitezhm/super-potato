defmodule SuperPotatoTest do
  use ExUnit.Case
  doctest SuperPotato

  describe "Test SuperPotato module" do
    test "fuel required for Apollo 11 to land on earth" do
      required_fuel =
        SuperPotato.calculate_required_fuel(28_801, [%{action: :land, gravity: 9.807}])

      # to land on earth
      assert required_fuel == 13_447
    end

    test "fuel required for Apollo 11 to do a round trip to the moon" do
      required_fuel =
        SuperPotato.calculate_required_fuel(28_801, [
          %{action: :launch, gravity: 9.807},
          %{action: :land, gravity: 1.62},
          %{action: :launch, gravity: 1.62},
          %{action: :land, gravity: 9.807}
        ])

      # round trip to the moon
      assert required_fuel == 51_898
    end

    test "fuel required for mission on mars" do
      required_fuel =
        SuperPotato.calculate_required_fuel(14606, [
          %{action: :launch, gravity: 9.807},
          %{action: :land, gravity: 3.711},
          %{action: :launch, gravity: 3.711},
          %{action: :land, gravity: 9.807}
        ])

      # round trip to the moon
      assert required_fuel == 33_388
    end

    test "fuel required for passengers ship" do
      required_fuel =
        SuperPotato.calculate_required_fuel(75432, [
          %{action: :launch, gravity: 9.807},
          %{action: :land, gravity: 1.62},
          %{action: :launch, gravity: 1.62},
          %{action: :land, gravity: 3.711},
          %{action: :launch, gravity: 3.711},
          %{action: :land, gravity: 9.807}
        ])

      # round trip to the moon
      assert required_fuel == 212_161
    end
  end
end
