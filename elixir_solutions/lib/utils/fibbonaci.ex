defmodule Fibbonaci do
  @moduledoc """
  All utilities concerning fibbonaci numbers.
  """

  @doc """
  Gets the **n**th term in the fibbonaci sequence, and returns the term along with
  a map containing all discovered fibbonaci numbers.

  ## Examples
      iex> Fibbonaci.nth(7) |> elem(0)
      13

      iex> Fibbonaci.nth(12) |> elem(0)
      144

      iex> Fibbonaci.nth(12, %{10 => 55, 11 => 89}) |> elem(0)
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
    else
      # Only need to find F(n-1), since we can pull F(n-2) from new_terms
      {prev, new_terms} = nth(n - 1, terms)
      term = prev + new_terms[n - 2]
      {term, Map.merge(terms, new_terms) |> Map.put_new(n, term)}
    end
  end
end
