defmodule Problem25 do
  @moduledoc """
  Solution to Project Euler Problem 25:
  > The Fibonacci sequence is defined by the recurrence relation:
  >
  >>    F(n) = F(n−1) + F(n−2), where F(1) = 1 and F(2) = 1.
  >
  > Hence the first 12 terms will be:
  >>  F(1) = 1  
  >>  F(2) = 1  
  >>  F(3) = 2  
  >>  F(4) = 3  
  >>  F(5) = 5  
  >>  F(6) = 8  
  >>  F(7) = 13  
  >>  F(8) = 21  
  >>  F(9) = 34  
  >>  F(10) = 55  
  >>  F(11) = 89  
  >>  F(12) = 144  
  >
  > The 12th term, F(12), is the first term to contain three digits.
  >
  > What is the index of the first term in the Fibonacci sequence to contain 1000 digits?
  """
  alias NumberUtils.Fibbonaci, as: Fibonnaci

  @doc """
  Finds the index of the first term in the Fibbonaci sequence containing
  **n** digits.

  ## Examples
      iex> Problem25.solution(3)
      12
  """
  @spec solution(pos_integer, map) :: pos_integer
  def solution(n \\ 1000, fib \\ %{}, index \\ 1) do
    #IO.inspect(fib, label: "I: #{index}, Fib")
    {val, new_fib} = Fibonnaci.nth(index, fib)
    digits = Integer.digits(val) |> length()
    cond do
      digits >= n - 3 and digits < n -> solution(n, new_fib, index + 1)
      digits < n - 3 -> solution(n, new_fib, index + 10)
      digits == n -> index
    end
  end
end
