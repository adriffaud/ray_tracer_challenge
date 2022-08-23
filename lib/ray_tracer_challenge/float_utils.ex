defmodule RayTracerChallenge.FloatUtils do
  @moduledoc false

  @max_double <<0b0111111111101111111111111111111111111111111111111111111111111111::64>>

  def approx_eq(a, b, epsilon \\ 1.0e-5) do
    abs_a = abs(a)
    abs_b = abs(b)
    diff = abs(a - b)

    cond do
      a == b -> true
      a == 0 or b == 0 -> diff < epsilon
      true -> diff / min(abs_a + abs_b, @max_double) < epsilon
    end
  end
end
