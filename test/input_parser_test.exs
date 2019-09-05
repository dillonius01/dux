defmodule Dux.InputParserTest do
  use ExUnit.Case
  alias Dux.InputParser
  alias Dux.Duck

  describe "parse_duck_position/1" do
    test "can parse space-separated input" do
      raw_input = "5 5"

      actual = InputParser.parse_duck_position(raw_input)

      assert match?({:ok, %{x: 5, y: 5}}, actual)
    end

    # test "returns error tuple if bad input" do
    #   raw_input = "five five"

    #   actual = InputParser.parse_duck_position(raw_input)

    #   assert match?({:error, _}, actual)
    # end
  end

  describe "parse_duck_commands/1" do
    test "can parse non-separated list of directions" do
      raw_input = "PFPFS"

      actual = InputParser.parse_duck_commands(raw_input)

      expected = [:port, :forward, :port, :forward, :starboard]

      assert match?({:ok, [:port, :forward, :port, :forward, :starboard]}, actual)
    end
  end
end
