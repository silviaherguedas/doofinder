defmodule Mylibrary.Publishers.Publisher do
  @moduledoc """
  Publisher schema contains all the data for a particular publisher
  """
  use Ecto.Schema
  import Ecto.Changeset

  alias Mylibrary.Catalog.Book

  schema "publishers" do
    field :name, :string
    has_many :books, Book, on_delete: :nothing

    timestamps()
  end

  @doc false
  def changeset(publisher, attrs) do
    publisher
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end
end
