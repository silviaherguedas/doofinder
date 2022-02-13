# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Mylibrary.Repo.insert!(%Mylibrary.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

# Seed `authors` table from CSV
Mylibrary.CSVHelpers.column_data("priv/repo/data/authors.csv")
