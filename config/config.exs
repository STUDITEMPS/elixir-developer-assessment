# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :yp_email_offers,
  namespace: YPEmailOffers,
  ecto_repos: [YPEmailOffers.Repo],
  generators: [binary_id: true]

config :yp_email_offers, YPEmailOffers.Repo,
  migration_primary_key: [name: :id, type: :binary_id],
  migration_foreign_key: [column: :id, type: :binary_id]

# Configures the endpoint
config :yp_email_offers, YPEmailOffersWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: YPEmailOffersWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: YPEmailOffers.PubSub,
  live_view: [signing_salt: "Z2CUE3Eu"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :yp_email_offers, YPEmailOffers.Mailer, adapter: Swoosh.Adapters.Local

# Swoosh API client is needed for adapters other than SMTP.
config :swoosh, :api_client, false

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.14.0",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Use Hackney as the default adapter for tesla
config :tesla, adapter: Tesla.Adapter.Hackney

# Use Oban for Background Jobs
config :yp_email_offers, Oban,
  repo: YPEmailOffers.Repo,
  timezone: "Europe/Berlin"

# plugins: [{Oban.Plugins.Cron, crontab: []}]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
