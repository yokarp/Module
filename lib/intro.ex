defmodule Intro do

  def hello do
    "Hello"
  end

  def hello_person("Ophelia") do
    "Hooollllaaa care culo de Ophelia"
  end

  def hello_person(name) when is_binary(name) do
    "Hola #{name}"
  end

  def number(x) when x > 0 do
    "#{x} es positivo"
  end

end

