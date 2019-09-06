defmodule Dux.Duck do
  defstruct x: nil, y: nil, commands: [], orientation: nil

  def new(%{x: x, y: y, orientation: orientation}, commands) do
    %__MODULE__{x: x, y: y, commands: commands, orientation: orientation}
  end
end
