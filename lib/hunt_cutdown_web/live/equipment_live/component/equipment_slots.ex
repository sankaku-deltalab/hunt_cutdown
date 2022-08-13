defmodule HuntCutdownWeb.EquipmentLive.Components.EquipmentSlots do
  use HuntCutdownWeb, :live_component

  alias Phoenix.LiveView.Socket

  @type props :: %{ev_target: any, ev_name: String, text: String}
  @type state :: %{}

  @impl true
  def mount(%Socket{} = socket) do
    # socket = socket |> assign(:count, 0)

    {:ok, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div> Equipment slot </div>
    """
  end
end
