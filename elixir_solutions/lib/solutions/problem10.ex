defmodule Problem10 do
  @moduledoc """
  Solution for Project Euler problem 10:
  > The sum of all primes below 10 is `2+3+5+7 = 17`.
  > Find the sum of all primes below two million.
  """

  @spec solution(pos_integer) :: pos_integer
  def solution(maxVal \\ 2_000_000) do
    range = 1..maxVal

    PrimeNumbers.sieve_of_eratosthenes(range)
    |> Enum.reduce(&Kernel.+/2)
  end
end
