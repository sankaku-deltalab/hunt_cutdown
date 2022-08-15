defmodule HuntCutdownWeb.EquipmentLive.Components.ToolSelector do
  use HuntCutdownWeb, :live_component
  # import Phoenix.LiveView

  alias Phoenix.LiveView.Socket
  alias HuntCutdown.Equipment

  defmodule ToolSet do
    defstruct category: Equipment.ToolCategory.null_object(),
              tools: [{true, Equipment.Tool.null_object()}]

    def create_sets(%Equipment.EquipmentSlots{} = slots, pos, tools, categories) do
      categories
      |> Enum.sort_by(&{&1.full_name})
      |> Enum.map(&create_single_set(slots, pos, tools, &1))
    end

    defp create_single_set(%Equipment.EquipmentSlots{} = slots, pos, all_tools, category) do
      tools =
        all_tools
        |> Enum.filter(&(&1.category_id == category.id))
        |> Enum.sort_by(&{&1.full_name})
        |> Enum.map(fn t -> {Equipment.EquipmentSlots.can_put_tool?(slots, pos, t), t} end)

      %ToolSet{
        category: category,
        tools: tools
      }
    end
  end

  @impl true
  def mount(%Socket{} = socket) do
    {:ok, socket}
  end

  @impl true
  def render(
        %{
          slots: %Equipment.EquipmentSlots{} = slots,
          pos: pos,
          tools: tools,
          categories: categories
        } = assigns
      ) do
    ~H"""
    <div>
      <div> Equipment slot </div>
      <div
        phx-click={"abort_select"}
      >
        [Close]
      </div>
      <%= for tool_sets <- ToolSet.create_sets(slots, pos, tools, categories) do %>
        <div
          style="margin-left: 2vw"
        >
          <div><%= tool_sets.category.short_name %></div>
          <%= for {equipable, t} <- tool_sets.tools do %>
            <%= if not equipable do %>
              <div style="margin-left: 2vw"><s><%= "#{t.short_name} ($#{t.cost})" %></s></div>
            <% else %>
              <div
                style="margin-left: 2vw"
                phx-click={"put_tool"}
                phx-value-pos={@pos}
                phx-value-tool={t.id}
              >
                <%= "#{t.short_name} ($#{t.cost})" %>
              </div>
            <% end %>
          <% end %>
        </div>

      <% end %>
    </div>
    """
  end
end
