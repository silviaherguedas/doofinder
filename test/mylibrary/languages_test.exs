defmodule Mylibrary.LanguagesTest do
  use Mylibrary.DataCase

  alias Mylibrary.Languages

  describe "languages" do
    alias Mylibrary.Languages.Language

    import Mylibrary.LanguagesFixtures

    @invalid_attrs %{iso1: nil, iso2: nil, name: nil}

    test "list_languages/0 returns all languages" do
      language = language_fixture()
      assert Languages.list_languages() == [language]
    end

    test "get_language!/1 returns the language with given id" do
      language = language_fixture()
      assert Languages.get_language!(language.id) == language
    end

    test "create_language/1 with valid data creates a language" do
      valid_attrs = %{iso1: "some iso1", iso2: "some iso2", name: "some name"}

      assert {:ok, %Language{} = language} = Languages.create_language(valid_attrs)
      assert language.iso1 == "some iso1"
      assert language.iso2 == "some iso2"
      assert language.name == "some name"
    end

    test "create_language/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Languages.create_language(@invalid_attrs)
    end

    test "update_language/2 with valid data updates the language" do
      language = language_fixture()
      update_attrs = %{iso1: "some updated iso1", iso2: "some updated iso2", name: "some updated name"}

      assert {:ok, %Language{} = language} = Languages.update_language(language, update_attrs)
      assert language.iso1 == "some updated iso1"
      assert language.iso2 == "some updated iso2"
      assert language.name == "some updated name"
    end

    test "update_language/2 with invalid data returns error changeset" do
      language = language_fixture()
      assert {:error, %Ecto.Changeset{}} = Languages.update_language(language, @invalid_attrs)
      assert language == Languages.get_language!(language.id)
    end

    test "delete_language/1 deletes the language" do
      language = language_fixture()
      assert {:ok, %Language{}} = Languages.delete_language(language)
      assert_raise Ecto.NoResultsError, fn -> Languages.get_language!(language.id) end
    end

    test "change_language/1 returns a language changeset" do
      language = language_fixture()
      assert %Ecto.Changeset{} = Languages.change_language(language)
    end
  end
end
