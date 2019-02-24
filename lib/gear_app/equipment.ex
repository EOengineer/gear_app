defmodule GearApp.Equipment do
  @moduledoc """
  The Equipment context.
  """

  import Ecto.Query, warn: false
  alias GearApp.Repo

  alias GearApp.Equipment.Gear

  @doc """
  Returns the list of gears.

  ## Examples

      iex> list_gears()
      [%Gear{}, ...]

  """
  def list_gears do
    Repo.all(Gear)
  end

  @doc """
  Gets a single gear.

  Raises `Ecto.NoResultsError` if the Gear does not exist.

  ## Examples

      iex> get_gear!(123)
      %Gear{}

      iex> get_gear!(456)
      ** (Ecto.NoResultsError)

  """
  def get_gear!(id), do: Repo.get!(Gear, id)

  @doc """
  Creates a gear.

  ## Examples

      iex> create_gear(%{field: value})
      {:ok, %Gear{}}

      iex> create_gear(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_gear(attrs \\ %{}) do
    %Gear{}
    |> Gear.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a gear.

  ## Examples

      iex> update_gear(gear, %{field: new_value})
      {:ok, %Gear{}}

      iex> update_gear(gear, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_gear(%Gear{} = gear, attrs) do
    gear
    |> Gear.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Gear.

  ## Examples

      iex> delete_gear(gear)
      {:ok, %Gear{}}

      iex> delete_gear(gear)
      {:error, %Ecto.Changeset{}}

  """
  def delete_gear(%Gear{} = gear) do
    Repo.delete(gear)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking gear changes.

  ## Examples

      iex> change_gear(gear)
      %Ecto.Changeset{source: %Gear{}}

  """
  def change_gear(%Gear{} = gear) do
    Gear.changeset(gear, %{})
  end
end
