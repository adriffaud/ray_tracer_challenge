defmodule RayTracerChallenge.Point do
  @derive RayTracerChallenge.Tuple
  defstruct [:data]

  def new(x, y, z), do: %__MODULE__{data: {x, y, z}}
  def zero(), do: new(0, 0, 0)
  def w(), do: 1
end
