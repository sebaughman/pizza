defmodule Pizza.Repo.Migrations.AddUniqueColumns do
  use Ecto.Migration

  def up do
    create unique_index(:pizzas, [:name])
    create unique_index(:toppings, [:name])
  end

  def down do
    drop unique_index(:pizzas, [:name])
    drop unique_index(:toppings, [:name])
  end
end
