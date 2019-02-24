defmodule GearAppWeb.GearController do
  use GearAppWeb, :controller

  alias GearApp.Equipment
  alias GearApp.Equipment.Gear

  action_fallback GearAppWeb.FallbackController

  def index(conn, _params) do
    gears = Equipment.list_gears()
    render(conn, "index.json", gears: gears)
  end

  def create(conn, %{"gear" => gear_params}) do
    with {:ok, %Gear{} = gear} <- Equipment.create_gear(gear_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.gear_path(conn, :show, gear))
      |> render("show.json", gear: gear)
    end
  end

  def show(conn, %{"id" => id}) do
    gear = Equipment.get_gear!(id)
    render(conn, "show.json", gear: gear)
  end

  def update(conn, %{"id" => id, "gear" => gear_params}) do
    gear = Equipment.get_gear!(id)

    with {:ok, %Gear{} = gear} <- Equipment.update_gear(gear, gear_params) do
      render(conn, "show.json", gear: gear)
    end
  end

  def delete(conn, %{"id" => id}) do
    gear = Equipment.get_gear!(id)

    with {:ok, %Gear{}} <- Equipment.delete_gear(gear) do
      send_resp(conn, :no_content, "")
    end
  end
end
