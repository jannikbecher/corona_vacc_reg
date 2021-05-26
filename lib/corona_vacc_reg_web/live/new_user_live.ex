defmodule CoronaVaccRegWeb.NewUserLive do
  use CoronaVaccRegWeb, :live_view
  alias CoronaVaccReg.Appointment
  alias CoronaVaccReg.Appointment.User

  @impl true
  def mount(_params, _session, socket) do
    cset = User.changeset(%User{})
    {:ok, assign(socket, changeset: cset)}
  end

  @impl true
  def handle_event("validate", %{"user" => params}, socket) do
    cset =
      %User{}
      |> Appointment.change_user(params)
      |> Map.put(:action, :insert)

    {:noreply, assign(socket, changeset: cset)}
  end

  @impl true
  def handle_event("submit", %{"user" => params}, socket) do
    case Appointment.create_user(params) do
      {:ok, user} ->
        #TODO: send email
        {:noreply, redirect(socket, to: Routes.live_path(socket, CoronaVaccRegWeb.PageLive, user: params))}
      {:error, %Ecto.Changeset{} = cset} ->
        {:noreply, assign(socket, changeset: cset)}
    end
  end
end
