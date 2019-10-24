defmodule Pizza.Controllers.PizzaToppings do
  alias Pizza.Resolvers.PizzaToppings

  def index(%{pizza_id: pizza_id}, _info) do
    PizzaToppings.get_pizza_toppings(pizza_id)
  end

  def create(%{pizza_id: pizza_id, topping_id: topping_id}, _info) do
    PizzaToppings.add_topping(pizza_id, topping_id)
  end

  def delete(%{pizza_id: pizza_id, topping_id: topping_id}, _info) do
    PizzaToppings.remove_topping(pizza_id, topping_id)
  end
end