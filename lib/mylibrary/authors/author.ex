defmodule Mylibrary.Authors.Author do
  @moduledoc """
  Author schema contains all the data for a particular author
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "authors" do
    field :biography, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(author, attrs) do
    author
    |> cast(attrs, [:name, :biography])
    |> validate_required([:name, :biography])
  end
end
