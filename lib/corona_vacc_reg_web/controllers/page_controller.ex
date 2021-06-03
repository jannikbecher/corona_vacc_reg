defmodule CoronaVaccRegWeb.PageController do
  use CoronaVaccRegWeb, :controller

  def impressum(conn, _params) do
    render(conn, "impressum.html")
  end

  def datenschutz(conn, _params) do
    render(conn, "datenschutz.html")
  end
end
