defmodule Mylibrary.Repo.Migrations.BooksTableAddUniqueConstraintIsbn do
  use Ecto.Migration

  def change do
    create unique_index(:books, [:isbn])
  end
end
