defmodule Problem22 do
  @moduledoc """
  Solution for Project Euler Problem 22:
  > Using names.txt (right click and 'Save Link/Target As...'), a 46K text file containing
  > over five-thousand first names, begin by sorting it into alphabetical order. Then
  > working out the alphabetical value for each name, multiply this value by its
  > alphabetical position in the list to obtain a name score.
  >
  > For example, when the list is sorted into alphabetical order, COLIN, which is worth
  > 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would obtain a
  > score of 938 × 53 = 49714.
  >
  > What is the total of all the name scores in the file?
  """

  @doc """
  Converts a name into a name score, using the formula S(**n**, **i**) = A(**n**) * **i**,
  where A(**n**) is the sum of the numerical value of the letters of **n** (ie. `a = 1`, `c = 3`, etc.)
  and **i** is the index of the name in a sorted list.

  This function assumes name is written in english, with no special characters.

  ## Examples
      iex> Problem22.get_name_score("COLIN", 938)
      49714
  """
  @spec get_name_score(String.t(), pos_integer) :: pos_integer
  def get_name_score(n, i) do
    letter_score =
      String.upcase(n)
      |> String.to_charlist()
      # Have to add 1 to offset ?A - ?A = 0
      |> Enum.reduce(0, &(&2 + (&1 - ?A + 1)))

    letter_score * i
  end

  @doc """
  Gets the total of all name scores in the given file.
  """
  @spec solution(String.t()) :: pos_integer
  def solution(filename \\ "input_files/p022_names.txt") do
    File.read!(Path.relative_to_cwd(filename) |> Path.expand())
    |> String.replace("\"", "")
    |> String.split(",")
    |> Enum.sort()
    |> Enum.to_list()
    |> Stream.with_index(1)
    |> Stream.map(&get_name_score(elem(&1, 0), elem(&1, 1)))
    |> Enum.sum()
  end
end
