defmodule Todos.Repo.Migrations.UserAddPasswordDigestColumn do
  use Ecto.Migration

  # def up do ... end
  # def down do ... end

  def up do
    alter table(:users) do
      add :encrypted_password, :string
    end
  end

  def down do
    alter table(:users) do
      remove :encrypted_password
    end
  end
end
