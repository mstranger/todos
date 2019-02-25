defmodule TodosWeb.UserControllerTest do
  use TodosWeb.ConnCase

  test "GET /users", %{conn: conn} do
    conn = get conn, "/users"
    assert html_response(conn, 200) =~ "All users"
  end
end
