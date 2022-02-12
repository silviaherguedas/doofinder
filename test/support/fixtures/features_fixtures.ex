defmodule Mylibrary.FeaturesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Mylibrary.Features` context.
  """

  @doc """
  Generate a author.
  """
  def author_fixture(attrs \\ %{}) do
    {:ok, author} =
      attrs
      |> Enum.into(%{
        biography: "some biography",
        name: "some name"
      })
      |> Mylibrary.Features.create_author()

    author
  end
end
