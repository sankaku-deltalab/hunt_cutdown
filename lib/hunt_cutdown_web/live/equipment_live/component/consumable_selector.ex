defmodule HuntCutdownWeb.EquipmentLive.Components.ConsumableSelector do
  use HuntCutdownWeb, :live_component
  # import Phoenix.LiveView

  alias Phoenix.LiveView.Socket
  alias HuntCutdown.Equipment

  defmodule ConsumableSet do
    defstruct category: Equipment.ConsumableCategory.null_object(),
              consumables: [{true, Equipment.Consumable.null_object()}]

    def create_sets(%Equipment.EquipmentSlots{} = slots, pos, consumables, categories) do
      categories
      |> Enum.sort_by(&{&1.full_name})
      |> Enum.map(&create_single_set(slots, pos, consumables, &1))
    end

    defp create_single_set(%Equipment.EquipmentSlots{} = slots, pos, all_consumables, category) do
      consumables =
        all_consumables
        |> Enum.filter(&(&1.category_id == category.id))
        |> Enum.sort_by(&{&1.full_name})
        |> Enum.map(fn c -> {Equipment.EquipmentSlots.can_put_consumable?(slots, pos, c), c} end)

      %ConsumableSet{
        category: category,
        consumables: consumables
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
          consumables: consumables,
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
      <%= for consumable_sets <- ConsumableSet.create_sets(slots, pos, consumables, categories) do %>
        <div
          style="margin-left: 2vw"
        >
          <div><%= consumable_sets.category.short_name %></div>
          <%= for {equipable, c} <- consumable_sets.consumables do %>
            <%= if not equipable do %>
              <div style="margin-left: 2vw"><s><%= "#{c.short_name} ($#{c.cost})" %></s></div>
            <% else %>
              <div
                style="margin-left: 2vw"
                phx-click={"put_consumable"}
                phx-value-pos={@pos}
                phx-value-consumable={c.id}
              >
                <%= "#{c.short_name} ($#{c.cost})" %>
              </div>
            <% end %>
          <% end %>
        </div>

      <% end %>
    </div>
    """
  end
end
