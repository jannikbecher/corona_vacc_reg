defmodule CoronaVaccReg.Repo do
  use Ecto.Repo,
    otp_app: :corona_vacc_reg,
    adapter: Ecto.Adapters.Postgres
end
