# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :test_api_phoenix,
  ecto_repos: [TestApiPhoenix.Repo]

# Configures the endpoint
config :test_api_phoenix, TestApiPhoenixWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "dEb3/Dkop+06vOEKV7xP6dtUUZaUTSaZheFsUzuuSrbMM1qjCCDgtG6MJ2vYhzix",
  render_errors: [view: TestApiPhoenixWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: TestApiPhoenix.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "ikXViWlv"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
