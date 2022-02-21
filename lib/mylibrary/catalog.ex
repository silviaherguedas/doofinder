defmodule Mylibrary.Catalog do
  @moduledoc """
  Catalog context, encompasses the general characteristics of books and categories.
  """

  import Ecto.Query, warn: false
  alias Mylibrary.Repo
  alias Mylibrary.Authors
  alias Mylibrary.Publishers
  alias Mylibrary.Languages
  alias Mylibrary.Catalog.{Book, Category}

  @doc """
  Returns the list of books.

  ## Examples

      iex> list_books()
      [%Book{}, ...]

  """
  def list_books do
    Repo.all(Book)
  end

  @doc """
  Gets a single book.

  Raises `Ecto.NoResultsError` if the Book does not exist.

  ## Examples

      iex> get_book!(123)
      %Book{}

      iex> get_book!(456)
      ** (Ecto.NoResultsError)

  """
  def get_book!(id) do
    Book
    |> Repo.get!(id)
    |> Repo.preload([:categories, :author, :publisher, :language])
  end

  @doc """
  Creates a book.

  ## Examples

      iex> create_book(%{field: value})
      {:ok, %Book{}}

      iex> create_book(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_book(attrs \\ %{}) do
    %Book{}
    |> change_book(attrs)
    |> assign_mandatory_relations()
    |> Repo.insert()
  end

  @doc """
  Updates a book.

  ## Examples

      iex> update_book(book, %{field: new_value})
      {:ok, %Book{}}

      iex> update_book(book, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_book(%Book{} = book, attrs) do
    book
    |> change_book(attrs)
    |> assign_mandatory_relations()
    |> Repo.update()
  end

  @doc """
  Deletes a book.

  ## Examples

      iex> delete_book(book)
      {:ok, %Book{}}

      iex> delete_book(book)
      {:error, %Ecto.Changeset{}}

  """
  def delete_book(%Book{} = book) do
    Repo.delete(book)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking book changes.

  ## Examples

      iex> change_book(book)
      %Ecto.Changeset{data: %Book{}}

  """
  def change_book(%Book{} = book, attrs \\ %{}) do
    book
    |> Repo.preload([:categories, :author, :publisher, :language])
    |> Book.changeset(attrs)
    |> Ecto.Changeset.put_assoc(:categories, list_categories_by_id(attrs["category_ids"]))
    |> Ecto.Changeset.put_assoc(:author, author_by_id(attrs["author_id"]))
    |> Ecto.Changeset.put_assoc(:publisher, publisher_by_id(attrs["publisher_id"]))
    |> Ecto.Changeset.put_assoc(:language, language_by_id(attrs["language_id"]))
  end

  @doc """
  Assigning mandatory status to external relations.

  ## Examples

      iex> assign_mandatory_relations(%{field: value})
      %Ecto.Changeset{}

  """
  def assign_mandatory_relations(book) do
    book
    |> Ecto.Changeset.cast_assoc(:categories, required: true)
    |> Ecto.Changeset.cast_assoc(:author, required: true)
    |> Ecto.Changeset.cast_assoc(:publisher, required: true)
    |> Ecto.Changeset.cast_assoc(:language, required: true)
  end

  @doc """
  Returns the list of categories based on specific ids

  ## Examples

      iex> list_categories_by_id()
      [%Category{}, ...]

  """
  def list_categories_by_id(nil), do: []
  def list_categories_by_id(category_ids) do
    Repo.all(from c in Category, where: c.id in ^category_ids)
  end

  @doc """
  Returns the information of the selected author

  ## Examples

      iex> author_by_id(6)
      %Author{}

  """
  def author_by_id(nil), do: []
  def author_by_id(id) do
    if id != "" do
      Authors.get_author!(id)
    end
  end

  @doc """
  Returns the information of the selected publisher

  ## Examples

      iex> publisher_by_id(6)
      %Publisher{}

  """
  def publisher_by_id(nil), do: []
  def publisher_by_id(id) do
    if id != "" do
      Publishers.get_publisher!(id)
    end
  end

  @doc """
  Returns the information of the selected language

  ## Examples

      iex> language_by_id(6)
      %Language{}

  """
  def language_by_id(nil), do: []
  def language_by_id(id) do
    if id != "" do
      Languages.get_language!(id)
    end
  end

  @doc """
  Returns the list of categories.

  ## Examples

      iex> list_categories()
      [%Category{}, ...]

  """
  def list_categories do
    Repo.all(Category)
  end

  @doc """
  Gets a single category.

  Raises `Ecto.NoResultsError` if the Category does not exist.

  ## Examples

      iex> get_category!(123)
      %Category{}

      iex> get_category!(456)
      ** (Ecto.NoResultsError)

  """
  def get_category!(id), do: Repo.get!(Category, id)

  @doc """
  Creates a category.

  ## Examples

      iex> create_category(%{field: value})
      {:ok, %Category{}}

      iex> create_category(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_category(attrs \\ %{}) do
    %Category{}
    |> Category.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a category.

  ## Examples

      iex> update_category(category, %{field: new_value})
      {:ok, %Category{}}

      iex> update_category(category, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_category(%Category{} = category, attrs) do
    category
    |> Category.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a category.

  ## Examples

      iex> delete_category(category)
      {:ok, %Category{}}

      iex> delete_category(category)
      {:error, %Ecto.Changeset{}}

  """
  def delete_category(%Category{} = category) do
    Repo.delete(category)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking category changes.

  ## Examples

      iex> change_category(category)
      %Ecto.Changeset{data: %Category{}}

  """
  def change_category(%Category{} = category, attrs \\ %{}) do
    Category.changeset(category, attrs)
  end
end
