defmodule Bob do
  def hey(input) do
    cond do
        input |> String.match?(~r/\?$/) -> "Sure."
        "" = input |> String.strip -> "Fine. Be that way!"
        input |> String.replace(~r/[^\p{L}]/, "") |> String.match?(~r/^[\p{Lu}]+$/) -> "Whoa, chill out!"
        true -> "Whatever."
    end
  end
end
