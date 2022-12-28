defmodule InMemoryDbTest do
  use ExUnit.Case
  doctest InMemoryDb

  test "greets the world" do
    assert InMemoryDb.ping() == :pong
  end
end
