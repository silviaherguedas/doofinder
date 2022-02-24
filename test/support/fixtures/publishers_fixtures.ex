defmodule Mylibrary.PublishersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Mylibrary.Publishers` context.
  """

  @doc """
  Generate a unique publisher name.
  """
  def unique_publisher_name, do: "some title#{System.unique_integer([:positive])}"

  @doc """
  Generate a publisher.
  """
  def publisher_fixture(attrs \\ %{}) do
    {:ok, publisher} =
      attrs
      |> Enum.into(%{
        name: unique_publisher_name()
      })
      |> Mylibrary.Publishers.create_publisher()

    publisher
  end
end
