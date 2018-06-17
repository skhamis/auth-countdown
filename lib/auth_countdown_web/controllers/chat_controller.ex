defmodule AuthCountdownWeb.ChatController do
  use AuthCountdownWeb, :controller

  def index(conn, _params) do
    render conn, "index.html", current_user: nil
  end
end