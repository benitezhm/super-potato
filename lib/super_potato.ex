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
    |> Enum.reduce(0, fn {_, gravity}, fuel ->
      initial_fuel =
        (initial_weight * gravity * 0.033 - 42)
        |> Kernel.trunc()

      additional_fuel = calculate_additional_fuel(0, initial_fuel, gravity)

      fuel + initial_fuel + additional_fuel
    end)
  end

  # caculate the additional fuel required based on the additional weight added by the fuel
  defp calculate_additional_fuel(additional_fuel, weight, gravity) do
    (weight * gravity * 0.033 - 42)
    |> Kernel.trunc()
    |> case do
      fuel when fuel > 0 ->
        calculate_additional_fuel(additional_fuel + fuel, fuel, gravity)

      _fuel ->
        additional_fuel
    end
  end
end
