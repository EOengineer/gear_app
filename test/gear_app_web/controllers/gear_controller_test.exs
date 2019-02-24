defmodule GearAppWeb.GearControllerTest do
  use GearAppWeb.ConnCase

  alias GearApp.Equipment
  alias GearApp.Equipment.Gear

  @create_attrs %{
    description: "some description",
    title: "some title"
  }
  @update_attrs %{
    description: "some updated description",
    title: "some updated title"
  }
  @invalid_attrs %{description: nil, title: nil}

  def fixture(:gear) do
    {:ok, gear} = Equipment.create_gear(@create_attrs)
    gear
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all gears", %{conn: conn} do
      conn = get(conn, Routes.gear_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create gear" do
    test "renders gear when data is valid", %{conn: conn} do
      conn = post(conn, Routes.gear_path(conn, :create), gear: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.gear_path(conn, :show, id))

      assert %{
               "id" => id,
               "description" => "some description",
               "title" => "some title"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.gear_path(conn, :create), gear: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update gear" do
    setup [:create_gear]

    test "renders gear when data is valid", %{conn: conn, gear: %Gear{id: id} = gear} do
      conn = put(conn, Routes.gear_path(conn, :update, gear), gear: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.gear_path(conn, :show, id))

      assert %{
               "id" => id,
               "description" => "some updated description",
               "title" => "some updated title"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, gear: gear} do
      conn = put(conn, Routes.gear_path(conn, :update, gear), gear: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete gear" do
    setup [:create_gear]

    test "deletes chosen gear", %{conn: conn, gear: gear} do
      conn = delete(conn, Routes.gear_path(conn, :delete, gear))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.gear_path(conn, :show, gear))
      end
    end
  end

  defp create_gear(_) do
    gear = fixture(:gear)
    {:ok, gear: gear}
  end
end
