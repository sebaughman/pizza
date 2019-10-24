defmodule Pizza.Repo.Migrations.AddPizzaToppingsTable do
  use Ecto.Migration

  def change do
    create table(:pizza_toppings) do
      add(:pizzas_id, references(:pizzas, on_delete: :delete_all))
      add(:toppings_id, references(:toppings, on_delete: :delete_all))
    end
  end
end
