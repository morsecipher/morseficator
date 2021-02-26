defmodule MorseficatorTest do
  use ExUnit.Case
  doctest Morseficator

  test "converts text into morse code" do
    assert Morseficator.encode("abcdefghklmnopqrstuvwqwz12345678910") == ".- -... -.-. -.. . ..-. --. .... -.- .-.. -- -. --- .--. --.- .-. ... - ..- ...- .-- --.- .-- --.. .---- ..--- ...--- ....- ..... -.... --... ---.. ----. .---- /"
  end
end
