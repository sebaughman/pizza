defmodule Pizza.Models.Toppings do
  use Pizza.Schema
  import Ecto.Changeset

  alias Pizza.Models.Pizzas

  schema "toppings" do
    field(:name, :string)
    many_to_many(:pizzas, Pizzas, join_through: "pizza_toppings")

    timestamps()
  end

  def changeset(data, params \\ %{}) do
    data
    |> cast(params, [:name])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end
end