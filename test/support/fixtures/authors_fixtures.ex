defmodule Mylibrary.AuthorsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Mylibrary.Authors` context.
  """

  @doc """
  Generate a unique author name.
  """
  def unique_author_name, do: "some name#{System.unique_integer([:positive])}"

  @doc """
  Generate a author.
  """
  def author_fixture(attrs \\ %{}) do
    {:ok, author} =
      attrs
      |> Enum.into(%{
        biography: "some biography",
        name: unique_author_name()
      })
      |> Mylibrary.Authors.create_author()

    author
  end
end
