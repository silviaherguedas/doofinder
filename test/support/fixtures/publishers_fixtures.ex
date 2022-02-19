defmodule Mylibrary.PublishersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Mylibrary.Publishers` context.
  """

  @doc """
  Generate a publisher.
  """
  def publisher_fixture(attrs \\ %{}) do
    {:ok, publisher} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Mylibrary.Publishers.create_publisher()

    publisher
  end
end
