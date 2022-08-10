defmodule HuntCutdown.Repo do
  use Ecto.Repo,
    otp_app: :hunt_cutdown,
    adapter: Ecto.Adapters.Postgres
end
