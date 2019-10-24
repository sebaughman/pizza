defmodule Pizza.Resolvers.PizzaToppings do
  import Ecto.Changeset
  import Ecto.Query

  alias Pizza.Repo
  alias Pizza.Models.Pizzas
  alias Pizza.Resolvers.Toppings
  alias Pizza.Models.PizzaToppings


  def get_pizza_toppings(pizza_id) do
    case Repo.get(Pizzas, pizza_id) do
      nil -> 
        {:error, "no pizza with that id"}
      pizza ->
        pizza_toppings = Repo.preload(pizza, :toppings)
        {:ok, pizza_toppings.toppings}
    end
  end

  def add_topping(pizza_id, topping_id) do
    changeset = 
      %PizzaToppings{} 
      |> PizzaToppings.changeset(%{pizzas_id: pizza_id, toppings_id: topping_id})
      
    case find_topping(pizza_id, topping_id) do
      nil ->
        Repo.insert(changeset)
      topping -> 
        {:error, "Topping already added"}
    end
  end

  def remove_topping(pizza_id, topping_id) do
    find_topping(pizza_id, topping_id)
     |> Repo.delete() 
  end

  defp find_topping(pizza_id, topping_id) do
    query = from(pt in PizzaToppings, where: pt.pizzas_id == ^pizza_id and pt.toppings_id == ^topping_id)
    Repo.one(query)
  end
end
