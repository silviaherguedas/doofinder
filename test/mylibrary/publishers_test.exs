defmodule Mylibrary.PublishersTest do
  use Mylibrary.DataCase

  alias Mylibrary.Publishers

  describe "publishers" do
    alias Mylibrary.Publishers.Publisher

    import Mylibrary.PublishersFixtures

    @invalid_attrs %{name: nil}

    test "list_publishers/0 returns all publishers" do
      publisher = publisher_fixture()
      assert Publishers.list_publishers() == [publisher]
    end

    test "get_publisher!/1 returns the publisher with given id" do
      publisher = publisher_fixture()
      assert Publishers.get_publisher!(publisher.id) == publisher
    end

    test "create_publisher/1 with valid data creates a publisher" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Publisher{} = publisher} = Publishers.create_publisher(valid_attrs)
      assert publisher.name == "some name"
    end

    test "create_publisher/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Publishers.create_publisher(@invalid_attrs)
    end

    test "update_publisher/2 with valid data updates the publisher" do
      publisher = publisher_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Publisher{} = publisher} = Publishers.update_publisher(publisher, update_attrs)
      assert publisher.name == "some updated name"
    end

    test "update_publisher/2 with invalid data returns error changeset" do
      publisher = publisher_fixture()
      assert {:error, %Ecto.Changeset{}} = Publishers.update_publisher(publisher, @invalid_attrs)
      assert publisher == Publishers.get_publisher!(publisher.id)
    end

    test "delete_publisher/1 deletes the publisher" do
      publisher = publisher_fixture()
      assert {:ok, %Publisher{}} = Publishers.delete_publisher(publisher)
      assert_raise Ecto.NoResultsError, fn -> Publishers.get_publisher!(publisher.id) end
    end

    test "change_publisher/1 returns a publisher changeset" do
      publisher = publisher_fixture()
      assert %Ecto.Changeset{} = Publishers.change_publisher(publisher)
    end
  end
end
