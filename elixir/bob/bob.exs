defmodule Bob do
  def hey(input) do
    cond do
        input |> is_question? -> "Sure."
        input |> is_silent? -> "Fine. Be that way!"
        input |> is_yelling? -> "Whoa, chill out!"
        true -> "Whatever." #anything else
    end
  end

  defp is_question?(input) do
    input
    |> String.match?(~r/\?$/) # Check if it with a question mark
  end

  defp is_yelling?(input) do
    input 
    |> String.replace(~r/[^\p{L}]/, "") # Remove anything that is not a letter 
    |> String.match?(~r/^[\p{Lu}]+$/) # Check if all letters are uppercase from string start to string end
  end

  defp is_silent?(input) do
    input |> String.strip == "" 
  end
end
