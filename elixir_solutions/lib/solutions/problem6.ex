defmodule Problem6 do
  @moduledoc """
  Solution for Project Euler problem 6:
  > The sum of the squares of the first ten natural numbers is, `1² + 2² + ... + 10² = 385`.
  > The square of the sum of the first ten natural numbers is `(1 + 2 + ... + 10)² = 3025`.
  > Hence the difference between the sum of the squares of the first ten natural numbers
  > and the square of the sum is `3025 - 385 = 2640`.
  > Find the difference between the sum of the squares of the first one hundred natural
  > numbers and the square of the sum.
  """

  @doc """
  Finds the sum of squares for a given list of numbers.

  ## Examples

      iex> Problem6.sum_of_squares(1..10)
      385
  """
  @spec sum_of_squares([pos_integer()]) :: pos_integer()
  def sum_of_squares(range), do: Enum.reduce(range, &(&1 * &1 + &2))

  @doc """
  Finds the square of the sum for a given list of numbers.

  ## Examples
      iex> Problem6.square_of_sum(1..10)
      3025
  """
  @spec square_of_sum([pos_integer()]) :: pos_integer()
  def square_of_sum(range), do: round(:math.pow(Enum.reduce(range, &(&1 + &2)), 2))

  @doc """
  Finds the difference between the sum of the squares and the square of the sum for a given list of numbers

  ## Examples
      iex> Problem6.solution(1..10)
      2640
  """
  @spec solution([pos_integer()]) :: pos_integer()
  def solution(range) do
    square_of_sum(range) - sum_of_squares(range)
  end
end
