defmodule HuntCutdownWeb.EquipmentLive.Components.DrawerFrame do
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
          open_drawer: _open_drawer,
          drawer_width: drawer_width
        } = assigns
      ) do
    ~H"""
    <div>
      <div
        phx-click="close_drawer"
        class={
          "absolute top-0 left-0 h-full w-full bg-black ease-linear duration-100 " <>
            if not @open_drawer do
              "opacity-0 pointer-events-none"
            else
              "opacity-50"
            end
        }
      />
      <div class={
        "absolute top-0 left-0 w-#{drawer_width} ease-out duration-100 " <>
          if not @open_drawer do
            "-translate-x-#{drawer_width}"
          else
            ""
          end
      }>
        <div class={"relative h-screen opacity-100  w-#{drawer_width} bg-base-100"}>
          <%= render_slot(@inner_block) %>
        </div>
      </div>
    </div>
    """
  end
end
