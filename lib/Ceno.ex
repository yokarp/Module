#LLama de manera asincrona y en orden los procesos, esto hace que corra a velocidades
#magistrales.
defmodule Ceno do
  def map([], _func)do
    []
  end

  def map([head | tail], func) do
    [func.(head) | map(tail, func)]
  end

  def pmap(collection, func) do
    collection |> spawn_children(func) |> collect_result
  end

  def spawn_children(collection, func) do
    map collection, fn element -> spawn(__MODULE__, :child, [element, func, self]) end
  end
  def child(element, func, parent) do
    send parent, {self, func.(element)}
  end

  def collect_result(pids) do
    map pids, fn pid -> receive do: ({^pid, value} -> value) end
  end

end
