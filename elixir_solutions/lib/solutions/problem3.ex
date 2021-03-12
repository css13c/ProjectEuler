defmodule Problem3 do
  @moduledoc """
  Solution for Project Euler problem 3:
  > What is the largest prime factor of the number 600851475143?
  """

  @spec uniqFactors(pos_integer, pos_integer, MapSet.t(pos_integer)) ::
          MapSet.t(pos_integer)
  defp uniqFactors(n, x \\ 2, set \\ MapSet.new())

  defp uniqFactors(n, _x, set) when n == 1 do
    set
  end

  defp uniqFactors(n, x, set) when n > 1 and x * x > n do
    MapSet.put(set, n)
  end

  defp uniqFactors(n, x, set) when x * x <= n and rem(n, x) == 0 do
    uniqFactors(div(n, x), x, MapSet.put(set, x))
  end

  defp uniqFactors(n, x, set) when x * x <= n and rem(n, x) != 0 do
    uniqFactors(n, x + 1, set)
  end

  @spec solution(pos_integer) :: pos_integer
  def solution(n \\ 600_851_475_143) do
    factors = uniqFactors(n)

    MapSet.to_list(factors)
    |> Enum.max()
  end
end
