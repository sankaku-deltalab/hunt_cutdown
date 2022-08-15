defmodule HuntCutdownWeb.EquipmentLive.Components.EquipmentSlots do
  use HuntCutdownWeb, :live_component

  alias Phoenix.LiveView.Socket
  alias HuntCutdown.Equipment.EquipmentSlots

  @impl true
  def mount(%Socket{} = socket) do
    {:ok, socket}
  end

  def equipment_present(%{eq: eq} = assigns) do
    ~H"""
    <%= "#{eq.full_name} ($#{eq.cost})" %>
    """
  end

  @impl true
  def render(%{state: %EquipmentSlots{} = _} = assigns) do
    ~H"""
    <div>
      <div>Total Cost: $<%= EquipmentSlots.cost(@state) %></div>
      <div>
        <div>Weapons</div>
        <%= for w_pos <- 1..2 do %>
          <div style="margin-left: 2vw">
            <div
              phx-click={"start_select_weapon"}
              phx-value-pos={w_pos}
            >
              <.equipment_present eq={EquipmentSlots.get_weapon(@state, w_pos)} />
            </div>
            <div style="margin-left: 2vw">
              <%= for am_pos <- 1..2 do %>
                <div
                  phx-click={"start_select_ammo"}
                  phx-value-weapon_pos={w_pos}
                  phx-value-ammo_pos={am_pos}
                >
                  <.equipment_present eq={EquipmentSlots.get_ammo(@state, w_pos, am_pos)} />
                </div>
              <% end %>
            </div>
          </div>
        <% end %>
      </div>

      <div>
        <div>Tools</div>
        <%= for tool_pos <- 1..4 do %>
          <div
            style="margin-left: 2vw"
            phx-click={"start_select_tool"}
            phx-value-pos={tool_pos}
          >
            <.equipment_present eq={EquipmentSlots.get_tool(@state, tool_pos)} />
          </div>
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
