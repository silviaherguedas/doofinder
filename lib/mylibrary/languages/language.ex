defmodule Mylibrary.Languages.Language do
  use Ecto.Schema
  import Ecto.Changeset

  schema "languages" do
    field :iso1, :string
    field :iso2, :string
    field :name, :string
    has_many :book, Mylibrary.Catalog.Book, on_delete: :nilify_all

    timestamps()
  end

  @doc false
  def changeset(language, attrs) do
    language
    |> cast(attrs, [:name, :iso1, :iso2])
    |> validate_required([:name, :iso1])
    |> validate_length(:iso1, is: 2, message: "only 2 digits allowed")
    |> validate_length(:iso2, is: 3, message: "only 3 digits allowed")
  end
end
