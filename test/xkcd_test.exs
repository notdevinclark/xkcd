defmodule XkcdTest do
  use ExUnit.Case, async: true

  alias Xkcd.Comic

  test "number gets a specific comic by it's number" do
    retrieved_comic = %Comic{title: "Those Not Present", alt: "'Yeah, that squid's a total asshole.' [scoot scoot]", img: "http://imgs.xkcd.com/comics/those_not_present.png", num: 1176}
    assert {:ok, ^retrieved_comic} = Xkcd.number(1176)
  end

  test "number returns an error if the comic doesn't exist" do
    assert {:error, "Comic Not Found"} = Xkcd.number(0)
  end

  test "latest returns the latest comic" do
    assert {:ok, %Comic{}} = Xkcd.latest
  end

  test "random gets a random comic" do
    {:ok, %Comic{num: max_num}} = Xkcd.latest
    {:ok, %Comic{num: num}} = Xkcd.random
    assert num in 1..max_num
  end
end
