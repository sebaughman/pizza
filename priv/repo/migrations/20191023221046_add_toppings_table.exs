defmodule Pizza.Repo.Migrations.AddToppingsTable do
  use Ecto.Migration

  def change do
    create table(:toppings) do
      add(:name, :string)

      timestamps()
    end
  end
end
