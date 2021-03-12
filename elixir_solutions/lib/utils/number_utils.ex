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
end
