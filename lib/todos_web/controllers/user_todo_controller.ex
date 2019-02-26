defmodule TodosWeb.UserTodoController do
  use TodosWeb, :controller

  alias Todos.{User,Repo}

  plug :authorize_user when action in [:edit, :update, :delete]

  # FIX: fetching user from db twice
  # TODO: implement all actions
  # TODO: small improvements

  defp authorize_user(conn, _params) do
    %{params: %{"id" => user_id}} = conn
    user = Repo.get(User, user_id)

    if conn.assigns.current_user.id == user.user_id do
      conn
    else
      conn
      |> put_flash(:error, "You are not authorized to access that page.")
      |> redirect(to: page_path(conn, :index))
      |> halt()
    end
  end
end
