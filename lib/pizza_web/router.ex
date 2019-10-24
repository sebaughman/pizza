defmodule PizzaWeb.Router do
  use PizzaWeb, :router

  # pipeline :api do
  #   plug :accepts, ["json"]
  # end

  # scope "/api", PizzaWeb do
  #   pipe_through :api
    
  # end

  scope "/api" do
    pipe_through(:api)

    forward("/graphiql", Absinthe.Plug.GraphiQL, schema: Graphql.Schema)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end


end
