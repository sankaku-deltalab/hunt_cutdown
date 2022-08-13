defmodule HuntCutdownWeb.EquipmentLive.Components.WeaponSelector do
  use HuntCutdownWeb, :live_component

  alias Phoenix.LiveView.Socket

  @type props :: %{ev_target: any, ev_name: String, text: String}
  @type state :: %{}

  @impl true
  def mount(%Socket{} = socket) do
    {:ok, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div> Weapon selector </div>
    """
  end
end
