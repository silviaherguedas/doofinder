defmodule Mylibrary.LanguagesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Mylibrary.Languages` context.
  """

  @doc """
  Generate a unique language iso1.
  """
  def unique_language_iso1, do: String.slice("#{System.unique_integer([:positive])}", 0..1)

  @doc """
  Generate a unique language iso2.
  """
  def unique_language_iso2, do: String.slice("#{System.unique_integer([:positive])}", 0..2)

  @doc """
  Generate a language.
  """
  def language_fixture(attrs \\ %{}) do
    {:ok, language} =
      attrs
      |> Enum.into(%{
        iso1: unique_language_iso1(),
        iso2: unique_language_iso2(),
        name: "Castellano"
      })
      |> Mylibrary.Languages.create_language()

    language
  end
end
