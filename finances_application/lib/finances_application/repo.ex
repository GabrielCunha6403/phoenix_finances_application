defmodule FinancesApplication.Repo do
  use Ecto.Repo,
    otp_app: :finances_application,
    adapter: Ecto.Adapters.Postgres
end
