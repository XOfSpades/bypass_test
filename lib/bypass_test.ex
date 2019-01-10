defmodule BypassTest do
  @moduledoc """
  Documentation for BypassTest.
  """

  @doc """
  Hello world.

  ## Examples

      iex> BypassTest.hello()
      :world

  """
  def hello do
    :world
  end

  def request(port, path) do
    # url = domain <> path |> IO.inspect
    HTTPotion.get("https://localhost:#{port}/#{path}", []) |> IO.inspect
  end
end
