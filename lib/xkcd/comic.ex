defmodule Xkcd.Comic do
  @moduledoc """
  A struct to hold data for a XKCD comic
  """

  @derive [Poison.Encoder]
  defstruct [:alt, :img, :title, :num]
end
