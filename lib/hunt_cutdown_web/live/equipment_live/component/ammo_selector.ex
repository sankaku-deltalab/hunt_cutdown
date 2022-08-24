defmodule HuntCutdownWeb.EquipmentLive.Components.AmmoSelector do
  use HuntCutdownWeb, :live_component
  # import Phoenix.LiveView

  alias Phoenix.LiveView.Socket
  alias HuntCutdown.Equipment.{EquipmentSlots, WeaponAmmo}
  alias HuntCutdownWeb.EquipmentLive.Components
  alias HuntCutdownWeb.EquipmentLive.Components.EquipmentSelector.SelectContent

  @impl true
  def mount(%Socket{} = socket) do
    {:ok, socket}
  end

  @impl true
  def render(
        %{
          slots: %EquipmentSlots{} = slots,
          weapon_pos: weapon_pos,
          ammo_pos: ammo_pos,
          ammos: ammos,
          categories: categories
        } = assigns
      ) do
    ~H"""
    <div>
      <.live_component
        module={Components.EquipmentSelector}
        id="selector"
        close_event="abort_select"
        select_event="put_ammo"
        contents={create_select_contents(slots, weapon_pos, ammo_pos, ammos, categories)}
      />
    </div>
    """
  end

  defp create_select_contents(%EquipmentSlots{} = slots, weapon_pos, ammo_pos, ammos, categories) do
    category_name_map = categories |> Enum.map(&{&1.id, &1.full_name}) |> Map.new()
    weapon_category_id = EquipmentSlots.get_weapon(slots, weapon_pos).category_id

    ammos
    |> Enum.filter(&(&1.weapon_category_id == weapon_category_id))
    |> Enum.map(&create_select_content(slots, weapon_pos, ammo_pos, &1, category_name_map))
  end

  defp create_select_content(
         %EquipmentSlots{} = slots,
         weapon_pos,
         ammo_pos,
         %WeaponAmmo{} = ammo,
         category_name_map
       )
       when weapon_pos in 1..2 and
              ammo_pos in 1..2 do
    %SelectContent{
      item_id: ammo.id,
      enabled: EquipmentSlots.can_put_ammo?(slots, weapon_pos, ammo_pos, ammo),
      category_name: Map.get(category_name_map, ammo.weapon_category_id),
      text: "#{ammo.short_name} ($#{ammo.cost})",
      search_text: ammo.full_name,
      payload: %{"weapon_pos" => weapon_pos, "ammo_pos" => ammo_pos, "ammo_id" => ammo.id}
    }
  end
end
