import Config

# Do not print debug messages in production
config :logger, level: :info

# Runtime production configuration, including reading
# of environment variables, is done on config/runtime.exs.

config :terraloc, TerralocWeb.Endpoint,
  http: [port: {:system, "PORT"}],
  url: [host: System.get_env("APP_NAME") <> ".gigalixirapp.com", port: 443],
  secret_key_base: Map.fetch!(System.get_env(), "SECRET_KEY_BASE"),
  server: true

config :terraloc, Terraloc.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("DATABASE_URL"),
  ssl: true,
  # Free tier db only allows 4 connections. Rolling deploys need pool_size*(n+1)
  # connections where n is the number of app replicas.
  pool_size: 2
