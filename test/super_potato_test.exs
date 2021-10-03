defmodule SuperPotatoTest do
  use ExUnit.Case
  doctest SuperPotato

  describe "Test SuperPotato module" do
    test "fuel required for Apollo 11 to land on earth" do
      required_fuel = SuperPotato.calculate_required_fuel(28_801, [{:land, 9.807}])

      # to land on earth
      assert required_fuel == 13_447
    end

    test "fuel required for Apollo 11 to do a round trip to the moon" do
      required_fuel =
        SuperPotato.calculate_required_fuel(28_801, [
          {:launch, 9.807},
          {:land, 1.62},
          {:launch, 1.62},
          {:land, 9.807}
        ])

      # round trip to the moon
      assert required_fuel == 36_778
    end
  end
end
