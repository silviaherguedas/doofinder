defmodule Mylibrary.Features.Author do
  @moduledoc """
  Author contains all the data for a particular author
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "authors" do
    field :biography, :string
    field :name, :string

    timestamps()
  end

  @spec changeset(
          {map, map}
          | %{
              :__struct__ => atom | %{:__changeset__ => map, optional(any) => any},
              optional(atom) => any
            },
          :invalid | %{optional(:__struct__) => none, optional(atom | binary) => any}
        ) :: Ecto.Changeset.t()
  @doc false
  def changeset(author, attrs) do
    author
    |> cast(attrs, [:name, :biography])
    |> validate_required([:name, :biography])
  end
end
