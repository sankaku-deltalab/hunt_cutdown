defmodule HuntCutdownWeb.EquipmentLive.Components.SelectorButton do
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
          event: event,
          json_payload: json_payload,
          enabled: enabled
        } = assigns
      )
      when event |> is_bitstring() and json_payload |> is_bitstring() and enabled |> is_boolean() do
    ~H"""
    <button
      class={"btn btn-xs capitalize justify-start #{if not enabled, do: "btn-ghost"} w-full"}
      disabled={not enabled}
      phx-click={if enabled, do: event}
      phx-value-json_payload={json_payload}
    >
      <%= if enabled do %>
        <%= render_slot(@inner_block) %>
      <% else %>
        <s><%= render_slot(@inner_block) %></s>
      <% end %>
    </button>
    """
  end
end
