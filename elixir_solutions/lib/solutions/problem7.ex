defmodule Problem7 do
  @moduledoc ~S"""
  Solution for Project Euler problem 7:
  > By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
  > What is the 10,001st prime number?
  """

  @doc """
  Gets the nth prime.

  ## Examples

      iex> Problem7.solution(6)
      13
  """
  @spec solution(pos_integer()) :: pos_integer()
  def solution(n \\ 10_001, prime_list \\ nil)
  def solution(n, prime_list) when prime_list == nil, do: solution(n, Enum.to_list(2..(n * 2)))

  def solution(n, prime_list) do
    new_list = PrimeNumbers.sieve_of_eratosthenes(prime_list)

    case length(new_list) > n do
      true ->
        Enum.at(new_list, n - 1)

      false ->
        last = List.last(prime_list)

        if last != nil do
          solution(n, prime_list ++ Enum.to_list((last + 1)..(last + n)))
        end
    end
  end
end
