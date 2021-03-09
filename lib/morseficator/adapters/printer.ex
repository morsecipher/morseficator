defmodule Morseficator.Adapter.Printer do
  @behaviour Morseficator.Adapter

  @spec setup :: {}
  def setup do
    {}
  end

  @spec beep(pid, non_neg_integer()) :: :ok
  def beep(_, times) do
    String.duplicate("beep ", times)
    |> IO.puts
  end

  @spec sleep(any) :: :ok
  def sleep(n) do
    IO.puts "*sleep (#{n})*"
  end
end
