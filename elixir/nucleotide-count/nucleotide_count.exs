defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a NucleotideCount strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    parse(strand, nucleotide)
  end

  def parse([head | tail], nucleotide) do
    cnt = if head == nucleotide do 1 else 0 end
    
    parse(tail, nucleotide) + cnt
  end

  def parse([], _) do
    0 # End reached
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
      @nucleotides
      |> Enum.map(&({&1, count(strand, &1)}))
      |> Map.new
  end
end
