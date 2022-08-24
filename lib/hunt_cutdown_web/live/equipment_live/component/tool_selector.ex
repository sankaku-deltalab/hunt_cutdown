defmodule HuntCutdownWeb.EquipmentLive.Components.ToolSelector do
  use HuntCutdownWeb, :live_component
  # import Phoenix.LiveView

  alias Phoenix.LiveView.Socket
  alias HuntCutdown.Equipment.{EquipmentSlots, Tool}
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
          tools: tools,
          categories: categories
        } = assigns
      ) do
    ~H"""
    <div>
      <.live_component
        module={Components.EquipmentSelector}
        id="selector"
        close_event="abort_select"
        select_event="put_tool"
        contents={create_select_contents(slots, pos, tools, categories)}
      />
    </div>
    """
  end

  defp create_select_contents(%EquipmentSlots{} = slots, pos, tools, categories) do
    category_name_map = categories |> Enum.map(&{&1.id, &1.full_name}) |> Map.new()

    tools
    |> Enum.map(&create_select_content(slots, pos, &1, category_name_map))
  end

  defp create_select_content(%EquipmentSlots{} = slots, pos, %Tool{} = tool, category_name_map)
       when pos in 1..4 do
    %SelectContent{
      item_id: tool.id,
      enabled: EquipmentSlots.can_put_tool?(slots, pos, tool),
      category_name: Map.get(category_name_map, tool.category_id),
      text: "#{tool.short_name} ($#{tool.cost})",
      search_text: tool.full_name,
      payload: %{"pos" => pos, "tool_id" => tool.id}
    }
  end
end
