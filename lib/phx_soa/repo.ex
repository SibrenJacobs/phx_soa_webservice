defmodule PhxSoa.Repo do
  use Ecto.Repo,
    otp_app: :phx_soa,
    adapter: Ecto.Adapters.Postgres
end
