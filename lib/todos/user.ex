defmodule Todos.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :email, :string
    field :login, :string
    field :name, :string
    field :encrypted_password, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :login, :email, :encrypted_password])
    |> validate_required([:name, :login, :email])
    |> unique_constraint(:login)
    |> unique_constraint(:email)
    |> validate_length(:login, min: 2, max: 20)
    |> validate_format(:email, ~r/@/)
  end
end
