defmodule Terraloc.Repo do
  use Ecto.Repo,
    otp_app: :terraloc,
    adapter: Ecto.Adapters.Postgres
end
