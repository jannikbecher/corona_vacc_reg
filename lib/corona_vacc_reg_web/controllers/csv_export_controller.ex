defmodule CoronaVaccRegWeb.CsvExportController do
  use CoronaVaccRegWeb, :controller

  alias CoronaVaccReg.Appointment
  alias CoronaVaccReg.Appointment.User

  def export(conn, _params) do
    users = Appointment.list_users()
    conn
    |> put_resp_content_type("text/csv")
    |> put_resp_header("content-disposition", "attachment; filename=\"download.csv\"")
    |> send_resp(200, to_csv(users))
  end

  def to_csv(users) do
    users
    |> Stream.map(&[&1.inserted_at, &1.first_name, &1.last_name, &1.birthdate, &1.doctor, &1.email, &1.mobile])
    |> CSV.encode()
    |> Enum.sort()
    |> Enum.to_list()
    |> to_string()
  end
end
