defmodule GearApp.EquipmentTest do
  use GearApp.DataCase

  alias GearApp.Equipment

  describe "gears" do
    alias GearApp.Equipment.Gear

    @valid_attrs %{description: "some description", title: "some title"}
    @update_attrs %{description: "some updated description", title: "some updated title"}
    @invalid_attrs %{description: nil, title: nil}

    def gear_fixture(attrs \\ %{}) do
      {:ok, gear} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Equipment.create_gear()

      gear
    end

    test "list_gears/0 returns all gears" do
      gear = gear_fixture()
      assert Equipment.list_gears() == [gear]
    end

    test "get_gear!/1 returns the gear with given id" do
      gear = gear_fixture()
      assert Equipment.get_gear!(gear.id) == gear
    end

    test "create_gear/1 with valid data creates a gear" do
      assert {:ok, %Gear{} = gear} = Equipment.create_gear(@valid_attrs)
      assert gear.description == "some description"
      assert gear.title == "some title"
    end

    test "create_gear/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Equipment.create_gear(@invalid_attrs)
    end

    test "update_gear/2 with valid data updates the gear" do
      gear = gear_fixture()
      assert {:ok, %Gear{} = gear} = Equipment.update_gear(gear, @update_attrs)
      assert gear.description == "some updated description"
      assert gear.title == "some updated title"
    end

    test "update_gear/2 with invalid data returns error changeset" do
      gear = gear_fixture()
      assert {:error, %Ecto.Changeset{}} = Equipment.update_gear(gear, @invalid_attrs)
      assert gear == Equipment.get_gear!(gear.id)
    end

    test "delete_gear/1 deletes the gear" do
      gear = gear_fixture()
      assert {:ok, %Gear{}} = Equipment.delete_gear(gear)
      assert_raise Ecto.NoResultsError, fn -> Equipment.get_gear!(gear.id) end
    end

    test "change_gear/1 returns a gear changeset" do
      gear = gear_fixture()
      assert %Ecto.Changeset{} = Equipment.change_gear(gear)
    end
  end
end
