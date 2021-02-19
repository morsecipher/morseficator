defmodule Morseficator.Adapter do
  def interpret(text, adapter) do
    phrase = Morseficator.convert(text)

    Enum.each(phrase, fn code ->
      Enum.each(Morseficator.to_characters(code), fn code ->
        interpret_morse(code, adapter)
      end)

      adapter.pause
    end)
  end

  def interpret_morse(code, adapter) do
    case code do
      "." -> adapter.beep
      "-" -> adapter.beep_3x
      " " -> adapter.sleep
    end
  end
end
