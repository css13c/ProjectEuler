defmodule Problem1Test do
  use ExUnit.Case
  doctest Problem1

  test "multiples under 10" do
    assert Problem1.solution(10) == 23
  end

  test "multiples under 20" do
    assert Problem1.solution(20) == 78
  end
end
