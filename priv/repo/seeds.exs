# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     HuntCutdown.Repo.insert!(%HuntCutdown.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

defmodule HuntCutdown.SeedModule do
  alias HuntCutdown.Equipment.{
    WeaponCategory,
    Weapon,
    WeaponAmmo,
    ToolCategory,
    Tool,
    ConsumableCategory,
    Consumable
  }

  def assign() do
    assign_from_tables()
    assgin_null_objects()
  end

  defp assign_from_tables() do
    path_base = "priv/repo/seed_data"

    data_pairs = [
      {%WeaponCategory{}, "weapon_categories.csv"},
      {%Weapon{}, "weapons.csv"},
      {%WeaponAmmo{}, "weapon_ammos.csv"},
      {%ToolCategory{}, "tool_categories.csv"},
      {%Tool{}, "tools.csv"},
      {%ConsumableCategory{}, "consumable_categories.csv"},
      {%Consumable{}, "consumables.csv"}
    ]

    for {struct, path_rel} <- data_pairs do
      Path.join(path_base, path_rel)
      |> Explorer.DataFrame.from_csv!()
      |> Explorer.DataFrame.to_rows()
      |> Enum.map(&struct.__struct__.changeset(struct, &1))
      |> Enum.map(&HuntCutdown.Repo.insert!(&1))
    end
  end

  defp assgin_null_objects() do
    HuntCutdown.Equipment.list_weapon_categories()
    |> Enum.map(&WeaponAmmo.null_object_for(&1.id))
    |> Enum.map(&WeaponAmmo.changeset(&1, %{}))
    |> Enum.map(&HuntCutdown.Repo.insert!(&1))
  end
end

HuntCutdown.SeedModule.assign()
