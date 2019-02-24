defmodule GearApp.Equipment.Gear do
  use Ecto.Schema
  import Ecto.Changeset


  schema "gears" do
    field :description, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(gear, attrs) do
    gear
    |> cast(attrs, [:title, :description])
    |> validate_required([:title, :description])
  end
end
