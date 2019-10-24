defmodule Pizza.Controllers.Toppings do
  alias Pizza.Resolvers.Toppings


  def index(_args, _info) do
    {:ok, Toppings.get_toppings()}
  end

  def create(args, _info) do
    Toppings.create_topping(args)
  end

  def delete(%{id: id}, _info) do
    Toppings.delete_topping(id)
  end
end