defmodule AuthCountdownWeb.RoomChannel do
  use Phoenix.Channel

  def join("room:lobby", _message, socket) do
    {:ok, socket}
  end

  def handle_in("new_msg", payload, socket) do
    broadcast! socket, "new_msg", payload
    {:noreply, socket}
  end
end