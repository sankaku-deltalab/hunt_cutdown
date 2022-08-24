defmodule HuntCutdownWeb.EquipmentLive.Components.WeaponSelector do
  use HuntCutdownWeb, :live_component
  # import Phoenix.LiveView

  alias Phoenix.LiveView.Socket
  alias HuntCutdown.Equipment.{EquipmentSlots, Weapon}
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
          pos: pos,
          weapons: weapons,
          categories: categories
        } = assigns
      ) do
    ~H"""
    <div>
      <.live_component
        module={Components.EquipmentSelector}
        id="selector"
        close_event="abort_select"
        select_event="put_weapon"
        contents={create_select_contents(slots, pos, weapons, categories)}
      />
    </div>
    """
  end

  defp create_select_contents(%EquipmentSlots{} = slots, pos, weapons, categories) do
    category_name_map = categories |> Enum.map(&{&1.id, &1.full_name}) |> Map.new()

    weapons
    |> Enum.map(&create_select_content(slots, pos, &1, category_name_map))
  end

  defp create_select_content(
         %EquipmentSlots{} = slots,
         pos,
         %Weapon{} = weapon,
         category_name_map
       )
       when pos in 1..2 do
    %SelectContent{
      item_id: weapon.id,
      enabled: EquipmentSlots.can_put_weapon?(slots, pos, weapon),
      category_name: Map.get(category_name_map, weapon.category_id),
      text: "#{weapon.short_name} ($#{weapon.cost})",
      search_text: weapon.full_name,
      payload: %{"pos" => pos, "weapon_id" => weapon.id}
    }
  end
end
