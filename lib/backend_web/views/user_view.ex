defmodule BackendWeb.UserView do
  use BackendWeb, :view
  alias BackendWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      email: user.email,
      first_name: user.first_name,
      last_name: user.last_name,
      icon_url: Backend.UserIcon.url({user.icon, user}, :thumb)
    }
  end

  def render("public_user.json", %{user: user}) do
    %{id: user.id,
      first_name: user.first_name,
      last_name: user.last_name,
      icon_url: Backend.UserIcon.url({user.icon, user}, :thumb)
    }
  end
end
