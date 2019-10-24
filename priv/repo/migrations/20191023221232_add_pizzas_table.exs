defmodule Pizza.Repo.Migrations.AddPizzasTable do
  use Ecto.Migration

  def change do
    create table(:pizzas) do
      add(:name, :string)

      timestamps()
    end
  end
end
