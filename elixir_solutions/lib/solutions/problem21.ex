defmodule Problem21 do
  @moduledoc """
  Solution for Project Euler problem 21:
  > Let d(**n**) be defined as the sum of proper divisors of **n**
  > (numbers less than **n** which divide evenly into **n**).  
  > If d(**a**) = **b** and d(**b**) = **a**, where **a ≠ b**, then
  > **a** and **b** are an amicable pair and each of **a** and **b** are called amicable numbers.
  >
  > For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110;
  > therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.
  >
  > Evaluate the sum of all the amicable numbers under 10000.
  """

  @doc """
  Finds the sum of all the amicable numbers under `n`.
  """
  @spec solution(pos_integer) :: pos_integer
  def solution(n \\ 10_000) do
    m =
      Enum.reduce(1..n, Map.new(), fn x, acc ->
        Map.put(acc, x, NumberUtils.proper_divisors(x) |> Enum.sum())
      end)

    Enum.filter(m, fn {k1, v1} ->
      Enum.any?(m, fn {k2, v2} -> k1 != k2 and k1 == v2 and k2 == v1 end)
    end)
    |> Enum.reduce([], fn x, acc ->
      {k, _} = x
      acc ++ [k]
    end)
    |> Enum.sum()
  end
end
