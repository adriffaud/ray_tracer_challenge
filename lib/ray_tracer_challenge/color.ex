defmodule RayTracerChallenge.Color do
  @moduledoc false

  def new(red, green, blue), do: {red, green, blue}

  def red({red, _green, _blue}), do: red

  def green({_red, green, _blue}), do: green

  def blue({_red, _green, blue}), do: blue
end
