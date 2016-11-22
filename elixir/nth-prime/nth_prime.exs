defmodule Prime do
  @first_prime 2

  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(count) when count == 0 do raise ArgumentError end
  def nth(count) do
    Stream.iterate(@first_prime+1, &(&1+2)) # Iterate over all odd numbers (skips calculation for even numbers since they're divisible by 2) 
    |> Enum.reduce_while([@first_prime], fn n, primes ->
      if length(primes) === count do  
        {:halt, primes} # If the number of primes found equal the requested count it means we have fulfilled out task
      else
        {:cont, if prime?(n, primes) do 
          List.insert_at(primes, -1, n) # If it's a prime, push it at the end of our list
        else 
          primes # Otherwise just use the previous found primes
        end}
      end
    end)
    |> List.last # Fetch the last found prime
  end

  # Tests current n against all provided primes
  defp prime?(n, primes) do
    # HORRIBLY naive approach: if for all previous primes "n" does not have a remainder of 0 it means it's a prime
    # There's probably some mathematic black magic that I could use but whatever
    Enum.all?(primes, &(rem(n, &1)!=0)) 
  end
end
