defmodule Hamming do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> Hamming.hamming_distance('AAGTCATA', 'TAGCGATC')
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: non_neg_integer
  def hamming_distance(strand1, strand2) when length(strand1) != length(strand2) do {:error, "Lists must be the same length"} end
  def hamming_distance(strand1, strand2) do {:ok, calculate(strand1, strand2)} end
  
  defp calculate([head1 | strand1], [head2 | strand2]) when head1 == head2 do calculate(strand1, strand2) end
  defp calculate([head1 | strand1], [head2 | strand2]) when head1 != head2 do 1 + calculate(strand1, strand2) end
  defp calculate([], []) do 0 end
end
