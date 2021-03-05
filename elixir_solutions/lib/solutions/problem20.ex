defmodule Problem20 do
  @moduledoc """
  Solution to Project Euler problem 20:
  > `n!` means `n × (n − 1) × ... × 3 × 2 × 1`
  >
  > For example, `10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800`,  
  > and the sum of the digits in the number 10! is `3 + 6 + 2 + 8 + 8 + 0 + 0 = 27`.
  >
  > Find the sum of the digits in the number 100!
  """

  @doc """
  Finds the sum of digits for `n!`

  ## Example
      iex> Problem20.solution(10)
      27
  """
  @spec solution(pos_integer) :: pos_integer
  def solution(n \\ 100) do
    Math.factorial(n)
    |> Integer.digits()
    |> Enum.reduce(&+/2)
  end
end
