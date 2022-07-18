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
end

defimpl RayTracerChallenge.Tuple, for: Any do
  alias RayTracerChallenge.{Point, Tuple, Vector}

  def x(value), do: elem(value.data, 0)
  def y(value), do: elem(value.data, 1)
  def z(value), do: elem(value.data, 2)
  def w(value), do: value.__struct__.w()

  def add(t1, t2) do
    x = Tuple.x(t1) + Tuple.x(t2)
    y = Tuple.y(t1) + Tuple.y(t2)
    z = Tuple.z(t1) + Tuple.z(t2)
    w = Tuple.w(t1) + Tuple.w(t2)

    case w do
      1 -> Point.new(x, y, z)
      0 -> Vector.new(x, y, z)
      _ -> raise(ArgumentError, "Unsupported")
    end
  end

  def sub(t1, t2) do
    x = Tuple.x(t1) - Tuple.x(t2)
    y = Tuple.y(t1) - Tuple.y(t2)
    z = Tuple.z(t1) - Tuple.z(t2)
    w = Tuple.w(t1) - Tuple.w(t2)

    case w do
      1 -> Point.new(x, y, z)
      0 -> Vector.new(x, y, z)
      _ -> raise(ArgumentError, "Unsupported")
    end
  end

  def negate(t) do
    x = -Tuple.x(t)
    y = -Tuple.y(t)
    z = -Tuple.z(t)

    t.__struct__.new(x, y, z)
  end

  def multiply(t, s) do
    x = Tuple.x(t) * s
    y = Tuple.y(t) * s
    z = Tuple.z(t) * s

    t.__struct__.new(x, y, z)
  end

  def divide(t, s) do
    x = Tuple.x(t) / s
    y = Tuple.y(t) / s
    z = Tuple.z(t) / s

    t.__struct__.new(x, y, z)
  end
end
