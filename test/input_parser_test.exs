defmodule Dux.InputParserTest do
  use ExUnit.Case
  alias Dux.InputParser
  alias Dux.Duck

  test "can parse space-separated input" do
    raw_input = "5 5"

    actual = InputParser.parse_duck_position(raw_input)
    expected = %Duck{x: 5, y: 5}

    assert match?({:ok, %Duck{}}, actual)
  end

  test "returns error tuple if bad input" do
    raw_input = "five five"

    # actual = InputParser.parse_duck_position(raw_input)

    # assert match?({:error, _}, actual)
  end
end
