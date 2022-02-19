import Config

# Only in tests, remove the complexity from the password hashing algorithm
config :bcrypt_elixir, :log_rounds, 1

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :mylibrary, Mylibrary.Repo,
  username: System.get_env("PGUSER"),
  password: System.get_env("PGPASSWORD"),
  hostname: System.get_env("PGHOST"),
  database: System.get_env("PGDATABASE_TEST"),
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10")

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :mylibrary, MylibraryWeb.Endpoint,
  http: [ip: {0, 0, 0, 0}, port: 4002],
  secret_key_base: "btB+1cJA8EJHyxJ48zxyVLn4owc7WbNqExlz0iL4nvn0t8zVrZprGUDjasNpPTis",
  server: false

# In test we don't send emails.
config :mylibrary, Mylibrary.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
