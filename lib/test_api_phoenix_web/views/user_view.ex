defmodule TestApiPhoenixWeb.UserView do
  use TestApiPhoenixWeb, :view
  alias TestApiPhoenixWeb.UserView

  def render("index.json", %{user: user}) do
    %{data: render_many(user, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      name: user.name,
      age: user.age,
      email: user.email}
  end
end
