defmodule Backend.ProductImage do
  use Arc.Definition
  use Arc.Ecto.Definition

  # Include ecto support (requires package arc_ecto installed):

  @acl :public_read
  @versions [:original, :thumb]

  # Whitelist file extensions:
  def validate({file, _}) do
    ~w(.jpg .jpeg .png) |> Enum.member?(Path.extname(file.file_name))
  end

  # Define a thumbnail transformation:
  def transform(:thumb, _) do
    {:convert, "-strip -thumbnail 250x250^ -gravity center -extent 250x250 -format jpg", :jpg}
  end

  def filename(version, {_, scope}) do
    "#{version}_#{scope.id}"
  end

  def storage_dir(_, {_, scope}) do
    "uploads/products"
  end

  def __storage do
    Arc.Storage.S3
  end
end
