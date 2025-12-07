defmodule SuperPotato do
  @moduledoc """
  Calculates required fuel for a flight path.

  ## Parameters
    - `mass`: Initial mass in kg
    - `flight_path`: List of flight steps, each containing:
      - `:action` - Either `:launch` or `:land`
      - `:gravity` - Custom gravity value (m/s²)

  ## Examples

      iex> SuperPotato.calculate_required_fuel(1_000, [
      ...>   %{action: :launch, gravity: 9.807}
      ...> ])
      517
  """

  @typedoc """
  A map representing a single step in a flight path.

  ## Fields
    * `:action` - The maneuver type, either `:launch` or `:land`
    * `:gravity` - The gravitational acceleration in m/s² (must be a non-negative number)
  """
  @type flight_step :: %{
          action: :launch | :land,
          gravity: float()
        }

  @doc """
  Calculates the fuel required for a spaceship's flight path.

  ## Parameters
    * `mass` - Initial ship mass in kg
    * `flight_path` - List of flight steps, each with an action and gravity

  ## Returns
    The required fuel mass in kg.

  ## Examples

      iex> SuperPotato.calculate_required_fuel(28_801, [%{action: :land, gravity: 9.807}])
      13447

      iex> SuperPotato.calculate_required_fuel(28_801, [
      ...>   %{action: :launch, gravity: 9.807},
      ...>   %{action: :land, gravity: 1.62}
      ...> ])
      22380
  """
  @spec calculate_required_fuel(initial_weight :: non_neg_integer(), path :: list(flight_step())) ::
          integer()
  def calculate_required_fuel(initial_weight, path) do
    path
    |> List.foldr(0, fn maneuver, fuel ->
      initial_fuel =
        (fuel + initial_weight)
        |> calculate_fuel(maneuver)

      additional_fuel = calculate_additional_fuel(0, initial_fuel, maneuver)

      fuel + initial_fuel + additional_fuel
    end)
  end

  # calculate the additional fuel required based on the additional weight added by the fuel
  defp calculate_additional_fuel(additional_fuel, weight, maneuver) do
    calculate_fuel(weight, maneuver)
    |> Kernel.trunc()
    |> case do
      fuel when fuel > 0 ->
        (additional_fuel + fuel)
        |> calculate_additional_fuel(fuel, maneuver)

      _fuel ->
        additional_fuel
    end
  end

  defp calculate_fuel(weight, %{action: :launch, gravity: gravity}) do
    Kernel.trunc(weight * gravity * 0.042 - 33)
  end

  defp calculate_fuel(weight, %{action: :land, gravity: gravity}) do
    Kernel.trunc(weight * gravity * 0.033 - 42)
  end
end
