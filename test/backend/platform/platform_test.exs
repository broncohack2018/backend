defmodule Backend.PlatformTest do
  use Backend.DataCase

  alias Backend.Platform

  describe "products" do
    alias Backend.Platform.Product

    @valid_attrs %{description: "some description", feature: "some feature", name: "some name", price: 120.5, story: "some story"}
    @update_attrs %{description: "some updated description", feature: "some updated feature", name: "some updated name", price: 456.7, story: "some updated story"}
    @invalid_attrs %{description: nil, feature: nil, name: nil, price: nil, story: nil}

    def product_fixture(attrs \\ %{}) do
      {:ok, product} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Platform.create_product()

      product
    end

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Platform.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Platform.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      assert {:ok, %Product{} = product} = Platform.create_product(@valid_attrs)
      assert product.description == "some description"
      assert product.feature == "some feature"
      assert product.name == "some name"
      assert product.price == 120.5
      assert product.story == "some story"
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Platform.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      assert {:ok, product} = Platform.update_product(product, @update_attrs)
      assert %Product{} = product
      assert product.description == "some updated description"
      assert product.feature == "some updated feature"
      assert product.name == "some updated name"
      assert product.price == 456.7
      assert product.story == "some updated story"
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Platform.update_product(product, @invalid_attrs)
      assert product == Platform.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Platform.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Platform.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Platform.change_product(product)
    end
  end
end
