defmodule Mylibrary.CatalogFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Mylibrary.Catalog` context.
  """

  @doc """
  Generate a book.
  """
  def book_fixture(attrs \\ %{}) do
    {:ok, book} =
      attrs
      |> Enum.into(%{
        binding: :rustica,
        date_publication: ~D[2022-02-12],
        format: :tapa_dura,
        isbn: "some isbn",
        summary: "some summary",
        title: "some title",
        year_edition: 42
      })
      |> Mylibrary.Catalog.create_book()

    book
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
