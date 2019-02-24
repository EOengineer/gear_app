defmodule GearAppWeb.PageController do
  use GearAppWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
