defmodule DuxTest do
  use ExUnit.Case
  doctest Dux

  test "greets the world" do
    assert Dux.hello() == :world
  end
end
