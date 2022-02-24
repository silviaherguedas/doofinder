defmodule Mylibrary.CatalogFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Mylibrary.Catalog` context.
  """

  import Mylibrary.AuthorsFixtures
  import Mylibrary.PublishersFixtures
  import Mylibrary.LanguagesFixtures

  @doc """
  Generate a unique language iso2.
  """
  def unique_book_isbn, do: String.slice("#{System.unique_integer([:positive])}", 0..9)

  @doc """
  Generate a book.
  """
  def book_fixture(attrs \\ %{}, preload \\ []) do
    require Mylibrary.UtilFixture

    assoc_author = %{author: author_fixture()}
    assoc_publisher = %{publisher: publisher_fixture()}
    assoc_language = %{language: language_fixture()}
    assoc_categories = category_fixture()

    {:ok, book} =
      attrs
      |> Enum.into(%{
        binding: :rustica,
        date_publication: ~D[2022-02-12],
        format: :tapa_dura,
        isbn: "1257561035",
        summary: "some summary",
        title: "some title",
        year_edition: 2021,
        author_id: assoc_author.author.id,
        publisher_id: assoc_publisher.publisher.id,
        language_id: assoc_language.language.id,
        categories: assoc_categories
      })
      |> Mylibrary.Catalog.create_book()

      book
      |> Mylibrary.UtilFixture.merge_preload(preload, assoc_author)
      |> Mylibrary.UtilFixture.merge_preload(preload, assoc_publisher)
      |> Mylibrary.UtilFixture.merge_preload(preload, assoc_language)
      |> Mylibrary.UtilFixture.merge_preload(preload, assoc_categories)
  end

  @doc """
  Generate a unique category title.
  """
  def unique_category_title, do: "some title#{System.unique_integer([:positive])}"

  @doc """
  Generate a category.
  """
  def category_fixture(attrs \\ %{}) do
    {:ok, category} =
      attrs
      |> Enum.into(%{
        title: unique_category_title()
      })
      |> Mylibrary.Catalog.create_category()

    category
  end
end
