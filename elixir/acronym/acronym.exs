defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> String.split(~r/(?=[\s\p{Lu}])/) # Split on separators or uppercase letters, but keep the delimiter
    |> Enum.map(fn s -> s |> String.trim |> String.slice(0, 1) end) # Get the first letter
    |> Enum.join("") 
    |> String.upcase
  end
end
