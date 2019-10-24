defmodule Pizza.Resolvers.Pizzas do
  import Ecto.Changeset
  import Ecto.Query

  alias Pizza.Repo
  alias Pizza.Models.Pizzas
  alias Pizza.Resolvers.Toppings


  def get_pizzas() do
    Repo.all(Pizzas)
  end

  def get_pizzas(%{id: id}) do
    Repo.get(Pizzas, id)
  end

  def create_pizza(name, topping_ids) when is_list(topping_ids) do
    case Toppings.get_toppings(topping_ids) do
      [] -> 
        {:error, "No toppings with that id"}
      toppings -> 
        %Pizzas{}
        |> Repo.preload(:toppings)
        |> Pizzas.changeset(%{name: name})
        |> put_assoc(:toppings, toppings)
        |> Repo.insert()
    end   
  end

  def create_pizza(nil, _product_ids), do: {:error, "must supply a pizza name"}
  def create_pizza(_name, nil), do: {:error, "must supply at least one topping"}
  def create_pizza(name, topping_id), do: create_pizza(name, [topping_id])

  def delete_pizza(id) do
    case Repo.get(Pizzas, id) do
      nil -> 
        {:error, "no pizza with that id"}
      pizza ->
        Repo.delete(pizza)
    end
  end
  
end
