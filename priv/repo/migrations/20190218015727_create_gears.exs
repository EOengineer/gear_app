defmodule GearApp.Repo.Migrations.CreateGears do
  use Ecto.Migration

  def change do
    create table(:gears) do
      add :title, :string
      add :description, :text

      timestamps()
    end

  end
end
