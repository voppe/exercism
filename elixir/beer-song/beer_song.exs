defmodule BeerSong do
  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t
  def verse(number) do
    beers = number-1
    quantity = how_many(beers)
    bottles = bottles(beers)
    remaining = pass_around(beers)
    "#{String.capitalize(quantity)} #{bottles} of beer on the wall, #{quantity} #{bottles} of beer.\n"
    <>
    "#{what_do(beers)}, #{how_many(remaining)} #{bottles(remaining)} of beer on the wall.\n"
  end

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t) :: String.t
  def lyrics do lyrics(100..1) end
  def lyrics(range) do
    range 
    |> Enum.scan([], fn i, _ -> verse(i) end) 
    |> Enum.join("\n")
  end

  defp how_many(n) when n == 0 do "no more" end
  defp how_many(n) do "#{n}" end

  defp bottles(n) when n == 1 do "bottle" end
  defp bottles(_) do "bottles" end

  defp what_do(n) when n > 0 do "Take #{take_down(n)} down and pass it around" end
  defp what_do(_) do "Go to the store and buy some more" end

  defp take_down(n) when n == 1 do "it" end
  defp take_down(_) do "one" end

  defp pass_around(n) when n == 0 do 99 end
  defp pass_around(n) do n-1 end
end
