defmodule Mylibrary.FeaturesTest do
  use Mylibrary.DataCase

  alias Mylibrary.Features

  describe "authors" do
    alias Mylibrary.Features.Author

    import Mylibrary.FeaturesFixtures

    @invalid_attrs %{biography: nil, name: nil}

    test "list_authors/0 returns all authors" do
      author = author_fixture()
      assert Features.list_authors() == [author]
    end

    test "get_author!/1 returns the author with given id" do
      author = author_fixture()
      assert Features.get_author!(author.id) == author
    end

    test "create_author/1 with valid data creates a author" do
      valid_attrs = %{biography: "some biography", name: "some name"}

      assert {:ok, %Author{} = author} = Features.create_author(valid_attrs)
      assert author.biography == "some biography"
      assert author.name == "some name"
    end

    test "create_author/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Features.create_author(@invalid_attrs)
    end

    test "update_author/2 with valid data updates the author" do
      author = author_fixture()
      update_attrs = %{biography: "some updated biography", name: "some updated name"}

      assert {:ok, %Author{} = author} = Features.update_author(author, update_attrs)
      assert author.biography == "some updated biography"
      assert author.name == "some updated name"
    end

    test "update_author/2 with invalid data returns error changeset" do
      author = author_fixture()
      assert {:error, %Ecto.Changeset{}} = Features.update_author(author, @invalid_attrs)
      assert author == Features.get_author!(author.id)
    end

    test "delete_author/1 deletes the author" do
      author = author_fixture()
      assert {:ok, %Author{}} = Features.delete_author(author)
      assert_raise Ecto.NoResultsError, fn -> Features.get_author!(author.id) end
    end

    test "change_author/1 returns a author changeset" do
      author = author_fixture()
      assert %Ecto.Changeset{} = Features.change_author(author)
    end
  end
end
