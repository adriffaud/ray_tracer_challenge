defmodule RayTracerChallenge.FloatUtils do
  @moduledoc """
  Used for approximate float comparison.

  Based on https://floating-point-gui.de/errors/comparison/
  """

  alias RayTracerChallenge.{Point, Vector}

  def approx_eq(%Vector{} = tuple1, %Vector{} = tuple2), do: approx_eq(tuple1.data, tuple2.data)
  def approx_eq(%Point{} = tuple1, %Point{} = tuple2), do: approx_eq(tuple1.data, tuple2.data)
  def approx_eq(v1, v2), do: Nx.equal(v1, v2)
end
