defmodule Mylibrary.Repo.Migrations.CreateAuthors do
  use Ecto.Migration

  def change do
    create table(:authors) do
      add :name, :string
      add :biography, :text

      timestamps()
    end
  end
end
