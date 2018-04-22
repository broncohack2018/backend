defmodule Backend.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string
      add :story, :text
      add :description, :text
      add :feature, :text
      add :price, :float
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:products, [:user_id])
  end
end
