defmodule HuntCutdownWeb.EquipmentLive.Components.ConsumableSelector do
  use HuntCutdownWeb, :live_component
  # import Phoenix.LiveView

  alias Phoenix.LiveView.Socket
  alias HuntCutdown.Equipment
  alias HuntCutdownWeb.EquipmentLive.Components

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
      <label phx-click="abort_select" class="btn btn-sm btn-circle absolute right-2 top-2">
        ✕
      </label>
      <div class="sm:columns-1 md:columns-2 lg:columns-3 xl:columns-4">
        <%= for consumable_sets <- ConsumableSet.create_sets(slots, pos, consumables, categories) do %>
          <div class="card card-compact shadow-xl">
            <div class="card-title ml-2"><%= consumable_sets.category.short_name %></div>
            <div class="card-body">
              <%= for {equipable, c} <- consumable_sets.consumables do %>
                <div
                  phx-click={
                    if equipable do
                      "put_consumable"
                    end
                  }
                  phx-value-json_payload={Jason.encode!(%{"pos" => @pos, "consumable_id" => c.id})}
                >
                  <.live_component
                    module={Components.SelectorButton}
                    id={"selector_button-#{c.id}"}
                    enabled={equipable}
                  >
                    <%= "#{c.short_name} ($#{c.cost})" %>
                  </.live_component>
                </div>
              <% end %>
            </div>
          </div>
        <% end %>
      </div>
    </div>
    """
  end
end
