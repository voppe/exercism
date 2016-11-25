defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count([_ | tail]) do 1+count(tail) end
  def count([]) do 0 end

  @spec reverse(list) :: list
  def reverse(list) do _reverse(list, []) end
  defp _reverse([head | tail], acc) do _reverse(tail, [head | acc]) end
  defp _reverse([], acc) do acc end 

  @spec map(list, (any -> any)) :: list
  def map([head | tail], f) do [f.(head) | map(tail, f)] end
  def map([], _) do [] end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter([head | tail], f) do
    if f.(head) == true do [head | filter(tail, f)] else filter(tail, f) end
  end
  def filter([], _) do [] end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce([head | tail], acc, f) do f.(head, reduce(tail, acc, f)) end
  def reduce([], acc, _) do acc end

  @spec append(list, list) :: list
  def append([head | tail], b) do [head | append(tail, b)] end
  def append([], b) do b end

  @spec concat([[any]]) :: [any]
  def concat([head | tail]) do append(head, concat(tail)) end
  def concat([]) do [] end
end
