defmodule Mylibrary.Catalog.Book do
  @moduledoc """
  Book schema contains all the data for a particular book
  """
  use Ecto.Schema
  import Ecto.Changeset

  @min_year 1800

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

    belongs_to :author, Author, on_replace: :nilify
    belongs_to :publisher, Publisher, on_replace: :nilify
    belongs_to :language, Language, on_replace: :nilify

    many_to_many :categories, Category, join_through: "book_categories", on_replace: :delete

    timestamps()
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:title, :isbn, :summary, :binding, :format, :year_edition, :date_publication])
    |> validate_required([:title, :binding, :format])
    |> validate_isbn()
    |> validate_year_edition()
  end

  defp validate_isbn(changeset) do
    format_message = "digits only and with these formats: [ xxx-x-xxxxx-xxx-x (17) | x-xxxxx-xxx-x (13) | xxxxxxxxxx (10) | xxxxxxxxxxxxx (13) ]"

    changeset
    |> validate_required([:isbn])
    |> validate_format(:isbn, ~r/^(?=(?:\d\D*){10}(?:(?:\D*\d){3})?$)[\d-]+$/, message: format_message)
    |> validate_length(:isbn, min: 10, max: 17, message: "must have a minimum length of 10 and a maximum of 17 digits.")
    |> unsafe_validate_unique(:isbn, Mylibrary.Repo)
    |> unique_constraint(:isbn)
  end

  defp validate_year_edition(changeset) do
    datetime = DateTime.now!("Etc/UTC")
    year = datetime.year

    changeset
    |> validate_required([:year_edition])
    |> validate_inclusion(:year_edition, @min_year..year,  message: "Years between @min_year and #{year}")
  end
end
