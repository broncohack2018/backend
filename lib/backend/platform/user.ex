defmodule Backend.Platform.User do
  use Ecto.Schema

  alias Backend.Platform.{Product}

  use Arc.Ecto.Schema

  schema "users" do
    field :last_name, :string
    field :first_name, :string
    field :icon, Backend.UserIcon.Type

    has_many :products, Product
  end
end
