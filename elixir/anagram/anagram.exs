defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    candidates
    |> Enum.filter(fn candidate -> is_anagram?(base |> String.downcase, candidate |> String.downcase) end) # Filter out every candidate that is not an anagram
  end

  defp is_anagram?(word, candidate) when candidate === word do false end # Edge case where the candidate is the same as the word
  defp is_anagram?(word, candidate) do
    word
    |> String.graphemes # Translate word to array
    |> Enum.reduce_while(candidate |> String.graphemes, fn grapheme, acc ->
      index = Enum.find_index(acc, &(&1 === grapheme)) # Find the letter position in the candidate
      if index == nil do
        {:halt, false} # Letter not found means that it's not a candidate
      else
        {:cont, List.delete_at(acc, index)} # Remove the letter from the candidate and keep looping
      end
    end) === [] # If the list comes out as empty, it means that the word is an anagram (if it has any elements in it, then the word" is a subset of the candidate)
  end
end
