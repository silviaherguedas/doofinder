defmodule Mylibrary.Repo.Migrations.CreateBooks do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :title, :string
      add :isbn, :string, null: false
      add :summary, :text, default: "", null: true
      add :binding, :string, default: "sin_definir", null: true
      add :format, :string, default: "sin_definir", null: true
      add :year_edition, :integer
      add :date_publication, :date, default: nil, null: true
      add :author_id, references(:authors, on_delete: :delete_all)
      add :publisher_id, references(:publishers, on_delete: :nothing)
      add :language_id, references(:languages, on_delete: :nilify_all)

      timestamps()
    end

    create index(:books, [:author_id])
    create index(:books, [:publisher_id])
    create index(:books, [:language_id])
  end
end
