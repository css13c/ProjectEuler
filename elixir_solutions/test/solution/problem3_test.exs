defmodule Problem3Test do
  use ExUnit.Case
  doctest Problem3

  test "Largest factor of 13195" do
    assert Problem3.solution(13195) == 29
  end
end
