defmodule Morseficator.Adapter.Printer do
  def setup do
    {}
  end

  def beep(_) do
    IO.puts "*beep*"
  end

  def beep_3x(_) do
    IO.puts "*beep-beep-beep*"
  end

  def sleep(n) do
    IO.puts "*sleep (#{n})*"
  end
end
