defmodule HuntCutdown.EquipmentsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `HuntCutdown.Equipments` context.
  """

  @doc """
  Generate a weapon_categories.
  """
  def weapon_categories_fixture(attrs \\ %{}) do
    {:ok, weapon_categories} =
      attrs
      |> Enum.into(%{
        full_name: "some full_name",
        id: "some id",
        short_name: "some short_name"
      })
      |> HuntCutdown.Equipments.create_weapon_categories()

    weapon_categories
  end

  @doc """
  Generate a weapons.
  """
  def weapons_fixture(attrs \\ %{}) do
    {:ok, weapons} =
      attrs
      |> Enum.into(%{
        ammo_slot_count: 42,
        category_id: "some category_id",
        cost: 42,
        full_name: "some full_name",
        id: "some id",
        short_name: "some short_name",
        size: 42
      })
      |> HuntCutdown.Equipments.create_weapons()

    weapons
  end

  @doc """
  Generate a weapon_ammos.
  """
  def weapon_ammos_fixture(attrs \\ %{}) do
    {:ok, weapon_ammos} =
      attrs
      |> Enum.into(%{
        cost: 42,
        full_name: "some full_name",
        id: "some id",
        short_name: "some short_name",
        weapon_category_id: "some weapon_category_id"
      })
      |> HuntCutdown.Equipments.create_weapon_ammos()

    weapon_ammos
  end

  @doc """
  Generate a tool_categories.
  """
  def tool_categories_fixture(attrs \\ %{}) do
    {:ok, tool_categories} =
      attrs
      |> Enum.into(%{
        full_name: "some full_name",
        id: "some id",
        short_name: "some short_name"
      })
      |> HuntCutdown.Equipments.create_tool_categories()

    tool_categories
  end

  @doc """
  Generate a tools.
  """
  def tools_fixture(attrs \\ %{}) do
    {:ok, tools} =
      attrs
      |> Enum.into(%{
        category_id: "some category_id",
        cost: 42,
        full_name: "some full_name",
        id: "some id",
        short_name: "some short_name"
      })
      |> HuntCutdown.Equipments.create_tools()

    tools
  end

  @doc """
  Generate a consumable_categories.
  """
  def consumable_categories_fixture(attrs \\ %{}) do
    {:ok, consumable_categories} =
      attrs
      |> Enum.into(%{
        full_name: "some full_name",
        id: "some id",
        short_name: "some short_name"
      })
      |> HuntCutdown.Equipments.create_consumable_categories()

    consumable_categories
  end

  @doc """
  Generate a consumables.
  """
  def consumables_fixture(attrs \\ %{}) do
    {:ok, consumables} =
      attrs
      |> Enum.into(%{
        category_id: "some category_id",
        cost: 42,
        full_name: "some full_name",
        id: "some id",
        short_name: "some short_name"
      })
      |> HuntCutdown.Equipments.create_consumables()

    consumables
  end
end
