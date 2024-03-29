defmodule Pizza.Resolvers.Pizzas do
  import Ecto.Changeset
  import Ecto.Query

  alias Pizza.Repo
  alias Pizza.Models.Pizzas
  alias Pizza.Resolvers.Toppings


  def get_pizzas() do
   {:ok, Repo.all(Pizzas)}
  end

  def get_pizzas(id) do
    case Repo.get(Pizzas, id) do
      nil -> 
        {:error, "no pizza with that id"}
      pizza ->
        {:ok, pizza}
    end
  end

  def update_pizza(nil, _name), do: {:error, "Must pass id to update"}
  def update_pizza(_id, nil), do: {:error, "Name can not be nil"}

  def update_pizza(id, name) do
    with {:ok, pizza} <- get_pizzas(id) do
      changeset = Pizzas.changeset(pizza, %{id: id, name: name})
      case Repo.update(changeset) do
        {:ok, cs} ->
          {:ok, cs}
        {:error, _cs} -> 
          {:error, "Pizza name already taken"}
      end
    end
  end

  def create_pizza("", _topping_ids), do: {:error, "must supply a pizza name"}
  def create_pizza(nil, _topping_ids), do: {:error, "must supply a pizza name"}
  def create_pizza(_name, []), do: {:error, "must supply at least one topping"}

  def create_pizza(name, topping_ids) when is_list(topping_ids) do
    case Toppings.get_toppings(topping_ids) do
      {:ok, []} -> 
        {:error, "No toppings with that id"}
      {:ok, toppings} -> 
        %Pizzas{}
        |> Repo.preload(:toppings)
        |> Pizzas.changeset(%{name: name})
        |> put_assoc(:toppings, toppings)
        |> insert_pizza()
    end   
  end
  def create_pizza(name, topping_id), do: create_pizza(name, [topping_id])

  def insert_pizza(changeset) do
    case Repo.insert(changeset) do
      {:ok, cs} ->
        {:ok, cs}
      {:error, _cs} -> 
        {:error, "Pizza already created with that name"}
    end
  end

  def delete_pizza(id) do
    with {:ok, pizza} <- get_pizzas(id) do
      Repo.delete(pizza)
    end
  end
  
end
