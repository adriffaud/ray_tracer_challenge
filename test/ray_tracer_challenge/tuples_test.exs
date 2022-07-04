defmodule RayTracerChallenge.CoreTest do
  @moduledoc false
  use ExUnit.Case, async: true
  alias RayTracerChallenge.{Point, Tuple, Vector}

  describe "A tuple" do
    test "is a point if w=1" do
      pt = Point.new(4.3, -4.2, 3.1)

      assert Tuple.w(pt) == 1
    end

    test "is a vector if w=0" do
      vec = Vector.new(4.3, -4.2, 3.1)

      assert Tuple.w(vec) == 0
    end
  end

  test "point/3 creates a tuple with w=1" do
    pt = Point.new(4, -4, 3)

    assert Tuple.x(pt) == 4
    assert Tuple.y(pt) == -4
    assert Tuple.z(pt) == 3
    assert Tuple.w(pt) == 1
  end

  test "vector/3 creates a tuple with w=0" do
    vec = Vector.new(4, -4, 3)

    assert Tuple.x(vec) == 4
    assert Tuple.y(vec) == -4
    assert Tuple.z(vec) == 3
    assert Tuple.w(vec) == 0
  end
end
