defmodule HuntCutdownWeb.EquipmentLive.Components.AllEquipmentSelector do
  use HuntCutdownWeb, :live_component
  # import Phoenix.LiveView

  alias Phoenix.LiveView.Socket

  @impl true
  def mount(%Socket{} = socket) do
    {:ok, socket}
  end

  @impl true
  def render(
        %{
          slots: slots,
          selecting: selecting,
          weapons: weapons,
          weapon_categories: weapon_categories,
          ammos: ammos,
          tools: tools,
          tool_categories: tool_categories,
          consumables: consumables,
          consumable_categories: consumable_categories
        } = assigns
      ) do
    ~H"""
    <div>
      <%= if @selecting.category == :weapon do %>
        <.live_component
          module={HuntCutdownWeb.EquipmentLive.Components.WeaponSelector}
          id="weapon_selector"
          slots={slots}
          pos={selecting.pos}
          weapons={weapons}
          categories={weapon_categories}
        />
      <% end %>

      <%= if @selecting.category == :ammo do %>
        <.live_component
          module={HuntCutdownWeb.EquipmentLive.Components.AmmoSelector}
          id="ammo_selector"
          slots={slots}
          weapon_pos={selecting.weapon_pos}
          ammo_pos={selecting.ammo_pos}
          ammos={ammos}
          categories={weapon_categories}
        />
      <% end %>

      <%= if @selecting.category == :tool do %>
        <.live_component
          module={HuntCutdownWeb.EquipmentLive.Components.ToolSelector}
          id="tool_selector"
          slots={slots}
          pos={selecting.pos}
          tools={tools}
          categories={tool_categories}
        />
      <% end %>

      <%= if @selecting.category == :consumable do %>
        <.live_component
          module={HuntCutdownWeb.EquipmentLive.Components.ConsumableSelector}
          id="tool_selector"
          slots={slots}
          pos={selecting.pos}
          consumables={consumables}
          categories={consumable_categories}
        />
      <% end %>
    </div>
    """
  end
end
