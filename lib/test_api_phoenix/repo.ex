defmodule TestApiPhoenix.Repo do
  use Ecto.Repo,
    otp_app: :test_api_phoenix,
    adapter: Ecto.Adapters.Postgres
end
