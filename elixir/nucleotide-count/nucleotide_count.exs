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
    cnt = case head do
      ^nucleotide -> 1
      _ -> 0 
    end
    
    case tail do
      [] -> cnt
      _ -> parse(tail, nucleotide) + cnt
    end
  end

  def parse([], _) do
    0
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
      |> Enum.map(fn n -> {n, count(strand, n)} end)
      |> Map.new
  end
end
