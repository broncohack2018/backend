defmodule BackendWeb.PageController do
  use BackendWeb, :controller

  alias Backend.{Platform}

  def index(conn, _params) do
    render conn, "index.html", products: Platform.list_products()
  end

  def show(conn, %{"id" => id}) do
    product = Platform.get_product!(id)
    render(conn, "show.html", product: product)
  end
end
