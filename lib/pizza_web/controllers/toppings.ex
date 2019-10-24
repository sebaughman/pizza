defmodule Pizza.Controllers.Toppings do
  alias Pizza.Resolvers.Toppings


  def index(_args, _info) do
    Toppings.get_toppings()
  end

  def create(%{name: name}, _info) do
    Toppings.create_topping(name)
  end

  def delete(%{id: id}, _info) do
    Toppings.delete_topping(id)
  end
end