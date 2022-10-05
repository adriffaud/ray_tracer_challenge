defmodule RayTracerChallenge.Vector do
  @moduledoc false
  @derive RayTracerChallenge.Tuple
  defstruct [:data]

  def new(x, y, z), do: %__MODULE__{data: Nx.tensor([x, y, z])}
  def new(tensor), do: %__MODULE__{data: tensor}
  def zero(), do: new(0, 0, 0)
  def w(), do: 0
end
