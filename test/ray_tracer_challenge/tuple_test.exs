defmodule RayTracerChallenge.TupleTest do
  @moduledoc false
  use ExUnit.Case, async: true
  alias RayTracerChallenge.{FloatUtils, Point, Tuple, Vector}

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
      result = Tuple.add(pt, vec)

      assert result == expected
    end

    test "vectors returns a vector" do
      vec1 = Vector.new(3, -2, 5)
      vec2 = Vector.new(-2, 3, 1)
      expected = Vector.new(1, 1, 6)
      result = Tuple.add(vec1, vec2)

      assert result == expected
    end
  end

  describe "Subtracting tuples" do
    test "points returns a vector" do
      pt1 = Point.new(3, 2, 1)
      pt2 = Point.new(5, 6, 7)
      expected = Vector.new(-2, -4, -6)

      assert subtracted = Tuple.sub(pt1, pt2)
      assert subtracted == expected
    end

    test "vector from a point returns a point" do
      pt = Point.new(3, 2, 1)
      vec = Vector.new(5, 6, 7)
      expected = Point.new(-2, -4, -6)

      assert subtracted = Tuple.sub(pt, vec)
      assert subtracted == expected
    end

    test "vectors returns a vector" do
      vec1 = Vector.new(3, 2, 1)
      vec2 = Vector.new(5, 6, 7)
      expected = Vector.new(-2, -4, -6)

      assert subtracted = Tuple.sub(vec1, vec2)
      assert subtracted == expected
    end

    test "point from a vector is not supported" do
      vec = Vector.new(3, 2, 1)
      pt = Point.new(5, 6, 7)

      assert_raise(CaseClauseError, "no case clause matching: -1", fn -> Tuple.sub(vec, pt) end)
    end
  end

  describe "Negating tuples" do
    test "by subtracting a vector from the zero vector" do
      zero = Vector.zero()
      vec = Vector.new(1, -2, 3)
      expected = Vector.new(-1, 2, -3)

      assert subtracted = Tuple.sub(zero, vec)
      assert subtracted == expected
    end

    test "by using negate/1" do
      vec = Vector.new(1, -2, 3)
      expected = Vector.new(-1, 2, -3)

      assert negated = Tuple.negate(vec)
      assert negated == expected
    end
  end

  describe "Multiplying a" do
    test "vector by a scalar" do
      p = Vector.new(1, -2, 3)
      expected = Vector.new(3.5, -7, 10.5)

      assert multiplied = Tuple.multiply(p, 3.5)
      assert multiplied == expected
    end

    test "point by a scalar" do
      p = Point.new(1, -2, 3)
      expected = Point.new(3.5, -7, 10.5)

      assert multiplied = Tuple.multiply(p, 3.5)
      assert multiplied == expected
    end

    test "vector by a fraction" do
      p = Vector.new(1, -2, 3)
      expected = Vector.new(0.5, -1, 1.5)

      assert multiplied = Tuple.multiply(p, 0.5)
      assert multiplied == expected
    end

    test "point by a fraction" do
      p = Point.new(1, -2, 3)
      expected = Point.new(0.5, -1, 1.5)

      assert multiplied = Tuple.multiply(p, 0.5)
      assert multiplied == expected
    end
  end

  test "Dividing a tuple by a scalar" do
    p = Point.new(1, -2, 3)
    expected = Point.new(0.5, -1, 1.5)

    assert divided = Tuple.divide(p, 2)
    assert divided == expected
  end

  describe "Magnitude" do
    test "of a vector(1, 0, 0)" do
      v = Vector.new(1, 0, 0)

      assert Tuple.magnitude(v) |> FloatUtils.approx_eq(1)
    end

    test "of a vector(0, 1, 0)" do
      v = Vector.new(0, 1, 0)

      assert Tuple.magnitude(v) |> FloatUtils.approx_eq(1)
    end

    test "of a vector(0, 0, 1)" do
      v = Vector.new(0, 0, 1)

      assert Tuple.magnitude(v) == 1
    end

    test "of a vector(1, 2, 3)" do
      v = Vector.new(1, 2, 3)

      assert Tuple.magnitude(v) |> FloatUtils.approx_eq(:math.sqrt(14))
    end

    test "of a vector(-1, -2, -3)" do
      v = Vector.new(-1, -2, -3)

      assert Tuple.magnitude(v) |> FloatUtils.approx_eq(:math.sqrt(14))
    end
  end

  describe "Normalization" do
    test "of a vector(4, 0, 0) gives (1, 0, 0)" do
      v = Vector.new(4, 0, 0)
      expected = Vector.new(1, 0, 0)
      result = Tuple.normalize(v)

      assert FloatUtils.approx_eq(result, expected)
    end

    test "of a vector(1, 2, 3)" do
      v = Vector.new(1, 2, 3)
      expected = Vector.new(1 / :math.sqrt(14), 2 / :math.sqrt(14), 3 / :math.sqrt(14))
      result = Tuple.normalize(v)

      assert FloatUtils.approx_eq(result, expected)
    end

    test "magnitude" do
      v = Vector.new(1, 2, 3)
      norm = Tuple.normalize(v)
      result = Tuple.magnitude(norm)

      assert FloatUtils.approx_eq(result, 1)
    end
  end

  test "Dot product of two tuples" do
    a = Vector.new(1, 2, 3)
    b = Vector.new(2, 3, 4)
    result = Tuple.dot(a, b)

    assert result == 20
  end

  test "Cross product of two vectors" do
    a = Vector.new(1, 2, 3)
    b = Vector.new(2, 3, 4)

    assert Tuple.cross(a, b) == Vector.new(-1, 2, -1)
    assert Tuple.cross(b, a) == Vector.new(1, -2, 1)
  end
end
