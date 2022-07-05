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
      expected = Point.new(1, 1, 6)

      assert {:ok, added} = Tuple.add(pt, vec)
      assert added == expected
    end

    test "vectors returns a vector" do
      vec1 = Vector.new(3, -2, 5)
      vec2 = Vector.new(-2, 3, 1)
      expected = Vector.new(1, 1, 6)

      assert {:ok, added} = Tuple.add(vec1, vec2)
      assert added == expected
    end

    test "points is not supported" do
      pt1 = Point.new(3, -2, 5)
      pt2 = Point.new(-2, 3, 1)

      assert {:error, :unsupported} == Tuple.add(pt1, pt2)
    end
  end

  describe "Subtracting tuples" do
    test "points returns a vector" do
      pt1 = Point.new(3, 2, 1)
      pt2 = Point.new(5, 6, 7)
      expected = Vector.new(-2, -4, -6)

      assert {:ok, subtracted} = Tuple.sub(pt1, pt2)
      assert subtracted == expected
    end

    test "vector from a point returns a point" do
      pt = Point.new(3, 2, 1)
      vec = Vector.new(5, 6, 7)
      expected = Point.new(-2, -4, -6)

      assert {:ok, subtracted} = Tuple.sub(pt, vec)
      assert subtracted == expected
    end

    test "vectors returns a vector" do
      vec1 = Vector.new(3, 2, 1)
      vec2 = Vector.new(5, 6, 7)
      expected = Vector.new(-2, -4, -6)

      assert {:ok, subtracted} = Tuple.sub(vec1, vec2)
      assert subtracted == expected
    end

    test "point from a vector is not supported" do
      vec = Vector.new(3, 2, 1)
      pt = Point.new(5, 6, 7)

      assert {:error, :unsupported} = Tuple.sub(vec, pt)
    end
  end

  describe "Negating tuples" do
    test "by subtracting a vector from the zero vector" do
      zero = Vector.zero()
      vec = Vector.new(1, -2, 3)
      expected = Vector.new(-1, 2, -3)

      assert {:ok, subtracted} = Tuple.sub(zero, vec)
      assert subtracted == expected
    end

    test "by using negate/1" do
      vec = Vector.new(1, -2, 3)
      expected = Vector.new(-1, 2, -3)

      assert {:ok, negated} = Tuple.negate(vec)
      assert negated == expected
    end
  end

  describe "Multiplying a" do
    test "vector by a scalar" do
      p = Vector.new(1, -2, 3)
      expected = Vector.new(3.5, -7, 10.5)

      assert {:ok, multiplied} = Tuple.multiply(p, 3.5)
      assert multiplied == expected
    end

    test "point by a scalar" do
      p = Point.new(1, -2, 3)
      expected = Point.new(3.5, -7, 10.5)

      assert {:ok, multiplied} = Tuple.multiply(p, 3.5)
      assert multiplied == expected
    end

    test "vector by a fraction" do
      p = Vector.new(1, -2, 3)
      expected = Vector.new(0.5, -1, 1.5)

      assert {:ok, multiplied} = Tuple.multiply(p, 0.5)
      assert multiplied == expected
    end

    test "point by a fraction" do
      p = Point.new(1, -2, 3)
      expected = Point.new(0.5, -1, 1.5)

      assert {:ok, multiplied} = Tuple.multiply(p, 0.5)
      assert multiplied == expected
    end
  end

  test "Dividing a tuple by a scalar" do
    p = Point.new(1, -2, 3)
    expected = Point.new(0.5, -1, 1.5)

    assert {:ok, divided} = Tuple.divide(p, 2)
    assert divided == expected
  end
end
