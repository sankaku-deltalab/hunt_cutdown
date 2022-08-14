defmodule HuntCutdownWeb.EquipmentLive.Components.EquipmentSlots do
  use HuntCutdownWeb, :live_component

  alias Phoenix.LiveView.Socket
  alias HuntCutdown.Equipment.EquipmentSlots

  @impl true
  def mount(%Socket{} = socket) do
    {:ok, socket}
  end

  @impl true
  def render(%{state: %EquipmentSlots{} = _} = assigns) do
    ~H"""
    <div>
      <div>Cost: <%= EquipmentSlots.cost(@state) %></div>
      <div>
        <div>Weapons</div>
        <%= for i <- 1..2 do %>
          <div style="margin-left: 2vw">
            <div
              phx-click={"start_select_weapon"}
              phx-value-pos={i}
            >
              <%= EquipmentSlots.get_weapon(@state, i).full_name %>
            </div>
            <div style="margin-left: 2vw">
              <%= EquipmentSlots.get_ammo(@state, i, 1).full_name %>
              <%= EquipmentSlots.get_ammo(@state, i, 2).full_name %>
            </div>
          </div>
        <% end %>
      </div>

      <div>
        <div>Tools</div>
        <%= for i <- 1..4 do %>
          <div style="margin-left: 2vw"><%= EquipmentSlots.get_tool(@state, i).full_name %></div>
        <% end %>
      </div>

      <div>
        <div>Consumables</div>
        <%= for i <- 1..4 do %>
          <div style="margin-left: 2vw"><%= EquipmentSlots.get_consumable(@state, i).full_name %></div>
        <% end %>
      </div>

    </div>
    """
  end
end
