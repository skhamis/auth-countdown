defmodule AuthCountdownWeb.Router do
  use AuthCountdownWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", AuthCountdownWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/events", EventController 
  end

  # Other scopes may use custom stacks.
  # scope "/api", AuthCountdownWeb do
  #   pipe_through :api
  # end
end
