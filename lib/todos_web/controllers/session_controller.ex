defmodule TodosWeb.SessionController do
  use TodosWeb, :controller

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, %{"session" => %{"login" => login, "password" => password}}) do
    case Todos.Auth.sign_in(login, password) do
      {:ok, user} ->
        conn
        |> put_session(:current_user_id, user.id)
        |> put_flash(:info, "You have successfully signed in!")
        |> redirect(to: user_path(conn, :index))
      {:error, _reason} ->
        conn
        |> put_flash(:error, "Invalid Email or Password")
        |> render("new.html")
    end
  end

  def delete(conn, _params) do
    conn
    |> Todos.Auth.sign_out()
    |> redirect(to: page_path(conn, :index))
  end
end
