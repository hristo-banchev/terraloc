# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :terraloc,
  ecto_repos: [Terraloc.Repo]

config :terraloc, :generators, api_prefix: "/api/v1"

# Configures the endpoint
config :terraloc, TerralocWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [
    formats: [json: TerralocWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: Terraloc.PubSub,
  live_view: [signing_salt: "HdMsT3mh"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
