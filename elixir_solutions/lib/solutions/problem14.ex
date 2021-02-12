defmodule Problem14 do
  @moduledoc """
  Solution to Project Euler problem 14:
  > The following iterative sequence is defined for the set of positive integers:  
  >    n → n/2 (n is even)  
  >    n → 3n + 1 (n is odd)  
  >
  > Using the rule above and starting with 13, we generate the following sequence:  
  >     13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
  >
  > It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms.
  > Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.
  >
  > Which starting number, under one million, produces the longest chain?
  """

  @doc """
  Finds the length of the Collatz Sequence starting with a given number.

  ## Example

      iex> Problem14.collatz_length(13)
      10

      iex> Problem14.collatz_length(5)
      6
  """
  @spec collatz_length(pos_integer, map) :: pos_integer
  def collatz_length(n, r \\ Map.new())
  def collatz_length(n, _) when n == 1, do: 1

  def collatz_length(n, r) do
    require Integer

    if Map.has_key?(r, n) do
      1 + Map.get(r, n, 0)
    else
      case Integer.is_even(n) do
        true -> 1 + collatz_length(round(n / 2), r)
        false -> 1 + collatz_length(round(3 * n + 1), r)
      end
    end
  end

  @doc """
  Finds the number that produces the longest Collatz Sequence underneath `cap`.

  ## Example

      iex> Problem14.solution(10)
      9
  """
  @spec solution(pos_integer, pos_integer, map) :: pos_integer
  def solution(cap \\ 1_000_000, n \\ 1, map \\ Map.new())
  def solution(cap, n, map) when n == cap, do: MapUtils.max(map)
  def solution(cap, n, map), do: solution(cap, n + 1, Map.put(map, n, collatz_length(n, map)))
end
