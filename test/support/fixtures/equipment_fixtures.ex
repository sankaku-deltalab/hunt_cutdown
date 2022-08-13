defmodule HuntCutdown.EquipmentFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `HuntCutdown.Equipment` context.
  """

  def weapon_category_id() do
    "test_weapon_category_id"
  end

  def weapon_category_id_2() do
    "test_weapon_category_id_2"
  end

  def tool_category_id() do
    "test_tool_category_id"
  end

  def tool_category_id_2() do
    "test_tool_category_id_2"
  end

  def consumable_category_id() do
    "test_consumable_category_id"
  end

  def consumable_category_id_2() do
    "test_consumable_category_id_2"
  end

  @doc """
  Generate a weapon.
  """
  def weapon_fixture(attrs \\ %{}) do
    {:ok, weapon} =
      attrs
      |> Enum.into(%{
        ammo_slot_count: 42,
        category_id: weapon_category_id(),
        cost: 42,
        full_name: "some full_name",
        id: "some id",
        short_name: "some short_name",
        size: 42
      })
      |> HuntCutdown.Equipment.create_weapon()

    weapon
  end

  @doc """
  Generate a weapon_category.
  """
  def weapon_category_fixture(attrs \\ %{}) do
    {:ok, weapon_category} =
      attrs
      |> Enum.into(%{
        full_name: "some full_name",
        id: "some id",
        short_name: "some short_name"
      })
      |> HuntCutdown.Equipment.create_weapon_category()

    weapon_category
  end

  @doc """
  Generate a weapon_ammo.
  """
  def weapon_ammo_fixture(attrs \\ %{}) do
    {:ok, weapon_ammo} =
      attrs
      |> Enum.into(%{
        cost: 42,
        full_name: "some full_name",
        id: "some id",
        short_name: "some short_name",
        weapon_category_id: weapon_category_id()
      })
      |> HuntCutdown.Equipment.create_weapon_ammo()

    weapon_ammo
  end

  @doc """
  Generate a tool.
  """
  def tool_fixture(attrs \\ %{}) do
    {:ok, tool} =
      attrs
      |> Enum.into(%{
        category_id: tool_category_id(),
        cost: 42,
        full_name: "some full_name",
        id: "some id",
        short_name: "some short_name"
      })
      |> HuntCutdown.Equipment.create_tool()

    tool
  end

  @doc """
  Generate a tool_category.
  """
  def tool_category_fixture(attrs \\ %{}) do
    {:ok, tool_category} =
      attrs
      |> Enum.into(%{
        full_name: "some full_name",
        id: "some id",
        short_name: "some short_name"
      })
      |> HuntCutdown.Equipment.create_tool_category()

    tool_category
  end

  @doc """
  Generate a consumable.
  """
  def consumable_fixture(attrs \\ %{}) do
    {:ok, consumable} =
      attrs
      |> Enum.into(%{
        category_id: consumable_category_id(),
        cost: 42,
        full_name: "some full_name",
        id: "some id",
        short_name: "some short_name"
      })
      |> HuntCutdown.Equipment.create_consumable()

    consumable
  end

  @doc """
  Generate a consumable_category.
  """
  def consumable_category_fixture(attrs \\ %{}) do
    {:ok, consumable_category} =
      attrs
      |> Enum.into(%{
        full_name: "some full_name",
        id: "some id",
        short_name: "some short_name"
      })
      |> HuntCutdown.Equipment.create_consumable_category()

    consumable_category
  end
end
