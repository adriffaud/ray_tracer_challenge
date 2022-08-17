defmodule RayTracerChallenge.MixProject do
  use Mix.Project

  def project do
    [
      app: :ray_tracer_challenge,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:credo, "~> 1.6", only: [:dev, :test], runtime: false},
      {:decimal, "~> 2.0"},
      {:dialyxir, "~> 1.1", only: [:test, :dev], runtime: false}
    ]
  end
end
