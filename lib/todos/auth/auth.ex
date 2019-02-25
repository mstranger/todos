defmodule Todos.Auth do
  alias Todos.{Repo,User}

  def sign_in(login, password) do
    user = Repo.get_by(User, login: login)

    cond do
      user && user.encrypted_password == password ->
        {:ok, user}
      true ->
        {:error, :unauthorized}
    end
  end

  def sign_out(conn) do
    Plug.Conn.configure_session(conn, drop: true)
  end

  def current_user(conn) do
    user_id = Plug.Conn.get_session(conn, :current_user_id)
    if user_id, do: Repo.get(User, user_id)
  end

  def user_signed_in?(conn) do
    !!current_user(conn)
  end
end