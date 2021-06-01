defmodule CoronaVaccRegWeb.PageLive do
  use CoronaVaccRegWeb, :live_view

  @impl true
  def mount(params, _session, socket) do
    {:ok, assign(socket, params: params)}
  end
end
