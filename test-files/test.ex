defmodule HelloWorld do
  @moduledoc """
  A simple Hello World module in Elixir.
  """

  @doc """
  Prints a greeting message.
  """
  def greet(name \\ "World") do
    IO.puts("Hello, #{name}!")
  end
end

# Call the function
HelloWorld.greet("Elixir")
