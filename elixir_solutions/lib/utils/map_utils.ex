defmodule MapUtils do
  @moduledoc """
  Common map utility functions.
  """

  @doc """
  Returns the key with the largest value in the map.

  ## Examples

      iex> MapUtils.max(%{a: 3, y: 1, r: 2})
      :a

      iex> MapUtils.max(%{r: "o", x: "m", d: "c"})
      :r

      iex> MapUtils.max(%{})
      nil
  """
  @spec max(map) :: term
  def max(m) do
    {k, _} =
      Map.to_list(m)
      |> Enum.max(
        fn x, y ->
          {_, a} = x
          {_, b} = y
          a >= b
        end,
        fn -> {nil, nil} end
      )

    k
  end
end
