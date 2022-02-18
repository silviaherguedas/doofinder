defmodule MylibraryWeb.BookView do
  use MylibraryWeb, :view

  alias Mylibrary.Catalog
  alias Mylibrary.Authors
  alias Mylibrary.Publishers
  alias Mylibrary.Languages

  def category_select(f, changeset) do
    existing_ids = changeset |> Ecto.Changeset.get_change(:categories, []) |> Enum.map(& &1.data.id)

    category_opts =
      for cat <- Catalog.list_categories(),
          do: [key: cat.title, value: cat.id, selected: cat.id in existing_ids]

    multiple_select(f, :category_ids, category_opts)
  end

  def author_select(f, changeset) do
    existing_ids = changeset |> Ecto.Changeset.get_change(:authors, []) |> Enum.map(& &1.data.id)

    author_opts =
      for aut <- Authors.list_authors(),
          do: [key: aut.name, value: aut.id, selected: aut.id in existing_ids]

    select(f, :author_id, author_opts, prompt: "Choose a option")
  end

  def publisher_select(f, changeset) do
    existing_ids = changeset |> Ecto.Changeset.get_change(:publishers, []) |> Enum.map(& &1.data.id)

    publisher_opts =
      for pub <- Publishers.list_publishers(),
          do: [key: pub.name, value: pub.id, selected: pub.id in existing_ids]

    select(f, :publisher_id, publisher_opts, prompt: "Choose a option")
  end

  def language_select(f, changeset) do
    existing_ids = changeset |> Ecto.Changeset.get_change(:languages, []) |> Enum.map(& &1.data.id)

    language_opts =
      for lan <- Languages.list_languages(),
          do: [key: lan.name, value: lan.id, selected: lan.id in existing_ids]

    select(f, :language_id, language_opts, prompt: "Choose a option")
  end
end