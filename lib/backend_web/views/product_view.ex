defmodule BackendWeb.ProductView do
  use BackendWeb, :view
  alias BackendWeb.{ProductView, UserView}

  def render("index.json", %{products: products}) do
    %{data: render_many(products, ProductView, "product.json")}
  end

  def render("show.json", %{product: product}) do
    %{data: render_one(product, ProductView, "product.json")}
  end

  def render("product.json", %{product: product}) do
    %{id: product.id,
      name: product.name,
      story: product.story,
      description: product.description,
      feature: product.feature,
      user: render_one(product.user, UserView, "user.json"),
      price: product.price
    }
  end
end
