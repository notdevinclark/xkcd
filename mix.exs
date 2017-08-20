defmodule Xkcd.Mixfile do
  use Mix.Project

  def project do
    [app: :xkcd,
     version: "0.0.3",
     elixir: "~> 1.5",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: "Uses the XKCD JSON API to retrieve the random, specific and the latest XKCD comic.",
     package: package(),
     deps: deps(),
     docs: [extras: ["README.md"]]]
  end

  def application do
    [applications: [:httpoison]]
  end

  defp deps do
    [
      {:poison, "~> 3.1"},
      {:httpoison, "~> 0.13"},
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
