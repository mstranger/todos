defmodule Todos.Repo.Migrations.CreateUserTodos do
  use Ecto.Migration

  def change do
    create table(:user_todos) do
      add :title, :string, null: false
      add :description, :string

      timestamps()
    end

  end
end
