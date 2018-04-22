defmodule Backend.Platform.Product do
  use Ecto.Schema
  import Ecto.Changeset

  alias Backend.Platform.{User}

  schema "products" do
    field :description, :string
    field :feature, :string
    field :name, :string
    field :price, :float
    field :story, :string

    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :story, :description, :feature, :price])
    |> validate_required([:name, :story, :description, :feature, :price])
  end
end
