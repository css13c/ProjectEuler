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
  @spec divisors(pos_integer, pos_integer, MapSet.t(pos_integer)) :: list(pos_integer)
  def divisors(n, c \\ 1, div \\ MapSet.new)
  def divisors(n, c, div) when c * c > n, do: div |> Enum.to_list() |> Enum.sort()
  def divisors(n, c, div) when rem(n, c) == 0, do: divisors(n, c + 1, MapSet.union(div, MapSet.new([c, div(n, c)])))
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

  defmodule Fibbonaci do
    @moduledoc """
    All utilities concerning fibbonaci numbers.
    """

    @doc """
    Gets the **n**th term in the fibbonaci sequence, and returns the term along with
    a map containing all discovered fibbonaci numbers.

    ## Examples
        iex> NumberUtils.Fibbonaci.nth(7) |> elem(0)
        13

        iex> NumberUtils.Fibbonaci.nth(12) |> elem(0)
        144

        iex> NumberUtils.Fibbonaci.nth(12, %{10 => 55, 11 => 89}) |> elem(0)
        144
    """
    @spec nth(pos_integer, map) :: {pos_integer, map}
    def nth(n, terms \\ Map.new())
    def nth(n, terms) when n == 1, do: {1, Map.put_new(terms, 1, 1)}
    def nth(n, terms) when n == 2, do: {1, Map.put_new(terms, 2, 1) |> Map.put_new(1, 1)}
    def nth(n, terms) do
      if Map.has_key?(terms, n - 1) and Map.has_key?(terms, n - 2) do
        term = terms[n - 1] + terms[n - 2]
        {term, terms |> Map.put_new(n, term)}
        #|> IO.inspect(label: "Found(#{n})")
      else
        # Only need to find F(n-1), since we can pull F(n-2) from new_terms
        {prev, new_terms} = nth(n - 1, terms)
        #|> IO.inspect(label: "Result(#{n})")
        term = prev + new_terms[n - 2]
        {term, Map.merge(terms, new_terms) |> Map.put_new(n, term)}
      end
    end
  end
end
