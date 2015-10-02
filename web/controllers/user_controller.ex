defmodule Rumbl.UserController do
  use Rumbl.Web, :controller
  alias Rumbl.User

  plug :authenticate when action in [:show, :index]

  def index(conn, _params) do
    users = Repo.all User
    conn
    |> render "index.html", users: users
  end

  def show(conn, %{"id" => id}) do
    user = Repo.get User, id
    conn
    |> render "show.html", user: user
  end

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    conn
    |> render "new.html", changeset: changeset
  end

  def create(conn, %{"user" => user_params}) do
    changeset = User.registration_changeset(%User{}, user_params)
    case Repo.insert(changeset) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "#{user.username} created!")
        |> Rumbl.Auth.login(user)
        |> redirect(to: user_path(conn, :index))
      {:error, changeset} ->
        conn
        |> render("new.html", changeset: changeset)
    end
  end

  defp authenticate(conn, _opts) do
    if conn.assigns.current_user do
      conn
    else
      conn
      |> put_flash(:error, "You must be logged in to access that page!")
      |> redirect(to: page_path(conn, :index))
      |> halt()
    end
  end
end
