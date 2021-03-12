defmodule Problem1 do
  @moduledoc """
  Solution for Project Euler problem 1:
  > If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9.
  > The sum of these multiples is 23.
  > Find the sum of all the multiples of 3 or 5 below 1000.
  """

  @doc """
    Finds the sum of all numbers divisble by 3 or 5 from 1
    to `max`.

    ## Examples

        iex> Problem1.solution(10)
        23
  """
  @spec solution(pos_integer) :: integer
  def solution(max \\ 1000) do
    Enum.filter(3..(max - 1), &(rem(&1, 3) == 0 || rem(&1, 5) == 0))
    |> Enum.reduce(fn x, acc -> acc + x end)
  end
end
