defmodule Pizza.Controllers.Pizzas do
  alias Pizza.Resolvers.Pizzas

  def index(_args, _info) do
    {:ok, Pizzas.get_pizzas()}
  end

  def create(%{topping_ids: topping_ids, name: name}, _info) do
    Pizzas.create_pizza(name, topping_ids)
  end

  def delete(%{id: id}, _info) do
    Pizzas.delete_pizza(id)
  end
end