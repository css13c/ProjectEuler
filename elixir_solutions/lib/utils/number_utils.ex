defmodule NumberUtils do
  @moduledoc """
  Module handling common number funcions, including getting number divisors, etc.
  """

  @doc """
  Gets the divisors of **n** and returns them in ascending order.

  ## Examples
      iex> NumberUtils.divisors(10)
      [1, 2, 5, 10]

      iex> NumberUtils.divisors(20)
      [1, 2, 4, 5, 10, 20]
  """
  @spec divisors(pos_integer, pos_integer, list(pos_integer)) :: list(pos_integer)
  def divisors(n, c \\ 1, div \\ [])
  def divisors(n, c, div) when c * c > n, do: div |> Enum.sort()
  def divisors(n, c, div) when rem(n, c) == 0, do: divisors(n, c + 1, div ++ [c, div(n, c)])
  def divisors(n, c, div), do: divisors(n, c + 1, div)

  @doc """
  Gets the proper divisors (numbers less than **n** which divide evenly into **n**)
  of a number and returns them in ascending order.

  ## Examples
      iex> NumberUtils.proper_divisors(220)
      [1, 2, 4, 5, 10, 11, 20, 22, 44, 55, 110]

      iex> NumberUtils.proper_divisors(284)
      [1, 2, 4, 71, 142]
  """
  @spec proper_divisors(pos_integer) :: list(pos_integer)
  def proper_divisors(n), do: divisors(n) |> Enum.filter(fn d -> n != d end)

  @doc """
  Gets the sum of divisors of a number using prime factorization.
  
  ## Examples
      iex> NumberUtils.sum_of_factors_prime(1100)
      2604

      iex> NumberUtils.sum_of_factors_prime(28)
      28
  """
  @spec sum_of_factors_prime(pos_integer, list(pos_integer) | nil) :: pos_integer
  def sum_of_factors_prime(n, prime_list \\ nil)

  def sum_of_factors_prime(n, prime_list) when is_nil(prime_list),
    do: sum_of_factors_prime(n, PrimeNumbers.sieve_of_eratosthenes(n))

  def sum_of_factors_prime(n, prime_list) do
    PrimeNumbers.prime_factorization_v2(n, prime_list)
    |> IO.inspect(label: "Prime factorization")
    |> Enum.reduce(0, fn {x, p}, acc ->
      acc * prime_factor_factorial_sum(x, p)
    end)
  end

  # Converts a prime factor (ex. 2^2) to the sum of its power factorial.
  # ex. 2^2 = 2^2 + 2^1 + 2^0 = 4 + 2 + 1 = 7
  defp prime_factor_factorial_sum(n, p, sum \\ 0)
  defp prime_factor_factorial_sum(n, p, sum) when p == 1, do: sum + n + 1

  defp prime_factor_factorial_sum(n, p, sum),
    do: prime_factor_factorial_sum(n, p - 1, sum + floor(Math.pow(n, p)))
end
