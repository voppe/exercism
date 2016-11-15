defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> String.split(~r/(?=[\s\p{Lu}])/) # Split on separators or uppercase letters (keep the delimiter(
    |> Enum.map(fn s -> s |> String.trim |> String.slice(0, 1) end) # Get the first letter
    |> Enum.join("") # Recreate the string
    |> String.upcase # Uppercase everything
  end
end
