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
        iso1: "es",
        iso2: "esp",
        name: "Castellano"
      })
      |> Mylibrary.Languages.create_language()

    language
  end
end
