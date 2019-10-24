defmodule Pizza.Resolvers.Toppings do
  import Ecto.Query

  alias Pizza.Repo
  alias Pizza.Models.Toppings

  def get_toppings() do
    Repo.all(Toppings)
  end

  def get_toppings(ids) when is_list(ids) do
    query = from(p in Toppings, where: p.id in ^ids)

    Repo.all(query)
  end

  def get_toppings(id) do
    case Repo.get(Toppings, id) do
      nil -> 
        {:error, "no topping with that id"}
      topping ->
        {:ok, topping}
    end
  end

  def create_topping(nil), do: {:error, "Must pass a name for the topping"}

  def create_topping(name) do
    changeset = Toppings.changeset(%Toppings{}, %{name: name})
    case Repo.insert(changeset) do
      {:ok, cs} ->
        {:ok, cs}
      {:error, _cs} -> 
        {:error, "Topping already created"}
    end
  end

  def delete_topping(id) do
    with {:ok, topping} <- get_toppings(id) do
      Repo.delete(topping)
    end
  end
end
