defprotocol RayTracerChallenge.Tuple do
  def x(value)
  def y(value)
  def z(value)
  def w(value)
  def add(value1, value2)
  def sub(value1, value2)
  def negate(value)
  def multiply(value, scalar)
  def divide(value, scalar)
  def magnitude(value)
  def normalize(value)
  def dot(value1, value2)
  def cross(value1, value2)
end

defimpl RayTracerChallenge.Tuple, for: Any do
  alias RayTracerChallenge.{Point, Tuple, Vector}

  def x(value), do: value.data[0] |> Nx.to_number()
  def y(value), do: value.data[1] |> Nx.to_number()
  def z(value), do: value.data[2] |> Nx.to_number()
  def w(value), do: value.__struct__.w()

  def add(t1, t2) do
    added = Nx.add(t1.data, t2.data)
    w = Tuple.w(t1) + Tuple.w(t2)

    case w do
      1 -> Point.new(added)
      0 -> Vector.new(added)
    end
  end

  def sub(t1, t2) do
    subtracted = Nx.subtract(t1.data, t2.data)
    w = Tuple.w(t1) - Tuple.w(t2)

    case w do
      1 -> Point.new(subtracted)
      0 -> Vector.new(subtracted)
    end
  end

  def negate(t), do: t.data |> Nx.negate() |> t.__struct__.new()

  def multiply(t, s), do: t.data |> Nx.multiply(s) |> t.__struct__.new()

  def divide(t, s), do: t.data |> Nx.divide(s) |> t.__struct__.new()

  def magnitude(t), do: t.data |> Nx.pow(2) |> Nx.sum() |> Nx.sqrt() |> Nx.to_number()

  def normalize(t) do
    magnitude = magnitude(t)
    divide(t, magnitude)
  end

  def dot(t1, t2), do: Nx.dot(t1.data, t2.data) |> Nx.to_number()

  def cross(t1, t2) do
    x1 = Tuple.x(t1)
    y1 = Tuple.y(t1)
    z1 = Tuple.z(t1)
    x2 = Tuple.x(t2)
    y2 = Tuple.y(t2)
    z2 = Tuple.z(t2)

    Vector.new(y1 * z2 - z1 * y2, z1 * x2 - x1 * z2, x1 * y2 - y1 * x2)
  end
end
