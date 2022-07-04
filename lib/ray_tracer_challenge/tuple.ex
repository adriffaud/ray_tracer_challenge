defprotocol RayTracerChallenge.Tuple do
  def x(value)
  def y(value)
  def z(value)
  def w(value)
end

defimpl RayTracerChallenge.Tuple, for: Any do
  def x(value), do: elem(value.data, 0)
  def y(value), do: elem(value.data, 1)
  def z(value), do: elem(value.data, 2)
  def w(value), do: value.__struct__.w()
end
