defmodule Morseficator do
  @doc """
    A method to convert text to morse code

  ## Examples
      iex> Morseficator.convert("HaHahA")
      ["....", ".-", "....", ".-", "....", ".-"]
  """
  def convert(text) do
    to_characters(text)
    |> to_morse
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
    map = %Morseficator.Code{}.alphabet
    map[String.downcase(character)] || " "
  end

  def to_morse(characters) do
    Enum.map(characters, fn char ->
      to_morse_char(char)
    end)
  end
end
