# Pizza

Graphql API for making topping and pizzas

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * If you want some premade toppings run `mix run priv/repo/seeds.exs`
  * Start Phoenix endpoint with `mix phx.server`
  * Accessible through URI: http://localhost:4000/api/graphql
  * Accessible through graphiql: http://localhost:4000/api/graphiql

## API

### Pizzas
  * create pizzas with a name and topping ids (can't create pizzas with the same name)
  * update pizza name
  * delete pizza

### Toppings
  * create topping with name (can't create toppings with the same name)
  * update topping name
  * delete topping (will remove from all pizzas)

### PizzaToppings
  * get all toppings on a pizza with id
  * add topping to pizza (can not add same topping twice)
  * remove topping from pizza