defmodule Pizza.Models.Pizzas do
  use Pizza.Schema
  import Ecto.Changeset
  alias Pizza.Models.Toppings


  schema "pizzas" do
    field(:name, :string)
    many_to_many(:toppings, Toppings, join_through: "pizza_toppings")

    timestamps()
  end

  def changeset(data, params \\ %{}) do
    data
    |> cast(params, [:name])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end
end