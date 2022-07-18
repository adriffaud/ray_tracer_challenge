defmodule RayTracerChallenge.ColorsTest do
  @moduledoc false
  use ExUnit.Case, async: true
  alias RayTracerChallenge.Color

  test "Colors are (red, green, blue) tuples" do
    c = Color.new(-0.5, 0.4, 1.7)

    assert Color.red(c) == -0.5
    assert Color.green(c) == 0.4
    assert Color.blue(c) == 1.7
  end
end
