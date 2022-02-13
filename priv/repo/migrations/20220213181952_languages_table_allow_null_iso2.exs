defmodule Mylibrary.Repo.Migrations.LanguagesTableAllowNullIso2 do
  use Ecto.Migration

  def change do
    alter table(:languages) do
      modify :iso2, :string, null: true
    end
  end
end
