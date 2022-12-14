defmodule HuntCutdownWeb.EquipmentLive.Index do
  use HuntCutdownWeb, :live_view
  import Phoenix.LiveView

  alias Phoenix.LiveView.Socket
  alias HuntCutdown.Equipment

  @type selecting ::
          %{category: :weapon, pos: 1..2}
          | %{category: :ammo, weapon_pos: 1..2, ammo_pos: 1..2}
          | %{category: :tool, pos: 1..4}
          | %{category: :consumable, pos: 1..4}
          | %{category: :not_selecting}

  @not_selecting %{category: :not_selecting}

  @impl true
  def mount(_params, _session, %Socket{} = socket) do
    socket =
      socket
      |> assign(
        slots: %Equipment.EquipmentSlots{},
        selecting: @not_selecting,
        weapons: Equipment.list_weapons(),
        weapon_categories: Equipment.list_weapon_categories(),
        ammos: Equipment.list_weapon_ammos(),
        tools: Equipment.list_tools(),
        tool_categories: Equipment.list_tool_categories(),
        consumables: Equipment.list_consumables(),
        consumable_categories: Equipment.list_consumable_categories(),
        open_drawer: false,
        open_description: false
      )

    {:ok, socket}
  end

  @impl true
  def handle_params(_params, _url, %Socket{} = socket) do
    {:noreply, socket}
  end

  @impl true
  def handle_event("abort_select", _params, %Socket{} = socket) do
    socket = socket |> assign(:selecting, @not_selecting)
    {:noreply, socket}
  end

  @impl true
  def handle_event("start_select_weapon", %{"pos" => pos}, %Socket{} = socket) when pos in 1..2 do
    socket = socket |> assign(:selecting, %{category: :weapon, pos: pos})
    {:noreply, socket}
  end

  @impl true
  def handle_event(
        "put_weapon",
        %{"pos" => pos, "weapon_id" => weapon_id},
        %Socket{} = socket
      )
      when pos in 1..2 and weapon_id |> is_bitstring() do
    weapon = Equipment.get_weapon!(weapon_id)

    socket =
      socket
      |> update(:slots, &Equipment.EquipmentSlots.put_weapon(&1, pos, weapon))
      |> assign(:selecting, @not_selecting)

    {:noreply, socket}
  end

  @impl true
  def handle_event(
        "start_select_ammo",
        %{"weapon_pos" => weapon_pos, "ammo_pos" => ammo_pos},
        %Socket{} = socket
      )
      when weapon_pos in 1..2 and ammo_pos in 1..2 do
    socket =
      socket
      |> assign(:selecting, %{category: :ammo, weapon_pos: weapon_pos, ammo_pos: ammo_pos})

    {:noreply, socket}
  end

  @impl true
  def handle_event(
        "put_ammo",
        %{
          "weapon_pos" => weapon_pos,
          "ammo_pos" => ammo_pos,
          "ammo_id" => ammo_id
        },
        %Socket{} = socket
      )
      when weapon_pos in 1..2 and ammo_pos in 1..2 and ammo_id |> is_bitstring() do
    ammo = Equipment.get_weapon_ammo!(ammo_id)

    socket =
      socket
      |> update(:slots, &Equipment.EquipmentSlots.put_ammo(&1, weapon_pos, ammo_pos, ammo))
      |> assign(:selecting, @not_selecting)

    {:noreply, socket}
  end

  @impl true
  def handle_event("start_select_tool", %{"pos" => pos}, %Socket{} = socket) when pos in 1..4 do
    socket = socket |> assign(:selecting, %{category: :tool, pos: pos})
    {:noreply, socket}
  end

  @impl true
  def handle_event(
        "put_tool",
        %{"pos" => pos, "tool_id" => tool_id},
        %Socket{} = socket
      )
      when pos in 1..4 and tool_id |> is_bitstring() do
    tool = Equipment.get_tool!(tool_id)

    socket =
      socket
      |> update(:slots, &Equipment.EquipmentSlots.put_tool(&1, pos, tool))
      |> assign(:selecting, @not_selecting)

    {:noreply, socket}
  end

  @impl true
  def handle_event("start_select_consumable", %{"pos" => pos}, %Socket{} = socket)
      when pos in 1..4 do
    socket = socket |> assign(:selecting, %{category: :consumable, pos: pos})
    {:noreply, socket}
  end

  @impl true
  def handle_event(
        "put_consumable",
        %{"pos" => pos, "consumable_id" => consumable_id},
        %Socket{} = socket
      )
      when pos in 1..4 and consumable_id |> is_bitstring() do
    consumable = Equipment.get_consumable!(consumable_id)

    socket =
      socket
      |> update(:slots, &Equipment.EquipmentSlots.put_consumable(&1, pos, consumable))
      |> assign(:selecting, @not_selecting)

    {:noreply, socket}
  end

  @impl true
  def handle_event("open_drawer", _params, %Socket{} = socket) do
    socket =
      socket
      |> assign(open_drawer: true)

    {:noreply, socket}
  end

  @impl true
  def handle_event("open_description", _params, %Socket{} = socket) do
    socket =
      socket
      |> assign(open_description: true)

    {:noreply, socket}
  end

  @impl true
  def handle_event("close_description", _params, %Socket{} = socket) do
    socket =
      socket
      |> assign(open_description: false)

    {:noreply, socket}
  end

  @impl true
  def handle_event("close_drawer", _params, %Socket{} = socket) do
    socket =
      socket
      |> assign(open_drawer: false)

    {:noreply, socket}
  end

  @impl true
  def handle_event(event, %{"json_payload" => json_payload}, %Socket{} = socket)
      when json_payload |> is_bitstring() do
    params =
      json_payload
      |> Jason.decode!()
      |> Enum.reduce(%{}, fn {k, v}, para -> Map.put(para, k, v) end)

    handle_event(event, params, socket)
  end

  def drawer_width() do
    # witdh in tailwind css
    "60"
  end

  # @impl true
  # def handle_event(_event, _params, %Socket{} = socket) do
  #   {:noreply, socket}
  # end
end
