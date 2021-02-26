defmodule Morseficator do
  @encode_alphabet %Morseficator.Code{}.alphabet
  @decode_alphabet Map.new(@encode_alphabet, fn {key, val} -> {val, key} end)
  @doc """
    A method to decode morse into text

  ## Examples
      iex> Morseficator.decode("... --- ... / ... --- ...")
      "sos sos"
  """
  @spec decode(binary) :: String.t()
  def decode(text) do
    text
    |> String.split(" ")
    |> Enum.map(&to_letter_char/1)
    |> Enum.join
  end

  @doc """
    A method to encode text to morse code

  ## Examples
      iex> Morseficator.encode("SoS sos")
      "... --- ... / ... --- ..."
  """
  def encode(text) do
    text
    |> String.codepoints
    |> to_morse
    |> Enum.join(" ")
  end

  defp to_letter_char(morse) do
    @decode_alphabet[morse] || "?"
  end

  defp to_morse_char(character) do
    @encode_alphabet[String.downcase(character)] || "/"
  end

  defp to_morse(characters) do
    Enum.map(characters, &to_morse_char/1)
  end
end
