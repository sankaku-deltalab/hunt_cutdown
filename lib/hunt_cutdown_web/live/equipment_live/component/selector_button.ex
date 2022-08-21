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
          enabled: enabled
        } = assigns
      ) do
    ~H"""
    <button
      class={"btn btn-xs capitalize justify-start #{if not enabled do "btn-ghost" end} w-full"}
      disabled={not enabled}
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
