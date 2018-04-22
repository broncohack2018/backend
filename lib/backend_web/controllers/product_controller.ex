defmodule BackendWeb.ProductController do
  use BackendWeb, :controller

  alias Backend.Platform
  alias Backend.Platform.Product

  action_fallback BackendWeb.FallbackController

  def index(conn, _params) do
    products = Platform.list_products()
    render(conn, "index.json", products: products)
  end

  def create(conn, %{"product" => product_params}) do
    with {:ok, %Product{} = product} <- Platform.create_product(product_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", product_path(conn, :show, product))
      |> render("show.json", product: product)
    end
  end

  def show(conn, %{"id" => id}) do
    product = Platform.get_product!(id)
    render(conn, "show.json", product: product)
  end

  def update(conn, %{"id" => id, "product" => product_params}) do
    product = Platform.get_product!(id)

    with {:ok, %Product{} = product} <- Platform.update_product(product, product_params) do
      render(conn, "show.json", product: product)
    end
  end

  def delete(conn, %{"id" => id}) do
    product = Platform.get_product!(id)
    with {:ok, %Product{}} <- Platform.delete_product(product) do
      send_resp(conn, :no_content, "")
    end
  end
end
