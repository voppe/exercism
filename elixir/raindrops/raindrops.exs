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
      |> Enum.reduce([], fn {k, v}, acc -> 
        case rem(number, k) do 
          0 -> List.insert_at(acc, -1, v)
          _ -> acc
        end
      end)
      |> Enum.join("")

      case sound do
        "" -> "#{number}"
        _ -> sound
      end
  end
end
