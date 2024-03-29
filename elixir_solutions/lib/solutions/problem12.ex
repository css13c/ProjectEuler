defmodule Problem12 do
  @moduledoc """
  Solution for Project Euler problem 12:
  > The sequence of triangle numbers is generated by adding the natural numbers.
  > So the 7th triangle number would be `1 + 2 + 3 + 4 + 5 + 6 + 7 = 28`.  
  > The first ten terms would be: `1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...`
  >
  > Let us list the factors of the first seven triangle numbers:
    >> 1: 1  
    >> 3: 1,3  
    >> 6: 1,2,3,6  
    >> 10: 1,2,5,10  
    >> 15: 1,3,5,15  
    >> 21: 1,3,7,21  
    >> 28: 1,2,4,7,14,28  

  > We can see that 28 is the first triangle number to have over five divisors.

  > What is the value of the first triangle number to have over five hundred divisors?
  """

  @doc """
  Gets the number of divisors for `n`.

  ## Examples

      iex> Problem12.divisor_count(28)
      6
      
      iex> Problem12.divisor_count(760)
      16
  """
  @spec divisor_count(pos_integer) :: pos_integer
  def divisor_count(n) when n == 1, do: 1

  def divisor_count(n) do
    Enum.map(PrimeNumbers.prime_factorization(n), fn x ->
      {_, power} = x
      power + 1
    end)
    |> Enum.reduce(&Kernel.*/2)
  end

  @doc """
  Finds the first triangle number to have at least `number_of_factors` factors.  
  Triangular numbers can be found using the formula `T(x) = (x * (x + 1)) / 2`.

  ## Examples

      iex> Problem12.solution(5)
      28
      
      iex> Problem12.solution(10)
      120
  """
  @spec solution(pos_integer, pos_integer) :: pos_integer
  def solution(number_of_factors \\ 500, x \\ 1)
  def solution(number_of_factors, x) do
    n = round(x * (x + 1) / 2)
    if divisor_count(n) > number_of_factors, do: n, else: solution(number_of_factors, x + 1)
  end
end
