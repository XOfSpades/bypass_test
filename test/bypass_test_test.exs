defmodule BypassTestTest do

  use ExUnit.Case, async: true

  setup do
    bypass = Bypass.open |> IO.inspect
    {:ok, bypass: bypass}
  end

  test "client can handle an error response", %{bypass: bypass} do
    Bypass.expect bypass, fn conn ->
      assert conn.method == "GET"
      Plug.Conn.resp(conn, 200, ~s<{"msg": "Yay"}>)
    end
    IO.puts "REQUEST"

    HTTPotion.post(endpoint_url(bypass.port) <> "/1.1/statuses/update.json", body: "Elixir is awesome!")
    |> IO.inspect
  end

  defp endpoint_url(port), do: "http://localhost:#{port}"
end
