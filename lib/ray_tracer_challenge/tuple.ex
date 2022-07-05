defprotocol RayTracerChallenge.Tuple do
  def x(value)
  def y(value)
  def z(value)
  def w(value)
  def add(value1, value2)
  def sub(value1, value2)
  def negate(value)
end

defimpl RayTracerChallenge.Tuple, for: Any do
  def x(value), do: elem(value.data, 0)
  def y(value), do: elem(value.data, 1)
  def z(value), do: elem(value.data, 2)
  def w(value), do: value.__struct__.w()

  def add(t1, t2) do
    x = RayTracerChallenge.Tuple.x(t1) + RayTracerChallenge.Tuple.x(t2)
    y = RayTracerChallenge.Tuple.y(t1) + RayTracerChallenge.Tuple.y(t2)
    z = RayTracerChallenge.Tuple.z(t1) + RayTracerChallenge.Tuple.z(t2)
    w = RayTracerChallenge.Tuple.w(t1) + RayTracerChallenge.Tuple.w(t2)

    case w do
      1 ->
        {:ok, RayTracerChallenge.Point.new(x, y, z)}

      0 ->
        {:ok, RayTracerChallenge.Vector.new(x, y, z)}

      _ ->
        {:error, :unsupported}
    end
  end

  def sub(t1, t2) do
    x = RayTracerChallenge.Tuple.x(t1) - RayTracerChallenge.Tuple.x(t2)
    y = RayTracerChallenge.Tuple.y(t1) - RayTracerChallenge.Tuple.y(t2)
    z = RayTracerChallenge.Tuple.z(t1) - RayTracerChallenge.Tuple.z(t2)
    w = RayTracerChallenge.Tuple.w(t1) - RayTracerChallenge.Tuple.w(t2)

    case w do
      1 ->
        {:ok, RayTracerChallenge.Point.new(x, y, z)}

      0 ->
        {:ok, RayTracerChallenge.Vector.new(x, y, z)}

      _ ->
        {:error, :unsupported}
    end
  end

  def negate(t) do
    x = -RayTracerChallenge.Tuple.x(t)
    y = -RayTracerChallenge.Tuple.y(t)
    z = -RayTracerChallenge.Tuple.z(t)

    {:ok, t.__struct__.new(x, y, z)}
  end
end
