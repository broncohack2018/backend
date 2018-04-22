defmodule Backend.Repo.Migrations.AddIconToUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :icon, :string
    end
  end
end
