defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    sentence
    |> String.split(~r/[\,_\s]/)
    |> Enum.group_by(&(&1 |> String.downcase |> String.replace(~r/[^\w-]/u, "")), &(&1))
    |> Enum.filter(fn {k, _} -> String.length(k) > 0 end)
    |> Enum.reduce(%{}, fn {k, v}, acc -> Map.put(acc, k, Kernel.length(v)) end)
  end
end
