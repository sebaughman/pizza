# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :pizza,
  ecto_repos: [Pizza.Repo]

# Configures the endpoint
config :pizza, PizzaWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Cc0rE7DcT4oaGm2EzJ+qKKUob28q5K0+i65KKvZzIGU68pOOt26DXgz/UC6PC/DG",
  render_errors: [view: PizzaWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Pizza.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

config :pizza, Pizza.Repo,
  username: "postgres",
  password: "",
  database: "pizza_dev",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
