defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    sentence
    |> String.split(~r/[\,_\s]/) # Split the phrase into an array
    |> Enum.group_by(&(&1 |> String.downcase |> String.replace(~r/[^\w-]/u, "")), &(&1)) # Group words into an array
    |> Enum.filter(fn {word, _} -> String.length(word) > 0 end) # Remove the empty words that got caught in
    |> Enum.reduce(%{}, fn {word, cnt}, acc -> Map.put(acc, word, length(cnt)) end) # Translate the array into a map
  end
end
