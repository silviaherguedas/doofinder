defmodule Mylibrary.Repo.Migrations.LanguagesTableAddUniquesConstraintsIso1Iso2 do
  use Ecto.Migration

  def change do
    alter table(:languages) do
      modify :iso1, :string, null: false
      modify :iso2, :string, null: false
    end

    create unique_index(:languages, [:iso1, :iso2])
  end
end
