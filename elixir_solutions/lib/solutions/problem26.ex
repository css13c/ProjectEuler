defmodule Problem26 do
  @moduledoc """
  Solution for Project Euler Problem 26:
  > A unit fraction contains 1 in the numerator. The decimal representation of the unit fractions with denominators 2 to 10 are given:
  >>  1/2 = 0.5  
  >>  1/3 = 0.(3)  
  >>  1/4 = 0.25  
  >>  1/5 = 0.2  
  >>  1/6 = 0.1(6)  
  >>  1/7 = 0.(142857)  
  >>  1/8 = 0.125  
  >>  1/9 = 0.(1)  
  >>  1/10 = 0.1  
  >
  > Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. It can be seen that 1/7 has a 6-digit recurring cycle.
  > Find the value of d < 1000 for which 1/d contains the longest recurring cycle in its decimal fraction part.
  """

  # Finds length of the longest repeat in a string or number, -1 if none
  @spec get_repeat_length(number | String.t) :: pos_integer
  defp get_repeat_length(n) when is_number(n), do: get_repeat_length(Float.to_string(n))
  defp get_repeat_length(str) do
    matches = Regex.named_captures(~r/(?<re>.+?)\1+/u, str)
    if matches != nil do
      Map.get(matches, "re")
      |> String.length()
    else
      -1
    end
  end

  @doc """
  Finds the value of **1/d** which contains the longest recurring cycle in its decimal fraction part from 1 to **n**.

  ## Examples

      iex> Problem26.solution(10)
      7
  """
  @spec solution(pos_integer) :: pos_integer
  def solution(n) do
    for d <- 1..n, reduce: 0 do
      acc -> max(get_repeat_length(1 / d), acc)
    end
  end
end
