defmodule TodosWeb.UserController do
  use TodosWeb, :controller

  plug TodosWeb.Plugs.AuthenticateUser when action not in [:index]

  alias Todos.Repo
  alias Todos.User

  def index(conn, _params) do
    users = Repo.all(User)
    render conn, "index.html", users: users
  end

  def show(conn, %{"id" => id}) do
    user = Repo.get!(User, id)
    render conn, "show.html", user: user
  end
end
