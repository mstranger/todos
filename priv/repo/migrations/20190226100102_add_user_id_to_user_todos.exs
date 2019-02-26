defmodule Todos.Repo.Migrations.AddUserIdToUserTodos do
  use Ecto.Migration

  def change do
    alter table(:user_todos) do
      add :user_id, references(:users)
    end
  end
end
