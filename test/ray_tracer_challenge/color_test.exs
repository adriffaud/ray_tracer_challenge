defmodule RayTracerChallenge.ColorTest do
  @moduledoc false
  use ExUnit.Case, async: true
  alias RayTracerChallenge.Color

  test "Colors are (red, green, blue) tuples" do
    c = Color.new(-0.5, 0.4, 1.7)

    assert Color.red(c) == -0.5
    assert Color.green(c) == 0.4
    assert Color.blue(c) == 1.7
  end

  test "Adding colors" do
    c1 = Color.new(0.9, 0.6, 0.75)
    c2 = Color.new(0.7, 0.1, 0.25)
    expected = Color.new(1.6, 0.7, 1.0)

    assert Color.add(c1, c2) == expected
  end
end
