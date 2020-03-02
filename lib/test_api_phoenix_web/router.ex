defmodule TestApiPhoenixWeb.Router do
  use TestApiPhoenixWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", TestApiPhoenixWeb do
    pipe_through :api
  end
end
