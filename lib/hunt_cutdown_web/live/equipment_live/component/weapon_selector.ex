defmodule HuntCutdownWeb.EquipmentLive.Components.WeaponSelector do
  use HuntCutdownWeb, :live_component
  import Phoenix.LiveView

  alias Phoenix.LiveView.Socket
  alias HuntCutdown.Equipment

  @impl true
  def mount(%Socket{} = socket) do
    {:ok, socket}
  end

  @impl true
  def render(%{pos: pos, weapons: weapons, categories: categories} = assigns) do
    ~H"""
    <div>
      <div> Equipment slot </div>
      <%= for w <- weapons do %>
        <div
          style="margin-left: 2vw"
          phx-click={"put_weapon"}
          phx-value-pos={@pos}
          phx-value-weapon={w.id}
        >
          <%= w.short_name %>
        </div>
      <% end %>
    </div>
    """
  end
end
