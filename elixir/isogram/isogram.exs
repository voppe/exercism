defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t) :: boolean
  def isogram?(sentence) do
    # Normalize the sentence into an array containing only the letters and then sort them
    codepoints = sentence |> String.replace(~r/[^\p{L}]/u, "") |> String.codepoints |> Enum.sort

    # If after deduplicating this array we have the same length as the starting sentence, it's an isogram
    codepoints |> length == codepoints |> Enum.dedup |> length
  end

end
