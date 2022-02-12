defmodule Mylibrary.Features.CSVUtil do
  @moduledoc """
    Utility module to ingest `authors.csv`
  """

  alias NimbleCSV.RFC4180, as: CSV
  alias Mylibrary.{Features.Author, Repo}

  def column_data(file) do
    column_names = get_column_names(file)

    file
    |> File.stream!()
    |> CSV.parse_stream(skip_headers: true)
    |> Enum.map(fn row ->
      row
      |> Enum.with_index()
      |> Map.new(fn {val, num} -> {column_names[num], val} end)
      |> create_or_skip()
    end)
  end

  def get_column_names(file) do
    file
    |> File.stream!()
    |> CSV.parse_stream(skip_headers: false)
    |> Enum.fetch!(0)
    |> Enum.with_index()
    |> Map.new(fn {val, num} -> {num, val} end)
  end

  def create_or_skip(row) do
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
