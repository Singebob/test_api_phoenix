defmodule TestApiPhoenixWeb.UserController do
  @moduledoc """
   Controlleur de user
  """
  use TestApiPhoenixWeb, :controller

  alias TestApiPhoenix.Accounts
  alias TestApiPhoenix.Accounts.User

  action_fallback TestApiPhoenixWeb.FallbackController

  def index(conn, _params) do
    user = Accounts.list_user()
    render(conn, "index.json", user: user)
  end

  def create(conn, %{"user" => user_params}) do
    if is_majeur?(Map.get(user_params, "age")) do
      with {:ok, %User{} = user} <- Accounts.create_user(user_params) do
        conn
        |> put_status(:created)
        |> put_resp_header("location", Routes.user_path(conn, :show, user))
        |> render("show.json", user: user)
      end
    else
      conn
      |> render("error.json", changeset: user_params)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Accounts.get_user!(id)

    with {:ok, %User{} = user} <- Accounts.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)

    with {:ok, %User{}} <- Accounts.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end

  @doc """
  Verifie si il est majeur

  ## Examples

      iex> TestApiPhoenixWeb.UserController.is_majeur?(19)
      true

      iex> TestApiPhoenixWeb.UserController.is_majeur?(1)
      false

  """
  @spec is_majeur?(integer()) :: boolean()
  def is_majeur?(age) do 
    age >= 18
  end
  
end
