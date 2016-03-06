defmodule Xkcd.Mixfile do
  use Mix.Project

  def project do
    [app: :xkcd,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: "Uses the XKCD JSON API to retrieve the random, specific and the latest XKCD comic.",
     package: package,
     deps: deps,
     docs: [extras: ["README.md"]]]
  end

  def application do
    [applications: [:httpoison]]
  end

  defp deps do
    [
      {:poison, "~> 2.0"},
      {:httpoison, "~> 0.8.0"},
      {:earmark, ">= 0.0.0", only: :dev},
      {:ex_doc,  ">= 0.0.0", only: :dev}
    ]
  end

  defp package do
    [files: ["lib", "config", "mix.exs", "README*"],
     maintainers: ["Devin Clark"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/notdevinclark/xkcd",
              "Docs"   => "https://hexdocs.pm/xkcd/readme.html",
              "XKCD"   => "http://xkcd.com/"}]
  end
end
