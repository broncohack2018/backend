defmodule BackendWeb.PageController do
  use BackendWeb, :controller

  alias Backend.{Platform}

  def index(conn, _params) do
    render conn, "index.html", products: Platform.list_products()
  end
end
