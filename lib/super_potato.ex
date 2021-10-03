defmodule SuperPotato do
  @moduledoc """
  This module will let you know how much fuel do you need for trip to space :)
  """

  @typedoc """
  A tuple representing the planet gravity
  """
  @type planet :: {directive :: :launch | :land, gravity :: float()}

  @doc """
  Calculate the quantity of fuel required for spaceship trip.

  ## Examples

      iex> SuperPotato.calculate_required_fuel(28801, [{:land, 9.807}])
      13447

  """
  @spec calculate_required_fuel(initial_weight :: integer(), path :: list(planet())) :: integer()
  def calculate_required_fuel(initial_weight, path) do
    path
    |> List.foldr(0, fn target, fuel ->
      initial_fuel =
        (fuel + initial_weight)
        |> calculate_fuel(target)

      additional_fuel = calculate_additional_fuel(0, initial_fuel, target)

      fuel + initial_fuel + additional_fuel
    end)
  end

  # caculate the additional fuel required based on the additional weight added by the fuel
  defp calculate_additional_fuel(additional_fuel, weight, target) do
    calculate_fuel(weight, target)
    |> Kernel.trunc()
    |> case do
      fuel when fuel > 0 ->
        (additional_fuel + fuel)
        |> calculate_additional_fuel(fuel, target)

      _fuel ->
        additional_fuel
    end
  end

  defp calculate_fuel(weight, {:launch, gravity}) do
    Kernel.trunc(weight * gravity * 0.042 - 33)
  end

  defp calculate_fuel(weight, {:land, gravity}) do
    Kernel.trunc(weight * gravity * 0.033 - 42)
  end
end
