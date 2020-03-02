defmodule TestApiPhoenix.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:user) do
      add :name, :string
      add :age, :integer
      add :email, :string

      timestamps()
    end

  end
end
