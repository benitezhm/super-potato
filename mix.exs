defmodule SuperPotato.MixProject do
  use Mix.Project

  def project do
    [
      app: :super_potato,
      version: "1.0.1-alpha.0",
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ],
      # Docs
      name: "SuperPotato",
      source_url: "https://github.com/benitezhm/super-potato",
      homepage_url: "https://github.com/benitezhm/super-potato",
      docs: [
        # The main page in the docs
        main: "SuperPotato",
        logo: "logo.jpg",
        extras: ["README.md"]
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:excoveralls, "~> 0.18", only: :test},
      {:ex_doc, "~> 0.39", only: :dev, runtime: false},
      {:version_release, "~> 0.5.3", only: [:test, :dev], runtime: false},
      {:dialyxir, "~> 1.4", only: [:dev, :test], runtime: false}
    ]
  end
end
