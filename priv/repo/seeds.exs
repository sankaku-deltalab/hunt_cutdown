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
      path = Path.join(path_base, path_rel)
      df = Explorer.DataFrame.from_csv!(path)

      for row <- Explorer.DataFrame.to_rows(df) do
        struct
        |> struct.__struct__.changeset(row)
        |> HuntCutdown.Repo.insert!()
      end
    end
  end
end

HuntCutdown.SeedModule.assign()
