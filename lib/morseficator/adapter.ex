defmodule Morseficator.Adapter do
  def interpret(text, adapter) do
    morse_code = Morseficator.convert(text) |> Enum.join |> String.codepoints
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
