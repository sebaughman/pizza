defmodule Pizza.Models.PizzaToppings do
  use Pizza.Schema
  import Ecto.Changeset
  alias Pizza.Models.Toppings
  alias Pizza.Models.Pizzas


  schema "pizza_toppings" do
    field(:pizzas_id, :id)
    field(:toppings_id, :id)
  end

  def changeset(data, params \\ %{}) do
    data
    |> cast(params, [:pizzas_id, :toppings_id])
    |> validate_required([:pizzas_id, :toppings_id])
  end
end