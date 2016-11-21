defmodule Prime do
  @first_prime 2

  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(count) do
    search(count, @first_prime+1, [@first_prime]) 
  end

  # Edge case
  def search(count, _, primes) when length(primes) > count do raise ArgumentError end 
  
  # Number of primes found matching our list length means that the nth prime is at the end of our stack
  def search(count, _, primes) when length(primes) === count do List.last(primes) end

  def search(count, n, primes) do
    new_primes = if is_prime?(n, primes) do 
      List.insert_at(primes, -1, n) # If it's a prime, push it at the end of our list
    else 
      primes # Otherwise just use the previous found primes
    end

    search(count, n+1, new_primes) # Loop until finished
  end

  # Tests current n against all provided primes
  defp is_prime?(n, primes) do
    primes
    |> Enum.all?(&(rem(n, &1)!=0)) # If all previous primes do not have a remainder of 0 it means it's a prime
  end
end
