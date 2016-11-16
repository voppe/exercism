defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    {result, a, b} = order(a, b) # Order list so that we have "a" always is a superlist of "b" 

    case {a, b} do
      {^b, ^a} -> :equal
      {[nil], []} -> result # Edge case
      _ -> if contains?(a, b) do result else :unequal end # Return result
    end
  end

  # Detects result type and orders lists by length 
  defp order(a, b) do
    if length(a) < length(b) do 
      {:sublist, b, a} # Swap lists and mark as sublist result
    else 
      {:superlist, a, b} # Mark as superlist result
    end 
  end

  # Returns if the first list contains the second one
  defp contains?([], _) do false end
  defp contains?(a, b) do
    # Find where in "a" we can begin looking for "b"
    index = Enum.find_index(a, &(&1 == List.first(b))) 

    # If index is nil it means that it's not contained
    unless index == nil do
      Enum.slice(a, index, length(b)) === b # Check if the subsequent elements are identical to the list we want to find 
      || 
      a |> Enum.split(index+1) |> elem(1) |>contains?(b) # Otherwise loop, starting from the index we just checked
    end
  end
end
