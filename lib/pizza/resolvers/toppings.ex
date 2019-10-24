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

  def get_toppings(%{id: id}) do
    Repo.get(Toppings, id)
  end

  def create_topping(params) do
    Toppings.changeset(%Toppings{}, params)
    |> Repo.insert()
  end

  def delete_topping(id) do
    case Repo.get(Toppings, id) do
      nil -> 
        {:error, "no topping with that id"}
      topping ->
        Repo.delete(topping)
    end
  end
end
