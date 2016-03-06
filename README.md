# Xkcd

![](http://i.imgur.com/kTRCjZh.png)

[![Hex.pm](https://img.shields.io/hexpm/l/xkcd.svg)](https://hex.pm/packages/xkcd)
[![Hex.pm](https://img.shields.io/hexpm/v/xkcd.svg)](https://hex.pm/packages/xkcd)
[![Hex.pm](https://img.shields.io/hexpm/dt/xkcd.svg)](https://hex.pm/packages/xkcd)

Uses the [XKCD](https://xkcd.com/965/) JSON API to retrieve a random, specific or the latest comic

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add xkcd to your list of dependencies in `mix.exs`:

        def deps do
          [{:xkcd, "~> 0.0.1"}]
        end

  2. Ensure xkcd is started before your application:

        def application do
          [applications: [:xkcd]]
        end

## Usage

```elixir
iex> Xkcd.latest
{:ok, %Xkcd.Comic{...}}

iex> Xkcd.random
{:ok, %Xkcd.Comic{...}}

iex> Xkcd.number(256)
{:ok, %Xkcd.Comic{...}}
```
