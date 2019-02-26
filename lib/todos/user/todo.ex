defmodule Todos.User.Todo do
  use Ecto.Schema
  import Ecto.Changeset


  schema "user_todos" do
    field :description, :string
    field :title, :string

    belongs_to :user, Todos.User

    timestamps()
  end

  @doc false
  def changeset(todo, attrs) do
    todo
    |> cast(attrs, [:title, :description])
    |> validate_required([:title, :description])
  end
end
