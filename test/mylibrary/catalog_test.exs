defmodule Mylibrary.CatalogTest do
  use Mylibrary.DataCase

  alias Mylibrary.Catalog

  describe "books" do
    alias Mylibrary.Catalog.Book

    import Mylibrary.CatalogFixtures

    @invalid_attrs %{binding: nil, date_publication: nil, format: nil, isbn: nil, summary: nil, title: nil, year_edition: nil}

    test "list_books/0 returns all books" do
      book = book_fixture()
      assert Catalog.list_books() == [book]
    end

    test "get_book!/1 returns the book with given id" do
      book = book_fixture()
      assert Catalog.get_book!(book.id) == book
    end

    test "create_book/1 with valid data creates a book" do
      valid_attrs = %{binding: :rustica, date_publication: ~D[2022-02-12], format: :tapa_dura, isbn: "some isbn", summary: "some summary", title: "some title", year_edition: 42}

      assert {:ok, %Book{} = book} = Catalog.create_book(valid_attrs)
      assert book.binding == :rustica
      assert book.date_publication == ~D[2022-02-12]
      assert book.format == :tapa_dura
      assert book.isbn == "some isbn"
      assert book.summary == "some summary"
      assert book.title == "some title"
      assert book.year_edition == 42
    end

    test "create_book/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Catalog.create_book(@invalid_attrs)
    end

    test "update_book/2 with valid data updates the book" do
      book = book_fixture()
      update_attrs = %{binding: :tdura_cartone, date_publication: ~D[2022-02-13], format: :tapa_blanda, isbn: "some updated isbn", summary: "some updated summary", title: "some updated title", year_edition: 43}

      assert {:ok, %Book{} = book} = Catalog.update_book(book, update_attrs)
      assert book.binding == :tdura_cartone
      assert book.date_publication == ~D[2022-02-13]
      assert book.format == :tapa_blanda
      assert book.isbn == "some updated isbn"
      assert book.summary == "some updated summary"
      assert book.title == "some updated title"
      assert book.year_edition == 43
    end

    test "update_book/2 with invalid data returns error changeset" do
      book = book_fixture()
      assert {:error, %Ecto.Changeset{}} = Catalog.update_book(book, @invalid_attrs)
      assert book == Catalog.get_book!(book.id)
    end

    test "delete_book/1 deletes the book" do
      book = book_fixture()
      assert {:ok, %Book{}} = Catalog.delete_book(book)
      assert_raise Ecto.NoResultsError, fn -> Catalog.get_book!(book.id) end
    end

    test "change_book/1 returns a book changeset" do
      book = book_fixture()
      assert %Ecto.Changeset{} = Catalog.change_book(book)
    end
  end
end
