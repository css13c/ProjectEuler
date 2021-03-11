defmodule Problem23 do
  @moduledoc """
  Solution to Project Euler problem 23:
  > A perfect number is a number for which the sum of its proper divisors
  > is exactly equal to the number. For example, the sum of the proper divisors
  > of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.
  >
  > A number n is called deficient if the sum of its proper divisors is less than n
  > and it is called abundant if this sum exceeds n.
  >
  > As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest
  > number that can be written as the sum of two abundant numbers is 24. By
  > mathematical analysis, it can be shown that all integers greater than 28123 can
  > be written as the sum of two abundant numbers. However, this upper limit cannot
  > be reduced any further by analysis even though it is known that the greatest
  > number that cannot be expressed as the sum of two abundant numbers is less than this limit.
  >
  > Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.
  """

  @spec is_abundant(pos_integer) :: boolean
  defp is_abundant(n) do
    sum_of_divisors = NumberUtils.proper_divisors(n) |> Enum.sum
    sum_of_divisors > n
  end

  @spec all_abundant_sums(map, pos_integer, pos_integer, MapSet.t(pos_integer)) :: MapSet.t(pos_integer)
  defp all_abundant_sums(abundants, maxval, i \\ 0, j \\ 0, sums \\ MapSet.new())
  defp all_abundant_sums(abundants, maxval, i, j, sums) do
    if i > map_size(abundants) do
      sums
    else
      val = Map.get(abundants, i, maxval) + Map.get(abundants, j, maxval)
      if j > map_size(abundants) or val > maxval do
        all_abundant_sums(abundants, maxval, i + 1, 0, sums)
      else
        all_abundant_sums(abundants, maxval, i, j + 1, MapSet.put(sums, val))
      end
    end
  end

  @doc """
  Finds the sum of all positive integers which cannot be written as the sum of two abundant numbers.
  This has a natural limit of 28123.
  """
  @spec solution(pos_integer) :: pos_integer
  def solution(max \\ 28_123) do
    range = 1..max
    abundant = Enum.filter(range, &is_abundant/1)
    |> ListUtils.to_map()

    MapSet.difference(range |> MapSet.new(), all_abundant_sums(abundant, max))
    |> Enum.sum
  end
end
