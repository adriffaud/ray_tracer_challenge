defmodule RayTracerChallenge.ColorTest do
  @moduledoc false
  use ExUnit.Case, async: true
  alias RayTracerChallenge.Color

  @rounding_decimal 4

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

  test "Subtracting colors" do
    c1 = Color.new(0.9, 0.6, 0.75)
    c2 = Color.new(0.7, 0.1, 0.25)
    expected = Color.new(0.2, 0.5, 0.5)
    result = Color.subtract(c1, c2)

    r1 = result |> Color.red() |> Decimal.from_float() |> Decimal.round(@rounding_decimal)
    r2 = expected |> Color.red() |> Decimal.from_float() |> Decimal.round(@rounding_decimal)
    g1 = result |> Color.green() |> Decimal.from_float() |> Decimal.round(@rounding_decimal)
    g2 = expected |> Color.green() |> Decimal.from_float() |> Decimal.round(@rounding_decimal)
    b1 = result |> Color.blue() |> Decimal.from_float() |> Decimal.round(@rounding_decimal)
    b2 = expected |> Color.blue() |> Decimal.from_float() |> Decimal.round(@rounding_decimal)

    assert Decimal.equal?(r1, r2)
    assert Decimal.equal?(g1, g2)
    assert Decimal.equal?(b1, b2)
  end

  test "Multiplying by a scalar" do
    c1 = Color.new(0.2, 0.3, 0.4)
    expected = Color.new(0.4, 0.6, 0.8)
    result = Color.multiply(c1, 2)

    assert result == expected
  end
end
