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

  describe "Adding tuples" do
    test "a point and a vector returns a point" do
      pt = Point.new(3, -2, 5)
      vec = Vector.new(-2, 3, 1)
      res = Point.new(1, 1, 6)

      assert {:ok, added} = Tuple.add(pt, vec)
      assert added == res
    end

    test "vectors returns a vector" do
      vec1 = Vector.new(3, -2, 5)
      vec2 = Vector.new(-2, 3, 1)
      res = Vector.new(1, 1, 6)

      assert {:ok, added} = Tuple.add(vec1, vec2)
      assert added == res
    end

    test "points is not supported" do
      pt1 = Point.new(3, -2, 5)
      pt2 = Point.new(-2, 3, 1)

      assert {:error, :unsupported} == Tuple.add(pt1, pt2)
    end
  end
end
