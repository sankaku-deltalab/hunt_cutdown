defmodule HuntCutdownWeb.EquipmentLive.Components.ToolSelector do
  use HuntCutdownWeb, :live_component
  # import Phoenix.LiveView

  alias Phoenix.LiveView.Socket
  alias HuntCutdown.Equipment
  alias HuntCutdownWeb.EquipmentLive.Components

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
      <label phx-click="abort_select" class="btn btn-sm btn-circle absolute right-2 top-2">
        ✕
      </label>
      <div class="sm:columns-1 md:columns-2 lg:columns-3 xl:columns-4">
        <%= for tool_sets <- ToolSet.create_sets(slots, pos, tools, categories) do %>
          <div class="card card-compact shadow-xl">
            <div class="card-title ml-2"><%= tool_sets.category.full_name %></div>
            <div class="card-body">
              <%= for {equipable, t} <- tool_sets.tools do %>
                <.live_component
                  module={Components.SelectorButton}
                  id={"selector_button-#{t.id}"}
                  event="put_tool"
                  json_payload={Jason.encode!(%{"pos" => @pos, "tool_id" => t.id})}
                  enabled={equipable}
                >
                  <%= "#{t.short_name} ($#{t.cost})" %>
                </.live_component>
              <% end %>
            </div>
          </div>
        <% end %>
      </div>
    </div>
    """
  end
end
