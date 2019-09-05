defmodule Dux.InputParser do
  alias Dux.Duck

  @valid_commands [:starboard, :port]

  def parse_duck_position(raw_input) when is_binary(raw_input) do
    [x, y] =
      raw_input
      |> String.downcase()
      |> String.trim()
      |> String.split(" ")
      |> Enum.map(&String.to_integer(&1))

    {:ok, %{x: x, y: y}}
  end

  def parse_duck_commands(raw_input, duck \\ %Duck{}) when is_binary(raw_input) do
    commands =
      raw_input
      |> String.downcase()
      |> String.trim()
      |> String.split(" ")
      |> Enum.map(&convert_to_command/1)

    {:ok, commands}
  end

  defp convert_to_command(string_command) do
    case string_command do
      "s" -> :starboard
      "p" -> :port
    end
  end
end
