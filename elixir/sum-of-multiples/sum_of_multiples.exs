defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    1..limit-1 # Create the array containing every number up to the defined limit
    |> Enum.filter(&(is_multiple_of?(&1, factors))) # Filter out every number that is not a multiple of factors
    |> Enum.reduce(0, &(&1+&2)) # Sum the remaining numbers
  end

  defp is_multiple_of?(_, []) do false end
  defp is_multiple_of?(n, [head | tail]) do
    if rem(n, head) == 0 do true else is_multiple_of?(n, tail) end # Loop through every factor
  end
end
