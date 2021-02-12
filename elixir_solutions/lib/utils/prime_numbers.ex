defmodule PrimeNumbers do
  @moduledoc """
  Module handling common prime number functions, including prime factorization, finding
  prime numbers, and determining primality.
  """

  @doc """
  Determines if two numbers are co-prime to each other.
  Numbers are co-prime if they share no common prime factors.

  ## Examples
      iex> PrimeNumbers.are_coprime(2, 3)
      true

      iex> PrimeNumbers.are_coprime(12, 13)
      true

      iex> PrimeNumbers.are_coprime(21, 14)
      false
  """
  @spec are_coprime(pos_integer, pos_integer) :: boolean
  def are_coprime(x, y) do
    MapSet.disjoint?(unique_prime_factors(x), unique_prime_factors(y))
  end

  @doc """
  Gets the unique prime factors of a given number.

  ## Examples
      iex> PrimeNumbers.unique_prime_factors(20)
      #MapSet<[2, 5]>

      iex> PrimeNumbers.unique_prime_factors(2)
      #MapSet<[2]>

      iex> PrimeNumbers.unique_prime_factors(32)
      #MapSet<[2]>
  """
  @spec unique_prime_factors(pos_integer) :: MapSet.t(pos_integer)
  def unique_prime_factors(n), do: p_unique_prime_factors(n)

  @spec p_unique_prime_factors(pos_integer, pos_integer, MapSet.t(pos_integer)) ::
          MapSet.t(pos_integer)
  defp p_unique_prime_factors(n, x \\ 2, set \\ MapSet.new())
  defp p_unique_prime_factors(n, _x, set) when n == 1, do: set
  defp p_unique_prime_factors(n, x, set) when n > 1 and x * x > n, do: MapSet.put(set, n)

  defp p_unique_prime_factors(n, x, set) when x * x <= n and rem(n, x) == 0,
    do: p_unique_prime_factors(div(n, x), x, MapSet.put(set, x))

  defp p_unique_prime_factors(n, x, set) when x * x <= n and rem(n, x) != 0,
    do: p_unique_prime_factors(n, x + 1, set)

  @doc """
  Gets the prime factorization of `n`, with the form `{factor, power}`.

  ## Examples

      iex> PrimeNumbers.prime_factorization(10)
      [{2, 1}, {5, 1}]

      iex> PrimeNumbers.prime_factorization(7)
      [{7, 1}]

      iex> PrimeNumbers.prime_factorization(20)
      [{2, 2}, {5, 1}]
  """
  @spec prime_factorization(pos_integer, pos_integer, map) :: [{term, term}]
  def prime_factorization(n, x \\ 2, factors \\ Map.new())
  def prime_factorization(n, _x, factors) when n == 1, do: Map.to_list(factors)

  def prime_factorization(n, x, factors) when n > 1 and x * x > n,
    do: Map.update(factors, n, 1, &(&1 + 1)) |> Map.to_list()

  def prime_factorization(n, x, factors) when x * x <= n and rem(n, x) == 0,
    do: prime_factorization(div(n, x), x, Map.update(factors, x, 1, &(&1 + 1)))

  def prime_factorization(n, x, factors) when x * x <= n and rem(n, x) != 0,
    do: prime_factorization(n, x + 1, factors)

  @doc """
  Gets the list of all positive primes in `values`, using
  The Sieve of Eratosthenes.

  ## Examples

      iex> PrimeNumbers.sieve_of_eratosthenes(1..20)
      [2, 3, 5, 7, 11, 13, 17, 19]

      iex> PrimeNumbers.sieve_of_eratosthenes(2..9)
      [2, 3, 5, 7]
  """
  @spec sieve_of_eratosthenes(Enum.t()) :: [pos_integer]
  def sieve_of_eratosthenes(values) do
    val_list = Enum.filter(values, &(&1 > 1)) |> Enum.to_list()
    p_sieve(0, val_list, List.last(val_list))
  end

  @spec p_sieve(integer, Enum.t(), pos_integer) :: [pos_integer]
  defp p_sieve(n, numbers, maxVal) do
    num = Enum.at(numbers, n)

    if num * num > maxVal do
      numbers
    else
      divisible = &(rem(&1, num) != 0 or &1 == num)
      filtered = Enum.filter(numbers, divisible)
      p_sieve(n + 1, filtered, maxVal)
    end
  end
end
