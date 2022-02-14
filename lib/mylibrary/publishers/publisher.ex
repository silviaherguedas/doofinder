defmodule Mylibrary.Publishers.Publisher do
  use Ecto.Schema
  import Ecto.Changeset

  schema "publishers" do
    field :name, :string
    has_many :book, Mylibrary.Catalog.Book, on_delete: :nothing

    timestamps()
  end

  @doc false
  def changeset(publisher, attrs) do
    publisher
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
