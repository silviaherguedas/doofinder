defmodule Mylibrary.Languages.Language do
  use Ecto.Schema
  import Ecto.Changeset

  schema "languages" do
    field :iso1, :string
    field :iso2, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(language, attrs) do
    language
    |> cast(attrs, [:name, :iso1, :iso2])
    |> validate_required([:name, :iso1])
  end
end
