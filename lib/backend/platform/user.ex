defmodule Backend.Platform.User do
  use Ecto.Schema

  alias Backend.Platform.{Product}

  schema "users" do
    field :email, :string

    has_many :products, Product
  end
end
