defmodule Backend.Platform.Product do
  use Ecto.Schema
  import Ecto.Changeset
  use Arc.Ecto.Schema

  alias Backend.Platform.{User}

  schema "products" do
    field :description, :string
    field :feature, :string
    field :name, :string
    field :price, :float
    field :story, :string
    field :image, Backend.ProductImage.Type

    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :story, :description, :feature, :price])
    |> cast_attachments(attrs, [:image])
    |> validate_required([:name, :story, :description, :feature, :price])
  end
end
