defmodule HuntCutdown.Equipments do
  @moduledoc """
  The Equipments context.
  """

  import Ecto.Query, warn: false
  alias HuntCutdown.Repo

  alias HuntCutdown.Equipments.WeaponCategories

  @doc """
  Returns the list of weapon_categories.

  ## Examples

      iex> list_weapon_categories()
      [%WeaponCategories{}, ...]

  """
  def list_weapon_categories do
    Repo.all(WeaponCategories)
  end

  @doc """
  Gets a single weapon_categories.

  Raises `Ecto.NoResultsError` if the Weapon categories does not exist.

  ## Examples

      iex> get_weapon_categories!(123)
      %WeaponCategories{}

      iex> get_weapon_categories!(456)
      ** (Ecto.NoResultsError)

  """
  def get_weapon_categories!(id), do: Repo.get!(WeaponCategories, id)

  @doc """
  Creates a weapon_categories.

  ## Examples

      iex> create_weapon_categories(%{field: value})
      {:ok, %WeaponCategories{}}

      iex> create_weapon_categories(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_weapon_categories(attrs \\ %{}) do
    %WeaponCategories{}
    |> WeaponCategories.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a weapon_categories.

  ## Examples

      iex> update_weapon_categories(weapon_categories, %{field: new_value})
      {:ok, %WeaponCategories{}}

      iex> update_weapon_categories(weapon_categories, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_weapon_categories(%WeaponCategories{} = weapon_categories, attrs) do
    weapon_categories
    |> WeaponCategories.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a weapon_categories.

  ## Examples

      iex> delete_weapon_categories(weapon_categories)
      {:ok, %WeaponCategories{}}

      iex> delete_weapon_categories(weapon_categories)
      {:error, %Ecto.Changeset{}}

  """
  def delete_weapon_categories(%WeaponCategories{} = weapon_categories) do
    Repo.delete(weapon_categories)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking weapon_categories changes.

  ## Examples

      iex> change_weapon_categories(weapon_categories)
      %Ecto.Changeset{data: %WeaponCategories{}}

  """
  def change_weapon_categories(%WeaponCategories{} = weapon_categories, attrs \\ %{}) do
    WeaponCategories.changeset(weapon_categories, attrs)
  end

  alias HuntCutdown.Equipments.Weapons

  @doc """
  Returns the list of weapons.

  ## Examples

      iex> list_weapons()
      [%Weapons{}, ...]

  """
  def list_weapons do
    Repo.all(Weapons)
  end

  @doc """
  Gets a single weapons.

  Raises `Ecto.NoResultsError` if the Weapons does not exist.

  ## Examples

      iex> get_weapons!(123)
      %Weapons{}

      iex> get_weapons!(456)
      ** (Ecto.NoResultsError)

  """
  def get_weapons!(id), do: Repo.get!(Weapons, id)

  @doc """
  Creates a weapons.

  ## Examples

      iex> create_weapons(%{field: value})
      {:ok, %Weapons{}}

      iex> create_weapons(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_weapons(attrs \\ %{}) do
    %Weapons{}
    |> Weapons.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a weapons.

  ## Examples

      iex> update_weapons(weapons, %{field: new_value})
      {:ok, %Weapons{}}

      iex> update_weapons(weapons, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_weapons(%Weapons{} = weapons, attrs) do
    weapons
    |> Weapons.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a weapons.

  ## Examples

      iex> delete_weapons(weapons)
      {:ok, %Weapons{}}

      iex> delete_weapons(weapons)
      {:error, %Ecto.Changeset{}}

  """
  def delete_weapons(%Weapons{} = weapons) do
    Repo.delete(weapons)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking weapons changes.

  ## Examples

      iex> change_weapons(weapons)
      %Ecto.Changeset{data: %Weapons{}}

  """
  def change_weapons(%Weapons{} = weapons, attrs \\ %{}) do
    Weapons.changeset(weapons, attrs)
  end

  alias HuntCutdown.Equipments.WeaponAmmos

  @doc """
  Returns the list of weapon_ammos.

  ## Examples

      iex> list_weapon_ammos()
      [%WeaponAmmos{}, ...]

  """
  def list_weapon_ammos do
    Repo.all(WeaponAmmos)
  end

  @doc """
  Gets a single weapon_ammos.

  Raises `Ecto.NoResultsError` if the Weapon ammos does not exist.

  ## Examples

      iex> get_weapon_ammos!(123)
      %WeaponAmmos{}

      iex> get_weapon_ammos!(456)
      ** (Ecto.NoResultsError)

  """
  def get_weapon_ammos!(id), do: Repo.get!(WeaponAmmos, id)

  @doc """
  Creates a weapon_ammos.

  ## Examples

      iex> create_weapon_ammos(%{field: value})
      {:ok, %WeaponAmmos{}}

      iex> create_weapon_ammos(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_weapon_ammos(attrs \\ %{}) do
    %WeaponAmmos{}
    |> WeaponAmmos.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a weapon_ammos.

  ## Examples

      iex> update_weapon_ammos(weapon_ammos, %{field: new_value})
      {:ok, %WeaponAmmos{}}

      iex> update_weapon_ammos(weapon_ammos, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_weapon_ammos(%WeaponAmmos{} = weapon_ammos, attrs) do
    weapon_ammos
    |> WeaponAmmos.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a weapon_ammos.

  ## Examples

      iex> delete_weapon_ammos(weapon_ammos)
      {:ok, %WeaponAmmos{}}

      iex> delete_weapon_ammos(weapon_ammos)
      {:error, %Ecto.Changeset{}}

  """
  def delete_weapon_ammos(%WeaponAmmos{} = weapon_ammos) do
    Repo.delete(weapon_ammos)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking weapon_ammos changes.

  ## Examples

      iex> change_weapon_ammos(weapon_ammos)
      %Ecto.Changeset{data: %WeaponAmmos{}}

  """
  def change_weapon_ammos(%WeaponAmmos{} = weapon_ammos, attrs \\ %{}) do
    WeaponAmmos.changeset(weapon_ammos, attrs)
  end

  alias HuntCutdown.Equipments.ToolCategories

  @doc """
  Returns the list of tool_categories.

  ## Examples

      iex> list_tool_categories()
      [%ToolCategories{}, ...]

  """
  def list_tool_categories do
    Repo.all(ToolCategories)
  end

  @doc """
  Gets a single tool_categories.

  Raises `Ecto.NoResultsError` if the Tool categories does not exist.

  ## Examples

      iex> get_tool_categories!(123)
      %ToolCategories{}

      iex> get_tool_categories!(456)
      ** (Ecto.NoResultsError)

  """
  def get_tool_categories!(id), do: Repo.get!(ToolCategories, id)

  @doc """
  Creates a tool_categories.

  ## Examples

      iex> create_tool_categories(%{field: value})
      {:ok, %ToolCategories{}}

      iex> create_tool_categories(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_tool_categories(attrs \\ %{}) do
    %ToolCategories{}
    |> ToolCategories.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a tool_categories.

  ## Examples

      iex> update_tool_categories(tool_categories, %{field: new_value})
      {:ok, %ToolCategories{}}

      iex> update_tool_categories(tool_categories, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_tool_categories(%ToolCategories{} = tool_categories, attrs) do
    tool_categories
    |> ToolCategories.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a tool_categories.

  ## Examples

      iex> delete_tool_categories(tool_categories)
      {:ok, %ToolCategories{}}

      iex> delete_tool_categories(tool_categories)
      {:error, %Ecto.Changeset{}}

  """
  def delete_tool_categories(%ToolCategories{} = tool_categories) do
    Repo.delete(tool_categories)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking tool_categories changes.

  ## Examples

      iex> change_tool_categories(tool_categories)
      %Ecto.Changeset{data: %ToolCategories{}}

  """
  def change_tool_categories(%ToolCategories{} = tool_categories, attrs \\ %{}) do
    ToolCategories.changeset(tool_categories, attrs)
  end

  alias HuntCutdown.Equipments.Tools

  @doc """
  Returns the list of tools.

  ## Examples

      iex> list_tools()
      [%Tools{}, ...]

  """
  def list_tools do
    Repo.all(Tools)
  end

  @doc """
  Gets a single tools.

  Raises `Ecto.NoResultsError` if the Tools does not exist.

  ## Examples

      iex> get_tools!(123)
      %Tools{}

      iex> get_tools!(456)
      ** (Ecto.NoResultsError)

  """
  def get_tools!(id), do: Repo.get!(Tools, id)

  @doc """
  Creates a tools.

  ## Examples

      iex> create_tools(%{field: value})
      {:ok, %Tools{}}

      iex> create_tools(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_tools(attrs \\ %{}) do
    %Tools{}
    |> Tools.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a tools.

  ## Examples

      iex> update_tools(tools, %{field: new_value})
      {:ok, %Tools{}}

      iex> update_tools(tools, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_tools(%Tools{} = tools, attrs) do
    tools
    |> Tools.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a tools.

  ## Examples

      iex> delete_tools(tools)
      {:ok, %Tools{}}

      iex> delete_tools(tools)
      {:error, %Ecto.Changeset{}}

  """
  def delete_tools(%Tools{} = tools) do
    Repo.delete(tools)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking tools changes.

  ## Examples

      iex> change_tools(tools)
      %Ecto.Changeset{data: %Tools{}}

  """
  def change_tools(%Tools{} = tools, attrs \\ %{}) do
    Tools.changeset(tools, attrs)
  end

  alias HuntCutdown.Equipments.ConsumableCategories

  @doc """
  Returns the list of consumable_categories.

  ## Examples

      iex> list_consumable_categories()
      [%ConsumableCategories{}, ...]

  """
  def list_consumable_categories do
    Repo.all(ConsumableCategories)
  end

  @doc """
  Gets a single consumable_categories.

  Raises `Ecto.NoResultsError` if the Consumable categories does not exist.

  ## Examples

      iex> get_consumable_categories!(123)
      %ConsumableCategories{}

      iex> get_consumable_categories!(456)
      ** (Ecto.NoResultsError)

  """
  def get_consumable_categories!(id), do: Repo.get!(ConsumableCategories, id)

  @doc """
  Creates a consumable_categories.

  ## Examples

      iex> create_consumable_categories(%{field: value})
      {:ok, %ConsumableCategories{}}

      iex> create_consumable_categories(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_consumable_categories(attrs \\ %{}) do
    %ConsumableCategories{}
    |> ConsumableCategories.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a consumable_categories.

  ## Examples

      iex> update_consumable_categories(consumable_categories, %{field: new_value})
      {:ok, %ConsumableCategories{}}

      iex> update_consumable_categories(consumable_categories, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_consumable_categories(%ConsumableCategories{} = consumable_categories, attrs) do
    consumable_categories
    |> ConsumableCategories.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a consumable_categories.

  ## Examples

      iex> delete_consumable_categories(consumable_categories)
      {:ok, %ConsumableCategories{}}

      iex> delete_consumable_categories(consumable_categories)
      {:error, %Ecto.Changeset{}}

  """
  def delete_consumable_categories(%ConsumableCategories{} = consumable_categories) do
    Repo.delete(consumable_categories)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking consumable_categories changes.

  ## Examples

      iex> change_consumable_categories(consumable_categories)
      %Ecto.Changeset{data: %ConsumableCategories{}}

  """
  def change_consumable_categories(%ConsumableCategories{} = consumable_categories, attrs \\ %{}) do
    ConsumableCategories.changeset(consumable_categories, attrs)
  end

  alias HuntCutdown.Equipments.Consumables

  @doc """
  Returns the list of consumables.

  ## Examples

      iex> list_consumables()
      [%Consumables{}, ...]

  """
  def list_consumables do
    Repo.all(Consumables)
  end

  @doc """
  Gets a single consumables.

  Raises `Ecto.NoResultsError` if the Consumables does not exist.

  ## Examples

      iex> get_consumables!(123)
      %Consumables{}

      iex> get_consumables!(456)
      ** (Ecto.NoResultsError)

  """
  def get_consumables!(id), do: Repo.get!(Consumables, id)

  @doc """
  Creates a consumables.

  ## Examples

      iex> create_consumables(%{field: value})
      {:ok, %Consumables{}}

      iex> create_consumables(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_consumables(attrs \\ %{}) do
    %Consumables{}
    |> Consumables.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a consumables.

  ## Examples

      iex> update_consumables(consumables, %{field: new_value})
      {:ok, %Consumables{}}

      iex> update_consumables(consumables, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_consumables(%Consumables{} = consumables, attrs) do
    consumables
    |> Consumables.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a consumables.

  ## Examples

      iex> delete_consumables(consumables)
      {:ok, %Consumables{}}

      iex> delete_consumables(consumables)
      {:error, %Ecto.Changeset{}}

  """
  def delete_consumables(%Consumables{} = consumables) do
    Repo.delete(consumables)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking consumables changes.

  ## Examples

      iex> change_consumables(consumables)
      %Ecto.Changeset{data: %Consumables{}}

  """
  def change_consumables(%Consumables{} = consumables, attrs \\ %{}) do
    Consumables.changeset(consumables, attrs)
  end
end
