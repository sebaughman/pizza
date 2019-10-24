defmodule Graphql.Schema.Types do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: Pizza.Repo

  object :pizza do
    field(:id, :id)
    field(:name, :string)
    field(:toppings, list_of(:topping), resolve: assoc(:toppings))
  end

  object :topping do
    field(:id, :id)
    field(:name, :string)
    field(:pizzas, list_of(:pizza), resolve: assoc(:pizzas))
  end
end
