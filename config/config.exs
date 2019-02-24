# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :gear_app,
  ecto_repos: [GearApp.Repo]

# Configures the endpoint
config :gear_app, GearAppWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "PqsY0zRrRJprkbXEPPQ8S8dnERMjDQBBD77zNRHFnm/XV07CDCQYWQrl7TxyjX+e",
  render_errors: [view: GearAppWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: GearApp.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
