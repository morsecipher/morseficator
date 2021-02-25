defmodule Morseficator.Adapter do
  @callback beep(argv :: any) :: :ok
  @callback beep_3x(argv :: any) :: :ok
  @callback sleep(argv :: integer) :: :ok
  @callback setup :: tuple()

  @space_between_letters 3
  @space_between_words 4

  @doc """
   A method to convert and to interpet the morse code

  ## Examples
      iex> Morseficator.Adapter.interpret("sos sos sos", Morseficator.Adapter.Midi)
      :ok
  """
  @spec interpret(String.t(), module()) :: :ok
  def interpret(text, adapter) do
    morse_code = Morseficator.encode(text) |> String.codepoints
    ctx = adapter.setup

    Enum.each(morse_code, fn code ->
      interpret_morse(code, adapter, ctx)
      adapter.sleep(@space_between_letters)
    end)

    :ok
  end

  @spec interpret_morse(<<_::8>>, atom, any) :: any
  def interpret_morse(code, adapter, ctx) do
    case code do
      "." -> adapter.beep(ctx)
      "-" -> adapter.beep_3x(ctx)
      " " -> adapter.sleep(@space_between_words)
      _ -> :ok
    end
  end
end
