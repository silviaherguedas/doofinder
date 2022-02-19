defmodule Mylibrary.LanguagesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Mylibrary.Languages` context.
  """

  @doc """
  Generate a language.
  """
  def language_fixture(attrs \\ %{}) do
    {:ok, language} =
      attrs
      |> Enum.into(%{
        iso1: "some iso1",
        iso2: "some iso2",
        name: "some name"
      })
      |> Mylibrary.Languages.create_language()

    language
  end
end
