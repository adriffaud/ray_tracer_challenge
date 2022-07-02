defmodule RayTracerChallenge.CoreTest do
  @moduledoc false
  use ExUnit.Case, async: true
  alias RayTracerChallenge.Core

  describe "A tuple" do
    test "is a point if w=1" do
      tuple = {4.3, -4.2, 3.1, 1.0}

      assert Core.is_point?(tuple)
      assert !Core.is_vector?(tuple)
    end

    test "is a vector if w=0" do
      tuple = {4.3, -4.2, 3.1, 0.0}

      assert Core.is_vector?(tuple)
      assert !Core.is_point?(tuple)
    end
  end

  test "point/3 creates a tuple with w=1" do
    tuple = Core.point(4, -4, 3)

    assert tuple == {4, -4, 3, 1}
  end

  test "vector/3 creates a tuple with w=0" do
    tuple = Core.vector(4, -4, 3)

    assert tuple == {4, -4, 3, 0}
  end
end
