defmodule Mylibrary.Catalog.Book do
  @moduledoc """
  Book schema contains all the data for a particular book
  """
  use Ecto.Schema
  import Ecto.Changeset

  alias Mylibrary.Authors.Author
  alias Mylibrary.Publishers.Publisher
  alias Mylibrary.Languages.Language
  alias Mylibrary.Catalog.Category

  schema "books" do
    field :binding, Ecto.Enum, values: [:sin_definir, :rustica, :tdura_cartone, :ebook]
    field :date_publication, :date
    field :format, Ecto.Enum, values: [:sin_definir, :tapa_dura, :tapa_blanda, :ebook]
    field :isbn, :string
    field :summary, :string
    field :title, :string
    field :year_edition, :integer

    belongs_to :author, Author
    belongs_to :publisher, Publisher
    belongs_to :language, Language

    many_to_many :categories, Category, join_through: "book_categories", on_replace: :delete

    timestamps()
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:title, :isbn, :summary, :binding, :format, :year_edition, :date_publication])
    |> validate_required([:title,])# :author_id, :publisher_id, :language_id
    |> validate_isbn()
    |> validate_year_edition()
  end

  defp validate_isbn(changeset) do
    changeset
    |> validate_required([:isbn])
    |> validate_format(:isbn, ~r/^(?=(?:\D*\d){10}(?:(?:\D*\d){3})?$)[\d-]+$/, message: "allowed formats: [ xxx-x-xxxxx-xxx-x | x-xxxxx-xxx-x | xxxxxxxxxx | xxxxxxxxxxxxx ]")
    |> validate_length(:isbn, min: 10, max: 17, message: "must have a minimum length of 10 or 13 digits and a maximum of 17 digits.")
    |> unsafe_validate_unique(:isbn, Mylibrary.Repo)
    |> unique_constraint(:isbn)
  end

  defp validate_year_edition(changeset) do
    changeset
    |> validate_required([:year_edition])
    #|> validate_format(:year_edition, ~r/\d{4}/, message: "allowed format: [ 0000 ]")
    #|> validate_length(:year_edition, is: 4, message: "only 4 digits are allowed")
  end
end
