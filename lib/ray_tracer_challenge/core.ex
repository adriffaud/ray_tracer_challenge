defmodule RayTracerChallenge.Core do
  @moduledoc false

  @type r_tuple() :: {number(), number(), number(), 0 | 1}

  @spec is_point?(r_tuple()) :: boolean
  def is_point?({_, _, _, w}), do: w == 1

  @spec is_vector?(r_tuple()) :: boolean
  def is_vector?({_, _, _, w}), do: w == 0

  @spec point(number(), number(), number()) :: r_tuple()
  def point(x, y, z), do: {x, y, z, 1}

  @spec vector(number(), number(), number()) :: r_tuple()
  def vector(x, y, z), do: {x, y, z, 0}
end
