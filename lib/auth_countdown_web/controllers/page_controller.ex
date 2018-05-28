defmodule AuthCountdownWeb.PageController do
  use AuthCountdownWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
