defmodule HuntCutdown.Equipment do
  @moduledoc """
  The Equipment context.
  """

  import Ecto.Query, warn: false
  alias HuntCutdown.Repo

  alias HuntCutdown.Equipment.Weapon

  @doc """
  Returns the list of weapons.

  ## Examples

      iex> list_weapons()
      [%Weapon{}, ...]

  """
  def list_weapons do
    Repo.all(Weapon)
  end

  @doc """
  Gets a single weapon.

  Raises `Ecto.NoResultsError` if the Weapon does not exist.

  ## Examples

      iex> get_weapon!(123)
      %Weapon{}

      iex> get_weapon!(456)
      ** (Ecto.NoResultsError)

  """
  def get_weapon!(id), do: Repo.get!(Weapon, id)

  @doc """
  Creates a weapon.

  ## Examples

      iex> create_weapon(%{field: value})
      {:ok, %Weapon{}}

      iex> create_weapon(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_weapon(attrs \\ %{}) do
    %Weapon{}
    |> Weapon.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a weapon.

  ## Examples

      iex> update_weapon(weapon, %{field: new_value})
      {:ok, %Weapon{}}

      iex> update_weapon(weapon, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_weapon(%Weapon{} = weapon, attrs) do
    weapon
    |> Weapon.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a weapon.

  ## Examples

      iex> delete_weapon(weapon)
      {:ok, %Weapon{}}

      iex> delete_weapon(weapon)
      {:error, %Ecto.Changeset{}}

  """
  def delete_weapon(%Weapon{} = weapon) do
    Repo.delete(weapon)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking weapon changes.

  ## Examples

      iex> change_weapon(weapon)
      %Ecto.Changeset{data: %Weapon{}}

  """
  def change_weapon(%Weapon{} = weapon, attrs \\ %{}) do
    Weapon.changeset(weapon, attrs)
  end

  alias HuntCutdown.Equipment.WeaponCategory

  @doc """
  Returns the list of weapon_categories.

  ## Examples

      iex> list_weapon_categories()
      [%WeaponCategory{}, ...]

  """
  def list_weapon_categories do
    Repo.all(WeaponCategory)
  end

  @doc """
  Gets a single weapon_category.

  Raises `Ecto.NoResultsError` if the Weapon category does not exist.

  ## Examples

      iex> get_weapon_category!(123)
      %WeaponCategory{}

      iex> get_weapon_category!(456)
      ** (Ecto.NoResultsError)

  """
  def get_weapon_category!(id), do: Repo.get!(WeaponCategory, id)

  @doc """
  Creates a weapon_category.

  ## Examples

      iex> create_weapon_category(%{field: value})
      {:ok, %WeaponCategory{}}

      iex> create_weapon_category(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_weapon_category(attrs \\ %{}) do
    %WeaponCategory{}
    |> WeaponCategory.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a weapon_category.

  ## Examples

      iex> update_weapon_category(weapon_category, %{field: new_value})
      {:ok, %WeaponCategory{}}

      iex> update_weapon_category(weapon_category, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_weapon_category(%WeaponCategory{} = weapon_category, attrs) do
    weapon_category
    |> WeaponCategory.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a weapon_category.

  ## Examples

      iex> delete_weapon_category(weapon_category)
      {:ok, %WeaponCategory{}}

      iex> delete_weapon_category(weapon_category)
      {:error, %Ecto.Changeset{}}

  """
  def delete_weapon_category(%WeaponCategory{} = weapon_category) do
    Repo.delete(weapon_category)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking weapon_category changes.

  ## Examples

      iex> change_weapon_category(weapon_category)
      %Ecto.Changeset{data: %WeaponCategory{}}

  """
  def change_weapon_category(%WeaponCategory{} = weapon_category, attrs \\ %{}) do
    WeaponCategory.changeset(weapon_category, attrs)
  end

  alias HuntCutdown.Equipment.WeaponAmmo

  @doc """
  Returns the list of weapon_ammos.

  ## Examples

      iex> list_weapon_ammos()
      [%WeaponAmmo{}, ...]

  """
  def list_weapon_ammos do
    Repo.all(WeaponAmmo)
  end

  @doc """
  Gets a single weapon_ammo.

  Raises `Ecto.NoResultsError` if the Weapon ammo does not exist.

  ## Examples

      iex> get_weapon_ammo!(123)
      %WeaponAmmo{}

      iex> get_weapon_ammo!(456)
      ** (Ecto.NoResultsError)

  """
  def get_weapon_ammo!(id), do: Repo.get!(WeaponAmmo, id)

  @doc """
  Creates a weapon_ammo.

  ## Examples

      iex> create_weapon_ammo(%{field: value})
      {:ok, %WeaponAmmo{}}

      iex> create_weapon_ammo(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_weapon_ammo(attrs \\ %{}) do
    %WeaponAmmo{}
    |> WeaponAmmo.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a weapon_ammo.

  ## Examples

      iex> update_weapon_ammo(weapon_ammo, %{field: new_value})
      {:ok, %WeaponAmmo{}}

      iex> update_weapon_ammo(weapon_ammo, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_weapon_ammo(%WeaponAmmo{} = weapon_ammo, attrs) do
    weapon_ammo
    |> WeaponAmmo.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a weapon_ammo.

  ## Examples

      iex> delete_weapon_ammo(weapon_ammo)
      {:ok, %WeaponAmmo{}}

      iex> delete_weapon_ammo(weapon_ammo)
      {:error, %Ecto.Changeset{}}

  """
  def delete_weapon_ammo(%WeaponAmmo{} = weapon_ammo) do
    Repo.delete(weapon_ammo)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking weapon_ammo changes.

  ## Examples

      iex> change_weapon_ammo(weapon_ammo)
      %Ecto.Changeset{data: %WeaponAmmo{}}

  """
  def change_weapon_ammo(%WeaponAmmo{} = weapon_ammo, attrs \\ %{}) do
    WeaponAmmo.changeset(weapon_ammo, attrs)
  end

  alias HuntCutdown.Equipment.Tool

  @doc """
  Returns the list of tools.

  ## Examples

      iex> list_tools()
      [%Tool{}, ...]

  """
  def list_tools do
    Repo.all(Tool)
  end

  @doc """
  Gets a single tool.

  Raises `Ecto.NoResultsError` if the Tool does not exist.

  ## Examples

      iex> get_tool!(123)
      %Tool{}

      iex> get_tool!(456)
      ** (Ecto.NoResultsError)

  """
  def get_tool!(id), do: Repo.get!(Tool, id)

  @doc """
  Creates a tool.

  ## Examples

      iex> create_tool(%{field: value})
      {:ok, %Tool{}}

      iex> create_tool(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_tool(attrs \\ %{}) do
    %Tool{}
    |> Tool.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a tool.

  ## Examples

      iex> update_tool(tool, %{field: new_value})
      {:ok, %Tool{}}

      iex> update_tool(tool, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_tool(%Tool{} = tool, attrs) do
    tool
    |> Tool.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a tool.

  ## Examples

      iex> delete_tool(tool)
      {:ok, %Tool{}}

      iex> delete_tool(tool)
      {:error, %Ecto.Changeset{}}

  """
  def delete_tool(%Tool{} = tool) do
    Repo.delete(tool)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking tool changes.

  ## Examples

      iex> change_tool(tool)
      %Ecto.Changeset{data: %Tool{}}

  """
  def change_tool(%Tool{} = tool, attrs \\ %{}) do
    Tool.changeset(tool, attrs)
  end

  alias HuntCutdown.Equipment.ToolCategory

  @doc """
  Returns the list of tool_categories.

  ## Examples

      iex> list_tool_categories()
      [%ToolCategory{}, ...]

  """
  def list_tool_categories do
    Repo.all(ToolCategory)
  end

  @doc """
  Gets a single tool_category.

  Raises `Ecto.NoResultsError` if the Tool category does not exist.

  ## Examples

      iex> get_tool_category!(123)
      %ToolCategory{}

      iex> get_tool_category!(456)
      ** (Ecto.NoResultsError)

  """
  def get_tool_category!(id), do: Repo.get!(ToolCategory, id)

  @doc """
  Creates a tool_category.

  ## Examples

      iex> create_tool_category(%{field: value})
      {:ok, %ToolCategory{}}

      iex> create_tool_category(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_tool_category(attrs \\ %{}) do
    %ToolCategory{}
    |> ToolCategory.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a tool_category.

  ## Examples

      iex> update_tool_category(tool_category, %{field: new_value})
      {:ok, %ToolCategory{}}

      iex> update_tool_category(tool_category, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_tool_category(%ToolCategory{} = tool_category, attrs) do
    tool_category
    |> ToolCategory.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a tool_category.

  ## Examples

      iex> delete_tool_category(tool_category)
      {:ok, %ToolCategory{}}

      iex> delete_tool_category(tool_category)
      {:error, %Ecto.Changeset{}}

  """
  def delete_tool_category(%ToolCategory{} = tool_category) do
    Repo.delete(tool_category)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking tool_category changes.

  ## Examples

      iex> change_tool_category(tool_category)
      %Ecto.Changeset{data: %ToolCategory{}}

  """
  def change_tool_category(%ToolCategory{} = tool_category, attrs \\ %{}) do
    ToolCategory.changeset(tool_category, attrs)
  end

  alias HuntCutdown.Equipment.Consumable

  @doc """
  Returns the list of consumables.

  ## Examples

      iex> list_consumables()
      [%Consumable{}, ...]

  """
  def list_consumables do
    Repo.all(Consumable)
  end

  @doc """
  Gets a single consumable.

  Raises `Ecto.NoResultsError` if the Consumable does not exist.

  ## Examples

      iex> get_consumable!(123)
      %Consumable{}

      iex> get_consumable!(456)
      ** (Ecto.NoResultsError)

  """
  def get_consumable!(id), do: Repo.get!(Consumable, id)

  @doc """
  Creates a consumable.

  ## Examples

      iex> create_consumable(%{field: value})
      {:ok, %Consumable{}}

      iex> create_consumable(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_consumable(attrs \\ %{}) do
    %Consumable{}
    |> Consumable.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a consumable.

  ## Examples

      iex> update_consumable(consumable, %{field: new_value})
      {:ok, %Consumable{}}

      iex> update_consumable(consumable, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_consumable(%Consumable{} = consumable, attrs) do
    consumable
    |> Consumable.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a consumable.

  ## Examples

      iex> delete_consumable(consumable)
      {:ok, %Consumable{}}

      iex> delete_consumable(consumable)
      {:error, %Ecto.Changeset{}}

  """
  def delete_consumable(%Consumable{} = consumable) do
    Repo.delete(consumable)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking consumable changes.

  ## Examples

      iex> change_consumable(consumable)
      %Ecto.Changeset{data: %Consumable{}}

  """
  def change_consumable(%Consumable{} = consumable, attrs \\ %{}) do
    Consumable.changeset(consumable, attrs)
  end

  alias HuntCutdown.Equipment.ConsumableCategory

  @doc """
  Returns the list of consumable_categories.

  ## Examples

      iex> list_consumable_categories()
      [%ConsumableCategory{}, ...]

  """
  def list_consumable_categories do
    Repo.all(ConsumableCategory)
  end

  @doc """
  Gets a single consumable_category.

  Raises `Ecto.NoResultsError` if the Consumable category does not exist.

  ## Examples

      iex> get_consumable_category!(123)
      %ConsumableCategory{}

      iex> get_consumable_category!(456)
      ** (Ecto.NoResultsError)

  """
  def get_consumable_category!(id), do: Repo.get!(ConsumableCategory, id)

  @doc """
  Creates a consumable_category.

  ## Examples

      iex> create_consumable_category(%{field: value})
      {:ok, %ConsumableCategory{}}

      iex> create_consumable_category(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_consumable_category(attrs \\ %{}) do
    %ConsumableCategory{}
    |> ConsumableCategory.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a consumable_category.

  ## Examples

      iex> update_consumable_category(consumable_category, %{field: new_value})
      {:ok, %ConsumableCategory{}}

      iex> update_consumable_category(consumable_category, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_consumable_category(%ConsumableCategory{} = consumable_category, attrs) do
    consumable_category
    |> ConsumableCategory.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a consumable_category.

  ## Examples

      iex> delete_consumable_category(consumable_category)
      {:ok, %ConsumableCategory{}}

      iex> delete_consumable_category(consumable_category)
      {:error, %Ecto.Changeset{}}

  """
  def delete_consumable_category(%ConsumableCategory{} = consumable_category) do
    Repo.delete(consumable_category)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking consumable_category changes.

  ## Examples

      iex> change_consumable_category(consumable_category)
      %Ecto.Changeset{data: %ConsumableCategory{}}

  """
  def change_consumable_category(%ConsumableCategory{} = consumable_category, attrs \\ %{}) do
    ConsumableCategory.changeset(consumable_category, attrs)
  end
end
