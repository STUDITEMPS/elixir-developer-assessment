import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :yp_email_offers, YPEmailOffers.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "yp_email_offers_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :yp_email_offers, YPEmailOffersWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "QNUVuQIC6t09msVUJKE/pdDWYjN0F4rwngqF34E6Se0dj+DD150r8I3/9H2rke1L",
  server: false

# In test we don't send emails.
config :yp_email_offers, YPEmailOffers.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

# Config tesla to use the Mock Adapter for tests
config :tesla, adapter: Tesla.Mock
