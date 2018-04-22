defmodule Backend.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  use Arc.Ecto.Schema

  schema "users" do
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :icon, Backend.UserIcon.Type

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :first_name, :last_name])
    |> cast_attachments(attrs, [:icon])
    |> validate_required([:email, :first_name, :last_name])
    |> unique_constraint(:email)
  end
end
