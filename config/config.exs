# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :auth_countdown,
  ecto_repos: [AuthCountdown.Repo]

# Configures the endpoint
config :auth_countdown, AuthCountdownWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "2LACWAkMsxF5WeffvHBX/DhF2dSmInTTv9qvDkTI+WLZlIii0nva5xAUXiHozoHX",
  render_errors: [view: AuthCountdownWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: AuthCountdown.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Ueberauth
config :ueberauth, Ueberauth,
  providers: [
    auth0: { Ueberauth.Strategy.Auth0, []},
  ]

# Configures Auth0 provider for Ueberauth
config :ueberauth, Ueberauth.Strategy.Auth0.OAuth,
  domain: Application.get_env(:auth_countdown, :auth0_domain),
  client_id: Application.get_env(:auth_countdown, :auth0_client_key),
  client_secret: Application.get_env(:auth_countdown,:auth0_client_secret)

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
