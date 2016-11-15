defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    {result, a, b} = order(a, b)

    case {a, b} do
      {^b, ^a} -> :equal
      {[nil], []} -> result # Edge case
      _ -> if contains?(a, b) do result else :unequal end # Return result
    end
  end

  # Detects result type and orders lists by length 
  defp order(a, b) do
    case length(a) > length(b) do 
      false -> {:sublist, b, a} # Swap lists and mark as sublist result
      true -> {:superlist, a, b} # Mark as superlist result
    end 
  end

  # Returns if the first list contains the second one
  defp contains?([], _) do false end
  defp contains?(a, b) do
    index = Enum.find_index(a, &(&1 == List.first(b))) # Find in "a" where we can start checking for "b"
    case index do
      nil -> false # We can give up.
      _ -> case Enum.slice(a, index, length(b)) do # Analyze the next elements
        ^b -> true # Found it!
        _ -> contains?(a |> Enum.split(index+1) |> elem(1), b) # Otherwise keep checking after discarding the elements before "index"
      end
    end
  end
end
