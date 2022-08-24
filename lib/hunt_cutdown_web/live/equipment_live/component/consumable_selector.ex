defmodule HuntCutdownWeb.EquipmentLive.Components.ConsumableSelector do
  use HuntCutdownWeb, :live_component
  # import Phoenix.LiveView

  alias Phoenix.LiveView.Socket
  alias HuntCutdown.Equipment.{EquipmentSlots, Consumable}
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
          consumables: consumables,
          categories: categories
        } = assigns
      ) do
    ~H"""
    <div>
      <.live_component
        module={Components.EquipmentSelector}
        id="selector"
        close_event="abort_select"
        select_event="put_consumable"
        contents={create_select_contents(slots, pos, consumables, categories)}
      />
    </div>
    """
  end

  defp create_select_contents(%EquipmentSlots{} = slots, pos, consumables, categories) do
    category_name_map = categories |> Enum.map(&{&1.id, &1.full_name}) |> Map.new()

    consumables
    |> Enum.map(&create_select_content(slots, pos, &1, category_name_map))
  end

  defp create_select_content(
         %EquipmentSlots{} = slots,
         pos,
         %Consumable{} = consumable,
         category_name_map
       )
       when pos in 1..4 do
    %SelectContent{
      item_id: consumable.id,
      enabled: EquipmentSlots.can_put_consumable?(slots, pos, consumable),
      category_name: Map.get(category_name_map, consumable.category_id),
      text: "#{consumable.short_name} ($#{consumable.cost})",
      search_text: consumable.full_name,
      payload: %{"pos" => pos, "consumable_id" => consumable.id}
    }
  end
end
