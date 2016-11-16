defmodule BracketPush do
  @brackets %{
    "[" => "]",
    "{" => "}",
    "(" => ")"
  }

  @brackets_start ["[", "{", "("]
  @brackets_end ["]", "}", ")"]
  
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t) :: boolean
  def check_brackets(str) do 
    str
    |> String.codepoints # Translate string to array
    |> Enum.filter(&(&1 in @brackets_start || &1 in @brackets_end)) # Leave only the brackets in the array
    |> is_balanced? # Check bracket balance
  end

  defp is_balanced?([head | _]) when head in @brackets_end do false end # If we meet a closed bracket then it means it's not balanced
  defp is_balanced?([head | tail]) do 
    closing_bracket = Map.get(@brackets, head)
    is_closed?(tail, closing_bracket) # Check for the relative closed bracket
  end
  defp is_balanced?(_) do true end # End reached means that it's balanced

  defp is_closed?([head | tail], bracket) when head == bracket do tail end # If we met the closing bracket return the remaining string
  defp is_closed?([head | tail], bracket) when head in @brackets_start do # We met another open bracket
    result = is_balanced?([head | tail]) # Recurse through the open bracket function
    unless result === false do 
      is_closed?(result, bracket) # Keep on looking for the closing bracket using the remaining array
    end 
  end
  defp is_closed?(_, _) do false end
end
