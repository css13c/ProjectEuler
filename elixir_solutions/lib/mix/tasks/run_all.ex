defmodule Mix.Tasks.Euler do
  use Mix.Task

  @impl Mix.Task
  @shortdoc "Runs all Project Euler solutions"
  def run(_) do
    IO.puts("Running all Elixir Project Euler solutions!!")
    lib = Path.relative_to_cwd("lib") |> Path.expand()

    # Compile all the utilities
    # Path.join(lib, "utils/*")
    # |> Path.wildcard()
    # |> Enum.each(&Code.compile_file/1)
    
    Path.join(lib, "solutions/*")
    |> Path.wildcard()
    |> Stream.map(&Code.compile_file/1)
    |> Stream.map(&(Enum.at(&1, 0) |> elem(0)))
    |> Enum.sort()
    |> Enum.each(fn x ->
      result = apply(x, :solution, [])
      name = 
      IO.puts("Solution for #{name}: #{result}")
    end)
  end
end
