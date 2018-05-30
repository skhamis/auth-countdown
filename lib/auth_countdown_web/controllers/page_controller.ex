defmodule AuthCountdownWeb.PageController do
  use AuthCountdownWeb, :controller
  require Logger
  
  alias AuthCountdown.Events 

  def index(conn, _params) do
    events = Events.list_future_events()
    render conn, "index.html", events: events, current_user: get_session(conn, :current_user)
  end
end
