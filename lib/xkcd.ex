defmodule Xkcd do
  @moduledoc """
  A client for the XKCD JSON API
  """

  alias Xkcd.Comic
  alias HTTPoison.Response

  @doc """
  Takes a number from 1 to the latest and returns a tuple with with :ok and a
  comic struct or an :error atom and an error message

  Example:

      iex> Xkcd.number(256)
      {:ok, %Xkcd.Comic{...}}

      iex> Xkcd.number(0)
      {:error, "Comic Not Found"}
  """
  @spec number(integer) :: {:ok, Comic.t}
                         | {:error, String.t}
  def number(integer) do
    "http://xkcd.com/#{integer}/info.0.json"
    |> get_comic
  end


  @doc """
  Gets the latest comic and returns a tuple with :ok and a comic struct

  Example:

      iex> Xkcd.latest
      {:ok, %Xkcd.Comic{...}}
  """
  @spec latest :: {:ok, Comic.t}
  def latest do
    "http://xkcd.com/info.0.json"
    |> get_comic
  end

  @doc """
  Gets a random comic and returns a tuple with :ok and a comic struct

  Example:

      iex> Xkcd.random
      {:ok, %Xkcd.Comic{...}}
  """
  @spec random :: {:ok, Comic.t}
  def random do
    {:ok, %Comic{num: max_num}} = Xkcd.latest
    max_num
    |> :rand.uniform
    |> number
  end

  defp get_comic(url) do
    url
    |> HTTPoison.get
    |> get_body
    |> parse_body
  end

  defp get_body({:ok, %Response{status_code: 404}}), do: {:error, "Comic Not Found"}
  defp get_body({:ok, %Response{body: body}}), do: {:ok, body}

  defp parse_body({:ok, body}), do: {:ok, Poison.decode!(body, as: %Comic{})}
  defp parse_body(error), do: error
end
