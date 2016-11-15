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
    |>Enum.chunk_by(&(&1)) # Group equal graphemes in the same array
    |>Enum.map(&("#{Kernel.length(&1)}#{List.first(&1)}")) # Translate the grouped arrays to the encoded token
    |>Enum.join("") # Create the string
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    string
    |>String.split(~r/()((\d+)(\w))()/, on: [1, 6]) # Split the string in an array of tokens (include separators)
    |>Enum.map(&(String.split_at(&1, -1))) # Split the tokens into an {N, Char} tuple
    |>Enum.map(fn {n, char} -> char |> String.duplicate(String.to_integer(n)) end) # Expand char
    |>Enum.join("") # Create the string
  end
end
