defmodule Problem24 do
  @moduledoc """
  Solution to Project Euler Problem 24:
  > A permutation is an ordered arrangement of objects. For example, 3124 is
  > one possible permutation of the digits 1, 2, 3 and 4. If all of the
  > permutations are listed numerically or alphabetically, we call it lexicographic
  > order.  
  > The lexicographic permutations of 0, 1 and 2 are:
  >
  >> 012   021   102   120   201   210
  >
  > What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?
  """

  @doc """
  Finds the nth lexicographic permutation of the given digits.
  
  ## Examples

      iex> Problem24.solution([0, 1, 2], 4)
      "120"
  """
  @spec solution(list(integer), pos_integer) :: pos_integer
  def solution(digits \\ [0, 1, 2, 3, 4, 5, 6, 7, 8, 9], n \\ 1_000_000) do
    Enum.map(digits, &Integer.to_string/1)
    |> ListUtils.permutations()
    |> Enum.map(&List.to_string/1)
    |> Enum.sort()
    |> Enum.at(n - 1)
  end
end
