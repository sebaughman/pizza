defmodule Graphql.Schema do
  use Absinthe.Schema
  import_types(Graphql.Schema.Types)

  query do

    field :pizzas, list_of(:pizza) do
      arg(:id, :id)
      resolve(&Pizza.Controllers.Pizzas.index/2)
    end

    field :toppings, list_of(:topping) do
      arg(:id, :id)
      resolve(&Pizza.Controllers.Toppings.index/2)
    end

    field :pizza_toppings, list_of(:topping) do
      arg(:pizza_id, :id)
      resolve(&Pizza.Controllers.PizzaToppings.index/2)
    end
  end

  mutation do
    field :create_pizza, :pizza do
      arg(:name, non_null(:string))
      arg(:topping_ids, list_of(:id))

      resolve(&Pizza.Controllers.Pizzas.create/2)
    end

    field :update_pizza, :pizza do
      arg(:id, non_null(:id))
      arg(:name, :string)

      resolve(&Pizza.Controllers.Pizzas.update/2)
    end

    field :delete_pizza, :pizza do
      arg(:id, non_null(:id))

      resolve(&Pizza.Controllers.Pizzas.delete/2)
    end

    field :create_topping, :topping do
      arg(:name, non_null(:string))

      resolve(&Pizza.Controllers.Toppings.create/2)
    end

    field :update_topping, :topping do
      arg(:id, non_null(:id))
      arg(:name, non_null(:string))

      resolve(&Pizza.Controllers.Toppings.update/2)
    end

    field :delete_topping, :topping do
      arg(:id, non_null(:id))

      resolve(&Pizza.Controllers.Toppings.delete/2)
    end

    field :add_topping, :topping do
      arg(:pizza_id, non_null(:id))
      arg(:topping_id, non_null(:id))

      resolve(&Pizza.Controllers.PizzaToppings.create/2)
    end

    field :remove_topping, :topping do
      arg(:pizza_id, non_null(:id))
      arg(:topping_id, non_null(:id))

      resolve(&Pizza.Controllers.PizzaToppings.delete/2)
    end
  end
end