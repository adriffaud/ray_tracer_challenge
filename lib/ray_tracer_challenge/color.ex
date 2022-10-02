defmodule RayTracerChallenge.Color do
  @moduledoc false

  def new(red, green, blue), do: Nx.tensor([red, green, blue])

  def red(tensor), do: tensor[0] |> Nx.to_number()

  def green(tensor), do: tensor[1] |> Nx.to_number()

  def blue(tensor), do: tensor[2] |> Nx.to_number()

  def add(c1, c2) do
    Nx.add(c1, c2)
  end

  def subtract(c1, c2) do
    Nx.subtract(c1, c2)
  end

  def multiply(c1, c2) do
    Nx.multiply(c1, c2)
  end

  def approx_eq(c1, c2) do
    Nx.equal(c1, c2)
  end
end
