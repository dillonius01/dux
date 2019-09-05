defmodule Dux.CLI do
  def main(_args) do
    IO.puts("Welcome to the duckinator!")

    duck0_position = load_input("What is the first duck's position?")
    IO.puts(duck0_position)
  end

  defp load_input(prompt) do
    IO.puts(prompt)
    IO.gets("\n> ")
  end
end
