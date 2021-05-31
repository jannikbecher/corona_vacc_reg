# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :corona_vacc_reg,
  ecto_repos: [CoronaVaccReg.Repo]

# Configures the endpoint
config :corona_vacc_reg, CoronaVaccRegWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "8fWGW/gFi/E/LrQjLaI3wDujhNFBRK/w3oMyXZpbNqzt8vJoHNQv+H7p7BlyHjd8",
  render_errors: [view: CoronaVaccRegWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: CoronaVaccReg.PubSub,
  live_view: [signing_salt: "oGWKDibF"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
