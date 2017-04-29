defmodule Grains do
  @out_of_bounds { :error, "The requested square must be between 1 and 64 (inclusive)" }

  @doc """
  Calculate two to the power of the input minus one.
  """
  @spec square(pos_integer) :: pos_integer
  def square(number) do
    cond do
      1 <= number and number <= 64 -> { :ok, trunc(:math.pow(2, number - 1)) }
      true -> @out_of_bounds
    end
  end

  @doc """
  Adds square of each number from 1 to 64.
  """
  @spec total :: pos_integer
  def total do
    {:ok, 1..64
      |> Enum.map(fn(number) -> square(number) end)
      |> Enum.map(fn({_status, n}) -> n end)
      |> Enum.reduce(fn(x, acc) -> acc + x end)}
  end
end
