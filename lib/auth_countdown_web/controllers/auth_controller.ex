defmodule AuthCountdownWeb.AuthController do
  use AuthCountdownWeb, :controller
  alias AuthCountdownWeb.Router.Helpers
  require Logger

  plug Ueberauth

  alias Ueberauth.Strategy.Helpers

  def logout(conn, _params) do
    Logger.warn "logged out"
    conn
    |> put_flash(:info, "You have been logged out!")
    |> configure_session(drop: true)
    |> redirect(to: "/")
  end

  def callback(%{assigns: %{ueberauth_failure: _fails}} = conn, _params) do
    Logger.warn "failed callback"
    conn
    |> put_flash(:error, "Failed to authenticate.")
    |> redirect(to: "/")
  end

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    Logger.warn "warning"
    case UserFromAuth.find_or_create(auth) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "Successfully authenticated as " <> user.name <> ".")
        |> put_session(:current_user, user)
        |> redirect(to: "/")
      {:error, reason} ->
        conn
        |> put_flash(:error, reason)
        |> redirect(to: "/")
    end
  end
end