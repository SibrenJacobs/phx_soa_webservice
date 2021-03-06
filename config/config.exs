# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :phx_soa,
  ecto_repos: [PhxSoa.Repo]

# Configures the endpoint
config :phx_soa, PhxSoaWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Ppr5SKtSTCo24OH0hY1gwELqQpO3okTqDuU/DQ/ho8s+ncGvjrUR2JGohRfmGo9I",
  render_errors: [view: PhxSoaWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhxSoa.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "P5DBcHFf"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
