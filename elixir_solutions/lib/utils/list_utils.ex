defmodule ListUtils do
  @moduledoc """
  Module containing common re-usable list functions, including transforming lists
  to maps, etc.
  """

  @doc """
  Converts a list to a map, where the index is the key.
 
  ## Examples
      iex> ListUtils.to_map([20, 40, 60, 80, 100])
      %{0 => 20, 1 => 40, 2 => 60, 3 => 80, 4 => 100}

      iex> ListUtils.to_map(["test", "this", "list", "to", "map"])
      %{0 => "test", 1 => "this", 2 => "list", 3 => "to", 4 => "map"}
  """
  @spec to_map(list(term)) :: map
  def to_map(l) do
    Enum.with_index(l) |> Enum.into(%{}, fn {v, k} -> {k, v} end)
  end
  
  @doc """
  Gets all permutations of items in list.

  ## Examples
      iex> ListUtils.permutations([0, 1, 2])
      [[0, 1, 2], [0, 2, 1], [1, 0, 2], [1, 2, 0], [2, 0, 1], [2, 1, 0]]

      iex> ListUtils.permutations([1, 2])
      [[1, 2], [2, 1]]
  """
  @spec permutations(list(term)) :: list(String.t)
  def permutations([]), do: [[]]
  def permutations(l) when is_list(l) do
    for h <- l, t <- permutations(l -- [h]), do: [h|t]
  end
end
