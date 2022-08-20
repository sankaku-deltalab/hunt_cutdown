defmodule HuntCutdown.SeedModule.Setup do
  alias HuntCutdown.Equipment.{
    WeaponCategory,
    Weapon,
    WeaponAmmo,
    ToolCategory,
    Tool,
    ConsumableCategory,
    Consumable
  }

  def run() do
    assign_from_tables()
  end

  defp assign_from_tables() do
    path_base = "lib/hunt_cutdown/seed_module/seed_data"

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
      module = struct.__struct__

      rows =
        Path.join(path_base, path_rel)
        |> Explorer.DataFrame.from_csv!()
        |> Explorer.DataFrame.to_rows()

      null_object_rows = get_null_objects(module) |> Enum.map(&struct_to_row_like(&1))

      rows = rows ++ null_object_rows

      old_records = HuntCutdown.Repo.all(module) |> Map.new(&{&1.id, &1})
      new_data_id_set = MapSet.new(rows |> Enum.map(& &1["id"]))

      old_records
      |> Map.values()
      |> Enum.filter(&(not MapSet.member?(new_data_id_set, &1.id)))
      |> Enum.map(&HuntCutdown.Repo.delete!(&1))

      rows
      |> Enum.map(&module.changeset(Map.get(old_records, &1["id"], struct), &1))
      |> Enum.map(&HuntCutdown.Repo.insert_or_update!(&1))
    end
  end

  defp struct_to_row_like(struct) do
    struct
    |> Map.to_list()
    |> Enum.filter(fn {k, _v} -> is_atom(k) end)
    |> Enum.filter(fn {k, _v} -> k not in [:__meta__, :__struct__] end)
    |> Enum.map(fn {k, v} -> {Atom.to_string(k), v} end)
    |> Map.new()
  end

  defp get_null_objects(WeaponAmmo) do
    HuntCutdown.Equipment.list_weapon_categories()
    |> Enum.map(&WeaponAmmo.null_object_for(&1.id))
  end

  defp get_null_objects(_module) do
    []
  end
end
