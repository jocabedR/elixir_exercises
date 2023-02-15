# each, map, reduce, zip, zip_with

defmodule MyList do
  def each([], _), do: :ok
  def each([h | t], fun) do
    fun.(h)
    each(t, fun)
  end

  def map([], _), do: []
  def map([h | t], fun), do: [fun.(h) | map(t, fun)]

  def reduce([h | t], fun), do: reduce(t, h, fun)
  def reduce([], acc, _), do: acc
  def reduce([h | t], acc, fun), do: reduce(t, fun.(h, acc), fun)

  def zip([], _), do: []
  def zip(_, []), do: []
  def zip([h1 | t1], [h2 | t2]), do: [{h1,h2} | zip(t1, t2)]

  def zip_with([], _, _), do: []
  def zip_with(_, [], _), do: []
  def zip_with([xh | xt], [yh | yt], fun), do: [fun.(xh, yh) | zip_with(xt, yt, fun)]
end

# elixirc MyList.ex

# iex(1)> Enum.each(["some", "example"], fn x -> IO.puts(x) end)
# some
# example
# :ok
# iex(2)> MyList.each(["some", "example"], fn x -> IO.puts(x) end)
# some
# example
# :ok
# iex(3)> Enum.map([1, 2, 3], fn x -> x * 2 end)
# [2, 4, 6]
# iex(4)> MyList.map([1, 2, 3], fn x -> x * 2 end)
# [2, 4, 6]
# iex(5)> Enum.reduce([1, 2, 3], 0, fn x, acc -> x + acc end)
# 6
# iex(6)> MyList.reduce([1, 2, 3], 0, fn x, acc -> x + acc end)
# 6
# iex(7)> Enum.zip(["Agus", "Caleb", "Joca"], [:senior, :junior, :beginner])
# [{"Agus", :senior}, {"Caleb", :junior}, {"Joca", :beginner}]
# iex(8)> MyList.zip(["Agus", "Caleb", "Joca"], [:senior, :junior, :beginner])
# [{"Agus", :senior}, {"Caleb", :junior}, {"Joca", :beginner}]
# iex(9)> Enum.zip_with([1, 2, 5, 6], [3, 4], fn x, y -> x + y end)
# [4, 6]
# iex(10)> MyList.zip_with([1, 2, 5, 6], [3, 4], fn x, y -> x + y end)
# [4, 6]
