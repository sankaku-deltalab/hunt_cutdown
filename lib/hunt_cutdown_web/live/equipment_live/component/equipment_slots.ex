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
      <section class="text-3xl font-bold m-3">
        <h2>Total Cost: $<%= EquipmentSlots.cost(@state) %></h2>
      </section>
      <section>
        <h2 class="text-1xl m-1">Weapons</h2>
        <%= for w_pos <- 1..2 do %>
          <div class="ml-2">
            <div
              phx-click={"start_select_weapon"}
              phx-value-pos={w_pos}
              class="card card-bordered card-compact shadow-xl"
            >
              <div class="card-title"><.equipment_present eq={EquipmentSlots.get_weapon(@state, w_pos)} /></div>
            </div>
            <div class="ml-2">
              <%= for am_pos <- 1..2 do %>
                <%= if EquipmentSlots.get_weapon(@state, w_pos).ammo_slot_count < am_pos do %>
                  <!-- <div>(no-ammo)</div> -->
                <% else %>
                  <div
                    phx-click={"start_select_ammo"}
                    phx-value-weapon_pos={w_pos}
                    phx-value-ammo_pos={am_pos}
                    class={"card card-bordered card-compact shadow-xl"}
                  >
                    <div class="card-title"><.equipment_present eq={EquipmentSlots.get_ammo(@state, w_pos, am_pos)} /></div>
                  </div>
                <% end %>
              <% end %>
            </div>
          </div>
        <% end %>
      </section>

      <section>
        <h2 class="text-1xl m-1">Tools</h2>
        <%= for tool_pos <- 1..4 do %>
          <div
            style="margin-left: 2vw"
            phx-click={"start_select_tool"}
            phx-value-pos={tool_pos}
            class="card card-bordered card-compact shadow-xl"
          >
          <div class="card-title"><.equipment_present eq={EquipmentSlots.get_tool(@state, tool_pos)} /></div>
          </div>
        <% end %>
      </section>

      <div>
        <h2 class="text-1xl m-1">Consumables</h2>
        <%= for consumable_pos <- 1..4 do %>
          <div
            style="margin-left: 2vw"
            phx-click={"start_select_consumable"}
            phx-value-pos={consumable_pos}
            class="card card-bordered card-compact shadow-xl"
          >
            <div class="card-title"><.equipment_present eq={EquipmentSlots.get_consumable(@state, consumable_pos)} /></div>
          </div>
        <% end %>
      </div>

    </div>
    """
  end
end
