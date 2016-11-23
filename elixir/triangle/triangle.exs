defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: { :ok, kind } | { :error, String.t }
  def kind(a, b, c) when a <= 0 or b <= 0 or c <= 0 do {:error, "all side lengths must be positive"} end
  def kind(a, b, c) do
    [a, b, c] = [a, b, c] |> Enum.sort # Reorder our sides
    
    if a + b <= c do # There is only need to test for the two smaller sides (now ordered)
      {:error, "side lengths violate triangle inequality"}
    else
      # Now it's only a matter to deduplicate equal values from the list and see how many elements remain
      {:ok, case [a, b, c] |> Enum.dedup |> length do 
        1 -> :equilateral
        2 -> :isosceles
        3 -> :scalene 
      end}
    end
  end
end
