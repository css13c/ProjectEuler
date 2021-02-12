defmodule Guards do
  @moduledoc """
  Module defining common guards used in multiple solutions.
  """

  @doc """
  Checks if `x` is even
  """
  defguard is_even(x) when rem(x, 2) == 0
end
