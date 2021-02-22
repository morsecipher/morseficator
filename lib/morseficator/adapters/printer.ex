defmodule Morseficator.Adapter.Printer do
  @behaviour Morseficator.Adapter

  @spec setup :: {}
  def setup do
    {}
  end

  @spec beep(any) :: :ok
  def beep(_) do
    IO.puts "*beep*"
  end

  @spec beep_3x(any) :: :ok
  def beep_3x(_) do
    IO.puts "*beep-beep-beep*"
  end

  @spec sleep(any) :: :ok
  def sleep(n) do
    IO.puts "*sleep (#{n})*"
  end
end
