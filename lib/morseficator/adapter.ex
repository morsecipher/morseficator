defmodule Morseficator.Adapter do
  @callback beep(args :: any, args :: integer) :: :ok
  @callback sleep(argv :: integer) :: :ok
  @callback setup :: tuple()

  @space_between_same_letter 1
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
    run_through_morse(morse_code, adapter, ctx)
    :ok
  end

  @spec interpret_morse(<<_::8>>, atom, any) :: any
  def interpret_morse(code, adapter, ctx) do
    case code do
      "." -> adapter.beep(ctx, 1)
      "-" -> adapter.beep(ctx, 3)
      " / " -> adapter.sleep(@space_between_words)
      _ -> :ok
    end
  end

  defp run_through_morse([], _, _), do: []
  defp run_through_morse(morse_code, adapter, ctx) do
    [head | tail] = morse_code

    interpret_morse(head, adapter, ctx)

    pause_duration = if head == List.first(tail) do
      @space_between_same_letter
    else
      @space_between_letters
    end

    adapter.sleep(pause_duration)

    run_through_morse(tail, adapter, ctx)
  end
end
