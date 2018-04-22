# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :backend,
  ecto_repos: [Backend.Repo]

# Configures the endpoint
config :backend, BackendWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "0G7Rhy5fohiIdcfgol2TfwZK79ebqLmWYTDFzfaOczOfW+bDIzQsJCQC+Tiyiwce",
  render_errors: [view: BackendWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Backend.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :arc,
  storage: Arc.Storage.S3, # or Arc.Storage.Local
  bucket: {:system, "BRONCOHACK_AWS_S3_BUCKET"} # if using Amazon S3

config :ex_aws,
  access_key_id: [{:system, "BRONCOHACKAWS_PUBLIC"}, :instance_role],
  secret_access_key: [{:system, "BRONCOHACKAWS_SECRET"}, :instance_role]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
