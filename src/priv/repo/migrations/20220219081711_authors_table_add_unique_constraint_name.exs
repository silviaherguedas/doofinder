defmodule Mylibrary.Repo.Migrations.AuthorsTableAddUniqueConstraintName do
  use Ecto.Migration

  def change do
    alter table(:authors) do
      modify :name, :string, null: false
    end

    create unique_index(:authors, [:name])
  end
end
