defmodule Dux.InputParser do
  alias Dux.Duck

  def parse_duck_position(raw_input) when is_binary(raw_input) do
    [x, y] =
      raw_input
      |> clean_and_split(" ")
      |> Enum.map(&String.to_integer(&1))

    {:ok, %{x: x, y: y}}
  end

  def parse_duck_commands(raw_input) when is_binary(raw_input) do
    commands =
      raw_input
      |> clean_and_split("", trim: true)
      |> Enum.map(&convert_to_command/1)

    {:ok, commands}
  end

  defp clean_and_split(raw_input, split_on, split_options \\ []) do
    raw_input
    |> String.downcase()
    |> String.trim()
    |> String.split(split_on, split_options)
  end

  defp convert_to_command(string_command) do
    case string_command do
      "s" -> :starboard
      "p" -> :port
      "f" -> :forward
    end
  end
end
