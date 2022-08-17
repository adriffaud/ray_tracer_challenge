defmodule RayTracerChallenge.Color do
  @moduledoc false

  def new(red, green, blue), do: {red, green, blue}

  def red({red, _green, _blue}), do: red

  def green({_red, green, _blue}), do: green

  def blue({_red, _green, blue}), do: blue

  def add(c1, c2) do
    {r1, g1, b1} = c1
    {r2, g2, b2} = c2

    {r1 + r2, g1 + g2, b1 + b2}
  end

  def subtract(c1, c2) do
    {r1, g1, b1} = c1
    {r2, g2, b2} = c2

    {r1 - r2, g1 - g2, b1 - b2}
  end

  def multiply(c1, scalar) when is_number(scalar) do
    {r, g, b} = c1

    {r * scalar, g * scalar, b * scalar}
  end

  def multiply(c1, c2) do
    {r1, g1, b1} = c1
    {r2, g2, b2} = c2

    {r1 * r2, g1 * g2, b1 * b2}
  end
end
