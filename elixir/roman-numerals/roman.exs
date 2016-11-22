defmodule Roman do
  @numerals [
    [1000, "M"],
    [900, "CM"],
    [500, "D"],
    [400, "CD"],
    [100, "C"],
    [90, "XC"],
    [50, "L"],
    [40, "XL"],
    [10, "X"],
    [9, "IX"],
    [5, "V"],
    [4, "IV"],
    [1, "I"],
  ]

  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t
  def numerals(number) do
    @numerals
    |> Enum.reduce({number, ""}, fn [digit, numeral], {number, result} ->
      {quotient, remainder} = {div(number, digit), rem(number, digit)}

      roman = result <> String.duplicate(numeral, quotient)

      {remainder, roman} # I need to keep track of both remainder and result, unsure if there's a clearer way
    end)
    |> elem(1) # Get the result
  end
end
