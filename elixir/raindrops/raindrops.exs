defmodule Raindrops do
  @sounds %{
    3 => "Pling",
    5 => "Plang",
    7 => "Plong"
  }

  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  def convert(number) do
      sound = @sounds
      |> Enum.reduce([], &(rain(number, &1, &2))) # Reduce the sound array to contain only the ones that contain number as a prime factor
      |> Enum.join("") # Create the string

      case sound do
        "" -> "#{number}" # If it's an empty string, pass the number's digits straight through
        _ -> sound # Else we got a number
      end
  end

  defp rain(number, {factor, sound}, acc) do 
    case rem(number, factor) do 
      0 -> List.insert_at(acc, -1, sound) # Insert the sound at the end of the list
      _ -> acc # Ignore the rain
    end
  end
end
