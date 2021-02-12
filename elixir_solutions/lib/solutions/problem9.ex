defmodule Problem9 do
  @moduledoc """
  Solution for Project Euler problem 9:
  > A Pythagorean triplet is a set of three natural numbers, a < b < c, for which, a² + b² = c².
  > For example, 3² + 4²  = 9 + 16 = 25 = 52.
  > There exists exactly one Pythagorean triplet for which a + b + c = 1000.
  > Find the product *abc*
  """

  import Guards, only: [is_even: 1]

  # Ended up not using Euclid's formula, but leaving it here in case it is needed later
  defguardp euclids_continue(m, n) when 0 < m and m < n and (is_even(m) or is_even(n))

  @doc """
  Euclid's formula can be used to produce all primitive Pythagorean triples (Primitive means *a*, *b*, and *c* are all coprime).
  Each triple is of the form:
      (*n*² - *m*², 2*nm*, *n*² + *m*²) = (a, b, c)
  where 0 < *m* < *n*, *n* and *m* are coprime, and at least one of *n* and *m* is even.

  ## Example

      iex> Problem9.euclids_formula(1, 2)
      [3, 4, 5]
  """
  @spec euclids_formula(pos_integer, pos_integer) :: [pos_integer]
  def euclids_formula(m, n) when euclids_continue(m, n) do
    if PrimeNumbers.are_coprime(m, n) do
      [round(Math.pow(n, 2) - Math.pow(m, 2)), 2 * m * n, round(Math.pow(n, 2) + Math.pow(m, 2))]
    else
      raise ArgumentError, message: "Euclid's fail due to non co-primality"
    end
  end

  def euclids_formula(_, _),
    do: raise(ArgumentError, message: "Euclid's fail due to no even values")

  @doc """
  Finds the product of pythagorean triple (*a*, *b*, *c*), where *a*+*b*+*c* = `sum`.

  ## Methodology
  Formula determined by solving the systems of equations:
      `a² + b² = c²` and `a + b + c = N`

  Solving the second equation to get the value of c, we find that: `c = N - a- b`.
  Plugging this into the first equation yields: `b = (N² - 2Na) / (2N - 2a)`.

  By iterating through *a* and using the given value of *N*(`sum`), we can solve for
  *b* and *c*. We then verify that (*a*, *b*, *c*) is a pythagorean triple, then return
  the product if it is.
  """
  @spec solution(pos_integer) :: pos_integer
  def solution(sum \\ 1000) do
    Enum.reduce_while(1..sum, 0, fn a, _ ->
      b = round((sum * sum - 2 * sum * a) / (2 * sum - 2 * a)) |> IO.inspect(label: "b")
      c = round(sum - a - b) |> IO.inspect(label: "c")

      cond do
        a * a + b * b == c * c ->
          IO.puts("Solution: (#{a}, #{b}, #{c})")
          {:halt, a * b * c}

        a * b * c < 0 ->
          raise "No solution"

        true ->
          # |> IO.inspect(label: "Continuing")
          {:cont, a * b * c}
      end
    end)
  end
end
