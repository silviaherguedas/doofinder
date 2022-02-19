defmodule Mylibrary.Repo.Migrations.PublishersTableAddUniqueConstraintName do
  use Ecto.Migration

  def change do
    alter table(:publishers) do
      modify :name, :string, null: false
    end

    create unique_index(:publishers, [:name])
  end
end
