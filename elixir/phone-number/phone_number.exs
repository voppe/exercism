defmodule Phone do
  @type phone_number :: {String.t, String.t, String.t} # Tuple structure
  @invalid_number {"000", "000", "0000"} # Our standard invalid number 

  @doc """
  Remove formatting from a phone number.

  Returns "0000000000" if phone number is not valid
  (10 digits or "1" followed by 10 digits)

  ## Examples

  iex> Phone.number("123-456-7890")
  "1234567890"

  iex> Phone.number("+1 (303) 555-1212")
  "3035551212"

  iex> Phone.number("867.5309")
  "0000000000"
  """
  @spec number(String.t) :: String.t
  def number(raw) do
    raw
    |> digitize
    |> Tuple.to_list
    |> Enum.join
  end

  @doc """
  Extract the area code from a phone number

  Returns the first three digits from a phone number,
  ignoring long distance indicator

  ## Examples

  iex> Phone.area_code("123-456-7890")
  "123"

  iex> Phone.area_code("+1 (303) 555-1212")
  "303"

  iex> Phone.area_code("867.5309")
  "000"
  """
  @spec area_code(String.t) :: String.t
  def area_code(raw) do
    raw
    |> digitize
    |> Tuple.to_list
    |> Enum.fetch!(0)
  end

  @doc """
  Pretty print a phone number

  Wraps the area code in parentheses and separates
  exchange and subscriber number with a dash.

  ## Examples

  iex> Phone.pretty("123-456-7890")
  "(123) 456-7890"

  iex> Phone.pretty("+1 (303) 555-1212")
  "(303) 555-1212"

  iex> Phone.pretty("867.5309")
  "(000) 000-0000"
  """
  @spec pretty(String.t) :: String.t
  def pretty(raw) do
    number = digitize(raw)
    
    "(#{elem(number, 0)}) #{elem(number, 1)}-#{elem(number, 2)}"
  end

  @spec validate(String.t) :: phone_number
  defp digitize(number) do
    digits = number |> String.replace(~r/[^\w]/, "") # Remove anything that is not a number or a letter

    unless String.match?(digits, ~r/\p{L}/) do # If it does not contain any letter
      validate(digits |> String.codepoints) # Translate to array and validate
    else
      @invalid_number # Otherwise it's invalid
    end
  end

  @spec validate([number]) :: phone_number
  defp validate(digits) when length(digits) == 11 do
    [head | tail] = digits
    if head == "1" do # If the first digit is a one
      validate(tail) # Discard it and keep validating
    else 
      @invalid_number
    end
  end

  # Invalid phone number, too short
  @spec validate([number]) :: phone_number
  defp validate(digits) when length(digits) < 10 do
    @invalid_number
  end

  @spec validate([number]) :: phone_number
  defp validate(digits) do
    # Translate our array into a formatted tuple
    {Enum.slice(digits, 0, 3) |> Enum.join(""), Enum.slice(digits, 3, 3) |> Enum.join(""), Enum.slice(digits, 6, 4) |> Enum.join("")}
  end
end
