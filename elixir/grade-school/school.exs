defmodule School do
  @moduledoc """
  Simulate students in a school.

  Each student is in a grade.
  """

  @doc """
  Add a student to a particular grade in school.
  """
  @spec add(map, String.t, integer) :: map
  def add(db, name, grade) do
    students = db 
    |> Map.get(grade, []) 
    |> List.insert_at(-1, name)
    
    Map.put(db, grade, students)
  end

  @doc """
  Return the names of the students in a particular grade.
  """
  @spec grade(map, integer) :: [String.t]
  def grade(db, grade) do
    db 
    |> Map.get(grade, [])
  end

  @doc """
  Sorts the school by grade and name.
  """
  @spec sort(map) :: [{integer, [String.t]}]
  def sort(db) do
    db 
    |> Map.keys
    |> Enum.sort
    |> Enum.reduce([], fn grade, acc ->
      data = {grade, Map.get(db, grade) |> Enum.sort}
      List.insert_at(acc, -1, data)
    end)
  end
end
