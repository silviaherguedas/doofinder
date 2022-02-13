defmodule Mylibrary.CSVHelper do
  @moduledoc """
    Utility module to ingest data ('authors.csv', 'publishers.csv', etc.)
  """

  alias NimbleCSV.RFC4180, as: CSV

  def column_data(file) do
    [filename, _ext] = get_file_name(file)
    column_names = get_column_names(file)

    file
    |> File.stream!()
    |> CSV.parse_stream(skip_headers: true)
    |> Enum.map(fn row ->
      row
      |> Enum.with_index()
      |> Map.new(fn {val, num} -> {column_names[num], val} end)
      |> create_or_skip(filename)
    end)
  end

  def get_file_name(file) do
    file
    |> URI.parse()
    |> Map.fetch!(:path)
    |> Path.basename()
    |> String.split(".")
  end

  def get_column_names(file) do
    file
    |> File.stream!()
    |> CSV.parse_stream(skip_headers: false)
    |> Enum.fetch!(0)
    |> Enum.with_index()
    |> Map.new(fn {val, num} -> {num, val} end)
  end

  def create_or_skip(row, filename) do
    cond do
      filename == "authors" ->
        row
        |> author_data_seeding()
    end
  end

  def author_data_seeding(row) do
    alias Mylibrary.{Features.Author, Repo}

    case Repo.get_by(Author,
          name: row["name"]
        ) do
      nil ->
        Repo.insert(
          %Author{}
          |> Author.changeset(%{
            name: row["name"],
            biography: row["biography"],
          })
        )

      author ->
        {:ok, author}
    end
  end
end
