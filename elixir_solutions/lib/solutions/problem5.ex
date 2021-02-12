defmodule Problem5 do
  @moduledoc """
  Solution for Project Euler Problem 5:
  > 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
  > What is the smallest positive number that is *evenly divisible* by all of the numbers from 1 to 20?"
  """

  @doc """
  Finds the least common denominator of all numbers from 1 to `max`

  ## Examples

      iex> Problem5.solution(10)
      2520
  """
  @spec solution(pos_integer()) :: pos_integer()
  def solution(max \\ 20)

  def solution(max) do
    Enum.reduce(1..max, [], fn x, acc ->
      acc ++ [PrimeNumbers.prime_factorization(x)]
    end)
    |> List.flatten()
    |> Enum.reduce(Map.new(), fn x, acc ->
      {val, mult} = x
      Map.update(acc, val, mult, &max(&1, mult))
    end)
    |> Map.to_list()
    # |> IO.inspect(label: "Factor List")
    |> Enum.reduce(1, fn x, acc ->
      {val, mult} = x
      acc * round(:math.pow(val, mult))
      # |> IO.inspect( label: "Current Value")
    end)
  end
end
