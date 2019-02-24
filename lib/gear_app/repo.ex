defmodule GearApp.Repo do
  use Ecto.Repo,
    otp_app: :gear_app,
    adapter: Ecto.Adapters.Postgres
end
