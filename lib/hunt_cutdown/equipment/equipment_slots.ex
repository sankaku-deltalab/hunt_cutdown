defmodule HuntCutdown.Equipment.EquipmentSlots do
  alias HuntCutdown.Equipment.{
    Weapon,
    WeaponAmmo,
    Tool,
    Consumable
  }

  @total_weapon_size_max 4

  defstruct weapon_1: Weapon.null_object(),
            weapon_2: Weapon.null_object(),
            ammo_1_1: WeaponAmmo.null_object(),
            ammo_1_2: WeaponAmmo.null_object(),
            ammo_2_1: WeaponAmmo.null_object(),
            ammo_2_2: WeaponAmmo.null_object(),
            tool_1: Tool.null_object(),
            tool_2: Tool.null_object(),
            tool_3: Tool.null_object(),
            tool_4: Tool.null_object(),
            consumable_1: Consumable.null_object(),
            consumable_2: Consumable.null_object(),
            consumable_3: Consumable.null_object(),
            consumable_4: Consumable.null_object()

  @type t() :: %__MODULE__{
          weapon_1: Weapon,
          weapon_2: Weapon,
          ammo_1_1: WeaponAmmo,
          ammo_1_2: WeaponAmmo,
          ammo_2_1: WeaponAmmo,
          ammo_2_2: WeaponAmmo,
          tool_1: Tool,
          tool_2: Tool,
          tool_3: Tool,
          tool_4: Tool,
          consumable_1: Consumable,
          consumable_2: Consumable,
          consumable_3: Consumable,
          consumable_4: Consumable
        }

  def cost(%__MODULE__{} = slots) do
    weapons = 1..2 |> Enum.map(&get_weapon(slots, &1))
    ammos = 1..2 |> Enum.flat_map(fn w_pos -> Enum.map(1..2, &get_ammo(slots, w_pos, &1)) end)
    tools = 1..4 |> Enum.map(&get_tool(slots, &1))
    consumables = 1..4 |> Enum.map(&get_consumable(slots, &1))

    (weapons ++ ammos ++ tools ++ consumables)
    |> Enum.map(& &1.cost)
    |> Enum.sum()
  end

  def can_put_weapon?(%__MODULE__{} = slots, pos, %Weapon{} = new_weapon) when pos in 1..2 do
    another_pos =
      if pos == 1 do
        2
      else
        1
      end

    another_weapon = slots |> get_weapon(another_pos)
    another_weapon.size + new_weapon.size <= @total_weapon_size_max
  end

  def can_put_ammo?(
        %__MODULE__{} = slots,
        weapon_pos,
        ammo_pos,
        %WeaponAmmo{weapon_category_id: ammo_cid}
      )
      when weapon_pos in 1..2 and ammo_pos in 1..2 do
    weapon = get_weapon(slots, weapon_pos)
    slot_size = weapon.ammo_slot_count
    weapon_cid = weapon.category_id
    ammo_cid == weapon_cid and slot_size >= ammo_pos
  end

  def get_weapon(%__MODULE__{} = slots, pos) when pos in 1..2 do
    if pos == 1 do
      slots.weapon_1
    else
      slots.weapon_2
    end
  end

  def put_weapon(%__MODULE__{} = slots, pos, %Weapon{} = weapon) when pos in 1..2 do
    if can_put_weapon?(slots, pos, weapon) do
      slots
      |> raw_put_weapon(pos, weapon)
      |> raw_put_ammo(pos, 1, WeaponAmmo.null_object())
      |> raw_put_ammo(pos, 2, WeaponAmmo.null_object())
    else
      slots
    end
  end

  def drop_weapon(%__MODULE__{} = slots, pos) when pos in 1..2 do
    slots
    |> raw_put_weapon(pos, Weapon.null_object())
    |> raw_put_ammo(pos, 1, WeaponAmmo.null_object())
    |> raw_put_ammo(pos, 2, WeaponAmmo.null_object())
  end

  def get_ammo(%__MODULE__{} = slots, weapon_pos, ammo_pos)
      when weapon_pos in 1..2 and ammo_pos in 1..2 do
    cond do
      weapon_pos == 1 and ammo_pos == 1 -> slots.ammo_1_1
      weapon_pos == 1 and ammo_pos == 2 -> slots.ammo_1_2
      weapon_pos == 2 and ammo_pos == 1 -> slots.ammo_2_1
      weapon_pos == 2 and ammo_pos == 2 -> slots.ammo_2_2
    end
  end

  def put_ammo(%__MODULE__{} = slots, weapon_pos, ammo_pos, %WeaponAmmo{} = ammo)
      when weapon_pos in 1..2 and ammo_pos in 1..2 do
    if can_put_ammo?(slots, weapon_pos, ammo_pos, ammo) do
      slots
      |> raw_put_ammo(weapon_pos, ammo_pos, ammo)
    else
      slots
    end
  end

  def drop_ammo(%__MODULE__{} = slots, weapon_pos, ammo_pos)
      when weapon_pos in 1..2 and ammo_pos in 1..2 do
    slots
    |> raw_put_ammo(weapon_pos, ammo_pos, WeaponAmmo.null_object())
  end

  def get_tool(%__MODULE__{} = slots, pos) when pos in 1..4 do
    cond do
      pos == 1 -> slots.tool_1
      pos == 2 -> slots.tool_2
      pos == 3 -> slots.tool_3
      pos == 4 -> slots.tool_4
    end
  end

  def put_tool(%__MODULE__{} = slots, pos, %Tool{} = tool) when pos in 1..4 do
    raw_put_tool(slots, pos, tool)
  end

  def drop_tool(%__MODULE__{} = slots, pos) when pos in 1..4 do
    raw_put_tool(slots, pos, Tool.null_object())
  end

  def get_consumable(%__MODULE__{} = slots, pos) when pos in 1..4 do
    cond do
      pos == 1 -> slots.consumable_1
      pos == 2 -> slots.consumable_2
      pos == 3 -> slots.consumable_3
      pos == 4 -> slots.consumable_4
    end
  end

  def put_consumable(%__MODULE__{} = slots, pos, %Consumable{} = consumable) when pos in 1..4 do
    raw_put_consumable(slots, pos, consumable)
  end

  def drop_consumable(%__MODULE__{} = slots, pos) when pos in 1..4 do
    raw_put_consumable(slots, pos, Consumable.null_object())
  end

  defp raw_put_weapon(%__MODULE__{} = slots, pos, %Weapon{} = weapon) when pos in 1..2 do
    if pos == 1 do
      Map.put(slots, :weapon_1, weapon)
    else
      Map.put(slots, :weapon_2, weapon)
    end
  end

  defp raw_put_ammo(%__MODULE__{} = slots, weapon_pos, ammo_pos, %WeaponAmmo{} = ammo)
       when weapon_pos in 1..2 and ammo_pos in 1..2 do
    cond do
      weapon_pos == 1 and ammo_pos == 1 -> Map.put(slots, :ammo_1_1, ammo)
      weapon_pos == 1 and ammo_pos == 2 -> Map.put(slots, :ammo_1_2, ammo)
      weapon_pos == 2 and ammo_pos == 1 -> Map.put(slots, :ammo_2_1, ammo)
      weapon_pos == 2 and ammo_pos == 2 -> Map.put(slots, :ammo_2_2, ammo)
    end
  end

  defp raw_put_tool(%__MODULE__{} = slots, pos, %Tool{} = tool) when pos in 1..4 do
    cond do
      pos == 1 -> Map.put(slots, :tool_1, tool)
      pos == 2 -> Map.put(slots, :tool_2, tool)
      pos == 3 -> Map.put(slots, :tool_3, tool)
      pos == 4 -> Map.put(slots, :tool_4, tool)
    end
  end

  defp raw_put_consumable(%__MODULE__{} = slots, pos, %Consumable{} = consumable)
       when pos in 1..4 do
    cond do
      pos == 1 -> Map.put(slots, :consumable_1, consumable)
      pos == 2 -> Map.put(slots, :consumable_2, consumable)
      pos == 3 -> Map.put(slots, :consumable_3, consumable)
      pos == 4 -> Map.put(slots, :consumable_4, consumable)
    end
  end
end
