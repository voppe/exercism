defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t) :: String.t
  def encode(string) do
    string
    |>String.graphemes
    |>Enum.chunk_by(&(&1)) # Groups equal graphemes in the same array
    |>Enum.map(&("#{Kernel.length(&1)}#{List.first(&1)}")) # Translates the grouped arrays to the encoded token
    |>Enum.join("")
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    string
    |>String.split(~r/()((\d+)(\w))()/, on: [1, 6]) # Splits the string in an array of tokens
    |>Enum.map(&(String.split_at(&1, -1))) # Splits the tokens into {N, Char}
    |>Enum.map(fn {n, char} -> String.duplicate(char, String.to_integer(n)) end) # Expand the Chars 
    |>Enum.join("") 
  end
end
