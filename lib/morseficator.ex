defmodule Morseficator do
  @alphabet %Morseficator.Code{}.alphabet
  @doc """
    A method to decode morse into text

  ## Examples
      iex> Morseficator.decode("... --- ...")
      "sos"
  """
  @spec decode(binary) :: String.t()
  def decode(text) do
    String.split(text, " ")
    |> morse_to_letter
  end

  @spec morse_to_letter(any) :: String.t()
  def morse_to_letter(array) do
    Enum.map(array, fn(code) ->
      { character, _code } = Enum.find(@alphabet, fn { _k, v } -> code == v end)
      character
    end) |> Enum.join
  end

  @doc """
    A method to encode text to morse code

  ## Examples
      iex> Morseficator.encode("SoS sos")
      "... --- ... / ... --- ..."
  """
  def encode(text) do
    to_characters(text)
    |> to_morse
    |> Enum.join(" ")
  end

  @doc """
    A method to split string into characters

  ## Examples:
      iex> Morseficator.to_characters("Hello")
      ["H", "e", "l", "l", "o"]
  """
  def to_characters(string) do
    String.codepoints(string)
  end

  @doc """
    A method to convert character into morse code

  ## Examples:
      iex> Morseficator.to_morse_char("a")
      ".-"
  """
  def to_morse_char(character) do
    @alphabet[String.downcase(character)] || "/"
  end

  def to_morse(characters) do
    Enum.map(characters, fn char ->
      to_morse_char(char)
    end)
  end
end
