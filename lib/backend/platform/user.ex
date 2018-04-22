defmodule Backend.Platform.User do
  use Ecto.Schema

  alias Backend.Platform.{Product}

  schema "users" do
    field :last_name, :string
    field :first_name, :string

    has_many :products, Product
  end
end
