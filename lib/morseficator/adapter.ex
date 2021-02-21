defmodule Morseficator.Adapter do
  @callback beep(argv :: any()) :: nil
  @callback beep_3x(argv :: any()) :: nil
  @callback sleep(argv :: integer()) :: nil
  @callback setup :: tuple()

  @doc """
   A method to convert and to interpet the morse code

  ## Examples
      iex> Morseficator.Adapter.interpret("sos sos sos", Morseficator.Adapter.Midi)
      :ok
  """
  def interpret(text, adapter) do
    morse_code = Morseficator.convert(text) |> String.codepoints
    ctx = adapter.setup

    Enum.each(morse_code, fn code ->
      interpret_morse(code, adapter, ctx)
      adapter.sleep(3)
    end)
  end

  def interpret_morse(code, adapter, ctx) do
    case code do
      "." -> adapter.beep(ctx)
      "-" -> adapter.beep_3x(ctx)
      " " -> adapter.sleep(4)
    end
  end
end
