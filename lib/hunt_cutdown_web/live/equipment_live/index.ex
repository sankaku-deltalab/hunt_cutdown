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
      |> assign(:slots, %Equipment.EquipmentSlots{})
      |> assign(:selecting, @not_selecting)
      |> assign(:weapons, Equipment.list_weapons())
      |> assign(:weapon_categories, Equipment.list_weapon_categories())
      |> assign(:ammos, Equipment.list_weapon_ammos())
      |> assign(:tools, Equipment.list_tools())
      |> assign(:tool_categories, Equipment.list_tool_categories())
      |> assign(:consumables, Equipment.list_consumables())
      |> assign(:consumable_categories, Equipment.list_consumable_categories())

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
  def handle_event("start_select_weapon" = event, %{"pos" => pos} = params, %Socket{} = socket)
      when pos |> is_bitstring() do
    params = params |> Map.update!("pos", &String.to_integer(&1))

    handle_event(event, params, socket)
  end

  @impl true
  def handle_event("start_select_weapon", %{"pos" => pos}, %Socket{} = socket) when pos in 1..2 do
    socket = socket |> assign(:selecting, %{category: :weapon, pos: pos})
    {:noreply, socket}
  end

  @impl true
  def handle_event(
        "put_weapon" = event,
        %{"pos" => pos, "weapon" => weapon_id} = params,
        %Socket{} = socket
      )
      when pos |> is_bitstring() and weapon_id |> is_bitstring() do
    params =
      params
      |> Map.update!("pos", &String.to_integer(&1))
      |> Map.update!("weapon", &Equipment.get_weapon!(&1))

    handle_event(event, params, socket)
  end

  @impl true
  def handle_event(
        "put_weapon",
        %{"pos" => pos, "weapon" => %Equipment.Weapon{} = weapon},
        %Socket{} = socket
      )
      when pos in 1..2 do
    socket =
      socket
      |> update(:slots, &Equipment.EquipmentSlots.put_weapon(&1, pos, weapon))
      |> assign(:selecting, @not_selecting)

    {:noreply, socket}
  end

  @impl true
  def handle_event(
        "start_select_ammo" = event,
        %{"weapon_pos" => weapon_pos, "ammo_pos" => ammo_pos} = params,
        %Socket{} = socket
      )
      when weapon_pos |> is_bitstring() and ammo_pos |> is_bitstring() do
    params =
      params
      |> Map.update!("weapon_pos", &String.to_integer(&1))
      |> Map.update!("ammo_pos", &String.to_integer(&1))

    handle_event(event, params, socket)
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
        "put_ammo" = event,
        %{"weapon_pos" => weapon_pos, "ammo_pos" => ammo_pos, "ammo" => ammo_id} = params,
        %Socket{} = socket
      )
      when weapon_pos |> is_bitstring() and
             ammo_pos |> is_bitstring() and
             ammo_id |> is_bitstring() do
    params =
      params
      |> Map.update!("weapon_pos", &String.to_integer(&1))
      |> Map.update!("ammo_pos", &String.to_integer(&1))
      |> Map.update!("ammo", &Equipment.get_weapon_ammo!(&1))

    handle_event(event, params, socket)
  end

  @impl true
  def handle_event(
        "put_ammo",
        %{
          "weapon_pos" => weapon_pos,
          "ammo_pos" => ammo_pos,
          "ammo" => %Equipment.WeaponAmmo{} = ammo
        },
        %Socket{} = socket
      )
      when weapon_pos in 1..2 and ammo_pos in 1..2 do
    socket =
      socket
      |> update(:slots, &Equipment.EquipmentSlots.put_ammo(&1, weapon_pos, ammo_pos, ammo))
      |> assign(:selecting, @not_selecting)

    {:noreply, socket}
  end

  @impl true
  def handle_event("start_select_tool" = event, %{"pos" => pos} = params, %Socket{} = socket)
      when pos |> is_bitstring() do
    params = params |> Map.update!("pos", &String.to_integer(&1))
    handle_event(event, params, socket)
  end

  @impl true
  def handle_event("start_select_tool", %{"pos" => pos}, %Socket{} = socket) when pos in 1..4 do
    socket = socket |> assign(:selecting, %{category: :tool, pos: pos})
    {:noreply, socket}
  end

  @impl true
  def handle_event(
        "put_tool" = event,
        %{"pos" => pos, "tool" => tool_id} = params,
        %Socket{} = socket
      )
      when pos |> is_bitstring() and tool_id |> is_bitstring() do
    params =
      params
      |> Map.update!("pos", &String.to_integer(&1))
      |> Map.update!("tool", &Equipment.get_tool!(&1))

    handle_event(event, params, socket)
  end

  @impl true
  def handle_event(
        "put_tool",
        %{"pos" => pos, "tool" => %Equipment.Tool{} = tool},
        %Socket{} = socket
      )
      when pos in 1..4 do
    socket =
      socket
      |> update(:slots, &Equipment.EquipmentSlots.put_tool(&1, pos, tool))
      |> assign(:selecting, @not_selecting)

    {:noreply, socket}
  end

  @impl true
  def handle_event(
        "start_select_consumable" = event,
        %{"pos" => pos} = params,
        %Socket{} = socket
      )
      when pos |> is_bitstring() do
    params = params |> Map.update!("pos", &String.to_integer(&1))
    handle_event(event, params, socket)
  end

  @impl true
  def handle_event("start_select_consumable", %{"pos" => pos}, %Socket{} = socket)
      when pos in 1..4 do
    socket = socket |> assign(:selecting, %{category: :consumable, pos: pos})
    {:noreply, socket}
  end

  @impl true
  def handle_event(
        "put_consumable" = event,
        %{"pos" => pos, "consumable" => consumable_id} = params,
        %Socket{} = socket
      )
      when pos |> is_bitstring() and consumable_id |> is_bitstring() do
    params =
      params
      |> Map.update!("pos", &String.to_integer(&1))
      |> Map.update!("consumable", &Equipment.get_consumable!(&1))

    handle_event(event, params, socket)
  end

  @impl true
  def handle_event(
        "put_consumable",
        %{"pos" => pos, "consumable" => %Equipment.Consumable{} = consumable},
        %Socket{} = socket
      )
      when pos in 1..4 do
    socket =
      socket
      |> update(:slots, &Equipment.EquipmentSlots.put_consumable(&1, pos, consumable))
      |> assign(:selecting, @not_selecting)

    {:noreply, socket}
  end

  # @impl true
  # def handle_event(_event, _params, %Socket{} = socket) do
  #   {:noreply, socket}
  # end
end
