defmodule Roman do
  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t
  def numerals(number) do
    factor(number)
  end
  
  # This is cheating
  defp factor(number) when number >= 1000 do String.duplicate("M", div(number, 1000)) <> factor(rem(number, 1000)) end
  defp factor(number) when number >= 900 do String.duplicate("CM", div(number, 900)) <> factor(rem(number, 900)) end
  defp factor(number) when number >= 500 do String.duplicate("D", div(number, 500)) <> factor(rem(number, 500)) end
  defp factor(number) when number >= 400 do String.duplicate("CD", div(number, 400)) <> factor(rem(number, 400)) end
  defp factor(number) when number >= 100 do String.duplicate("C", div(number, 100)) <> factor(rem(number, 100)) end
  defp factor(number) when number >= 90 do String.duplicate("XC", div(number, 90)) <> factor(rem(number, 90)) end
  defp factor(number) when number >= 50 do String.duplicate("L", div(number, 50)) <> factor(rem(number, 50)) end
  defp factor(number) when number >= 40 do String.duplicate("XL", div(number, 40)) <> factor(rem(number, 40)) end
  defp factor(number) when number >= 10 do String.duplicate("X", div(number, 10)) <> factor(rem(number, 10)) end
  defp factor(number) when number >= 9 do String.duplicate("IX", div(number, 9)) <> factor(rem(number, 9)) end
  defp factor(number) when number >= 5 do String.duplicate("V", div(number, 5)) <> factor(rem(number, 5)) end
  defp factor(number) when number >= 4 do String.duplicate("IV", div(number, 4)) <> factor(rem(number, 4)) end
  defp factor(number) when number >= 1 do String.duplicate("I", div(number, 1)) <> factor(rem(number, 1)) end
  defp factor(_) do "" end
end
