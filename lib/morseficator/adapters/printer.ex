defmodule Morseficator.Adapter.Printer do
  def pause do
    IO.puts "*pause*"
  end

  def beep do
    IO.puts "*beep*"
  end

  def beep_3x do
    IO.puts "*beep-beep-beep*"
  end

  def sleep do
    IO.puts "*sleep*"
  end
end
