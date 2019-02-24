defmodule GearAppWeb.GearView do
  use GearAppWeb, :view
  alias GearAppWeb.GearView

  def render("index.json", %{gears: gears}) do
    %{data: render_many(gears, GearView, "gear.json")}
  end

  def render("show.json", %{gear: gear}) do
    %{data: render_one(gear, GearView, "gear.json")}
  end

  def render("gear.json", %{gear: gear}) do
    %{id: gear.id,
      title: gear.title,
      description: gear.description}
  end
end
