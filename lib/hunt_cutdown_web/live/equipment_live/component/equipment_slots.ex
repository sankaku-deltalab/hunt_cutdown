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

  def build_tweet_url(%EquipmentSlots{} = slots) do
    host = System.get_env("PHX_HOST")
    tweet_text = build_tweet_text(slots)
    query = URI.encode_query(%{"url" => host, "text" => tweet_text})

    %URI{
      authority: "twitter.com/intent/tweet",
      query: query
    }
    |> URI.to_string()
  end

  defp build_tweet_text(%EquipmentSlots{} = slots) do
    tools_text =
      1..4
      |> Enum.map(&EquipmentSlots.get_tool(slots, &1))
      |> Enum.map(&"[#{&1.full_name}]")
      |> Enum.join(" ")

    consumables_text =
      1..4
      |> Enum.map(&EquipmentSlots.get_consumable(slots, &1))
      |> Enum.map(&"[#{&1.full_name}]")
      |> Enum.join(" ")

    weapon_text = fn slots, pos ->
      weapon = EquipmentSlots.get_weapon(slots, pos)

      ammos_text =
        1..2
        |> Enum.map(&EquipmentSlots.get_ammo(slots, pos, &1))
        |> Enum.map(& &1.full_name)
        |> Enum.take(weapon.ammo_slot_count)
        |> Enum.join("/")

      if ammos_text == "" do
        "#{weapon.full_name}"
      else
        "#{weapon.full_name} (#{ammos_text})"
      end
    end

    host = System.get_env("PHX_HOST")

    """
    Equipments of Hunt: Showdown

    Cost: $#{EquipmentSlots.cost(slots)}
    Weapons:
      [#{weapon_text.(slots, 1)}]
      [#{weapon_text.(slots, 2)}]
    Tools: #{tools_text}
    Consumables: #{consumables_text}

    https://#{host}
    #huntshowdown #huntcutdown
    """
  end

  @impl true
  def render(%{state: %EquipmentSlots{} = _} = assigns) do
    ~H"""
    <div>
      <section class="text-3xl font-bold m-3">
        <h2>
          Total Cost: <u>$<%= EquipmentSlots.cost(@state) %></u>
          <a
            href={build_tweet_url(@state)}
            target="_blank"
            rel="noopener noreferrer"
            class="btn btn-xs bg-[#1da1f2]"
          >
            <svg
              xmlns="http://www.w3.org/2000/svg"
              width="16"
              height="16"
              fill="currentColor"
              class="bi bi-twitter"
              viewBox="0 0 16 16"
            >
              <path d="M5.026 15c6.038 0 9.341-5.003 9.341-9.334 0-.14 0-.282-.006-.422A6.685 6.685 0 0 0 16 3.542a6.658 6.658 0 0 1-1.889.518 3.301 3.301 0 0 0 1.447-1.817 6.533 6.533 0 0 1-2.087.793A3.286 3.286 0 0 0 7.875 6.03a9.325 9.325 0 0 1-6.767-3.429 3.289 3.289 0 0 0 1.018 4.382A3.323 3.323 0 0 1 .64 6.575v.045a3.288 3.288 0 0 0 2.632 3.218 3.203 3.203 0 0 1-.865.115 3.23 3.23 0 0 1-.614-.057 3.283 3.283 0 0 0 3.067 2.277A6.588 6.588 0 0 1 .78 13.58a6.32 6.32 0 0 1-.78-.045A9.344 9.344 0 0 0 5.026 15z" />
            </svg>
            Share
          </a>
        </h2>
      </section>
      <section>
        <h2 class="text-1xl m-1">Weapons</h2>
        <%= for w_pos <- 1..2 do %>
          <div class="ml-2">
            <button
              phx-click="start_select_weapon"
              phx-value-json_payload={Jason.encode!(%{"pos" => w_pos})}
              class="btn btn-sm capitalize justify-start w-full"
            >
              <.equipment_present eq={EquipmentSlots.get_weapon(@state, w_pos)} />
            </button>
            <div class="ml-2">
              <%= for am_pos <- 1..2 do %>
                <%= if EquipmentSlots.get_weapon(@state, w_pos).ammo_slot_count < am_pos do %>
                  <!-- <div>(no-ammo)</div> -->
                <% else %>
                  <button
                    phx-click="start_select_ammo"
                    phx-value-json_payload={
                      Jason.encode!(%{"weapon_pos" => w_pos, "ammo_pos" => am_pos})
                    }
                    class="btn btn-sm capitalize justify-start w-full"
                  >
                    <.equipment_present eq={EquipmentSlots.get_ammo(@state, w_pos, am_pos)} />
                  </button>
                <% end %>
              <% end %>
            </div>
          </div>
        <% end %>
      </section>

      <section>
        <h2 class="text-1xl m-1">Tools</h2>
        <%= for tool_pos <- 1..4 do %>
          <div class="ml-2">
            <button
              phx-click="start_select_tool"
              phx-value-json_payload={Jason.encode!(%{"pos" => tool_pos})}
              class="btn btn-sm capitalize justify-start w-full"
            >
              <.equipment_present eq={EquipmentSlots.get_tool(@state, tool_pos)} />
            </button>
          </div>
        <% end %>
      </section>

      <div>
        <h2 class="text-1xl m-1">Consumables</h2>
        <%= for consumable_pos <- 1..4 do %>
          <div class="ml-2">
            <button
              phx-click="start_select_consumable"
              phx-value-json_payload={Jason.encode!(%{"pos" => consumable_pos})}
              class="btn btn-sm capitalize justify-start w-full"
            >
              <.equipment_present eq={EquipmentSlots.get_consumable(@state, consumable_pos)} />
            </button>
          </div>
        <% end %>
      </div>
    </div>
    """
  end
end
