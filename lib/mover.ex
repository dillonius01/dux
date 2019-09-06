defmodule Dux.Mover do
  alias Dux.Duck

  def execute_command(%Duck{commands: commands} = duck) do
    [cmd | remaining_commands] = commands

    duck
    |> Map.put(:commands, remaining_commands)
    |> do_command(cmd)
  end

  defp do_command(duck, cmd) do
    case cmd do
      :starboard ->
        rotate_duck(duck, :starboard)

      :port ->
        rotate_duck(duck, :port)

      :forward ->
        move_duck(duck, :forward)
    end
  end

  defp move_duck(%Duck{x: x, y: y, orientation: orientation} = duck, :forward) do
    case orientation do
      :N ->
        %{duck | y: y + 1}

      :E ->
        %{duck | x: x + 1}

      :S ->
        %{duck | y: y - 1}

      :W ->
        %{duck | x: x - 1}
    end
  end

  defp rotate_duck(%Duck{orientation: orientation} = duck, :starboard) do
    case orientation do
      :N ->
        %{duck | orientation: :E}

      :E ->
        %{duck | orientation: :S}

      :S ->
        %{duck | orientation: :E}

      :W ->
        %{duck | orientation: :N}
    end
  end

  defp rotate_duck(%Duck{orientation: orientation} = duck, :port) do
    case orientation do
      :N ->
        %{duck | orientation: :W}

      :E ->
        %{duck | orientation: :N}

      :S ->
        %{duck | orientation: :E}

      :W ->
        %{duck | orientation: :S}
    end
  end
end
