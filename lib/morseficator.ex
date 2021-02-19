defmodule Morseficator do
  @doc """
    A method to convert text to morse code

  ## Examples
      iex> Morseficator.convert("HaHahA")
      ["....", ".-", "....", ".-", "....", ".-"]
  """
  def convert(text) do
    split_into_characters(text)
    |> convert_to_morse
  end

  @doc """
    A method to split string into characters

  ## Examples:
      iex> Morseficator.split_into_characters("Hello")
      ["H", "e", "l", "l", "o"]
  """
  def split_into_characters(string) do
    String.codepoints(string)
  end

  @doc """
    A method to convert character into morse code

  ## Examples:
      iex> Morseficator.char_to_morse("a")
      ".-"
  """
  def char_to_morse(character) do
    map = %Morseficator.Code{}.alphabet
    map[String.downcase(character)] || " "
  end

  def convert_to_morse(characters) do
    Enum.map(characters, fn char ->
      char_to_morse(char)
    end)
  end
end
