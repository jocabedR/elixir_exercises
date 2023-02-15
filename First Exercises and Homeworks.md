## Class exercises

1.
```markdown
iex> Enum.map(["Joca", "Mish Tata", "Puguie", "Haru"], fn x -> "Hola "<> x end)
["Hola Joca", "Hola Mish Tata", "Hola Puguie", "Hola Haru"]
```
2.
```markdown
[1, 2, 3, 4, 5] |> Enum.map(fn x-> rem(x,2) == 0 end)               1, 2, 3, 4, 5] |> Enum.map(fn x-> rem(x,2) == 0 end)               m 
[false, true, false, true, false]
iex(18)> 
```
3.
```markdown
iex> [1, 2, 3, 4, 5] |> Enum.map(even)                    
[false, true, false, true, false]
```
4.
```markdown
iex> defmodule Geometry do
...()>  def area(:rectangle, base, height) do
...()>   base * height
...()>  end
...()>  
...()>  def area(:cicle, radius) do
...()>   3.14 * radius * radius
...()>  end
...()> 
...()>  def area(:triangle, base, height) do
...()>   base * height / 2
...()>  end
...()> end
```

## Homework 1: 
 Example Enum.map():
 ```markdown
  defmodule Factorial do
    def factorial(0) do   
      1
    end
 
    def factorial(x) when x > 0 do
      x * factorial(x-1)
    end
  end
  ```
  
  ```markdown
  iex> [1,2,3,4,5] |> Enum.map(fn x -> Factorial.factorial(x) end)
  [1, 2, 6, 24, 120]
  ```
  
 Example Enum.filter():
 ```markdown
  iex>[1,2,3,4,5] |> Enum.filter(fn x -> x*10 < Factorial.factorial(x) end)
  [5]
  ```
  
  ```markdown
  iex><pre>[1,2,3,4,5] |&gt; Enum.filter(fn x -&gt; x*10 &gt; Factorial.factorial(x) end)
  ```
  
 Example Enum.all?():
   ```markdown
  iex> [1,2,3,4,5] |> Enm.all?(fn x -> rem(Factorial.factorial(x),2)==1 end)  
  false
    ```
 
   ```markdown
  iex> [1,2,3,4,5] |> Enum.all?(fn x -> x > 0 end)                           
  true
   ```

 Example Enum.zip()
 zip/1
   ```markdown
  iex(54)> Enum.zip(["Agus", "Caleb", "Joca"], [:senior, :junior, :beginner])              
  [{"Agus", :senior}, {"Caleb", :junior}, {"Joca", :beginner}]  
  ```

  zip/2
  ```markdown
  iex> x = 100
  100
  iex> y = 100
  100
  iex> z = 100
  100
  iex> Enum.zip([[1, 2, 3], [:a, :b, :c], ["foo", "bar", "baz"], [x, y, z, 19, 16, 3]])
  [{1, :a, "foo", 100}, {2, :b, "bar", 100}, {3, :c, "baz", 100}]
    ```

## Exercice Enum.reduce(), if:

  ```markdown
productos = [
  %{ producto: "chocolate", precio: 5},
  %{ producto: "chicle", precio: 1},
  %{ producto: "mazapan", precio: 8},
  %{ producto: "paleta tupsi", precio: 4}
]  ```

Obtain the total sum of the price of the products.

  ```markdown
iex> Enum.map(productos, fn x -> x.precio end) |> Enum.reduce(fn x, acc -> acc + x end)
18
  ```

## Homework 2 (Enum y Map): 

If: 
  ```markdown
tax_rates = %{NC: 0.075, TX: 0.08}
	
orders = [
	%{id: 123, ship_to: :NC, net_amount: 100.00},
	%{id: 124, ship_to: :OK, net_amount: 35.50},
	%{id: 125, ship_to: :TX, net_amount: 24.00},
	%{id: 126, ship_to: :TX, net_amount: 44.00},
	%{id: 127, ship_to: :NC, net_amount: 25.00},
	%{id: 128, ship_to: :MA, net_amount: 10.00},
	%{id: 129, ship_to: :CA, net_amount: 102.00},
	%{id: 120, ship_to: :NC, net_amount: 50.00}
]
  ```

Create a Module that has a function that receives the 2 lists and returns a copy of the orders with an extra field (total_amount) which is the net price plus tax.

  ```markdown
iex> defmodule Total do                                                                                                        
...()> def totalAmount(ts, os) do
...()> Enum.map(os, fn o -> Map.put(o, :total_amount, o.net_amount + (o.net_amount * Map.get(ts, o.ship_to, 0))) end)     
...()> end
...()> end

iex> Total.totalAmount(tax_rates, orders)
[
  %{id: 123, net_amount: 100.0, ship_to: :NC, total_amount: 107.5},
  %{id: 124, net_amount: 35.5, ship_to: :OK, total_amount: 35.5},
  %{id: 125, net_amount: 24.0, ship_to: :TX, total_amount: 25.92},
  %{id: 126, net_amount: 44.0, ship_to: :TX, total_amount: 47.52},
  %{id: 127, net_amount: 25.0, ship_to: :NC, total_amount: 26.875},
  %{id: 128, net_amount: 10.0, ship_to: :MA, total_amount: 10.0},
  %{id: 129, net_amount: 102.0, ship_to: :CA, total_amount: 102.0},
  %{id: 120, net_amount: 50.0, ship_to: :NC, total_amount: 53.75}
]
  ```

##Homework 3 (FizzBuzz):
  ```markdown
iex> defmodule FizzBuzz do
...()>  def fizzBuzz(1), do: "#{1}"
...()> 
...()>  def fizzBuzz(x) do
...()>   if rem(x,3) == 0 do
...()>     if rem(x,5) == 0 do 
...()>      fizzBuzz(x-1) <> ", " <> "FizzBuzz"
...()>     else
...()>      fizzBuzz(x-1) <> ", " <> "Fizz"
...()>     end
...()>   else 
...()>    if rem(x,3) == 0 do
...()>     fizzBuzz(x-1) <> ", " <> "Buzz"
...()>    else 
...()>     fizzBuzz(x-1) <> ", " <> "#{x}"
...()>    end
...()>   end
...()>  end
...()> end

iex> FizzBuzz.fizzBuzz(16)
"1, 2, Fizz, 4, 5, Fizz, 7, 8, Fizz, 10, 11, Fizz, 13, 14, FizzBuzz, 16"
  ```
